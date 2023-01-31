Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E15682A84
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnrx-0003UL-T1; Tue, 31 Jan 2023 05:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnru-0003SY-Ll; Tue, 31 Jan 2023 05:28:02 -0500
Received: from mail-he1eur04on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::704]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrt-0006WH-2I; Tue, 31 Jan 2023 05:28:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JuKOg2gfIpvHtgJb7TV6DphAZeY4JLfTcutvo/WKbc8yR1PICQ2rmzVuKRsltfX9XVEepiw5GpanORYQu2Bvw3jxcmTCRe4CfG341f2KMYaPkePiwfTsnbILjshx/A9bYlqBeEmZ2jeQdyk90Cfl5seqbjvwKtpP/VoOwSK5PX6WIBz1WaqgvdG1qf0KMM+zk6DU36fvAjJVpuOHk8KPtMVaqvZVzh/KXIWFc5rohT0Dho8G2QEsCfFce0HQGXOiJQm814HcAqvSutxwGfsOxKsMMhwCATuM0TzrNOdB3a6NLmqdTiFFbv/B+WUsWNq9FeoskBA1mmm21doi2Nl+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXpdpQsoKM0XFVogGuVHYYbARp03koYeekDXRMFoUT8=;
 b=GdX3wHXO1VSdFV9K8S9dSV9id40/uZ5NgY/9BwTrb8aIFHcNc7Oa9UDW0PaKbtaYULW8dRPaOiH0i1+gqv9KUcSPbD+VwB7DRrBwal+RcgccBSeKBBtOsFj5AiMbRuAmb2SnpXCaTKLjDOz0bsTb5GK+rMXIORJWMeTjcCf58fAR4xv7/riQBBx2SV4GhJ68lRa1ssM7NKK286Ttm0DjM6cmz7oDTIHWAYIVD46dMWPXrr5WV/JR6Jly3g6ixE9RboQ7XBofRGLavKzcjRSkhSUdQqhCBaxIgjhgNmwgoO3YbPrRkoJoQoHIJQxVo9vOVoV6SnWWB7DvRrmdoycihw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXpdpQsoKM0XFVogGuVHYYbARp03koYeekDXRMFoUT8=;
 b=QELZmrh0v7beR8SfUQ7ZXQPfLLsgbKote5YvlAiHKWd3HUINyAMfwIIgTD3YGN3v0GkS3zgrwoxGAABabtRUNI7/aHzkGXBhNMadx1855/EMitQvjXSltvJ99GMYq9NNlZhTtWX535qrhFUDwOhrurQTRWd0Dbm8MczOIBaoX+njajNp9SKST/Vq830jcawt7MmRTRMKcOWFMoXg9vRgTGGSuSqlnYC/wiE4EnpCYduAfeYmpLtDpm94+PRtqNHhI9HuQrjxVT4xoNLQ+ON0fTTraCYw+HuSWPiQnXQMR1wWykEboOcpDmhTQJs8CyN9LI9JAPJb/4teZ6Y6C4iydA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:52 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:52 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 09/12] parallels: Move check of leaks to a separate function
Date: Tue, 31 Jan 2023 11:27:33 +0100
Message-Id: <20230131102736.2127945-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
References: <20230131102736.2127945-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0602CA0016.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::26) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|VI1PR08MB10217:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cae001c-a845-43c2-3520-08db0375cecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BH5XFE+b/st8IM23LuORnFet1Z2DQ8Jw6Ahr8E5k0HcM6NRgwz33OzumfxKZh84z/UhXUpAriuxP/YUq/zXEgItFWpu7sr8eTfP8Hf8Gp3YSztwd0eT0G0QqIA+0pTMK81ZfVtPnt9dpI4o8De6LAUEhhcVAYImzLjf298+kFVhnhVaE4clrZ3TRLgZ5xrOe2OBKVA7ZEbStP+CRdfj408f8KjRd66H1idnK1jcmIhxBLgfrbv9NvhXpVRQAixm7bt9L0eXQisZbMq6ZM7eqy6jezBRCgjISQX6AZKyriiayCbFRaji2+lsuC7Ejuin1DKHg+il2KkhdIukklOQpYs7M4RBqQza2LpUcrjJRQCx1I4B6e2iiQMCGsGFT36B8jZov0/Hs3qJVos/LkLMuYOMOAlocO7vQHSJstovykyx6Le1a76NDaNbBWqWsiLMjH6FNwYVeOcs+oon0JiGoalK1gCFA55pA50ybtzR70o3o4RalJybcY5ypZIemnCkVfXOBBpYz5YjT/VCSTzj/WWofBH0wfkELlavA/p1bB9GlFPBw+YX8iZ0eM9tmxFwwhLXu9sXzTHznf9bdLv/XQmxQO8OP6LxYwUjoPi+nAtX4l/Tr4c2/YmayBNFgVLcqHiwXxE8Ws+1Qa+uZk++DkF9ZOtwbkl+nQGlo6lb6+Zn6wsaDMif+D+2pKMMtokRlQjtH8+czB09ajDfdox4SeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pXXI+KT5EpY0JhiBgDKHNXR9To0e1rERd6+5ZS9Pdg9OymZHQq+G2KFGRUG7?=
 =?us-ascii?Q?TFhZkrT6titZCOfbXJmMB2u8Hnoy1i9R1s6ZxZN0Q+h00ci3EVIuejwi/d4h?=
 =?us-ascii?Q?AxXhJXE2iQJWX8HKdUefbBvyYch/LKmxw2hPnnKPh3iJjajrmyWRPE4PE9o6?=
 =?us-ascii?Q?6D1OSSAuM7Xj5HpPAcjXdcjo+NoIO/qKFPG4P+7o3lesqDpHaTZ74DspROBv?=
 =?us-ascii?Q?/38O1HV/8yClHPCWf4WdXBfGcexjqBQZp9f8I4rWymRKHtx1MizvMbq+wnkN?=
 =?us-ascii?Q?+L/iEcNuSEqtHk0qCt0DEX+k/3nt4aAkjF9esLx6Py4Wso0uhaRg28l151r6?=
 =?us-ascii?Q?g5NcXXHxU0I6dWvlY+7s3I4zM2Y4GZxJOTVnOVf/puOB290uz0uRfmZZv6nx?=
 =?us-ascii?Q?sqdgusjpvmyK+QJH8tgz12dHTL9i0QGtgBX2PYhAxe/rPk7IPfB4hy2mLaph?=
 =?us-ascii?Q?VmgGRTXZqgewDDmvK+kvs5w3QSEpSI0yEHKIZ/r602G2h3x8wG3K3Zq4IHml?=
 =?us-ascii?Q?YwOcqpjDh8swivPu/eclfaUlRUMXdCM3vZ4i45rN/aTbovdMjOf55grjFPeM?=
 =?us-ascii?Q?4Grk3BA9YF3PWcbzVHX5HEAG5LYZLdSM1n5q4ukAJW74FhKyflyhPqW8FpVE?=
 =?us-ascii?Q?BAF1sNRv/wq+Fe3OI7m8pViT2sS8CVHkX+4f5/oyO8/fSbwk4bfm/uncdZ1M?=
 =?us-ascii?Q?31kFohI/F+RkAaTlNP6gXMyK36ZJXFSdzRyRHtShvZ9031oba2QWvAN/OCba?=
 =?us-ascii?Q?C+w81GNpMszkFd8/nxSuG5lcV4xwrqFoXWv1VD8UFcTwHAm5LG348NaUgXsE?=
 =?us-ascii?Q?3kqsIDCqaE8CWYQw8f+ZUmWjgrm04ecD9TQ0+Minh78/EiqFIsPtGz0H6qf9?=
 =?us-ascii?Q?J31oloC7XgegJ0Q1T4bEk9nrQnlJ3DCd7TMbKdaIibVZ8YZTvlODKK/74JZe?=
 =?us-ascii?Q?Htu9S2pihg5DP3ZaP1ZsHZlf/qQnabRiRx5/RLeYzszmsNqH4iuWwhzHdLqo?=
 =?us-ascii?Q?wmnmXXW4ngREmg7SeD2kkTJQteh2DEJWCpBHHagfC0dJynT5XasA94qQqIid?=
 =?us-ascii?Q?CoVekSe1qhiDD/CAbQLCQvEK/8gLgy6bJnGHs60uFAoRsiyMW0wcls1MX7IR?=
 =?us-ascii?Q?8VSsrBkivl/LbzIJjskOd8Ea1oCTPfTmSmxJ0xssfrMn+fmUsN9suc5yDFTf?=
 =?us-ascii?Q?w2av8To7/gzLFSO6c1woRenWzg/VyNb1vi96nbcNgdt0EBcOILdwktV+sktC?=
 =?us-ascii?Q?o02n1j/XmYnmyJE4dt5hzhkD9mxNjC4grMbxb5FwwXX4DRg6ulQxdpIec2N/?=
 =?us-ascii?Q?pRL8I9OPvcyAFXZRUJXXxJUkqLRIy3choc4SB3FGUkilaLbKt//Jbf6YoxPK?=
 =?us-ascii?Q?jEfgRrlJD63NdgdIwwt30rSQ3MMqjmJewI7dm+bHWtRvH0ixLO1ZFE3rcEJp?=
 =?us-ascii?Q?58DVqXLSUDEP7JpTbk0qHdlvLWnSfGFQZgX4OL3QXHXLUUs1FsWBKDgiS9Uc?=
 =?us-ascii?Q?cpXm/+G61s/6hPT+2UTChdqJoC3yI66/bHItP6vY1wmOJ4f7cFV5fFKchRhX?=
 =?us-ascii?Q?3uxCCFOojPx1nb5M8Np6MkO4XlUYXNCaRQagWM/z9A4YgEfgvyPudKL7r1oy?=
 =?us-ascii?Q?4wZalOEht0y+d6LC1IzkaOs=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cae001c-a845-43c2-3520-08db0375cecc
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:51.9697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wwd0hgoTtumxgYxQLsWuUYOeHAa6e61/gavb/fH560RM1rhJE5SnWqJRd7e1iuwQHs/wHRqeQjYaZiELJtnaz4mfT+Zmzkzap0A26rR0Mxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10217
Received-SPF: pass client-ip=2a01:111:f400:fe0d::704;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 85 ++++++++++++++++++++++++++++-------------------
 1 file changed, 50 insertions(+), 35 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 7382c01191..eb39db53ec 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -480,14 +480,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off;
+    int64_t size;
     int ret;
-    uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -495,34 +494,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
-    prev_off = 0;
-    for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
-    }
-
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
@@ -542,12 +513,57 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
 
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t prev_off;
+    int ret;
+    uint32_t i;
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0 || off + s->cluster_size > res->image_end_offset) {
+            prev_off = 0;
+            continue;
+        }
+
+        res->bfi.allocated_clusters++;
+
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
+
 out:
     qemu_co_mutex_unlock(&s->lock);
 
@@ -561,7 +577,6 @@ out:
     return ret;
 }
 
-
 static int coroutine_fn parallels_co_create(BlockdevCreateOptions* opts,
                                             Error **errp)
 {
-- 
2.34.1


