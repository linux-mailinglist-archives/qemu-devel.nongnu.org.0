Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF489313BFF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:01:01 +0100 (CET)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9AqK-0000bP-Vx
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:01:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kr-000215-Rc
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94ke-0002T0-SR
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PsS/CyBo1lB+deFpn5j5uDrohNKPQj4JZy5ztwHyyr8=;
 b=OhJgY+cy4KdBfI/8jnhzLdWm3C/uFSw85drwcTHQOzh/Thz4c1ef4MMMd16OjcJqT9eCL3
 EJAWcwTDqiAK1QAS33jRXTtBbncYtXAA7W2bUkkJ3L1ByTvtM0FOZC64UIuONOalEwsFVj
 4q6L7axQZnFv+vjIOcTLdrJwqRIEj4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-ys6hngkpNIyea83MqZvzuQ-1; Mon, 08 Feb 2021 06:30:39 -0500
X-MC-Unique: ys6hngkpNIyea83MqZvzuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64F005216;
 Mon,  8 Feb 2021 11:30:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86FD91002388;
 Mon,  8 Feb 2021 11:30:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 17/27] migration: stop returning errno from load_snapshot()
Date: Mon,  8 Feb 2021 11:29:08 +0000
Message-Id: <20210208112918.185058-18-dgilbert@redhat.com>
In-Reply-To: <20210208112918.185058-1-dgilbert@redhat.com>
References: <20210208112918.185058-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

None of the callers care about the errno value since there is a full
Error object populated. This gives consistency with save_snapshot()
which already just returns a boolean value.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[PMD: Return false/true instead of -1/0, document function]
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210204124834.774401-4-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
index 63f1e63e51..b85eefd682 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2965,7 +2965,7 @@ void qmp_xen_load_devices_state(const char *filename, Error **errp)
     migration_incoming_state_destroy();
 }
 
-int load_snapshot(const char *name, Error **errp)
+bool load_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs_vm_state;
     QEMUSnapshotInfo sn;
@@ -2975,16 +2975,16 @@ int load_snapshot(const char *name, Error **errp)
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
 
@@ -2993,11 +2993,11 @@ int load_snapshot(const char *name, Error **errp)
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
@@ -3018,7 +3018,6 @@ int load_snapshot(const char *name, Error **errp)
     f = qemu_fopen_bdrv(bs_vm_state, 0);
     if (!f) {
         error_setg(errp, "Could not open VM state file");
-        ret = -EINVAL;
         goto err_drain;
     }
 
@@ -3038,14 +3037,14 @@ int load_snapshot(const char *name, Error **errp)
 
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
index 2b954763e4..6ff050ac3d 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1139,7 +1139,7 @@ void hmp_loadvm(Monitor *mon, const QDict *qdict)
 
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
index 2bf94ece9c..2d6e658a06 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2530,7 +2530,7 @@ void qmp_x_exit_preconfig(Error **errp)
 
     if (loadvm) {
         Error *local_err = NULL;
-        if (load_snapshot(loadvm, &local_err) < 0) {
+        if (!load_snapshot(loadvm, &local_err)) {
             error_report_err(local_err);
             autostart = 0;
             exit(1);
-- 
2.29.2


