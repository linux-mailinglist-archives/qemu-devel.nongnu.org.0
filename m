Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CDE4EB4F6
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:58:08 +0200 (CEST)
Received: from localhost ([::1]:40734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIul-0001py-3V
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:58:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfB-0003ts-Av; Tue, 29 Mar 2022 16:42:02 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:59312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIf7-0006gm-Ih; Tue, 29 Mar 2022 16:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=xnuHENKDoF6iJyYvlWYVGK9PZYQRb5NNnSsbI0QtXsg=; 
 t=1648586517;x=1649191917; 
 b=pTTUhyeLhJQ5gQejsyRLUgRCazNDNp6M3T5qX0i53k7hYm0BJDUclF4IdZgG7awg68JUInr26b2Uz8ynvODQwlVs7GYfAUXGUXCNJoU8yKMvBcXEMun/EltojnCEWytMKoUHB+Smb0t1j8w4V7pcm0yaUGPguXfK6yjvP1jBM0Luir54plHkwUQkXBDloyixHXNML6/j0wCNM+kIhqSStC7MMMhX/7LdQb4RSmzbzN3WNm58RxMiwpSu6+m8KSsnF12xuOs7d06i0cZqN0ExDZJZiwG4XIIQ4RGNsJXwtVzqwDQ1NZd81qS/28D/tFHQV3yd5pr9KaYy3mblujPfSg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIf2-000374-IK; Tue, 29 Mar 2022 23:41:52 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 10/45] Revert "block: Let replace_child_tran keep indirect
 pointer"
Date: Tue, 29 Mar 2022 23:40:32 +0300
Message-Id: <20220329204107.411011-11-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6163EE6E06DD4447CEC1754C785D0B844400894C459B0CD1B9FD0E2CA14EC7F9B68E975DFCC7A7FE43C206EF2094F4D73462FD7B6C194EAF12
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE721D130CF676D2164EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379C6642364E0E74208638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D844E5E712E63A17BC451142E8FB6805CE6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7934314F73869482B9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B60CDF180582EB8FBA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCC0FF8ADD377BDB973AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637A9B5CFA561830F3FD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC3670308542539A7722CA490CB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF0D1981A9E2AC6B64B68EA56A421EF71D7B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346F44602F3B494634F5A6848AC72DB09DF755262914B9B5EFC58B6455DDFA67890BC8D0E8976C725F1D7E09C32AA3244C024299FF07F76E47C5BE147BF98F3E9755E75C8D0ED9F6EE83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYe9xy5C+zFbg==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF61F383886C57A7AA68D90C4C532F6FD7E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 82b54cf51656bf3cd5ed1ac549e8a1085a0e3290.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 83 +++++++--------------------------------------------------
 1 file changed, 10 insertions(+), 73 deletions(-)

diff --git a/block.c b/block.c
index 7612fb6a60..0ad5e2f09a 100644
--- a/block.c
+++ b/block.c
@@ -2256,7 +2256,6 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
-    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2272,29 +2271,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
-    /*
-     * old_bs reference is transparently moved from @s to s->child.
-     *
-     * Pass &s->child here instead of s->childp, because:
-     * (1) s->old_bs must be non-NULL, so bdrv_replace_child_noperm() will not
-     *     modify the BdrvChild * pointer we indirectly pass to it, i.e. it
-     *     will not modify s->child.  From that perspective, it does not matter
-     *     whether we pass s->childp or &s->child.
-     *     (TODO: Right now, bdrv_replace_child_noperm() never modifies that
-     *     pointer anyway (though it will in the future), so at this point it
-     *     absolutely does not matter whether we pass s->childp or &s->child.)
-     * (2) If new_bs is not NULL, s->childp will be NULL.  We then cannot use
-     *     it here.
-     * (3) If new_bs is NULL, *s->childp will have been NULLed by
-     *     bdrv_replace_child_tran()'s bdrv_replace_child_noperm() call, and we
-     *     must not pass a NULL *s->childp here.
-     *     (TODO: In its current state, bdrv_replace_child_noperm() will not
-     *     have NULLed *s->childp, so this does not apply yet.  It will in the
-     *     future.)
-     *
-     * So whether new_bs was NULL or not, we cannot pass s->childp here; and in
-     * any case, there is no reason to pass it anyway.
-     */
+    /* old_bs reference is transparently moved from @s to @s->child */
     bdrv_replace_child_noperm(&s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
@@ -2311,32 +2288,22 @@ static TransactionActionDrv bdrv_replace_child_drv = {
  * Note: real unref of old_bs is done only on commit.
  *
  * The function doesn't update permissions, caller is responsible for this.
- *
- * Note that if new_bs == NULL, @childp is stored in a state object attached
- * to @tran, so that the old child can be reinstated in the abort handler.
- * Therefore, if @new_bs can be NULL, @childp must stay valid until the
- * transaction is committed or aborted.
- *
- * (TODO: The reinstating does not happen yet, but it will once
- * bdrv_replace_child_noperm() NULLs *childp when new_bs is NULL.)
  */
-static void bdrv_replace_child_tran(BdrvChild **childp,
-                                    BlockDriverState *new_bs,
+static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
                                     Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
-        .child = *childp,
-        .childp = new_bs == NULL ? childp : NULL,
-        .old_bs = (*childp)->bs,
+        .child = child,
+        .old_bs = child->bs,
     };
     tran_add(tran, &bdrv_replace_child_drv, s);
 
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(childp, new_bs);
-    /* old_bs reference is transparently moved from *childp to @s */
+    bdrv_replace_child_noperm(&child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
 }
 
 /*
@@ -4901,7 +4868,6 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
-    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -4931,19 +4897,10 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
     bdrv_child_free(s->child);
 }
 
-static void bdrv_remove_filter_or_cow_child_clean(void *opaque)
-{
-    BdrvRemoveFilterOrCowChild *s = opaque;
-
-    /* Drop the bs reference after the transaction is done */
-    bdrv_unref(s->bs);
-    g_free(s);
-}
-
 static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
     .abort = bdrv_remove_filter_or_cow_child_abort,
     .commit = bdrv_remove_filter_or_cow_child_commit,
-    .clean = bdrv_remove_filter_or_cow_child_clean,
+    .clean = g_free,
 };
 
 /*
@@ -4961,11 +4918,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         return;
     }
 
-    /*
-     * Keep a reference to @bs so @childp will stay valid throughout the
-     * transaction (required by bdrv_replace_child_tran())
-     */
-    bdrv_ref(bs);
     if (child == bs->backing) {
         childp = &bs->backing;
     } else if (child == bs->file) {
@@ -4975,13 +4927,12 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(childp, NULL, tran);
+        bdrv_replace_child_tran(*childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .bs = bs,
         .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
@@ -5007,8 +4958,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
-    assert(to != NULL);
-
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
         assert(c->bs == from);
         if (!should_update_child(c, to)) {
@@ -5024,12 +4973,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-
-        /*
-         * Passing a pointer to the local variable @c is fine here, because
-         * @to is not NULL, and so &c will not be attached to the transaction.
-         */
-        bdrv_replace_child_tran(&c, to, tran);
+        bdrv_replace_child_tran(c, to, tran);
     }
 
     return 0;
@@ -5044,8 +4988,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
- *
- * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -5058,8 +5000,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     BlockDriverState *to_cow_parent = NULL;
     int ret;
 
-    assert(to != NULL);
-
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
         assert(from != to);
@@ -5115,9 +5055,6 @@ out:
     return ret;
 }
 
-/**
- * Replace node @from by @to (where neither may be NULL).
- */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5185,7 +5122,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.35.1


