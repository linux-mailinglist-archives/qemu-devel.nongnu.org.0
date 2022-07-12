Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9688057289E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:28:28 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNQh-0008GJ-ON
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNIL-0002uv-9g
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNI0-0002Ls-7B
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WWecrIp5grNRw02rHzhY/pOKGKu5Ck6LqGuw+60u3jA=;
 b=Rl0pX8LsUJvykHXhlbyRh+UfrE2wMh/ZU656NaMnGD1SMz/Ss2kWUXgx2CxzXM8V2V6q0q
 5EO0u9G7UOyRcdaIeESv2R+q8ELCY+NObu3jY078khCWjSRsnIeoacjJTlh7Yf+d7Iun5P
 /fcXXFYuAWWvCUUQ+cPdxCyCAdvK/QI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-bpfnTv5-P6ek1aI8kEkeXQ-1; Tue, 12 Jul 2022 17:19:18 -0400
X-MC-Unique: bpfnTv5-P6ek1aI8kEkeXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF930101A595;
 Tue, 12 Jul 2022 21:19:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3582166B2A;
 Tue, 12 Jul 2022 21:19:16 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 3/8] RFC: block: use transactions as a replacement of
 ->{can_}set_aio_context()
Date: Tue, 12 Jul 2022 17:19:06 -0400
Message-Id: <20220712211911.1302836-4-eesposit@redhat.com>
In-Reply-To: <20220712211911.1302836-1-eesposit@redhat.com>
References: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

---------
RFC because I am not sure about the AioContext locks.
- Do we need to take the new AioContext lock? what does it protect?
- Taking the old AioContext lock is required now, because of
  bdrv_drained_begin calling AIO_WAIT_WHILE that unlocks the
  aiocontext. If we replace it with AIO_WAIT_WHILE_UNLOCKED,
  could we get rid of taking every time the old AioContext?
  drain would be enough to protect the graph modification.
----------

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
- For each node that passes the above check, add a new transaction
  that implements a callback that effectively changes the aiocontext.
- If a node is a BDS, add two transactions: one taking care of draining
  the node at the beginning of the list (so that will be executed first)
  and one at the end taking care of changing the AioContext.
- Once done, the recursive function returns if *all* nodes can change
  the AioContext. If so, commit the above transactions. Otherwise don't
  do anything.
- The transaction list contains first all "drain" transactions, so
  we are sure we are draining all nodes in the same context, and then
  all the other switch the AioContext. In this way we make sure that
  bdrv_drained_begin() is always called under the old AioContext, and
  bdrv_drained_end() under the new one.
- Because of the above, we don't need to release and re-acquire the
  old AioContext every time, as everything is done once (and not
  per-node drain and aiocontext change).

Note that the "change" API is not yet invoked anywhere.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 197 +++++++++++++++++++++++++++++
 include/block/block-global-state.h |   9 ++
 include/block/block_int-common.h   |   3 +
 3 files changed, 209 insertions(+)

diff --git a/block.c b/block.c
index 267a39c0de..bda4e1bcef 100644
--- a/block.c
+++ b/block.c
@@ -7437,6 +7437,51 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
     return true;
 }
 
+typedef struct BdrvStateSetAioContext {
+    AioContext *new_ctx;
+    BlockDriverState *bs;
+} BdrvStateSetAioContext;
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
@@ -7448,6 +7493,18 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
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
@@ -7475,6 +7532,99 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return true;
 }
 
+static void bdrv_drained_begin_commit(void *opaque)
+{
+    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
+
+    /* Paired with bdrv_drained_end in bdrv_drained_end_clean() */
+    bdrv_drained_begin(state->bs);
+}
+
+static void bdrv_drained_end_clean(void *opaque)
+{
+    BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
+    BlockDriverState *bs = (BlockDriverState *) state->bs;
+    AioContext *new_context = state->new_ctx;
+
+    /*
+     * drain only if bdrv_drained_begin_commit() and
+     * bdrv_set_aio_context_commit() executed
+     */
+    if (bdrv_get_aio_context(bs) == new_context) {
+        /* Paired with bdrv_drained_begin in bdrv_drained_begin_commit() */
+        bdrv_drained_end(bs);
+    }
+
+    /* state is freed by set_aio_context->clean() */
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
+    .clean = g_free,
+};
+
+static TransactionActionDrv drained_begin_end = {
+    .commit = bdrv_drained_begin_commit,
+    .clean = bdrv_drained_end_clean,
+};
+
+/*
+ * @visited will accumulate all visited BdrvChild object. The caller is
+ * responsible for freeing the list afterwards.
+ */
+bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                             GSList **visited, Transaction *tran,
+                             Error **errp)
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
+    /* First half of transactions are drains */
+    tran_add(tran, &drained_begin_end, state);
+    /*
+     * Second half of transactions takes care of setting the
+     * AioContext and free the state
+     */
+    tran_add_tail(tran, &set_aio_context, state);
+
+    return true;
+}
+
 int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                                    BdrvChild *ignore_child, Error **errp)
 {
@@ -7498,6 +7648,53 @@ int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
     return 0;
 }
 
+/*
+ * First, go recursively through all nodes in the graph, and see if they
+ * can change their AioContext.
+ * If so, add for each node a new transaction with a callback to change the
+ * AioContext with the new one.
+ * Once recursion is completed, if all nodes are allowed to change their
+ * AioContext then commit the transaction, running all callbacks in order.
+ * Otherwise don't do anything.
+ *
+ * This function still requires the caller to take the bs current
+ * AioContext lock, otherwise draining could fail since AIO_WAIT_WHILE
+ * assumes the lock is always held if bs is in another AioContext.
+ */
+int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                      BdrvChild *ignore_child, Error **errp)
+{
+    Transaction *tran;
+    GSList *visited;
+    int ret;
+    GLOBAL_STATE_CODE();
+
+    tran = tran_new();
+    visited = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
+    ret = bdrv_change_aio_context(bs, ctx, &visited, tran, errp);
+    g_slist_free(visited);
+
+    if (!ret) {
+        /* just run clean() callbacks */
+        tran_abort(tran);
+        return -EPERM;
+    }
+
+    /* Acquire the new context, if necessary */
+    /* TODO: why do we need to take this AioContext lock? */
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
+    return 0;
+}
+
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp)
 {
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 21265e3966..5847b64f95 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -229,6 +229,15 @@ bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
 
+bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
+                                   GSList **visited, Transaction *tran,
+                                   Error **errp);
+bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                             GSList **visited, Transaction *tran,
+                             Error **errp);
+int bdrv_child_try_change_aio_context(BlockDriverState *bs, AioContext *ctx,
+                                      BdrvChild *ignore_child, Error **errp);
+
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 8947abab76..b35a0fe840 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -896,6 +896,9 @@ struct BdrvChildClass {
                         GSList **ignore, Error **errp);
     void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
 
+    bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
+                           GSList **ignore, Transaction *tran, Error **errp);
+
     AioContext *(*get_parent_aio_context)(BdrvChild *child);
 
     /*
-- 
2.31.1


