Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF37B5A464D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 11:42:20 +0200 (CEST)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSbHf-0006Ev-SN
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 05:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0z-0006JF-6b; Mon, 29 Aug 2022 05:25:05 -0400
Received: from mail-db8eur05on2097.outbound.protection.outlook.com
 ([40.107.20.97]:38848 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oSb0i-0006gk-W0; Mon, 29 Aug 2022 05:25:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avpBuTgP+u5ypXGO+ziOUSLyNMWsRGg8EWQaMXz2GD0Y5aNfDYaO3vbZCkG3jZlKWd00eI8trpBao+mtdGWlceNCJGPlHYyN7//lbDoqGtzsSd762AWEfVErxFlMH9bpRC8tVRSFo57jiFKouXGtX1ARpoYwq+WI8CXYXmp6MNz4cfHVkCqCQcNjtDND7bjKkY1pxuoHnSJv+7w0/BRqnNju05MRG7vEbVSuySEkJXyCI91q9XyEo/DESlgA0igrtbXoxV+Isy66zDzM7bmhfumV91Q8k+qj6EPCn17cI/8r2ezmMPr+HgLmBRYB3mUIk1wOf8dFiO4WMGVUU5dI6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=ZJ5KUpef6dM5pdfp036u7gZ4jH8ozges9gqv8Har4UlW5iHWwUh7toPCE27ld2XjHfsYVzEkCmCorev+JvnnLpWj9psIKFEB830Y6eTY1xOJddRCROhMZvCuNRsBjgepNrapDkcUf0F+zHnzzj7p98ErGmafpq2Kjws5lYnfOTxQkrAFnVu/ltei9a5SPdltytzTMMs3hGC162c4CV/hiTnKj1+xkbgcYX6bEzNYZ6xuC6J0z6QGvMUZGRQlzc/27d9yLwlJIxiAfNR5wX0sOpNGg5VUm/YR8FFFZ3vhM1Tr95aWWBIo4nMhD/P3hvgjs0VIObscZuktcLocwB3uAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arrAPOJikaGyeNEaTWhS7yx8/exfEpCQTqDC8N98mzI=;
 b=Rgo2q4h7fSF1YWS/WdNi8G6XBfGU3nad3PLBAxBdYHGiuOu2qMgs6Js11KVQtM62jsz+tT62eC1oZCHGaKL3XcKykMhGDWKZjeZwVFzre7Q0PjS+nvK4le/mwm9O7BmQ2a8pNX9CazIVpk7ThnAorGkEz+vhGo85b2h4euI3oEFsQst+gxHl+gDE3HlWIUAQlP+m/qbFUByegj2ZEMtlqaYVc/erFqHADDWwe5ixun/9JiiuMaNx8NdjEom8q3nNc7hNukJe6GOYJn8iGg/ODb51PMzwgGmqaY51c9KMdfdzRRY8dO64hZ7iw2cgb0jS4gfEnww0uhhresool6gBeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by VI1PR08MB4447.eurprd08.prod.outlook.com (2603:10a6:803:f3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 09:24:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::5174:25c7:6df8:741b%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 09:24:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v7 09/10] parallels: Move statistic collection to a separate
 function
Date: Mon, 29 Aug 2022 11:24:18 +0200
Message-Id: <20220829092420.341050-8-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
References: <20220825143109.176582-1-alexander.ivanov@virtuozzo.com>
 <20220829092420.341050-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26481bb8-5a67-432e-b951-08da89a0497f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ei748fIKpH/M6R7ztNV6Ce35eRRrElL21RyDHieRKovtZ5F9r1cZWGjAn6apsncWpj2U0VQIKYvznagZUm+UmWhSxEkqqJ6Uzcy9rX16uNDk2usRLv+zZm8xU2wk/HUNLRzXIk4zwzbi2vwD7tpGKg9mpemXyXfuZV5I1ASZOe6rC1SgYW68uVn1uuiyEc7m6bIF3khrJcDc5cq1bi8d6SiZBOC0n01iyh9FmqN62sSrzEZoJm2RX+69U1UBMdcXzz2i61Lu6OXgv9FvhKQchAfaKB4FUR5Shq1bvKPb0EZlCPNOaXXczFKTDykX9Qlk33dIO0IKvGUBETPQPZlSGEtDei9PHFSi8W3m4EaJVe9FLkN/HcmS2IhiiHIovEbl4Hqz5LCGIhwtLVngv/U4+PCf+OTY56Wuu2nT3GtflYS90iD3ZGnZ+DH7ortpxGFbyRK/XVjLxzpJQgL9tB/nUJjXpLh1oHoITVBMW037tQr3EtJ9W0Pksvajb34jywLVBRdPZZZHDB5Pa8wtRcAHuWatxs1xxHQVntuoWbT08DhURzu8zJeL52h7pvEOORx74GK5OSZqKG8xAwv8NWMy+0MlZSyWetuImqvILTvudA60iFdLAF23ml0C9IkINvYCosULOQFhxkxyU/d1w7oXxfZj4J/v0rV668wnPoGm4kutLswLF675bGSGN1ZT28hIik7mevZ2nXCtmpRIi76MxZXtNXSMKOdZx7NKlMw9nXR8UkXVKF2KtLTqcEwpk3D6i6yXqXVVYXcQolOCIc7aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39840400004)(136003)(1076003)(316002)(6916009)(8676002)(86362001)(6486002)(4326008)(66946007)(66476007)(66556008)(5660300002)(478600001)(36756003)(8936002)(41300700001)(38350700002)(44832011)(2616005)(6666004)(6506007)(2906002)(52116002)(38100700002)(83380400001)(26005)(6512007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AVPv+OkdYlZuvtbz7XwwNJai2XZG/VFq0wyP/0l+3GIZ5Dj/FWc7fO6fMSWH?=
 =?us-ascii?Q?4BzGeY165+XxbS55wWk+oANbY2ZxR+JiJfS0l7QZHsdumEOWNHSf7JQni7sI?=
 =?us-ascii?Q?rP2qhmekqUthlaeR7cr/sZdy4zrNOYO0sxv2LnQBl/dl440y2oXEV8VF6cyT?=
 =?us-ascii?Q?xU6G5FiO6HftcwtUr3fm+QOe9JdiiV1gKAdy2FwdLpZHwTLOfDJZS5+J9wK7?=
 =?us-ascii?Q?9WQMKNpjNXCGUJOukkQhXdgbIadPqYtwJT8Zs0dQL9wPG+gkR4+zlOdhWWX9?=
 =?us-ascii?Q?m003bb6yopOGGM5/Afk0GBLq2gMAqEL/xoLYrF+/Ly4iHJCNsZcJ3smfdsvf?=
 =?us-ascii?Q?AVxwMRZaZnrpZWs4VftxzhYHBb7ll1VyfsUZcorHSVXH7b71aBNXPg+2hSkG?=
 =?us-ascii?Q?7aKBCLWes6IxkBHGUAPHBrcVXodCQiRhYrA9FRmaCmK9iUgtxyFcrWFdwNU1?=
 =?us-ascii?Q?napEPW2z7aKpQmi9tdwUpNexyZrPVzlN49afuNb8Vt2lWi1bW4K5qCl4+5Mv?=
 =?us-ascii?Q?2kF/TioV1dTcJkQDlUHGOnKHCAPesAzGwRgfe05W8Xa74JU3NrjavZPpQfFO?=
 =?us-ascii?Q?S/pyhyvR4XG5Ma0K10sBKzRmJqr21rfRDCnlW2ufStJCV/PjMO/Eg6S7lf79?=
 =?us-ascii?Q?7I3kUxK0NezH120JQGhUjvpd3TUCo30rfI1YQxv3tVrOpv41go4viPjttvum?=
 =?us-ascii?Q?ogWr3Tt2b43oJicyGqsKuMhmwpZCTCnqHc1uOIJer24+wlfF1jWFLCmpv13T?=
 =?us-ascii?Q?HpEtBL17XyuBY8WqtyV7mnsla6/jMVtmLpJqa5LkL6cjxrP+GSM5U9iqxJMU?=
 =?us-ascii?Q?1OZw9M4uQuUCopxsBYkhlN0yKcy2ZO45XGWfj5WPnYCr8Olj17eNeRN0Etva?=
 =?us-ascii?Q?h9Vx2jVDBbhha9uUPNkXHgi/qVFNqWmYn+nXj+M4ODaqLaJ9R9PtEUI7Pyyy?=
 =?us-ascii?Q?96bi66jVBiZ0DhIcW/46YwcfMA4jfJc1H+UyyR4F+wyZ9scGyrQMwUe1Ob6s?=
 =?us-ascii?Q?eNz5jBXyepahxlTfu6JE4qXqjadzlvGE/nKIOKGIow/Nhcbmr7PzMKEak4AV?=
 =?us-ascii?Q?HZKvHDCUBTJnkvCHhwvj9Wzj0f0EaLtflRVE3Y9EYObsEBWJisa+Cp3NuZyE?=
 =?us-ascii?Q?JDM5GRtq5rByQ/uKioqmE2ETNxRbvdYA41SBLE3W+PlxSyg1x4Dh3eUQyOvS?=
 =?us-ascii?Q?sjcocI/QSXh++qiwVluGEDsDqHfBV3yoyqx+rdsOWb+RsQqVBLnddW7LIusk?=
 =?us-ascii?Q?1mFNZeqiyH19rhRBSxrv6PFN4+UW6l++1s6dg8YjGrp1RLSNSDDtcRoqhpJu?=
 =?us-ascii?Q?0qy6+dAvoMsyYAFHF7BJ28W9TPCUszu169ZlO7dIHI4KJB3Z960hH5aRS5EO?=
 =?us-ascii?Q?1lVlf023mN8KGtpyP3QHl40gpVujJikoT6cKZ0ZgP5zQb0w1YC+PnVTFynKG?=
 =?us-ascii?Q?Td3RBhvHL+Vw1HOQ4Oo73jEgP6unaCIbADR/B3g9Og4IyTfv6j63ytyObI3u?=
 =?us-ascii?Q?H986EaBBXaiv469l5C7RL/Z7GOxFTUDDK3J5bHgUERaPmP0fu3zFAmaDNKhp?=
 =?us-ascii?Q?KQY5JWdAwkQGxH3knqB3fB3kDu1INAIA5XoMSTNxInIsWMwGbRhmrXp7n+3m?=
 =?us-ascii?Q?C5UBsxZX6q1CgeDFX/ToCA8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26481bb8-5a67-432e-b951-08da89a0497f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 09:24:34.8320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wf7d6958SKE+Ck9pKmmIvExbXFHAWD7LknBPzdpjdPJmQXt9JJuylk8FA2ze7V1R+EhKYjewNfO5h0ypMi1blBMxqeQ4b1X3R4P7i1sL/IU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4447
Received-SPF: pass client-ip=40.107.20.97;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 53 +++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 1874045c51..eacfdea4b6 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -526,47 +526,56 @@ static int parallels_check_leak(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static void parallels_collect_statistics(BlockDriverState *bs,
+                                         BdrvCheckResult *res,
+                                         BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t prev_off;
-    int ret;
+    int64_t off, prev_off;
     uint32_t i;
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    ret = parallels_check_leak(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
     res->bfi.total_clusters = s->bat_size;
     res->bfi.compressed_clusters = 0; /* compression is not supported */
 
     prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off == 0) {
             prev_off = 0;
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
+
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
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
+    parallels_collect_statistics(bs, res, fix);
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


