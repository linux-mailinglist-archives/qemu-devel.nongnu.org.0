Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F732C5AEC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:46:06 +0100 (CET)
Received: from localhost ([::1]:51422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLLK-0003iL-0Z
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:46:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBu-0002z0-OB
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:36:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBi-0006b0-Ty
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fvw1pzaBGfVMCQ6/Empjx2eQGpZqLrz+rInlh3FCyRA=;
 b=Xo+jBkPVNNrJyMuNklETOtXKqCmt4hUn3w3kdVPhl2yYS9YcVTRzEuILMzmLZNrIq+wki/
 fHpdUHRGqAQIUT3QrEGmY/V5HqMkXncvXRBl8DgGYpy/ok58pPQE82YtMHPdr1yDHviEio
 ZEgxTMlZmLL5JxkibjXumjHyjCTz9XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-cwfNr-CKNueIelAURS_tSw-1; Thu, 26 Nov 2020 12:36:07 -0500
X-MC-Unique: cwfNr-CKNueIelAURS_tSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4655F8145E7;
 Thu, 26 Nov 2020 17:36:06 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0DB01C956;
 Thu, 26 Nov 2020 17:36:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/11] migration: wire up support for snapshot device
 selection
Date: Thu, 26 Nov 2020 17:35:18 +0000
Message-Id: <20201126173521.137580-9-berrange@redhat.com>
In-Reply-To: <20201126173521.137580-1-berrange@redhat.com>
References: <20201126173521.137580-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify load_snapshot/save_snapshot to accept the device list and vmstate
node name parameters previously added to the block layer.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 include/migration/snapshot.h | 18 ++++++++++++++++--
 migration/savevm.c           | 28 +++++++++++++++++-----------
 monitor/hmp-cmds.c           |  5 +++--
 replay/replay-debugging.c    |  4 ++--
 replay/replay-snapshot.c     |  5 +++--
 softmmu/vl.c                 |  2 +-
 6 files changed, 42 insertions(+), 20 deletions(-)

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
index 3ced05459d..7c1c11e83c 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -42,6 +42,8 @@
 #include "postcopy-ram.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
+#include "qapi/clone-visitor.h"
+#include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
 #include "qemu/error-report.h"
 #include "sysemu/cpus.h"
@@ -2725,7 +2727,8 @@ int qemu_load_device_state(QEMUFile *f)
     return 0;
 }
 
-bool save_snapshot(const char *name, bool overwrite, Error **errp)
+bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
+                  bool has_devices, strList *devices, Error **errp)
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
@@ -2747,18 +2750,19 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
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
@@ -2771,7 +2775,7 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
         }
     }
 
-    bs = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
+    bs = bdrv_all_find_vmstate_bs(vmstate, has_devices, devices, errp);
     if (bs == NULL) {
         return false;
     }
@@ -2842,7 +2846,8 @@ bool save_snapshot(const char *name, bool overwrite, Error **errp)
     aio_context_release(aio_context);
     aio_context = NULL;
 
-    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size, false, NULL, errp);
+    ret = bdrv_all_create_snapshot(sn, bs, vm_state_size,
+                                   has_devices, devices, errp);
     if (ret < 0) {
         goto the_end;
     }
@@ -2944,7 +2949,8 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     migration_incoming_state_destroy();
 }
 
-bool load_snapshot(const char *name, Error **errp)
+bool load_snapshot(const char *name, const char *vmstate,
+                   bool has_devices, strList *devices, Error **errp)
 {
     BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
@@ -2953,10 +2959,10 @@ bool load_snapshot(const char *name, Error **errp)
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
@@ -2966,7 +2972,7 @@ bool load_snapshot(const char *name, Error **errp)
         return -1;
     }
 
-    bs_vm_state = bdrv_all_find_vmstate_bs(NULL, false, NULL, errp);
+    bs_vm_state = bdrv_all_find_vmstate_bs(vmstate, has_devices, devices, errp);
     if (!bs_vm_state) {
         return false;
     }
@@ -2993,7 +2999,7 @@ bool load_snapshot(const char *name, Error **errp)
     /* Flush all IO requests so they don't interfere with the new state.  */
     bdrv_drain_all_begin();
 
-    ret = bdrv_all_goto_snapshot(name, false, NULL, errp);
+    ret = bdrv_all_goto_snapshot(name, has_devices, devices, errp);
     if (ret < 0) {
         goto err_drain;
     }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 4e1e775007..fb5dc7a4a7 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1130,7 +1130,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (!load_snapshot(name, &err) && saved_vm_running) {
+    if (!load_snapshot(name, NULL, false, NULL, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
@@ -1140,7 +1140,8 @@ void hmp_savevm(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    save_snapshot(qdict_get_try_str(qdict, "name"), true, &err);
+    save_snapshot(qdict_get_try_str(qdict, "name"),
+                  true, NULL, false, NULL, &err);
     hmp_handle_error(mon, err);
 }
 
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 8847b2e218..a364f1669b 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -197,7 +197,7 @@ static void replay_seek(int64_t icount, QEMUTimerCB callback, Error **errp)
         if (icount < replay_get_current_icount()
             || replay_get_current_icount() < snapshot_icount) {
             vm_stop(RUN_STATE_RESTORE_VM);
-            load_snapshot(snapshot, errp);
+            load_snapshot(snapshot, NULL, false, NULL, errp);
         }
         g_free(snapshot);
     }
@@ -328,7 +328,7 @@ void replay_gdb_attached(void)
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
index 872ff8bdbc..f00b2765af 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4473,7 +4473,7 @@ void qemu_init(int argc, char **argv, char **envp)
     register_global_state();
     if (loadvm) {
         Error *local_err = NULL;
-        if (!load_snapshot(loadvm, &local_err)) {
+        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
             error_report_err(local_err);
             autostart = 0;
             exit(1);
-- 
2.28.0


