Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCBE3E01EE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:28:32 +0200 (CEST)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGwh-0007o9-5H
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmo-0002Jj-Rd; Wed, 04 Aug 2021 09:18:18 -0400
Received: from mail-eopbgr50129.outbound.protection.outlook.com
 ([40.107.5.129]:62785 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmm-0005RX-VF; Wed, 04 Aug 2021 09:18:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFEqGw5IU2PcM4a6hSqZB523wqyIWZBsNS3IpvYL5rqZf2deiUw/bMjn9UNiIcuKHerCk3QLAQjuFxoOnPcN2JkvwVXR06pux4lJ3d2vqBM/kAZheY3QPRc4BcZCzzirFq0I133gCmoYxZYtPRcyefbUjN09cyUtNDOIoK8JImnCo+E9I5cE9puku+wqpgvMNJi8oG11dNj2bNXL1MieT38YrqgYzc5Bk0tIJAJuAq0KsE9rpWaZSoI6+6gMYtG0/AbrAVPHpF0wiHz2k5iDbNVyrrGFXb9OYNLpeXA92dL0Ea/f9+2M3uBDj19OLEULZxJLnrBfIR4ZKSH7CozIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9sqjU3hEUi6JXHW+mmYMijrrFI8+6mtkRMLCf2Zzsw=;
 b=AgweWYt6EVLiOZ7rw4p5ymKEuWdgZJ8XTmnznxn04gdt31LHkyzR2o0TE2kD84Nmhz4e0rK9RP4/wsaggABCac3CprzmqkKrfYWLyQXE6lHv7iNdgph4wpdI77vy8I2sxGO6zTHcdnZKxz3M2REiF1cpQi5AZ8WHhV3aeJke45wbMnyJs/u1qVqOb51k8UEZHW4w/Rt/7iTMLVikNl0slwpsS2rfiN01ECHAKPsPKlg3aPTjdDuZipZKyvrH1uK8pvCx6wGHImJI2P5RW8evesaBCxOfJku+Hig6Xnhg+YKCEl4BF28Jl1bvEeVK2rK0nVFenjiHFBbJtRs5UTvyQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9sqjU3hEUi6JXHW+mmYMijrrFI8+6mtkRMLCf2Zzsw=;
 b=HcDdOrhtgSY2/LLYxDYClnTQ47Cr37Vzd8gCNhP3ntv/UUgqPOD+gH8eou43a2hiaahUi/C5GPTO/FLPILklpOndY3Yh/6mNmRmEGwon/Gc3FBKtVaU9UrmVrZ3wuyjZ/HEv7NgT+J4y+nfyqeFjNOHg1hUg0ROXrkc4cA6hF/c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4023.eurprd08.prod.outlook.com (2603:10a6:20b:a6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 4 Aug
 2021 13:18:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 07/11] block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()
Date: Wed,  4 Aug 2021 16:17:46 +0300
Message-Id: <20210804131750.127574-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b5b0e95-8c05-46a6-183e-08d9574a4f01
X-MS-TrafficTypeDiagnostic: AM6PR08MB4023:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB40238E233C043F8057B12B75C1F19@AM6PR08MB4023.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I53hd++MQRQ68sbzWKEeXKZU/Q9Msv6VoImgvV9X/m5k8LlHLpfGjMhkLJBj0ctMika95JoUCwHB6GEELAgKjxcVSLEV6SZFXnPScidEC3bv7t2VFfQqKGS5i06Lw5AyBC0t/O2VUGpnErvRI6u65+WrqINbFY84RVXf5lKA92/SoKtjtnMuygOXEFBRlaSLl6QEwS4tJpMHTSiAc5eYlQkeLGSPy36ytXCHbw20MKxST3baevil6dwq8dU65Nb5EVGF+IpqP9oViPVRuafHdu/Giupr3UY3zqDQ/KTnQdUaVti/PSrCYdD6ctISqz6Z37agAF9iwnjQWFEEJ7q74OUnhwMQ3BQ5pwkuF3Pnkmp7w7YJYr4vqKoVmWo/1yqRRnbndG/KkbolQAq2xmQwx/NSX+60yQCtQowebw5NMjI9U/zg91vMZTNYP48J6TJmMFHz4r7rhSguu+RtYFcLRCZIt7TTKVvm+DXFR4whpYwLOufyqUiKIVUD3OPfUvGs5p2fWMDrXYXDnJJZBF9H9jcywR4qulvO30E2h3AeNyMeOjziI+4tCASn1dccBxKXFoNtGeD4FWaiJ8+UFnlAdWojV5MTF/6zyvdIkMurREYjnqpv0T8/nKRTI4qBQ6kgkyjT2oFI97JHAy8pWkz2mbovKwYBclhwsb9IdtVV8nbU7DzniQf7HTZvy++YBoyCkbXHi8GnFmvPrncSCbowS8GW3YICaef/tqH+wPjO3cU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39830400003)(8936002)(38100700002)(6666004)(186003)(38350700002)(6506007)(478600001)(26005)(86362001)(1076003)(6916009)(83380400001)(8676002)(5660300002)(316002)(6486002)(6512007)(66556008)(66946007)(4326008)(66476007)(52116002)(956004)(2616005)(2906002)(36756003)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bI2UjLJCWZuZZXiN58mzdnvXZYJgMVfb0I7ssAjBF9XqCE+XMz5Uz2W/s9jt?=
 =?us-ascii?Q?xGwqvQojVaelwgu2vRc5NlidB1lBFQ/vNMhJcDU52ODGIHHAbQAD/Gm95RvD?=
 =?us-ascii?Q?PjYF1iYXWff+xdUD3HU76+bwjj5JYqAd2jATwhAdkI14g71VCyqmp8rmsvoK?=
 =?us-ascii?Q?G8LQK+5k1D2Farfkquc+O4zgjUPi7crzwW4PGNTCji2QNykHw82cVqmpc3LN?=
 =?us-ascii?Q?VBlLdYRhlBqLeMz+iUnekGe9NGbUIInoyDFoiIj2u1xzON2sx8wRMIx7llMf?=
 =?us-ascii?Q?bx9cLJuArWfsd5IJlAqHPgwZDxXiM1mpO8PGMvXYLRqdLVaUE176a2wwIutr?=
 =?us-ascii?Q?92KUGBjwVaz/pxZ0wR9bI+rXR+oLt5HBvYmFGF+tNWFaRo+M7ozNnhvE3Rbg?=
 =?us-ascii?Q?rYmUYOKcGc1KZVE7V3cVi+NxtBv523MGPaIiRmzgQb70dd5BmcexQQTc243a?=
 =?us-ascii?Q?Ci4bvLcuukO1rTVZhiamNqQrDCGCMSro/Y1+4/R5OIy9eF7iXd6mMaShYRw1?=
 =?us-ascii?Q?b0S/ldOiGdFTAri1zCEZhPE2VBpTbsaegpvBPsWKg4QdreHjpWd6tL3vsKiw?=
 =?us-ascii?Q?moMMU+VtwD2F1eKR0sB2KMBBLbZEjvJkEvh6nGs5UTVYSYDW12Mpnp7MaQlS?=
 =?us-ascii?Q?kgGZzlzIqFIv5OnF1OEhLE9YWQchRtNt2ZhbkzUfyfs2O8mCBj42AGG1LJcH?=
 =?us-ascii?Q?J/nYlQlDsTF3vOELXFk3hpAf09cD0dccsw91a2FbMSV+ZDx5qfEHX1fPjMb/?=
 =?us-ascii?Q?MlFRjwnyoCT/0J2GapHqkz9ooXJApkpo7LYRqDJLHeiV4oUQ534fs4xcS6A5?=
 =?us-ascii?Q?SN2q+UI+/08o0T2QXL3zQjtCvneB2FQIOYA6SKm/qivrQGri/YAd8yBCNWbh?=
 =?us-ascii?Q?ocp4oKQzmwEpvLuDAhFdJqBrHNfdLWCC/snBSshw1LVopHd1Q5iNOT12YkIE?=
 =?us-ascii?Q?WvA0DZXUzle6aEV3WnOrNFAgqC4PxH9nKy/YRLaSI9qaWQe92kogToucYTv9?=
 =?us-ascii?Q?R/p7sIOdBVX00Sth9+FIBWKn+eMA6B5TdZ9pkvsiLEyR9i2ZnpsZFXw2idi1?=
 =?us-ascii?Q?338HiF3r6XV9BD9l041+gJ9ppXnLwhJimPUZpAfuHZvODZKjnfHZ+XfR75Cv?=
 =?us-ascii?Q?IstbvFl/TQMxDVZqegSJJn0wgaMKqfocIa0Gr+YfWQ33nv3XE6kR0pIQuNMP?=
 =?us-ascii?Q?lAH/fC3fCyvMXZ2RNdwQKs9hqR8aug3rhAUwd65EdyRKCCUJ1tjtNyNSmEFK?=
 =?us-ascii?Q?5yEJlgxtk/MOQ9Flv+JVOG7qVoBFQuLji9B+u9mpKzhPgYwRbzDIOIGFaAxR?=
 =?us-ascii?Q?MudiQ5Rj7a2TpSXRQJWMNL7N?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5b0e95-8c05-46a6-183e-08d9574a4f01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:11.6205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRkzs/DH3sr4vAE9vMdMBK1kbSsjtk+/9rqN1izv3XdN93BefauOZ7vzuucd4xt5uIslL52EBUF5C6EfvK3CCKaOC0+jhYVGEMDFgmvDh24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4023
Received-SPF: pass client-ip=40.107.5.129;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
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
index 8f8b428baa..ecbd6703dc 100644
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
index 305b894a63..91956263ef 100644
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
+        *pnum = next_zero - start;
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


