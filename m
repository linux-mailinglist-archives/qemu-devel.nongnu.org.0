Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 817486EC88B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:17:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsJi-0006LZ-2l; Mon, 24 Apr 2023 05:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJg-0006Kw-1o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:17:00 -0400
Received: from mail-db5eur02on2071c.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::71c]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1pqsJe-0002zR-C7
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:16:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuVrC+PYwMErPRbg2TTdsvQJNgUOME9qfhFy6TiIOG56O9VJ1TvF6mVeBjopfYI0QF8/8OZ9lgLJnhFsFSV8GQsMvaVG0OWmjaX2HjTRy5w7u9Bomf/2wa0QeosikbCVnU27BCBzD+9VK7KO4t+RAWHyIFr9XT83jM71E+TjnF1+qTM18w6je/LyARIVeJgRBp7NZI2B8xiXDFa3VtEZD0C8WEXVbsv+800xgU4mM6Vd9mBJnQwzANG2MxMhLMyi6Ui+AW/jl/Lq0SHxy1n8P+684kXmDjM2nwDujupLrZXlaH+8M5zpP3FRU8ekMxYe7FZZYIhk2UXs2O1GeZr5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M59z86ocTmWdEiULiva7UwJlxeM57dsdQ9CRBOMRxpA=;
 b=LKKpDl9zqRGN6UbZaHa+bxaknhgOzV60ETJq+pYjPUjghiO6VWzG4VEepMhVF1MAMI2XoITUE2jg8lJTHv62FVLfL/z4PhJwHMxEYX6VyyHRel6w7HB1/en7tJSoOXXbh+9BHiHtg4QT+md2tpBjomTP56iUSIfts8taiwwl+/jE/6R1HrxiPhLwkXdnUk8fntQkS2VIl0XTO6GS9GwGiRDmOuvFlo1BwoQBViv2dNAgpkCA9rc/7/Ud/vounfSpYUqh1jwsF8lebp5piFJ0iE3zxa9X2wrNObkn57+tPj/4bpJT/dab2iGo/YXKCTtysNoYg3F6wmMoLZJ0FxUckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M59z86ocTmWdEiULiva7UwJlxeM57dsdQ9CRBOMRxpA=;
 b=BDZAZRxRAC2+TSU5DHfUa1gNgT9mJv4k/fnCz/AC/2az6BS5p9MZl0T7HQ9aZ2AGiAxWzRyCG17GZ9v1CxUCxPbF2XDJSHFUbVoMykm6y3Mw6EmPW8QPGr7zrXGYtSn0+N+kJDIwbflzYbXpLVQ0o+sYyYfJU17l8dMJUPKeiD/W3aRtYX19BYhXKg/HFM+TD9y9cEMpvJWLtJOrXn+U6FqmqFwFi35XQHYKYwMeGNeIC4GAL/E8UzFvpgjN3Yxb1Qud5WhSAK3RWjZ3rnG2n/NmjVnLGzKnCXtBc6mh9a1CwURv+HgtKp3qtPSGU4hzyG6voDSyrxnfRwyIiorRjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB6534.eurprd08.prod.outlook.com (2603:10a6:20b:31c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:16:49 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:16:49 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, michael.roth@amd.com, kkostiuk@redhat.com,
 marcandre.lureau@gmail.com
Subject: [PATCH v11 10/12] parallels: Move statistic collection to a separate
 function
Date: Mon, 24 Apr 2023 11:16:24 +0200
Message-Id: <20230424091626.195590-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
References: <20230424091626.195590-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P18901CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::18) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 32322146-d861-485f-3193-08db44a4a24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4vT0yqlWOCG0cEez4Vz7d8pPPYZHtNv8EjYD9kPRiesAG/LIMpoJ3BpNO4Rz602ci1amKdGREfsZRnGzx5QhVruSGVbqrQ/LfMm8gNW+wSDg0WeX8xmVhRnJs1nG6ROZAdgc41M5daD5J/ead+hxdDpYkNDFw0F0j21VQejXbRKZe7UQXAAWbX8+NF1gOIoJRJFQ7ZEUdPBJ78B/MjjlpWdrNqPmSSAUHArQpQ6VZXU+0NHo/DUqzXBH0u56R1Xn97caRnBFHbDW0s3H1lmPPx7O7Ok735DGKH9GHWGDQGszbHRIAJaDSMLmnMZKuijWLljObe0nFqSdfkisr2gHIYkebJIbZQGIB3r3GDHlc2EHsrnM9E+pd1Qb4hBVri8PpIZrvx0Upv65a2/+16R0QFXnnG7wggj0+OBlSBoEXIvvsxrVQEwExP7mpELjlsd2Asuc16Vafmm2DS7nO/oL1zMfxdgNo86XPb+wcqKzaapFBenqGnEZDa8HYpSv/a3AqpoKpQ9lmoAioLJPa4YL/klnlf3AOa8kaXq3U1IJp0vqIi9XYMTYxe4TxeSjRGVclKlO9zzfJc+TOH9PaZp+Ap/dtG3A4mE+2ePCjEfjZg+ynOVe/h6dCibI7EF5k1vT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39850400004)(346002)(366004)(396003)(451199021)(36756003)(38350700002)(478600001)(316002)(4326008)(6916009)(66946007)(66476007)(66556008)(41300700001)(44832011)(2906002)(8936002)(8676002)(5660300002)(38100700002)(186003)(2616005)(86362001)(26005)(1076003)(6506007)(6512007)(6486002)(52116002)(6666004)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ra+bsqVxxNTKUsZUryRceKKZ1l9y6lq3LFE4WpQwjcEeaXmvdBxzBK0L9XH9?=
 =?us-ascii?Q?Y9BKeanyQvXZi92qIB8H7pFSqHbuLIfe8y4JcLzFPxccHmVmiDdnrk/ISvPz?=
 =?us-ascii?Q?C0hdJDcHs5Anr1LvNl+hAO9nSNbik1dVFZsQ+sxLaiQRIcuHGyDbhOQmPicX?=
 =?us-ascii?Q?2c5OPrzoMUdELo96r1EEKu0xO7UD1jb0t7aRt4Gnh1rGqqymHOLrGbgXp4FQ?=
 =?us-ascii?Q?s3WZ6/2IyFlWeocasnderQ6kghznobbXNqga8Ohl3mzjhMWnz/GpbABilbPm?=
 =?us-ascii?Q?5K2EFTD7S3CC0InEb79Nv1385mKyTcZ9lj5YB1ALseVqhpVEtI9a6pFPAC+V?=
 =?us-ascii?Q?8A972vDi702O3vsjb5FJNmWU5ABec7gP9Oxer0Hfj8T71Lxzc5afvQ1dpUpS?=
 =?us-ascii?Q?YlveCWBlXJ0MeFxE4iNd+d204elUsud9FHG62AstBz1OpHRzzZ2+JW5z2/fq?=
 =?us-ascii?Q?KQc4yn1m2PGWNvSyPA7IkZSX60GCzLLEkg5bXGol9WC+gn+daozh6vEf0nRX?=
 =?us-ascii?Q?svt3BVztFQRGukX07ExgwzqfYTk85hpKynBu1jhfhU+Yo4aOVubea8wwWrjC?=
 =?us-ascii?Q?46AQExUL+Ja7Jdx732hgGbRR2X6hgFAitZ9qSLfWlT3PhT21GgsoRkgAhhFo?=
 =?us-ascii?Q?Fl5Z9FXQEcvs6vT/AJfMhRH0PNf65Ja6OJhw3+XNcXyaSMW67x000oPJDgmJ?=
 =?us-ascii?Q?UcE+SQPeAkCrZHhU2dmLm3aL/GKBR+S4Md7uQWALyEXD3wh/0XdAJRyDhwjj?=
 =?us-ascii?Q?jc2vbIirB+iu+LFyP6LlPM08Qy44NV3OQHkVikuiFeJZYIVSXyq70+FOKyfa?=
 =?us-ascii?Q?8BLB5N8JvOveUewiSF07bYfmapD+7mbENGh0hrecuItVcZzgB76rSAsaIqn4?=
 =?us-ascii?Q?gTCz7oQdCnKqsN9f1kvh3RdCFnZ97Q0s4NoYkea+cim4eJSElfYG7eYaM+an?=
 =?us-ascii?Q?NdLwZ8NenSCYn3deYXinXnzd9uNndsAxM2UdcnTf1EeamHnXCmbkTjquy8BS?=
 =?us-ascii?Q?cbWbN+kq9VlWPcYrr2rEA6eKcerS+VRLULx7Z06PLBXsJECVgj+RYbJi7Cvh?=
 =?us-ascii?Q?FflO6dJz6TjXxm7acoD+MYGbQQQW6fLHG2OLzyAhTV7ANVBEwdHvFGddXYXO?=
 =?us-ascii?Q?bQcL1DY8qzYxCYchBUSNqb44/4XdQjsdwMQ6E2baAdQ4eK66RxeKx/4CGPZ1?=
 =?us-ascii?Q?PT8NbqlQtgzq/T6Axlhq1wjssTvZNEiPm6PZi28j+iOPDL3QkL1+RVV0iShz?=
 =?us-ascii?Q?OEupEuAvY+SSNLAU/mMCKdtgmEyUkCec2hZTh6jMSeAvj9F6amSoRZOk8KFi?=
 =?us-ascii?Q?egwF661QRFqO4P8EGIWkR4udvVlJe9wIqVlkIOGUY/JDHMHMF9mpWe8xJH1N?=
 =?us-ascii?Q?6ptZ4spzEF6+Pu6raq1Eo/gimgJ4vodH1C2FFQ0LhjBAQssztHovGpcJmHdz?=
 =?us-ascii?Q?lGrVtiFuV3NJKiAWJgGipI0/A9/bYCoJnSmLFSUciQYWiEFheNf9lvgF9/kK?=
 =?us-ascii?Q?iNGy5Duqj6dZ4MVJvCavTYUKqjFIKiIn/gxhuyl3qRIUcpfvySJIDh2lK+vv?=
 =?us-ascii?Q?Yj84pfFAy4lgqzGN4WTcz+uIy+BEfUDhuv+Gcn4Utf+VDXfGanNNH9Yv88yk?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32322146-d861-485f-3193-08db44a4a24d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 09:16:49.2493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZ1X8FuRR8pVXGfPHkH0HWIMCNuhbSh+pTuxuX7zEvcRMIa2OJ9MBNj1hTZms5bDCzwO/0xQEWTviGPjytVVV0WBAPO59gEtEchRBO4RKRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6534
Received-SPF: pass client-ip=2a01:111:f400:fe12::71c;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
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
Reviewed-by: Denis V. Lunev <den@openvz.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 block/parallels.c | 52 +++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index c3e220b60f..48ee5224c7 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -524,35 +524,20 @@ parallels_check_leak(BlockDriverState *bs, BdrvCheckResult *res,
     return 0;
 }
 
-static int coroutine_fn GRAPH_RDLOCK
-parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
-                   BdrvCheckMode fix)
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
         /*
          * If BDRV_FIX_ERRORS is not set, out-of-image BAT entries were not
          * fixed. Skip not allocated and out-of-image BAT entries.
@@ -562,13 +547,36 @@ parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
             continue;
         }
 
-        res->bfi.allocated_clusters++;
-
         if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
+        res->bfi.allocated_clusters++;
     }
+}
+
+static int coroutine_fn GRAPH_RDLOCK
+parallels_co_check(BlockDriverState *bs, BdrvCheckResult *res,
+                   BdrvCheckMode fix)
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


