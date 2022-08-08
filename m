Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51C58C846
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:20:35 +0200 (CEST)
Received: from localhost ([::1]:56244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1kI-0001kA-ML
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y7-0003Nc-Lf; Mon, 08 Aug 2022 08:07:59 -0400
Received: from mail-eopbgr60132.outbound.protection.outlook.com
 ([40.107.6.132]:10881 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oL1Y5-0001SH-Vd; Mon, 08 Aug 2022 08:07:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32o2RbX/CqASk4hIqdZJ1zIyczOfflfa21M99ebqHJg4UlGe9e3Hus1e5lv47ivxLWnAfWR80I1GL+WRIEgKBbXbIdGMjRkiIPTQHwsCzsGxfRPqq+9rwKIIPOM7qst7CGWeNHZHT8MwggQjyXjPX+PrqvMAx23FaXF1OUaBiF2JAiHZrK+1Am2F077ofmDpVbW7PPpUBQJgfM8KccpRgLEZTMQ5fOQ6MIjYic7qIfo/hXFIa3gxnlhA3x3YfkVUy0P88JnAmGfkU4jXWwSYqEI+PcUMC097BoyQzNCXshQ8laMINwu5Cy7KcTRltjISSlrumdgjWePqQCEWUhxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k6siispsn1GEgvaRc3ICIsefMQJFnkwN6SydQ81DXgc=;
 b=jQ1gzpLz2CMihNr4lYAO7quoD0Ce3C44XkIVe6c8ThO1le1iB2RfCpfGCTfVEQHR14WFDH5FmXCNH/rgkTJHcdHdmbA+jb5dDK7GeZKWFQWq56dKeFlcQviN6fGprcsi2wb2Cqm3NgoYdpBFAP/qbjd6lrpglilNtG7pNIdA/zpSwnaajd4G3BFUi02/zJiQUNcJV950Z1QLXLs71YHFX0JWnkTlItaAFDP4JdQkjdfJ6cbnXtWY8jRfdhFzJfFCoSbWBRRbUVobjvroo8bixxZnNp9VNhmMSGeZZsXwSO2GbgG+EiJwqaK6vHamhvT3t1rufucedMOzdD8Wnzp8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6siispsn1GEgvaRc3ICIsefMQJFnkwN6SydQ81DXgc=;
 b=cD5HS2S7lYSr9yp+EedOhfMBFM7pAUuj4Z+brOtQrE8yX0GWE/oT8puDOBef8RTHH0wYERfmVOIk/KeQycUMOqTyBEZKtHMX2GTULVPtgr4xAIU9lXXa/MZ11TvPPxmtcjIDqu+3Qt6WeebkINOa9aTrinnASYPLubL0zkmbR6NOodhsLOxURz3KDNMmb/MZV5E4l6CT/CfgtIy8td/VXm+//v95t7eSXaaCVoCgFdrM77UUM7OMsPR6ZcHi8FG+5lLPJ0SVZ/nWjOKyedzNBzzC89b8Tf7wAsq8qNQDcp8SWUFGas61S5upmR92T6L35k03OCi8Tw0TKEFMWZXhOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB5360.eurprd08.prod.outlook.com (2603:10a6:803:132::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 12:07:46 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 12:07:46 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 4/9] parallels: Move check of fragmentation to a separate
 function
Date: Mon,  8 Aug 2022 14:07:29 +0200
Message-Id: <20220808120734.1168314-5-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
References: <20220808120734.1168314-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::13) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffb384be-2841-4964-dd8f-08da79369ae0
X-MS-TrafficTypeDiagnostic: VI1PR08MB5360:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqOFIzOjIBabyoKBcP3fb7sj7idpr+N1ApCqP1u/ibOe9hzk2IAKFIJmngROLQJCKNYetehRGqqprCQZBxwhzk82gwM9wyohvA4f9mbv8v+hNDlXbv6DLRbFuWDCFV6ZEkRwjLPxb599CFLnBgDlLSMt83hgPAZ4+9apzuAXIuz9LwrHdWkJGSs5O+lgYRN0d1exWUkdpGSsE5adyynAfJqPU5hv/ercHfy6Du4zZK9a31JZ0h6hJ6Xg8rlP144d/QBYr+u+Z2xKEWIO1C7XXhwKuOMp8bppUv2Orums3qmT12A4731fKEkwxaVgLwzXJb4YF1g0ZxrvDtcXkVGdPuQM/q4i2pSD1DogfY/+2Eg6KuT4Nevg2v4sR5EyPI8Q7DAu1VOHjO60aoAEzJjiPfGRlbUsXH4Ew2vlZVVOGFHs6fq5FJAhNhYZkvAKSRgLxSw8vsn3Jfi411Kx5rtHrJSKZcd0D12dRbgZEbfqxtoe4rrYME2XzvMAPi3g+kVKZBkD+X5v+tM//tJpteQpl1uLgHLeMW7gJ9Y5WQ+7dNrKs9Nshjxr/JN/nlLfD99CSd0AfeP6FXWXhDHkmvjPKRcxujN1eD6HZWRF0zIffkOdato+UrzGOxmZPtI6ynuiq1JI0QJ9lub1FeKCZBw0v7nPZp6tUYs0PwQIOJ0TjWI4AGp8E82Mza67S9M33QVhopvdM6VsqnAJ2Gg3B3H2GwiT1/cYw7vyYQoH9rbxzbUJ32ekpWUE5NmF2Fpu7a+rEca67B40KWBhxExmtvRaw7LieWzJpEZP5JG6gxDiXg8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(39840400004)(136003)(346002)(66556008)(66476007)(8676002)(36756003)(4326008)(8936002)(186003)(1076003)(478600001)(316002)(6916009)(5660300002)(86362001)(66946007)(6486002)(41300700001)(52116002)(6512007)(26005)(83380400001)(6506007)(44832011)(2906002)(6666004)(38100700002)(2616005)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ada8Cad8W55FPUF/CHes2kAoBvQ6OJTFpw14CbP0D+eleBJa0JrXVW3dSrqo?=
 =?us-ascii?Q?oukf5ZQlZTzroOtktyoMupMHP5Tsi/DGLNL18Gaja0J/li1aw5Bfiblu4Lw/?=
 =?us-ascii?Q?J3p5bQINnYKbma8GjiekofBLJ4NTbOqqb46HBpxRsQBeaoa72uESfLsaThe6?=
 =?us-ascii?Q?U/6NKdhgK0xA7yQyAM8tagFB+hP89PeMXF+Ss+77hVTW3JH0xV5EeYbEwvUK?=
 =?us-ascii?Q?DYZ04Xv5VlaBs9avO/3k2KGb5ZEnJKtrK/Sc2zegkoxAKENmAp41RgYum9CK?=
 =?us-ascii?Q?jwN9BrujUglN8PqTVcceZYLr/ClBAEQykwGRLV1C+6dhet75XnN4x1X5sXjY?=
 =?us-ascii?Q?jiYzcCIOkluJG/48FwEmOrPK9UiNO+5KxYP2Q8yi/cNmyH8tPUmTqZa0Zyg3?=
 =?us-ascii?Q?xNdaS0ey8/qu1F6j2XndmiMXoMh4zpQizJBhiMwQ951317frZcLxykYMkYgX?=
 =?us-ascii?Q?9R5eswoBnbIxbt9kf9XM5U4ZVPb9/vzDOnq0S3AzuZW7uifyNj+KLQxApEIB?=
 =?us-ascii?Q?tKqJ6HfVs4cKWTahiW0AyTCr6X6fsi4+aPA+tpOux3j0GCP6xZmeLLIWhuv7?=
 =?us-ascii?Q?xCB4ZXqYBhrKbEQuBbo+JOJNrj4CHRkm9v9RoUNGWXshZODYCI3zxizCSJ3P?=
 =?us-ascii?Q?rb1K4YOw4Jo5ddE5+IqdF0j+6X2uaOlkAmiJAFHOEg9O1zJ60UiQBxgTXGbq?=
 =?us-ascii?Q?3K4UoZ4G3LPTU4gRfBwXFPybc9BDk8Y59s/Cn+5AOJfH0/rjMEiMVBptEtBE?=
 =?us-ascii?Q?45ShUmkIjQUZFTwFJU/shu2554tfwKTYN8pLQEVBWFkIYLTkEdMB4alqaI3g?=
 =?us-ascii?Q?PtYgL7IvBJHbTBCQ5PnW/AMhniDFiFp8HECESG5PYhlKcWwsI7WBV42YJiZb?=
 =?us-ascii?Q?V2hZ1IMzPBemW6lxsOMaOMAEdife4Rt6A4CWx7s48uR/hvDRbzikIESkLKrE?=
 =?us-ascii?Q?eC7nIp+alicBIwTvgsFjEwswtsdCp5ZRVbzgip3K37+9FXNnXH0HMmFUOpvh?=
 =?us-ascii?Q?DJaQupWlWlH0ci4cg4J7VBEAOi8tjpMD5LKLqENwpm91sFL6kwJHZi4ca8Jb?=
 =?us-ascii?Q?GCQ+ug7nwI8uyAvahHCxrNEECsk7ZlhTR2unvS3J3vs2TThFjcMaMBiKThZy?=
 =?us-ascii?Q?xMvIcsZwOcsU3PGaNgTY17gnAUScDSZa0lGMAtWXmPEdQ/7SAtDn/PuLID+D?=
 =?us-ascii?Q?oa5NNel34LMyBoknzRonU3SOFhjcMjxtR7mXOLcVK5ox59Kj378u9XKWeA96?=
 =?us-ascii?Q?T491qCelwi/vqx9a8LFXBGBhU23I7mzzuT+RZLBN71NO2uiHUOPbwLlj3Fy4?=
 =?us-ascii?Q?nzrtL0joNWFy/gKRYDY/vv0sdyA35ti+oStuyf/CvVZFJqha6sHyIbA9Be0c?=
 =?us-ascii?Q?WCp+b2cWdwrFVMgCa9XsavqNPOpur5k2C+dGA7CunDM4BZ+/Fy3/E1accoc2?=
 =?us-ascii?Q?JacAxsZQuzy6feHxPi1sQNKWByzi/JS1IPWwTzdeLSkRjuU5X4D30y+MJ/IS?=
 =?us-ascii?Q?DxCa5wPzD7NyrKpiFwaCd7eKEK+0i7urnQiM+ZsevJ4u1jw0oSmgcVxeFbrl?=
 =?us-ascii?Q?PVJ1zk/vsVhLsaep2wBHHPpzhSVKAbPv5f+ZFjHsd2W7ouqChbs55zIUhTDY?=
 =?us-ascii?Q?0bRWFOT9/vFVL95MjSYYJIc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb384be-2841-4964-dd8f-08da79369ae0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 12:07:46.1063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rC8cpREd8suiRYzRBqCLwFINGRXk95nBgrgtMNmOdVJ0DdkNngsAjM0D2nI3N5rmVt9i7by4HTupMcOpGkjosM+7Tn+ox30vWQozXIirKoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5360
Received-SPF: pass client-ip=40.107.6.132;
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

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 block/parallels.c | 38 +++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 6d4cfb738b..0edbb812dd 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -530,12 +530,34 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
+static void parallels_check_fragmentation(BlockDriverState *bs,
+                                          BdrvCheckResult *res,
+                                          BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    uint32_t i;
+    int64_t off, prev_off;
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
+        }
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
+
+}
+
 static int coroutine_fn parallels_co_check(BlockDriverState *bs,
                                            BdrvCheckResult *res,
                                            BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
     int ret;
     uint32_t i;
 
@@ -553,23 +575,13 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         goto out;
     }
 
+    parallels_check_fragmentation(bs, res, fix);
+
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
         res->bfi.allocated_clusters++;
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     ret = 0;
-- 
2.34.1


