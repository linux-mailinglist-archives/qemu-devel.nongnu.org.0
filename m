Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878D24C6B54
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:52:49 +0100 (CET)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOea8-0001UI-K8
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:52:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNi-00024S-DV; Mon, 28 Feb 2022 06:39:58 -0500
Received: from [2a01:111:f400:7e1a::731] (port=24768
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNg-0002Kz-Lx; Mon, 28 Feb 2022 06:39:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTBNUxy8EIeYuypH4XCoKa9sSdhzu4BK1vGEIaRr6nnTx7DmRKVzb+sxkH4OdpfSY5/Pv/5rVRkjcHl7i7tYALxXdajMpI8kHfFKmRjhyN/+v7GPPM2IQvxC81eGJeU0QwYmIzOW7351M1wrys3L/rVR5ywcEM+xXibIuXG88fqSkRq2boEVhytwBoD4MYEl3N3hMrYuiRzmr5UGM7b5deMT6b/c8Qa7C2Jup9kodb5n2DgyFjQf2pHI9MPmRI0bRimmBSYt1JnsYB9LRT49qhjfCvC61FP2TGYl85JEEe3noh06dPuhju+mqdw9q3PAiSgfBCW0uD65p5mZmg1c0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=Hv4BBkigFvwabzQuEw81rtE1cELuo4qPlNtWu0z9K64T6rfGmfQuDcbw+4bcxr7AaHEM8v34hJETQRELpl8GvMJrCUSnRgoYvGhAXvRlNaJGZk9BhcpqzyToR2//Kegyk+/Dk2RMANxt/aUxeiioKOV+5c+oMIwtRBTvZWf4WMpZO4wojGjtvuXOiYMNXy6rgQVRd6frQ0HFD2vZ+qmRG8VdRN7ADn4jFj2c8vJNQC+pGRWqDgP1gd6NG3iWhsipWkAL1n3RzSgpZguL+2C7Q+ukECmlyGuyPoCu3kzXs2X5nVXlCuErD/7gCzY/xVSLaCfI000/p5fGagvcjaMJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYCkIsx9+bhwl6XDNZ+n+3c2V2cwQDr4V3HIXM5vypM=;
 b=f3PQ+cdKwRAGMb729XzMsxyvYZMigSZ/2A2aXUg6Es/QOVLiqlweaW91qU73Rz6dsjAtvfL+ne5IMM1zn++/B+IRzD8lsOUo/dtz7Pkv6KmewIxpU38VUyWKlCdlfQKzNNlyX/yFA5BBbkDNwbLqscNlpTvBZA4vyqSg/n95HMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:46 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 02/16] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Mon, 28 Feb 2022 12:39:13 +0100
Message-Id: <20220228113927.1852146-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0135.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::19) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7c14683-3e4d-4005-44c4-08d9faaf0510
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172AB2DFAF140800B785FA3C1019@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNGVXi7x1HT+Ac1+r5gSPd+4z8r/VA4v7f0wQFAAXFdr/Ta2CLEUTqU5k+zVfsgjUXbi9z2lb1NWAy/6E6bW4MCzVCw26w9tmdBMteknI8YzyYLfro9c9ecMOI1fwB4c8E1K1dNZuwXcPbLognQNppaoV+xoESPUUydooPCuc4lb1zZQOD7PHLubyXEtn6+vvzCpvguglkwdxBJlEb7ALhKNCmTvNSRw8YkcRgQ851sILotdkoTbOlkXR6isRN53Cl+asCqdYmldVpTeDhDyqSDTlWrgAzItoEB6Ye7yp9H7pqSLUAHQfiK8f/0/SVSWytWdVMiLj6gpIx9T2Rm7dE2AevySSj/awkt6jrIcSLrn9vsAhBrRFZdoQz10oHX21fdOEmsmDHHGn7Z3Pnim1dW1kHzIwsgXmgUUtAoYOiQLHL559Igw9XGo3bJPiEh+l3EVwJ4V9OYxRma3julTXYkqaQTVouK/V7nGtfgMp3Nwa47zrOhRGRfyldjHfxQveC3ytYnvdzaM/TJgfnEo/w6N1lbu4TXVEqk5QounfciRYGNzr0q/mey99jiH85j5EnqrjrXqVvIJQKfN/b6fbN1cNAiXV4hccQdNwxhg2o25WQZXeeEaiiSv47mHmDkiegcMFrbtu4zQ4sUh8TtGQt3ox3ZRJvp8Z3WlAF8TnC7FIcTqT7iaxMpfvxb0xuWHi24b9HMjNFCm+GYcMb2o0cZaMJwow+peHkhuJBrgvbE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(38100700002)(26005)(107886003)(38350700002)(36756003)(2906002)(316002)(8676002)(66556008)(2616005)(186003)(86362001)(66946007)(66476007)(52116002)(6666004)(83380400001)(6916009)(5660300002)(6506007)(508600001)(6486002)(6512007)(8936002)(4326008)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a42maJQq53IK4GVmDzKS1sjVJJ/3GDhAhmybituwpBE1CyMHNufgYyOqA19t?=
 =?us-ascii?Q?vnjZA7YE2u1+Sfl/3e4ZMXVlMhnvZ6bj5cRQy+k/gXl5CJW9vBXB4yS3JSuq?=
 =?us-ascii?Q?hqABI/Cu+ysxhHmMc2rUHP4dg//RGmiNzKWyHxJleDQT0aqvw5DvQ0Jn85Ky?=
 =?us-ascii?Q?D/G/YHSELrAg5Lry+AL3h/euG2mZ1xqR29ahoU2HpJdgP1WN9L7NneJFkqET?=
 =?us-ascii?Q?vB/9j0nSlcYvQt+QSQ8S4OrAy5EDMFvxx4JhfFZ7luE1fsQY5N7ZIcc06ayl?=
 =?us-ascii?Q?zJgyY3VbAChFimJkWT1eJZsKEiySBN92izDYsP1LZHSLn4E9uIUeh9jn8kLb?=
 =?us-ascii?Q?CSsbiv+7IuUXXCkXDkHqLBp42dufmVDtZ8aTj6obJ1q87j7e13jKjszoS/Zc?=
 =?us-ascii?Q?bKhOxoSxlHUXlXTvX1m72oCVuJkDrUx1aSzDsZSCJCIDSh1Rf8dF9ZGMB9jK?=
 =?us-ascii?Q?6qM7TLIGsNUyH9HprXo3gUFi9MTIveE1G5kaR3QuKLeDgGxmCrpDRn/Y9LAe?=
 =?us-ascii?Q?K2DvScRpOGFoUfOGLiY3LeK2cWjmQKnNsxJq0je8Q4QdhHp4mtQlj4UPn0M2?=
 =?us-ascii?Q?C/lhq9vti+KX9UbuBeyPzOCnigMNqdYKLLWu+4pqvMsHGB0LCRdv8v/Fm6QM?=
 =?us-ascii?Q?64IR1a87FJiPoWpPr6CJeWso0//XX7Zxtl0mlgGi4dhTyixpIz1rK4k7GRQG?=
 =?us-ascii?Q?b8h2M6YwT6msf5yRXqONB5q86Bl8hCskpgvqu9EqsSfmhLtOFMmJptsYNBGu?=
 =?us-ascii?Q?TNm/RMXx6I0tggh9qngrM5yth2pQkZlU+6Dk9TyqsX/rlERoxW2CV5kxM6wt?=
 =?us-ascii?Q?JwhzjknmZiJ5w2pcmM0OBw5duFursfyipesHw7GM4TB/yuHcOUWniGfjiK00?=
 =?us-ascii?Q?8t6tThj2+Vw3V5uGdHEauvEXh3ouxMGBgXQpVwBgDXuGUDpQ4wO5ijLDNdBI?=
 =?us-ascii?Q?o+O3tcDmb4orJXCiW9wB60UwrVF0BkuUaDM4tllF8yZuH5yCTgFbrN8upJgL?=
 =?us-ascii?Q?IjWPee0F7I0LvjGfMgEKUQwLoqwHfySWl844vHAnmh/Zp6mJYVtpezNyiAFr?=
 =?us-ascii?Q?5/4ubRnZ69y+ONiTgVVVvYTSk6blau5q26UtnWCk6dmtieQd7Cl0lA4ehnPh?=
 =?us-ascii?Q?6bOcMMi2Pve/GO/W7g9Zo2yuFdMosDTxHA/ZHwjT7+OSen9D0p9UgPyCXBRX?=
 =?us-ascii?Q?Rxm8+1PVtICQWitFBg7xfVjAZ4AaPoJqPpyZFr4fy7WSLb3xe1mqlD2ioCde?=
 =?us-ascii?Q?z8gfjFClohQUTDFYH+U8iFiGJeD+YjF5AYkP6Ty51va7yJMtpmz3NemDQPai?=
 =?us-ascii?Q?E1zShaIWPzKk0LWUEy8KzrhQcpsE6veadwp+qpduXyJtcKVyUAQRkTLt0eqG?=
 =?us-ascii?Q?oXJn2qMOcTeHqVUQuPpd1BrtnULUpTPaJXzg+mX4fftn68nm/1IBbK3nZ3a8?=
 =?us-ascii?Q?q8axU3JsrFjMD60S8CtSrIG+63UizJucNyWfw01JS1c/nWagU2+0gEAjrleK?=
 =?us-ascii?Q?Wuo92h4fpvdRyf5EygHIm+ZPLoEOrWYjgD2mdQXC4Wiu9JBDH32790vlH2Av?=
 =?us-ascii?Q?09wikJsjghOvlK0f7nh93aJ0fHxZZrS08R0O6tXh5F1vCAZJAQhelmJUutcW?=
 =?us-ascii?Q?ZshSD4vKFfY6pq6SO10thNdR5Lfl4UvDSuNXNs7Nkuash9Duz2BrM5TT1p78?=
 =?us-ascii?Q?UHgfxQgcLYBVvWAGiZHmEnoqkO4=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c14683-3e4d-4005-44c4-08d9faaf0510
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:46.1746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYYChV2i8wAtYkla0jRFOWG6CiL3PL733NNmSeqXLO+stnHfEJp6WQdXFWgtY+MiKDu9I1LZV9tIIv4s0nWLqpPe39Qbre+ybm6SmMis1vA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1a::731
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1a::731;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 9 +++++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..94a0276833 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -880,11 +880,14 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  * Ensures permissions on bitmaps are reasonable; use for public API.
  *
  * @backup: If provided, make a copy of dest here prior to merge.
+ *
+ * Returns true on success, false on failure. In case of failure bitmaps are
+ * untouched.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -912,6 +915,8 @@ out:
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.31.1


