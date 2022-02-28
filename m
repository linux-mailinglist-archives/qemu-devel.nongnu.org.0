Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B424C6B55
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:53:17 +0100 (CET)
Received: from localhost ([::1]:56432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeaa-0002YH-VI
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:53:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNm-0002Eq-99; Mon, 28 Feb 2022 06:40:02 -0500
Received: from [2a01:111:f400:fe02::714] (port=28447
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nOeNk-0002NC-JB; Mon, 28 Feb 2022 06:40:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IsgLPV7rhnXwXAGO3rrRqIAtboJylEcQBaE0ZLt0Xi9ot94KzmeZlltuqi2zhyVqEzoEkalvWlYYAF8Q1N8TN4VvjZiKfxRyNuRXl2DGTSK6uWwGMIzKXNDoinGszA5GR79yMxKYW3IpgQVGSvX0BIdFoM45b6n76i4ETStmTz/KrQkdog8rDxT0+v46ZIT/ZYTwYIMiI8IbgiFgb0r8zKtZShRqRaI2j5s2k6NdGY8iBrENboJfRUPD6wcKHC38JfmYk7Msr0KjWdyKGLC2DbdnGlB92udnefBDmf+3q7kkpfngJQQbKgTc9PZwJJlDUmkRVyODKKOhMqzrMVodCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwcI7D71CBJ848rjRlKBiBn8VxIYRQiF2qTE9/or4IU=;
 b=JULzdapytfomco5L3KLyXLgFPyLTb96HBcngzt+qbsVlJjC3+EWNaRJ50jNwg4kJpPWD7Tyy+MD8QOhwz9+fjGaAGYxDID0zy7h6pqr8lglWgr4alXYvXx5xu4IFdzvL2kb7C7T/ydcH9b8s5srtOMPQIvnJKN4vaZW83dIF/2RVJwo9/iBcpx/mkkr0/g2zTuyKc4EV6zmgwDj3aP+JqVv6LqCI7f1uUd26r0n2U3D9U8AMepZqC4xFit8p9Z3fDLZdtBe1y0KYf0eHNPxSZU6NrTks2VGhgJeMjTawBdIkjkGOXb9mSZZukYfaLvyNKNIbN0iAS7WPZkBPdFnpJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwcI7D71CBJ848rjRlKBiBn8VxIYRQiF2qTE9/or4IU=;
 b=k80KU00FXtXtAyxKejH37abjy8iey96xKi21wAwqXug9/IojrTF8x4OLxSN6H5377RPB/0lnHGAx1y1wDeqFHCImgZw7aB7jsrmYkIykl34HLAQcjus+iBZzlxWCULhExXSxU9AvdajMwcqei5VmiWjPcIXDRXaj5cIqJH3BbMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2272.eurprd08.prod.outlook.com (2603:10a6:800:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 11:39:51 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 11:39:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v5 08/16] block/dirty-bitmap: introduce
 bdrv_dirty_bitmap_status()
Date: Mon, 28 Feb 2022 12:39:19 +0100
Message-Id: <20220228113927.1852146-9-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 095d741e-5bc4-4e2f-4d5c-08d9faaf0866
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2272:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2272136CB0A94A13AF9A44A2C1019@VI1PR0802MB2272.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +RgocFW0285UvTeHGUyEbL+pJbw6KRgNT73Y+BZxoDLAIvbaq+QkUfg8W75NwL4ZK0bBeJqkmT45GAJwlbnsyuRbA/lfX7BE1o5WHY+oyheuiXrVQ5DF43uVk2yhbyLkpNK/3489dTTNFu+JLcglEwYfiy/cCtUhLCxpzzdSYX7tGnjHb3OYdNU11SSo5VbuSRw3wHJb0YT13wGBSO4+GpjVWI6DaBSINsJNq4rt2HSm2ZdrsDLI1pb5bNZbuTIgxyrbkYs4TwlMXciUqO7qkOnO2PojtsRulToMOvH0kM7vOjneM+IgPyRrGvWmdgXrENV5+VLg9aifYpHYf6H+dGxhpJg1/ZnHGoKMSpTAY+sqA2r17KowOB80ETlcbO96vCpX/SxQkzsXZ8kfoXEJnAG5C17xnb0oERyXQDvCrWsdAsKmKglwirY6o/+H1eC6JVMVSJ1Uv6yzDi0UzZWNPkk4lzIdheadDUnolduEBJkYCqoRxnEr+Zv4cop9SwrHAOYtG0s3JaDOqptIuXZ+Mimk13OqmoAf6NY/sFWgi3KGcfP4OxPB1zZZLBPe7IgpFonD7LJbY2tVxpGpqfDpyjibfU7gzCHn0WZxb33XQDPpPJjK5gSa6vWuXSXgmTgmoeBV41cvjMWPEwZ8ViVr7UKNzmidabrbL0tHHZKXtVnVm3HkGU/HCDAtzH6i1ue7izVVaQrsD/YqWNg5/ZVFogFiOi0eGW6Cf5/yuvi6N1s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(4326008)(2906002)(66946007)(66556008)(66476007)(8676002)(86362001)(36756003)(38350700002)(38100700002)(316002)(83380400001)(1076003)(186003)(26005)(107886003)(6486002)(508600001)(6916009)(52116002)(6506007)(6512007)(6666004)(2616005)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ct+U/EziSe/eXXHkEUsvPtusyPPzmxiNSfE+uPzdpOey2RsA2rucehhtlPG0?=
 =?us-ascii?Q?t89mvdhbne17aB9vc+XN9MqWUqc944wJkuGVwgI8no9rRIfW7ec7eXl8szUG?=
 =?us-ascii?Q?GTtmOcOlo41uPTprGYBgTqZ2wEYuKLnN4CffY27LYMPqpNnFEpERkMUbVhhl?=
 =?us-ascii?Q?0shG01Ue/AScuz/aD63y1vfjfC+gE3ckj+uBmOGgmTBxTnu1UiZ9XEuYjo72?=
 =?us-ascii?Q?GhSpJD83hudlfmVCErqpgZo2mfEWWOvHDWpPy1LLaDt8yJbAPc1gr/4ATxUO?=
 =?us-ascii?Q?vFNfg1hPO4QFCDzhIJOlHm8uTr9JYX/KWEewiG+8rFSWN3ojJefWH0az5B7U?=
 =?us-ascii?Q?klvGtBeft3Efb4LiJ6aXSay9LW0tmsWx2yGHHZjhnzqC7SuIyQxTWsIQQHFv?=
 =?us-ascii?Q?dyWfsGXaY8JKX4zqdjRkLlDOO2lQg01GNCWYEyaQfnL+gAbz6+cwjPeNkGMJ?=
 =?us-ascii?Q?CZ13N5Ulmm3jvpAyRk16QFTSJ888lTHk2k+GdKJeIwz4g94SKXPu477vqha0?=
 =?us-ascii?Q?EDfbKBux5RNZpeyEZFHxbY4gY8S+RUyS7qADCc+AEmSxWfNSg4mS7BOro1CS?=
 =?us-ascii?Q?7kxK55NdOi0zwpuARdtfx+Ss1CHK4UqBSvSEbaWPxPhhubUFXQxRL0/NPUSC?=
 =?us-ascii?Q?wh2a4p5jT63iAdWBN0rPpGRv7xDM7zIabTestGPBlxjGWVKCnbaEt/crafj2?=
 =?us-ascii?Q?Ww9TYcOWrnXtgb87u4gDDrfPcQfj4EnwWdP4H/1wCk/YEYbh+Z4SXtvEcQ28?=
 =?us-ascii?Q?SrDh5u2hHqJOQrkmFPWnpIuMLsKPgAbIFNxVRCpFJPn835DgAmWnqPsj99AQ?=
 =?us-ascii?Q?Hm8vOAQeyv9Lf8/zUiLoOJhM4OGRXLvZNJ7gvSIeOEvZxzo9WeKrOQ17zYbT?=
 =?us-ascii?Q?2fuQGbtP/cdSHH8NHmzyaCJ4m7t/HMV8hxpFYpLOJ+mYXJMc9kXLZUC3R34u?=
 =?us-ascii?Q?gTUfl6RYCiijWmwUOcaGATyrBhUO1MaRhhF/iTOTl2/xk7TZaMe+2/NK3J4U?=
 =?us-ascii?Q?ifUlY4BS+ptDWK9104h6SWedgnJrw086a200ME6hNd16beiTCSwA+drwdIKh?=
 =?us-ascii?Q?RJbfZ9oIERNq4U7VOebJe46efer/N3SANyvFFb1+gehoW2MEkUfxugOPR6JM?=
 =?us-ascii?Q?uD/dsObD+r14/yf1dj8yH8iQJWJpHPYmaojIh4ONRaeTcvRTHB7FiDGNGLEk?=
 =?us-ascii?Q?4Z1BpfSsQo9yujo80NtdpfcBCPUJ6kVlyF1H8wGSu8Dj31+3wO8no/JutrqY?=
 =?us-ascii?Q?sb1RaJ5N6qiDhWO7s65EEe8a5OYZ2DcjxBm6XIX8RQdFGReT5HAz7jXBLYhR?=
 =?us-ascii?Q?pt/tSyuTvZvfUPkl9QibakRcL0gJIiSvh1ec+Z1tlA26exQW5/p8EPvMRo7P?=
 =?us-ascii?Q?2KUgc9UZMIGjcYUk9R2lNJ/FFXGpSFmqIOY80syzJBH+3l7TBlUGopTpndZv?=
 =?us-ascii?Q?+/gmri00qDBFEyQ+jJ7UcfErxsPWjnOW63W+UWkElEogBPN/QVMyqjpsYJ6q?=
 =?us-ascii?Q?kyhU+yEqz6yZcNJjAomkGMHMWYVECpfq77Cutv/n7fYt2cf6U4tgG7OcEFYi?=
 =?us-ascii?Q?VRFBTakiAQpaeqg+I960Yw/0X+Vfcft5O7vqnFl2TBNASXuB/LeXFsgKxoNA?=
 =?us-ascii?Q?wUUit7aLDCCw26MNsRTwhe1xySXglIIZ+vPlGVRc+c8Hi+I2coMRwljrebHR?=
 =?us-ascii?Q?64M2mA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095d741e-5bc4-4e2f-4d5c-08d9faaf0866
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 11:39:51.7559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKx0n1VMypi1LsOI4UbP/9/am0qJh94VERxnEnGA/L1A62+RHC1ltIabHPErxhhVS47u0vy9cPZm3jAj5N609Vd7YSrKXojfKIl3Ov2udNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2272
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe02::714
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe02::714;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add a convenient function similar with bdrv_block_status() to get
status of dirty bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/dirty-bitmap.h |  2 ++
 include/qemu/hbitmap.h       | 12 ++++++++++++
 block/dirty-bitmap.c         |  6 ++++++
 util/hbitmap.c               | 33 +++++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f95d350b70..6528336c4c 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -115,6 +115,8 @@ int64_t bdrv_dirty_bitmap_next_zero(BdrvDirtyBitmap *bitmap, int64_t offset,
 bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
         int64_t start, int64_t end, int64_t max_dirty_count,
         int64_t *dirty_start, int64_t *dirty_count);
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count);
 BdrvDirtyBitmap *bdrv_reclaim_dirty_bitmap_locked(BdrvDirtyBitmap *bitmap,
                                                   Error **errp);
 
diff --git a/include/qemu/hbitmap.h b/include/qemu/hbitmap.h
index 5e71b6d6f7..5bd986aa44 100644
--- a/include/qemu/hbitmap.h
+++ b/include/qemu/hbitmap.h
@@ -340,6 +340,18 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
                              int64_t max_dirty_count,
                              int64_t *dirty_start, int64_t *dirty_count);
 
+/*
+ * bdrv_dirty_bitmap_status:
+ * @hb: The HBitmap to operate on
+ * @start: The bit to start from
+ * @count: Number of bits to proceed
+ * @pnum: Out-parameter. How many bits has same value starting from @start
+ *
+ * Returns true if bitmap is dirty at @start, false otherwise.
+ */
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum);
+
 /**
  * hbitmap_iter_next:
  * @hbi: HBitmapIter to operate on.
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 94a0276833..08d56845ad 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -875,6 +875,12 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
                                    dirty_start, dirty_count);
 }
 
+bool bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap, int64_t offset,
+                              int64_t bytes, int64_t *count)
+{
+    return hbitmap_status(bitmap->bitmap, offset, bytes, count);
+}
+
 /**
  * bdrv_merge_dirty_bitmap: merge src into dest.
  * Ensures permissions on bitmaps are reasonable; use for public API.
diff --git a/util/hbitmap.c b/util/hbitmap.c
index 305b894a63..dd0501d9a7 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -301,6 +301,39 @@ bool hbitmap_next_dirty_area(const HBitmap *hb, int64_t start, int64_t end,
     return true;
 }
 
+bool hbitmap_status(const HBitmap *hb, int64_t start, int64_t count,
+                    int64_t *pnum)
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
+        return false;
+    }
+
+    if (next_dirty > start) {
+        *pnum = next_dirty - start;
+        return false;
+    }
+
+    assert(next_dirty == start);
+
+    next_zero = hbitmap_next_zero(hb, start, count);
+    if (next_zero == -1) {
+        *pnum = count;
+        return true;
+    }
+
+    assert(next_zero > start);
+    *pnum = next_zero - start;
+    return false;
+}
+
 bool hbitmap_empty(const HBitmap *hb)
 {
     return hb->count == 0;
-- 
2.31.1


