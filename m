Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7D24CD979
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 17:51:02 +0100 (CET)
Received: from localhost ([::1]:58584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQB8v-0000FQ-LY
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 11:51:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5W-0004Yz-0a
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nQB5U-0007Is-3d
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 11:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646412447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaBdy2pIWXrdfhFA3HMwVQlkhTGtqFU6d+QMsLshN4g=;
 b=gxodzXTdg5MYaIaLEffJb9NhV8iufErWONaIDUMFzVtfqLOGsixpbNEjFRS64b1GN3488r
 Tfow/7y4274L7k1Zwktgx2tvdy/C4hfF5CBdDOnPvWSr2LFiKllpkvNVbCsYkt6c/Z08q0
 ODvuLYSZoRg9HGYiMMFkcrmDc3544Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-nh62bwEkPG6uSigGbrmC9A-1; Fri, 04 Mar 2022 11:47:24 -0500
X-MC-Unique: nh62bwEkPG6uSigGbrmC9A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DB761091DA0;
 Fri,  4 Mar 2022 16:47:22 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 323DD85476;
 Fri,  4 Mar 2022 16:47:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/50] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
Date: Fri,  4 Mar 2022 17:46:25 +0100
Message-Id: <20220304164711.474713-5-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
References: <20220304164711.474713-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Following the bdrv_activate renaming, change also the name
of the respective callers.

bdrv_invalidate_cache_all -> bdrv_activate_all
blk_invalidate_cache -> blk_activate
test_sync_op_invalidate_cache -> test_sync_op_activate

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220209105452.1694545-5-eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h            |  2 +-
 include/sysemu/block-backend.h   |  2 +-
 block.c                          |  2 +-
 block/block-backend.c            |  2 +-
 hw/block/pflash_cfi01.c          |  2 +-
 hw/nvram/spapr_nvram.c           |  2 +-
 migration/block.c                |  2 +-
 migration/migration.c            | 14 +++++++-------
 migration/savevm.c               |  6 +++---
 monitor/qmp-cmds.c               |  2 +-
 tests/unit/test-block-iothread.c |  6 +++---
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 18cd336911..d27e616d29 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -493,8 +493,8 @@ int bdrv_co_ioctl(BlockDriverState *bs, int req, void *buf);
 /* Invalidate any cached metadata used by image formats */
 int generated_co_wrapper bdrv_invalidate_cache(BlockDriverState *bs,
                                                Error **errp);
-void bdrv_invalidate_cache_all(Error **errp);
 int bdrv_activate(BlockDriverState *bs, Error **errp);
+void bdrv_activate_all(Error **errp);
 int bdrv_inactivate_all(void);
 
 /* Ensure contents are flushed to disk.  */
diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index e5e1524f06..6c5104cd4a 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -206,7 +206,7 @@ bool blk_is_writable(BlockBackend *blk);
 bool blk_is_sg(BlockBackend *blk);
 bool blk_enable_write_cache(BlockBackend *blk);
 void blk_set_enable_write_cache(BlockBackend *blk, bool wce);
-void blk_invalidate_cache(BlockBackend *blk, Error **errp);
+void blk_activate(BlockBackend *blk, Error **errp);
 bool blk_is_inserted(BlockBackend *blk);
 bool blk_is_available(BlockBackend *blk);
 void blk_lock_medium(BlockBackend *blk, bool locked);
diff --git a/block.c b/block.c
index 7746727a47..5e65f134f8 100644
--- a/block.c
+++ b/block.c
@@ -6473,7 +6473,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-void bdrv_invalidate_cache_all(Error **errp)
+void bdrv_activate_all(Error **errp)
 {
     BlockDriverState *bs;
     BdrvNextIterator it;
diff --git a/block/block-backend.c b/block/block-backend.c
index c516113a36..98bfcd5cf2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1880,7 +1880,7 @@ void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
     blk->enable_write_cache = wce;
 }
 
-void blk_invalidate_cache(BlockBackend *blk, Error **errp)
+void blk_activate(BlockBackend *blk, Error **errp)
 {
     BlockDriverState *bs = blk_bs(blk);
 
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 81f9f971d8..74c7190302 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -1023,7 +1023,7 @@ static void postload_update_cb(void *opaque, bool running, RunState state)
 {
     PFlashCFI01 *pfl = opaque;
 
-    /* This is called after bdrv_invalidate_cache_all.  */
+    /* This is called after bdrv_activate_all.  */
     qemu_del_vm_change_state_handler(pfl->vmstate);
     pfl->vmstate = NULL;
 
diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
index fbfdf47e26..18b43be7f6 100644
--- a/hw/nvram/spapr_nvram.c
+++ b/hw/nvram/spapr_nvram.c
@@ -219,7 +219,7 @@ static void postload_update_cb(void *opaque, bool running, RunState state)
 {
     SpaprNvram *nvram = opaque;
 
-    /* This is called after bdrv_invalidate_cache_all.  */
+    /* This is called after bdrv_activate_all.  */
 
     qemu_del_vm_change_state_handler(nvram->vmstate);
     nvram->vmstate = NULL;
diff --git a/migration/block.c b/migration/block.c
index a950977855..077a413325 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -932,7 +932,7 @@ static int block_load(QEMUFile *f, void *opaque, int version_id)
                     return -EINVAL;
                 }
 
-                blk_invalidate_cache(blk, &local_err);
+                blk_activate(blk, &local_err);
                 if (local_err) {
                     error_report_err(local_err);
                     return -EINVAL;
diff --git a/migration/migration.c b/migration/migration.c
index 9cc344514b..695f0f2900 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -503,9 +503,9 @@ static void process_incoming_migration_bh(void *opaque)
     if (!migrate_late_block_activate() ||
          (autostart && (!global_state_received() ||
             global_state_get_runstate() == RUN_STATE_RUNNING))) {
-        /* Make sure all file formats flush their mutable metadata.
+        /* Make sure all file formats throw away their mutable metadata.
          * If we get an error here, just don't restart the VM yet. */
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
             local_err = NULL;
@@ -591,8 +591,8 @@ static void process_incoming_migration_co(void *opaque)
 
     /* we get COLO info, and know if we are in COLO mode */
     if (!ret && migration_incoming_colo_enabled()) {
-        /* Make sure all file formats flush their mutable metadata */
-        bdrv_invalidate_cache_all(&local_err);
+        /* Make sure all file formats throw away their mutable metadata */
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
             goto fail;
@@ -1932,7 +1932,7 @@ static void migrate_fd_cancel(MigrationState *s)
     if (s->state == MIGRATION_STATUS_CANCELLING && s->block_inactive) {
         Error *local_err = NULL;
 
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         } else {
@@ -3111,7 +3111,7 @@ fail:
          */
         Error *local_err = NULL;
 
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -3256,7 +3256,7 @@ fail_invalidate:
         Error *local_err = NULL;
 
         qemu_mutex_lock_iothread();
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         } else {
diff --git a/migration/savevm.c b/migration/savevm.c
index 967ff80547..6b79f9673a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1438,7 +1438,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 
     if (inactivate_disks) {
         /* Inactivate before sending QEMU_VM_EOF so that the
-         * bdrv_invalidate_cache_all() on the other end won't fail. */
+         * bdrv_activate_all() on the other end won't fail. */
         ret = bdrv_inactivate_all();
         if (ret) {
             error_report("%s: bdrv_inactivate_all() failed (%d)",
@@ -2013,9 +2013,9 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
 
     trace_loadvm_postcopy_handle_run_bh("after announce");
 
-    /* Make sure all file formats flush their mutable metadata.
+    /* Make sure all file formats throw away their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
-    bdrv_invalidate_cache_all(&local_err);
+    bdrv_activate_all(&local_err);
     if (local_err) {
         error_report_err(local_err);
         local_err = NULL;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index df97582dd4..ad82c275c4 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -144,7 +144,7 @@ void qmp_cont(Error **errp)
      * If there are no inactive block nodes (e.g. because the VM was just
      * paused rather than completing a migration), bdrv_inactivate_all() simply
      * doesn't do anything. */
-    bdrv_invalidate_cache_all(&local_err);
+    bdrv_activate_all(&local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return;
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index 378a7b7869..94718c9319 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -279,7 +279,7 @@ static void test_sync_op_check(BdrvChild *c)
     g_assert_cmpint(ret, ==, -ENOTSUP);
 }
 
-static void test_sync_op_invalidate_cache(BdrvChild *c)
+static void test_sync_op_activate(BdrvChild *c)
 {
     /* Early success: Image is not inactive */
     bdrv_activate(c->bs, NULL);
@@ -325,8 +325,8 @@ const SyncOpTest sync_op_tests[] = {
         .name   = "/sync-op/check",
         .fn     = test_sync_op_check,
     }, {
-        .name   = "/sync-op/invalidate_cache",
-        .fn     = test_sync_op_invalidate_cache,
+        .name   = "/sync-op/activate",
+        .fn     = test_sync_op_activate,
     },
 };
 
-- 
2.35.1


