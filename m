Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B771C581B00
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:25:03 +0200 (CEST)
Received: from localhost ([::1]:49012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGR70-0004rx-R8
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQug-0001FR-Gd; Tue, 26 Jul 2022 16:12:18 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:53372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQud-0001FZ-0m; Tue, 26 Jul 2022 16:12:17 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 326DC2E11FE;
 Tue, 26 Jul 2022 23:12:05 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-C3O0ileW; Tue, 26 Jul 2022 23:12:04 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866324; bh=SumzHWPrJXjBUp98LTeC/go1TA4Q4K5i+wABmXv+FwE=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=v4lMpdDnD57CClbJbPXWah50sIKYFBXI4+OEcEEjgm4otaiw1+ioTtGFJPvhrn2Ez
 HOMIOJcJ80Gw01pF6yvUXcXtLLgyouxhEwjHvZ6bSapQIrbSVgfHndsnZhMcoSq0mL
 JezcoJfDH6Bzlnu5oRDZSazPaY9jw2fDTMuCBp0k=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 09/15] Revert "block: Let replace_child_noperm free
 children"
Date: Tue, 26 Jul 2022 23:11:28 +0300
Message-Id: <20220726201134.924743-10-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
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
---
 block.c | 102 +++++++++++++-------------------------------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index 4e38fc45c0..87e2f23d13 100644
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
@@ -2340,7 +2338,6 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
-    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
@@ -2348,9 +2345,6 @@ static void bdrv_replace_child_commit(void *opaque)
     BdrvReplaceChildState *s = opaque;
     GLOBAL_STATE_CODE();
 
-    if (s->free_empty_child && !s->child->bs) {
-        bdrv_child_free(s->child);
-    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2368,26 +2362,22 @@ static void bdrv_replace_child_abort(void *opaque)
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
 
@@ -2404,44 +2394,30 @@ static TransactionActionDrv bdrv_replace_child_drv = {
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
 
@@ -2823,22 +2799,8 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
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
@@ -2877,9 +2839,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
-    if (!new_bs) {
-        *childp = NULL;
-    }
 
     if (new_bs) {
         assert_bdrv_graph_writable(new_bs);
@@ -2910,10 +2869,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
-
-    if (free_empty_child && !child->bs) {
-        bdrv_child_free(child);
-    }
 }
 
 /**
@@ -2945,14 +2900,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
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
@@ -2974,6 +2922,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
+    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -3052,9 +3001,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs, true);
-    /* child_bs was non-NULL, so new_child must not have been freed */
-    assert(new_child != NULL);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -3115,7 +3062,8 @@ static void bdrv_detach_child(BdrvChild **childp)
     BlockDriverState *old_bs = (*childp)->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(childp, NULL, true);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -5169,11 +5117,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5183,6 +5127,8 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    *childp = NULL;
 }
 
 /*
@@ -5226,7 +5172,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran, true);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5391,9 +5337,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran, true);
-    /* @new_bs must have been non-NULL, so @child must not have been freed */
-    assert(child != NULL);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.25.1


