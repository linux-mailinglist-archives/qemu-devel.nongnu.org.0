Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 851EC6101A0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:28:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hR-0003d2-Ba; Thu, 27 Oct 2022 14:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gM-0001r0-FE
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gD-0002TA-0Z
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dN6+Eb7ouMYF8h7u/GP/tQyzFM36/cB48yWOqRxrj4=;
 b=bQpYlle09LEPmQVWnjWLcjXCWTGj50+cOgftl2kt/5GDSWMZTymmNUZ9Tb8A9H+3ZMxfgT
 rD/eawP39pzgF1KnZerK+Pz8XWczeTzFhv70VbRTZpVqcCSC/lQC5CKzV4y3IQtRGmWqEm
 hIaqRUolTx9rnmrLc6WFRPGu4CGf3GI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-bV0YrlKdNAK5isZ-EAfKUA-1; Thu, 27 Oct 2022 14:32:35 -0400
X-MC-Unique: bV0YrlKdNAK5isZ-EAfKUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBB1B85A59D;
 Thu, 27 Oct 2022 18:32:34 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17B861121320;
 Thu, 27 Oct 2022 18:32:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 24/58] block: use transactions as a replacement of
 ->{can_}set_aio_context()
Date: Thu, 27 Oct 2022 20:31:12 +0200
Message-Id: <20221027183146.463129-25-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Simplify the way the aiocontext can be changed in a BDS graph.
There are currently two problems in bdrv_try_set_aio_context:
- There is a confusion of AioContext locks taken and released, because
  we assume that old aiocontext is always taken and new one is
  taken inside.

- It doesn't look very safe to call bdrv_drained_begin while some
  nodes have already switched to the new aiocontext and others haven't.
  This could be especially dangerous because bdrv_drained_begin polls, so
  something else could be executed while graph is in an inconsistent
  state.

Additional minor nitpick: can_set and set_ callbacks both traverse the
graph, both using the ignored list of visited nodes in a different way.

Therefore, get rid of all of this and introduce a new callback,
change_aio_context, that uses transactions to efficiently, cleanly
and most importantly safely change the aiocontext of a graph.

This new callback is a "merge" of the two previous ones:
- Just like can_set_aio_context, recursively traverses the graph.
  Marks all nodes that are visited using a GList, and checks if
  they *could* change the aio_context.
- For each node that passes the above check, drain it and add a new transaction
  that implements a callback that effectively changes the aiocontext.
- Once done, the recursive function returns if *all* nodes can change
  the AioContext. If so, commit the above transactions.
  Regardless of the outcome, call transaction.clean() to undo all drains
  done in the recursion.
- The transaction list is scanned only after all nodes are being drained, so
  we are sure that they all are in the same context, and then
  we switch their AioContext, concluding the drain only after all nodes
  switched to the new AioContext. In this way we make sure that
  bdrv_drained_begin() is always called under the old AioContext, and
  bdrv_drained_end() under the new one.
- Because of the above, we don't need to release and re-acquire the
  old AioContext every time, as everything is done once (and not
  per-node drain and aiocontext change).

Note that the "change" API is not yet invoked anywhere.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20221025084952.2139888-3-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h |   6 +
 include/block/block_int-common.h   |   3 +
 block.c                            | 220 ++++++++++++++++++++++++++++-
 3 files changed, 228 insertions(+), 1 deletion(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 29a38d7e18..7b0095b419 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -232,6 +232,12 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 
+bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
+                                   GSList **visited, Transaction *tran,
+                                   Error **errp);
+int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                      BdrvChild *ignore_child, Error **errp);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 1f300ee7f6..9067a99249 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -910,6 +910,9 @@ struct BdrvChildClass {
                         GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
 
+    bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
+                           GSList **visited, Transaction *tran, Error **errp);
+
     AioContext *(*get_parent_aio_context)(BdrvChild *child);
 
     /*
diff --git a/block.c b/block.c
index 4d727aa38c..38e5d831ca 100644
--- a/block.c
+++ b/block.c
@@ -104,6 +104,10 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
 static bool bdrv_backing_overridden(BlockDriverState *bs);
 
+static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                    GSList **visited, Transaction *tran,
+                                    Error **errp);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -7196,7 +7200,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
  * must not own the AioContext lock for new_context (unless new_context is the
  * same as the current context of bs).
  *
- * @ignore will accumulate all visited BdrvChild object. The caller is
+ * @ignore will accumulate all visited BdrvChild objects. The caller is
  * responsible for freeing the list afterwards.
  */
 void bdrv_set_aio_context_ignore(BlockDriverState *bs,
@@ -7305,6 +7309,38 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
     return true;
 }
 
+typedef struct BdrvStateSetAioContext {
+    AioContext *new_ctx;
+    BlockDriverState *bs;
+} BdrvStateSetAioContext;
+
+static bool bdrv_parent_change_aio_context(BdrvChild *c, AioContext *ctx,
+                                           GSList **visited, Transaction *tran,
+                                           Error **errp)
+{
+    GLOBAL_STATE_CODE();
+    if (g_slist_find(*visited, c)) {
+        return true;
+    }
+    *visited = g_slist_prepend(*visited, c);
+
+    /*
+     * A BdrvChildClass that doesn't handle AioContext changes cannot
+     * tolerate any AioContext changes
+     */
+    if (!c->klass->change_aio_ctx) {
+        char *user = bdrv_child_user_desc(c);
+        error_setg(errp, "Changing iothreads is not supported by %s", user);
+        g_free(user);
+        return false;
+    }
+    if (!c->klass->change_aio_ctx(c, ctx, visited, tran, errp)) {
+        assert(!errp || *errp);
+        return false;
+    }
+    return true;
+}
+
 bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp)
 {
@@ -7316,6 +7352,18 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
     return bdrv_can_set_aio_context(c->bs, ctx, ignore, errp);
 }
 
+bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
+                                   GSList **visited, Transaction *tran,
+                                   Error **errp)
+{
+    GLOBAL_STATE_CODE();
+    if (g_slist_find(*visited, c)) {
+        return true;
+    }
+    *visited = g_slist_prepend(*visited, c);
+    return bdrv_change_aio_context(c->bs, ctx, visited, tran, errp);
+}
+
 /* @ignore will accumulate all visited BdrvChild object. The caller is
  * responsible for freeing the list afterwards. */
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
@@ -7343,6 +7391,98 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return true;
 }
 
+static void bdrv_set_aio_context_clean(void *opaque)
+{
+    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
+    BlockDriverState *bs = (BlockDriverState *) state->bs;
+
+    /* Paired with bdrv_drained_begin in bdrv_change_aio_context() */
+    bdrv_drained_end(bs);
+
+    g_free(state);
+}
+
+static void bdrv_set_aio_context_commit(void *opaque)
+{
+    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
+    BlockDriverState *bs = (BlockDriverState *) state->bs;
+    AioContext *new_context = state->new_ctx;
+    AioContext *old_context = bdrv_get_aio_context(bs);
+    assert_bdrv_graph_writable(bs);
+
+    /*
+     * Take the old AioContex when detaching it from bs.
+     * At this point, new_context lock is already acquired, and we are now
+     * also taking old_context. This is safe as long as bdrv_detach_aio_context
+     * does not call AIO_POLL_WHILE().
+     */
+    if (old_context != qemu_get_aio_context()) {
+        aio_context_acquire(old_context);
+    }
+    bdrv_detach_aio_context(bs);
+    if (old_context != qemu_get_aio_context()) {
+        aio_context_release(old_context);
+    }
+    bdrv_attach_aio_context(bs, new_context);
+}
+
+static TransactionActionDrv set_aio_context = {
+    .commit = bdrv_set_aio_context_commit,
+    .clean = bdrv_set_aio_context_clean,
+};
+
+/*
+ * Changes the AioContext used for fd handlers, timers, and BHs by this
+ * BlockDriverState and all its children and parents.
+ *
+ * Must be called from the main AioContext.
+ *
+ * The caller must own the AioContext lock for the old AioContext of bs, but it
+ * must not own the AioContext lock for new_context (unless new_context is the
+ * same as the current context of bs).
+ *
+ * @visited will accumulate all visited BdrvChild objects. The caller is
+ * responsible for freeing the list afterwards.
+ */
+static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                    GSList **visited, Transaction *tran,
+                                    Error **errp)
+{
+    BdrvChild *c;
+    BdrvStateSetAioContext *state;
+
+    GLOBAL_STATE_CODE();
+
+    if (bdrv_get_aio_context(bs) == ctx) {
+        return true;
+    }
+
+    QLIST_FOREACH(c, &bs->parents, next_parent) {
+        if (!bdrv_parent_change_aio_context(c, ctx, visited, tran, errp)) {
+            return false;
+        }
+    }
+
+    QLIST_FOREACH(c, &bs->children, next) {
+        if (!bdrv_child_change_aio_context(c, ctx, visited, tran, errp)) {
+            return false;
+        }
+    }
+
+    state = g_new(BdrvStateSetAioContext, 1);
+    *state = (BdrvStateSetAioContext) {
+        .new_ctx = ctx,
+        .bs = bs,
+    };
+
+    /* Paired with bdrv_drained_end in bdrv_set_aio_context_clean() */
+    bdrv_drained_begin(bs);
+
+    tran_add(tran, &set_aio_context, state);
+
+    return true;
+}
+
 int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                                    BdrvChild *ignore_child, Error **errp)
 {
@@ -7366,6 +7506,84 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return 0;
 }
 
+/*
+ * Change bs's and recursively all of its parents' and children's AioContext
+ * to the given new context, returning an error if that isn't possible.
+ *
+ * If ignore_child is not NULL, that child (and its subgraph) will not
+ * be touched.
+ *
+ * This function still requires the caller to take the bs current
+ * AioContext lock, otherwise draining will fail since AIO_WAIT_WHILE
+ * assumes the lock is always held if bs is in another AioContext.
+ * For the same reason, it temporarily also holds the new AioContext, since
+ * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
+ * Therefore the new AioContext lock must not be taken by the caller.
+ */
+int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                      BdrvChild *ignore_child, Error **errp)
+{
+    Transaction *tran;
+    GSList *visited;
+    int ret;
+    AioContext *old_context = bdrv_get_aio_context(bs);
+    GLOBAL_STATE_CODE();
+
+    /*
+     * Recursion phase: go through all nodes of the graph.
+     * Take care of checking that all nodes support changing AioContext
+     * and drain them, builing a linear list of callbacks to run if everything
+     * is successful (the transaction itself).
+     */
+    tran = tran_new();
+    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
+    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
+    g_slist_free(visited);
+
+    /*
+     * Linear phase: go through all callbacks collected in the transaction.
+     * Run all callbacks collected in the recursion to switch all nodes
+     * AioContext lock (transaction commit), or undo all changes done in the
+     * recursion (transaction abort).
+     */
+
+    if (!ret) {
+        /* Just run clean() callbacks. No AioContext changed. */
+        tran_abort(tran);
+        return -EPERM;
+    }
+
+    /*
+     * Release old AioContext, it won't be needed anymore, as all
+     * bdrv_drained_begin() have been called already.
+     */
+    if (qemu_get_aio_context() != old_context) {
+        aio_context_release(old_context);
+    }
+
+    /*
+     * Acquire new AioContext since bdrv_drained_end() is going to be called
+     * after we switched all nodes in the new AioContext, and the function
+     * assumes that the lock of the bs is always taken.
+     */
+    if (qemu_get_aio_context() != ctx) {
+        aio_context_acquire(ctx);
+    }
+
+    tran_commit(tran);
+
+    if (qemu_get_aio_context() != ctx) {
+        aio_context_release(ctx);
+    }
+
+    /* Re-acquire the old AioContext, since the caller takes and releases it. */
+    if (qemu_get_aio_context() != old_context) {
+        aio_context_acquire(old_context);
+    }
+
+    return 0;
+}
+
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
-- 
2.37.3


