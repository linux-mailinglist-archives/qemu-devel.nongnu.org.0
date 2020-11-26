Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5692C5AC5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 18:39:19 +0100 (CET)
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiLEk-0004tE-OW
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 12:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBI-0002UH-0n
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kiLBE-0006NI-6X
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 12:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606412139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L+gZLEKGgAn5nKHLjdQ/apPeszxp4758m/r7I4PQWm0=;
 b=UxTqYAlO5XAIMZzd4Uw9B/HZznUtqPfJ3umOw7FiCgGnoWZ3VS/cU/HH77pDR5pEyafBXe
 osQrT3oLYU+phTN0W2SzTqYXQ5f5APD5WCNJ8pG/y2OibEdbHgGbVvoki9Z+LTrQoDRdxf
 MOpq54d+ONbnvDh1B2kABWNMNNB6Yms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-FqHhwn_ZMz2dokKbS-lCLA-1; Thu, 26 Nov 2020 12:35:37 -0500
X-MC-Unique: FqHhwn_ZMz2dokKbS-lCLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E991007474;
 Thu, 26 Nov 2020 17:35:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 115731C934;
 Thu, 26 Nov 2020 17:35:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 02/11] migration: Make save_snapshot() return bool, not 0/-1
Date: Thu, 26 Nov 2020 17:35:12 +0000
Message-Id: <20201126173521.137580-3-berrange@redhat.com>
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
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Just for consistency, following the example documented since
commit e3fe3988d7 ("error: Document Error API usage rules"),
return a boolean value indicating an error is set or not.

Acked-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 221b85e07c..8304b5cd0a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2725,7 +2725,7 @@ int qemu_load_device_state(QEMUFile *f)
     return 0;
 }
 
-int save_snapshot(const char *name, Error **errp)
+bool save_snapshot(const char *name, Error **errp)
 {
     BlockDriverState *bs;
     QEMUSnapshotInfo sn1, *sn = &sn1, old_sn1, *old_sn = &old_sn1;
@@ -2738,29 +2738,29 @@ int save_snapshot(const char *name, Error **errp)
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
 
@@ -2769,7 +2769,7 @@ int save_snapshot(const char *name, Error **errp)
     ret = global_state_store();
     if (ret) {
         error_setg(errp, "Error saving global state");
-        return ret;
+        return false;
     }
     vm_stop(RUN_STATE_SAVE_VM);
 
@@ -2846,7 +2846,7 @@ int save_snapshot(const char *name, Error **errp)
     if (saved_vm_running) {
         vm_start();
     }
-    return ret;
+    return ret == 0;
 }
 
 void qmp_xen_save_devices_state(const char *filename, bool has_live, bool live,
diff --git a/replay/replay-debugging.c b/replay/replay-debugging.c
index 7ad0a37179..c5d3da1e80 100644
--- a/replay/replay-debugging.c
+++ b/replay/replay-debugging.c
@@ -324,7 +324,7 @@ void replay_gdb_attached(void)
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
2.28.0


