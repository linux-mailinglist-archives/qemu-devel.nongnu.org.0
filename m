Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA5F572896
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:26:54 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNPB-0004sk-6p
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNIK-0002ut-PO
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oBNHx-0002L3-UT
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 17:19:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657660765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pePwG8ZwqKYsNfcZobAmGxdftqc/BwZCeZvQfQvX01I=;
 b=DkoAZdCXQIvkGXKrGcz22pnLqlumLMfrqAp9/5JRzH+5uriAQ/7rsNwkiiHH1eZ/2fwgEQ
 l1yeoCVh55i/kkvc6r27CLdNqgvim9luEcel4C93zZHnPics/q1hjbTZZtAMJWU3tjrSjG
 Ht3qsaYQw/+clx1/9wDpplCaskjFALU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-cBaNBE9pO5CTXScsY0LqWg-1; Tue, 12 Jul 2022 17:19:22 -0400
X-MC-Unique: cBaNBE9pO5CTXScsY0LqWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672D11857F07;
 Tue, 12 Jul 2022 21:19:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 514F22166B30;
 Tue, 12 Jul 2022 21:19:20 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [RFC PATCH 8/8] block: remove all unused ->can_set_aio_ctx and
 ->set_aio_ctx callbacks
Date: Tue, 12 Jul 2022 17:19:11 -0400
Message-Id: <20220712211911.1302836-9-eesposit@redhat.com>
In-Reply-To: <20220712211911.1302836-1-eesposit@redhat.com>
References: <20220712211911.1302836-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

Together with all _can_set_ and _set_ APIs, as they are not needed
anymore.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 196 -----------------------------
 block/block-backend.c              |  33 -----
 blockjob.c                         |  35 ------
 include/block/block-global-state.h |   9 --
 include/block/block_int-common.h   |   4 -
 5 files changed, 277 deletions(-)

diff --git a/block.c b/block.c
index 101188a2d4..d99784dff1 100644
--- a/block.c
+++ b/block.c
@@ -1243,20 +1243,6 @@ static bool bdrv_child_cb_change_aio_ctx(BdrvChild *child, AioContext *ctx,
     return bdrv_change_aio_context(bs, ctx, visited, tran, errp);
 }
 
-static bool bdrv_child_cb_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                          GSList **ignore, Error **errp)
-{
-    BlockDriverState *bs = child->opaque;
-    return bdrv_can_set_aio_context(bs, ctx, ignore, errp);
-}
-
-static void bdrv_child_cb_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                      GSList **ignore)
-{
-    BlockDriverState *bs = child->opaque;
-    return bdrv_set_aio_context_ignore(bs, ctx, ignore);
-}
-
 /*
  * Returns the options and flags that a temporary snapshot should get, based on
  * the originally requested flags (the originally requested image will have
@@ -1497,8 +1483,6 @@ const BdrvChildClass child_of_bds = {
     .attach          = bdrv_child_cb_attach,
     .detach          = bdrv_child_cb_detach,
     .inactivate      = bdrv_child_cb_inactivate,
-    .can_set_aio_ctx = bdrv_child_cb_can_set_aio_ctx,
-    .set_aio_ctx     = bdrv_child_cb_set_aio_ctx,
     .change_aio_ctx  = bdrv_child_cb_change_aio_ctx,
     .update_filename = bdrv_child_cb_update_filename,
     .get_parent_aio_context = child_of_bds_get_parent_aio_context,
@@ -7329,125 +7313,6 @@ static void bdrv_attach_aio_context(BlockDriverState *bs,
     bs->walking_aio_notifiers = false;
 }
 
-/*
- * Changes the AioContext used for fd handlers, timers, and BHs by this
- * BlockDriverState and all its children and parents.
- *
- * Must be called from the main AioContext.
- *
- * The caller must own the AioContext lock for the old AioContext of bs, but it
- * must not own the AioContext lock for new_context (unless new_context is the
- * same as the current context of bs).
- *
- * @ignore will accumulate all visited BdrvChild object. The caller is
- * responsible for freeing the list afterwards.
- */
-void bdrv_set_aio_context_ignore(BlockDriverState *bs,
-                                 AioContext *new_context, GSList **ignore)
-{
-    AioContext *old_context = bdrv_get_aio_context(bs);
-    GSList *children_to_process = NULL;
-    GSList *parents_to_process = NULL;
-    GSList *entry;
-    BdrvChild *child, *parent;
-
-    g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
-    GLOBAL_STATE_CODE();
-
-    if (old_context == new_context) {
-        return;
-    }
-
-    bdrv_drained_begin(bs);
-
-    QLIST_FOREACH(child, &bs->children, next) {
-        if (g_slist_find(*ignore, child)) {
-            continue;
-        }
-        *ignore = g_slist_prepend(*ignore, child);
-        children_to_process = g_slist_prepend(children_to_process, child);
-    }
-
-    QLIST_FOREACH(parent, &bs->parents, next_parent) {
-        if (g_slist_find(*ignore, parent)) {
-            continue;
-        }
-        *ignore = g_slist_prepend(*ignore, parent);
-        parents_to_process = g_slist_prepend(parents_to_process, parent);
-    }
-
-    for (entry = children_to_process;
-         entry != NULL;
-         entry = g_slist_next(entry)) {
-        child = entry->data;
-        bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
-    }
-    g_slist_free(children_to_process);
-
-    for (entry = parents_to_process;
-         entry != NULL;
-         entry = g_slist_next(entry)) {
-        parent = entry->data;
-        assert(parent->klass->set_aio_ctx);
-        parent->klass->set_aio_ctx(parent, new_context, ignore);
-    }
-    g_slist_free(parents_to_process);
-
-    bdrv_detach_aio_context(bs);
-
-    /* Acquire the new context, if necessary */
-    if (qemu_get_aio_context() != new_context) {
-        aio_context_acquire(new_context);
-    }
-
-    bdrv_attach_aio_context(bs, new_context);
-
-    /*
-     * If this function was recursively called from
-     * bdrv_set_aio_context_ignore(), there may be nodes in the
-     * subtree that have not yet been moved to the new AioContext.
-     * Release the old one so bdrv_drained_end() can poll them.
-     */
-    if (qemu_get_aio_context() != old_context) {
-        aio_context_release(old_context);
-    }
-
-    bdrv_drained_end(bs);
-
-    if (qemu_get_aio_context() != old_context) {
-        aio_context_acquire(old_context);
-    }
-    if (qemu_get_aio_context() != new_context) {
-        aio_context_release(new_context);
-    }
-}
-
-static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
-                                            GSList **ignore, Error **errp)
-{
-    GLOBAL_STATE_CODE();
-    if (g_slist_find(*ignore, c)) {
-        return true;
-    }
-    *ignore = g_slist_prepend(*ignore, c);
-
-    /*
-     * A BdrvChildClass that doesn't handle AioContext changes cannot
-     * tolerate any AioContext changes
-     */
-    if (!c->klass->can_set_aio_ctx) {
-        char *user = bdrv_child_user_desc(c);
-        error_setg(errp, "Changing iothreads is not supported by %s", user);
-        g_free(user);
-        return false;
-    }
-    if (!c->klass->can_set_aio_ctx(c, ctx, ignore, errp)) {
-        assert(!errp || *errp);
-        return false;
-    }
-    return true;
-}
-
 typedef struct BdrvStateSetAioContext {
     AioContext *new_ctx;
     BlockDriverState *bs;
@@ -7493,17 +7358,6 @@ static bool bdrv_parent_change_aio_context(BdrvChild *c, AioContext *ctx,
     return true;
 }
 
-bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
-                                    GSList **ignore, Error **errp)
-{
-    GLOBAL_STATE_CODE();
-    if (g_slist_find(*ignore, c)) {
-        return true;
-    }
-    *ignore = g_slist_prepend(*ignore, c);
-    return bdrv_can_set_aio_context(c->bs, ctx, ignore, errp);
-}
-
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GSList **visited, Transaction *tran,
                                    Error **errp)
@@ -7516,33 +7370,6 @@ bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
     return bdrv_change_aio_context(c->bs, ctx, visited, tran, errp);
 }
 
-/* @ignore will accumulate all visited BdrvChild object. The caller is
- * responsible for freeing the list afterwards. */
-bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                              GSList **ignore, Error **errp)
-{
-    BdrvChild *c;
-
-    if (bdrv_get_aio_context(bs) == ctx) {
-        return true;
-    }
-
-    GLOBAL_STATE_CODE();
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if (!bdrv_parent_can_set_aio_context(c, ctx, ignore, errp)) {
-            return false;
-        }
-    }
-    QLIST_FOREACH(c, &bs->children, next) {
-        if (!bdrv_child_can_set_aio_context(c, ctx, ignore, errp)) {
-            return false;
-        }
-    }
-
-    return true;
-}
-
 static void bdrv_drained_begin_commit(void *opaque)
 {
     BdrvStateSetAioContext *state = (BdrvStateSetAioContext *) opaque;
@@ -7636,29 +7463,6 @@ bool bdrv_change_aio_context(BlockDriverState *bs, AioContext *ctx,
     return true;
 }
 
-int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                   BdrvChild *ignore_child, Error **errp)
-{
-    GSList *ignore;
-    bool ret;
-
-    GLOBAL_STATE_CODE();
-
-    ignore = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
-    ret = bdrv_can_set_aio_context(bs, ctx, &ignore, errp);
-    g_slist_free(ignore);
-
-    if (!ret) {
-        return -EPERM;
-    }
-
-    ignore = ignore_child ? g_slist_prepend(NULL, ignore_child) : NULL;
-    bdrv_set_aio_context_ignore(bs, ctx, &ignore);
-    g_slist_free(ignore);
-
-    return 0;
-}
-
 /*
  * First, go recursively through all nodes in the graph, and see if they
  * can change their AioContext.
diff --git a/block/block-backend.c b/block/block-backend.c
index 6e90ac3a6a..9925663ca1 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -134,10 +134,6 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter);
 static void blk_root_change_media(BdrvChild *child, bool load);
 static void blk_root_resize(BdrvChild *child);
 
-static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                     GSList **ignore, Error **errp);
-static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                 GSList **ignore);
 static bool blk_root_change_aio_ctx(BdrvChild *child, AioContext *ctx,
                                     GSList **visited, Transaction *tran,
                                     Error **errp);
@@ -337,8 +333,6 @@ static const BdrvChildClass child_root = {
     .attach             = blk_root_attach,
     .detach             = blk_root_detach,
 
-    .can_set_aio_ctx    = blk_root_can_set_aio_ctx,
-    .set_aio_ctx        = blk_root_set_aio_ctx,
     .change_aio_ctx     = blk_root_change_aio_ctx,
 
     .get_parent_aio_context = blk_root_get_parent_aio_context,
@@ -2266,33 +2260,6 @@ finish:
     return true;
 }
 
-static bool blk_root_can_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                     GSList **ignore, Error **errp)
-{
-    BlockBackend *blk = child->opaque;
-
-    if (blk->allow_aio_context_change) {
-        return true;
-    }
-
-    /* Only manually created BlockBackends that are not attached to anything
-     * can change their AioContext without updating their user. */
-    if (!blk->name || blk->dev) {
-        /* TODO Add BB name/QOM path */
-        error_setg(errp, "Cannot change iothread of active block backend");
-        return false;
-    }
-
-    return true;
-}
-
-static void blk_root_set_aio_ctx(BdrvChild *child, AioContext *ctx,
-                                 GSList **ignore)
-{
-    BlockBackend *blk = child->opaque;
-    blk_do_set_aio_context(blk, ctx, false, &error_abort);
-}
-
 void blk_add_aio_context_notifier(BlockBackend *blk,
         void (*attached_aio_context)(AioContext *new_context, void *opaque),
         void (*detach_aio_context)(void *opaque), void *opaque)
diff --git a/blockjob.c b/blockjob.c
index 9e26b06ed4..219a444108 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -168,39 +168,6 @@ static bool child_job_change_aio_ctx(BdrvChild *c, AioContext *ctx,
     return true;
 }
 
-static bool child_job_can_set_aio_ctx(BdrvChild *c, AioContext *ctx,
-                                      GSList **ignore, Error **errp)
-{
-    BlockJob *job = c->opaque;
-    GSList *l;
-
-    for (l = job->nodes; l; l = l->next) {
-        BdrvChild *sibling = l->data;
-        if (!bdrv_child_can_set_aio_context(sibling, ctx, ignore, errp)) {
-            return false;
-        }
-    }
-    return true;
-}
-
-static void child_job_set_aio_ctx(BdrvChild *c, AioContext *ctx,
-                                  GSList **ignore)
-{
-    BlockJob *job = c->opaque;
-    GSList *l;
-
-    for (l = job->nodes; l; l = l->next) {
-        BdrvChild *sibling = l->data;
-        if (g_slist_find(*ignore, sibling)) {
-            continue;
-        }
-        *ignore = g_slist_prepend(*ignore, sibling);
-        bdrv_set_aio_context_ignore(sibling->bs, ctx, ignore);
-    }
-
-    job_set_aio_context(&job->job, ctx);
-}
-
 static AioContext *child_job_get_parent_aio_context(BdrvChild *c)
 {
     BlockJob *job = c->opaque;
@@ -214,8 +181,6 @@ static const BdrvChildClass child_job = {
     .drained_begin      = child_job_drained_begin,
     .drained_poll       = child_job_drained_poll,
     .drained_end        = child_job_drained_end,
-    .can_set_aio_ctx    = child_job_can_set_aio_ctx,
-    .set_aio_ctx        = child_job_set_aio_ctx,
     .change_aio_ctx     = child_job_change_aio_ctx,
     .stay_at_node       = true,
     .get_parent_aio_context = child_job_get_parent_aio_context,
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 5847b64f95..65262781ab 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -217,18 +217,9 @@ void coroutine_fn bdrv_co_lock(BlockDriverState *bs);
  */
 void coroutine_fn bdrv_co_unlock(BlockDriverState *bs);
 
-void bdrv_set_aio_context_ignore(BlockDriverState *bs,
-                                 AioContext *new_context, GSList **ignore);
 int bdrv_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                              Error **errp);
-int bdrv_child_try_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                                   BdrvChild *ignore_child, Error **errp);
-bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
-                                    GSList **ignore, Error **errp);
-bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
-                              GSList **ignore, Error **errp);
 AioContext *bdrv_child_get_parent_aio_context(BdrvChild *c);
-
 bool bdrv_child_change_aio_context(BdrvChild *c, AioContext *ctx,
                                    GSList **visited, Transaction *tran,
                                    Error **errp);
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index b35a0fe840..3c0e059602 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -892,10 +892,6 @@ struct BdrvChildClass {
     int (*update_filename)(BdrvChild *child, BlockDriverState *new_base,
                            const char *filename, Error **errp);
 
-    bool (*can_set_aio_ctx)(BdrvChild *child, AioContext *ctx,
-                        GSList **ignore, Error **errp);
-    void (*set_aio_ctx)(BdrvChild *child, AioContext *ctx, GSList **ignore);
-
     bool (*change_aio_ctx)(BdrvChild *child, AioContext *ctx,
                            GSList **ignore, Transaction *tran, Error **errp);
 
-- 
2.31.1


