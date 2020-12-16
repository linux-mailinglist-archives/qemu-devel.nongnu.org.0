Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCE92DBB25
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:22:58 +0100 (CET)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQDB-0007tP-JV
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ82-0002eu-1X; Wed, 16 Dec 2020 01:17:38 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123]:51180 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ7z-0001E7-7n; Wed, 16 Dec 2020 01:17:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJGftD0nQHAiWQsYB5jdkOuQewPK4s1NG8O26I0iqHQ3kP5G3Djgen+lnpRUehs0Yj7zZVbsu8Kwo0x26kqeKUwBQRvmViVWRxRsiIGMYLVNKwjWJejst8a91BsWdIAxj2Ot8vu1aspejTsRri/I09Ry2gHekoH2pF2uITypvaCZYRsyn4OSJrrQpayWewBqVLG3itYdDP+AFgVTrgOu7X7k5NUpSmlV25tc/sOWQf6H4oBKPbRLgntw0Jki5BqQjk8vwvGfnH9Du6KYmkcVVvLRp+J61abpGGnotzCOrvUgTABjmyoKrpE0e55FqmxBGpwjQ+HHI4RpbEjojMm8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysAk9YjDb8FYXiFzmRglteAShBBDwua/b0Vip14ydTU=;
 b=bIKD+jsB7JsQmr+eIgWVqeVgcp7U+08YwaI6/PqZEBgiqa/F/nbFcxJ63ogtteBESMkKs6zbMipNn9rlvWxfDXqipXygTiaDyoCw/pETq+SSGUs85H7DRHT2utL1ez3CkvyIrREXoXg0brpY8RgC57TdXEU2ucHbRzW+3qaW9m9bkrHTzA5AYK1S3ymtt0yVVffhgZhnP12z7SmYhhxLCq8cTl+LpFioPcj+DXBz04Ny18XufNxeDKdsv9FA4eLLS7ZU2tQCZXnH/L+DY5EVZ15EX4MRT6fg/G7O+3Zo+RU+2JK3OeNB+aRU4XPKx0zNbduBWmKwI1YgyaS6Cuhj/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysAk9YjDb8FYXiFzmRglteAShBBDwua/b0Vip14ydTU=;
 b=IByhYPjsXQ4bMp1UVS1e2CSHIRNoC9xIEkiQTo2/IPgStoleQPPD8X+ynr4SC5I1QI/aLvOZvW5/ewT6UAT4CAEE5rbnpNJ8nEtc59P2BA4g8WyDztzBOgdwwvzCH85CbwsX3RYPP9TW+Rd5V14N5WDNxyeUAlh7rAeN5ZQvWqc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:22 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:22 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 05/13] qapi: copy-on-read filter: add 'bottom' option
Date: Wed, 16 Dec 2020 09:16:55 +0300
Message-Id: <20201216061703.70908-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fea41af-0043-4a21-fa5e-08d8a18a3fc6
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6309A4FD700191272C26E0CBC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8ss0CvJ9Sj7al4f4FrDmhRQDJBj8CWettksuW7AS5Rs9J165mwsDzPVNnIAgwgo1eUF0GzE3YJQZQM1rL+3qQbHIXXYNMZKGkvLfkz6N9DLxikl3r7BBVh/Polm3oVyGcrgmckmeziBtGPqcXs7hKPnAYzDgxN/jplFYRvXXluI1siz77CLdjk8IqxKbc99lHfbf3tEzZJK4faNbo0JPA8ilwl/S0hnQxhtHmuUxn5vQMV2QZNUpE7mamGwtV9Zw/T0WABiXPemUoZYSxWQRBtcX07pTxNQl1u7jBUrxndPW7UCfzQdcWNdR2b3gvar5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(39830400003)(346002)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L15FD5IEoKuUuwsuXyuKm1zzqVVFXq1xqH05pQkS66TDffFAJLmczF0Q2S6l?=
 =?us-ascii?Q?LXS//zO0cMuArXaIJRmuK9UOFipTxYs8Jgj2AK14pDfO8y8kBMxeTpFMg1Vn?=
 =?us-ascii?Q?m/1u/tzbWjhRm2iLwsD9Jxh4/abuic+mgg3jzBaXZwBs6mw52LvggEY8iB/0?=
 =?us-ascii?Q?0St0mOwvvpIr1mf5vbAje7Ur89VsHyItU76Hi7rzyNTnKf62bV6hXF6HpIXr?=
 =?us-ascii?Q?8lSBkzAbDrsuDyGdVDIz3T/dc/3JVbtBoqrs3MGXeEAmKNXX/xJXG5/kgRw9?=
 =?us-ascii?Q?J1oa3LymwUcZwt+iS0/fPbmV7z1R6iOtdB/Yv6m+3+t6xwv0KtXQTFm2jYI+?=
 =?us-ascii?Q?9AJOqOEgWvP1T433s+FVtH+N+Ve9FJPrHCpDXjSLWhikuVAiINp0mgPgdr7r?=
 =?us-ascii?Q?NWt+d9Z93AVDErJ9FW2zXfxserpmQHxIxaOdR+7SC7JheAsMU/2Y3xEpHqHe?=
 =?us-ascii?Q?HWxbZa8G9EiNT3NSW27Q3qKB4x0Xs7TW9jr+pCHYmylOjzQ5nEh6VtxGxXRX?=
 =?us-ascii?Q?9e/WH6iEEjpap2U9akao3Nipa7paASaemqb+WaEQRHXQ1GLEgOpjUHYKU7sW?=
 =?us-ascii?Q?7h/Sg6ZT7BF7RFkxXLccwRKQ+lH7Ps/lDLcWwVmbxF1eDTRtlzTlE7QlY63U?=
 =?us-ascii?Q?yPSZNbthnc4zl39E/aVDaFz4ihsE63NEfw10MUoms+Z5HQLH9CMwfci4D78n?=
 =?us-ascii?Q?/WItaDhWtxT3M7pR4Q3YFZfobflRTO98PDkS2Rqjhv9ne5G6kMRumf95uoAm?=
 =?us-ascii?Q?iQKSQsqFKCWebm4u5VTs09t5383bWkwYUmzIJ0NdLoTaZRiijMj8s36ApVJg?=
 =?us-ascii?Q?IaP5PceS6pprUm1kY7qIxjspxWS95UkS7ymjN3qCU7Lf7G6gVbyqirdaP3OP?=
 =?us-ascii?Q?/zvnsBZ8D8NRU8/Lt7Rvbp27r9ruNGW6hbWi3O9HVFkf4u0CLl6DYA7Z7FYx?=
 =?us-ascii?Q?5FgFLeVDfPUwDWXAsd9MdX9tHN0GfSEDcvizN6qfhWKLix3s66g7S0SVnSPi?=
 =?us-ascii?Q?gMYl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:21.9702 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fea41af-0043-4a21-fa5e-08d8a18a3fc6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEOtXj3oj7EUUpSygVjRAAqApe6ut9Iy7iAvy3qLNvR5xmt6mDQTbQEs0alpX+OCDlbSibtsv/RBj71AX8VkK2AzP5rbU0AsLMz00gopnT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Add an option to limit copy-on-read operations to specified sub-chain
of backing-chain, to make copy-on-read filter useful for block-stream
job.

Suggested-by: Max Reitz <mreitz@redhat.com>
Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: change subject, modified to freeze the chain,
   do some fixes]
---
 qapi/block-core.json | 20 ++++++++-
 block/copy-on-read.c | 98 +++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 115 insertions(+), 3 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6050cf3c39..b8094a5ec7 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3942,6 +3942,24 @@
   'data': { 'throttle-group': 'str',
             'file' : 'BlockdevRef'
              } }
+
+##
+# @BlockdevOptionsCor:
+#
+# Driver specific block device options for the copy-on-read driver.
+#
+# @bottom: The name of a non-filter node (allocation-bearing layer) that
+#          limits the COR operations in the backing chain (inclusive), so
+#          that no data below this node will be copied by this filter.
+#          If option is absent, the limit is not applied, so that data
+#          from all backing layers may be copied.
+#
+# Since: 6.0
+##
+{ 'struct': 'BlockdevOptionsCor',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { '*bottom': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -3994,7 +4012,7 @@
       'bochs':      'BlockdevOptionsGenericFormat',
       'cloop':      'BlockdevOptionsGenericFormat',
       'compress':   'BlockdevOptionsGenericFormat',
-      'copy-on-read':'BlockdevOptionsGenericFormat',
+      'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
       'ftp':        'BlockdevOptionsCurlFtp',
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 618c4c4f43..71560984f6 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -24,18 +24,24 @@
 #include "block/block_int.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "qapi/qmp/qdict.h"
 #include "block/copy-on-read.h"
 
 
 typedef struct BDRVStateCOR {
     bool active;
+    BlockDriverState *bottom_bs;
+    bool chain_frozen;
 } BDRVStateCOR;
 
 
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
+    BlockDriverState *bottom_bs = NULL;
     BDRVStateCOR *state = bs->opaque;
+    /* Find a bottom node name, if any */
+    const char *bottom_node = qdict_get_try_str(options, "bottom");
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -51,7 +57,38 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
         ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
             bs->file->bs->supported_zero_flags);
 
+    if (bottom_node) {
+        bottom_bs = bdrv_find_node(bottom_node);
+        if (!bottom_bs) {
+            error_setg(errp, "Bottom node '%s' not found", bottom_node);
+            qdict_del(options, "bottom");
+            return -EINVAL;
+        }
+        qdict_del(options, "bottom");
+
+        if (!bottom_bs->drv) {
+            error_setg(errp, "Bottom node '%s' not opened", bottom_node);
+            return -EINVAL;
+        }
+
+        if (bottom_bs->drv->is_filter) {
+            error_setg(errp, "Bottom node '%s' is a filter", bottom_node);
+            return -EINVAL;
+        }
+
+        if (bdrv_freeze_backing_chain(bs, bottom_bs, errp) < 0) {
+            return -EINVAL;
+        }
+        state->chain_frozen = true;
+
+        /*
+         * We do freeze the chain, so it shouldn't be removed. Still, storing a
+         * pointer worth bdrv_ref().
+         */
+        bdrv_ref(bottom_bs);
+    }
     state->active = true;
+    state->bottom_bs = bottom_bs;
 
     /*
      * We don't need to call bdrv_child_refresh_perms() now as the permissions
@@ -107,8 +144,46 @@ static int coroutine_fn cor_co_preadv_part(BlockDriverState *bs,
                                            size_t qiov_offset,
                                            int flags)
 {
-    return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
-                               flags | BDRV_REQ_COPY_ON_READ);
+    int64_t n;
+    int local_flags;
+    int ret;
+    BDRVStateCOR *state = bs->opaque;
+
+    if (!state->bottom_bs) {
+        return bdrv_co_preadv_part(bs->file, offset, bytes, qiov, qiov_offset,
+                                   flags | BDRV_REQ_COPY_ON_READ);
+    }
+
+    while (bytes) {
+        local_flags = flags;
+
+        /* In case of failure, try to copy-on-read anyway */
+        ret = bdrv_is_allocated(bs->file->bs, offset, bytes, &n);
+        if (ret <= 0) {
+            ret = bdrv_is_allocated_above(bdrv_backing_chain_next(bs->file->bs),
+                                          state->bottom_bs, true, offset,
+                                          n, &n);
+            if (ret > 0 || ret < 0) {
+                local_flags |= BDRV_REQ_COPY_ON_READ;
+            }
+            /* Finish earlier if the end of a backing file has been reached */
+            if (n == 0) {
+                break;
+            }
+        }
+
+        ret = bdrv_co_preadv_part(bs->file, offset, n, qiov, qiov_offset,
+                                  local_flags);
+        if (ret < 0) {
+            return ret;
+        }
+
+        offset += n;
+        qiov_offset += n;
+        bytes -= n;
+    }
+
+    return 0;
 }
 
 
@@ -160,11 +235,25 @@ static void cor_lock_medium(BlockDriverState *bs, bool locked)
 }
 
 
+static void cor_close(BlockDriverState *bs)
+{
+    BDRVStateCOR *s = bs->opaque;
+
+    if (s->chain_frozen) {
+        s->chain_frozen = false;
+        bdrv_unfreeze_backing_chain(bs, s->bottom_bs);
+    }
+
+    bdrv_unref(s->bottom_bs);
+}
+
+
 static BlockDriver bdrv_copy_on_read = {
     .format_name                        = "copy-on-read",
     .instance_size                      = sizeof(BDRVStateCOR),
 
     .bdrv_open                          = cor_open,
+    .bdrv_close                         = cor_close,
     .bdrv_child_perm                    = cor_child_perm,
 
     .bdrv_getlength                     = cor_getlength,
@@ -201,6 +290,11 @@ void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
     bdrv_drained_begin(bs);
     /* Drop permissions before the graph change. */
     s->active = false;
+    /* unfreeze, as otherwise bdrv_replace_node() will fail */
+    if (s->chain_frozen) {
+        s->chain_frozen = false;
+        bdrv_unfreeze_backing_chain(cor_filter_bs, s->bottom_bs);
+    }
     bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
     bdrv_replace_node(cor_filter_bs, bs, &error_abort);
 
-- 
2.25.4


