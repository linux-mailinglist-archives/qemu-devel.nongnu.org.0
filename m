Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F053F4AEFE2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 12:20:15 +0100 (CET)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHl1D-00016J-3Z
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 06:20:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcz-000575-Og
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHkcu-00047I-5A
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 05:55:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644404107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSX67u7kt9piartwbmJm3Jqw8HFmrm7j612Ag5E6vT0=;
 b=cNdmdKO0onCcrxAWXAxjpPdegHZHUlF8IXtQWhKSTg40OLSxFdWgnTttFDHLUhj8O5ipgh
 aI9HRl3EomwuV6oEeCB+NPSke4Ze231N/ljZtV7D2UsWvZS2ax3trVzifHUUOuHqkOzCpw
 tRsEZqzB3jcHNCTL6M/guYXfPa1h8y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-V0nzfsQFPO6ZCxBZbq8_vg-1; Wed, 09 Feb 2022 05:55:04 -0500
X-MC-Unique: V0nzfsQFPO6ZCxBZbq8_vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CAF081DFAB;
 Wed,  9 Feb 2022 10:55:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F1F95F6AF;
 Wed,  9 Feb 2022 10:55:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/5] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
Date: Wed,  9 Feb 2022 05:54:51 -0500
Message-Id: <20220209105452.1694545-5-eesposit@redhat.com>
In-Reply-To: <20220209105452.1694545-1-eesposit@redhat.com>
References: <20220209105452.1694545-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the bdrv_activate renaming, change also the name
of the respective callers.

bdrv_invalidate_cache_all -> bdrv_activate_all
blk_invalidate_cache -> blk_activate
test_sync_op_invalidate_cache -> test_sync_op_activate

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c                          |  2 +-
 block/block-backend.c            |  2 +-
 hw/block/pflash_cfi01.c          |  2 +-
 hw/nvram/spapr_nvram.c           |  2 +-
 include/block/block.h            |  2 +-
 include/sysemu/block-backend.h   |  2 +-
 migration/block.c                |  2 +-
 migration/migration.c            | 14 +++++++-------
 migration/savevm.c               |  6 +++---
 monitor/qmp-cmds.c               |  2 +-
 tests/unit/test-block-iothread.c |  6 +++---
 11 files changed, 21 insertions(+), 21 deletions(-)

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
index bcc385b94b..ad2e3a3cbd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -497,9 +497,9 @@ static void process_incoming_migration_bh(void *opaque)
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
@@ -585,8 +585,8 @@ static void process_incoming_migration_co(void *opaque)
 
     /* we get COLO info, and know if we are in COLO mode */
     if (!ret && migration_incoming_colo_enabled()) {
-        /* Make sure all file formats flush their mutable metadata */
-        bdrv_invalidate_cache_all(&local_err);
+        /* Make sure all file formats throw away their mutable metadata */
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
             goto fail;
@@ -1926,7 +1926,7 @@ static void migrate_fd_cancel(MigrationState *s)
     if (s->state == MIGRATION_STATUS_CANCELLING && s->block_inactive) {
         Error *local_err = NULL;
 
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         } else {
@@ -3105,7 +3105,7 @@ fail:
          */
         Error *local_err = NULL;
 
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         }
@@ -3250,7 +3250,7 @@ fail_invalidate:
         Error *local_err = NULL;
 
         qemu_mutex_lock_iothread();
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         } else {
diff --git a/migration/savevm.c b/migration/savevm.c
index 1599b02fbc..4842462ca6 100644
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
@@ -2006,9 +2006,9 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
 
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
-    /* Make sure all file formats flush their mutable metadata.
+    /* Make sure all file formats throw away their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
-    bdrv_invalidate_cache_all(&local_err);
+    bdrv_activate_all(&local_err);
     if (local_err) {
         error_report_err(local_err);
         local_err = NULL;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index db4d186448..206d9a8c7b 100644
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
2.31.1


