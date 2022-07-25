Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EDC57FF1A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:39:57 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxNM-0005SR-Nb
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5g-0002aR-TN
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5e-00065y-1B
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XerYKIamNmCB+98DrpjXdwOn/dQDkZtIG63giaAKlJg=;
 b=fSxfW10FoekUr315MzrWRNuh0TIEQ/A8zRpm16Ak4JMPmSgRWqiuE59jl2u0Xktfx3SeHa
 aGffi5fj/ja7lUleBk10F1Cwhf1pXfhwcWmo00QZ2jRzl7TtLNt1RK/37LQ9/2Ej1+2sGM
 SMWBoDwhexvsre5ajAzDjWnfrBrzMGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-Z24oC9CMNQWpE9qH6UYUgQ-1; Mon, 25 Jul 2022 08:21:32 -0400
X-MC-Unique: Z24oC9CMNQWpE9qH6UYUgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 294BA891093;
 Mon, 25 Jul 2022 12:21:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98C2A9457F;
 Mon, 25 Jul 2022 12:21:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 11/11] block: remove bdrv_try_set_aio_context and replace
 it with bdrv_try_change_aio_context
Date: Mon, 25 Jul 2022 08:21:20 -0400
Message-Id: <20220725122120.309236-12-eesposit@redhat.com>
In-Reply-To: <20220725122120.309236-1-eesposit@redhat.com>
References: <20220725122120.309236-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
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
index b82eb0ba6d..435e8fe731 100644
--- a/block.c
+++ b/block.c
@@ -2950,7 +2950,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     bdrv_replace_child_noperm(s->child, NULL, false);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
-        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
+        bdrv_try_change_aio_context(bs, s->old_child_ctx, NULL, &error_abort);
     }
 
     if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
@@ -3027,7 +3027,8 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     parent_ctx = bdrv_child_get_parent_aio_context(new_child);
     if (child_ctx != parent_ctx) {
         Error *local_err = NULL;
-        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
+        int ret = bdrv_try_change_aio_context(child_bs, parent_ctx, NULL,
+                                              &local_err);
 
         if (ret < 0 && child_class->change_aio_ctx) {
             Transaction *tran = tran_new();
@@ -3130,7 +3131,7 @@ static void bdrv_detach_child(BdrvChild **childp)
          * When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext
          */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
+        bdrv_try_change_aio_context(old_bs, qemu_get_aio_context(), NULL, NULL);
     }
 }
 
@@ -7535,13 +7536,6 @@ int bdrv_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
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
index 2cd84d206c..fb0ec67523 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1619,8 +1619,8 @@ static void external_snapshot_abort(BlkActionState *common)
                 aio_context_release(aio_context);
                 aio_context_acquire(tmp_context);
 
-                ret = bdrv_try_set_aio_context(state->old_bs,
-                                               aio_context, NULL);
+                ret = bdrv_try_change_aio_context(state->old_bs,
+                                                  aio_context, NULL, NULL);
                 assert(ret == 0);
 
                 aio_context_release(tmp_context);
@@ -1781,12 +1781,12 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
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
@@ -1881,12 +1881,12 @@ static void blockdev_backup_prepare(BlkActionState *common, Error **errp)
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
@@ -3183,12 +3183,12 @@ void qmp_drive_mirror(DriveMirror *arg, Error **errp)
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
@@ -3255,12 +3255,12 @@ void qmp_blockdev_mirror(bool has_job_id, const char *job_id,
 
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
@@ -3756,7 +3756,7 @@ void qmp_x_blockdev_set_iothread(const char *node_name, StrOrNull *iothread,
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
index 11f80768c3..3c5a8fb61b 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -217,8 +217,6 @@ void coroutine_fn bdrv_co_lock(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_unlock(BlockDriverState *bs);
 
-int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                             Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GHashTable *visited, Transaction *tran,
diff --git a/job.c b/job.c
index 747871c2e5..637bc6592c 100644
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
index 4924ceb562..e465e4349d 100644
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
index 9d7c8be00f..0626ab83a6 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -638,7 +638,7 @@ static void test_propagate_mirror(void)
     filter = bdrv_find_node("filter_node");
 
     /* Change the AioContext of src */
-    bdrv_try_set_aio_context(src, ctx, &error_abort);
+    bdrv_try_change_aio_context(src, ctx, NULL, &error_abort);
     g_assert(bdrv_get_aio_context(src) == ctx);
     g_assert(bdrv_get_aio_context(target) == ctx);
     g_assert(bdrv_get_aio_context(filter) == ctx);
@@ -646,7 +646,7 @@ static void test_propagate_mirror(void)
 
     /* Change the AioContext of target */
     aio_context_acquire(ctx);
-    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
     aio_context_release(ctx);
     g_assert(bdrv_get_aio_context(src) == main_ctx);
     g_assert(bdrv_get_aio_context(target) == main_ctx);
@@ -656,7 +656,7 @@ static void test_propagate_mirror(void)
     blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
     blk_insert_bs(blk, src, &error_abort);
 
-    bdrv_try_set_aio_context(target, ctx, &local_err);
+    bdrv_try_change_aio_context(target, ctx, NULL, &local_err);
     error_free_or_abort(&local_err);
 
     g_assert(blk_get_aio_context(blk) == main_ctx);
@@ -667,7 +667,7 @@ static void test_propagate_mirror(void)
     /* ...unless we explicitly allow it */
     aio_context_acquire(ctx);
     blk_set_allow_aio_context_change(blk, true);
-    bdrv_try_set_aio_context(target, ctx, &error_abort);
+    bdrv_try_change_aio_context(target, ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
     g_assert(blk_get_aio_context(blk) == ctx);
@@ -679,7 +679,7 @@ static void test_propagate_mirror(void)
 
     aio_context_acquire(ctx);
     blk_set_aio_context(blk, main_ctx, &error_abort);
-    bdrv_try_set_aio_context(target, main_ctx, &error_abort);
+    bdrv_try_change_aio_context(target, main_ctx, NULL, &error_abort);
     aio_context_release(ctx);
 
     blk_unref(blk);
-- 
2.31.1


