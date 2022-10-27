Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FDF610192
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7hN-0003F1-FQ; Thu, 27 Oct 2022 14:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gK-0001nh-3W
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g9-0002S2-Gp
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dd/1tQAObFOeklSYNUnpSmodN8AX8q7qTjHAClGTgK4=;
 b=hc/BIzWlkoezCT2xgRQfDqAOYCNxZR0lNsm6vT9rxY8j69LBhnHx7k6lPJX3gF4NT7Ll19
 /DwtFFAqBL7qcnxUpppjDx/X6ZBs29TCSYhVNF17Rf+j4KOmEHDhuhh9P5UrgPSFB6h7xw
 xvzLprmmrwQLTEfBK/OnHUp8blfFets=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-FfgLyvctNTWlXrXu4fLKuw-1; Thu, 27 Oct 2022 14:32:31 -0400
X-MC-Unique: FfgLyvctNTWlXrXu4fLKuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43443C0F671;
 Thu, 27 Oct 2022 18:32:30 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113151121320;
 Thu, 27 Oct 2022 18:32:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 20/58] block: Manipulate bs->file / bs->backing pointers in
 .attach/.detach
Date: Thu, 27 Oct 2022 20:31:08 +0200
Message-Id: <20221027183146.463129-21-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

bs->file and bs->backing are a kind of duplication of part of
bs->children. But very useful diplication, so let's not drop them at
all:)

We should manage bs->file and bs->backing in same place, where we
manage bs->children, to keep them in sync.

Moreover, generic io paths are unprepared to BdrvChild without a bs, so
it's double good to clear bs->file / bs->backing when we detach the
child.

Detach is simple: if we detach bs->file or bs->backing child, just
set corresponding field to NULL.

Attach is a bit more complicated. But we still can precisely detect
should we set one of bs->file / bs->backing or not:

- if role is BDRV_CHILD_COW, we definitely deal with bs->backing
- else, if role is BDRV_CHILD_FILTERED (it must be also
  BDRV_CHILD_PRIMARY), it's a filtered child. Use
  bs->drv->filtered_child_is_backing to chose the pointer field to
  modify.
- else, if role is BDRV_CHILD_PRIMARY, we deal with bs->file
- in all other cases, it's neither bs->backing nor bs->file. It's some
  other child and we shouldn't care

OK. This change brings one more good thing: we can (and should) get rid
of all indirect pointers in the block-graph-change transactions:

bdrv_attach_child_common() stores BdrvChild** into transaction to clear
it on abort.

bdrv_attach_child_common() has two callers: bdrv_attach_child_noperm()
just pass-through this feature, bdrv_root_attach_child() doesn't need
the feature.

Look at bdrv_attach_child_noperm() callers:
  - bdrv_attach_child() doesn't need the feature
  - bdrv_set_file_or_backing_noperm() uses the feature to manage
    bs->file and bs->backing, we don't want it anymore
  - bdrv_append() uses the feature to manage bs->backing, again we
    don't want it anymore

So, we should drop this stuff! Great!

We could probably keep BdrvChild** argument to keep the int return
value, but it seems not worth the complexity.

Finally, we now set .file / .backing automatically in generic code and
want to restring setting them by hand outside of .attach/.detach.
So, this patch cleanups all remaining places where they were set.
To find such places I use:

  git grep '\->file ='
  git grep '\->backing ='
  git grep '&.*\<backing\>'
  git grep '&.*\<file\>'

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-14-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block_int-common.h |  15 +-
 block.c                          | 234 ++++++++++++++-----------------
 block/raw-format.c               |   4 +-
 block/snapshot-access.c          |   6 +-
 block/snapshot.c                 |   1 -
 tests/unit/test-bdrv-drain.c     |  10 +-
 6 files changed, 126 insertions(+), 144 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 10feef9f0c..1f300ee7f6 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -1056,9 +1056,6 @@ struct BlockDriverState {
     QDict *full_open_options;
     char exact_filename[PATH_MAX];
 
-    BdrvChild *backing;
-    BdrvChild *file;
-
     /* I/O Limits */
     BlockLimits bl;
 
@@ -1117,7 +1114,19 @@ struct BlockDriverState {
      * parent node of this node.
      */
     BlockDriverState *inherits_from;
+
+    /*
+     * @backing and @file are some of @children or NULL. All these three fields
+     * (@file, @backing and @children) are modified only in
+     * bdrv_child_cb_attach() and bdrv_child_cb_detach().
+     *
+     * See also comment in include/block/block.h, to learn how backing and file
+     * are connected with BdrvChildRole.
+     */
     QLIST_HEAD(, BdrvChild) children;
+    BdrvChild *backing;
+    BdrvChild *file;
+
     QLIST_HEAD(, BdrvChild) parents;
 
     QDict *options;
diff --git a/block.c b/block.c
index 683a9e0eff..ed11a421b0 100644
--- a/block.c
+++ b/block.c
@@ -1445,9 +1445,39 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 
     assert_bdrv_graph_writable(bs);
     QLIST_INSERT_HEAD(&bs->children, child, next);
-
-    if (child->role & BDRV_CHILD_COW) {
+    if (bs->drv->is_filter || (child->role & BDRV_CHILD_FILTERED)) {
+        /*
+         * Here we handle filters and block/raw-format.c when it behave like
+         * filter. They generally have a single PRIMARY child, which is also the
+         * FILTERED child, and that they may have multiple more children, which
+         * are neither PRIMARY nor FILTERED. And never we have a COW child here.
+         * So bs->file will be the PRIMARY child, unless the PRIMARY child goes
+         * into bs->backing on exceptional cases; and bs->backing will be
+         * nothing else.
+         */
+        assert(!(child->role & BDRV_CHILD_COW));
+        if (child->role & BDRV_CHILD_PRIMARY) {
+            assert(child->role & BDRV_CHILD_FILTERED);
+            assert(!bs->backing);
+            assert(!bs->file);
+
+            if (bs->drv->filtered_child_is_backing) {
+                bs->backing = child;
+            } else {
+                bs->file = child;
+            }
+        } else {
+            assert(!(child->role & BDRV_CHILD_FILTERED));
+        }
+    } else if (child->role & BDRV_CHILD_COW) {
+        assert(bs->drv->supports_backing);
+        assert(!(child->role & BDRV_CHILD_PRIMARY));
+        assert(!bs->backing);
+        bs->backing = child;
         bdrv_backing_attach(child);
+    } else if (child->role & BDRV_CHILD_PRIMARY) {
+        assert(!bs->file);
+        bs->file = child;
     }
 
     bdrv_apply_subtree_drain(child, bs);
@@ -1465,6 +1495,12 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
     assert_bdrv_graph_writable(bs);
     QLIST_REMOVE(child, next);
+    if (child == bs->backing) {
+        assert(child != bs->file);
+        bs->backing = NULL;
+    } else if (child == bs->file) {
+        bs->file = NULL;
+    }
 }
 
 static int bdrv_child_cb_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -1670,7 +1706,7 @@ open_failed:
     bs->drv = NULL;
     if (bs->file != NULL) {
         bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
+        assert(!bs->file);
     }
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -2859,7 +2895,7 @@ static void bdrv_child_free(BdrvChild *child)
 }
 
 typedef struct BdrvAttachChildCommonState {
-    BdrvChild **child;
+    BdrvChild *child;
     AioContext *old_parent_ctx;
     AioContext *old_child_ctx;
 } BdrvAttachChildCommonState;
@@ -2867,33 +2903,31 @@ typedef struct BdrvAttachChildCommonState {
 static void bdrv_attach_child_common_abort(void *opaque)
 {
     BdrvAttachChildCommonState *s = opaque;
-    BdrvChild *child = *s->child;
-    BlockDriverState *bs = child->bs;
+    BlockDriverState *bs = s->child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(child, NULL);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
     }
 
-    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+    if (bdrv_child_get_parent_aio_context(s->child) != s->old_parent_ctx) {
         GSList *ignore;
 
         /* No need to ignore `child`, because it has been detached already */
         ignore = NULL;
-        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
-                                      &error_abort);
+        s->child->klass->can_set_aio_ctx(s->child, s->old_parent_ctx, &ignore,
+                                         &error_abort);
         g_slist_free(ignore);
 
         ignore = NULL;
-        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+        s->child->klass->set_aio_ctx(s->child, s->old_parent_ctx, &ignore);
         g_slist_free(ignore);
     }
 
     bdrv_unref(bs);
-    bdrv_child_free(child);
-    *s->child = NULL;
+    bdrv_child_free(s->child);
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2904,28 +2938,22 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
 /*
  * Common part of attaching bdrv child to bs or to blk or to job
  *
- * Resulting new child is returned through @child.
- * At start *@child must be NULL.
- * @child is saved to a new entry of @tran, so that *@child could be reverted to
- * NULL on abort(). So referenced variable must live at least until transaction
- * end.
- *
  * Function doesn't update permissions, caller is responsible for this.
+ *
+ * Returns new created child.
  */
-static int bdrv_attach_child_common(BlockDriverState *child_bs,
-                                    const char *child_name,
-                                    const BdrvChildClass *child_class,
-                                    BdrvChildRole child_role,
-                                    uint64_t perm, uint64_t shared_perm,
-                                    void *opaque, BdrvChild **child,
-                                    Transaction *tran, Error **errp)
+static BdrvChild *bdrv_attach_child_common(BlockDriverState *child_bs,
+                                           const char *child_name,
+                                           const BdrvChildClass *child_class,
+                                           BdrvChildRole child_role,
+                                           uint64_t perm, uint64_t shared_perm,
+                                           void *opaque,
+                                           Transaction *tran, Error **errp)
 {
     BdrvChild *new_child;
     AioContext *parent_ctx;
     AioContext *child_ctx = bdrv_get_aio_context(child_bs);
 
-    assert(child);
-    assert(*child == NULL);
     assert(child_class->get_parent_desc);
     GLOBAL_STATE_CODE();
 
@@ -2967,42 +2995,35 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
         if (ret < 0) {
             error_propagate(errp, local_err);
             bdrv_child_free(new_child);
-            return ret;
+            return NULL;
         }
     }
 
     bdrv_ref(child_bs);
     bdrv_replace_child_noperm(new_child, child_bs);
 
-    *child = new_child;
-
     BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
     *s = (BdrvAttachChildCommonState) {
-        .child = child,
+        .child = new_child,
         .old_parent_ctx = parent_ctx,
         .old_child_ctx = child_ctx,
     };
     tran_add(tran, &bdrv_attach_child_common_drv, s);
 
-    return 0;
+    return new_child;
 }
 
 /*
- * Variable referenced by @child must live at least until transaction end.
- * (see bdrv_attach_child_common() doc for details)
- *
  * Function doesn't update permissions, caller is responsible for this.
  */
-static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
-                                    BlockDriverState *child_bs,
-                                    const char *child_name,
-                                    const BdrvChildClass *child_class,
-                                    BdrvChildRole child_role,
-                                    BdrvChild **child,
-                                    Transaction *tran,
-                                    Error **errp)
+static BdrvChild *bdrv_attach_child_noperm(BlockDriverState *parent_bs,
+                                           BlockDriverState *child_bs,
+                                           const char *child_name,
+                                           const BdrvChildClass *child_class,
+                                           BdrvChildRole child_role,
+                                           Transaction *tran,
+                                           Error **errp)
 {
-    int ret;
     uint64_t perm, shared_perm;
 
     assert(parent_bs->drv);
@@ -3011,21 +3032,16 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     if (bdrv_recurse_has_child(child_bs, parent_bs)) {
         error_setg(errp, "Making '%s' a %s child of '%s' would create a cycle",
                    child_bs->node_name, child_name, parent_bs->node_name);
-        return -EINVAL;
+        return NULL;
     }
 
     bdrv_get_cumulative_perm(parent_bs, &perm, &shared_perm);
     bdrv_child_perm(parent_bs, child_bs, NULL, child_role, NULL,
                     perm, shared_perm, &perm, &shared_perm);
 
-    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
-                                   child_role, perm, shared_perm, parent_bs,
-                                   child, tran, errp);
-    if (ret < 0) {
-        return ret;
-    }
-
-    return 0;
+    return bdrv_attach_child_common(child_bs, child_name, child_class,
+                                    child_role, perm, shared_perm, parent_bs,
+                                    tran, errp);
 }
 
 static void bdrv_detach_child(BdrvChild *child)
@@ -3070,15 +3086,16 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   void *opaque, Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
 
-    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+    child = bdrv_attach_child_common(child_bs, child_name, child_class,
                                    child_role, perm, shared_perm, opaque,
-                                   &child, tran, errp);
-    if (ret < 0) {
+                                   tran, errp);
+    if (!child) {
+        ret = -EINVAL;
         goto out;
     }
 
@@ -3086,11 +3103,10 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
-    return child;
+
+    return ret < 0 ? NULL : child;
 }
 
 /*
@@ -3112,14 +3128,15 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              Error **errp)
 {
     int ret;
-    BdrvChild *child = NULL;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
 
-    ret = bdrv_attach_child_noperm(parent_bs, child_bs, child_name, child_class,
-                                   child_role, &child, tran, errp);
-    if (ret < 0) {
+    child = bdrv_attach_child_noperm(parent_bs, child_bs, child_name,
+                                     child_class, child_role, tran, errp);
+    if (!child) {
+        ret = -EINVAL;
         goto out;
     }
 
@@ -3130,12 +3147,10 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-    return child;
+    return ret < 0 ? NULL : child;
 }
 
 /* Callers must ensure that child->frozen is false. */
@@ -3277,7 +3292,6 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
                                            bool is_backing,
                                            Transaction *tran, Error **errp)
 {
-    int ret = 0;
     bool update_inherits_from =
         bdrv_inherits_from_recursive(child_bs, parent_bs);
     BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
@@ -3335,14 +3349,12 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_attach_child_noperm(parent_bs, child_bs,
-                                   is_backing ? "backing" : "file",
-                                   &child_of_bds, role,
-                                   is_backing ? &parent_bs->backing :
-                                                &parent_bs->file,
-                                   tran, errp);
-    if (ret < 0) {
-        return ret;
+    child = bdrv_attach_child_noperm(parent_bs, child_bs,
+                                     is_backing ? "backing" : "file",
+                                     &child_of_bds, role,
+                                     tran, errp);
+    if (!child) {
+        return -EINVAL;
     }
 
 
@@ -3598,14 +3610,16 @@ int bdrv_open_file_child(const char *filename,
 
     /* commit_top and mirror_top don't use this function */
     assert(!parent->drv->filtered_child_is_backing);
-
     role = parent->drv->is_filter ?
         (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
 
-    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
-                                   &child_of_bds, role, false, errp);
+    if (!bdrv_open_child(filename, options, bdref_key, parent,
+                         &child_of_bds, role, false, errp))
+    {
+        return -EINVAL;
+    }
 
-    return parent->file ? 0 : -EINVAL;
+    return 0;
 }
 
 /*
@@ -4877,8 +4891,8 @@ static void bdrv_close(BlockDriverState *bs)
         bdrv_unref_child(bs, child);
     }
 
-    bs->backing = NULL;
-    bs->file = NULL;
+    assert(!bs->backing);
+    assert(!bs->file);
     g_free(bs->opaque);
     bs->opaque = NULL;
     qatomic_set(&bs->copy_on_read, 0);
@@ -5009,41 +5023,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-typedef struct BdrvRemoveFilterOrCowChild {
-    BdrvChild *child;
-    bool is_backing;
-} BdrvRemoveFilterOrCowChild;
-
-static void bdrv_remove_filter_or_cow_child_abort(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-    BlockDriverState *parent_bs = s->child->opaque;
-
-    if (s->is_backing) {
-        parent_bs->backing = s->child;
-    } else {
-        parent_bs->file = s->child;
-    }
-
-    /*
-     * We don't have to restore child->bs here to undo bdrv_replace_child_tran()
-     * because that function is transactionable and it registered own completion
-     * entries in @tran, so .abort() for bdrv_replace_child_safe() will be
-     * called automatically.
-     */
-}
-
 static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
 {
-    BdrvRemoveFilterOrCowChild *s = opaque;
     GLOBAL_STATE_CODE();
-    bdrv_child_free(s->child);
+    bdrv_child_free(opaque);
 }
 
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = g_free,
 };
 
 /*
@@ -5054,8 +5041,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvRemoveFilterOrCowChild *s;
-
     assert(child == bs->backing || child == bs->file);
 
     if (!child) {
@@ -5066,18 +5051,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    s = g_new(BdrvRemoveFilterOrCowChild, 1);
-    *s = (BdrvRemoveFilterOrCowChild) {
-        .child = child,
-        .is_backing = (child == bs->backing),
-    };
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
-
-    if (s->is_backing) {
-        bs->backing = NULL;
-    } else {
-        bs->file = NULL;
-    }
+    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
 }
 
 /*
@@ -5231,16 +5205,18 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp)
 {
     int ret;
+    BdrvChild *child;
     Transaction *tran = tran_new();
 
     GLOBAL_STATE_CODE();
 
     assert(!bs_new->backing);
 
-    ret = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
-                                   &child_of_bds, bdrv_backing_role(bs_new),
-                                   &bs_new->backing, tran, errp);
-    if (ret < 0) {
+    child = bdrv_attach_child_noperm(bs_new, bs_top, "backing",
+                                     &child_of_bds, bdrv_backing_role(bs_new),
+                                     tran, errp);
+    if (!child) {
+        ret = -EINVAL;
         goto out;
     }
 
diff --git a/block/raw-format.c b/block/raw-format.c
index f337ac7569..408b20e22d 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -458,8 +458,8 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
         file_role = BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               file_role, false, errp);
+    bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                    file_role, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/snapshot-access.c b/block/snapshot-access.c
index 77b87c1946..0a30ec6cd9 100644
--- a/block/snapshot-access.c
+++ b/block/snapshot-access.c
@@ -82,9 +82,9 @@ static void snapshot_access_refresh_filename(BlockDriverState *bs)
 static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
                                 Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
-                               false, errp);
+    bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                    BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                    false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/snapshot.c b/block/snapshot.c
index 75e8d3a937..f3971ac2bd 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -288,7 +288,6 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
 
         /* .bdrv_open() will re-attach it */
         bdrv_unref_child(bs, *fallback_ptr);
-        *fallback_ptr = NULL;
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 84e09d7070..0eecf14310 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1830,9 +1830,8 @@ static void test_drop_intermediate_poll(void)
     for (i = 0; i < 3; i++) {
         if (i) {
             /* Takes the reference to chain[i - 1] */
-            chain[i]->backing = bdrv_attach_child(chain[i], chain[i - 1],
-                                                  "chain", &chain_child_class,
-                                                  BDRV_CHILD_COW, &error_abort);
+            bdrv_attach_child(chain[i], chain[i - 1], "chain",
+                              &chain_child_class, BDRV_CHILD_COW, &error_abort);
         }
     }
 
@@ -2050,9 +2049,8 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
     new_child_bs->total_sectors = 1;
 
     bdrv_ref(old_child_bs);
-    parent_bs->backing = bdrv_attach_child(parent_bs, old_child_bs, "child",
-                                           &child_of_bds, BDRV_CHILD_COW,
-                                           &error_abort);
+    bdrv_attach_child(parent_bs, old_child_bs, "child", &child_of_bds,
+                      BDRV_CHILD_COW, &error_abort);
 
     for (i = 0; i < old_drain_count; i++) {
         bdrv_drained_begin(old_child_bs);
-- 
2.37.3


