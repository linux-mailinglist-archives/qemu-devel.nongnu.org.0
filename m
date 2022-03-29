Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A6D4EB541
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:26:45 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJMS-0006TX-8E
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:26:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgI-0006Km-Tg; Tue, 29 Mar 2022 16:43:10 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:43502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgG-0006py-L9; Tue, 29 Mar 2022 16:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=xK3ovzB+3/KRAoIB61X9i0LIro3duRg4BPTIYPI0PoE=; 
 t=1648586588;x=1649191988; 
 b=R1acgb8WXSsjS6a5gzULXp4m/GcmM7/FMLzb0yvCYU9Yk+1fPM5EmJzCdesn+5FxLqYyX746gv8TmxfRd9pHIO3XeChW1ov2rGVj+77vaXWoLWIwA/0eghv0JODsFGqLcH3pWFswNA8u17B5QdE5kyJEHPBi5zZakAq8c/+0EtaBnRCpD5WpCaKg2delpo4TWWERhkhWxPYTLM7p7r3s4crRuWXq3WxEyyvFRYI3f1EixJ2xjr+gKE67ynN4so+KatHfqNIBKY2UHOgaR6phMLGi7T7EMaYJn+VkwWt8D96cmcx2/Us5+X3s5lHORDtZgmm2FIFUXr9avxY16JjK6w==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfu-000374-Eu; Tue, 29 Mar 2022 23:42:46 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 26/45] blockdev: transaction: refactor handling transaction
 properties
Date: Tue, 29 Mar 2022 23:40:48 +0300
Message-Id: <20220329204107.411011-27-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E1FB8704E9CBF83467E8A25B5576996E00894C459B0CD1B9B1D99708C07F7DC1FAD7C264039B88CAC206EF2094F4D734F07C61FB63C679A1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7B114C2C2C20B7E62EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA609FEDB32AE41556A9B0356D42CED14C420879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C07E7E81EEA8A9722B8941B15DA834481FA18204E546F3947C062BEEFFB5F8EA3EF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637BA939FD1B3BAB99B389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637FBDF82509E845C6CD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7F416E633B12B5334EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3FE621C1A6B846BFC35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F52E4619A1778CE5233FB87B47FD049E039C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34A5970F8A4685C8AB27EAB1D9C7B098CFFA3DA26D0BF4C8D62C93EA5FC0B52DDC524C2D224085D0DD1D7E09C32AA3244C9B125DD7C63F77C42881C052724132858A6D4CC6FBFAC2518D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZVSE5JGlQg/g==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEF843922F6B2E2EA609CDC8A1A2A736FC6E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Only backup supports GROUPED mode. Make this logic more clear. And
avoid passing extra thing to each action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c | 88 ++++++++++++------------------------------------------
 1 file changed, 19 insertions(+), 69 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 6c08ee4401..404ba4a394 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1197,7 +1197,6 @@ struct BlkActionState {
     TransactionAction *action;
     const BlkActionOps *ops;
     JobTxn *block_job_txn;
-    TransactionProperties *txn_props;
     QTAILQ_ENTRY(BlkActionState) entry;
 };
 
@@ -1216,19 +1215,6 @@ TransactionActionDrv internal_snapshot_drv = {
     .clean = internal_snapshot_clean,
 };
 
-static int action_check_completion_mode(BlkActionState *s, Error **errp)
-{
-    if (s->txn_props->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
-        error_setg(errp,
-                   "Action '%s' does not support Transaction property "
-                   "completion-mode = %s",
-                   TransactionActionKind_str(s->action->type),
-                   ActionCompletionMode_str(s->txn_props->completion_mode));
-        return -1;
-    }
-    return 0;
-}
-
 static void internal_snapshot_action(BlkActionState *common,
                                      Transaction *tran, Error **errp)
 {
@@ -1251,15 +1237,9 @@ static void internal_snapshot_action(BlkActionState *common,
 
     tran_add(tran, &internal_snapshot_drv, state);
 
-    /* 1. parse input */
     device = internal->device;
     name = internal->name;
 
-    /* 2. check for validation */
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     bs = qmp_get_root_bs(device, errp);
     if (!bs) {
         return;
@@ -1445,9 +1425,6 @@ static void external_snapshot_action(BlkActionState *common, Transaction *tran,
     }
 
     /* start processing */
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
 
     state->old_bs = bdrv_lookup_bs(device, node_name, errp);
     if (!state->old_bs) {
@@ -2007,10 +1984,6 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_add_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_add.data;
     /* AIO context taken and released within qmp_block_dirty_bitmap_add */
     qmp_block_dirty_bitmap_add(action->node, action->name,
@@ -2057,10 +2030,6 @@ static void block_dirty_bitmap_clear_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_clear_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_clear.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2108,10 +2077,6 @@ static void block_dirty_bitmap_enable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_enable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_enable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2153,10 +2118,6 @@ static void block_dirty_bitmap_disable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_disable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_disable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2198,10 +2159,6 @@ static void block_dirty_bitmap_merge_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_merge_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_merge.data;
 
     state->bitmap = block_dirty_bitmap_merge(action->node, action->target,
@@ -2226,10 +2183,6 @@ static void block_dirty_bitmap_remove_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_remove_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_remove.data;
 
     state->bitmap = block_dirty_bitmap_remove(action->node, action->name,
@@ -2333,25 +2286,6 @@ static const BlkActionOps actions_map[] = {
      */
 };
 
-/**
- * Allocate a TransactionProperties structure if necessary, and fill
- * that structure with desired defaults if they are unset.
- */
-static TransactionProperties *get_transaction_properties(
-    TransactionProperties *props)
-{
-    if (!props) {
-        props = g_new0(TransactionProperties, 1);
-    }
-
-    if (!props->has_completion_mode) {
-        props->has_completion_mode = true;
-        props->completion_mode = ACTION_COMPLETION_MODE_INDIVIDUAL;
-    }
-
-    return props;
-}
-
 /*
  * 'Atomic' group operations.  The operations are performed as a set, and if
  * any fail then we roll back all operations in the group.
@@ -2365,12 +2299,29 @@ void qmp_transaction(TransactionActionList *actions,
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
+    ActionCompletionMode comp_mode =
+        has_properties ? properties->completion_mode :
+        ACTION_COMPLETION_MODE_INDIVIDUAL;
 
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
      */
-    properties = get_transaction_properties(properties);
-    if (properties->completion_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+    if (comp_mode != ACTION_COMPLETION_MODE_INDIVIDUAL) {
+        for (act = actions; act; act = act->next) {
+            TransactionActionKind type = act->value->type;
+
+            if (type != TRANSACTION_ACTION_KIND_BLOCKDEV_BACKUP &&
+                type != TRANSACTION_ACTION_KIND_DRIVE_BACKUP)
+            {
+                error_setg(errp,
+                           "Action '%s' does not support Transaction property "
+                           "completion-mode = %s",
+                           TransactionActionKind_str(type),
+                           ActionCompletionMode_str(comp_mode));
+                return;
+            }
+        }
+
         block_job_txn = job_txn_new();
     }
 
@@ -2392,7 +2343,6 @@ void qmp_transaction(TransactionActionList *actions,
         state->ops = ops;
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
-        state->txn_props = properties;
 
         state->ops->action(state, tran, &local_err);
         if (local_err) {
-- 
2.35.1


