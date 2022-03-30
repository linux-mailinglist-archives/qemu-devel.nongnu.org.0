Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2804ED075
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:55:25 +0200 (CEST)
Received: from localhost ([::1]:47254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi9s-0005ws-Qx
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:55:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZftA-0008IO-8g
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::131] (port=38558
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft6-0003QC-TD
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:59 -0400
Received: by mail-lf1-x131.google.com with SMTP id bq24so22131956lfb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRcFZ8JsBZ9kpWAgM/aAMIUmqQs4ch467o2iNBnzs3k=;
 b=sUEt9P9QatO9Bn3Y3mjhcEBvBlGTfUIGuusnZS15MdTF+R2kOYDL36UVpWSS7UzmAX
 LbAMRkX/QiEtCgB+dRr9CNrDHWc1dveI5PFGasOgfke2bDRI9bIYIVqW8+mpydmOlh2m
 pl0zRonKiRaNS/H3G1FhIx9GwOy9+gZqXO1XwqCvKi2n2k8xkxvBCTk0LjDLIoxGbeRH
 39Xr7hYyF8+EJAOoH4zMQQlrPFBETkYKGQWtnrUyTbFgkrN8JaBcbWMJHub4GkhLdY/I
 GentwVriG6+exjsw7vkwdGsHRTUQfuuLPcXzgHbgbYt9TJHno/ML/2yUJd0BNhg/u1Zp
 klkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRcFZ8JsBZ9kpWAgM/aAMIUmqQs4ch467o2iNBnzs3k=;
 b=AQYLfsOSVt4kn3pIIcLSpB++V6EW19K5uFi7nV3wM58boGUqDwmt6ZjT7BdyA5aD0T
 YWT0UMLbw09bbvUc89a4VxtVy1hAQUi6MOZIvxDBxJK8YEXeIx6EOS0KFJpuwjF24ejY
 YuF24gpWKCrpKxtoZPcQ0yI0BSb6LvCm40PS9x8bdUqklCIJ3ve/G2yE/l0zi3cxzJQE
 O+c8z30L9ipNHPKo5NxvYbAxNscvf3SeJmHbevy+DppPYw3Cup9zzivd2klUs2tnjfZt
 5e/9Oi+GXG/kN7UuqfkFlcQFFji6mY85jVnX0dNcytQ2VTaPIrT4M2hQEDNmXIHXJ1qt
 lbiw==
X-Gm-Message-State: AOAM5300dMSjltCG8JMBiN0QBzeTSjQAXJHGw77TGDgeI7koEs+x8579
 rOAucLdddooPY6BtfZo94KpHqw==
X-Google-Smtp-Source: ABdhPJyok+hEsXpFFgQ5CkuX5DBEsgatUMsFuz2/o612RZJz3rAKGsvzE3RxloP8SbtpWgclsS4WeQ==
X-Received: by 2002:ac2:5d65:0:b0:44a:6d14:4ff8 with SMTP id
 h5-20020ac25d65000000b0044a6d144ff8mr8662694lft.605.1648675795246; 
 Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 38/45] qapi: add x-blockdev-replace transaction action
Date: Thu, 31 Mar 2022 00:28:55 +0300
Message-Id: <20220330212902.590099-39-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x131.google.com
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

Support blockdev-replace in a transaction.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                            |  4 ++--
 blockdev.c                         | 29 ++++++++++++++++++++++++-----
 include/block/block-global-state.h |  2 ++
 qapi/transaction.json              | 15 ++++++++++++++-
 4 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/block.c b/block.c
index 4b5b7d8794..efe0ec0f00 100644
--- a/block.c
+++ b/block.c
@@ -2381,8 +2381,8 @@ static TransactionActionDrv bdrv_replace_child_drv = {
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
index 3d84cb6f92..89167fbc08 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2166,8 +2166,9 @@ static void abort_commit(void *opaque)
     g_assert_not_reached(); /* this action never succeeds */
 }
 
-static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
-                            Error **errp)
+/* Caller is responsible to update permission of nodes added to @update_list */
+static int blockdev_replace(BlockdevReplace *repl, GSList **refresh_list,
+                            Transaction *tran, Error **errp)
 {
     BdrvChild *child = NULL;
     BlockDriverState *new_child_bs;
@@ -2220,14 +2221,27 @@ static int blockdev_replace(BlockdevReplace *repl, Transaction *tran,
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
 
@@ -2287,6 +2301,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
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
@@ -2355,7 +2373,8 @@ void qmp_transaction(TransactionActionList *actions,
 
         if (refresh_list &&
             type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL &&
-            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD)
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD &&
+            type != TRANSACTION_ACTION_KIND_X_BLOCKDEV_REPLACE)
         {
             ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
             if (ret < 0) {
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index fa5f698228..253cc28a9a 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -66,6 +66,8 @@ int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
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


