Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6B57FF08
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:34:05 +0200 (CEST)
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxHg-0006fT-CZ
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5Z-0002Xc-Ez
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oFx5U-00061p-Ir
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658751688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oN5wWzOsRyt5FOcDC3/xM5sconI9JSHzEbmmUPdeX8c=;
 b=EbNbV84FVxjagqIKL++VV5ziQOipajA76xCPjGSLD0dJe1BVg1BjbYrKu/viuD6w5qnVLw
 15AUzR4pWsBRCO9fMtfbTa70Mi387HrNtpj0PjFrUCCOQhhIEcmdrHynbDmRBtz18dg1wY
 KqGGHpB99/znbCxkitAG5GGBRzD0G7I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-27-zOjS2PayPPOlF2sfl0KQuw-1; Mon, 25 Jul 2022 08:21:26 -0400
X-MC-Unique: zOjS2PayPPOlF2sfl0KQuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D84E2999B2D;
 Mon, 25 Jul 2022 12:21:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 251D9909FE;
 Mon, 25 Jul 2022 12:21:23 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH v2 02/11] block: use transactions as a replacement of
 ->{can_}set_aio_context()
Date: Mon, 25 Jul 2022 08:21:11 -0400
Message-Id: <20220725122120.309236-3-eesposit@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 block.c                            | 203 ++++++++++++++++++++++++++++-
 include/block/block-global-state.h |   6 +
 include/block/block_int-common.h   |   3 +
 3 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 58a9cfc8b7..c80e49009a 100644
--- a/block.c
+++ b/block.c
@@ -108,6 +108,10 @@ static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
 static bool bdrv_backing_overridden(BlockDriverState *bs);
 
+static bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                    GSList **visited, Transaction *tran,
+                                    Error **errp);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -7325,7 +7329,7 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
  * must not own the AioContext lock for new_context (unless new_context is the
  * same as the current context of bs).
  *
- * @ignore will accumulate all visited BdrvChild object. The caller is
+ * @ignore will accumulate all visited BdrvChild objects. The caller is
  * responsible for freeing the list afterwards.
  */
 void bdrv_set_aio_context_ignore(BlockDriverState *bs,
@@ -7434,6 +7438,38 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
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
@@ -7445,6 +7481,18 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
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
@@ -7472,6 +7520,85 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return true;
 }
 
+static void bdrv_drained_end_clean(void *opaque)
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
+    assert_bdrv_graph_writable(bs);
+
+    bdrv_detach_aio_context(bs);
+    bdrv_attach_aio_context(bs, new_context);
+}
+
+static TransactionActionDrv set_aio_context = {
+    .commit = bdrv_set_aio_context_commit,
+    .clean = bdrv_drained_end_clean,
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
+ * @visited will accumulate all visited BdrvChild object. The caller is
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
+    /* Paired with bdrv_drained_end in bdrv_drained_end_clean() */
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
@@ -7495,6 +7622,80 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return 0;
 }
 
+/*
+ * Change bs's and recursively all of its parents' and children's AioContext
+ * to the given new context, returning an error if that isn't possible.
+ *
+ * There are two phases: recursion check and linear change
+ * Recursion takes care of checking that all nodes support changing AioContext
+ * and drains them, builing a linear list of callbacks to run if it is
+ * successful (the transaction itself).
+ * Linear change consists in running all callbacks collected in the recursion
+ * to switch all nodes AioContext lock (transaction commit).
+ *
+ * If ignore_child is not NULL, that child (and its subgraph) will not
+ * be touched.
+ *
+ * This function still requires the caller to take the bs current
+ * AioContext lock, otherwise draining will fail since AIO_WAIT_WHILE
+ * assumes the lock is always held if bs is in another AioContext.
+ * For the same reason, it temporarily holds also the new AioContext, since
+ * bdrv_drained_end calls BDRV_POLL_WHILE that assumes the lock is taken too.
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
+    /* Recursion phase: go through all nodes of the graph */
+    tran = tran_new();
+    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
+    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
+    g_slist_free(visited);
+
+    /* Linear phase: go through all callbacks collected in the transaction */
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
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 21265e3966..fdcb81a175 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -229,6 +229,12 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
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
index 8947abab76..43828cf74f 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -896,6 +896,9 @@ struct BdrvChildClass {
                         GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
 
+    bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
+                           GSList **visited, Transaction *tran, Error **errp);
+
     AioContext *(*get_parent_aio_context)(BdrvChild *child);
 
     /*
-- 
2.31.1


