Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A858130F961
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:19:00 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iHT-0005Vc-ML
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:18:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hiT-00048r-44
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:42:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hiL-0005yx-A3
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f85xKQSJGt5c9GZGiWdx3e3lNThhCA7kdQQjDhJ/1Bg=;
 b=bt5RidToy395kTvA9UmA26On1oFjQrMQhtXk74JWFVVcEeUA8D4M6HVWGX2Dks+CLjBtKB
 sBGv5Z1DCySxMDziBbhZXwgPjGmAwDbwMfZJbfrhhNKfXqq58nV0n5vlLBlnfdIslwamso
 iDSYgk9/iVcA7kDjRmpwH5tECqYChpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-8CLFm5Q0NFiUI_nJ9dSR2A-1; Thu, 04 Feb 2021 11:42:38 -0500
X-MC-Unique: 8CLFm5Q0NFiUI_nJ9dSR2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A5CE81EE61;
 Thu,  4 Feb 2021 16:42:37 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEB5F1A4D0;
 Thu,  4 Feb 2021 16:42:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 23/27] migration: wire up support for snapshot device selection
Date: Thu,  4 Feb 2021 16:39:55 +0000
Message-Id: <20210204163959.377618-24-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Modify load_snapshot/save_snapshot to accept the device list and vmstate
node name parameters previously added to the block layer.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210204124834.774401-9-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/snapshot.h | 18 ++++++++++++++++--
 migration/savevm.c           | 30 ++++++++++++++++++------------
 monitor/hmp-cmds.c           |  5 +++--
 replay/replay-debugging.c    |  4 ++--
 replay/replay-snapshot.c     |  5 +++--
 softmmu/vl.c                 |  2 +-
 6 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index d8c22d343c..3bdbef435b 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -15,23 +15,37 @@
 #ifndef QEMU_MIGRATION_SNAPSHOT_H
 #define QEMU_MIGRATION_SNAPSHOT_H
 
+#include "qapi/qapi-builtin-types.h"
+
 /**
  * save_snapshot: Save an internal snapshot.
  * @name: name of internal snapshot
  * @overwrite: replace existing snapshot with @name
+ * @vmstate: blockdev node name to store VM state in
+ * @has_devices: whether to use explicit device list
+ * @devices: explicit device list to snapshot
  * @errp: pointer to error object
  * On success, return %true.
  * On failure, store an error through @errp and return %false.
  */
-bool save_snapshot(const char *name, bool overwrite, Error **errp);
+bool save_snapshot(const char *name, bool overwrite,
+                   const char *vmstate,
+                   bool has_devices, strList *devices,
+                   Error **errp);
 
 /**
  * load_snapshot: Load an internal snapshot.
  * @name: name of internal snapshot
+ * @vmstate: blockdev node name to load VM state from
+ * @has_devices: whether to use explicit device list
+ * @devices: explicit device list to snapshot
  * @errp: pointer to error object
  * On success, return %true.
  * On failure, store an error through @errp and return %false.
  */
-bool load_snapshot(const char *name, Error **errp);
+bool load_snapshot(const char *name,
+                   const char *vmstate,
+                   bool has_devices, strList *devices,
+                   Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 0ae8e4798c..0b27a8c55a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -43,6 +43,8 @@
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
 #include "qapi/qmp/json-writer.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "sysemu/cpus.h"
@@ -2764,7 +2766,8 @@ int qemu_load_device_state(QEMUFile *f)
     return 0;
 }
 
-bool save_snapshot(const char *name, bool overwrite, Error **errp)
+bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
+                  bool has_devices, strList *devices, Error **errp)
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1;
@@ -2786,18 +2789,19 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
         return false;
     }
 
-    if (!bdrv_all_can_snapshot(false, NULL, errp)) {
+    if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
         return false;
     }
 
     /* Delete old snapshots of the same name */
     if (name) {
         if (overwrite) {
-            if (bdrv_all_delete_snapshot(name, false, NULL, errp) < 0) {
+            if (bdrv_all_delete_snapshot(name, has_devices,
+                                         devices, errp) < 0) {
                 return false;
             }
         } else {
-            ret2 = bdrv_all_has_snapshot(name, false, NULL, errp);
+            ret2 = bdrv_all_has_snapshot(name, has_devices, devices, errp);
             if (ret2 < 0) {
                 return false;
             }
@@ -2810,7 +2814,7 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
         }
     }
 
-    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
+    bs = bdrv_all_find_vmstate_bs(vmstate, has_devices, devices, errp);
     if (bs == NULL) {
         return false;
     }
@@ -2875,9 +2879,10 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
     aio_context_release(aio_context);
     aio_context = NULL;
 
-    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size, false, NULL, errp);
+    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size,
+                                   has_devices, devices, errp);
     if (ret < 0) {
-        bdrv_all_delete_snapshot(sn->name, false, NULL, NULL);
+        bdrv_all_delete_snapshot(sn->name, has_devices, devices, NULL);
         goto the_end;
     }
 
@@ -2978,7 +2983,8 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     migration_incoming_state_destroy();
 }
 
-bool load_snapshot(const char *name, Error **errp)
+bool load_snapshot(const char *name, const char *vmstate,
+                   bool has_devices, strList *devices, Error **errp)
 {
     BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
@@ -2987,10 +2993,10 @@ bool load_snapshot(const char *name, Error **errp)
     AioContext *aio_context;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
-    if (!bdrv_all_can_snapshot(false, NULL, errp)) {
+    if (!bdrv_all_can_snapshot(has_devices, devices, errp)) {
         return false;
     }
-    ret = bdrv_all_has_snapshot(name, false, NULL, errp);
+    ret = bdrv_all_has_snapshot(name, has_devices, devices, errp);
     if (ret < 0) {
         return false;
     }
@@ -3000,7 +3006,7 @@ bool load_snapshot(const char *name, Error **errp)
         return false;
     }
 
-    bs_vm_state = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
+    bs_vm_state = bdrv_all_find_vmstate_bs(vmstate, has_devices, devices, errp);
     if (!bs_vm_state) {
         return false;
     }
@@ -3027,7 +3033,7 @@ bool load_snapshot(const char *name, Error **errp)
     /* Flush all IO requests so they don't interfere with the new state.  */
     bdrv_drain_all_begin();
 
-    ret = bdrv_all_goto_snapshot(name, false, NULL, errp);
+    ret = bdrv_all_goto_snapshot(name, has_devices, devices, errp);
     if (ret < 0) {
         goto err_drain;
     }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1fff33f14a..15d4e039ac 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1139,7 +1139,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (!load_snapshot(name, &err) && saved_vm_running) {
+    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
@@ -1149,7 +1149,8 @@ void hmp_savevm(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    save_snapshot(qdict_get_try_str(qdict, "name"), true, &err);
+    save_snapshot(qdict_get_try_str(qdict, "name"),
+                  true, NULL, false, NULL, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 0ae6785b3b..1cde50e9f3 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -196,7 +196,7 @@ static void replay_seek(int64_t icount, QEMUTimerCB callback, Error **errp)
         if (icount < replay_get_current_icount()
             || replay_get_current_icount() < snapshot_icount) {
             vm_stop(RUN_STATE_RESTORE_VM);
-            load_snapshot(snapshot, errp);
+            load_snapshot(snapshot, NULL, false, NULL, errp);
         }
         g_free(snapshot);
     }
@@ -327,7 +327,7 @@ void replay_gdb_attached(void)
      */
     if (replay_mode == REPLAY_MODE_PLAY
         && !replay_snapshot) {
-        if (!save_snapshot("start_debugging", true, NULL)) {
+        if (!save_snapshot("start_debugging", true, NULL, false, NULL, NULL)) {
             /* Can't create the snapshot. Continue conventional debugging. */
         }
     }
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 31c5a8702b..e8767a1937 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -77,13 +77,14 @@ void replay_vmstate_init(void)
 
     if (replay_snapshot) {
         if (replay_mode == REPLAY_MODE_RECORD) {
-            if (!save_snapshot(replay_snapshot, true, &err)) {
+            if (!save_snapshot(replay_snapshot,
+                               true, NULL, false, NULL, &err)) {
                 error_report_err(err);
                 error_report("Could not create snapshot for icount record");
                 exit(1);
             }
         } else if (replay_mode == REPLAY_MODE_PLAY) {
-            if (!load_snapshot(replay_snapshot, &err)) {
+            if (!load_snapshot(replay_snapshot, NULL, false, NULL, &err)) {
                 error_report_err(err);
                 error_report("Could not load snapshot for icount replay");
                 exit(1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 8f655086b7..32b353752a 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2529,7 +2529,7 @@ void qmp_x_exit_preconfig(Error **errp)
 
     if (loadvm) {
         Error *local_err = NULL;
-        if (!load_snapshot(loadvm, &local_err)) {
+        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
             error_report_err(local_err);
             autostart = 0;
             exit(1);
-- 
2.29.2


