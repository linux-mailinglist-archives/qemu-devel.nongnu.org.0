Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685233DFE68
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:52:43 +0200 (CEST)
Received: from localhost ([::1]:50756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDZq-0000yV-A3
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMc-0004oA-O5; Wed, 04 Aug 2021 05:39:03 -0400
Received: from mail-eopbgr60114.outbound.protection.outlook.com
 ([40.107.6.114]:45925 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMZ-0006Db-V0; Wed, 04 Aug 2021 05:39:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXYKAM0zK2A5dPruyzZAq1JHiUDkxtspNASuxELf87cYFrpMA5/2ugjfsw2zIIqqmNxw31V+xGYlt6FC1hmwt7xSgXtOm4+QEvrEt22PJdjOAIeFnepHo0zEFsS14OCuVjthoTfFMDvU2xgJW/dAnIsx5xjAl9a8JqAE2i7RW7YsXVylC0iGBtI4WdA/hfNoQ2BLTOy/WfsidmjohwlmXgEgunaeIyevPUVLDchOASvghPSV9jDc80Km96dwleWKvhKIvtyOHweNI0+Gn0kto9/vC+7CNJgSGpIbB3c6PUo+GuHOVxgjITRUvv7tB/mHfQ87SZ5KTEV0jB20GhSeTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=Xjgo1QfSzyZBRsFgdM10ch+joEcUNWYEiJgbNj486SQi7ngvT+Vt7RMWmc8oQOZ7W/DmJYhcFroe1PXEbRsHxvVPvU6SF956RzS73alMz1h5owN9ovCdTPjXBiTQ3T2Xz582foGotwvBP/eYE6Wer3aMsQedJox5kiUWnqQGVCWjZ7LMD2mL7UcLL47zGk/JZt4f+RUeJru7BtFjTCcbcWkYHI4zCn9WGlI4nkOsOjkzxYbSJwFpXINJxTzPgyHyzY6Z8mLIkW0CBPRJc7TJhkEnZL3ITzCMAdTBveFwqCIFq+CxvOyEAeBc5NqxAAj+XYPlSbsUlcexEFaj3pCnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZ8w5qdaPUsW8UWJ6qFAmiuctXcyXUw7XJ0bYfnYHg=;
 b=Uv/Q4otJ9ZI0gHAJGIZ2yLE/1Wa3/8UR6FXpn+Mv9CZvLfGMqQPCXj2/r/zUM5qklqcX4DXWexGWhSnt1Dre2ROUIrpTk0FYx9ovRSudhrlFXxWypYr93ONXiR6c+vh3okUxdrizBSDZ25wlpNs7L6ZQm81RaRintoa+HSFDpQk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 12/33] block/copy-before-write: use file child instead of
 backing
Date: Wed,  4 Aug 2021 12:37:52 +0300
Message-Id: <20210804093813.20688-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8983608-d2d9-416f-fd11-08d9572babe6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50324196D3CB72D68FD93FC5C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4p//4Z7u5zlfO5+EJk2xUFm4jIMqch0NvnaOtwnc23LKstowCPeXz/SaFd6CMABOcKN8tccU3eGwwzsSMohBPIcMOtmqfhkCe154QDtZ6rf6LkT3Zx4L6/ltS5M9/7/VbYweG2+NeiaQ+wrPdgJanib7uesK/rV74EBQRgJfIh7kaOGhZw3+Witl8nBeqYujqyuRRHciNYgtwk6+tN+sMgPzRmG7cjPXfn8Qh3cap3pMaiUm4cGla0gcES7loXBS6M9Rne8KNZE9PQV0vkWEcHx+ZFT4pUzv/krSJ6LcPgP26gv3yr7gYCFiKVJdqKKPNghwu+vW2Q0Qopoz6DSCfz+4BW4t8I7JnGXjvpj5L0Weg2mnJ49FDf4eYijTBukQkkfsUrLElhvqb/vSAQPf9lf9pTSCFQM/ZMDQG8v2vLf9kci0d5GJr1rwfd9ReZTuzFYyDGwxDRx+y0di6oTlv6uxAPMPAIlposDttvlQ+B5bMmpA2e4rNtIbBH9bCsi1m8IiwnU1xuPy/5pKSkONd68ngu02Okh2zgU43Yj0WzJZMg8cLa1Nhvuo4oZWXfZqdUDMOfoS/Vc19fGywTWdgLmZGImwG5HTJh/8tL981PjHTHs0u8RZlPo2dQ0ETz0iBR2EvhNlirSmjcSZYaki+8GrHBDuLYRUADYs1fNiwr0Jo5f39lLNKdKjUuGrme8p5Z0YvuOVXM2jk0somz5Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pFZdSkSCflmMf/YdZ+k/OqptLTpvJTxi0wgl5ppkBfiVYtbHGsTltszUjJpR?=
 =?us-ascii?Q?jj1XXRfpOHgG6vwgKhhrq0ZdEZLdtBxshdew8ANTm4uiCQBikiJR3jkXpv5P?=
 =?us-ascii?Q?ZVjGZG5TIEKsAID4uc4V1fWU/u2mo1Cqajx54G6vGQRzoum2R4QRZMX0GzM3?=
 =?us-ascii?Q?rxKskKvdeH/1WDtCqtGjiOw94ZurYbvPQM3MegYPNiLAPdUvF9oudmAZ5XYJ?=
 =?us-ascii?Q?T0x7+gvdhTq/JADY4TOwssgtsseg2aXirWSY9qu1f3Y6lW+MphhZvMusVrt2?=
 =?us-ascii?Q?9N9g30qmjFbdf43M3PkusWzrqR2+QHyFcB1D4vJzzCkUooe5LAYIcw7L0EUJ?=
 =?us-ascii?Q?rVTHBdywbXIqGtqAWnIYZCePo4Rj+z4j+7tc4bzyovuykr8hvCM5zXhqWNB5?=
 =?us-ascii?Q?ApDfPQkVJUELGRLNgWJNuoIS6aOxRhlUHCEmY+yN2579bemIqJzvmSY83fr1?=
 =?us-ascii?Q?g14Jc78bs9HQNq/2z5F4nTMkgBzLdb/DwW4Bfk01ulKh/Rs8Xi4NqGc8bM91?=
 =?us-ascii?Q?SiLiPIQ7OvZJRfI2V1WBnat0qe8HlqdWTghxB7cxDjzZ2WIGmclwZxlihoDv?=
 =?us-ascii?Q?kVSa4/joQmuAc9G0XyoZ3QDjWOOSQkK5Ut8+ANbdrafHfVHqvh8aTPax/P/Z?=
 =?us-ascii?Q?KGCqQHXyt0lEVxLZnsEfk9a9d6za0/OObSS9dO3DtDC1yhxX3DeWG0lRptFK?=
 =?us-ascii?Q?8dwbzn+igLQpOzj3LBhOwHX22u7/T1P9JJIDwCtyvvMGUH4gpKxWqERTLdy/?=
 =?us-ascii?Q?Z8jUr16edeGZAwYbZSoKBCxRHmhrIJnVQatMN40SbsN45fw+zVcahMeI++xd?=
 =?us-ascii?Q?hzy5QXF8DmA/tifNigfF9Oy96dTBy9evTG1XepO2w4uam7Fx/X3viZ96ltsP?=
 =?us-ascii?Q?Dyg9XjMbWOlNZuLT8PPW+UHlW7f8ehf26yF5k7PtFx2KxGVXBB4KtZ+Mwoci?=
 =?us-ascii?Q?r3JledYrJgIZI7lvzZh3OkK/0iKd6e0yBuKh18AS0VDyIPC3chccT3m0S/kY?=
 =?us-ascii?Q?mX+lqZq6571MTUybUyW3krEpYC/4UGTDooGcq9zORKDKmLV5FcxA0q6yfet7?=
 =?us-ascii?Q?1nmoP1VHcmJ0/6w1w1500XztJ4HahDtLf6rUPfbEqD6dvAVPrLn7KHoTc/P2?=
 =?us-ascii?Q?F8jLJijWJG642bfWvV5ZeFm9MlZLrZgMhwwv6u26vjTmJBvEQZILGYloVQNJ?=
 =?us-ascii?Q?S+xaj1IhS1TCnCgp0VFxtgpwQSC+3M4Kl8LDrVAXVmloJ7Gu1cQjguIgVK36?=
 =?us-ascii?Q?qaUGzkTXx64Se30kgUGQINgkL+/3YkY+DbdTQSw/cpkiRcGq32aGZkevF5lB?=
 =?us-ascii?Q?piVbKAqryOP06AT2fNoN1jU3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8983608-d2d9-416f-fd11-08d9572babe6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:53.0501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooFUyLcpKR95Gu31kAhB5idMlV8+AanFOgSMSc3ld5Xh4ySB3ea2qW4bqjh5k25In8ByDMGhcqMYzmHNtbr8XZuzXtEvvkgEh4sdiVGxSIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to publish copy-before-write filter, and there no public
backing-child-based filter in Qemu. No reason to create a precedent, so
let's refactor copy-before-write filter instead.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 945d9340f4..7a6c15f141 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -43,7 +43,7 @@ static coroutine_fn int cbw_co_preadv(
         BlockDriverState *bs, uint64_t offset, uint64_t bytes,
         QEMUIOVector *qiov, int flags)
 {
-    return bdrv_co_preadv(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_preadv(bs->file, offset, bytes, qiov, flags);
 }
 
 static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
@@ -71,7 +71,7 @@ static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pdiscard(bs->backing, offset, bytes);
+    return bdrv_co_pdiscard(bs->file, offset, bytes);
 }
 
 static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
@@ -82,7 +82,7 @@ static int coroutine_fn cbw_co_pwrite_zeroes(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwrite_zeroes(bs->backing, offset, bytes, flags);
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
 }
 
 static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
@@ -95,29 +95,22 @@ static coroutine_fn int cbw_co_pwritev(BlockDriverState *bs,
         return ret;
     }
 
-    return bdrv_co_pwritev(bs->backing, offset, bytes, qiov, flags);
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
 }
 
 static int coroutine_fn cbw_co_flush(BlockDriverState *bs)
 {
-    if (!bs->backing) {
+    if (!bs->file) {
         return 0;
     }
 
-    return bdrv_co_flush(bs->backing->bs);
+    return bdrv_co_flush(bs->file->bs);
 }
 
 static void cbw_refresh_filename(BlockDriverState *bs)
 {
-    if (bs->backing == NULL) {
-        /*
-         * we can be here after failed bdrv_attach_child in
-         * bdrv_set_backing_hd
-         */
-        return;
-    }
     pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-            bs->backing->bs->filename);
+            bs->file->bs->filename);
 }
 
 static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
@@ -186,6 +179,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     top = bdrv_new_open_driver(&bdrv_cbw_filter, filter_node_name,
                                BDRV_O_RDWR, errp);
     if (!top) {
+        error_prepend(errp, "Cannot open driver: ");
         return NULL;
     }
 
@@ -201,21 +195,32 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     state->target = bdrv_attach_child(top, target, "target", &child_of_bds,
                                       BDRV_CHILD_DATA, errp);
     if (!state->target) {
+        error_prepend(errp, "Cannot attach target child: ");
+        bdrv_unref(top);
+        return NULL;
+    }
+
+    bdrv_ref(source);
+    top->file = bdrv_attach_child(top, source, "file", &child_of_bds,
+                                  BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                                  errp);
+    if (!top->file) {
+        error_prepend(errp, "Cannot attach file child: ");
         bdrv_unref(top);
         return NULL;
     }
 
     bdrv_drained_begin(source);
 
-    ret = bdrv_append(top, source, errp);
+    ret = bdrv_replace_node(source, top, errp);
     if (ret < 0) {
         error_prepend(errp, "Cannot append copy-before-write filter: ");
         goto fail;
     }
     appended = true;
 
-    state->bcs = block_copy_state_new(top->backing, state->target,
-                                      false, compress, errp);
+    state->bcs = block_copy_state_new(top->file, state->target, false, compress,
+                                      errp);
     if (!state->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         goto fail;
-- 
2.29.2


