Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C126133D9F4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:58:57 +0100 (CET)
Received: from localhost ([::1]:46392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMD20-0002fy-PV
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCpu-0000Ri-C5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:46:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCpp-00052N-TU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiOjVNEdv1JLhfHYLKtizZtoIFUP/TCB/ZDL90mCn28=;
 b=eJnruWfIk0QZgfelTpo4vXdEskBTl0kye/LEAnheAFKTnGcUgU0gW+gq0U1udgEe4/+sbR
 NapwOHtmW20WKn5HwiSkImUe5cUxQxKkWr3Z7no3ZbbEke/Mq4X2aDB5LQS8dxzVN4Gx/6
 xGgqaDLLii+lRLdFGu17vxhijrcOGHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-QLaNOaTnM5m9ZGpmr0fcxg-1; Tue, 16 Mar 2021 12:46:19 -0400
X-MC-Unique: QLaNOaTnM5m9ZGpmr0fcxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5740A1846098;
 Tue, 16 Mar 2021 16:46:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49DE65C1A1;
 Tue, 16 Mar 2021 16:45:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] migrate: remove QMP/HMP commands for speed,
 downtime and cache size
Date: Tue, 16 Mar 2021 16:43:46 +0000
Message-Id: <20210316164355.150519-5-berrange@redhat.com>
In-Reply-To: <20210316164355.150519-1-berrange@redhat.com>
References: <20210316164355.150519-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The generic 'migrate_set_parameters' command handle all types of param.

Only the QMP commands were documented in the deprecations page, but the
rationale for deprecating applies equally to HMP, and the replacements
exist. Furthermore the HMP commands are just shims to the QMP commands,
so removing the latter breaks the former unless they get re-implemented.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/devel/migration.rst            |  2 +-
 docs/rdma.txt                       |  2 +-
 docs/system/deprecated.rst          | 10 ---
 docs/system/removed-features.rst    | 20 ++++++
 docs/xbzrle.txt                     |  5 --
 hmp-commands-info.hx                | 13 ----
 hmp-commands.hx                     | 45 -------------
 include/monitor/hmp.h               |  4 --
 migration/migration.c               | 45 -------------
 migration/ram.c                     |  2 +-
 monitor/hmp-cmds.c                  | 34 ----------
 qapi/migration.json                 | 98 -----------------------------
 tests/migration/guestperf/engine.py | 16 ++---
 tests/qemu-iotests/181              |  2 +-
 tests/qtest/migration-test.c        | 48 --------------
 tests/qtest/test-hmp.c              |  6 +-
 tests/qtest/vhost-user-test.c       |  8 +--
 17 files changed, 40 insertions(+), 320 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index ad381b89b2..19c3d4f3ea 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -641,7 +641,7 @@ time per vCPU.
 
 .. note::
   During the postcopy phase, the bandwidth limits set using
-  ``migrate_set_speed`` is ignored (to avoid delaying requested pages that
+  ``migrate_set_parameter`` is ignored (to avoid delaying requested pages that
   the destination is waiting for).
 
 Postcopy device transfer
diff --git a/docs/rdma.txt b/docs/rdma.txt
index 49dc9f8bca..2b4cdea1d8 100644
--- a/docs/rdma.txt
+++ b/docs/rdma.txt
@@ -89,7 +89,7 @@ RUNNING:
 First, set the migration speed to match your hardware's capabilities:
 
 QEMU Monitor Command:
-$ migrate_set_speed 40g # or whatever is the MAX of your RDMA device
+$ migrate_set_parameter max_bandwidth 40g # or whatever is the MAX of your RDMA device
 
 Next, on the destination machine, add the following to the QEMU command line:
 
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9fb347724c..e68f80d0c8 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -184,11 +184,6 @@ Use argument ``id`` instead.
 
 Use argument ``id`` instead.
 
-``migrate_set_downtime`` and ``migrate_set_speed`` (since 2.8.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``migrate-set-parameters`` instead.
-
 ``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -204,11 +199,6 @@ Always false.
 
 Use argument value ``null`` instead.
 
-``migrate-set-cache-size`` and ``query-migrate-cache-size`` (since 2.11.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Use ``migrate-set-parameters`` and ``query-migrate-parameters`` instead.
-
 ``block-commit`` arguments ``base`` and ``top`` (since 3.1.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 408cc340d2..6e653bfc4e 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -76,6 +76,16 @@ Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
 The ``query-events`` command has been superseded by the more powerful
 and accurate ``query-qmp-schema`` command.
 
+``migrate_set_cache_size`` and ``query-migrate-cache-size`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``migrate_set_parameter`` and ``info migrate_parameters`` instead.
+
+``migrate_set_downtime`` and ``migrate_set_speed`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``migrate_set_parameter`` instead.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
@@ -104,6 +114,16 @@ The ``acl_show``, ``acl_reset``, ``acl_policy``, ``acl_add``, and
 ``acl_remove`` commands were removed with no replacement. Authorization
 for VNC should be performed using the pluggable QAuthZ objects.
 
+``migrate-set-cache-size`` and ``info migrate-cache-size`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``migrate-set-parameters`` and ``info migrate-parameters`` instead.
+
+``migrate_set_downtime`` and ``migrate_set_speed`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``migrate-set-parameters`` instead.
+
 Guest Emulator ISAs
 -------------------
 
diff --git a/docs/xbzrle.txt b/docs/xbzrle.txt
index 6bd1828f34..bcb3f0c901 100644
--- a/docs/xbzrle.txt
+++ b/docs/xbzrle.txt
@@ -90,11 +90,6 @@ Usage
 
 3. Set the XBZRLE cache size - the cache size is in MBytes and should be a
 power of 2. The cache default value is 64MBytes. (on source only)
-    {qemu} migrate_set_cache_size 256m
-
-Commit 73af8dd8d7 "migration: Make xbzrle_cache_size a migration parameter"
-(v2.11.0) deprecated migrate-set-cache-size, therefore, the new parameter
-is recommended.
     {qemu} migrate_set_parameter xbzrle-cache-size 256m
 
 4. Start outgoing migration
diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index 117ba25f91..ab0c7aa5ee 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -567,19 +567,6 @@ SRST
     Show current migration parameters.
 ERST
 
-    {
-        .name       = "migrate_cache_size",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show current migration xbzrle cache size",
-        .cmd        = hmp_info_migrate_cache_size,
-    },
-
-SRST
-  ``info migrate_cache_size``
-    Show current migration xbzrle cache size.
-ERST
-
     {
         .name       = "balloon",
         .args_type  = "",
diff --git a/hmp-commands.hx b/hmp-commands.hx
index b500b8526d..2bbe133bb6 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -979,51 +979,6 @@ SRST
   Pause an ongoing migration.  Currently it only supports postcopy.
 ERST
 
-    {
-        .name       = "migrate_set_cache_size",
-        .args_type  = "value:o",
-        .params     = "value",
-        .help       = "set cache size (in bytes) for XBZRLE migrations,"
-                      "the cache size will be rounded down to the nearest "
-                      "power of 2.\n"
-                      "The cache size affects the number of cache misses."
-                      "In case of a high cache miss ratio you need to increase"
-                      " the cache size",
-        .cmd        = hmp_migrate_set_cache_size,
-    },
-
-SRST
-``migrate_set_cache_size`` *value*
-  Set cache size to *value* (in bytes) for xbzrle migrations.
-ERST
-
-    {
-        .name       = "migrate_set_speed",
-        .args_type  = "value:o",
-        .params     = "value",
-        .help       = "set maximum speed (in bytes) for migrations. "
-	"Defaults to MB if no size suffix is specified, ie. B/K/M/G/T",
-        .cmd        = hmp_migrate_set_speed,
-    },
-
-SRST
-``migrate_set_speed`` *value*
-  Set maximum speed to *value* (in bytes) for migrations.
-ERST
-
-    {
-        .name       = "migrate_set_downtime",
-        .args_type  = "value:T",
-        .params     = "value",
-        .help       = "set maximum tolerated downtime (in seconds) for migrations",
-        .cmd        = hmp_migrate_set_downtime,
-    },
-
-SRST
-``migrate_set_downtime`` *second*
-  Set maximum tolerated downtime (in seconds) for migration.
-ERST
-
     {
         .name       = "migrate_set_capability",
         .args_type  = "capability:s,state:b",
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index ed2913fd18..605d57287a 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -28,7 +28,6 @@ void hmp_info_mice(Monitor *mon, const QDict *qdict);
 void hmp_info_migrate(Monitor *mon, const QDict *qdict);
 void hmp_info_migrate_capabilities(Monitor *mon, const QDict *qdict);
 void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict);
-void hmp_info_migrate_cache_size(Monitor *mon, const QDict *qdict);
 void hmp_info_cpus(Monitor *mon, const QDict *qdict);
 void hmp_info_vnc(Monitor *mon, const QDict *qdict);
 void hmp_info_spice(Monitor *mon, const QDict *qdict);
@@ -64,11 +63,8 @@ void hmp_migrate_continue(Monitor *mon, const QDict *qdict);
 void hmp_migrate_incoming(Monitor *mon, const QDict *qdict);
 void hmp_migrate_recover(Monitor *mon, const QDict *qdict);
 void hmp_migrate_pause(Monitor *mon, const QDict *qdict);
-void hmp_migrate_set_downtime(Monitor *mon, const QDict *qdict);
-void hmp_migrate_set_speed(Monitor *mon, const QDict *qdict);
 void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict);
 void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict);
-void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict);
 void hmp_client_migrate_info(Monitor *mon, const QDict *qdict);
 void hmp_migrate_start_postcopy(Monitor *mon, const QDict *qdict);
 void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict);
diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559..5408367eda 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2318,51 +2318,6 @@ void qmp_migrate_continue(MigrationStatus state, Error **errp)
     qemu_sem_post(&s->pause_sem);
 }
 
-void qmp_migrate_set_cache_size(int64_t value, Error **errp)
-{
-    MigrateSetParameters p = {
-        .has_xbzrle_cache_size = true,
-        .xbzrle_cache_size = value,
-    };
-
-    qmp_migrate_set_parameters(&p, errp);
-}
-
-uint64_t qmp_query_migrate_cache_size(Error **errp)
-{
-    return migrate_xbzrle_cache_size();
-}
-
-void qmp_migrate_set_speed(int64_t value, Error **errp)
-{
-    MigrateSetParameters p = {
-        .has_max_bandwidth = true,
-        .max_bandwidth = value,
-    };
-
-    qmp_migrate_set_parameters(&p, errp);
-}
-
-void qmp_migrate_set_downtime(double value, Error **errp)
-{
-    if (value < 0 || value > MAX_MIGRATE_DOWNTIME_SECONDS) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
-                   "downtime_limit",
-                   "an integer in the range of 0 to "
-                    stringify(MAX_MIGRATE_DOWNTIME_SECONDS)" seconds");
-        return;
-    }
-
-    value *= 1000; /* Convert to milliseconds */
-
-    MigrateSetParameters p = {
-        .has_downtime_limit = true,
-        .downtime_limit = (int64_t)value,
-    };
-
-    qmp_migrate_set_parameters(&p, errp);
-}
-
 bool migrate_release_ram(void)
 {
     MigrationState *s;
diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..a569b87875 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -121,7 +121,7 @@ static void XBZRLE_cache_unlock(void)
 /**
  * xbzrle_cache_resize: resize the xbzrle cache
  *
- * This function is called from qmp_migrate_set_cache_size in main
+ * This function is called from migrate_params_apply in main
  * thread, possibly while a migration is in progress.  A running
  * migration may be using the cache and might finish during this call,
  * hence changes to the cache are protected by XBZRLE.lock().
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 3c88a4faef..8a47ba8fbb 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -518,12 +518,6 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
     qapi_free_MigrationParameters(params);
 }
 
-void hmp_info_migrate_cache_size(Monitor *mon, const QDict *qdict)
-{
-    monitor_printf(mon, "xbzrel cache size: %" PRId64 " kbytes\n",
-                   qmp_query_migrate_cache_size(NULL) >> 10);
-}
-
 
 #ifdef CONFIG_VNC
 /* Helper for hmp_info_vnc_clients, _servers */
@@ -1226,34 +1220,6 @@ void hmp_migrate_pause(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
-/* Kept for backwards compatibility */
-void hmp_migrate_set_downtime(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    double value = qdict_get_double(qdict, "value");
-    qmp_migrate_set_downtime(value, &err);
-    hmp_handle_error(mon, err);
-}
-
-void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
-{
-    int64_t value = qdict_get_int(qdict, "value");
-    Error *err = NULL;
-
-    qmp_migrate_set_cache_size(value, &err);
-    hmp_handle_error(mon, err);
-}
-
-/* Kept for backwards compatibility */
-void hmp_migrate_set_speed(Monitor *mon, const QDict *qdict)
-{
-    Error *err = NULL;
-
-    int64_t value = qdict_get_int(qdict, "value");
-    qmp_migrate_set_speed(value, &err);
-    hmp_handle_error(mon, err);
-}
 
 void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
 {
diff --git a/qapi/migration.json b/qapi/migration.json
index 6e5943fbb4..9bf0bc4d25 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1398,104 +1398,6 @@
 ##
 { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
 
-##
-# @migrate_set_downtime:
-#
-# Set maximum tolerated downtime for migration.
-#
-# @value: maximum downtime in seconds
-#
-# Features:
-# @deprecated: This command is deprecated.  Use
-#              'migrate-set-parameters' instead.
-#
-# Returns: nothing on success
-#
-# Since: 0.14
-#
-# Example:
-#
-# -> { "execute": "migrate_set_downtime", "arguments": { "value": 0.1 } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'migrate_set_downtime', 'data': {'value': 'number'},
-  'features': [ 'deprecated' ] }
-
-##
-# @migrate_set_speed:
-#
-# Set maximum speed for migration.
-#
-# @value: maximum speed in bytes per second.
-#
-# Features:
-# @deprecated: This command is deprecated.  Use
-#              'migrate-set-parameters' instead.
-#
-# Returns: nothing on success
-#
-# Since: 0.14
-#
-# Example:
-#
-# -> { "execute": "migrate_set_speed", "arguments": { "value": 1024 } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'migrate_set_speed', 'data': {'value': 'int'},
-  'features': [ 'deprecated' ] }
-
-##
-# @migrate-set-cache-size:
-#
-# Set cache size to be used by XBZRLE migration
-#
-# @value: cache size in bytes
-#
-# Features:
-# @deprecated: This command is deprecated.  Use
-#              'migrate-set-parameters' instead.
-#
-# The size will be rounded down to the nearest power of 2.
-# The cache size can be modified before and during ongoing migration
-#
-# Returns: nothing on success
-#
-# Since: 1.2
-#
-# Example:
-#
-# -> { "execute": "migrate-set-cache-size",
-#      "arguments": { "value": 536870912 } }
-# <- { "return": {} }
-#
-##
-{ 'command': 'migrate-set-cache-size', 'data': {'value': 'int'},
-  'features': [ 'deprecated' ] }
-
-##
-# @query-migrate-cache-size:
-#
-# Query migration XBZRLE cache size
-#
-# Features:
-# @deprecated: This command is deprecated.  Use
-#              'query-migrate-parameters' instead.
-#
-# Returns: XBZRLE cache size in bytes
-#
-# Since: 1.2
-#
-# Example:
-#
-# -> { "execute": "query-migrate-cache-size" }
-# <- { "return": 67108864 }
-#
-##
-{ 'command': 'query-migrate-cache-size', 'returns': 'size',
-  'features': [ 'deprecated' ] }
-
 ##
 # @migrate:
 #
diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 83bfc3b6bb..5161e4ff81 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -149,11 +149,11 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                      "state": True }
                                ])
 
-        resp = src.command("migrate_set_speed",
-                           value=scenario._bandwidth * 1024 * 1024)
+        resp = src.command("migrate-set-parameters",
+                           max_bandwidth=scenario._bandwidth * 1024 * 1024)
 
-        resp = src.command("migrate_set_downtime",
-                           value=scenario._downtime / 1024.0)
+        resp = src.command("migrate-set-parameters",
+                           downtime_limit=scenario._downtime / 1024.0)
 
         if scenario._compression_mt:
             resp = src.command("migrate-set-capabilities",
@@ -182,9 +182,11 @@ def _migrate(self, hardware, scenario, src, dst, connect_uri):
                                    { "capability": "xbzrle",
                                      "state": True }
                                ])
-            resp = src.command("migrate-set-cache-size",
-                               value=(hardware._mem * 1024 * 1024 * 1024 / 100 *
-                                      scenario._compression_xbzrle_cache))
+            resp = src.command("migrate-set-parameters",
+                               xbzrle_cache_size=(
+                                   hardware._mem *
+                                   1024 * 1024 * 1024 / 100 *
+                                   scenario._compression_xbzrle_cache))
 
         resp = src.command("migrate", uri=connect_uri)
 
diff --git a/tests/qemu-iotests/181 b/tests/qemu-iotests/181
index 820c53ef35..cb96d09ae5 100755
--- a/tests/qemu-iotests/181
+++ b/tests/qemu-iotests/181
@@ -109,7 +109,7 @@ if [ ${QEMU_STATUS[$dest]} -lt 0 ]; then
     _notrun 'Postcopy is not supported'
 fi
 
-_send_qemu_cmd $src 'migrate_set_speed 4k' "(qemu)"
+_send_qemu_cmd $src 'migrate_set_parameter max_bandwidth 4k' "(qemu)"
 _send_qemu_cmd $src 'migrate_set_capability postcopy-ram on' "(qemu)"
 _send_qemu_cmd $src "migrate -d unix:${MIG_SOCKET}" "(qemu)"
 _send_qemu_cmd $src 'migrate_start_postcopy' "(qemu)"
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f2142fbd3c..3a711bb492 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -658,53 +658,6 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
     cleanup("dest_serial");
 }
 
-static void deprecated_set_downtime(QTestState *who, const double value)
-{
-    QDict *rsp;
-
-    rsp = qtest_qmp(who,
-                    "{ 'execute': 'migrate_set_downtime',"
-                    " 'arguments': { 'value': %f } }", value);
-    g_assert(qdict_haskey(rsp, "return"));
-    qobject_unref(rsp);
-    migrate_check_parameter_int(who, "downtime-limit", value * 1000);
-}
-
-static void deprecated_set_speed(QTestState *who, long long value)
-{
-    QDict *rsp;
-
-    rsp = qtest_qmp(who, "{ 'execute': 'migrate_set_speed',"
-                          "'arguments': { 'value': %lld } }", value);
-    g_assert(qdict_haskey(rsp, "return"));
-    qobject_unref(rsp);
-    migrate_check_parameter_int(who, "max-bandwidth", value);
-}
-
-static void deprecated_set_cache_size(QTestState *who, long long value)
-{
-    QDict *rsp;
-
-    rsp = qtest_qmp(who, "{ 'execute': 'migrate-set-cache-size',"
-                         "'arguments': { 'value': %lld } }", value);
-    g_assert(qdict_haskey(rsp, "return"));
-    qobject_unref(rsp);
-    migrate_check_parameter_int(who, "xbzrle-cache-size", value);
-}
-
-static void test_deprecated(void)
-{
-    QTestState *from;
-
-    from = qtest_init("-machine none");
-
-    deprecated_set_downtime(from, 0.12345);
-    deprecated_set_speed(from, 12345);
-    deprecated_set_cache_size(from, 4096);
-
-    qtest_quit(from);
-}
-
 static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     QTestState **to_ptr,
                                     MigrateStart *args)
@@ -1486,7 +1439,6 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
-    qtest_add_func("/migration/deprecated", test_deprecated);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index 94a8023173..413eb95d2a 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -45,9 +45,9 @@ static const char *hmp_cmds[] = {
     "log all",
     "log none",
     "memsave 0 4096 \"/dev/null\"",
-    "migrate_set_cache_size 1",
-    "migrate_set_downtime 1",
-    "migrate_set_speed 1",
+    "migrate_set_parameter xbzrle_cache_size 1",
+    "migrate_set_parameter downtime_limit 1",
+    "migrate_set_parameter max_bandwidth 1",
     "netdev_add user,id=net1",
     "set_link net1 off",
     "set_link net1 on",
diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 1a5f5313ff..3d6337fb5c 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -756,8 +756,8 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
 
     /* slow down migration to have time to fiddle with log */
     /* TODO: qtest could learn to break on some places */
-    rsp = qmp("{ 'execute': 'migrate_set_speed',"
-              "'arguments': { 'value': 10 } }");
+    rsp = qmp("{ 'execute': 'migrate-set-parameters',"
+              "'arguments': { 'max-bandwidth': 10 } }");
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
 
@@ -776,8 +776,8 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
     munmap(log, size);
 
     /* speed things up */
-    rsp = qmp("{ 'execute': 'migrate_set_speed',"
-              "'arguments': { 'value': 0 } }");
+    rsp = qmp("{ 'execute': 'migrate-set-parameters',"
+              "'arguments': { 'max-bandwidth': 0 } }");
     g_assert(qdict_haskey(rsp, "return"));
     qobject_unref(rsp);
 
-- 
2.30.2


