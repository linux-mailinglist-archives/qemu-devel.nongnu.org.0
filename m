Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF03F9EB9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:25:11 +0200 (CEST)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgXJ-0001w1-Sj
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR8-00017h-Py; Fri, 27 Aug 2021 14:18:45 -0400
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:12641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR7-0006Un-94; Fri, 27 Aug 2021 14:18:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ne77vVWV8BMtaRYwjgNgZkS7sP3Yg8h0Yae0wrBhaTYM680mkvyopExxo/EMmg4ofoE7tIDfYeTA3UZ2ZEJZEB606lbP0QxTkBSEAQWQ+1NJJch3Wi5Lfc4YffJMuhzIqukj2Ibgxs4eoOXpktSZ8mHy7l30ewfSqzp2/qNZO9JGVDa3Eac5fo7k0K0bWslnm1vxRRKEQBWFJXfCyhcfwLTBBaC6NVYrJRj9Vh1pI0lJtElUH2xL1yC5KAyUCeXVMVjWm+p/aaN5m/VpeMbj8zZaSOMxZ6E5o93Mok6WGxjPalNBqApvJsY34CqR++jNT1O9kjNXD3fdasnT3oX3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ755RN4B88us0Z35oknYvrIcdk7clEi9p4Po8f+mAo=;
 b=PeBZ6u7O42oQAEi6S5jyoMSqND771kjs1EYsZhYgnAtCR3EGmRa3RZJzeiZKneHrjVlNOC3I1VH7QA+X3drDM5+hn+g60HPbpc4JHylh31x95RakKD1vHJbOd/BdaV9UMyQhVMS9CE3Vb6FJuhhxI06MBvdmjVbt7HRC3/oz2SGLKh3LXFOKuvvp4vzNg/MIpDHwEzCs7fZFS51ZmB6ulrJsf54LndD2RWKFzhvzq7hRfCJL35Mo5On+EJPW1rWuchIQ24aBYYnNyP5tX48GHDYnhqDpCXS5r2R447PPo9PizM1DF1C7bac2rfRjZ3Iz8LTWmjy2bsQM3F88PGO7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ755RN4B88us0Z35oknYvrIcdk7clEi9p4Po8f+mAo=;
 b=EBzhvFeH5bdanM+Eqm6CGtDeYS2MRG9q2NI6/CxQ7m+r/gD3nTT71RDQnZwiVrOunxFLDqexc6mKKPQXWrNghm3ZZoVy1TTBgQPLHWKGzrFygtnSrrOdqr6iR4+4dMd6B3CAE7lb4/q5CBj0Ojznkx/xKOfymiH/tn7NUFhP7R8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 07/19] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Date: Fri, 27 Aug 2021 21:17:56 +0300
Message-Id: <20210827181808.311670-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bdd46f94-a260-489f-7266-08d969871405
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765EB51171CFF4324EE2528C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M1Mn1vZyUgtxxFJbmkFMBSzPySVVc7Slw4RPcbCrWUd/3+Q9+8qNdhB97QkVY8LrHmBw+eQyx6zq5EYbRKC/h6B9F6nz2aIoFM/ZFQmWOE8fy4ydybasbBqxPCfUK2gTbGXac+gFf55VWgz6S8mNcuZ1bl7r4cMFv57uRllTOT8vMChfWVaFmhL1uIgKU6GuxG6kZpGJkaLtSYILw5Rip0cl32wxP2800aV+tPdiBsXLsVggTReCxbAflryCuek7XUPuoWcz20CIfLqTseIblUMj+MwWm9v/wgfNomGh1soTo+MMYL98p6QO1zbHWjbZuWsgNQKFwomewcqAOj5iLFcf4h2oRJgByOBf9pUO4MGPT2Op7jNPrkKhjZoihO8PxnjpEXIPPFIegOL6NSL97lvPke1kbJejf0PprW5zjmMGZ38wPaVE0spV2ZL2wwESsaPL+OwvHPHj4H4qqqcfOzmvqKSqH2/a2hxkKQHWmc2dtWuVt6+NhEGu4lxlaKd2dtBGrDS6/sOlITezp8UrDWBzUv76dFYbnk4fSAGgfVyXl/wlYq9+s0PteMrACtUYVYW7YoXMD4M3KVgeClueEo//b+bNNRb2eyR1vDBvy6ZHvQNWcnOWUROaS4w4+iLm9bwhPFbMr8IyB2ifEnn4Q8jaMa7zA8dkB+WkfD5cRkQQwDTR6OIAQnYt36WXyq6Z3cqsP/ZEuKLYDeT+Bn/iuwvaknN/h21nq/rI04DpoSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4eiQ30fEc7TT0OJgkecBgeCHSNKHZGyLJUuPlb0M9h5lrJbPGBoT9UkBx9kx?=
 =?us-ascii?Q?SVQW2dRZdZa/qIh/9NTMPYGK1KebthwTLiWMhrA6QJzjwbFcR9OfxiP5FbAm?=
 =?us-ascii?Q?+kzQP4FTUpMGMkpQ2wkW2Uwf8n9tWdH/b2C9kS77/2vdXjUmLs/KguZUsp4P?=
 =?us-ascii?Q?K4Gjun8Iv0oPeJ/Mt8X36c7ydAZEnS6Td7bqhZGK5Fw6s+huq9l9Jw4pdFhX?=
 =?us-ascii?Q?Yv8UR4RPMtVUDmyfcHC/GAABJcB/VFOi9cI2Y+/e5wWDjj7C9At0bME2ycpG?=
 =?us-ascii?Q?7qoupmWQ8vVpb6E8z3CItFQVbPBbY38jHLwAtFaA9RkRxyVdXCfDTmr0oNPW?=
 =?us-ascii?Q?KCOIkY0tuCCCmVPk35QW4w0faik0DsyX+cq2/sA6vItEU6Qln5MOw9+vvtax?=
 =?us-ascii?Q?5D3xddyPim3DB4Ape/eF14qxgI69Z8IS1di+nK/fUYNVsYL/ubBKhIH6LRsT?=
 =?us-ascii?Q?OpiNZJLig3rX6vv2TFDlcg8zP6BgWaORgPs1SfiOZkd9OpvE7ysDm+xAA9D1?=
 =?us-ascii?Q?YsyRPGFj4mFKdCu9E/BKx1T0akh1NiwszjNsAe/gWh2jE7lt4KTtnkCo+1bp?=
 =?us-ascii?Q?ov6MRlXbTqh2zeHDB9eu0nQ9OX28srrMM0QkuxtY4TKojut/1Bj9NPj+gSO1?=
 =?us-ascii?Q?Lzpyipa82yhqLvt/MFUeOLn9RtQ+NmAM/WmuF6qP4QiuJxQluAtRJ9rIarKA?=
 =?us-ascii?Q?fTYzTCnBiGPfjt88MCv9HFJUiSWAC11VpFnmx4OrA8rMSf0bIyYHIqWyP1Ly?=
 =?us-ascii?Q?U4EaHQUB44bTbssITrXONGlC44d3snTM06hsQJe5TdXzc7dXalBnvQ3tl4Xr?=
 =?us-ascii?Q?kViZpGF38v1fxJDy/tvVpeYt99FAd0kaq7gNBZOSft/cSJxTWH3bhpr8wdhj?=
 =?us-ascii?Q?sMb8aHuIrou+IdQ/dSTOFJGpYL0KRxo/aptte08wAzAFyuSXNNaoJY0NE8FE?=
 =?us-ascii?Q?8N1bDezqdr/x+z4c40xaaaYadMIRVBByCUTmjBCTFnTUvW3rv8Gv94fNFgYr?=
 =?us-ascii?Q?/+GzNdarmjSIWlkCoSOYi7t2LFt7J6tgbZEd7IzeCyLYkT6zm3Oq4bNtF30o?=
 =?us-ascii?Q?iBsUg34HtEAa7ZNqh9t54HxI4w0E6pLSy34XW/dmxxkaMKy/Iekytlb40Cvw?=
 =?us-ascii?Q?90Ip/N5WHBtSYSDoX/pzRHlmt/jg61046vVt1wDPzaHRbEMuljdbCyczPVAI?=
 =?us-ascii?Q?BaVjEztLuR5zQwGYZHnNJDpEt342iBS7hecwQks97uliD0tpRjmV3vWOTn89?=
 =?us-ascii?Q?PuusNQaerOxuY1jCxpWCiMf1WtLYXJuBdNnC+nx0Tl5v/RFNTph3vUyMeZA6?=
 =?us-ascii?Q?ymsReCfFTgekRyBYcH6e0ucj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd46f94-a260-489f-7266-08d969871405
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:32.8153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XCLxRx455g49L+pS6QlIgEVttt7cq5+4U+VrPYkbRDJp02CkHt39XlCRTSE38VrUC7AL7nHcZ7MbLU40FfTsWoBZI913iLa1pDzeGekg8GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add a convenient function similar with bdrv_block_status() to get
status of dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 11 +++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 36 ++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..2ae7dc3d1d 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..845fda12db 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,17 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: the offset to start from
+ * @end: end of requested area
+ * @is_dirty: is bitmap dirty at @offset
+ * @pnum: how many bits has same value starting from @offset
+ */
+void hbitmap_status(const HBitmap *hb, int64_t offset, int64_t bytes,
+                    bool *is_dirty, int64_t *pnum);
+
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..e4a836749a 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+void bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, bool *is_dirty, int64_t *count)
+{
+    hbitmap_status(bitmap->bitmap, offset, bytes, is_dirty, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..ae8d0eb4d2 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,42 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+void hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    bool *is_dirty, int64_t *pnum)
+{
+    int64_t next_dirty, next_zero;
+
+    assert(start >= 0);
+    assert(count > 0);
+    assert(start + count <= hb->orig_size);
+
+    next_dirty = hbitmap_next_dirty(hb, start, count);
+    if (next_dirty == -1) {
+        *pnum = count;
+        *is_dirty = false;
+        return;
+    }
+
+    if (next_dirty > start) {
+        *pnum = next_dirty - start;
+        *is_dirty = false;
+        return;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        *is_dirty = true;
+        return;
+    }
+
+    assert(next_zero > start);
+    *pnum = next_zero - start;
+    *is_dirty = false;
+}
+
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb->count == 0;
-- 
2.29.2


