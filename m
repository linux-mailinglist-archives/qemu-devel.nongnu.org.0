Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782E3F9EB8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:25:09 +0200 (CEST)
Received: from localhost ([::1]:33128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgXM-00024M-Ey
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR2-0000uN-KM; Fri, 27 Aug 2021 14:18:36 -0400
Received: from mail-eopbgr150114.outbound.protection.outlook.com
 ([40.107.15.114]:15647 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR1-0006Rv-3S; Fri, 27 Aug 2021 14:18:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br/WiBHfwQcwcapGOnDTVH92WlqF+oLIRBlIfG/9NBw8NimMWxtpsbXpW3ddJ1smw6ikzmruxeqR//48/dWXmtVZkMxCJNJicW33vN0HSYE1r7HrFI0Z/soCcprhFzF4wgq5b0j7pJk+TpUUFQ6FpPeCuPEcOKe1mSzOxaoYlKSgqthDWAgf0miSDv4KND64vKuUmYWz4i5TOGDE7XOgLcRgKnAQ3KkrTAjeZTGPw8aaTSi8PFrmrEnvIouZRw2N5EisjK7d74Vi+NDbf5y985vA3mhywSe0k0+Ot6vV9/8xL5wlBl7attxDmXXQlghiE21pRHI65TvErcGCtduURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8jIK8WJ1Yy7NCcFvveIlYBvCvwBraFlnEj3KEFBOwI=;
 b=AU7ukyGhEOuuMxQlltdaHLxA4/2bUFVqxnsUO7z7Fq27wigXgVnMrrDQulp4MdxlQ4hDm+VamMGwYJzUt+gglCm1efhL1p+9KVtq08hUEc8hs4fIBcM76ckpwQEhfE2410GjhAuSYZKCsoelv6fsoXSKnXqC281E098msVuFFR+/K133fXPLVi7N7muiRA2RZFh/nOIy15DbCT7Rm/1cETGsX8G8bty6bfCP9SAqu7mP1w0g7ZDxNCxBsq8cdDNF1bVMERrhfX8GEaZqNe4EXNPZFgIczfaZyTZ+SHzrAEMwTYcQs7e/rj7sBF4SzY5UcqvAE4AXYh9bOYGOQSC9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8jIK8WJ1Yy7NCcFvveIlYBvCvwBraFlnEj3KEFBOwI=;
 b=Nw4Dyw46dbfCnddu0EECOWI9nhKYmqjegwIqPp00dFN5OkyQq6P4lRXyEx60PZsxk24fEArOGEqFDzO2814lcQDmBO/9tDly63Ls+GW4Yt8k3IM6rw+Pp7Y72nkMbw5hd3dME2Hi0vNRjLYqRZBZf26IlNYiwvNMZ4FpqTXo3jg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6870.eurprd08.prod.outlook.com (2603:10a6:20b:39a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Fri, 27 Aug
 2021 18:18:26 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 02/19] block/dirty-bitmap: bdrv_merge_dirty_bitmap(): add
 return value
Date: Fri, 27 Aug 2021 21:17:51 +0300
Message-Id: <20210827181808.311670-3-vsementsov@virtuozzo.com>
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
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7b9c49a-a0d8-4ebc-ce20-08d96987106c
X-MS-TrafficTypeDiagnostic: AS8PR08MB6870:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6870FA4AF9F84AA2BD7D9142C1C89@AS8PR08MB6870.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4V4Cr3diTR+njrld82yhYM9LVcBYgfnhGFDL7keorSSAiVrx1TFP6iLQZnXA3NTgA+6H4cwXGxB764adh5sfPXqQ+Ssz9YWIB9jylUsuFlsZ3/BiCT3Vji3VFAuOkK8phmz5UlD5mswAfVwq+t8cHgRiA4E8jDocvov7uUVr6aJjlN89M2m+mCqONbEK8xoyryXTOJVPBBcbfWG8VHkZnrkde9/p9kzB2wys9RDLc2Tn6r9v+jfYnLDLv/1Su4O0Tgaz+ZN39ZvaorrHfrvzf6JP3jSdN2ZF9Q6fMIB9E9fFDd1ba8avyYfHA/GZkfazwx59Pe5DlTI6tGLbYFKNlLu78LE1UWAhYSWklzdPk+FW8wuOuwkzk2jDm6MTLGinOPr2EBP6vI7XvghEyhXlaBVf07slJGUuMcS/7WRn6ZeNRlUO5pMqO+WaIIJPYuNH+BzxR5Oyy0h8i2TRtJjCR23rhE0ZTgD9BIwjz6BzPP2SlnDeP1lA9sKfVQqu27+qDqC8MjqEyXOot3WG7IiValmJlqLhnjaEodp1ZfMF9SS+QUUm6JlJUHu5M/MyMu9/h3C6bj1duUJ24TtIza8WlBFDeU7g4CAyOGU0wtt2hjSmxFqrl9nudA9l3gU89EvLuvT5lq4BYVC3oWbsX0inaUSQLMxaj6fOz+jt1YXQNueFKH/ljX3L7ehQDQy1UQebCxBGH73F+fCtk97X2o7kEis9PUJN6wNlac4oEVef1o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39840400004)(956004)(5660300002)(36756003)(8936002)(38350700002)(4326008)(6666004)(52116002)(8676002)(83380400001)(6916009)(66946007)(6512007)(6486002)(26005)(86362001)(66556008)(66476007)(186003)(2616005)(2906002)(316002)(1076003)(6506007)(478600001)(38100700002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f0HF8RUMi2b/qSrQiUVui2tlz8hcTudh78Sjyyk0tEDXmRmXKPEbFWuKAx1H?=
 =?us-ascii?Q?xcaDfBzfWWu7aZ/mXZLgcHOPHfDw8BXw7b7c0G/Kb2wHyniQvafeayyvbV3j?=
 =?us-ascii?Q?LPezByxXwotYuneHDmi8GwMrBjqxoQA1938KKbpnijvvEIJJzNGK+mlP6tF6?=
 =?us-ascii?Q?eEGiNgNxABSBGbozOFUzAc4I9qVcRZzGfpI7EYIpsJYWRWNP4fWHQl+VCKRU?=
 =?us-ascii?Q?UP6p5RdNx39jR3JMWPn5RocdrTWf35pVTORSwY1RXHqyzQKjZzsEqU3j73Ue?=
 =?us-ascii?Q?aCGp9DjdOCm+FAblvjLPjID660MXNBoI95n61hqN24RbNwcD4NdcXG4mrOFh?=
 =?us-ascii?Q?xRuYTHqrn9o7BgPVlIJFPhntOR2Q0crUir/AA6yrfuyNApZewuqWeoINY2uW?=
 =?us-ascii?Q?mcE26Wo2vAde+GGGdSDcmk3UTi22NW+8qNX4q2XnOyIKzEkhD5v13NB4pxs8?=
 =?us-ascii?Q?rnbjvysGA5riS9h25pDaP9WpBggmmTifccFt/PK13qklUOLXTc+8hrlDUbKE?=
 =?us-ascii?Q?/0XFU6ueGQUVjY3COiRWJchKh9Nj1XY9FvOsYzbcNMiWdRVFbSXTEFJpE4hs?=
 =?us-ascii?Q?IQ2QXJaokF9vsMDfn01Tm8+FA6glKViMsqZJUsqLqHiToCv53fTDVnnt3tWO?=
 =?us-ascii?Q?nmsSWq+DGPZaOlk7buLKfBvF4o05KX2lDLRKP+WHDSj/3R7Z/rBZsj5cDw7k?=
 =?us-ascii?Q?Tfj42B2NFzV7dUkyl6EkJuuA663u9VktLxtmjDeBq7FHKhHhFSUVejOrWvkh?=
 =?us-ascii?Q?Y2/gKRJ95WbLpm30E09ih+YRfOQHDD5fSoyzblQQiAKiBFlFGi9Kew8ZmFcb?=
 =?us-ascii?Q?YPJku43qzj4cdNMjHU8EmipiMB14S6epum5eiS+twNB9HTwsl8GifoVx25ay?=
 =?us-ascii?Q?CtGi108pAReOy01KNOEt4HMGJkCgTzCZNmV1ZM9HEBGT1qbXS8fgs9xQrt2p?=
 =?us-ascii?Q?qouPkSco2YL89xEfuv4SKPHcqbYnUSlaSoo9RuKyVbBVCy8MYFYJ+ijbXHKi?=
 =?us-ascii?Q?Id59mfmG67+pzCtNi3iDX1+x5VhoeIrGxnyRZU4GsDjOM4g3CkyK2Ukhk1K7?=
 =?us-ascii?Q?A/CuSFNFBFcvulH1bz6qTXJkF6o8bd+y1uPOlTWRpASqwPLKXzfNKdzLwNJM?=
 =?us-ascii?Q?GdSQl5usFlBXoI7Jofayg0LsiwQgExcwZ2vOvVnSP/yl1f1u8BBIHYha+/En?=
 =?us-ascii?Q?WTYQi/LthrcYzj2/P1lDM5PK6mQXy6vkistKqvUDR4XqwN118jG8l0caxVee?=
 =?us-ascii?Q?IuO0Y+hMbA63XyB7jTmeNRiT00PNbDlQk1r1W7Xt/yAmGTgQdNbzpSvgPAjw?=
 =?us-ascii?Q?gBfFpqs3E6DLrxWTYCHHyYdP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b9c49a-a0d8-4ebc-ce20-08d96987106c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:26.7808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W2rGzATMkS2jwN6JtwDhV9FUGIblBOayfN9CRee3nTgZ+J5Tvs/9k2q1RQ5ecBcgI50LP5Z68IyO7Z7poWEhGLNh7/s++MMi9L2Juo4JR7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6870
Received-SPF: pass client-ip=40.107.15.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

That simplifies handling failure in existing code and in further new
usage of bdrv_merge_dirty_bitmap().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
2.29.2


