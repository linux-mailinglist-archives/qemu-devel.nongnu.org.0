Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E021C682A7F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnru-0003RV-VN; Tue, 31 Jan 2023 05:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrs-0003QO-9J; Tue, 31 Jan 2023 05:28:00 -0500
Received: from mail-he1eur04on0704.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::704]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pMnrq-0006WH-Kh; Tue, 31 Jan 2023 05:28:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka58nzVGbTOQ+rDGf0B/4aS+LXpbYk3WWUB4P4FNOXqnpmqpWsZTIEG2uohIWB4qVF8YjiON8oNATbCCo5+rJJzjUpDll+D5vt1MNHgaAOwUeePoJ0N76a0+T5RpT6tEoiyXab8ywKXI9hTJCcyrOLT1mzk6BO/RY4NrTrX6EJja6Z1dudWrcMtqZAvTIIJAfJz9dkUGwUHBf+li1ajDhGJJ0AdLwBt08k5jEHI3F+CTCPBRsW16Q676xnYPgZdmxzp5zu6KefE58/opCKD/CGpaFt3kWe/f2tiUV3/h4WZp4TF3p/8NtDkSuZ9VwOU9LkOnE5reMwLWZx36uhDOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiuuyvlLvU7PBeR+AaFndHK1L8XF+44rEDOFdwsVsKQ=;
 b=cAeQ73VEnJPjrp+H9NXe4aXYIZWrUFP1+t2QnBu+yWRN947vgKaqA7VVnNSZKlCWzuyoUt0welMVqZoggHA66YxsOEmqgM1yDIrjyBygF1wStj25nZkBWwXCLQ5qs/kfqQakzViRPcS1Q6bdLWNc3/jjxWTdrgJEBb4zlSkfdo95XnMeD2bFSTK9uUxiCmyMyJvpPux06Qk981AnnsE6Bc2L2ngnHOup08MPGfz5OZI68CkScAIQ8E2ClHztfgEdpqf0YqAh9gV4j9GcEWKdbkHeT9q2sJPt9MjKesB0Ae5rIjncbd8PiBxG1g3+NImIn/CejM+JkeD01EG7x320fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiuuyvlLvU7PBeR+AaFndHK1L8XF+44rEDOFdwsVsKQ=;
 b=aqOJ1Lp1QcaM3+336XT8BBOWitBCWzc/tCQi503qNdf2qO6jq3IAN/wXGTXJId7p1MibmE+cqhVIK9nkQh6hHaha7S8NhHkOwPUezqcKkjr4CEWHjXscfjU5icBOX5bTMRUdZgMSx05yzEE49gQ3kiCyJBw7vgSCn5dKAhOXx9zKbUpl1un4M7Id7H/X/qAdLVNB0zE1Y5iOieWvKthQ9bsnm0Joe+imWTdx1ARsUqJ8Qy7xrm2bnA0mp+9xqi7K7ratGpgeLz4vCACkt8Q6Mt9s9PTei64A0apgPYvScWS742v+2wlfoaZx/zhQZLsJEz6mpF7ZX0aUV/Cs18QrAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB10217.eurprd08.prod.outlook.com (2603:10a6:800:1bc::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Tue, 31 Jan
 2023 10:27:50 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::73cd:4f7a:16fa:e648%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 10:27:50 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v9 07/12] parallels: Move check of cluster outside image to a
 separate function
Date: Tue, 31 Jan 2023 11:27:31 +0100
Message-Id: <20230131102736.2127945-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: fcd7407e-bec4-41a7-536b-08db0375cdff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LoSivzJqiPYJ74auqlS7UP7sKG9ssna5UHI+up4Z5Fqo0b3XR/+9nUPvJziPa5Sc0Ox17OFeDljtqyBbI6ic8iZenjRo9hzhjOcvXBrgNrzyQp2O9YJeDsG/kuasDV2gKiOz1G5I65CumHzTvCiI3yw+T4ubQAY6Gd+x9oiF8vdcyoNr0WYKlXyERQLZCPDUyYc40FGoTm63c3u1Q/99zkm/e2zefAyxrFpDsnzeODiEKyRY+V4YDtVTagpvks5WsnmBdkh0P8rB8kJOFchDPW0cJj4N8Oa7dgFqkMg1lqnse9cxrHa7gJyUNDrE1KPor96zWpaDHREEP/2IkcP8ijZ8w/8roY11PLaDk/AEGR9dKMokVHt48W4l4nOubNheSxDowHdWN8VPIwaj6pltzW8Mu4n0p60tVlZBTsoTvfByc4SRtbjlUIqv+veQIPtZeAwrGHM5T145PHfOKVUiG1WU9c5hD8XO6rTWND7mlm/EHUkuAIOVO8djTy0GAsDyQUZEP8dYN1cOWgrR9grUY1Uy7r/iPbW0TZTAZutOkp89UQQd/nHeoADCA9vq60MR8ii0Sg0NXim/CkNvK8bf7jVyeOuT996fFANS6eeVuFKhMnj0Ecgcco44lVfth98fKi3kQIxSqVhpH8WbFHAHT4b0oRTMVXdRi582ct8i6AxRkBa54NOhZYhBFxtfkLJT9lIvI2wLMJyNSo2N0e9rGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(451199018)(478600001)(6486002)(26005)(186003)(86362001)(52116002)(83380400001)(38100700002)(38350700002)(2616005)(6512007)(36756003)(6666004)(1076003)(6506007)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(5660300002)(6916009)(316002)(41300700001)(44832011)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kwNBSEquDnLvEjjNqhpfAAJW1jw7wVo3QoHzQ73XwwrRM9H6oYoKaGojCemY?=
 =?us-ascii?Q?CVbdD7mtQB47TiyBYuuJKsUqaBoAFNJDP8zJNnlOSkiEBddipMdXWuAF6Ugq?=
 =?us-ascii?Q?E+yBT3WeBtdBsMlu96DxiR72QMv1vprUBcdiesjPhJCYnJ5os3A8cAn5bQ74?=
 =?us-ascii?Q?Shvi/MHKThhO0o816jTC7H/OVhrTEPuWgOmj0kbw7VeuNyoZ7xrYtb0XIhfo?=
 =?us-ascii?Q?1gwqsNS+Fk/GDtQyTjjbSM2jIjGpC5b6u0H94Gz9biC2LXg1ts3FxbwHa4XI?=
 =?us-ascii?Q?Nu0YFsRBxzXE8sK0szMn305AJsB+icnu2KkYzSdDQdV2Fxqbf4xz+6ToTMtI?=
 =?us-ascii?Q?h2xxpYJiSy2wkbjzFEhjVDhv15aZqW81nW4F8ObXOHvAuLnw5G0t7IfP66LT?=
 =?us-ascii?Q?82M5E+cUX6IIowAXOxJ/TLKRDvj/1v+bc5G0OpjFuJWqATiwFMld2cG2gU9J?=
 =?us-ascii?Q?lVPSJseRQlc8lV+bKmcxMEmGN2UxebrrhCxS+t6Io7r/55CLGzxFqLKZnZvr?=
 =?us-ascii?Q?ZWl4R5bubRZfmuMNZ1j2bBszBuNogoUpIQqaNWs4Ei7pMyaMp4jwS48KbQbY?=
 =?us-ascii?Q?furfYH36Js7Y7FmSA6LTSjQxeXa0OtEYYO7I1VfignJ47VIeSf0zVDZPx/cA?=
 =?us-ascii?Q?4hvFr1fDNkZWKKtAAz98k5b1+shLu7SHxsX0sYpjseXcL41vVtMNu75OkBLN?=
 =?us-ascii?Q?dyKnvMPrgPgtSTo/HtsLrT+RhMSHDAMcs0fHF2Ki4wc6swaoXvxu+OJeXQ04?=
 =?us-ascii?Q?cJrAnTwkZZPR1JpBNT7hX6HaaLp5EUAntJ041ScwFuKCZ6SLuMamQ3iGv/k5?=
 =?us-ascii?Q?h7iwX2j7bQMQaAlKYx2KXA/z43bIusaA5vhoH9H4qNMoNzpgeWEBVcs9sL51?=
 =?us-ascii?Q?Chm36chILy/3ENOQmdEYA1Xzgzih1F5LM8ntWGytBd/6brygvpWGCKRlzpFQ?=
 =?us-ascii?Q?zNHcjRsYzmIGrZ9kGhZuhkPx+3PLRfMcCyDqoJ3qxyDT5XLtND+7tiYrFn/r?=
 =?us-ascii?Q?iK6YiQB+gp+sEBOWuPcy0F9vaqgadYsRR3N00+Jt0aIGt2VLbomdEOJy7NOn?=
 =?us-ascii?Q?0TdaUEx91ZbA/CvpxpXklGVUjEtxZeEXhW9rI7VVjFUn7h+NEaRDyFRjOP7d?=
 =?us-ascii?Q?X12vDp0ni8KXyxKhMtkLUFdqcVPsOfqX3xTd2jtr9vTSyXhtbN+xbn67VMoF?=
 =?us-ascii?Q?WDRqQC4T0rCjb/Qx3q9AG9FhGk0teYqN6W/FWuDxMSySYT/Jkh4z/54cr1zQ?=
 =?us-ascii?Q?Soa0caXiRaJvFV1cGSHhbJ3oLBu2wnJ7p9bC8Tz00jjxponxcK7Tanmf3KXJ?=
 =?us-ascii?Q?ZVngVdxeqhTOlnNJT4UHQtiIi8FSi9em2PlbOSLG1SsF2vD2Rd3xJva6dagV?=
 =?us-ascii?Q?LYGwTY5Yro2J9TwTekPs0H5miGjYS6qRkPlAwPZ888KEqxXhtZaNb4CqL0oQ?=
 =?us-ascii?Q?X8RvELx4zXYoSVwexRa2GxjmEuGOSAlzwe6PFzpTgamD3yp9YPq4/kFEFljG?=
 =?us-ascii?Q?dKYtN2O8Z+fkLvRG3+IoWypar+/9VHO/8HWwiehfm5NUfcpWH+0qD2YVvKL1?=
 =?us-ascii?Q?qiQOPGx+doYsBmSwZ0pzgjB6/7yeMdAMTF22Z+9oFodMltMF1Cqko/CnMm5/?=
 =?us-ascii?Q?dqs9brL2uj7Z7vrUUKw+fIY=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd7407e-bec4-41a7-536b-08db0375cdff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 10:27:50.6426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7bLMx60sG2Mpo+Ro7zJJPJdlQ4TmJBZLQ6nYgY1DXtv6UdHO92Zh1YAW61QdF2Ax5bgv4AWGNcXCz1/3B6HywtGmLN7egh38S9OJgvt3DI=
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

We will add more and more checks so we need a better code structure in
parallels_co_check. Let each check performs in a separate loop in a
separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 81 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 52 insertions(+), 29 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 02fbaee1f2..f9acee1fa8 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,14 +438,13 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret = 0;
     uint32_t i;
+    int64_t off, high_off, size;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -453,23 +452,9 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        /* cluster outside the image */
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > size) {
             fprintf(stderr, "%s cluster %u is outside image\n",
                     fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
@@ -478,19 +463,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                 parallels_set_bat_entry(s, i, 0);
                 res->corruptions_fixed++;
             }
-            prev_off = 0;
             continue;
         }
-
-        res->bfi.allocated_clusters++;
-        if (off > high_off) {
+        if (high_off < off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     if (high_off == 0) {
@@ -500,6 +477,52 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
     }
 
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t size, prev_off;
+    int ret;
+    uint32_t i;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
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
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
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
     if (size > res->image_end_offset) {
         int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
-- 
2.34.1


