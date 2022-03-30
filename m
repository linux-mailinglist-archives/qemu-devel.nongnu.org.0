Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80A4ED043
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:42:10 +0200 (CEST)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhx3-00059u-7V
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:42:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft7-0008H8-3F
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: from [2a00:1450:4864:20::230] (port=41632
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft2-0003ML-OO
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:55 -0400
Received: by mail-lj1-x230.google.com with SMTP id 17so29456618ljw.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rv+CiCzHjV62zD13urXNP6spV+Pm476sotNs+8GpRa4=;
 b=0EczUlSmBFNexZIGCFfYwHXWb1r8A4TZ2tsJ6dOb4AmRxRjtxFfbIB+3XvYCUAquQl
 OVm5ohcQ8RTAnXmWpkrMj4xKPMl0rSJA0HOxtDXYY/cqYa6qCKD/uuOFWAGfKj1Ko7Yb
 q+p2hO+3VJj6aDr28GftI13/zVql7vGEFAgW7Kd+DPLxikOLCjDVwTEdjGV4xl7WDjOP
 CGxufw1wuDa6SpcmzKbibYIWyfpzRevUiXtqBhwcA5Ot3F3L9EFgHHpB9Ngch+qVUpkh
 DTYbNHQaoDVK9f2+08ybmpu00GE4jboeSd9jjHfsZJtUuN6amEsQRxxo8niedy/lOObw
 kdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rv+CiCzHjV62zD13urXNP6spV+Pm476sotNs+8GpRa4=;
 b=rEpm7pXpdrglqW+rHMv/MEwBIA/khux3lCKWuYf9pqTtshpySKRkXk22E/DYh/J8Xi
 VwLSgL/GTUpFWS7+jdEHKmxkjgcggpVTSnOvFDYcvlfXiK8MSyF9omelq6vBEIBZXKcq
 ik4iP8/9zp9TM2bOtQ2uAAU/U+VQXYSbjICdpD7aaZzQnNVlG3GoEYXCfCS9n5zFbK4d
 JnL2jHicSFjcUIIqucEEoketDB0HHqU1VQn+fMrrTqJaM5zQuzAdxYMx/QVprbIWqjw+
 RwTwLqD4HfpYDyNeYFwtPtz3xvuktVHBjq3W3FHG1R0dpSLV7Zo8ORazNeLB2eo3Muxz
 v8JQ==
X-Gm-Message-State: AOAM533z+oOJGkPSkpSNXf36S48yDo5TnGe2QcDceTiB4gn3ORKZMjI1
 3essd/jwbJe5U0aecEp2sWZzlq3WmvHwkQ==
X-Google-Smtp-Source: ABdhPJxbeBJSSN5YZFZqOJsInHlzS6bxFkjayJY2NULZucWmVP+fGESGu4Ag8igwQLCez9Tr3OZJ6A==
X-Received: by 2002:a2e:b014:0:b0:23c:9593:f7 with SMTP id
 y20-20020a2eb014000000b0023c959300f7mr8271877ljk.209.1648675790858; 
 Wed, 30 Mar 2022 14:29:50 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:50 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 31/45] qapi: block: add blockdev-add transaction action
Date: Thu, 31 Mar 2022 00:28:48 +0300
Message-Id: <20220330212902.590099-32-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
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

Use new flag to avoid permission updates where possible during
blockdev_add, so that a bunch of add/del (and soon, new 'replace')
command may be done before actual permission update to avoid
intermediate permission conflicts.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 blockdev.c            | 54 ++++++++++++++++++++++++++++++++++++++++---
 qapi/transaction.json | 10 +++++++-
 2 files changed, 60 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 16a9b98afc..3afd2ceea8 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -65,6 +65,8 @@
 
 static int blockdev_del(const char *node_name, GSList **detached,
                         Transaction *tran, Error **errp);
+static int blockdev_add(BlockdevOptions *options, GSList **refresh_list,
+                        Transaction *tran, Error **errp);
 
 /* Protected by BQL */
 QTAILQ_HEAD(, BlockDriverState) monitor_bdrv_states =
@@ -2216,6 +2218,10 @@ static void transaction_action(TransactionAction *act, JobTxn *block_job_txn,
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
@@ -2283,7 +2289,8 @@ void qmp_transaction(TransactionActionList *actions,
         TransactionActionKind type = act->value->type;
 
         if (refresh_list &&
-            type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL)
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_DEL &&
+            type != TRANSACTION_ACTION_KIND_BLOCKDEV_ADD)
         {
             ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
             if (ret < 0) {
@@ -3454,7 +3461,21 @@ out:
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
@@ -3472,15 +3493,42 @@ void qmp_blockdev_add(BlockdevOptions *options, Error **errp)
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


