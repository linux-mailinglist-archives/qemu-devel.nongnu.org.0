Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8009581B5C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 22:53:50 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGRYr-00014u-T1
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 16:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQue-0001Dn-V1; Tue, 26 Jul 2022 16:12:16 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:34406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oGQuc-0001Fu-Dy; Tue, 26 Jul 2022 16:12:16 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7FFBC2E1985;
 Tue, 26 Jul 2022 23:12:06 +0300 (MSK)
Received: from localhost.localdomain (172.31.44.48-vpn.dhcp.yndx.net
 [172.31.44.48])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 ZssKVYgWJm-C5O09WbR; Tue, 26 Jul 2022 23:12:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658866325; bh=kQC/aeeDn6FwBv4UfdYHuo99XfOwJKqkozfP6+z1lvA=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=BoSrlX03hfnqc+OLxscynb2Fq/+re/fBaUOe66F3ON4eBNtibD5GJXnDupprROkcu
 XCi9rtplA9p6iEV2mu9FHSAQP60xNXS3Rt8QSuXt4DQ3hheTT1MsUDjPPJdz9A+aDn
 0X4OaF+Z03cP6fAEczLJxbFUbdbdSadbh/LPn2kM=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru
Subject: [PATCH v7 10/15] Revert "block: Let replace_child_tran keep indirect
 pointer"
Date: Tue, 26 Jul 2022 23:11:29 +0300
Message-Id: <20220726201134.924743-11-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726201134.924743-1-vsementsov@yandex-team.ru>
References: <20220726201134.924743-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 81 +++++++--------------------------------------------------
 1 file changed, 10 insertions(+), 71 deletions(-)

diff --git a/block.c b/block.c
index 87e2f23d13..1b9e0a2d79 100644
--- a/block.c
+++ b/block.c
@@ -2336,7 +2336,6 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
 
 typedef struct BdrvReplaceChildState {
     BdrvChild *child;
-    BdrvChild **childp;
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
@@ -2354,29 +2353,7 @@ static void bdrv_replace_child_abort(void *opaque)
     BlockDriverState *new_bs = s->child->bs;
 
     GLOBAL_STATE_CODE();
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
@@ -2393,32 +2370,22 @@ static TransactionActionDrv bdrv_replace_child_drv = {
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
@@ -5043,7 +5010,6 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
 
 typedef struct BdrvRemoveFilterOrCowChild {
     BdrvChild *child;
-    BlockDriverState *bs;
     bool is_backing;
 } BdrvRemoveFilterOrCowChild;
 
@@ -5073,19 +5039,10 @@ static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
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
@@ -5103,11 +5060,6 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5117,13 +5069,12 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
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
@@ -5149,7 +5100,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
 {
     BdrvChild *c, *next;
 
-    assert(to != NULL);
     GLOBAL_STATE_CODE();
 
     QLIST_FOREACH_SAFE(c, &from->parents, next_parent, next) {
@@ -5167,12 +5117,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
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
@@ -5187,8 +5132,6 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With @detach_subchain=true @to must be in a backing chain of @from. In this
  * case backing link of the cow-parent of @to is removed.
- *
- * @to must not be NULL.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
@@ -5202,7 +5145,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
     int ret;
 
     GLOBAL_STATE_CODE();
-    assert(to != NULL);
 
     if (detach_subchain) {
         assert(bdrv_chain_contains(from, to));
@@ -5259,9 +5201,6 @@ out:
     return ret;
 }
 
-/**
- * Replace node @from by @to (where neither may be NULL).
- */
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
@@ -5337,7 +5276,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(&child, new_bs, tran);
+    bdrv_replace_child_tran(child, new_bs, tran);
 
     found = g_hash_table_new(NULL, NULL);
     refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-- 
2.25.1


