Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B031C4EB502
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:04:53 +0200 (CEST)
Received: from localhost ([::1]:55648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJ1I-0003Yc-JV
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:04:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIhT-0006xx-BV; Tue, 29 Mar 2022 16:44:24 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:50280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIhR-00071k-K7; Tue, 29 Mar 2022 16:44:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=xXRU+RrgKTKKV8nfWtlNT9epIToQL9udfeUjWiEtiqo=; 
 t=1648586661;x=1649192061; 
 b=sMUKnJU9ewk4yjTmB+3psofv2oRcgikSnScsHHrrv5h9MbobLwOLSIdWXM+sBX2w0O3eO2CAJBxXtEQTLjGlYxBNAJ/hlB3rMF8e08/iCye/68OJ5PujOvu1fsaBz0VSyTkovY49+Ej0BIduanFfSHNF1sc9y5cHhIN+x11JHKb9TlQDet+Le6e60gxJaJPEUOaGafdVkIHn8XzDAX2LS7yS+iI2UTp/mdBcvd7luLJYYrDZoauQCplm2zWbvyRR+oDwNXPjR0pGU7W0KgK7r8arGSVjhSbuJAZRiuQuYP9fcKA4QwACrpyBK8dDm5JwnvZ9Oh6PZJaf0L3pI8EdHA==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIhP-000374-Az; Tue, 29 Mar 2022 23:44:19 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v4 38/45] qapi: add x-blockdev-replace transaction action
Date: Tue, 29 Mar 2022 23:41:00 +0300
Message-Id: <20220329204107.411011-39-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB6155011D2176585D5E1D932C628789187E00894C459B0CD1B92B802C23B2BCF7162E62FF7F4D571580C206EF2094F4D734C8A1163FE0F36968
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE78E8764B5BC580342EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CF19945FAF91394A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D805FE929044CF1C64A70A53FF9E0327866F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE749E2213E709ACCBA9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F446042972877693876707352033AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EEFAD5A440E159F97D269E641683F5DD3FD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3A5ED62E35AC703CC040F9FF01DFDA4A8C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637BC615C5154A25A8BEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5807AA7B7E7BDF7D9BA0688E32FDA925F9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C02783DDD5A45DEFD1BE3E9133607ADBC542FE666BB85391E78068032BAA09D17B8937B41F68AE621D7E09C32AA3244C65D974DEE11DACCA288F94001E94C8B68580396430872480DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGapbgfn/gsudQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE65960E19525D0BDFE5CDBF58A453EF393CBDAA1D3353E4C4E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Support blockdev-replace in a transaction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c               |  4 ++--
 blockdev.c            | 29 ++++++++++++++++++++++++-----
 include/block/block.h |  2 ++
 qapi/transaction.json | 15 ++++++++++++++-
 4 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 5717115523..a51be66e0a 100644
--- a/block.c
+++ b/block.c
@@ -2302,8 +2302,8 @@ static TransactionActionDrv bdrv_replace_child_drv = {
 };
 
 /* Caller is responsible to refresh permissions in @refresh_list */
-static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
-                                    GSList **refresh_list, Transaction *tran)
+void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                             GSList **refresh_list, Transaction *tran)
 {
     BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
     *s = (BdrvReplaceChildState) {
diff --git a/blockdev.c b/blockdev.c
index c1ffdbcfa4..2920c33421 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2147,8 +2147,9 @@ static void abort_commit(void *opaque)
 static int blockdev_del(const char *node_name, GSList **detached,
                         Transaction *tran, Error **errp);
 
-static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
-                            Error **errp)
+/* Caller is responsible to update permission of nodes added to @update_list */
+static int blockdev_replace(BlockdevReplace *repl, GSList **refresh_list,
+                            Transaction *tran, Error **errp)
 {
     BdrvChild *child = NULL;
     BlockDriverState *new_child_bs;
@@ -2201,14 +2202,27 @@ static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
         return -EINVAL;
     }
 
-    return bdrv_replace_child_bs(child, new_child_bs, tran, errp);
+    bdrv_replace_child_tran(child, new_child_bs, refresh_list, tran);
+    return 0;
 }
 
 void qmp_x_blockdev_replace(BlockdevReplace *repl, Error **errp)
 {
+    int ret;
     Transaction *tran = tran_new();
-    int ret = blockdev_replace(repl, tran, errp);
+    g_autoptr(GSList) update_list = NULL;
+
+    ret = blockdev_replace(repl, &update_list, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
 
+    ret = bdrv_list_refresh_perms(update_list, NULL, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+out:
     tran_finalize(tran, ret);
 }
 
@@ -2268,6 +2282,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
         blockdev_add(act->u.blockdev_add.data,
                      refresh_list, tran, errp);
         return;
+    case TRANSACTION_ACTION_KIND_X_BLOCKDEV_REPLACE:
+        blockdev_replace(act->u.x_blockdev_replace.data,
+                         refresh_list, tran, errp);
+        return;
     /*
      * Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
@@ -2332,7 +2350,8 @@ void qmp_transaction(TransactionActionList *actions,
 
         if (refresh_list &&
             type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL &&
-            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD)
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD &&
+            type != TRANSACTION_ACTION_KIND_X_BLOCKDEV_REPLACE)
         {
             ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
             if (ret < 0) {
diff --git a/include/block/block.h b/include/block/block.h
index 182e87ce77..59031c8b03 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -406,6 +406,8 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
                           Transaction *tran, Error **errp);
+void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
+                             GSList **refresh_list, Transaction *tran);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
diff --git a/qapi/transaction.json b/qapi/transaction.json
index 000dd16bb7..61cb2d2312 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -54,10 +54,13 @@
 # @blockdev-snapshot-sync: since 1.1
 # @drive-backup: Since 1.6
 # @blockdev-del: since 7.1
+# @blockdev-add: since 7.1
+# @x-blockdev-replace: since 7.1
 #
 # Features:
 # @deprecated: Member @drive-backup is deprecated.  Use member
 #              @blockdev-backup instead.
+# @unstable: Member @x-blockdev-replace is experimental
 #
 # Since: 1.1
 ##
@@ -68,6 +71,7 @@
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
             'blockdev-del', 'blockdev-add',
+            { 'name': 'x-blockdev-replace', 'features': [ 'unstable' ] },
             { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
@@ -158,6 +162,14 @@
 { 'struct': 'BlockdevAddWrapper',
   'data': { 'data': 'BlockdevOptions' } }
 
+##
+# @BlockdevReplaceWrapper:
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockdevReplaceWrapper',
+  'data': { 'data': 'BlockdevReplace' } }
+
 ##
 # @TransactionAction:
 #
@@ -183,7 +195,8 @@
        'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
        'blockdev-del': 'BlockdevDelWrapper',
        'blockdev-add': 'BlockdevAddWrapper',
-       'drive-backup': 'DriveBackupWrapper'
+       'drive-backup': 'DriveBackupWrapper',
+       'x-blockdev-replace': 'BlockdevReplaceWrapper'
    } }
 
 ##
-- 
2.35.1


