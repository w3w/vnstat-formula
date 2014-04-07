{% if salt['pillar.get']('vnstat:enabled', False) %}
vnstat:
  pkg.installed:
  - name: vnstat

{% for interface in  salt['pillar.get']('vnstat.interfaces', []) %}
vnstat-cron-{{ interface }}:
  cron.present:
  - name: 'vnstat -u -i {{ interface }}'
  - minute: '*/5'
{% endfor %}

{% endif %}
