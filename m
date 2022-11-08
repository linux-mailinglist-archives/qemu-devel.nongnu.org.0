Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 958A6621155
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 13:48:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osNrn-0007lf-Mg; Tue, 08 Nov 2022 07:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNrh-0007hZ-9k
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1osNre-0000il-KD
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 07:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667911081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vheh6oYRhEllMER/a/juSrdPMY9WMiojYAA0IfegZCE=;
 b=OAx0RYh5YZO3ETCKzn/Kep8S8vT37UBthHgICEZZZyg0b1P/fRgf2rEqdwicl5VJtk6yoU
 Q5f7+fcAqn8mOHqitZVhThe6k0IzB8bVA0nepphwkHwlmB3WnwtX6uAy9Pe+kfCnTJZZU9
 XnN2j7f/xGgoeNCzLnXjcUDYvhfqyTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-Te1R2edAP0KbyAmIIbSmig-1; Tue, 08 Nov 2022 07:37:58 -0500
X-MC-Unique: Te1R2edAP0KbyAmIIbSmig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 658848001B8;
 Tue,  8 Nov 2022 12:37:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FCC09E70;
 Tue,  8 Nov 2022 12:37:57 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 04/13] block: Remove drained_end_counter
Date: Tue,  8 Nov 2022 13:37:29 +0100
Message-Id: <20221108123738.530873-5-kwolf@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
References: <20221108123738.530873-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

drained_end_counter is unused now, nobody changes its value any more. It
can be removed.

In cases where we had two almost identical functions that only differed
in whether the caller passes drained_end_counter, or whether they would
poll for a local drained_end_counter to reach 0, these become a single
function.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-io.h         | 15 -----
 include/block/block_int-common.h |  6 +-
 block.c                          |  5 +-
 block/block-backend.c            |  4 +-
 block/io.c                       | 97 ++++++++------------------------
 blockjob.c                       |  2 +-
 6 files changed, 30 insertions(+), 99 deletions(-)

diff --git a/include/block/block-io.h b/include/block/block-io.h
index 770ddeb7c8..97e9ae8bee 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -235,21 +235,6 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, int64_t src_offset,
                                     int64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
 
-/**
- * bdrv_drained_end_no_poll:
- *
- * Same as bdrv_drained_end(), but do not poll for the subgraph to
- * actually become unquiesced.  Therefore, no graph changes will occur
- * with this function.
- *
- * *drained_end_counter is incremented for every background operation
- * that is scheduled, and will be decremented for every operation once
- * it settles.  The caller must poll until it reaches 0.  The counter
- * should be accessed using atomic operations only.
- */
-void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter);
-
-
 /*
  * "I/O or GS" API functions. These functions can run without
  * the BQL, but only in one specific iothread/main loop.
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 0956acbb60..6504db4fd9 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -939,15 +939,11 @@ struct BdrvChildClass {
      * These functions must not change the graph (and therefore also must not
      * call aio_poll(), which could change the graph indirectly).
      *
-     * If drained_end() schedules background operations, it must atomically
-     * increment *drained_end_counter for each such operation and atomically
-     * decrement it once the operation has settled.
-     *
      * Note that this can be nested. If drained_begin() was called twice, new
      * I/O is allowed only after drained_end() was called twice, too.
      */
     void (*drained_begin)(BdrvChild *child);
-    void (*drained_end)(BdrvChild *child, int *drained_end_counter);
+    void (*drained_end)(BdrvChild *child);
 
     /*
      * Returns whether the parent has pending requests for the child. This
diff --git a/block.c b/block.c
index fed8077993..7a24bd4c36 100644
--- a/block.c
+++ b/block.c
@@ -1227,11 +1227,10 @@ static bool bdrv_child_cb_drained_poll(BdrvChild *child)
     return bdrv_drain_poll(bs, false, NULL, false);
 }
 
-static void bdrv_child_cb_drained_end(BdrvChild *child,
-                                      int *drained_end_counter)
+static void bdrv_child_cb_drained_end(BdrvChild *child)
 {
     BlockDriverState *bs = child->opaque;
-    bdrv_drained_end_no_poll(bs, drained_end_counter);
+    bdrv_drained_end(bs);
 }
 
 static int bdrv_child_cb_inactivate(BdrvChild *child)
diff --git a/block/block-backend.c b/block/block-backend.c
index c0c7d56c8d..ecdfeb49bb 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -129,7 +129,7 @@ static void blk_root_inherit_options(BdrvChildRole role, bool parent_is_format,
 }
 static void blk_root_drained_begin(BdrvChild *child);
 static bool blk_root_drained_poll(BdrvChild *child);
-static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter);
+static void blk_root_drained_end(BdrvChild *child);
 
 static void blk_root_change_media(BdrvChild *child, bool load);
 static void blk_root_resize(BdrvChild *child);
@@ -2549,7 +2549,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
     return busy || !!blk->in_flight;
 }
 
-static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
+static void blk_root_drained_end(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     assert(blk->quiesce_counter);
diff --git a/block/io.c b/block/io.c
index 183b407f5b..41e6121c31 100644
--- a/block/io.c
+++ b/block/io.c
@@ -58,27 +58,19 @@ static void bdrv_parent_drained_begin(BlockDriverState *bs, BdrvChild *ignore,
     }
 }
 
-static void bdrv_parent_drained_end_single_no_poll(BdrvChild *c,
-                                                   int *drained_end_counter)
+void bdrv_parent_drained_end_single(BdrvChild *c)
 {
+    IO_OR_GS_CODE();
+
     assert(c->parent_quiesce_counter > 0);
     c->parent_quiesce_counter--;
     if (c->klass->drained_end) {
-        c->klass->drained_end(c, drained_end_counter);
+        c->klass->drained_end(c);
     }
 }
 
-void bdrv_parent_drained_end_single(BdrvChild *c)
-{
-    int drained_end_counter = 0;
-    IO_OR_GS_CODE();
-    bdrv_parent_drained_end_single_no_poll(c, &drained_end_counter);
-    BDRV_POLL_WHILE(c->bs, qatomic_read(&drained_end_counter) > 0);
-}
-
 static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore,
-                                    bool ignore_bds_parents,
-                                    int *drained_end_counter)
+                                    bool ignore_bds_parents)
 {
     BdrvChild *c;
 
@@ -86,7 +78,7 @@ static void bdrv_parent_drained_end(BlockDriverState *bs, BdrvChild *ignore,
         if (c == ignore || (ignore_bds_parents && c->klass->parent_is_bds)) {
             continue;
         }
-        bdrv_parent_drained_end_single_no_poll(c, drained_end_counter);
+        bdrv_parent_drained_end_single(c);
     }
 }
 
@@ -247,12 +239,10 @@ typedef struct {
     bool poll;
     BdrvChild *parent;
     bool ignore_bds_parents;
-    int *drained_end_counter;
 } BdrvCoDrainData;
 
 /* Recursively call BlockDriver.bdrv_drain_begin/end callbacks */
-static void bdrv_drain_invoke(BlockDriverState *bs, bool begin,
-                              int *drained_end_counter)
+static void bdrv_drain_invoke(BlockDriverState *bs, bool begin)
 {
     if (!bs->drv || (begin && !bs->drv->bdrv_drain_begin) ||
             (!begin && !bs->drv->bdrv_drain_end)) {
@@ -303,8 +293,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
                                   BdrvChild *parent, bool ignore_bds_parents,
                                   bool poll);
 static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
-                                BdrvChild *parent, bool ignore_bds_parents,
-                                int *drained_end_counter);
+                                BdrvChild *parent, bool ignore_bds_parents);
 
 static void bdrv_co_drain_bh_cb(void *opaque)
 {
@@ -317,14 +306,12 @@ static void bdrv_co_drain_bh_cb(void *opaque)
         aio_context_acquire(ctx);
         bdrv_dec_in_flight(bs);
         if (data->begin) {
-            assert(!data->drained_end_counter);
             bdrv_do_drained_begin(bs, data->recursive, data->parent,
                                   data->ignore_bds_parents, data->poll);
         } else {
             assert(!data->poll);
             bdrv_do_drained_end(bs, data->recursive, data->parent,
-                                data->ignore_bds_parents,
-                                data->drained_end_counter);
+                                data->ignore_bds_parents);
         }
         aio_context_release(ctx);
     } else {
@@ -340,8 +327,7 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
                                                 bool begin, bool recursive,
                                                 BdrvChild *parent,
                                                 bool ignore_bds_parents,
-                                                bool poll,
-                                                int *drained_end_counter)
+                                                bool poll)
 {
     BdrvCoDrainData data;
     Coroutine *self = qemu_coroutine_self();
@@ -361,7 +347,6 @@ static void coroutine_fn bdrv_co_yield_to_drain(BlockDriverState *bs,
         .parent = parent,
         .ignore_bds_parents = ignore_bds_parents,
         .poll = poll,
-        .drained_end_counter = drained_end_counter,
     };
 
     if (bs) {
@@ -404,7 +389,7 @@ void bdrv_do_drained_begin_quiesce(BlockDriverState *bs,
     }
 
     bdrv_parent_drained_begin(bs, parent, ignore_bds_parents);
-    bdrv_drain_invoke(bs, true, NULL);
+    bdrv_drain_invoke(bs, true);
 }
 
 static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
@@ -415,7 +400,7 @@ static void bdrv_do_drained_begin(BlockDriverState *bs, bool recursive,
 
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, true, recursive, parent, ignore_bds_parents,
-                               poll, NULL);
+                               poll);
         return;
     }
 
@@ -459,38 +444,24 @@ void bdrv_subtree_drained_begin(BlockDriverState *bs)
 
 /**
  * This function does not poll, nor must any of its recursively called
- * functions.  The *drained_end_counter pointee will be incremented
- * once for every background operation scheduled, and decremented once
- * the operation settles.  Therefore, the pointer must remain valid
- * until the pointee reaches 0.  That implies that whoever sets up the
- * pointee has to poll until it is 0.
- *
- * We use atomic operations to access *drained_end_counter, because
- * (1) when called from bdrv_set_aio_context_ignore(), the subgraph of
- *     @bs may contain nodes in different AioContexts,
- * (2) bdrv_drain_all_end() uses the same counter for all nodes,
- *     regardless of which AioContext they are in.
+ * functions.
  */
 static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
-                                BdrvChild *parent, bool ignore_bds_parents,
-                                int *drained_end_counter)
+                                BdrvChild *parent, bool ignore_bds_parents)
 {
     BdrvChild *child;
     int old_quiesce_counter;
 
-    assert(drained_end_counter != NULL);
-
     if (qemu_in_coroutine()) {
         bdrv_co_yield_to_drain(bs, false, recursive, parent, ignore_bds_parents,
-                               false, drained_end_counter);
+                               false);
         return;
     }
     assert(bs->quiesce_counter > 0);
 
     /* Re-enable things in child-to-parent order */
-    bdrv_drain_invoke(bs, false, drained_end_counter);
-    bdrv_parent_drained_end(bs, parent, ignore_bds_parents,
-                            drained_end_counter);
+    bdrv_drain_invoke(bs, false);
+    bdrv_parent_drained_end(bs, parent, ignore_bds_parents);
 
     old_quiesce_counter = qatomic_fetch_dec(&bs->quiesce_counter);
     if (old_quiesce_counter == 1) {
@@ -501,32 +472,21 @@ static void bdrv_do_drained_end(BlockDriverState *bs, bool recursive,
         assert(!ignore_bds_parents);
         bs->recursive_quiesce_counter--;
         QLIST_FOREACH(child, &bs->children, next) {
-            bdrv_do_drained_end(child->bs, true, child, ignore_bds_parents,
-                                drained_end_counter);
+            bdrv_do_drained_end(child->bs, true, child, ignore_bds_parents);
         }
     }
 }
 
 void bdrv_drained_end(BlockDriverState *bs)
 {
-    int drained_end_counter = 0;
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, false, NULL, false, &drained_end_counter);
-    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
-}
-
-void bdrv_drained_end_no_poll(BlockDriverState *bs, int *drained_end_counter)
-{
-    IO_CODE();
-    bdrv_do_drained_end(bs, false, NULL, false, drained_end_counter);
+    bdrv_do_drained_end(bs, false, NULL, false);
 }
 
 void bdrv_subtree_drained_end(BlockDriverState *bs)
 {
-    int drained_end_counter = 0;
     IO_OR_GS_CODE();
-    bdrv_do_drained_end(bs, true, NULL, false, &drained_end_counter);
-    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
+    bdrv_do_drained_end(bs, true, NULL, false);
 }
 
 void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
@@ -541,16 +501,12 @@ void bdrv_apply_subtree_drain(BdrvChild *child, BlockDriverState *new_parent)
 
 void bdrv_unapply_subtree_drain(BdrvChild *child, BlockDriverState *old_parent)
 {
-    int drained_end_counter = 0;
     int i;
     IO_OR_GS_CODE();
 
     for (i = 0; i < old_parent->recursive_quiesce_counter; i++) {
-        bdrv_do_drained_end(child->bs, true, child, false,
-                            &drained_end_counter);
+        bdrv_do_drained_end(child->bs, true, child, false);
     }
-
-    BDRV_POLL_WHILE(child->bs, qatomic_read(&drained_end_counter) > 0);
 }
 
 void bdrv_drain(BlockDriverState *bs)
@@ -608,7 +564,7 @@ void bdrv_drain_all_begin(void)
     GLOBAL_STATE_CODE();
 
     if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true, NULL);
+        bdrv_co_yield_to_drain(NULL, true, false, NULL, true, true);
         return;
     }
 
@@ -647,22 +603,19 @@ void bdrv_drain_all_begin(void)
 
 void bdrv_drain_all_end_quiesce(BlockDriverState *bs)
 {
-    int drained_end_counter = 0;
     GLOBAL_STATE_CODE();
 
     g_assert(bs->quiesce_counter > 0);
     g_assert(!bs->refcnt);
 
     while (bs->quiesce_counter) {
-        bdrv_do_drained_end(bs, false, NULL, true, &drained_end_counter);
+        bdrv_do_drained_end(bs, false, NULL, true);
     }
-    BDRV_POLL_WHILE(bs, qatomic_read(&drained_end_counter) > 0);
 }
 
 void bdrv_drain_all_end(void)
 {
     BlockDriverState *bs = NULL;
-    int drained_end_counter = 0;
     GLOBAL_STATE_CODE();
 
     /*
@@ -678,13 +631,11 @@ void bdrv_drain_all_end(void)
         AioContext *aio_context = bdrv_get_aio_context(bs);
 
         aio_context_acquire(aio_context);
-        bdrv_do_drained_end(bs, false, NULL, true, &drained_end_counter);
+        bdrv_do_drained_end(bs, false, NULL, true);
         aio_context_release(aio_context);
     }
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
-    AIO_WAIT_WHILE(NULL, qatomic_read(&drained_end_counter) > 0);
-
     assert(bdrv_drain_all_count > 0);
     bdrv_drain_all_count--;
 }
diff --git a/blockjob.c b/blockjob.c
index 2d86014fa5..43d0db1f94 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -120,7 +120,7 @@ static bool child_job_drained_poll(BdrvChild *c)
     }
 }
 
-static void child_job_drained_end(BdrvChild *c, int *drained_end_counter)
+static void child_job_drained_end(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
     job_resume(&job->job);
-- 
2.38.1


