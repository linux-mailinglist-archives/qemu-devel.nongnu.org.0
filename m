Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA8A6101A1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:29:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gK-0001lt-PC; Thu, 27 Oct 2022 14:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gG-0001Z6-1y
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g6-0002Qx-N1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/xBKHo1pGTLBhXgMixGmNJbLhZeLdOhJrr/sP4OzKs=;
 b=PwWnPWcTT02XT/XEfrO3bWKbXgvN9NMwjqSiTT8hKnxfXyDVKO4owSlQKlp0FukWs99SFW
 L0L1a5MC6qXxGLJ3UuKsYFJ+1eSZkxhkXunGp6olYh5WmTiqv83YNYV1AVLsbvTKqJfdAm
 RMwpE0DSsRoWiqk11FnUONZLRUUepk4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-9uvRPiEvMy6BT7jF_ULyPQ-1; Thu, 27 Oct 2022 14:32:27 -0400
X-MC-Unique: 9uvRPiEvMy6BT7jF_ULyPQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC761C05B17;
 Thu, 27 Oct 2022 18:32:26 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 201051121320;
 Thu, 27 Oct 2022 18:32:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 16/58] Revert "block: Let replace_child_noperm free children"
Date: Thu, 27 Oct 2022 20:31:04 +0200
Message-Id: <20221027183146.463129-17-kwolf@redhat.com>
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We are going to reimplement this behavior (clear bs->file / bs->backing
pointers automatically when child->bs is cleared) in a nicer way, see
further commit
"block: Manipulate bs->file / bs->backing pointers in .attach/.detach".

With this revert we bring back a problem that was fixed by b0a9f6fed3d8.
Still the problem was mostly theoretical, we don't have concrete bugs
fixed by b0a9f6fed3d8, we don't have a specific test. Probably some
accidental failures of iotests are related.

Alternatively, we may merge this and following three reverts into final
"block: Manipulate ..." to avoid any kind of regression. But seems that
in this case having separate clear revert commits is better.

This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-10-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 102 +++++++++++++-------------------------------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index 25a596a612..7a9a6efca8 100644
--- a/block.c
+++ b/block.c
@@ -90,10 +90,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_child_free(BdrvChild *child);
 static void bdrv_replace_child_noperm(BdrvChild **child,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child);
+                                      BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran);
@@ -2345,7 +2343,6 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
-    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
@@ -2353,9 +2350,6 @@ static void bdrv_replace_child_commit(void *opaque)
     BdrvReplaceChildState *s = opaque;
     GLOBAL_STATE_CODE();
 
-    if (s->free_empty_child && !s->child->bs) {
-        bdrv_child_free(s->child);
-    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2373,26 +2367,22 @@ static void bdrv_replace_child_abort(void *opaque)
      *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
      *     will not modify s->child.  From that perspective, it does not matter
      *     whether we pass s->childp or &s->child.
+     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
+     *     pointer anyway (though it will in the future), so at this point it
+     *     absolutely does not matter whether we pass s->childp or &s->child.)
      * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
      *     it here.
      * (3) If new_bs is NULL, *s->childp will have been NULLed by
      *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
      *     must not pass a NULL *s->childp here.
+     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
+     *     have NULLed *s->childp, so this does not apply yet.  It will in the
+     *     future.)
      *
      * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
      * any case, there is no reason to pass it anyway.
      */
-    bdrv_replace_child_noperm(&s->child, s->old_bs, true);
-    /*
-     * The child was pre-existing, so s->old_bs must be non-NULL, and
-     * s->child thus must not have been freed
-     */
-    assert(s->child != NULL);
-    if (!new_bs) {
-        /* As described above, *s->childp was cleared, so restore it */
-        assert(s->childp != NULL);
-        *s->childp = s->child;
-    }
+    bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2409,44 +2399,30 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  *
  * The function doesn't update permissions, caller is responsible for this.
  *
- * (*childp)->bs must not be NULL.
- *
  * Note that if new_bs == NULL, @childp is stored in a state object attached
  * to @tran, so that the old child can be reinstated in the abort handler.
  * Therefore, if @new_bs can be NULL, @childp must stay valid until the
  * transaction is committed or aborted.
  *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed (on commit).  @free_empty_child should only be false if the
- * caller will free the BDrvChild themselves (which may be important
- * if this is in turn called in another transactional context).
+ * (TODO: The reinstating does not happen yet, but it will once
+ * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
 static void bdrv_replace_child_tran(BdrvChild **childp,
                                     BlockDriverState *new_bs,
-                                    Transaction *tran,
-                                    bool free_empty_child)
+                                    Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
         .child = *childp,
         .childp = new_bs == NULL ? childp : NULL,
         .old_bs = (*childp)->bs,
-        .free_empty_child = free_empty_child,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
-    /* The abort handler relies on this */
-    assert(s->old_bs != NULL);
-
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    /*
-     * Pass free_empty_child=false, we will free the child (if
-     * necessary) in bdrv_replace_child_commit() (if our
-     * @free_empty_child parameter was true).
-     */
-    bdrv_replace_child_noperm(childp, new_bs, false);
+    bdrv_replace_child_noperm(childp, new_bs);
     /* old_bs reference is transparently moved from *childp to @s */
 }
 
@@ -2828,22 +2804,8 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-/**
- * Replace (*childp)->bs by @new_bs.
- *
- * If @new_bs is NULL, *childp will be set to NULL, too: BDS parents
- * generally cannot handle a BdrvChild with .bs == NULL, so clearing
- * BdrvChild.bs should generally immediately be followed by the
- * BdrvChild pointer being cleared as well.
- *
- * If @free_empty_child is true and @new_bs is NULL, the BdrvChild is
- * freed.  @free_empty_child should only be false if the caller will
- * free the BdrvChild themselves (this may be important in a
- * transactional context, where it may only be freed on commit).
- */
 static void bdrv_replace_child_noperm(BdrvChild **childp,
-                                      BlockDriverState *new_bs,
-                                      bool free_empty_child)
+                                      BlockDriverState *new_bs)
 {
     BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
@@ -2882,9 +2844,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
-    if (!new_bs) {
-        *childp = NULL;
-    }
 
     if (new_bs) {
         assert_bdrv_graph_writable(new_bs);
@@ -2915,10 +2874,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
-
-    if (free_empty_child && !child->bs) {
-        bdrv_child_free(child);
-    }
 }
 
 /**
@@ -2950,14 +2905,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BlockDriverState *bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    /*
-     * Pass free_empty_child=false, because we still need the child
-     * for the AioContext operations on the parent below; those
-     * BdrvChildClass methods all work on a BdrvChild object, so we
-     * need to keep it as an empty shell (after this function, it will
-     * not be attached to any parent, and it will not have a .bs).
-     */
-    bdrv_replace_child_noperm(s->child, NULL, false);
+    bdrv_replace_child_noperm(s->child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2979,6 +2927,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
+    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -3057,9 +3006,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs, true);
-    /* child_bs was non-NULL, so new_child must not have been freed */
-    assert(new_child != NULL);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -3120,7 +3067,8 @@ static void bdrv_detach_child(BdrvChild **childp)
     BlockDriverState *old_bs = (*childp)->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(childp, NULL, true);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -5171,11 +5119,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        /*
-         * Pass free_empty_child=false, we will free the child in
-         * bdrv_remove_filter_or_cow_child_commit()
-         */
-        bdrv_replace_child_tran(childp, NULL, tran, false);
+        bdrv_replace_child_tran(childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
@@ -5185,6 +5129,8 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    *childp = NULL;
 }
 
 /*
@@ -5228,7 +5174,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran, true);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5393,9 +5339,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran, true);
-    /* @new_bs must have been non-NULL, so @child must not have been freed */
-    assert(child != NULL);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.37.3


