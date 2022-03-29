Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522644EB4E2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:53:49 +0200 (CEST)
Received: from localhost ([::1]:58360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIqa-00028C-DP
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:53:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfB-0003tx-Bh; Tue, 29 Mar 2022 16:42:02 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:58488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf5-0006fk-Ch; Tue, 29 Mar 2022 16:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=bi+VxUy90Gp2ZS52Q5nbEAD6b4sxJ1EK4A2Zqgm6Pdw=; 
 t=1648586515;x=1649191915; 
 b=vR3KCAKDOcW1iOH14xMZqOeBDbfiWi91Spy+oKe0MPkIgIZZPqQXcPuHbrHNe7SQNr7LzCysAyf5LSR1wNla1m+WVKhEDmWuaPyJwHsfjRKrbCxeCeEz+HVfTScUxyFGH9hsfsxQ62J6rB4jLmoDAw0FhsQKD5sidOLpP7T39rruz+owG1a3ieR2DkiGFr1aQcW2abBNb8GpFPCkbCpy9onubj/NvpWaBRDfo7voHkwuH+l3tIxzJNmoMWT4IKLI8inRrVwBVOu4fjswBv96aZa8LgW5MJX4YDkkuutsvBK8WmVwiSVithH6M9SKC1AwZGOe/w2Tss+yz4YfobfmdQ==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIf0-000374-Ej; Tue, 29 Mar 2022 23:41:50 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 09/45] Revert "block: Let replace_child_noperm free
 children"
Date: Tue, 29 Mar 2022 23:40:31 +0300
Message-Id: <20220329204107.411011-10-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B9A9185E99B7C846A1AF3D4473B33DC032C206EF2094F4D734196362BA94D7177D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE71BB7708D34E2BFDAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637BB46061768088B55EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA65D05FEDA54213F616A7371623073D61320879F7C8C5043D14489FFFB0AA5F4BF7680F9384605B903AD76BF5943A59ECC8941B15DA834481FA18204E546F3947CA9FF340AA05FB58CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706C07FE7DDBB4AB7389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637EDAD75E181AE3ED6D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F416E633B12B5334EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3D90E0058AC9F27DF35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF0CF00FA1A5655C148C21DCE93A9785112B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34987A0E8D235BB534A8EB53687F4B42ED7FFB93F7EB8039AA339883727AAFB4D4D0CEABF3977A817F1D7E09C32AA3244C024099FF07F76E472881C052724132851E098CBE561D634383B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYGGvU9FkDkbg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF94605BA00164646AD6E1A295DC756B2AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
pointers automatically when child->bs is cleared) in a nicer way.

This reverts commit b0a9f6fed3d80de610dcd04a7e66f9f30a04174f.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 102 +++++++++++++-------------------------------------------
 1 file changed, 23 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index b61c4b6128..7612fb6a60 100644
--- a/block.c
+++ b/block.c
@@ -87,10 +87,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
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
@@ -2260,16 +2258,12 @@ typedef struct BdrvReplaceChildState {
     BdrvChild *child;
     BdrvChild **childp;
     BlockDriverState *old_bs;
-    bool free_empty_child;
 } BdrvReplaceChildState;
 
 static void bdrv_replace_child_commit(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
 
-    if (s->free_empty_child && !s->child->bs) {
-        bdrv_child_free(s->child);
-    }
     bdrv_unref(s->old_bs);
 }
 
@@ -2286,26 +2280,22 @@ static void bdrv_replace_child_abort(void *opaque)
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
 
@@ -2322,44 +2312,30 @@ static TransactionActionDrv bdrv_replace_child_drv = {
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
 
@@ -2728,22 +2704,8 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
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
@@ -2780,9 +2742,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
     }
 
     child->bs = new_bs;
-    if (!new_bs) {
-        *childp = NULL;
-    }
 
     if (new_bs) {
         QLIST_INSERT_HEAD(&new_bs->parents, child, next_parent);
@@ -2812,10 +2771,6 @@ static void bdrv_replace_child_noperm(BdrvChild **childp,
         bdrv_parent_drained_end_single(child);
         drain_saldo++;
     }
-
-    if (free_empty_child && !child->bs) {
-        bdrv_child_free(child);
-    }
 }
 
 /**
@@ -2845,14 +2800,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BdrvChild *child = *s->child;
     BlockDriverState *bs = child->bs;
 
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
@@ -2874,6 +2822,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
 
     bdrv_unref(bs);
     bdrv_child_free(child);
+    *s->child = NULL;
 }
 
 static TransactionActionDrv bdrv_attach_child_common_drv = {
@@ -2951,9 +2900,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs, true);
-    /* child_bs was non-NULL, so new_child must not have been freed */
-    assert(new_child != NULL);
+    bdrv_replace_child_noperm(&new_child, child_bs);
 
     *child = new_child;
 
@@ -3012,7 +2959,8 @@ static void bdrv_detach_child(BdrvChild **childp)
 {
     BlockDriverState *old_bs = (*childp)->bs;
 
-    bdrv_replace_child_noperm(childp, NULL, true);
+    bdrv_replace_child_noperm(childp, NULL);
+    bdrv_child_free(*childp);
 
     if (old_bs) {
         /*
@@ -5027,11 +4975,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5041,6 +4985,8 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
+
+    *childp = NULL;
 }
 
 /*
@@ -5083,7 +5029,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
          * Passing a pointer to the local variable @c is fine here, because
          * @to is not NULL, and so &c will not be attached to the transaction.
          */
-        bdrv_replace_child_tran(&c, to, tran, true);
+        bdrv_replace_child_tran(&c, to, tran);
     }
 
     return 0;
@@ -5239,9 +5185,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran, true);
-    /* @new_bs must have been non-NULL, so @child must not have been freed */
-    assert(child != NULL);
+    bdrv_replace_child_tran(&child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.35.1


