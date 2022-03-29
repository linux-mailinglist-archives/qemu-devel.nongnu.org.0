Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924B54EB550
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:30:16 +0200 (CEST)
Received: from localhost ([::1]:46046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJPr-0001lr-Jr
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:30:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgn-0006Tp-0H; Tue, 29 Mar 2022 16:43:43 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:33742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIgj-0006tw-LH; Tue, 29 Mar 2022 16:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=R5GkwmwlT5QifW0Y/7B8aYlH4Brd7mTDb2YkqiUfXqE=; 
 t=1648586617;x=1649192017; 
 b=mql+dm3YQ/oTtHvVScYz+PMQh1JtiJcYWoArEZQ3mV+AgOzpHHlFIgiX4rSAAlhCO+HK/C8Lb+zYmbMRIcRsT0wqtVEWfX2fcf8XSNSCQGzCoFYjQElfn5fYyrYYkU5yD4DF8dOxY7f9P9+PADY/eJhwL/jxOcoYBcWNanDld0cNrZNB4gNRBPuKFJmjYidV28Mav9XD4IVWu9h+gN66AWhmxiXYLZJWw4sr59qWDX+JqhzXL6jkFJ84GLoZIPaT+crLUw1H8/BNJ0wilsMjoaRnif5Ffxd62H/VcvyIcGsj10G/Ui3/SaAPgf4U1oSGmjovVffHteR323Dt8Wa4Yg==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIgL-000374-Uz; Tue, 29 Mar 2022 23:43:14 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH v4 31/45] qapi: block: add blockdev-add transaction action
Date: Tue, 29 Mar 2022 23:40:53 +0300
Message-Id: <20220329204107.411011-32-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B932E5DE57C1C2A688F388F0BE9AB8DE8DC206EF2094F4D734E60F2C249B59A687
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB84ED444C624799EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637B100969577675F2D8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8141B501CD2F691E6E6E43E09A17EAA326F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7820CF4CC0E318EFB9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC83F654DD4873A78A3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F249797B4B1AC14496D8C47C27EEC5E9FB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC446469D8A8717206BBF593E0A4FA3DD8F5AAFB3C682F30B94EC9F4C28627024B629C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344E332383F80D58BB62A0C31BEBD4F2ACB1E14F2CC736AB81CB5FBC8C85C7105BA8DA95065044B1051D7E09C32AA3244C66618DFF5EFA97515BA0ACE3BA9911CD8580396430872480DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGYHG8CDRj/fvQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE336C705384C873160FBC57C9B89A9F064461C97E8EC7F2F0E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

Use new flag to avoid permission updates where possible during
blockdev_add, so that a bunch of add/del (and soon, new 'replace')
command may be done before actual permission update to avoid
intermediate permission conflicts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 blockdev.c            | 55 ++++++++++++++++++++++++++++++++++++++++---
 qapi/transaction.json | 10 +++++++-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 3569b0e6ee..d95e1e6922 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -63,6 +63,9 @@
 #include "qemu/main-loop.h"
 #include "qemu/throttle-options.h"
 
+static int blockdev_add(BlockdevOptions *options, GSList **refresh_list,
+                        Transaction *tran, Error **errp);
+
 QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
     QTAILQ_HEAD_INITIALIZER(monitor_bdrv_states);
 
@@ -2196,6 +2199,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
         blockdev_del(act->u.blockdev_del.data->node_name,
                      refresh_list, tran, errp);
         return;
+    case TRANSACTION_ACTION_KIND_BLOCKDEV_ADD:
+        blockdev_add(act->u.blockdev_add.data,
+                     refresh_list, tran, errp);
+        return;
     /*
      * Where are transactions for MIRROR, COMMIT and STREAM?
      * Although these blockjobs use transaction callbacks like the backup job,
@@ -2259,7 +2266,8 @@ void qmp_transaction(TransactionActionList *actions,
         TransactionActionKind type = act->value->type;
 
         if (refresh_list &&
-            type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL)
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL &&
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD)
         {
             ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
             if (ret < 0) {
@@ -3430,7 +3438,21 @@ out:
     aio_context_release(aio_context);
 }
 
-void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
+static void blockdev_add_abort(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    QTAILQ_REMOVE(&monitor_bdrv_states, bs, monitor_list);
+    bdrv_unref(bs);
+}
+
+TransactionActionDrv blockdev_add_drv = {
+    .abort = blockdev_add_abort,
+};
+
+/* Caller is responsible to refresh permissions */
+static int blockdev_add(BlockdevOptions *options, GSList **refresh_list,
+                        Transaction *tran, Error **errp)
 {
     BlockDriverState *bs;
     QObject *obj;
@@ -3448,15 +3470,42 @@ void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
         goto fail;
     }
 
-    bs = bds_tree_init(qdict, 0, errp);
+    bs = bds_tree_init(qdict, BDRV_O_NOPERM, errp);
     if (!bs) {
         goto fail;
     }
 
+    *refresh_list = g_slist_prepend(*refresh_list, bs);
+    tran_add(tran, &blockdev_add_drv, bs);
+
     bdrv_set_monitor_owned(bs);
 
+    visit_free(v);
+    return 0;
+
 fail:
     visit_free(v);
+    return -EINVAL;
+}
+
+void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+    g_autoptr(GSList) refresh_list = NULL;
+
+    ret = blockdev_add(options, &refresh_list, tran, errp);
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
 
 void qmp_blockdev_reopen(BlockdevOptionsList *reopen_list, Error **errp)
diff --git a/qapi/transaction.json b/qapi/transaction.json
index ea20df770c..000dd16bb7 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -67,7 +67,7 @@
             'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
             'blockdev-backup', 'blockdev-snapshot',
             'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
-            'blockdev-del',
+            'blockdev-del', 'blockdev-add',
             { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
 
 ##
@@ -150,6 +150,13 @@
 { 'struct': 'BlockdevDelWrapper',
   'data': { 'data': 'BlockdevDel' } }
 
+##
+# @BlockdevAddWrapper:
+#
+# Since: 7.1
+##
+{ 'struct': 'BlockdevAddWrapper',
+  'data': { 'data': 'BlockdevOptions' } }
 
 ##
 # @TransactionAction:
@@ -175,6 +182,7 @@
        'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternalWrapper',
        'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
        'blockdev-del': 'BlockdevDelWrapper',
+       'blockdev-add': 'BlockdevAddWrapper',
        'drive-backup': 'DriveBackupWrapper'
    } }
 
-- 
2.35.1


