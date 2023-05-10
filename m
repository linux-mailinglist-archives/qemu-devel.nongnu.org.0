Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2A6FE12D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:08:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlPF-0006s0-7x; Wed, 10 May 2023 11:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlP7-0006p0-Hk; Wed, 10 May 2023 11:07:01 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pwlP0-0001Td-Bj; Wed, 10 May 2023 11:06:57 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:a884:0:640:947b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id EB06C5EC4E;
 Wed, 10 May 2023 18:06:39 +0300 (MSK)
Received: from vsementsov-nix.yandex-team.ru (unknown [2a02:6b8:b081:2::1:11])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (smtpcorp/Yandex) with ESMTPSA id P6XgPR0OpqM0-ZwutVvAc; 
 Wed, 10 May 2023 18:06:39 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683731199; bh=r8f/te8QM4q750DKav1zHKpgLx0MD/WBl5noJ8ZqNes=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=dqIqkichS8NHBfaB/fwQK319++/3K1ZiEyQN+93Q9RAgePzeRRa1y5fkN3qMUUSdk
 waCCuEbReTdqRFy0jwXVAcgXSVZxF9nDAwjKyJ+68jOBCRRkmjL87GMoFYW90kLsZ5
 EB0sLbcaXtx7OoxyEdXFGXV2smNAq3jZZ+1Zt0ik=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 vsementsov@yandex-team.ru, den@openvz.org, alexander.ivanov@virtuozzo.com
Subject: [PATCH v9 4/6] blockdev: transaction: refactor handling transaction
 properties
Date: Wed, 10 May 2023 18:06:22 +0300
Message-Id: <20230510150624.310640-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510150624.310640-1-vsementsov@yandex-team.ru>
References: <20230510150624.310640-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Only backup supports GROUPED mode. Make this logic more clear. And
avoid passing extra thing to each action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 blockdev.c | 96 +++++++++++++-----------------------------------------
 1 file changed, 22 insertions(+), 74 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index f236e5c27e..6bcf80b18b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1220,7 +1220,6 @@ struct BlkActionState {
     TransactionAction *action;
     const BlkActionOps *ops;
     JobTxn *block_job_txn;
-    TransactionProperties *txn_props;
     QTAILQ_ENTRY(BlkActionState) entry;
 };
 
@@ -1239,19 +1238,6 @@ TransactionActionDrv internal_snapshot_drv = {
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
@@ -1274,15 +1260,9 @@ static void internal_snapshot_action(BlkActionState *common,
 
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
@@ -1466,9 +1446,6 @@ static void external_snapshot_action(BlkActionState *common, Transaction *tran,
     }
 
     /* start processing */
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
 
     state->old_bs = bdrv_lookup_bs(device, node_name, errp);
     if (!state->old_bs) {
@@ -2012,10 +1989,6 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_add_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_add.data;
     /* AIO context taken and released within qmp_block_dirty_bitmap_add */
     qmp_block_dirty_bitmap_add(action->node, action->name,
@@ -2062,10 +2035,6 @@ static void block_dirty_bitmap_clear_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_clear_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_clear.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2113,10 +2082,6 @@ static void block_dirty_bitmap_enable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_enable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_enable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2158,10 +2123,6 @@ static void block_dirty_bitmap_disable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_disable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_disable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2203,10 +2164,6 @@ static void block_dirty_bitmap_merge_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_merge_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_merge.data;
 
     state->bitmap = block_dirty_bitmap_merge(action->node, action->target,
@@ -2231,10 +2188,6 @@ static void block_dirty_bitmap_remove_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_remove_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_remove.data;
 
     state->bitmap = block_dirty_bitmap_remove(action->node, action->name,
@@ -2338,25 +2291,6 @@ static const BlkActionOps actions_map[] = {
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
@@ -2368,24 +2302,42 @@ void qmp_transaction(TransactionActionList *actions,
                      Error **errp)
 {
     TransactionActionList *act;
-    bool has_properties = !!properties;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
-    Transaction *tran = tran_new();
+    Transaction *tran;
+    ActionCompletionMode comp_mode =
+        properties ? properties->completion_mode :
+        ACTION_COMPLETION_MODE_INDIVIDUAL;
 
     GLOBAL_STATE_CODE();
 
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
+                           "Action '%s' does not support transaction property "
+                           "completion-mode = %s",
+                           TransactionActionKind_str(type),
+                           ActionCompletionMode_str(comp_mode));
+                return;
+            }
+        }
+
         block_job_txn = job_txn_new();
     }
 
     /* drain all i/o before any operations */
     bdrv_drain_all();
 
+    tran = tran_new();
+
     /* We don't do anything in this loop that commits us to the operations */
     for (act = actions; act; act = act->next) {
         TransactionAction *dev_info = act->value;
@@ -2401,7 +2353,6 @@ void qmp_transaction(TransactionActionList *actions,
         state->ops = ops;
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
-        state->txn_props = properties;
 
         state->ops->action(state, tran, &local_err);
         if (local_err) {
@@ -2419,9 +2370,6 @@ delete_and_fail:
     /* failure, and it is all-or-none; roll back all operations */
     tran_abort(tran);
 exit:
-    if (!has_properties) {
-        qapi_free_TransactionProperties(properties);
-    }
     job_txn_unref(block_job_txn);
 }
 
-- 
2.34.1


