Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB2F6F0D2B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:31:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8Fu-0002wu-5H; Thu, 27 Apr 2023 16:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fr-0002uh-CA; Thu, 27 Apr 2023 16:30:15 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ps8Fn-0004yJ-RW; Thu, 27 Apr 2023 16:30:15 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id F0D116097A;
 Thu, 27 Apr 2023 23:30:02 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b438::1:2b])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id lTP2w70Oh0U0-gjSrzb16; Thu, 27 Apr 2023 23:30:01 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682627402; bh=j6yNuSPI5NMkS/5PQBJlqwaUbdg/5pumMSLIZnxGxAE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=d6j000X4elTPjJv/wYn4PkLy3zNTNvWa9sflp7Nym4exMQ5qTMiqyl3c1TMlCAk/J
 GHkgF30qGYA5OQG/mkTliITBYoMwZkEmtc/9VK/aoJrBxJg8IUBlA3Sch94hlaVWud
 L4OYRt1Pez7XwYqAyzzu3RMuNiRd6r+x1WLHt5BY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, michael.roth@amd.com, armbru@redhat.com,
 eblake@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 zhanghailiang@xfusion.com, philmd@linaro.org, thuth@redhat.com,
 berrange@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 dave@treblig.org, hreitz@redhat.com, kwolf@redhat.com,
 chen.zhang@intel.com, lizhijian@fujitsu.com, lukasstraub2@web.de,
 vsementsov@yandex-team.ru
Subject: [PATCH v3 3/4] build: move COLO under CONFIG_REPLICATION
Date: Thu, 27 Apr 2023 23:29:45 +0300
Message-Id: <20230427202946.1007276-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
References: <20230427202946.1007276-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We don't allow to use x-colo capability when replication is not
configured. So, no reason to build COLO when replication is disabled,
it's unusable in this case.

Note also that the check in migrate_caps_check() is not the only
restriction: some functions in migration/colo.c will just abort if
called with not defined CONFIG_REPLICATION, for example:

    migration_iteration_finish()
       case MIGRATION_STATUS_COLO:
           migrate_start_colo_process()
               colo_process_checkpoint()
                   abort()

It could probably make sense to have possibility to enable COLO without
REPLICATION, but this requires deeper audit of colo & replication code,
which may be done later if needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hmp-commands.hx                |  2 ++
 migration/colo.c               | 28 -------------------------
 migration/meson.build          |  6 ++++--
 migration/migration-hmp-cmds.c |  2 ++
 migration/options.c            | 17 ++++++++--------
 qapi/migration.json            | 12 +++++++----
 stubs/colo.c                   | 37 ++++++++++++++++++++++++++++++++++
 stubs/meson.build              |  1 +
 8 files changed, 62 insertions(+), 43 deletions(-)
 create mode 100644 stubs/colo.c

diff --git a/hmp-commands.hx b/hmp-commands.hx
index bb85ee1d26..fbd0932232 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1035,6 +1035,7 @@ SRST
   migration (or once already in postcopy).
 ERST
 
+#ifdef CONFIG_REPLICATION
     {
         .name       = "x_colo_lost_heartbeat",
         .args_type  = "",
@@ -1043,6 +1044,7 @@ ERST
                       "a failover or takeover is needed.",
         .cmd = hmp_x_colo_lost_heartbeat,
     },
+#endif
 
 SRST
 ``x_colo_lost_heartbeat``
diff --git a/migration/colo.c b/migration/colo.c
index 07bfa21fea..e4af47eeeb 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -26,9 +26,7 @@
 #include "qemu/rcu.h"
 #include "migration/failover.h"
 #include "migration/ram.h"
-#ifdef CONFIG_REPLICATION
 #include "block/replication.h"
-#endif
 #include "net/colo-compare.h"
 #include "net/colo.h"
 #include "block/block.h"
@@ -68,7 +66,6 @@ static bool colo_runstate_is_stopped(void)
 static void secondary_vm_do_failover(void)
 {
 /* COLO needs enable block-replication */
-#ifdef CONFIG_REPLICATION
     int old_state;
     MigrationIncomingState *mis = migration_incoming_get_current();
     Error *local_err = NULL;
@@ -133,14 +130,10 @@ static void secondary_vm_do_failover(void)
     if (mis->migration_incoming_co) {
         qemu_coroutine_enter(mis->migration_incoming_co);
     }
-#else
-    abort();
-#endif
 }
 
 static void primary_vm_do_failover(void)
 {
-#ifdef CONFIG_REPLICATION
     MigrationState *s = migrate_get_current();
     int old_state;
     Error *local_err = NULL;
@@ -181,9 +174,6 @@ static void primary_vm_do_failover(void)
 
     /* Notify COLO thread that failover work is finished */
     qemu_sem_post(&s->colo_exit_sem);
-#else
-    abort();
-#endif
 }
 
 COLOMode get_colo_mode(void)
@@ -217,7 +207,6 @@ void colo_do_failover(void)
     }
 }
 
-#ifdef CONFIG_REPLICATION
 void qmp_xen_set_replication(bool enable, bool primary,
                              bool has_failover, bool failover,
                              Error **errp)
@@ -271,7 +260,6 @@ void qmp_xen_colo_do_checkpoint(Error **errp)
     /* Notify all filters of all NIC to do checkpoint */
     colo_notify_filters_event(COLO_EVENT_CHECKPOINT, errp);
 }
-#endif
 
 COLOStatus *qmp_query_colo_status(Error **errp)
 {
@@ -435,15 +423,11 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
     }
     qemu_mutex_lock_iothread();
 
-#ifdef CONFIG_REPLICATION
     replication_do_checkpoint_all(&local_err);
     if (local_err) {
         qemu_mutex_unlock_iothread();
         goto out;
     }
-#else
-        abort();
-#endif
 
     colo_send_message(s->to_dst_file, COLO_MESSAGE_VMSTATE_SEND, &local_err);
     if (local_err) {
@@ -561,15 +545,11 @@ static void colo_process_checkpoint(MigrationState *s)
     object_unref(OBJECT(bioc));
 
     qemu_mutex_lock_iothread();
-#ifdef CONFIG_REPLICATION
     replication_start_all(REPLICATION_MODE_PRIMARY, &local_err);
     if (local_err) {
         qemu_mutex_unlock_iothread();
         goto out;
     }
-#else
-        abort();
-#endif
 
     vm_start();
     qemu_mutex_unlock_iothread();
@@ -748,7 +728,6 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
         return;
     }
 
-#ifdef CONFIG_REPLICATION
     replication_get_error_all(&local_err);
     if (local_err) {
         error_propagate(errp, local_err);
@@ -765,9 +744,6 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
         qemu_mutex_unlock_iothread();
         return;
     }
-#else
-    abort();
-#endif
     /* Notify all filters of all NIC to do checkpoint */
     colo_notify_filters_event(COLO_EVENT_CHECKPOINT, &local_err);
 
@@ -874,15 +850,11 @@ void *colo_process_incoming_thread(void *opaque)
     object_unref(OBJECT(bioc));
 
     qemu_mutex_lock_iothread();
-#ifdef CONFIG_REPLICATION
     replication_start_all(REPLICATION_MODE_SECONDARY, &local_err);
     if (local_err) {
         qemu_mutex_unlock_iothread();
         goto out;
     }
-#else
-        abort();
-#endif
     vm_start();
     qemu_mutex_unlock_iothread();
     trace_colo_vm_state_change("stop", "run");
diff --git a/migration/meson.build b/migration/meson.build
index 480ff6854a..9c6a8e65d3 100644
--- a/migration/meson.build
+++ b/migration/meson.build
@@ -13,8 +13,6 @@ softmmu_ss.add(files(
   'block-dirty-bitmap.c',
   'channel.c',
   'channel-block.c',
-  'colo-failover.c',
-  'colo.c',
   'exec.c',
   'fd.c',
   'global_state.c',
@@ -30,6 +28,10 @@ softmmu_ss.add(files(
   'threadinfo.c',
 ), gnutls)
 
+if get_option('replication').allowed()
+  softmmu_ss.add(files('colo-failover.c', 'colo.c'))
+endif
+
 softmmu_ss.add(when: rdma, if_true: files('rdma.c'))
 if get_option('live_block_migration').allowed()
   softmmu_ss.add(files('block.c'))
diff --git a/migration/migration-hmp-cmds.c b/migration/migration-hmp-cmds.c
index 4e9f00e7dc..9885d7c9f7 100644
--- a/migration/migration-hmp-cmds.c
+++ b/migration/migration-hmp-cmds.c
@@ -643,6 +643,7 @@ void hmp_migrate_start_postcopy(Monitor *mon, const QDict *qdict)
     hmp_handle_error(mon, err);
 }
 
+#ifdef CONFIG_REPLICATION
 void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
@@ -650,6 +651,7 @@ void hmp_x_colo_lost_heartbeat(Monitor *mon, const QDict *qdict)
     qmp_x_colo_lost_heartbeat(&err);
     hmp_handle_error(mon, err);
 }
+#endif
 
 typedef struct HMPMigrationStatus {
     QEMUTimer *timer;
diff --git a/migration/options.c b/migration/options.c
index 912cbadddb..eef2bd0f16 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -171,7 +171,9 @@ Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
     DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
                         MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
+#ifdef CONFIG_REPLICATION
     DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
+#endif
     DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
     DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
@@ -209,9 +211,13 @@ bool migrate_block(void)
 
 bool migrate_colo(void)
 {
+#ifdef CONFIG_REPLICATION
     MigrationState *s = migrate_get_current();
 
     return s->capabilities[MIGRATION_CAPABILITY_X_COLO];
+#else
+    return false;
+#endif
 }
 
 bool migrate_compress(void)
@@ -401,7 +407,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
     MIGRATION_CAPABILITY_RDMA_PIN_ALL,
     MIGRATION_CAPABILITY_COMPRESS,
     MIGRATION_CAPABILITY_XBZRLE,
+#ifdef CONFIG_REPLICATION
     MIGRATION_CAPABILITY_X_COLO,
+#endif
     MIGRATION_CAPABILITY_VALIDATE_UUID,
     MIGRATION_CAPABILITY_ZERO_COPY_SEND);
 
@@ -428,15 +436,6 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
     }
 #endif
 
-#ifndef CONFIG_REPLICATION
-    if (new_caps[MIGRATION_CAPABILITY_X_COLO]) {
-        error_setg(errp, "QEMU compiled without replication module"
-                   " can't enable COLO");
-        error_append_hint(errp, "Please enable replication before COLO.\n");
-        return false;
-    }
-#endif
-
     if (new_caps[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
diff --git a/qapi/migration.json b/qapi/migration.json
index 2c35b7b9cf..5cb095f7b3 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -486,7 +486,8 @@
 { 'enum': 'MigrationCapability',
   'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
            'compress', 'events', 'postcopy-ram',
-           { 'name': 'x-colo', 'features': [ 'unstable' ] },
+           { 'name': 'x-colo', 'features': [ 'unstable' ],
+             'if': 'CONFIG_REPLICATION' },
            'release-ram',
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
@@ -1381,7 +1382,8 @@
 #
 ##
 { 'command': 'x-colo-lost-heartbeat',
-  'features': [ 'unstable' ] }
+  'features': [ 'unstable' ],
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @migrate_cancel:
@@ -1657,7 +1659,8 @@
 ##
 { 'struct': 'COLOStatus',
   'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
-            'reason': 'COLOExitReason' } }
+            'reason': 'COLOExitReason' },
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @query-colo-status:
@@ -1674,7 +1677,8 @@
 # Since: 3.1
 ##
 { 'command': 'query-colo-status',
-  'returns': 'COLOStatus' }
+  'returns': 'COLOStatus',
+  'if': 'CONFIG_REPLICATION' }
 
 ##
 # @migrate-recover:
diff --git a/stubs/colo.c b/stubs/colo.c
new file mode 100644
index 0000000000..f306ab45d6
--- /dev/null
+++ b/stubs/colo.c
@@ -0,0 +1,37 @@
+#include "qemu/osdep.h"
+#include "qemu/notify.h"
+#include "net/colo-compare.h"
+#include "migration/colo.h"
+#include "migration/migration.h"
+#include "qapi/error.h"
+#include "qapi/qapi-commands-migration.h"
+
+void colo_shutdown(void)
+{
+    abort();
+}
+
+void *colo_process_incoming_thread(void *opaque)
+{
+    abort();
+}
+
+void colo_checkpoint_notify(void *opaque)
+{
+    abort();
+}
+
+void migrate_start_colo_process(MigrationState *s)
+{
+    abort();
+}
+
+bool migration_in_colo_state(void)
+{
+    return false;
+}
+
+bool migration_incoming_in_colo_state(void)
+{
+    return false;
+}
diff --git a/stubs/meson.build b/stubs/meson.build
index b2b5956d97..8412cad15f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -45,6 +45,7 @@ stub_ss.add(files('target-get-monitor-def.c'))
 stub_ss.add(files('target-monitor-defs.c'))
 stub_ss.add(files('trace-control.c'))
 stub_ss.add(files('uuid.c'))
+stub_ss.add(files('colo.c'))
 stub_ss.add(files('vmstate.c'))
 stub_ss.add(files('vm-stop.c'))
 stub_ss.add(files('win32-kbd-hook.c'))
-- 
2.34.1


