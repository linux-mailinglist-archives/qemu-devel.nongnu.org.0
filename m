Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B504964C7
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 19:06:58 +0100 (CET)
Received: from localhost ([::1]:51436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyJN-0006Rt-G7
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 13:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNE-0007on-3Z
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN7-0000O7-RB
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AvH8SiKti33pgKtdQo38ad5Qy1Im9fFdA08Ak7GS1y4=;
 b=U15xgaho0bJOsARqdHb9PIKqCGWGDUhiPYn8cP2Fcy4gniYrR9MbKDcaxnkDOVKIg9GCHo
 c7Pe0+rXxw3dzAFmuKMM9s15KDAA+NKAwz5FCejzWevWW+d0LfgR8QJw48O+MGJIyq8oRc
 nUTqZFeKFyrIYwd+RmnxhcBYylDKQEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-3TB4YfGdOC6pau9lIYWlsA-1; Fri, 21 Jan 2022 12:06:36 -0500
X-MC-Unique: 3TB4YfGdOC6pau9lIYWlsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D0C874983;
 Fri, 21 Jan 2022 17:06:34 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF317EBE8;
 Fri, 21 Jan 2022 17:06:33 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 20/33] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
Date: Fri, 21 Jan 2022 12:05:31 -0500
Message-Id: <20220121170544.2049944-21-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the bdrv_activate renaming, change also the name
of the respective callers.

bdrv_invalidate_cache_all -> bdrv_activate_all
blk_invalidate_cache -> blk_activate
test_sync_op_invalidate_cache -> test_sync_op_activate

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            |  2 +-
 block/block-backend.c              |  2 +-
 hw/block/pflash_cfi01.c            |  2 +-
 hw/nvram/spapr_nvram.c             |  2 +-
 include/block/block-global-state.h |  2 +-
 include/sysemu/block-backend-io.h  |  2 +-
 migration/block.c                  |  2 +-
 migration/migration.c              | 10 +++++-----
 migration/savevm.c                 |  4 ++--
 monitor/qmp-cmds.c                 |  2 +-
 tests/unit/test-block-iothread.c   |  6 +++---
 11 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/block.c b/block.c
index 73c4e0a5a5..7ab5031027 100644
--- a/block.c
+++ b/block.c
@@ -6629,7 +6629,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
     return 0;
 }
 
-void bdrv_invalidate_cache_all(Error **errp)
+void bdrv_activate_all(Error **errp)
 {
     BlockDriverState *bs;
     BdrvNextIterator it;
diff --git a/block/block-backend.c b/block/block-backend.c
index a962fc407a..eb2433d9cb 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1931,7 +1931,7 @@ void blk_set_enable_write_cache(BlockBackend *blk, bool wce)
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
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index a98113189e..dcf0ebcade 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -144,7 +144,7 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
 /* async block I/O */
 void bdrv_aio_cancel(BlockAIOCB *acb);
 int bdrv_activate(BlockDriverState *bs, Error **errp);
-void bdrv_invalidate_cache_all(Error **errp);
+void bdrv_activate_all(Error **errp);
 int bdrv_inactivate_all(void);
 
 int bdrv_flush_all(void);
diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 178cf197fb..83f58f66dd 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -112,7 +112,7 @@ int blk_get_max_iov(BlockBackend *blk);
 int blk_get_max_hw_iov(BlockBackend *blk);
 void blk_set_guest_block_size(BlockBackend *blk, int align);
 
-void blk_invalidate_cache(BlockBackend *blk, Error **errp);
+void blk_activate(BlockBackend *blk, Error **errp);
 
 void blk_io_plug(BlockBackend *blk);
 void blk_io_unplug(BlockBackend *blk);
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
index 0652165610..1f06fd2d18 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -499,7 +499,7 @@ static void process_incoming_migration_bh(void *opaque)
             global_state_get_runstate() == RUN_STATE_RUNNING))) {
         /* Make sure all file formats flush their mutable metadata.
          * If we get an error here, just don't restart the VM yet. */
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
             local_err = NULL;
@@ -586,7 +586,7 @@ static void process_incoming_migration_co(void *opaque)
     /* we get COLO info, and know if we are in COLO mode */
     if (!ret && migration_incoming_colo_enabled()) {
         /* Make sure all file formats flush their mutable metadata */
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
             goto fail;
@@ -1923,7 +1923,7 @@ static void migrate_fd_cancel(MigrationState *s)
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
@@ -3246,7 +3246,7 @@ fail_invalidate:
         Error *local_err = NULL;
 
         qemu_mutex_lock_iothread();
-        bdrv_invalidate_cache_all(&local_err);
+        bdrv_activate_all(&local_err);
         if (local_err) {
             error_report_err(local_err);
         } else {
diff --git a/migration/savevm.c b/migration/savevm.c
index adb5fae9f1..3f4f924093 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1437,7 +1437,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
 
     if (inactivate_disks) {
         /* Inactivate before sending QEMU_VM_EOF so that the
-         * bdrv_invalidate_cache_all() on the other end won't fail. */
+         * bdrv_activate_all() on the other end won't fail. */
         ret = bdrv_inactivate_all();
         if (ret) {
             error_report("%s: bdrv_inactivate_all() failed (%d)",
@@ -2007,7 +2007,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
 
     /* Make sure all file formats flush their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
-    bdrv_invalidate_cache_all(&local_err);
+    bdrv_activate_all(&local_err);
     if (local_err) {
         error_report_err(local_err);
         local_err = NULL;
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 14e3beeaaf..f97bf7ca77 100644
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


