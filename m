Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D54ED06E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:53:04 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi7b-0000DT-A6
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:53:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0008IC-RO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::12b] (port=39796
 helo=mail-lf1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft2-0003LM-RE
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:57 -0400
Received: by mail-lf1-x12b.google.com with SMTP id w7so38088134lfd.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiJJL+167Ro0sTrikfBLl2PHuNZOVZpcsshtWuMI4vc=;
 b=8DSCU7SiXwbzaV0qjdR2Z9o6A/+ZEqLoc4Nx44a7uMjkrmxEo29O2GrNmyZ48Pis6e
 Ivb/HhfCPJ25oYsFmWRPNOw+2Gy1Las+eYB9Ybn31AFy6vPmixy7XWhJhXVRJpjmTOrb
 6xrUah3mr1IhkGAoPHeN3ls2PMcQss10Z6TxHNkK4bvUunYCIvSaPJl39esB2daslNuH
 pKNmiBbw2yCHWdsLkU1WO5p8LSnZn4UJ3g3LWIlviyWjM4MyQky3WpSGvCv7NzwsNIRP
 Wp3TTOuUo+Shvqu/0u5xuPO9F5XwURnqs8asmEZUZhi/i4tSt2MIw1a5vF7pbw8PwjzY
 XHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiJJL+167Ro0sTrikfBLl2PHuNZOVZpcsshtWuMI4vc=;
 b=sKyy1Pn80OyZ9PaZ6F/0EzgTYQzflzsdynlTGpboCOVrYDH9Y3XmOKxrblAXCM/R0F
 PXjcQW7Q84stv7HLjPq3arXFNMFeDWvVNl1JWe2nQx68CHq98TpfHgpadYeXc8DUMHJ2
 dyepAQeUgnYi1pnjBa+GcyUrqx3Tkn9ts17Vj+k4gpp96deKZV7fwgOB3zfbE3XeLz9Z
 K6/xLyMrRRx3JOhZlj5ZqTWykJ6QBTxN/33l5zgDtA5il1Ec0CtOmqcne0S+8f04t9xe
 /1E6ZXNFhFTx9qSJDMmT4EjJIQPZ2KALzHRsil8Fm5CDFyMuJVXxsKWkDDMGHjBZmyBY
 V8TQ==
X-Gm-Message-State: AOAM530aifp7B56gSeTpN7ibLf3kDfDrWb/3wJZrfOtBNHYRV1Xdh5aW
 3Vk5/yplSQLXSbERPqu3enCMbA==
X-Google-Smtp-Source: ABdhPJyp3RpLdsTIGrvzdi7+JBs0zo/c+bB13gbNzy/tBwCmtE7yF7zng2YMO82Ge86JSw4F/UTCDQ==
X-Received: by 2002:a05:6512:39cf:b0:44a:22e3:35e0 with SMTP id
 k15-20020a05651239cf00b0044a22e335e0mr8061509lfu.219.1648675788916; 
 Wed, 30 Mar 2022 14:29:48 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:48 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 28/45] qapi: block: add blockdev-del transaction action
Date: Thu, 31 Mar 2022 00:28:45 +0300
Message-Id: <20220330212902.590099-29-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12b.google.com
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
 vsementsov@openvz.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support blockdev-del in a transaction.

The tricky thing is how we update permissions: not after every
blockdev-del operation, but after group of such operations. Soon we'll
support blockdev-add and new blockdev-replace in the same manner, and
we'll be able to do a wide range of block-graph modifying operation in
a bunch, so that permissions are updated only after the whole group, to
avoid intermediate permission conflicts.

Additionally we need to add  aio_context_acquire_tran() transaction
action, to keep aio context acquired including final bdrv_delete() in
commit of bdrv_unref_tran().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c            | 87 +++++++++++++++++++++++++++++++++++++------
 qapi/block-core.json  | 11 ++++--
 qapi/transaction.json | 12 ++++++
 3 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index a7287bf64f..1cd95f4f02 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -63,6 +63,9 @@
 #include "qemu/main-loop.h"
 #include "qemu/throttle-options.h"
 
+static int blockdev_del(const char *node_name, GSList **detached,
+                        Transaction *tran, Error **errp);
+
 /* Protected by BQL */
 QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
     QTAILQ_HEAD_INITIALIZER(monitor_bdrv_states);
@@ -2163,6 +2166,7 @@ static void abort_commit(void *opaque)
 }
 
 static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
+                               GSList **refresh_list,
                                Transaction *tran, Error **errp)
 {
     switch (act->type) {
@@ -2209,6 +2213,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
         block_dirty_bitmap_remove_action(act->u.block_dirty_bitmap_remove.data,
                                          tran, errp);
         return;
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_DEL:
+        blockdev_del(act->u.blockdev_del.data->node_name,
+                     refresh_list, tran, errp);
+        return;
     /*
      * Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
@@ -2234,6 +2242,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
+    int ret;
     TransactionActionList *act;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
@@ -2241,6 +2250,7 @@ void qmp_transaction(TransactionActionList *actions,
     ActionCompletionMode comp_mode =
         has_properties ? properties->completion_mode :
         ACTION_COMPLETION_MODE_INDIVIDUAL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     GLOBAL_STATE_CODE();
 
@@ -2271,13 +2281,32 @@ void qmp_transaction(TransactionActionList *actions,
 
     /* We don't do anything in this loop that commits us to the operations */
     for (act = actions; act; act = act->next) {
-        transaction_action(act->value, block_job_txn, tran, &local_err);
+        TransactionActionKind type = act->value->type;
+
+        if (refresh_list &&
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL)
+        {
+            ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+            if (ret < 0) {
+                goto delete_and_fail;
+            }
+            g_slist_free(refresh_list);
+            refresh_list = NULL;
+        }
+
+        transaction_action(act->value, block_job_txn, &refresh_list, tran,
+                           &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             goto delete_and_fail;
         }
     }
 
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+    if (ret < 0) {
+        goto delete_and_fail;
+    }
+
     tran_commit(tran);
 
     /* success */
@@ -3520,9 +3549,25 @@ fail:
     g_slist_free(drained);
 }
 
-void qmp_blockdev_del(const char *node_name, Error **errp)
+static void aio_context_acquire_clean(void *opaque)
+{
+    aio_context_release(opaque);
+}
+
+TransactionActionDrv aio_context_acquire_drv = {
+    .clean = aio_context_acquire_clean,
+};
+
+static void aio_context_acquire_tran(AioContext *ctx, Transaction *tran)
+{
+    aio_context_acquire(ctx);
+    tran_add(tran, &aio_context_acquire_drv, ctx);
+}
+
+/* Function doesn't update permissions, it's a responsibility of caller. */
+static int blockdev_del(const char *node_name, GSList **refresh_list,
+                        Transaction *tran, Error **errp)
 {
-    AioContext *aio_context;
     BlockDriverState *bs;
 
     GLOBAL_STATE_CODE();
@@ -3530,36 +3575,54 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-        return;
+        return -EINVAL;
     }
     if (bdrv_has_blk(bs)) {
         error_setg(errp, "Node %s is in use", node_name);
-        return;
+        return -EINVAL;
     }
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
+    aio_context_acquire_tran(bdrv_get_aio_context(bs), tran);
 
     if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_DRIVE_DEL, errp)) {
-        goto out;
+        return -EINVAL;
     }
 
     if (!QTAILQ_IN_USE(bs, monitor_list)) {
         error_setg(errp, "Node %s is not owned by the monitor",
                    bs->node_name);
-        goto out;
+        return -EINVAL;
     }
 
     if (bs->refcnt > 1) {
         error_setg(errp, "Block device %s is in use",
                    bdrv_get_device_or_node_name(bs));
-        goto out;
+        return -EINVAL;
     }
 
     QTAILQ_REMOVE(&monitor_bdrv_states, bs, monitor_list);
-    bdrv_unref(bs);
+    bdrv_unref_tran(bs, refresh_list, tran);
+
+    return 0;
+}
+
+void qmp_blockdev_del(const char *node_name, Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    ret = blockdev_del(node_name, &refresh_list, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
 out:
-    aio_context_release(aio_context);
+    tran_finalize(tran, ret);
 }
 
 static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index e89f2dfb5b..d915cddde9 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4407,6 +4407,13 @@
 { 'command': 'blockdev-reopen',
   'data': { 'options': ['BlockdevOptions'] } }
 
+##
+# @BlockdevDel:
+#
+# @node-name: Name of the graph node to delete.
+##
+{ 'struct': 'BlockdevDel', 'data': { 'node-name': 'str' } }
+
 ##
 # @blockdev-del:
 #
@@ -4414,8 +4421,6 @@
 # The command will fail if the node is attached to a device or is
 # otherwise being used.
 #
-# @node-name: Name of the graph node to delete.
-#
 # Since: 2.9
 #
 # Example:
@@ -4438,7 +4443,7 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'blockdev-del', 'data': { 'node-name': 'str' } }
+{ 'command': 'blockdev-del', 'data': 'BlockdevDel' }
 
 ##
 # @BlockdevCreateOptionsFile:
diff --git a/qapi/transaction.json b/qapi/transaction.json
index 381a2df782..ea20df770c 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -53,6 +53,7 @@
 # @blockdev-snapshot-internal-sync: Since 1.7
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
+# @blockdev-del: since 7.1
 #
 # Features:
 # @deprecated: Member @drive-backup is deprecated.  Use member
@@ -66,6 +67,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
+            'blockdev-del',
             { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
@@ -140,6 +142,15 @@
 { 'struct': 'DriveBackupWrapper',
   'data': { 'data': 'DriveBackup' } }
 
+##
+# @BlockdevDelWrapper:
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockdevDelWrapper',
+  'data': { 'data': 'BlockdevDel' } }
+
+
 ##
 # @TransactionAction:
 #
@@ -163,6 +174,7 @@
        'blockdev-snapshot': 'BlockdevSnapshotWrapper',
        'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternalWrapper',
        'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
+       'blockdev-del': 'BlockdevDelWrapper',
        'drive-backup': 'DriveBackupWrapper'
    } }
 
-- 
2.35.1


