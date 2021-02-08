Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A854B313CDE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:12:35 +0100 (CET)
Received: from localhost ([::1]:37950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9B1W-0004tq-MQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94l3-00022H-3z
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l94kk-0002Sy-I7
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 06:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612783841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJlWNOZuDIfpXA6INj9klRTUjTDuqsHP4GxCCBGl+qM=;
 b=Qu5QnsIUjSABgwFLNvAgnlq3Kr6ZDjFQnGfybHrZ0oFBpypFIyxAn4bCwBMvOmhgcErxSp
 BEtv/5Ou8yEhZRLVbimVFz5Dfc7AfYfkY9wG3E0ovpUutyPYsWbK/UfdxXjRpHXYT8nauv
 xH9dd39U3O417Kios4KWOmN5GHmxKgA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-QnNkL2XWNUqFUkTxP9TJSw-1; Mon, 08 Feb 2021 06:30:37 -0500
X-MC-Unique: QnNkL2XWNUqFUkTxP9TJSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498E35214;
 Mon,  8 Feb 2021 11:30:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-22.ams2.redhat.com
 [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6836F1002388;
 Mon,  8 Feb 2021 11:30:31 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com, s.reiter@proxmox.com
Subject: [PULL 16/27] migration: Make save_snapshot() return bool, not 0/-1
Date: Mon,  8 Feb 2021 11:29:07 +0000
Message-Id: <20210208112918.185058-17-dgilbert@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Just for consistency, following the example documented since
commit e3fe3988d7 ("error: Document Error API usage rules"),
return a boolean value indicating an error is set or not.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210204124834.774401-3-berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/snapshot.h |  9 ++++++++-
 migration/savevm.c           | 16 ++++++++--------
 replay/replay-debugging.c    |  2 +-
 replay/replay-snapshot.c     |  2 +-
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/include/migration/snapshot.h b/include/migration/snapshot.h
index c85b6ec75b..0eaf1ba0b1 100644
--- a/include/migration/snapshot.h
+++ b/include/migration/snapshot.h
@@ -15,7 +15,14 @@
 #ifndef QEMU_MIGRATION_SNAPSHOT_H
 #define QEMU_MIGRATION_SNAPSHOT_H
 
-int save_snapshot(const char *name, Error **errp);
+/**
+ * save_snapshot: Save an internal snapshot.
+ * @name: name of internal snapshot
+ * @errp: pointer to error object
+ * On success, return %true.
+ * On failure, store an error through @errp and return %false.
+ */
+bool save_snapshot(const char *name, Error **errp);
 int load_snapshot(const char *name, Error **errp);
 
 #endif
diff --git a/migration/savevm.c b/migration/savevm.c
index 948e82c9ed..63f1e63e51 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2764,7 +2764,7 @@ int qemu_load_device_state(QEMUFile *f)
     return 0;
 }
 
-int save_snapshot(const char *name, Error **errp)
+bool save_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1;
@@ -2777,29 +2777,29 @@ int save_snapshot(const char *name, Error **errp)
     AioContext *aio_context;
 
     if (migration_is_blocked(errp)) {
-        return ret;
+        return false;
     }
 
     if (!replay_can_snapshot()) {
         error_setg(errp, "Record/replay does not allow making snapshot "
                    "right now. Try once more later.");
-        return ret;
+        return false;
     }
 
     if (!bdrv_all_can_snapshot(errp)) {
-        return ret;
+        return false;
     }
 
     /* Delete old snapshots of the same name */
     if (name) {
         if (bdrv_all_delete_snapshot(name, errp) < 0) {
-            return ret;
+            return false;
         }
     }
 
     bs = bdrv_all_find_vmstate_bs(errp);
     if (bs == NULL) {
-        return ret;
+        return false;
     }
     aio_context = bdrv_get_aio_context(bs);
 
@@ -2808,7 +2808,7 @@ int save_snapshot(const char *name, Error **errp)
     ret = global_state_store();
     if (ret) {
         error_setg(errp, "Error saving global state");
-        return ret;
+        return false;
     }
     vm_stop(RUN_STATE_SAVE_VM);
 
@@ -2880,7 +2880,7 @@ int save_snapshot(const char *name, Error **errp)
     if (saved_vm_running) {
         vm_start();
     }
-    return ret;
+    return ret == 0;
 }
 
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 3a9b609e62..8e0050915d 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -323,7 +323,7 @@ void replay_gdb_attached(void)
      */
     if (replay_mode == REPLAY_MODE_PLAY
         && !replay_snapshot) {
-        if (save_snapshot("start_debugging", NULL) != 0) {
+        if (!save_snapshot("start_debugging", NULL)) {
             /* Can't create the snapshot. Continue conventional debugging. */
         }
     }
diff --git a/replay/replay-snapshot.c b/replay/replay-snapshot.c
index e26fa4c892..4f2560d156 100644
--- a/replay/replay-snapshot.c
+++ b/replay/replay-snapshot.c
@@ -77,7 +77,7 @@ void replay_vmstate_init(void)
 
     if (replay_snapshot) {
         if (replay_mode == REPLAY_MODE_RECORD) {
-            if (save_snapshot(replay_snapshot, &err) != 0) {
+            if (!save_snapshot(replay_snapshot, &err)) {
                 error_report_err(err);
                 error_report("Could not create snapshot for icount record");
                 exit(1);
-- 
2.29.2


