Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB14F31CED4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:17:52 +0100 (CET)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3yx-0008WB-B1
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3U7-0006pz-B8; Tue, 16 Feb 2021 11:46:00 -0500
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:14830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3U2-000776-Cw; Tue, 16 Feb 2021 11:45:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+/D0CvtO03LGY6SGZGQjXtGa4oWBbsAWW2jIEobIc4LL8VMx1df7S7GQzEJMlaxw2sZklFK1gLwsSUoIS43WCK8oopWOWxTXMQhOIGGrPLP1l/jM/nI6RTkH1LegQxWp06EO+bHUUXz5mGnz3i1NO9nYSJU4w7imJIGaLHkdTiQgL6FRoHXzQ8cxYVAt15/MtVE1tmzwfkogK3ChHAikENZCuj7fZVvZ+xKP81Y8dxUMOu/zVkSPH41Yj3nxQ60T3XWMeKoGqKNLLQVYpuDBKa9qc87ivkFBUN24+MjE1CaugoZ/iwLMl9XjsnwLUUqy2KWOlAaa9K7wCJQFzHaYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoh9cTFRQJKuv4fY6dBmXCyRnsGPqk2Z9FlOp+DZ/lo=;
 b=K02ow2pUDRQ3g8IfvT2zR5A4YM6vszkwfvvYHENi2vSfw0hQgYS6Wp5jHIjb7CvxIkcIxv0FfOpvRB3PU4ZW6E0NUkdX3DGnJcvCh02xnn1MonPevIv1Wwv/RdtAyVxIPQu+qyeuQxUUHWXiYt5sxdMoVY7G4bn4c1zGMcTnnUfdUniviiuFQXUVMXs6WoMSXGMChWn0wFJQ8o6tV86XqoO4giYvSC+affqEHO+ZKIAqM1M3BA1kbk0MSiDnSVkvL89AbkvMgg10H7qGro4QjbQXDsPB6GOWHzVfrHBiDlMsIhGt2cqSWOrjIyHG5zbuq2nkCPhHBp9wfqFes5BxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoh9cTFRQJKuv4fY6dBmXCyRnsGPqk2Z9FlOp+DZ/lo=;
 b=vT0LjNB+v25cx+MAW27no2YuLaVfhjM/XoNK/9z6V+cOxQYDp3Krl0tMiE9nIG9QmWxqel71Qd4Ut6ehoBvOCaZWDFZ4HPz1balBErcCiNJh+NPVymamOZT28/4BmZGFpxg+DSpkt+iS/2ciYHfojm98MP7//6LoL4Yhq4IcBNg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:45:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 1/5] qcow2-bitmap: make bytes_covered_by_bitmap_cluster()
 public
Date: Tue, 16 Feb 2021 19:45:23 +0300
Message-Id: <20210216164527.37745-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216164527.37745-1-vsementsov@virtuozzo.com>
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f925cecc-7229-4fcb-3de9-08d8d29a4b98
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6359101254BC3E383483554EC1879@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:14;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xD9z0b1yuvFOEblNu9tFogsxq/Iu6T5W1WP5GcbvGJW2Wtuam6PndTmP+nywKg8y3nT4Xfuqe4sTXx4owKb1vbhEB+ogY0O3R6xI+FwxBcEgj6um6nlXqR2QzVcEijkUJKVjhLki/tn7KtzN+lhSKQV4ebjgT8EO+vUKVCM2xOx3JWJpU4PHL0FOOuob0LkqiWu2yIEX4R41V9jOnGVEV/w5/WLSP/meaj5mf4S9+ZcaiKK/VmC+W7TVwEf/HGIeEU++cf28r4Xa4f4liBIbzgoX1ci+F0w4pXg0GLWj6tWBQcWms+Oh+PWCgogax1xE+N15OM4/HkBpVtMak07atSe7mgt05Z6Gnv3eoNdUpAJIQgBZG/iGeKVDekaIkY746lvxOPX2Llf5qazUzAzNFNtPmp8ojqnRLfBOi1QKLGpX1tScfL4MzZVFqn1CFZiueAexT1xXq6kkmVrjh4EunHXVGvR0lrEc+Gv7dP9eoK1WJVT8UtBm24a0x9hDbVnshD5u6jmWFyNOM+pmYNbOow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(8936002)(956004)(316002)(83380400001)(36756003)(26005)(8676002)(2616005)(5660300002)(1076003)(66946007)(66556008)(86362001)(52116002)(6512007)(186003)(2906002)(6486002)(6506007)(4326008)(16526019)(66476007)(6666004)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rXpdBJ0M5M41sjOV9ntmwz0Li8FVHnGWgG+16T/GReoxYyI0sBvy/+FzFa1v?=
 =?us-ascii?Q?8sJBmQqJBdrr0k7Op8Vw7L0BHZbjAsP3kd5dhKG56PPEkOSNfFCrS5rzi82V?=
 =?us-ascii?Q?VqSbv7JF/e1NQZsmFKeJJVKsd38yHpWjgN3VguYI9oAaIwjvR5U1yTdvgLFB?=
 =?us-ascii?Q?POVQxJcIenGzZQoCkiyAYcUh6n+wFJDown20VIirkWtea4vU8dxNNwPWTtvo?=
 =?us-ascii?Q?F3t6+/Vo6pnG/rTEm0iDssqgrfA7J2xAuskHpOnGPiR4JCH3cBI8ZcEv244N?=
 =?us-ascii?Q?ICzEtqy4vjBjqK57Y12e1jjstD5yWzIqE3dGzy5JmuuOznzQO792kr3Eez4r?=
 =?us-ascii?Q?QTqdFra1j76OlHBBI+NgWYxk3D41GbVl+q766s83CRACCQgmZuDLUpnfl9N8?=
 =?us-ascii?Q?IGFxbw96f5jItOubxFThzuXEswfT7o4zO44TSJ6eeiXXyVJ1F8yprUGHM7ow?=
 =?us-ascii?Q?LqOlS/kp79B1ul0fcWl/1dew8u3A3Nt0rMe2+ZuPFTXj/PVQCESUx73bDYaB?=
 =?us-ascii?Q?jOrvmPTymz19d7gkxnCxr6X7xi4b2BBXOKB4OHkYJp5mzhPIx8lzu7bbgxUV?=
 =?us-ascii?Q?2L0YeVNnvMbPu2sdgmjvU67B1jRuCDyQT5gmOpJZWs3kbqfUlr2J9+Chge7w?=
 =?us-ascii?Q?z9mJNAem2oYvVjEyCysLHrozuQjc1JwxDF4Hvg94LFYqlWubI0uDx/J+2qAX?=
 =?us-ascii?Q?AfDJ3aa01VC8MLrjBideCA9nJlSJrMLHJ1QuNt8FKWzkmtB4r5i+YkTIvxWZ?=
 =?us-ascii?Q?BC7AOa5rW6PE2JBVl0GKqNIc7gTAv3rfAgmaqFW4yrTY0ll58M3RQjQElqgv?=
 =?us-ascii?Q?lcB3Crcg+3ugvwWozPL4fM6M8ffBRo/y1WY/GRq0FbfuCGJUIYRHW/gRz663?=
 =?us-ascii?Q?iNdM7ecshFMi6NXF/C3U9Tia6LZNF7lPKbcGr7bFXT8QeZkIZzGm+2Q+z1js?=
 =?us-ascii?Q?8igqmSQTBiPQ2ylnL5P2f/ScjEha++N5gNHPj3nZhTb+dNY25dW26bvxxaMv?=
 =?us-ascii?Q?SJupBICaQ+lCHZ0V1GT9lsEU8GFzoXfQYli1WfaU1qzIkJaKVsOED7Xw8lmP?=
 =?us-ascii?Q?MVB6BV3rrvyJH3PzmUUEvovdsNFmSvPYVg1U07pJSLiHgfChhLkhBcXbrY43?=
 =?us-ascii?Q?vKigqkLJUSCtQuxwe3DEFE5HgpyjAeNjrRQV8fo1y2os47L91Cic+m1rNsSr?=
 =?us-ascii?Q?RStV05IK09sUoZYDgc4wXpR0oEutkAIrsETldkcOOsP/tldeeY+P7ifMr1D5?=
 =?us-ascii?Q?kxI65E89inEncS/5NEDMaLzj684hVIc5ev43AWB8PxkUir6rbfpDmsf0INhg?=
 =?us-ascii?Q?fjDq5hZtb7jhOTVhVGPqSl4o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f925cecc-7229-4fcb-3de9-08d8d29a4b98
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:40.9881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xc3zc7Oe5c0o4QAK9COIRz7ziCBDz4gJCXifwZXXDqX3Q5MRAdfRL+LGehoWIIi1Uzrctiw7GcPY7/KQBHjjSZvD/jIQ73i/380Lmi2pDxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.6.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Rename bytes_covered_by_bitmap_cluster() to
bdrv_dirty_bitmap_serialization_coverage() and make it public. It is
needed as we are going to make load_bitmap_data() public in the next
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  2 ++
 block/dirty-bitmap.c         | 13 +++++++++++++
 block/qcow2-bitmap.c         | 16 ++--------------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 36e8da4fc2..f581cf9fd7 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -57,6 +57,8 @@ void bdrv_dirty_iter_free(BdrvDirtyBitmapIter *iter);
 uint64_t bdrv_dirty_bitmap_serialization_size(const BdrvDirtyBitmap *bitmap,
                                               uint64_t offset, uint64_t bytes);
 uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap);
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+        const BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 9b9cd71238..a0eaa28785 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -726,6 +726,19 @@ uint64_t bdrv_dirty_bitmap_serialization_align(const BdrvDirtyBitmap *bitmap)
     return hbitmap_serialization_align(bitmap->bitmap);
 }
 
+/* Return the disk size covered by a chunk of serialized bitmap data. */
+uint64_t bdrv_dirty_bitmap_serialization_coverage(int serialized_chunk_size,
+                                                  const BdrvDirtyBitmap *bitmap)
+{
+    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
+    uint64_t limit = granularity * (serialized_chunk_size << 3);
+
+    assert(QEMU_IS_ALIGNED(limit,
+                           bdrv_dirty_bitmap_serialization_align(bitmap)));
+    return limit;
+}
+
+
 void bdrv_dirty_bitmap_serialize_part(const BdrvDirtyBitmap *bitmap,
                                       uint8_t *buf, uint64_t offset,
                                       uint64_t bytes)
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 5eef82fa55..42d81c44cd 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -278,18 +278,6 @@ static int free_bitmap_clusters(BlockDriverState *bs, Qcow2BitmapTable *tb)
     return 0;
 }
 
-/* Return the disk size covered by a single qcow2 cluster of bitmap data. */
-static uint64_t bytes_covered_by_bitmap_cluster(const BDRVQcow2State *s,
-                                                const BdrvDirtyBitmap *bitmap)
-{
-    uint64_t granularity = bdrv_dirty_bitmap_granularity(bitmap);
-    uint64_t limit = granularity * (s->cluster_size << 3);
-
-    assert(QEMU_IS_ALIGNED(limit,
-                           bdrv_dirty_bitmap_serialization_align(bitmap)));
-    return limit;
-}
-
 /* load_bitmap_data
  * @bitmap_table entries must satisfy specification constraints.
  * @bitmap must be cleared */
@@ -312,7 +300,7 @@ static int load_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
         uint64_t count = MIN(bm_size - offset, limit);
         uint64_t entry = bitmap_table[i];
@@ -1303,7 +1291,7 @@ static uint64_t *store_bitmap_data(BlockDriverState *bs,
     }
 
     buf = g_malloc(s->cluster_size);
-    limit = bytes_covered_by_bitmap_cluster(s, bitmap);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
     assert(DIV_ROUND_UP(bm_size, limit) == tb_size);
 
     offset = 0;
-- 
2.29.2


