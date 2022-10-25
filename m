Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557C960C76E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:06:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onFmJ-0005A7-4N; Tue, 25 Oct 2022 04:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdW-0007YW-AR
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1onFdL-0007WD-Ie
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 04:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666687802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8YBKW4zmEtDXTK6n6TI+llRYEW/ggSFUpzTlW3fXj1U=;
 b=L39jeW3TuVhqO/HTiTOdi8spR/FXXirUs/4ZtKFFnLGjjdsGC7hxhWAq0Hvn2FynHg6BcG
 Mj/8KsUFGYtEnA4yVpqFt6A4y4vpI/SMlyRs9abigrk1zPGZXuYvO/8pSZClHgkRqVw+kp
 9X/6gyROh4dkOGTyvanBYVz0bVl1XSA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-M-gmbcCBN2CqZMisU9YKAQ-1; Tue, 25 Oct 2022 04:49:58 -0400
X-MC-Unique: M-gmbcCBN2CqZMisU9YKAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE1729AA3B2;
 Tue, 25 Oct 2022 08:49:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6498C35429;
 Tue, 25 Oct 2022 08:49:57 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v3 10/10] block: remove bdrv_try_set_aio_context and replace
 it with bdrv_try_change_aio_context
Date: Tue, 25 Oct 2022 04:49:52 -0400
Message-Id: <20221025084952.2139888-11-eesposit@redhat.com>
In-Reply-To: <20221025084952.2139888-1-eesposit@redhat.com>
References: <20221025084952.2139888-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c                            | 14 ++++----------
 block/export/export.c              |  2 +-
 blockdev.c                         | 22 +++++++++++-----------
 docs/devel/multiple-iothreads.txt  |  4 ++--
 include/block/block-global-state.h |  2 --
 job.c                              |  2 +-
 tests/unit/test-bdrv-drain.c       |  6 +++---
 tests/unit/test-block-iothread.c   | 10 +++++-----
 8 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/block.c b/block.c
index ad8bc167ee..f3ed0808eb 100644
--- a/block.c
+++ b/block.c
@@ -2904,7 +2904,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
-        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
+        bdrv_try_change_aio_context(bs, s->old_child_ctx, NULL, &error_abort);
     }
 
     if (bdrv_child_get_parent_aio_context(s->child) != s->old_parent_ctx) {
@@ -2975,7 +2975,8 @@ static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
     parent_ctx = bdrv_child_get_parent_aio_context(new_child);
     if (child_ctx != parent_ctx) {
         Error *local_err = NULL;
-        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
+        int ret = bdrv_try_change_aio_context(child_bs, parent_ctx, NULL,
+                                              &local_err);
 
         if (ret < 0 && child_class->change_aio_ctx) {
             Transaction *tran = tran_new();
@@ -3065,7 +3066,7 @@ static void bdrv_detach_child(BdrvChild *child)
          * When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext
          */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
+        bdrv_try_change_aio_context(old_bs, qemu_get_aio_context(), NULL, NULL);
     }
 }
 
@@ -7407,13 +7408,6 @@ int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
     return 0;
 }
 
-int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                             Error **errp)
-{
-    GLOBAL_STATE_CODE();
-    return bdrv_try_change_aio_context(bs, ctx, NULL, errp);
-}
-
 void bdrv_add_aio_context_notifier(BlockDriverState *bs,
         void (*attached_aio_context)(AioContext *new_context, void *opaque),
         void (*detach_aio_context)(void *opaque), void *opaque)
diff --git a/block/export/export.c b/block/export/export.c
index 4744862915..7cc0c25c1c 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -129,7 +129,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
 
         /* Ignore errors with fixed-iothread=false */
         set_context_errp = fixed_iothread ? errp : NULL;
-        ret = bdrv_try_set_aio_context(bs, new_ctx, set_context_errp);
+        ret = bdrv_try_change_aio_context(bs, new_ctx, NULL, set_context_errp);
         if (ret == 0) {
             aio_context_release(ctx);
             aio_context_acquire(new_ctx);
diff --git a/blockdev.c b/blockdev.c
index a32bafc07a..9dd88d14d0 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1630,8 +1630,8 @@ static void external_snapshot_abort(BlkActionState *common)
                 aio_context_release(aio_context);
                 aio_context_acquire(tmp_context);
 
-                ret = bdrv_try_set_aio_context(state->old_bs,
-                                               aio_context, NULL);
+                ret = bdrv_try_change_aio_context(state->old_bs,
+                                                  aio_context, NULL, NULL);
                 assert(ret == 0);
 
                 aio_context_release(tmp_context);
@@ -1792,12 +1792,12 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
         goto out;
     }
 
-    /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
+    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
     aio_context_release(aio_context);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
         aio_context_release(old_context);
@@ -1892,12 +1892,12 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
         return;
     }
 
-    /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
+    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
     aio_context = bdrv_get_aio_context(bs);
     old_context = bdrv_get_aio_context(target_bs);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
         aio_context_release(old_context);
         return;
@@ -3194,12 +3194,12 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
                     !bdrv_has_zero_init(target_bs)));
 
 
-    /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
+    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
     aio_context_release(aio_context);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
     if (ret < 0) {
         bdrv_unref(target_bs);
         aio_context_release(old_context);
@@ -3266,12 +3266,12 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
 
     zero_target = (sync == MIRROR_SYNC_MODE_FULL);
 
-    /* Honor bdrv_try_set_aio_context() context acquisition requirements. */
+    /* Honor bdrv_try_change_aio_context() context acquisition requirements. */
     old_context = bdrv_get_aio_context(target_bs);
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(old_context);
 
-    ret = bdrv_try_set_aio_context(target_bs, aio_context, errp);
+    ret = bdrv_try_change_aio_context(target_bs, aio_context, NULL, errp);
 
     aio_context_release(old_context);
     aio_context_acquire(aio_context);
@@ -3767,7 +3767,7 @@ void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
     old_context = bdrv_get_aio_context(bs);
     aio_context_acquire(old_context);
 
-    bdrv_try_set_aio_context(bs, new_context, errp);
+    bdrv_try_change_aio_context(bs, new_context, NULL, errp);
 
     aio_context_release(old_context);
 }
diff --git a/docs/devel/multiple-iothreads.txt b/docs/devel/multiple-iothreads.txt
index aeb997bed5..343120f2ef 100644
--- a/docs/devel/multiple-iothreads.txt
+++ b/docs/devel/multiple-iothreads.txt
@@ -109,7 +109,7 @@ The AioContext originates from the QEMU block layer, even though nowadays
 AioContext is a generic event loop that can be used by any QEMU subsystem.
 
 The block layer has support for AioContext integrated.  Each BlockDriverState
-is associated with an AioContext using bdrv_try_set_aio_context() and
+is associated with an AioContext using bdrv_try_change_aio_context() and
 bdrv_get_aio_context().  This allows block layer code to process I/O inside the
 right AioContext.  Other subsystems may wish to follow a similar approach.
 
@@ -134,5 +134,5 @@ Long-running jobs (usually in the form of coroutines) are best scheduled in
 the BlockDriverState's AioContext to avoid the need to acquire/release around
 each bdrv_*() call.  The functions bdrv_add/remove_aio_context_notifier,
 or alternatively blk_add/remove_aio_context_notifier if you use BlockBackends,
-can be used to get a notification whenever bdrv_try_set_aio_context() moves a
+can be used to get a notification whenever bdrv_try_change_aio_context() moves a
 BlockDriverState to a different AioContext.
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 8db3132e8f..73795a0095 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -220,8 +220,6 @@ void coroutine_fn bdrv_co_lock(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_unlock(BlockDriverState *bs);
 
-int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                             Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
diff --git a/job.c b/job.c
index 78feae05fb..72d57f0934 100644
--- a/job.c
+++ b/job.c
@@ -588,7 +588,7 @@ static void coroutine_fn job_do_yield_locked(Job *job, uint64_t ns)
     next_aio_context = job->aio_context;
     /*
      * Coroutine has resumed, but in the meanwhile the job AioContext
-     * might have changed via bdrv_try_set_aio_context(), so we need to move
+     * might have changed via bdrv_try_change_aio_context(), so we need to move
      * the coroutine too in the new aiocontext.
      */
     while (qemu_get_current_aio_context() != next_aio_context) {
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 0eecf14310..09dc4a4891 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1538,16 +1538,16 @@ static void test_set_aio_context(void)
                               &error_abort);
 
     bdrv_drained_begin(bs);
-    bdrv_try_set_aio_context(bs, ctx_a, &error_abort);
+    bdrv_try_change_aio_context(bs, ctx_a, NULL, &error_abort);
 
     aio_context_acquire(ctx_a);
     bdrv_drained_end(bs);
 
     bdrv_drained_begin(bs);
-    bdrv_try_set_aio_context(bs, ctx_b, &error_abort);
+    bdrv_try_change_aio_context(bs, ctx_b, NULL, &error_abort);
     aio_context_release(ctx_a);
     aio_context_acquire(ctx_b);
-    bdrv_try_set_aio_context(bs, qemu_get_aio_context(), &error_abort);
+    bdrv_try_change_aio_context(bs, qemu_get_aio_context(), NULL, &error_abort);
     aio_context_release(ctx_b);
     bdrv_drained_end(bs);
 
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index def0709b2b..8ca5adec5e 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -765,7 +765,7 @@ static void test_propagate_mirror(void)
     filter = bdrv_find_node("filter_node");
 
     /* Change the AioContext of src */
-    bdrv_try_set_aio_context(src, ctx, &error_abort);
+    bdrv_try_change_aio_context(src, ctx, NULL, &error_abort);
     g_assert(bdrv_get_aio_context(src) == ctx);
     g_assert(bdrv_get_aio_context(target) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
@@ -773,7 +773,7 @@ static void test_propagate_mirror(void)
 
     /* Change the AioContext of target */
     aio_context_acquire(ctx);
-    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
     aio_context_release(ctx);
     g_assert(bdrv_get_aio_context(src) == main_ctx);
     g_assert(bdrv_get_aio_context(target) == main_ctx);
@@ -783,7 +783,7 @@ static void test_propagate_mirror(void)
     blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
     blk_insert_bs(blk, src, &error_abort);
 
-    bdrv_try_set_aio_context(target, ctx, &local_err);
+    bdrv_try_change_aio_context(target, ctx, NULL, &local_err);
     error_free_or_abort(&local_err);
 
     g_assert(blk_get_aio_context(blk) == main_ctx);
@@ -794,7 +794,7 @@ static void test_propagate_mirror(void)
     /* ...unless we explicitly allow it */
     aio_context_acquire(ctx);
     blk_set_allow_aio_context_change(blk, true);
-    bdrv_try_set_aio_context(target, ctx, &error_abort);
+    bdrv_try_change_aio_context(target, ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
     g_assert(blk_get_aio_context(blk) == ctx);
@@ -806,7 +806,7 @@ static void test_propagate_mirror(void)
 
     aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
-    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
     blk_unref(blk);
-- 
2.31.1


