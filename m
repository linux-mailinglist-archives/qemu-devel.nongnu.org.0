Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91E2FCE0D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 11:51:03 +0100 (CET)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2B4o-0007kx-Fj
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 05:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2AyY-0002Rk-BM
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:44:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2AyW-0006Xq-CR
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 05:44:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611139471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vJfI35ejELuOF3pY1GdCK8LpJs8aruBMl+uLnpt02c=;
 b=XCSvKuvOpcV5PNLNPlms5FPIsslM0n2jEX4M9osc2E//o2VkMnxacwCefaU3L5KqHbvXO1
 8rur910OJQnDq1CDdbMDjtD5XdB/3qE+Le41nVaXtrzEKAsVDXublyrtKs7POeZLKqUv8c
 QOithhH9Q91ZwBmdv+4Wswq6K0QvuT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-aJh5tvY0OqOmm6vwyOXVQw-1; Wed, 20 Jan 2021 05:44:30 -0500
X-MC-Unique: aJh5tvY0OqOmm6vwyOXVQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F05561800D42;
 Wed, 20 Jan 2021 10:44:28 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-126.ams2.redhat.com
 [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8137C71D55;
 Wed, 20 Jan 2021 10:44:25 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/11] migration: stop returning errno from load_snapshot()
Date: Wed, 20 Jan 2021 10:44:03 +0000
Message-Id: <20210120104411.3084801-4-berrange@redhat.com>
In-Reply-To: <20210120104411.3084801-1-berrange@redhat.com>
References: <20210120104411.3084801-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

None of the callers care about the errno value since there is a full
Error object populated. This gives consistency with save_snapshot()
which already just returns a boolean value.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[PMD: Return false/true instead of -1/0, document function]
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/migration/snapshot.h | 10 +++++++++-
 migration/savevm.c           | 19 +++++++++----------
 monitor/hmp-cmds.c           |  2 +-
 replay/replay-snapshot.c     |  2 +-
 softmmu/vl.c                 |  2 +-
 5 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index 0eaf1ba0b1..d7d210820c 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -23,6 +23,14 @@
  * On failure, store an error through @errp and return %false.
  */
 bool save_snapshot(const char *name, Error **errp);
-int load_snapshot(const char *name, Error **errp);
+
+/**
+ * load_snapshot: Load an internal snapshot.
+ * @name: name of internal snapshot
+ * @errp: pointer to error object
+ * On success, return %true.
+ * On failure, store an error through @errp and return %false.
+ */
+bool load_snapshot(const char *name, Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index ef7963f6c9..e6972b56b3 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2930,7 +2930,7 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     migration_incoming_state_destroy();
 }
 
-int load_snapshot(const char *name, Error **errp)
+bool load_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
@@ -2940,16 +2940,16 @@ int load_snapshot(const char *name, Error **errp)
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     if (!bdrv_all_can_snapshot(errp)) {
-        return -ENOTSUP;
+        return false;
     }
     ret = bdrv_all_find_snapshot(name, errp);
     if (ret < 0) {
-        return ret;
+        return false;
     }
 
     bs_vm_state = bdrv_all_find_vmstate_bs(errp);
     if (!bs_vm_state) {
-        return -ENOTSUP;
+        return false;
     }
     aio_context = bdrv_get_aio_context(bs_vm_state);
 
@@ -2958,11 +2958,11 @@ int load_snapshot(const char *name, Error **errp)
     ret = bdrv_snapshot_find(bs_vm_state, &sn, name);
     aio_context_release(aio_context);
     if (ret < 0) {
-        return ret;
+        return false;
     } else if (sn.vm_state_size == 0) {
         error_setg(errp, "This is a disk-only snapshot. Revert to it "
                    " offline using qemu-img");
-        return -EINVAL;
+        return false;
     }
 
     /*
@@ -2983,7 +2983,6 @@ int load_snapshot(const char *name, Error **errp)
     f = qemu_fopen_bdrv(bs_vm_state, 0);
     if (!f) {
         error_setg(errp, "Could not open VM state file");
-        ret = -EINVAL;
         goto err_drain;
     }
 
@@ -3003,14 +3002,14 @@ int load_snapshot(const char *name, Error **errp)
 
     if (ret < 0) {
         error_setg(errp, "Error %d while loading VM state", ret);
-        return ret;
+        return false;
     }
 
-    return 0;
+    return true;
 
 err_drain:
     bdrv_drain_all_end();
-    return ret;
+    return false;
 }
 
 void vmstate_register_ram(MemoryRegion *mr, DeviceState *dev)
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 1c4fd5cd61..8c68c05dec 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1130,7 +1130,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
     vm_stop(RUN_STATE_RESTORE_VM);
 
-    if (load_snapshot(name, &err) == 0 && saved_vm_running) {
+    if (!load_snapshot(name, &err) && saved_vm_running) {
         vm_start();
     }
     hmp_handle_error(mon, err);
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index 4f2560d156..b289365937 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -83,7 +83,7 @@ void replay_vmstate_init(void)
                 exit(1);
             }
         } else if (replay_mode == REPLAY_MODE_PLAY) {
-            if (load_snapshot(replay_snapshot, &err) != 0) {
+            if (!load_snapshot(replay_snapshot, &err)) {
                 error_report_err(err);
                 error_report("Could not load snapshot for icount replay");
                 exit(1);
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 7ddf405d76..6bd7bd07c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2529,7 +2529,7 @@ void qmp_x_exit_preconfig(Error **errp)
 
     if (loadvm) {
         Error *local_err = NULL;
-        if (load_snapshot(loadvm, &local_err) < 0) {
+        if (!load_snapshot(loadvm, &local_err)) {
             error_report_err(local_err);
             autostart = 0;
             exit(1);
-- 
2.29.2


