Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707D5A148E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 16:43:16 +0200 (CEST)
Received: from localhost ([::1]:44008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRE4h-000681-9R
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 10:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtT-0000Wn-1J; Thu, 25 Aug 2022 10:31:39 -0400
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:64553 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oRDtQ-0004oN-G5; Thu, 25 Aug 2022 10:31:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEP3d+c7k7MzWa4mBA/W7x1PpSx/T2bo8AYtytg0FTMKaPIsyQDlkg9xQ4Xmdl+ij5RLoKNoW3DNqbCNMCQnpvLaGwsetxuXwulbdLB/mgtStuqQ18H+I86gc7AXf8CAqeoBv9UqTGY3Hdt+zT6ZBdYsMJcv+eSNc+kAh8vMY4HrPuYjGXAFuRrYMC+H7PpVzcmmq5CnNXF4Bi1kG6Y0vXwGlogiIljPKTt5XSWEYZ0zdWLARawa4FU4+1L3z5GNcH1NgEX32ES0Awukyc6+5+W+940mv6lf332rUE22fcP2f3XRCc/yHTsulbkySb6hUx59NwLYIBRQKi7bxjOo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0euhobaKcgaPVcllTXGZlFSG4HlsGZ7oXKT8kDjHa4=;
 b=e5cs1QWH6eVTxxHaQDIYgVFSkAtPCAud3J6576lmlzATURiKR904q4R3cqRPI6ZjE2A0TsIO0OUVlE0kuO+H5+kUPndyytAcINfYG1Z1FDgb4ekaSHImiNtk9e75YFGEpBQUnzFkSBciU93Ak99Ag1/9lhMugr7ZkOKq9zYd0ASOXrCRtyQy/QqLvGwb1FchR4wCm3D9nbKrRPna1BC1Wh4wOacDL6iG4b5Sf5stYGhqVqqNtGpfmvM0z8ocmjaQjuNHKqebdmJKHLEUXSfYopaIsTqU/20NnaTvWnsIJiMhDnhuWntBsY2ZqdUsjDEobPilVV0KD4eZ+CEpeZmXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n0euhobaKcgaPVcllTXGZlFSG4HlsGZ7oXKT8kDjHa4=;
 b=gHvss+U9/XP6pX6q+fOShJMx6agglcj4H0fF/k0mN95qLyzzGNiBpN2jW1VooD335GIWTqMgy7r+X1npjwRvXA2VQAEbPUZp1FZ52tQA2ZdBQhA0wNvmQtd5KargGxCUYKaoypz9CKXVmeFeMF1ZfO3Vzd0xqk5cBAK5EB90qTl81U79cvxPIvnV4Nnt2wUba3rlT+fjW3Jj5T+0zlS+mRC5/dChzqjwB2V6hLkniqTyw56i3R/JipoVGap7GYirZYAD17uaJxinxVhlRRI3gaVDNi6JjdG+tEE1sFZhDqTg0xnnllaYKshAgUs1AVTmd7p+0Xwzxai58x9dh/dPgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3569.eurprd08.prod.outlook.com (2603:10a6:208:dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 25 Aug
 2022 14:31:22 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 14:31:22 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v6 07/10] parallels: Move check of cluster outside image to a
 separate function
Date: Thu, 25 Aug 2022 16:31:06 +0200
Message-Id: <20220825143109.176582-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR05CA0046.eurprd05.prod.outlook.com
 (2603:10a6:20b:489::29) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f28a8eaa-92a6-4fcf-e069-08da86a67ba9
X-MS-TrafficTypeDiagnostic: AM0PR08MB3569:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XP10KJIWw1VfmsCGximMBr34D6pPV5u4dGbxbH/1ytdCnT4Y4kPhmQvN6xAnkVRrTjYNLF2BGt1ZgiGV9oJNcBPvs6qcJybtyosIEb45Him64uHh7ATloz0bQTgROfPclUjSoITsyc7f3mZcaaTZj2H8nemtsZpSDryP+2V8np3JBTzVF3mEoKcvGO043bxo38PiAH9ybRTJhbc6u/EShm4kCgbpQU8UFAS2qA8sxuk1lcg9NeGfNcxJ5ALKyKodCV47VS964U0vlSl00TdDOz7chily7yWgNXQ3cRjko3z/Bbps/HdiqSHpbYfaEzPYtgAai5RFd7+Yh0pg/+xmrpHrhGXEt55p+1xhGWC9RU+O5DMfwBMUlLfKO4ugKG+BJx9qlbAoQ/XwWjRx6keZGHdQnACdy9css0A/4/1Odk8hVKgca+z9fIiBdAGbEboRCZHFa92J7z6rByvNmqRA/4gQPaddp16bXMIRzWTM3hs3z6cWlv/mIhTdHH+6ywJxIdnt71tBr5Q1P4iNfcLqQ5cebTPQZFRSFA5xFPcF+tNyy654H3giFPNIVU9+deeshJwFs7dsrVIDWIR78d6QZ8/UDTlSXlRw/gCluADtIRIAQiuw0hKBQMVRyyIXgB7tUkbWvjBGHQ4sFo+2Q4Ww5mcXTnQ2CyS8KveDhWlQb8LGDJZE4fM6tW+k0BohXD3GV9KG3iTa9KBJ+LhQCBHMhiRDzDgQuZG7AjPfOSDaMe7t1vuqvL0kYGJlLBvRsEEo+xfaX5yqFUkECZWRuEp/PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(186003)(2616005)(1076003)(38350700002)(86362001)(66946007)(83380400001)(66556008)(66476007)(8676002)(316002)(5660300002)(8936002)(2906002)(44832011)(6512007)(478600001)(6506007)(6666004)(52116002)(41300700001)(38100700002)(4326008)(6486002)(6916009)(36756003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iRAprenRgQLYzVJxWqT3aqMmu+h7Ys5CEEwpHcAh0WBDtu75h1vQYQ4jnTxG?=
 =?us-ascii?Q?8pinrsBj4Nz61T/T9UhZDvg/y7rdihQ3+TLqHly3W6hVAqUN0zAfY8lDlm/S?=
 =?us-ascii?Q?rq4mBdk9yAKsDt5z14edPr2jBGE206i/MnyMZYRY8s0iFoE1ogYMBa/z98o6?=
 =?us-ascii?Q?QxhR6Gdgr9g76B4nzHntPyqwfeJoN8IqcCkKERHsQ7cFSzSzRtciHWC7Cr8c?=
 =?us-ascii?Q?K+/AUlF8+Cuj2f5vp3x85nd1B14AYGiPRnBFrMQALMPIzWouB5r98PlQjTY3?=
 =?us-ascii?Q?AxKZ3yN6F6EkF0bwUgE3k2RuMKKRpvYz6YelCKugr6AEPyAQLaaXVEUYUhEm?=
 =?us-ascii?Q?oBCyBZvEN1tn1fpafYe2/SbQ3dI3vP7kYCpV+QA2RUWTSP5oh4NSqnznzIi1?=
 =?us-ascii?Q?2cr0gGqDJNsitcOpPqg4G4+rlZC2FUgPWB5deYgrmqeDeCae39MBffdUUc3k?=
 =?us-ascii?Q?XZk6fwgQQXqjBFFXzenVtq45bI7Hw54AxDV5tmdlEQzflOwNdFXq4yGeYv/x?=
 =?us-ascii?Q?g4pTI/CjEM+7RrOWs2TL6ieMxKAzD1fLjqpJDiHd8Y9avSlqqPV/S3uJjprC?=
 =?us-ascii?Q?9mktDvSuDQTiSRekcGNKhQoOij60HvI/4MwzFJfGV8Z9WKV91+VEHsqPqocq?=
 =?us-ascii?Q?4zbUDQ+XxtZXlYO+e9GfY9EtclOi5MlEoro8OUipkGZbSltdT9Dk29kUJC+9?=
 =?us-ascii?Q?ZUfbD95EZ+ZZKy61FuJ8iR/wYhr7G0WW4zcT+YgMMM8zLApfkMc4MpL7Lo1B?=
 =?us-ascii?Q?9J5p5MUR9SFzQpFHPiTNkf9rWtw2X5Ne2jRCWXROJfJWvYKmgx/7owznpmxo?=
 =?us-ascii?Q?+Cdcbo+NlXLaRLk3+5GJTtwEObuGkZZkhZEsQshVw+SzbHoH2WiflMW/omxx?=
 =?us-ascii?Q?XM65vU5z9XUNjzpnnSKx/7gIcuNZh2IOUfh+G1FVviuLa8L2SqhlP8SUdvJC?=
 =?us-ascii?Q?zVFaGJA80PDbMQ8zLgc1th/afmqPG5B+j0fj0gfzmc667fyJjkeB0SDjNyNc?=
 =?us-ascii?Q?gSetjDI76zMDThyUphHTb2YEM5oPld0dKnBafSXTmLeUAz2dhczK3l93sDvD?=
 =?us-ascii?Q?DpgCn4XYm6E+ZP1DLaAvimgjYn/hCdt0XIV89E48i5LMtNZnD15gxSOlDTVN?=
 =?us-ascii?Q?2E6VWvrfPXliNTUQzZWeJfypTkqTYslLdYVT52dYRflR+xM+qpoIQsN3XGGO?=
 =?us-ascii?Q?3j5ZVf/aGM4yU+ayKZR2pEUgxAqkMi073h2adoPCdt40eybDEAlKZXJLEqxZ?=
 =?us-ascii?Q?56mMAjcvAx1IrnXFQyxmrA7dEMOdrvzx6aQsPtFwHSFndaG5VOmtb0RaHWVs?=
 =?us-ascii?Q?iuk/MGQj9WW3yzcudmNhkeJi+DcDpCJqVZxLY2tMJzAOxU4Uuyvw4/CkCred?=
 =?us-ascii?Q?+ZDj2WD+QiRmym/esZM7lglGfS8YIwJCrYwkXuGa3Z5pa41cvdNvdxmGv/5f?=
 =?us-ascii?Q?P6vT9Eh28WroZoUgTUd3De0UwdmhcYBbirt8dsv+DYrriVdZ2jPueIh23IAb?=
 =?us-ascii?Q?1aUxpQzc7ada7rWfw8fUBqjTGTJBbIvGGJFsvhhcZDOaw5wwLjJ5kJ+jfgl0?=
 =?us-ascii?Q?ZDCjK2+tpFBiYhGq8z0A41tBveUaERbw6M9YPRfhA/a2yQzwqspqu66A+oi0?=
 =?us-ascii?Q?qwZ/USx/owscqekWMQR0aaI=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28a8eaa-92a6-4fcf-e069-08da86a67ba9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 14:31:22.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CU3gW0TE1jRukbSlxs3W5jHoc/K+C9E6c+92gKrskEc8IGLtMU6QbZLrVwISAsPzScEGEpSh6rR3KylDFFL40clgXV+v0se1bTsZfi/wb9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3569
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 59 ++++++++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 16 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index eea318f809..f50cd232aa 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -438,13 +438,50 @@ static void parallels_check_unclean(BlockDriverState *bs,
     }
 }
 
+static int parallels_check_outside_image(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, high_off, size;
+
+    size = bdrv_getlength(bs->file->bs);
+    if (size < 0) {
+        res->check_errors++;
+        return size;
+    }
+
+    high_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off > size) {
+            fprintf(stderr, "%s cluster %u is outside image\n",
+                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
+            res->corruptions++;
+            if (fix & BDRV_FIX_ERRORS) {
+                parallels_set_bat_entry(s, i, 0);
+                res->corruptions_fixed++;
+            }
+            continue;
+        }
+        if (high_off < off) {
+            high_off = off;
+        }
+    }
+
+    s->data_end = (high_off + s->cluster_size) >> BDRV_SECTOR_BITS;
+
+    return 0;
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
     int64_t size, prev_off, high_off;
-    int ret = 0;
+    int ret;
     uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
@@ -457,6 +494,11 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
 
     parallels_check_unclean(bs, res, fix);
 
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
@@ -469,19 +511,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             continue;
         }
 
-        /* cluster outside the image */
-        if (off > size) {
-            fprintf(stderr, "%s cluster %u is outside image\n",
-                    fix & BDRV_FIX_ERRORS ? "Repairing" : "ERROR", i);
-            res->corruptions++;
-            if (fix & BDRV_FIX_ERRORS) {
-                parallels_set_bat_entry(s, i, 0);
-                res->corruptions_fixed++;
-            }
-            prev_off = 0;
-            continue;
-        }
-
         res->bfi.allocated_clusters++;
         if (off > high_off) {
             high_off = off;
@@ -519,8 +548,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
-
 out:
     qemu_co_mutex_unlock(&s->lock);
 
-- 
2.34.1


