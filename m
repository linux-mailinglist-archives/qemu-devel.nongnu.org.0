Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D34EB50B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:06:47 +0200 (CEST)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ38-0005zX-Fh
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:06:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfy-0005NT-Vm; Tue, 29 Mar 2022 16:42:51 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:58808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfw-0006mp-67; Tue, 29 Mar 2022 16:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=r+uTbn2nS+O1JNSkWiNOnLgNKup77F3ThhZ3WpCLKQk=; 
 t=1648586568;x=1649191968; 
 b=V9Ku6GGWOUOlMDONdJqnIIKTNZLN4YffzzOF0NJng/JJqr53vumLgMEoE8ggMwobm6kZHf9koMD5is8MkU2vXGLUXlIuHDKbCJB993zdzhJ1Tt5yQnI99owUFD/XeVzu3zCMjh/6K4HC/oy3KkY6WHpgsPsGxPc2jRzjSwwzSnQjmLOd2pTf+E4OrVvE0mn3DyPiD83x02AeNVh+1rBC9gUyErKrixOR2CxC8GV6tyLaeALx6en/Pz+bqMvGnW6RaLoDcBXYmvHCRDhi/6BZMyNEGYSG3Kjpi/2sNgR7aBDo9NhpRLRzMA7uDeVCJOZidP5AlhNO262YEJWkz+TtPQ==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfZ-000374-Vp; Tue, 29 Mar 2022 23:42:26 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 22/45] block: implemet bdrv_unref_tran()
Date: Tue, 29 Mar 2022 23:40:44 +0300
Message-Id: <20220329204107.411011-23-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E1FB8704E9CBF83467E8A25B5576996E00894C459B0CD1B9378D29EC92C0A3553C51DFBA969E124BC206EF2094F4D734DC3326C543D49E8D
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BCC85671EC7A750CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637991D0D3E51C637188F08D7030A58E5AD1A62830130A00468AEEEE3FBA3A834EE7353EFBB55337566F593E0A4FA3DD8F552598E3BB778E4F611D8DC335D55F4FD1DF9E95F17B0083B26EA987F6312C9EC9647ADFADE5905B1CB629EEF1311BF91D2E47CDBA5A96583C09775C1D3CA48CFCA5A41EBD8A3A0199FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C317B107DEF921CE79117882F4460429728AD0CFFFB425014E868A13BD56FB6657D81D268191BDAD3DC09775C1D3CA48CFD39D67C3C96FEF3BBA3038C0950A5D36C8A9BA7A39EFB766EC990983EF5C0329BA3038C0950A5D36D5E8D9A59859A8B60A12739077100EC176E601842F6C81A1F004C906525384307823802FF610243DF43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CE415FC94E84D00BA43847C11F186F3C59DAA53EE0834AAEE
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF0DF4C70CE3D373D096EBF8EFB82ACB776B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52DC48ACC2A39D04F89CDFB48F4795C241BDAD6C7F3747799A
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349EC559D073CA5B68F0E4F9ADC4352E4D25C9A24DE97822C9CF4811B8A26046D4C5ADCBDB855E86C31D7E09C32AA3244C022A99FF07F76E476689E97CB2CB33228894E9C85370243E83B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGa31HmgAQRj9A==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF0622E97F6C01462B51D1F6AF85188B38E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Now nodes are removed during block-graph update transactions now? Look
at bdrv_replace_child_tran: bdrv_unref() is simply postponed to commit
phase.

What is the problem with it?

We want to make copy-before-write permissions strict: it should unshare
write always, not only when it has at least one parent. But if so, we
can't neither insert the filter nor remove it:

To insert the filter, we should first do blockdev-add, and filter will
unshare write on the child, so, blockdev-add will fail if disk is in
use by guest.

To remove the filter, we should first do a replace operations, which
again leads to situation when the filter and old parent share one
child, and all parent want write permission when the filter unshare it.

The solution is first do both graph-modifying operations (add &
replace, or replace & remove) and only then update permissions. But
that is not possible with current method to transactionally remove the
block node: if we just postpone bdrv_unref() to commit phase, than on
prepare phase the node is not removed, and it still keep all
permissions on its children.

What to do? In general, I don't know. But it's possible to solve the
problem for the block drivers that doesn't need access to their
children on .bdrv_close(). For such drivers we can detach their
children on prepare stage (still, postponing bdrv_close() call to
commit phase). For this to work we of course should effectively reduce
bs->refcnt on prepare phase as well.

So, the logic of new bdrv_unref_tran() is:

prepare:
  decrease refcnt and detach children if possible (and if refcnt is 0)

commit:
  do bdrv_delete() if refcnt is 0

abort:
  restore children and refcnt

What's the difficulty with it? If we want to transactionally (and with
no permission change) remove nodes, we should understand that some
nodes may be removed recursively, and finally we get several possible
not deleted leaves, where permissions should be updated. How caller
will know what to update? That leads to additional transaction-wide
refresh_list variable, which is filled by various graph modifying
function. So, user should declare referesh_list variable and do one or
several block-graph modifying operations (that may probably remove some
nodes), then user call bdrv_list_refresh_perms on resulting
refresh_list.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c                   | 224 +++++++++++++++++++++++++-------------
 include/block/block.h     |   5 +-
 include/block/block_int.h |   7 ++
 3 files changed, 157 insertions(+), 79 deletions(-)

diff --git a/block.c b/block.c
index 22c5010c4d..7c22b31259 100644
--- a/block.c
+++ b/block.c
@@ -89,10 +89,12 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, GSList **refresh_list,
+                              Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
+                               GSList **refresh_list,
                                Transaction *change_child_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
@@ -2285,38 +2287,23 @@ typedef struct BdrvReplaceChildState {
     BlockDriverState *old_bs;
 } BdrvReplaceChildState;
 
-static void bdrv_replace_child_commit(void *opaque)
-{
-    BdrvReplaceChildState *s = opaque;
-
-    bdrv_unref(s->old_bs);
-}
-
 static void bdrv_replace_child_abort(void *opaque)
 {
     BdrvReplaceChildState *s = opaque;
     BlockDriverState *new_bs = s->child->bs;
 
-    /* old_bs reference is transparently moved from @s to @s->child */
     bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
 static TransactionActionDrv bdrv_replace_child_drv = {
-    .commit = bdrv_replace_child_commit,
     .abort = bdrv_replace_child_abort,
     .clean = g_free,
 };
 
-/*
- * bdrv_replace_child_tran
- *
- * Note: real unref of old_bs is done only on commit.
- *
- * The function doesn't update permissions, caller is responsible for this.
- */
+/* Caller is responsible to refresh permissions in @refresh_list */
 static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
-                                    Transaction *tran)
+                                    GSList **refresh_list, Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
@@ -2327,9 +2314,15 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
 
     if (new_bs) {
         bdrv_ref(new_bs);
+        *refresh_list = g_slist_prepend(*refresh_list, new_bs);
     }
     bdrv_replace_child_noperm(child, new_bs);
-    /* old_bs reference is transparently moved from @child to @s */
+    if (s->old_bs) {
+        bdrv_unref_tran(s->old_bs, refresh_list, tran);
+        if (s->old_bs->refcnt > 0) {
+            *refresh_list = g_slist_prepend(*refresh_list, s->old_bs);
+        }
+    }
 }
 
 /*
@@ -2829,7 +2822,6 @@ static TransactionActionDrv bdrv_try_set_aio_context_drv = {
     .clean = g_free,
 };
 
-__attribute__((unused))
 static int bdrv_try_set_aio_context_tran(BlockDriverState *bs,
                                          AioContext *new_ctx,
                                          Transaction *tran,
@@ -3103,30 +3095,40 @@ out:
     return ret < 0 ? NULL : child;
 }
 
-/* Callers must ensure that child->frozen is false. */
-void bdrv_root_unref_child(BdrvChild *child)
+/* Caller is responsible to refresh permissions in @refresh_list */
+static void bdrv_root_unref_child_tran(BdrvChild *child, GSList **refresh_list,
+                                       Transaction *tran)
 {
     BlockDriverState *child_bs = child->bs;
 
-    bdrv_replace_child_noperm(child, NULL);
-    bdrv_child_free(child);
-
-    if (child_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(child_bs, NULL, NULL);
+    bdrv_remove_child(child, refresh_list, tran);
 
+    if (child_bs && child_bs->refcnt > 0) {
         /*
          * When the parent requiring a non-default AioContext is removed, the
          * node moves back to the main AioContext
          */
-        bdrv_try_set_aio_context(child_bs, qemu_get_aio_context(), NULL);
+        bdrv_try_set_aio_context_tran(child_bs, qemu_get_aio_context(),
+                                      tran, NULL);
     }
+}
 
-    bdrv_unref(child_bs);
+/* Callers must ensure that child->frozen is false. */
+void bdrv_root_unref_child(BdrvChild *child)
+{
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    bdrv_root_unref_child_tran(child, &refresh_list, tran);
+
+    /*
+     * Update permissions for old node. We're just taking a parent away, so
+     * we're loosening restrictions. Errors of permission update are not
+     * fatal in this case, ignore them.
+     */
+    bdrv_list_refresh_perms(refresh_list, NULL, tran, NULL);
+
+    tran_commit(tran);
 }
 
 typedef struct BdrvSetInheritsFrom {
@@ -3195,15 +3197,27 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
     }
 }
 
-/* Callers must ensure that child->frozen is false. */
-void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
+/* Caller is responsible to refresh permissions in @refresh_list */
+static void bdrv_unref_child_tran(BlockDriverState *parent, BdrvChild *child,
+                                    GSList **refresh_list, Transaction *tran)
 {
     if (child == NULL) {
         return;
     }
 
-    bdrv_unset_inherits_from(parent, child, NULL);
-    bdrv_root_unref_child(child);
+    bdrv_unset_inherits_from(parent, child, tran);
+    bdrv_root_unref_child_tran(child, refresh_list, tran);
+}
+
+/* Callers must ensure that child->frozen is false. */
+void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child)
+{
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    bdrv_unref_child_tran(parent, child, &refresh_list, tran);
+    bdrv_list_refresh_perms(refresh_list, NULL, tran, NULL);
+    tran_commit(tran);
 }
 
 
@@ -3247,11 +3261,12 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing or bs->file link of a BDS. A new reference is created;
  * callers which don't need their own reference any more must call bdrv_unref().
  *
- * Function doesn't update permissions, caller is responsible for this.
+ * Caller is responsible to refresh permissions in @refresh_list.
  */
 static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
                                            BlockDriverState *child_bs,
                                            bool is_backing,
+                                           GSList **refresh_list,
                                            Transaction *tran, Error **errp)
 {
     int ret = 0;
@@ -3303,13 +3318,15 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_child(child, tran);
+        bdrv_remove_child(child, refresh_list, tran);
     }
 
     if (!child_bs) {
         goto out;
     }
 
+    *refresh_list = g_slist_prepend(*refresh_list, parent_bs);
+
     ret = bdrv_attach_child_noperm(parent_bs, child_bs,
                                    is_backing ? "backing" : "file",
                                    &child_of_bds, role,
@@ -3333,11 +3350,14 @@ out:
     return 0;
 }
 
+/* Caller is responsible to refresh permissions in @refresh_list */
 static int bdrv_set_backing_noperm(BlockDriverState *bs,
                                    BlockDriverState *backing_hd,
+                                   GSList **refresh_list,
                                    Transaction *tran, Error **errp)
 {
-    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, tran, errp);
+    return bdrv_set_file_or_backing_noperm(bs, backing_hd, true, refresh_list,
+                                           tran, errp);
 }
 
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
@@ -3345,15 +3365,16 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 {
     int ret;
     Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
 
     bdrv_drained_begin(bs);
 
-    ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
+    ret = bdrv_set_backing_noperm(bs, backing_hd, &refresh_list, tran, errp);
     if (ret < 0) {
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, tran, errp);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -4302,7 +4323,8 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         assert(bs_entry->state.bs->quiesce_counter > 0);
         ctx = bdrv_get_aio_context(bs_entry->state.bs);
         aio_context_acquire(ctx);
-        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
+        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, &refresh_list,
+                                  tran, errp);
         aio_context_release(ctx);
         if (ret < 0) {
             goto abort;
@@ -4314,14 +4336,7 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         BDRVReopenState *state = &bs_entry->state;
 
         refresh_list = g_slist_prepend(refresh_list, state->bs);
-        if (state->old_backing_bs) {
-            refresh_list = g_slist_prepend(refresh_list, state->old_backing_bs);
-        }
-        if (state->old_file_bs) {
-            refresh_list = g_slist_prepend(refresh_list, state->old_file_bs);
-        }
     }
-
     /*
      * Note that file-posix driver rely on permission update done during reopen
      * (even if no permission changed), because it wants "new" permissions for
@@ -4430,10 +4445,14 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
  * true and reopen_state->new_backing_bs contains a pointer to the new
  * backing BlockDriverState (or NULL).
  *
+ * Caller is responsible to refresh permissions in @refresh_list.
+ *
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
-                                             bool is_backing, Transaction *tran,
+                                             bool is_backing,
+                                             GSList **refresh_list,
+                                             Transaction *tran,
                                              Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4499,14 +4518,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    if (is_backing) {
-        reopen_state->old_backing_bs = old_child_bs;
-    } else {
-        reopen_state->old_file_bs = old_child_bs;
-    }
-
     return bdrv_set_file_or_backing_noperm(bs, new_child_bs, is_backing,
-                                           tran, errp);
+                                           refresh_list, tran, errp);
 }
 
 /*
@@ -4518,6 +4531,8 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
  * flags are the new open flags
  * queue is the reopen queue
  *
+ * Caller is responsible to refresh permissions in @refresh_list.
+ *
  * Returns 0 on success, non-zero on error.  On error errp will be set
  * as well.
  *
@@ -4528,6 +4543,7 @@ static int bdrv_reopen_parse_file_or_backing(BDRVReopenState *reopen_state,
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue,
+                               GSList **refresh_list,
                                Transaction *change_child_tran, Error **errp)
 {
     int ret = -1;
@@ -4648,7 +4664,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true,
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, true, refresh_list,
                                             change_child_tran, errp);
     if (ret < 0) {
         goto error;
@@ -4656,7 +4672,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
     qdict_del(reopen_state->options, "backing");
 
     /* Allow changing the 'file' option. In this case NULL is not allowed */
-    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false,
+    ret = bdrv_reopen_parse_file_or_backing(reopen_state, false, refresh_list,
                                             change_child_tran, errp);
     if (ret < 0) {
         goto error;
@@ -4965,24 +4981,28 @@ static TransactionActionDrv bdrv_remove_child_drv = {
 
 /*
  * A function to remove backing or file child of @bs.
- * Function doesn't update permissions, caller is responsible for this.
+ * Caller is responsible to refresh permissions in @refresh_list.
  */
-static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
+static void bdrv_remove_child(BdrvChild *child, GSList **refresh_list,
+                              Transaction *tran)
 {
     if (!child) {
         return;
     }
 
     if (child->bs) {
-        bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, refresh_list, tran);
     }
 
     tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
+/* Caller is responsible to refresh permissions in @refresh_list */
 static int bdrv_replace_node_noperm(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Transaction *tran,
+                                    bool auto_skip,
+                                    GSList **refresh_list,
+                                    Transaction *tran,
                                     Error **errp)
 {
     BdrvChild *c, *next;
@@ -5002,7 +5022,7 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
                        c->name, from->node_name);
             return -EPERM;
         }
-        bdrv_replace_child_tran(c, to, tran);
+        bdrv_replace_child_tran(c, to, refresh_list, tran);
     }
 
     return 0;
@@ -5053,18 +5073,17 @@ static int bdrv_replace_node_common(BlockDriverState *from,
      * permissions based on new graph. If we fail, we'll roll-back the
      * replacement.
      */
-    ret = bdrv_replace_node_noperm(from, to, auto_skip, tran, errp);
+    ret = bdrv_replace_node_noperm(from, to, auto_skip, &refresh_list, tran,
+                                   errp);
     if (ret < 0) {
         goto out;
     }
 
     if (detach_subchain) {
-        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
+        bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent),
+                          &refresh_list, tran);
     }
 
-    refresh_list = g_slist_prepend(refresh_list, to);
-    refresh_list = g_slist_prepend(refresh_list, from);
-
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
     if (ret < 0) {
         goto out;
@@ -5110,6 +5129,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 {
     int ret;
     Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
 
     assert(!bs_new->backing);
 
@@ -5120,12 +5140,13 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, tran, errp);
+    ret = bdrv_replace_node_noperm(bs_top, bs_new, true, &refresh_list, tran,
+                                   errp);
     if (ret < 0) {
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, tran, errp);
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5147,10 +5168,7 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
     bdrv_drained_begin(old_bs);
     bdrv_drained_begin(new_bs);
 
-    bdrv_replace_child_tran(child, new_bs, tran);
-
-    refresh_list = g_slist_prepend(refresh_list, old_bs);
-    refresh_list = g_slist_prepend(refresh_list, new_bs);
+    bdrv_replace_child_tran(child, new_bs, &refresh_list, tran);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
@@ -6589,6 +6607,58 @@ void bdrv_ref(BlockDriverState *bs)
     bs->refcnt++;
 }
 
+static void bdrv_unref_commit(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    if (bs->refcnt == 0) {
+        bdrv_delete(bs);
+    }
+}
+
+static void bdrv_unref_abort(void *opaque)
+{
+    bdrv_ref(opaque);
+}
+
+static TransactionActionDrv bdrv_unref_drv = {
+    .commit = bdrv_unref_commit,
+    .abort = bdrv_unref_abort,
+};
+
+/*
+ * Transactional unref
+ *   - deletion is postponed to transaction commit
+ *   - where possible children are detached now, and permissions are not
+ *     updated. @refresh_list is filled with nodes, to call
+ *     bdrv_nodes_refresh_perms() on.
+ */
+void bdrv_unref_tran(BlockDriverState *bs, GSList **refresh_list,
+                     Transaction *tran)
+{
+    BdrvChild *child, *next;
+
+    if (!bs) {
+        return;
+    }
+
+    assert(bs->refcnt > 0);
+    bs->refcnt--;
+
+    tran_add(tran, &bdrv_unref_drv, bs);
+
+    if (bs->drv && (!bs->drv->bdrv_close || bs->drv->indepenent_close) &&
+        refresh_list && bs->refcnt == 0)
+    {
+        QLIST_FOREACH_SAFE(child, &bs->children, next, next) {
+            if (child->bs && child->bs->refcnt > 1) {
+                *refresh_list = g_slist_prepend(*refresh_list, child->bs);
+            }
+            bdrv_unref_child_tran(bs, child, refresh_list, tran);
+        }
+    }
+}
+
 /* Release a previously grabbed reference to bs.
  * If after releasing, reference count is zero, the BlockDriverState is
  * deleted. */
diff --git a/include/block/block.h b/include/block/block.h
index 09c254db9b..92fe31bd13 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -208,8 +208,6 @@ typedef struct BDRVReopenState {
     int flags;
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
-    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
-    BlockDriverState *old_file_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
@@ -671,7 +669,10 @@ void bdrv_disable_copy_on_read(BlockDriverState *bs);
 
 void bdrv_ref(BlockDriverState *bs);
 void bdrv_unref(BlockDriverState *bs);
+void bdrv_unref_tran(BlockDriverState *bs, GSList **refresh_list,
+                     Transaction *tran);
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
+int bdrv_try_unref(BlockDriverState *bs, Error **errp);
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
                              const char *child_name,
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 767825aec4..e2bb936451 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -173,6 +173,13 @@ struct BlockDriver {
      */
     bool supports_backing;
 
+    /*
+     * If true that guarantees that .bdrv_close doesn't access any bdrv children
+     * and is safe to be called in commit phase of block-graph modifying
+     * transaction.
+     */
+    bool indepenent_close;
+
     /* For handling image reopen for split or non-split files */
     int (*bdrv_reopen_prepare)(BDRVReopenState *reopen_state,
                                BlockReopenQueue *queue, Error **errp);
-- 
2.35.1


