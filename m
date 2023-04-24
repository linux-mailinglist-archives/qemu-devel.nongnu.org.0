Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E46EC90A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsYT-0007dI-IM; Mon, 24 Apr 2023 05:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYN-0007Z3-Hb; Mon, 24 Apr 2023 05:32:12 -0400
Received: from mail-he1eur04on0731.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::731]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsYK-0007Rb-AG; Mon, 24 Apr 2023 05:32:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOVOAzRR9sqDb8dBbM+JRhdpngWSKyNv9mGAb0sQFMj2/w4IKAbnqIYEDwRK1l1zD/9Pklczni2yEJpbDRKIuBLJ3KSl+IUFEBOrs/9wTpVb0cQufP6vIrKMknM/gWXdKcv2StfzY+Xj6gYpD+Aos0f5xWELBBQXnLYc3eZ7+KQOz9EaxBqMtiooRQnAzGE3jmFG01p1toBIN6DPaMK1HdFSKrM92RWQ6aDNBleenqH+IrM8vFvIIZ0udX5AyBJCLGp4IcBT0Zxl11tWZlKmWqWtouc+Nx5C7vynkNm0ZpO6JVnNNMGrgNGJiQs7zxKnfdkGuPITtI3GFfxYDyOZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMDOrMQOAEcLzCo+0O8hmjMAoxZudV/fIB8RrFdBEuk=;
 b=OsRGcS4GRjA05uqL/yVuri3ntElzCNXetCqw7W+bI6COA9/BIiKzvrE1dEQHrcCNq0zlE/kLxg2uVQ6bAe+hnokX5PJjlVzDSO/yMGxypONo4ckX9yTkkkp+dxWqAqGsbH50PlnAW553QHcp+VjPkiLf+ZXaufplfHXRUpQV7o8x/96CW+Rtl3FgvneVxEkTTs8aWjEqW+3EjqiuXjs0GtXIzordWThKqgLwIigjNV0ziCoQrUGHHI2zZkktzAPFzOAzSBCea0xirXuAo75UdDThNG7eHfLTaHjusQxz4BMr71UuB3PTEbm7nGe7pPQ44D3cBvpd5hXMlX//LnJmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMDOrMQOAEcLzCo+0O8hmjMAoxZudV/fIB8RrFdBEuk=;
 b=DVl4LWCOvkWXq6iVb9dG3hkJYU8KOwstOCNcyYJVwDTAihtv/zyo7kG/+rEh6RbBvKtEx9azXJLssmDmLXWY06gv0FSvrvMhFXMAUSStlDerHBz7Gc/zTK2dlA4FeH4bJYlQ+yfPQrtINO+6mARzZ/jE/E/Y/rqyMKjkzVQnQIUp3VoUGYweMJpk0FypX0wkDMsV9zxzUWWxGIsV2uoqfAEMo6//3T8YpikeL3qhGKU8JquOcP9QCJLsseVcPnSNa14D/P9ujq7Go0tzcrU4nBZcZSWmmKhtqkSlCgwFYLWQFRCWjv4wDI2DdK/7E1MlAEgsCPK0t2MkrpME4hXNxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DU0PR08MB9487.eurprd08.prod.outlook.com (2603:10a6:10:42c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:32:04 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:32:04 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v11 07/12] parallels: Move check of cluster outside image to a
 separate function
Date: Mon, 24 Apr 2023 11:31:42 +0200
Message-Id: <20230424093147.197643-8-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: affbb203-3e82-44bf-0a45-08db44a6c3ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vRxKZ5K6bRbR8pKEoA3oemEOKGQ34bwz+M0XztPHC/i4joc4NPPOrbteqBmGVdEv+hHoHCV7JfuiiAdxQPtpLRbyy6Mg2y9ZmbKQdoOVdSRbNf037P5WBLmaX0Yfg//EkZOCZl/EKTREmVQWza93l64WDLi/i3nkG4GtD5WH+h/w6tR7/ch/Vi03jQCJHKqer1oUhxNgcjYrWsTkr4s3ypKijpRtKFQtCtxXLFck0fz42MD1H+N65Z3bjtLXfIziktYR9wGsN5b3abj9jU4SUYTT3GJL1+0/+2v1RikOGzbyAsQpEmkBi5Dy9wifV8HdprPRJMwsPWndCmUjhltFgcFBZw0FijzNsN/cq+Ea5/u2Gfk7QeAS83D3kdA4ZQmDoMtx1Q3Bi2WiNDbBsQ+qZT3j/UlqJit9t9gc0HV1qbzsU3TTEjwbvm8t7YF9bwYzm7Qv0oG5kWEiIfsbfPBpWLysC70UmBfRGu9V60ep+Ne1dPaeoGhgasKl/lryKvqgPLECAMTzRTWNKp8yKB+ye29Gd9ZrRdiRpqeZXb1SBCl8yUkUtyCcvLEO3JXkQXpkr3PL9r+H4Ue1KbCy9UuyoZaeQlNKoyeIA+IpIm0JK0Hq1tyKR8c1aZAltIgBfzGx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(86362001)(36756003)(186003)(6486002)(26005)(52116002)(1076003)(6506007)(6512007)(6666004)(4326008)(6916009)(66476007)(66556008)(316002)(44832011)(83380400001)(66946007)(2906002)(38350700002)(38100700002)(41300700001)(8676002)(8936002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QiQJwLcRY8mWLTwOLsbmiVqZg1omzXHY445s16K7JTghsHH+xOu+WE0+aYsG?=
 =?us-ascii?Q?fOJrQ6u1UauUAKmTYDkK8y5GZfeLfxqQz/HhweAmvZV1E6byqPyxEN5n1dKo?=
 =?us-ascii?Q?avXDhl1DrGiq8sBcxQ1SplYBFRGNwLxqn/aN5EKe5dpOuUJ2nl3PNW6kx6po?=
 =?us-ascii?Q?ZNv6N0OqWhaBZw+sDyYWfK2eGpjULzd95Q66bZ3Foc6ppKJLGXiqlfCP9qxj?=
 =?us-ascii?Q?UV3b5ywJEQUGT2buUmfcsGNp+xAY0g6oNlremJ3CdIE3qVgcvQIYHA62PfLa?=
 =?us-ascii?Q?ukkvII2vR6GZ9VqdAGE3kXf7Y+NYhamp72QPyU0JM6cqdKt5+hYkeKUwAUnG?=
 =?us-ascii?Q?VyNreLvChS4WpIOk9GWGo+G6CHMhbI25OIEaODl/m5MyG7M8L1UDgtJCOhGu?=
 =?us-ascii?Q?O1TAfayhcw0GO0ullyC0063IlbpA7spJolj+F9bwU6mBVOOV3iieYodu7hnu?=
 =?us-ascii?Q?C1iUndPcHfCcS0RWnjZF6GFnG0XZtPYTZFHqtKRd7u67VzoafAxyLD8gKRXh?=
 =?us-ascii?Q?MJFVnwI+CDeV0N8NHmy259zD+OdLo/vNKXbz7h4d7fL5eDcHqd9GrIKhQZNC?=
 =?us-ascii?Q?LQp3TLPp/eB/+gHIQ6Oyu71vJI4wrZAfTPMDxPlr/PTITSDCT2zZQ7ijDkv3?=
 =?us-ascii?Q?VWKsQr+s6t9cK64hQPqEHljbjbfshac7JoJ6ijEdzdnDkDA6jJB8etjIke0R?=
 =?us-ascii?Q?CyLE9lYRqoep1MRQjroxW9Rneqbi+vJt3ZOYfs07A/vWpqkysGA5D0DLsd/F?=
 =?us-ascii?Q?HnwO3JyuDZzZSRAucxuMO351JFm/9n7rwZ3FB2w8t4qRNt0QVZTQRT73/Xma?=
 =?us-ascii?Q?whh0mOvJAdAfYK8SRxBgSjhn+KrOX5S8rNQefmO7aYa37B7nFmi6sbfhBoxY?=
 =?us-ascii?Q?DEgJEMQtzq327hJ3+s1r93OqMpUnSdGkh29CowRvsJEa+62KQ7BHOqHL/JRm?=
 =?us-ascii?Q?9IBWzrKFRexyXVWwWVcSncXgNaPPTGuERvLRRRC0qIMuW5ePIWi4gMq/nCoT?=
 =?us-ascii?Q?pnX+U58ExJ2cbtLqoz5Sg9xSAAAxielE4X8WXXw0aX232Fnvj5gkrDyNOykn?=
 =?us-ascii?Q?9hFbuFW3TlSwxnSRCAW9NbZTqnelSv56oJXaqiyCeOb8Ft6efjl9bXVJPEJh?=
 =?us-ascii?Q?jyCXmBxyZUwmc8RlCJs69qs9Pxu0eYsYkT9NbDZGmqBdkcDm5w4wf/02e39/?=
 =?us-ascii?Q?0cMotWVAL+Ke5QqTR3nds5OT+2kUdafRmwLvf8kOqDsx/qKbVT3PLNRlQWYQ?=
 =?us-ascii?Q?t0SlEkL9Y6SBy7rJdu7iRCsCbkg2b8ctKLXk08RDQX+dfU2ZIFXigInfOG+J?=
 =?us-ascii?Q?93rrqzTQQPPnIx+c24yS3Ws7D10mpvA6+1dqXDzlkZmOiNt7Aj1a9/4DpYhU?=
 =?us-ascii?Q?kI9Ul6dzusyujolhOjCbX1xdNCBfkDxoI8uOVv0Qo7suHPMZJSHG8xvNaLYt?=
 =?us-ascii?Q?nFCPmvBVtc6dafG21hPhjx2Np/c/DpmHOxoZuHDKlPylBouNDhoYQoGDU+1n?=
 =?us-ascii?Q?gGHFoVLvas2nvRE8+gkmLanyhkU8+Ai+SsH20xFQl1TY1IFcziNHstKBMqtv?=
 =?us-ascii?Q?zefB06h6S0x8MmPlZduLzUqLV2eBnhD4IM6f65EXwmAuiUvK1+ELrxjAsva2?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affbb203-3e82-44bf-0a45-08db44a6c3ae
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:32:04.2945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlH5q9Z3GQgJdE0G6ADNke8QwtOikTMMfOT2NeMKijIIYIp+phMF744kIPQyVf1H1xudZbiWGCuUGMLgBnly6oyGTRy9fkOCokOOqPdJ4K4=
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

We will add more and more checks so we need a better code structure in
parallels_co_check. Let each check performs in a separate loop in a
separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
---
 block/parallels.c | 79 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 4f14bac616..8588c3d775 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -441,13 +441,12 @@ static void parallels_check_unclean(BlockDriverState *bs,
 }
 
 static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
+parallels_check_outside_image(BlockDriverState *bs, BdrvCheckResult *res,
+                              BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret = 0;
     uint32_t i;
+    int64_t off, high_off, size;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -455,23 +454,9 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -480,19 +465,11 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
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
@@ -502,6 +479,52 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
         s->data_end = res->image_end_offset >> BDRV_SECTOR_BITS;
     }
 
+    return 0;
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
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


