Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D0581B62
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:56:26 +0200 (CEST)
Received: from localhost ([::1]:34888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRbN-00030n-7f
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQun-0001LN-B9; Tue, 26 Jul 2022 16:12:25 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:47774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQui-0001HT-1m; Tue, 26 Jul 2022 16:12:23 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 268F12E1A75;
 Tue, 26 Jul 2022 23:12:10 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-C8O0Ooi9; Tue, 26 Jul 2022 23:12:08 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866328; bh=kYZJ211LLnBilj7PnZtc8PhMA8zl+HzEJuZJUIaaKrc=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=WkUVZrJRyU8AW3pVlo89u1mbu4e9a6MnMwVXmxs/Wx325N2hZbidSLEAPnZrTdmrG
 QMjOOH0kquvFnQPnx3+qpOyMiqoP12P7bQzSnEIe0+03KIlgq8ElSyNvRnlWDUTTNv
 my5KBII9jHv3gwxmANrjisSums5MzbLRvgcE6LbA=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, John Snow <jsnow@redhat.com>
Subject: [PATCH v7 13/15] block: Manipulate bs->file / bs->backing pointers in
 .attach/.detach
Date: Tue, 26 Jul 2022 23:11:32 +0300
Message-Id: <20220726201134.924743-14-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
---
 block.c                          | 234 ++++++++++++++-----------------
 block/raw-format.c               |   4 +-
 block/snapshot-access.c          |   6 +-
 block/snapshot.c                 |   1 -
 include/block/block_int-common.h |  15 +-
 tests/unit/test-bdrv-drain.c     |  10 +-
 6 files changed, 126 insertions(+), 144 deletions(-)

diff --git a/block.c b/block.c
index 121affb045..3343dc5649 100644
--- a/block.c
+++ b/block.c
@@ -1440,9 +1440,39 @@ static void bdrv_child_cb_attach(BdrvChild *child)
 
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
@@ -1460,6 +1490,12 @@ static void bdrv_child_cb_detach(BdrvChild *child)
 
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
@@ -1665,7 +1701,7 @@ open_failed:
     bs->drv = NULL;
     if (bs->file != NULL) {
         bdrv_unref_child(bs, bs->file);
-        bs->file = NULL;
+        assert(!bs->file);
     }
     g_free(bs->opaque);
     bs->opaque = NULL;
@@ -2854,7 +2890,7 @@ static void bdrv_child_free(BdrvChild *child)
 }
 
 typedef struct BdrvAttachChildCommonState {
-    BdrvChild **child;
+    BdrvChild *child;
     AioContext *old_parent_ctx;
     AioContext *old_child_ctx;
 } BdrvAttachChildCommonState;
@@ -2862,33 +2898,31 @@ typedef struct BdrvAttachChildCommonState {
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
@@ -2899,28 +2933,22 @@ static TransactionActionDrv bdrv_attach_child_common_drv = {
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
 
@@ -2962,42 +2990,35 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
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
@@ -3006,21 +3027,16 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
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
@@ -3065,15 +3081,16 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
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
 
@@ -3081,11 +3098,10 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
 
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
@@ -3107,14 +3123,15 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
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
 
@@ -3125,12 +3142,10 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
 
 out:
     tran_finalize(tran, ret);
-    /* child is unset on failure by bdrv_attach_child_common_abort() */
-    assert((ret < 0) == !child);
 
     bdrv_unref(child_bs);
 
-    return child;
+    return ret < 0 ? NULL : child;
 }
 
 /* Callers must ensure that child->frozen is false. */
@@ -3272,7 +3287,6 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
                                            bool is_backing,
                                            Transaction *tran, Error **errp)
 {
-    int ret = 0;
     bool update_inherits_from =
         bdrv_inherits_from_recursive(child_bs, parent_bs);
     BdrvChild *child = is_backing ? parent_bs->backing : parent_bs->file;
@@ -3330,14 +3344,12 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
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
 
 
@@ -3593,14 +3605,16 @@ int bdrv_open_file_child(const char *filename,
 
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
@@ -4875,8 +4889,8 @@ static void bdrv_close(BlockDriverState *bs)
         bdrv_unref_child(bs, child);
     }
 
-    bs->backing = NULL;
-    bs->file = NULL;
+    assert(!bs->backing);
+    assert(!bs->file);
     g_free(bs->opaque);
     bs->opaque = NULL;
     qatomic_set(&bs->copy_on_read, 0);
@@ -5007,41 +5021,14 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
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
@@ -5052,8 +5039,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvRemoveFilterOrCowChild *s;
-
     assert(child == bs->backing || child == bs->file);
 
     if (!child) {
@@ -5064,18 +5049,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5229,16 +5203,18 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
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
index 69fd650eaf..d8ca8ee3a9 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -457,8 +457,8 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
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
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index d68adc6ff3..c4d8b11dbb 100644
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
diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 23d425a494..4cf99edf5b 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -1808,9 +1808,8 @@ static void test_drop_intermediate_poll(void)
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
 
@@ -2028,9 +2027,8 @@ static void do_test_replace_child_mid_drain(int old_drain_count,
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
2.25.1


