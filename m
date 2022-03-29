Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC94EB51D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:17:15 +0200 (CEST)
Received: from localhost ([::1]:51088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJDG-0002nx-Ov
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:17:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgS-0006Pc-6e; Tue, 29 Mar 2022 16:43:28 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:50474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgQ-0006rB-94; Tue, 29 Mar 2022 16:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=HPv0qqabGWiDsp0vwsKbvSbogI2fgLycRlgLZ57FzSk=; 
 t=1648586598;x=1649191998; 
 b=nOnl+14DbwGLR6L7Su/oTO++BKvqEW5x+HRbgVCc1Hev1LF594lhReB+dY5S0fYCJEGn8YwYQ+7qchAoO8/xVkqxOmh8PmYYCZwX93jUibDbtOYNJpwmZCT5dgfPJYI3FUJoljFehZamSH3ZBMtowwvuycjIknfp841bW3izxH8ha/YRjGifSlXzXVVZ29vLunMg9+EPSnBV4Ix/0xepnsXjprqRjYrTNde2mGtIDprdQ3u+0RFJrcs2b0FojY8iENPJ4TP8JE8PlEEFrjCWt9OOyhHCwLPy/WUjSh9fH+k8wnjSEYoM2VzqpKEbSNV4oj+EJ2JK5zGxW873SGw/6A==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIg4-000374-5N; Tue, 29 Mar 2022 23:42:56 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v4 28/45] qapi: block: add blockdev-del transaction action
Date: Tue, 29 Mar 2022 23:40:50 +0300
Message-Id: <20220329204107.411011-29-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6155011D2176585D5E1D932C628789187E00894C459B0CD1B9527F6DEFF7C50462485F49AECE73078AC206EF2094F4D734A5CBAC82CA3D0FCF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72F22E6DC541F75D9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637E1D2769089B3DFB28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80AF30562DE8523C2BFF9F9DBFA9097B96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ABB305BD10C6E5099FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B974A882099E279BDA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCAAC0AB268FC727953AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F00AD5422731CA18CCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5269905D867A8EE2AF82984890642470D9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349A401E2B4D763A4AA06C54ACBD6243D3ED7CF2183860FD261859579C0484397F5678EE11908BF7E11D7E09C32AA3244C05A1288F47576C215CF4608A552B4E2E69B6CAE0477E908DDCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZxCeUomCivag==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE336C705384C87316DC0A873C2FFED379A69E3B846B6A5E16E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Support blockdev-del in a transaction.

The tricky thing is how we update permissions: not after every
blockdev-del operation, but after group of such operations. Soon we'll
support blockdev-add and new blockdev-replace in the same manner, and
we'll be able to do a wide range of block-graph modifying operation in
a bunch, so that permissions are updated only after the whole group, to
avoid intermediate permission conflicts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c            | 66 +++++++++++++++++++++++++++++++++++++++----
 qapi/block-core.json  | 11 ++++++--
 qapi/transaction.json | 12 ++++++++
 3 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 30a5b27b28..517be48399 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2141,7 +2141,12 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
+
+static int blockdev_del(const char *node_name, GSList **detached,
+                        Transaction *tran, Error **errp);
+
 static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
+                               GSList **refresh_list,
                                Transaction *tran, Error **errp)
 {
     switch (act->type) {
@@ -2188,6 +2193,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
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
@@ -2211,6 +2220,7 @@ void qmp_transaction(TransactionActionList *actions,
                      struct TransactionProperties *properties,
                      Error **errp)
 {
+    int ret;
     TransactionActionList *act;
     JobTxn *block_job_txn = NULL;
     Error *local_err = NULL;
@@ -2218,6 +2228,7 @@ void qmp_transaction(TransactionActionList *actions,
     ActionCompletionMode comp_mode =
         has_properties ? properties->completion_mode :
         ACTION_COMPLETION_MODE_INDIVIDUAL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     /* Does this transaction get canceled as a group on failure?
      * If not, we don't really need to make a JobTxn.
@@ -2246,13 +2257,32 @@ void qmp_transaction(TransactionActionList *actions,
 
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
@@ -3486,19 +3516,22 @@ fail:
     g_slist_free_full(drained, (GDestroyNotify) bdrv_subtree_drained_end);
 }
 
-void qmp_blockdev_del(const char *node_name, Error **errp)
+/* Function doesn't update permissions, it's a responsibility of caller. */
+static int blockdev_del(const char *node_name, GSList **refresh_list,
+                        Transaction *tran, Error **errp)
 {
     AioContext *aio_context;
     BlockDriverState *bs;
+    int ret = -EINVAL;
 
     bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Failed to find node with node-name='%s'", node_name);
-        return;
+        return ret;
     }
     if (bdrv_has_blk(bs)) {
         error_setg(errp, "Node %s is in use", node_name);
-        return;
+        return ret;
     }
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
@@ -3520,10 +3553,33 @@ void qmp_blockdev_del(const char *node_name, Error **errp)
     }
 
     QTAILQ_REMOVE(&monitor_bdrv_states, bs, monitor_list);
-    bdrv_unref(bs);
+    bdrv_unref_tran(bs, refresh_list, tran);
+
+    ret = 0;
 
 out:
     aio_context_release(aio_context);
+    return ret;
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
+
+out:
+    tran_finalize(tran, ret);
 }
 
 static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9a5a3641d0..c0d56b7128 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4394,6 +4394,13 @@
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
@@ -4401,8 +4408,6 @@
 # The command will fail if the node is attached to a device or is
 # otherwise being used.
 #
-# @node-name: Name of the graph node to delete.
-#
 # Since: 2.9
 #
 # Example:
@@ -4425,7 +4430,7 @@
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


