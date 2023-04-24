Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED376EC914
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYr-0007y8-40; Mon, 24 Apr 2023 05:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYU-0007ek-2G; Mon, 24 Apr 2023 05:32:18 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYS-0007Rb-9K; Mon, 24 Apr 2023 05:32:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAaOL+OcTYkIs4pN3fLoYVXZZ6I/hhBNn14fSCMPidViyT9k4j2msQN3ttinmSDkKiCVTKZ6L8ViR5rnLwnbe1+eRqhHi5auO+zfFa1U6SiYH3/HWC2k2L1U0DlK/NBBEnflOmC9Kx2VMoQQnAx6I+OscziJyg9VYdwhDIFdJAuA9zalhBwXTxJMyTxsJHtblDpZR3i37Uj3eD6yRYl1vZKqrpJoX4vA9+AbqwsV3y1QeQAmFzvL132Eewzvg1f9qgA9CYMjGscRnvrGZV3qB33BMx6MXQBpfv9AJZ16G7FV/bbSwwJazmOSwrWWDhRRU04kWI78dc2yTYqbkINNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlilXhw4n7l5bywa2l+Kq87+Ffa2JsvoDKGDo7EQJHU=;
 b=JQ9pQi+Yd+Kjw/DE2UDDOWuEWj6o7BMtkp1x4YEHLluct0bFr3fN/Pme6Bko3XDzoTS4gyqZq1FN8LKx9Y9VRJKdcURDS3CEcqSxSN21jPoaUopyKVAVMGvdR2tk6Z40TcAdpmhN54U3tDkBFSsR5ei8POmTTzFpbCXRbmEfRZLpB48NMgxjK2GucYiyzXJPo65VNzhiLpNXMKZSycGp8poC63VcfTXYrkdSZA+XS80ZE4JoLHhS488YNImIHjAQUIY83EajfEHp07/YSFWvK9VBP1/Oxit/OxZgwcdIef/Mk+IeBWOreYyTBq13C2lVcUudiFeLffq9Tu0YxVHbrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlilXhw4n7l5bywa2l+Kq87+Ffa2JsvoDKGDo7EQJHU=;
 b=uyxKWskWGvLuxW0punvQcX2MRF9IvprgK3A/7SXHZfOb8q6eapHBo7vlDTZnmmUlJDEHV3tShPLKRU5W+IBjeVOT3yxqlTIHbqFZfhuqciTTJZE8MHanRk3a8PlDQdZ99o8syQcixc5padHAmA1033Ouq7T/wvy5OOubdVYtyMpUsnOKgoU17/iG+U222TrAud3dUZrwF46DF6pMP8TAxY/UZJ1e8WBH5eHJw8vONvd96kpcl8uMQ7Qv8DIrBp7pYNwze1KiA/nqRheRYrbAKlUSnBvbeUdRJszLXzdgEjxHMMdUvIBDpnigbZ4t6Ep05vrLh1SQwK0nk6ZfpuyMFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:06 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:06 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 09/12] parallels: Move check of leaks to a separate
 function
Date: Mon, 24 Apr 2023 11:31:44 +0200
Message-Id: <20230424093147.197643-10-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
References: <20230424093147.197643-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0169.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DU0PR08MB9487:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d693d66-5886-434a-c417-08db44a6c4fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcGeUyIbiJqXXUi32/B1VAtmkDOzo4N0hkbI/C/u2L1M8qVglYsuhn5R0ykaPMl9Pk3aBw/i+0tYKrn7GvJxiv9KjMOAn4XKH+PbDY0y/zca1hak0w9q29AA6NE69qOozS4RrNqvqWqd+CQEq01BudfS4dK0UWchyk2487r3BiZSZtTnXXXRMLdi7ocjgwOj54rudbPz2Cj+CxKkir8lA4elMWTZEeS/Pylqr+jZyGTzBE/MOnonf6L1eEgGnp93PTwzJHYV+cE/RkND6qq3SqW1jobPc4otUPxcJfzyJhzt2CvhVLfKa05+RVhSSSL87LDQuYIm8TIXchdcd0gHQsLHr+xfG5EYr2erfvov7cn3P/OfNAyI3ngkmySB0ElxTZp1SIg6cZ2omTDX91pXlaw/iImloMfWImP1fFo9h5XeIsghaVAXVNErniub7HENzSGRwAFs8EtR9xoKoRQahHFiy8UcA248t/0NDRqOufBTRvRSSuLJ/FswqXA/OSL1C+b8NetR2SSpwjOqGoZq5EhCv/qza9yyEIDGEN/zENgbpeMokQHms/laAPESHGcyFDGzWg/Bu2j7uRL0nyGvuXFmF3ZnRiYbguHkLSqC1vidMHEA+/Vz73PI7ry2w1sg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssPEkqKrQXGY+FbjiuhRb/zrVWgvinJNUIRNK3HUgG5BQnJZ1M5jWWd0KOH7?=
 =?us-ascii?Q?kld49EyOXsFEoHnhFfiN00RrYyV1CP7kIPA7iq4XgIsQNq9uNVxHJnaGP9L1?=
 =?us-ascii?Q?pd2oCPlYMZ3V6BAwW+zmmjEC00W9GqCrW/GZ6Mq0GK+rEOOiR7l7J2Dce0fl?=
 =?us-ascii?Q?E6bwraU3hc/P/5ouL7k45O89Tq1Hq/3aIeTVeMsaXV1PaY0Noi//Um0MrnxA?=
 =?us-ascii?Q?nqixmGsiMWMFL1Lp5V3IsogcqQ+fchpaUHJgzEqLobhueGF+OgbvB0kTUCdE?=
 =?us-ascii?Q?px0Hty8s6/gYEProZMecNaT/sYwqz6O8Hjaq6evF4hoPzg/oz+GMrKToJWHh?=
 =?us-ascii?Q?H/it6gl+Wie1bPX8v47pJy9Kq5zk9Pb69/fJ0i5iedqDZWc1utolZiQaq15W?=
 =?us-ascii?Q?Yu/JWjSUu9h5mLR46QXvC8b192+K17k2HQH8xjbOlF0iChIGgzOjdYGmoehO?=
 =?us-ascii?Q?J7D64qGc7DMOjLJ1M1r2IKszYrI/R3I9lA9/modyfkl0iJQBd5xrlvruNMQ9?=
 =?us-ascii?Q?BCk1DDNeQmHX3lcWQJd7aW7nkCl+rLjHDLOjjlUtg0AbkDFn4sGfHN0NY/RD?=
 =?us-ascii?Q?ZIY63u5TYeohzma259rIcf/8FEb6/q+p6YdKTfz1cKJyNv8Tom8rp1ZWWVP5?=
 =?us-ascii?Q?v5T6gk8BQR+LUJl+H7WiCjdPoVgPTP5AATbWfCx3JZ5OzP9RcHVqIWsm9ViU?=
 =?us-ascii?Q?/abajHdUV6gjm7mmLLxX6sizKcgsK3U3CZXFNIt1b+lWD/BJSxiN9roUoNSO?=
 =?us-ascii?Q?KKPaMIonmMCyDYxJDB2Kler2paVYhHnDEucHLX3ECg0NGSWD5OduZ8vtekc2?=
 =?us-ascii?Q?8M0wzIsXzOFnhqAioez01dM3EETCcRjCjMWYal3TJv4g0HSPVjqE7LodQeSZ?=
 =?us-ascii?Q?pCbyeBK4aPgDdN0hWxgmtb00HlYmbcaBHHVk+gD47hsuPfUnwuD8oHIaaVEh?=
 =?us-ascii?Q?pnUzXz+e7NXP/7BQLKmjfpaGZI8kfWRKusOXqv45bX6MyB/aR3yraXDIpY0k?=
 =?us-ascii?Q?Uf+pfS38j4dMVrStD2GJ/nPLd/GxGU1NaC9wGifZqGI8TbxpKu2rcjG5NTQT?=
 =?us-ascii?Q?G4MvQAvbQuWrd8CYW4TAT4BwHEJses6m93o4fUBX4IlrFyki5ruGbuhdMhTU?=
 =?us-ascii?Q?FEVEWgbzR3FdNKi8SuqvkI80k10g/wFEJ0ZZvJDt4gSLAAyP7XyOpGvZq9K6?=
 =?us-ascii?Q?8wEjVZGm4Z8vzoKJJGc0gE5ARIki67SUlbR0/lGZM+F1PGD/clUMnVDUXXiw?=
 =?us-ascii?Q?OTx2X0QTYLmjLbvcABSM89LpfpaQBFvVA4LrqnNXAK4MYq7XnRd9WZU2GKDO?=
 =?us-ascii?Q?ahAQIUmh9Cht5sxZFdIQhsVR1WPhcul1GdCrnyjQXYxJVajTp94fIZYUuRca?=
 =?us-ascii?Q?8n61t0uNGU386ls7SOpHk2HrKDbpe765Lp9p7eL0lmFA0t1qjetFtZL1y8F/?=
 =?us-ascii?Q?HwLJ9vHFQ4/za9p0zRNPBsE9xNoWjWTTV86CWDWh1tvF0fg0CkrVFrBRrJwC?=
 =?us-ascii?Q?fPfOLo+atICdiz4Zbogw9Z2IVImzpnreOX6du+ygZErSoxXwuUgzqgQ8zUgW?=
 =?us-ascii?Q?ctmFPs3bAAh3iAcw5cmAS27b7RyiCDOufDV4dN3B6Vn9ZoIS6M3d0jTblS5W?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d693d66-5886-434a-c417-08db44a6c4fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:06.4904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hN50frffdVswfAMAtrL434CcEEtXMjzWdeFS3zz6rDeTelEwGJDwRPNSQU5YjFCY/l9P4QSPlNUIeVZ/m0qkpGdYtT0BsX3lG/sggL5FAxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9487
Received-SPF: pass client-ip=2a01:111:f400:fe0d::731;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 90 ++++++++++++++++++++++++++++-------------------
 1 file changed, 53 insertions(+), 37 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index f389a74466..c3e220b60f 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -483,13 +483,12 @@ parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
 }
 
 static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
+parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
+                     BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off;
+    int64_t size;
     int ret;
-    uint32_t i;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -497,38 +496,6 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
-        /*
-         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
-         * fixed. Skip not allocated and out-of-image BAT entries.
-         */
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
@@ -548,12 +515,61 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
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
+        /*
+         * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
+         * fixed. Skip not allocated and out-of-image BAT entries.
+         */
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
 
-- 
2.34.1


