Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACE24ED03A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:40:00 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhux-0004FR-Ef
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:39:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft2-0008DL-0t
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:52 -0400
Received: from [2a00:1450:4864:20::12c] (port=38552
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsz-0003K2-4z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:51 -0400
Received: by mail-lf1-x12c.google.com with SMTP id bq24so22131485lfb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDZQchG3r98jLu7NUk8dQgu1A5+94jHUslCgQPH56lE=;
 b=zqZpChd7XaubqNDD8iuibviL8InZdM1ZlVbzm7qk/tctjxaG1r2z2JEJxJWgZGOb+T
 mkruEo/CAf575EoSoReqtnZQrOQJV1bKhrbBpE/MEbmyvI+QGuZlcv9UAq8x+Y3Vjm2b
 xCqpNM7t8Kav2edfn9lJbnO5PLmMESgUxl0dBwHFzWBggo0IBthPPIB1i7wJMHMmq2Uf
 l2PJaz9sI0Mq59h1oWFIP5wywHo8KUDjqe82wDwJv6VWPtgi/07rolrL8PyRCsZwqsS4
 fX+eo7BMhmJZRDQxnhub4QXECO8SwDlyn7yCrQ/WFh5Z8mx6n7H9z/xgfDhfOfcNVCE3
 xc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDZQchG3r98jLu7NUk8dQgu1A5+94jHUslCgQPH56lE=;
 b=LWY52+UyhJnXBe+1NypdnhYXEZS9NaQaLUEcESgaUlTOIB4DQ0jVDYvI1VG9YIjGYI
 stOZ7Y573FqduobYr6Pmu0AwDDA2/+JqA3mfJtMuQpOtMSDF5DqE1mQ1Mv8qXnHNFrNS
 OMCYbQjaIV5ayGWj9qRP86BjxqpOPL3GMnqBD6AVMfoQbW9H7xio09So09N7re+MQgVj
 MuNyl24ofy27MOGaRBDc/jdP5ZpFQkUWrdlB9qXKMqIkNPNAnTZPe7VIkeGypcY2mtmV
 guV4T3v0l5Okh7znVwM2Rm8IADcWuwdj+2QEzh6cDpSPPVXLWoTBSDzHdguMGURniWCQ
 DzaQ==
X-Gm-Message-State: AOAM530wnsF2RQKO1RDYpcyTobRAsiG9jr2CnyZZfgD+lo32K93OyJ41
 eD2KEnJIjucsk9ZAmCXqebrF0w==
X-Google-Smtp-Source: ABdhPJyJZU01wg144J9qcQR9mpJJMoRBiCw79xwYa0BCIedn+HWCnufyTndRLLJ1Z6V8bBsqk9KsQg==
X-Received: by 2002:a05:6512:3a95:b0:44a:6189:dad1 with SMTP id
 q21-20020a0565123a9500b0044a6189dad1mr8469647lfu.334.1648675787547; 
 Wed, 30 Mar 2022 14:29:47 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:47 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 26/45] blockdev: transaction: refactor handling transaction
 properties
Date: Thu, 31 Mar 2022 00:28:43 +0300
Message-Id: <20220330212902.590099-27-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, hreitz@redhat.com,
 vsementsov@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only backup supports GROUPED mode. Make this logic more clear. And
avoid passing extra thing to each action.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c | 88 ++++++++++++------------------------------------------
 1 file changed, 19 insertions(+), 69 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index b44f0ca101..3c9e826355 100644
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
@@ -1468,9 +1448,6 @@ static void external_snapshot_action(BlkActionState *common, Transaction *tran,
     }
 
     /* start processing */
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
 
     state->old_bs = bdrv_lookup_bs(device, node_name, errp);
     if (!state->old_bs) {
@@ -2030,10 +2007,6 @@ static void block_dirty_bitmap_add_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_add_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_add.data;
     /* AIO context taken and released within qmp_block_dirty_bitmap_add */
     qmp_block_dirty_bitmap_add(action->node, action->name,
@@ -2080,10 +2053,6 @@ static void block_dirty_bitmap_clear_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_clear_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_clear.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2131,10 +2100,6 @@ static void block_dirty_bitmap_enable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_enable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_enable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2176,10 +2141,6 @@ static void block_dirty_bitmap_disable_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_disable_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_disable.data;
     state->bitmap = block_dirty_bitmap_lookup(action->node,
                                               action->name,
@@ -2221,10 +2182,6 @@ static void block_dirty_bitmap_merge_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_merge_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_merge.data;
 
     state->bitmap = block_dirty_bitmap_merge(action->node, action->target,
@@ -2249,10 +2206,6 @@ static void block_dirty_bitmap_remove_action(BlkActionState *common,
 
     tran_add(tran, &block_dirty_bitmap_remove_drv, state);
 
-    if (action_check_completion_mode(common, errp) < 0) {
-        return;
-    }
-
     action = common->action->u.block_dirty_bitmap_remove.data;
 
     state->bitmap = block_dirty_bitmap_remove(action->node, action->name,
@@ -2356,25 +2309,6 @@ static const BlkActionOps actions_map[] = {
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
@@ -2390,14 +2324,31 @@ void qmp_transaction(TransactionActionList *actions,
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
     Transaction *tran = tran_new();
+    ActionCompletionMode comp_mode =
+        has_properties ? properties->completion_mode :
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
 
@@ -2419,7 +2370,6 @@ void qmp_transaction(TransactionActionList *actions,
         state->ops = ops;
         state->action = dev_info;
         state->block_job_txn = block_job_txn;
-        state->txn_props = properties;
 
         state->ops->action(state, tran, &local_err);
         if (local_err) {
-- 
2.35.1


