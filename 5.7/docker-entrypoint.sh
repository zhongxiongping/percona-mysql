#!/bin/bash
# do something before mysql start
[ $DEBUG ] && set -x
# create server_id
server_id=test
MYSQLC_MYSQLD_SERVER_ID=`expr $server_id + ${STEP_NUM:-0}`
export MYSQLC_MYSQLD_SERVER_ID

## read env and create mysql config file
/usr/local/bin/env2file create --format mysql --path /etc/mysql/conf.d/custom.cnf
# start mysql
exec /usr/local/bin/docker-entrypoint.sh "$@"
