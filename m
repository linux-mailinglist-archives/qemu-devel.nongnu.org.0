Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A08458FF14
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:17:10 +0200 (CEST)
Received: from localhost ([::1]:38530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9vp-0008Uz-8m
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gT-0002lS-JI; Thu, 11 Aug 2022 11:01:17 -0400
Received: from mail-eopbgr60138.outbound.protection.outlook.com
 ([40.107.6.138]:46683 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oM9gR-0003b2-KB; Thu, 11 Aug 2022 11:01:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8HbdlHcvG7jkXF0716u827OcN3JtLYxqLf422KiBiY+OmlDzjYEXarn5Er/zdvZiWxZ06ew5uNGDfMwF1GuKlcjFWZH5Qda2094DQ9U/DE1FNqdseWPA5lFZJMtBpc0ZThfTjxlbtVTQk+JGo1cAXu/+43V26OXiFiFLb1EQRuf8QcLrnMI3ZlF1HDwLvn6mvCgnIEAx6hQzeVH420N83UcsflQ8CRzbjoIhyHwT++7YW7C9OJyhVcR/Lq2DUnj50HCfNmoAtiHgMnq3bZB/WLZL/FEGPcHq/ZS5vLZt6++lhNr18nG/COSgT3ocaHfocc6g7+qKwSdUsu5wdaC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPvEeeo9IY47D+VLvinSlEWigqt+7wjRlAV64Gk1SH0=;
 b=kV8jYns4UT6HSJnHbhFSg1Y9mrkhXVL7xzPacqrcWN4P5PnCn0xL56/wpG2L8CYFHDBKJSwbLdm5U2P53jGcqcqdwJiANUUPJrR/J5yNqvPSTOWqFiKC/Uo3APO+db4YeukkAuj5ZP9mXB0/s7sQiiZp3zFO0jjkYEpn06q3A/bdWeWFjtErq5N9fAoVRlOCPGCkH3iQqYPN6BlxtA0tqdlzfajbU8SYcl+5DqKxMEV0NZxyte29KHBmGTgVOatW7QVxa+0tchk+J2pQBjlvJAz7mnM5QOcmChW2tauR8oaCI4cdug80wOvYsHurYlqbwm+a4doL/Tr84NZiutFFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPvEeeo9IY47D+VLvinSlEWigqt+7wjRlAV64Gk1SH0=;
 b=NOjmZnJ4JI9LlTnsXkXUSuNNTagkNkxm/UjfopbO7mbfzk3xm7QAhuYj7Tg8l6rfM2LgktXxblHkp/EOmyZQOY2/MSE1XJxeQ4UObA7qElutT5YqKYBWi3Y/OkXKJnpes+t0VQBoJA0c2aUGplzafHadRVttdBGXa/PuIkqsgSlf90FyTtfhJTQyRiCgqewUThK7+OzqOmMqHayYF+Zye8dWFAiFZRO/dmIQ+T7vV9uywwmQwAGKmB03A6Wv+vcRPEGpxevgtxLY029aKRkHokxlZ/R/bbPqflC7Q0oVeeWzSWpzXRYQuvIATzyX47FwrKxktM36lA7CHrp7lzQb6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DB9PR08MB6521.eurprd08.prod.outlook.com (2603:10a6:10:254::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.18; Thu, 11 Aug
 2022 15:00:59 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.021; Thu, 11 Aug 2022
 15:00:59 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v2 6/8] parallels: Move check of leaks to a separate function
Date: Thu, 11 Aug 2022 17:00:42 +0200
Message-Id: <20220811150044.1704013-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
References: <20220811150044.1704013-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40effad3-bfa9-463a-7568-08da7baa4cff
X-MS-TrafficTypeDiagnostic: DB9PR08MB6521:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sjGf0CkkxIFryinCS1yMmGVDzREQz8kyT/s4Rxk/HH1N2q0TDMCCLC7wIWbnrk3lTOI7XHPtxJ9vwWoWEADWiexM9ddRsmSJgUB3cQG28FT4khtR2Ns+nKmeGlrEw2QaOYlNWj4Ejqw+3Dc3qkAovu0BaGFCAkYtQxuckc7okzGuP1xaoqgHvzjFX/qJFo3mZ/1+xhYiwJkuXh7SB8W0Rg9ZILU073i8MsqkQLDITyjLSTqF4f5giRVY3sZPp/KFtmhWiTTCs0vH1izLLy6kVD1rDZeex6HudTgg8vKuvU6bEiQaypSySmTl67zHZvMSofnqdESESAEOd+In/RqegtVX39nJnAr2fN8yy3lHtqPSFrp7vHNllF41BUeceHk4uARkoNi0KtFWUWYx/mhnUfKJlnehUtFHbqZb7pH0sqz5B22+nYQ/MrJoFhK2qbFoWGKm7TxqE1ulPTbFybFkjUGwKH2ev8jqn9GtudndgtsGVGNQdyYwkVGeSs+Pmw8wCZ3c8Zzu9WKvj3xbuymxH1BdfE/UgqFwKjTvbgraVSor9DmqNVi9FYUl/IqIM32dI82xdd1PXla7jLmyvsFAxW91LNAfDSGm68wSnfWBwwfyi2G2l01xNfguwPooxcTmDyLMpXIsBlAd57CsjNzKLHY5bSHz5Dk/hJ1bnHsm7GQdUdsOFFbh5Q51InN09FBebJqrZ2174aa728EDmbhDNPinqEqs/Ro3qr9TGIVxT0lm58PHlZ+A/hozYXs1HY5TnhkDMKri2j2Pb76Ykpe9Kb3gVrU1TxEztP2U00E4ivs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(6666004)(36756003)(6512007)(6506007)(41300700001)(478600001)(26005)(86362001)(2616005)(1076003)(186003)(6486002)(83380400001)(52116002)(5660300002)(4326008)(8676002)(66476007)(66946007)(66556008)(6916009)(316002)(38350700002)(38100700002)(44832011)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jhXxvCCqtbLO5vHULeXFE5hFt0XT+YG53mxOhqjrrf37dgJnCFqxiCe4WjPg?=
 =?us-ascii?Q?HflZhTzpHtW9IihNTV94TIKQPm/4EWF3OxPL+oBeXeg8LmDHb2Icx7N5ObvK?=
 =?us-ascii?Q?hV/RiIvWeSOUCkCpJTNr+GvfKxjFL+2fCbaHQMG6AMEm5FUgbccwi669r5Nb?=
 =?us-ascii?Q?e6hX8zslJoeQmWZrpGbX6FhZoZxSxptdvupFGN0iQoU3feKXzWzhqH2hXC6A?=
 =?us-ascii?Q?KP7sHqk3GgKT0l3XgPKXSJq16UgDevSFSaXW9fwzZrnj4t0sQfJCqUX4Jt/z?=
 =?us-ascii?Q?YDLQUu3dtQya7d/b1l1JROpmm/m5rzgGgkTmtWs9icR/xevswyk97Suu2Iui?=
 =?us-ascii?Q?zU4BGzOx+NBEy5HlDYONw83t9SeiU4GAsv8kcb4RpBcCpA5lQn6geKHkI3jx?=
 =?us-ascii?Q?2cRjQ0r8N1lqf1D2fXLbXAlGVCW1hjoPBbZ3vYMEIEzNUHSDHp/rxF0lzvpR?=
 =?us-ascii?Q?pnl/ygchViZwCp5cKxtt0OwbI0Qs2kRmwUZb9KZ4VwE9q0YvZ9W+Oy3HWnf/?=
 =?us-ascii?Q?lr01mUw6B0B6oyZzQb849PmSzUw7ma3zdJbdsKByUuszGxIgka458pIcB9Jc?=
 =?us-ascii?Q?J9GJTvsZs1Xyf+P1hMDFRhFxLEUC22bxugiSUHYPuOwkuy5kZSoL9VGoTIPl?=
 =?us-ascii?Q?h7fv3zYyGZs0rIRK53ZWq9me4RMBqQyiGLchgpET2ozTSZqBz5whpvp6LuY2?=
 =?us-ascii?Q?HKa05SE65k9ZMpH7F/Y3OggXlxhMndavUUSGBRm/cE2R0eWjEeGggujL6mvU?=
 =?us-ascii?Q?lSiivjLT0RzJMSk53DlBh0AoUUCEuMarJepnVBMLgvUa5QTyyHyKi1gvWMe6?=
 =?us-ascii?Q?Jd1UrX/x9uISTHKpGnFEM1T/vNlJVrzfXR3oZj277plTAlJ2HkzraX0e1hnT?=
 =?us-ascii?Q?q9QtJC0wdMSCv9CxSbeYARIasc/mwAaS0GG3ZdwsrdY7ycj9FDxOS0j3GysZ?=
 =?us-ascii?Q?eEJMF/4NKrM9l460spXnk/xzBgeh6hD4PDth03+cbJyCsZYKN6TXUlJk2Zkr?=
 =?us-ascii?Q?/S0j0zF9hIFqM2AmEppGBF9jWIlu+QLkEHu+TN1OgTyR4EHBWDu7CBOMH5Cu?=
 =?us-ascii?Q?Q9TdzQosWqkfH/771AAyVnAHMilHVc5qXkdB9JxgmMzoN8PCgTjNKGAsgbOV?=
 =?us-ascii?Q?pTaqJ8/ew0A9AYCWyAlz+4sAfX1m++btshOrgt0YoIoSTZmL1SwgRm6UKZZc?=
 =?us-ascii?Q?jSNk2XFLlNJeQ0ep4IHCek5n1NmjqjUuJihiR3zqxHenKD7a+lrJFuZdG4+4?=
 =?us-ascii?Q?LSLu7Uqva2VG4whj7t+afyGe4+yMTro8F4XoA3n4Y4dqwycs0H2ZEYiWkepK?=
 =?us-ascii?Q?zLFp3B4YPhEkoVkU3D+GuCMC5cJP4Av1X/zDTN3mlOK6qXnEbPspxo80cSh0?=
 =?us-ascii?Q?zmL4u4A5HSRNgPHmRsTTFcSQ2Ml32zT37f/sd19vG0lY0m+EqvRxmaiU4n0c?=
 =?us-ascii?Q?m3D17TvOb3akKZMRqf9YcHkifQFo6NLYXyEk+miP6BRZEkEn9taPtUu631Ps?=
 =?us-ascii?Q?22vlUcczDfXX9iK6WmpcEDSLo8Q/tMA41I7hx/6VLbKIfL+VS+G+9f8+yfE0?=
 =?us-ascii?Q?9btrxO95X2kTuVjXAq+G2umH7TSRUWJH9g7R1XnbFp0l11zsMR4s89poKkz/?=
 =?us-ascii?Q?d2OL3q9jbPE4FoOen6dFtMU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40effad3-bfa9-463a-7568-08da7baa4cff
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:00:59.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/Hl4twW+lmigAGPvGX3dBBuq2KxUHSRjOPoFKAvIinPKSmlQiVTXPsY9LDVbikD+VB8NkT2VC0OaiHqLul0XI5d7gjGhOHakW7pF+w2Cuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6521
Received-SPF: pass client-ip=40.107.6.138;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

v2: No changes.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 85 +++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 33 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 12104ba5ad..8737eadfb4 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -469,14 +469,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
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
-    int64_t size, prev_off, high_off;
-    int ret;
-    uint32_t i;
+    int64_t size, off, high_off, count;
+    int i, ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -484,41 +483,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > high_off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -536,11 +510,56 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
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
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


