Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCB02D7F6D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:33:02 +0100 (CET)
Received: from localhost ([::1]:53398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoA1-0006DR-E3
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLM-0006yX-AO; Fri, 11 Dec 2020 13:40:40 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21414 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnLA-0008BO-KU; Fri, 11 Dec 2020 13:40:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeR6FV1HidLlvBamJvfVcdRG3vmQJIZBVej25Y/fchUbXvSFYhQI1bMxghaG10BsaTAKXxg7VR9sA5fBgn5gxZg2Jk4oO1Esmo2dU+zocx+H6nlsQ6wuRa09rNd8WCB+xUSy9MsKCd5gvddLVrzpxb7y5j/x+TAXaemN2/hryzw963gCUMy7IpUaGz+e1pMRi80NmuKGuNgOrTo9yWmS625kM2shS+qgRwaGaGLId6TuNDHO0I6Dtnx9L+Kh7GkVCrwULtiC7iDmcvWKas0MugZ5kgn4eMARcfDI0znVEcv3VJ9jJ4swGEaOKndMjkNyF2FtPeilIz+CslxlVAAuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyqUQlb5+yxhrfQiiyPdKzGzL8y5/JkBIoKXvZ6E+L4=;
 b=VmqR3IwKUBb8EM7e4I2TJMNjW8ojZpdwzJr2+KUTQQ2Fh1vIUOWAHvaC/pCXyPc/B9tx0GZfkK+7iQLSU3Ww6J4MUnWAlSfAQshXXhZfa105oE3WSfLT9bDZCW8cJifXULiq/FHblMpf5JgbdJU+EAAzl9/sX7ax27GWgro3mJj4n8TRBBhR9hCDLjrEbv9sAZgtHVaw9Hd9bqFiTYmRvoMVHFt+VZfjPa4ZdJ2DVq5PzVLjgnzOu+RgkDUS8lnJqCvlLnowH1E8FF3pDZH9Rv6TItgG+i/z5zcqAfU7PRvAoRebRXXnE4mLKL3Mr6PsmydWStjkW3cBwfwS+yvvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyqUQlb5+yxhrfQiiyPdKzGzL8y5/JkBIoKXvZ6E+L4=;
 b=u3Y7AXV6PjWFrWoHcdPY6L4GydW22GDcehOtRlgeSUyu14sVS/AbBbhZqlFHzGQOdabFhz5q+SOdxp9E334ep3M24FocaB3K7h1TFkfWVIUxu5CJPjWV3/0Nb6FXdLNd3emClJeCpw7W/YhBKa++sclkJTkAkXBsJZ08JOAqx1w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 12/16] block/io: support int64_t bytes in
 bdrv_co_do_copy_on_readv()
Date: Fri, 11 Dec 2020 21:39:30 +0300
Message-Id: <20201211183934.169161-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b001c08-d0a5-4174-dca9-08d89e0428f4
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915DFDCAE99D11426CAB792C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mC7V6IgOlyXtP0HcROYUBZ4T4NcBghFb7hKV1XIZ8i0KBDjQZ/BC1ECcdR0kUDFse88ZTbKGje1uHXZsPsxRiPV8NyQIzp+xPWjpyHTwhDJvwovAkb0MhwhUtgSYoc3zV31uF5YNschlitKNVjoqYN9giIddqiZFVq7IzY/v/0ZC9l1koOMErd0VujDW3FAOhT7+bOJ+KyBeZ/HE0msnMs5E3ZCRzpz2MFE4NjA2b4DLq+xHojMxfaoKe2KiPp8pW4kB1kxAH2dzEVum8NISUVPw1e5uaNI8wG7rjfsHZhOJVQ+7a95Y/Pmz1MywvPlh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4wDNFgSCF5CKs3lEyoyn6LI5V3ouVqnkMLMV2XXIIQO8aXkpm5Cr4P7D3xh9?=
 =?us-ascii?Q?42yLaqFg4k9E9SxvcpHTu3cVd2iudnoo7Y/ZOl/HydgVnMTlXDM6vFBz3zet?=
 =?us-ascii?Q?xKwc6tglFdh5kQtvQ2t3mkGYOSdiE7qni7aDvdo29Efg0uEh+EfAijpvU4Qd?=
 =?us-ascii?Q?C3O3aUIeMOV8gfyuE3Bbx/R2YuTGBLOaBBTpCf1lHIZiLZ1GDvNNbdRGJVAZ?=
 =?us-ascii?Q?nOUznG3sGj4zx7kdDlWlFjLIzYuBBNRLA5Fkpvkdl+25owvmmwcKDI4xevdm?=
 =?us-ascii?Q?iDs4zxgj5+8mXXoV8Wvj8YIihd4IM7W+FWPZhB+azVruTEiya5swM18+Up7s?=
 =?us-ascii?Q?uwrvXiuGOy8xIb92BuvUTIjnTsL+EwxGAoPCKuW04251imHjdCefGeN4hX9T?=
 =?us-ascii?Q?FQcJrgLFvTAKf1wedpHbWMipff5KZOVREcbhrJ/aJJWKHodOoKivIGTqPvsl?=
 =?us-ascii?Q?jW3rHPQqjPnhNNd2xAJ2V0dVQUDtR+9NzayOwqO+tV2r3B5Alyghqg9906zn?=
 =?us-ascii?Q?0DrpFY7p8gUoz60T5MkgHrwk4TDuHt5FUemlrg8MHyhrqqcO+4SfnFX0STng?=
 =?us-ascii?Q?93+yjwO1MAIuA4PfD8vONDjLcRNm9kybvOTaoOjhJtxa8RZw15N6EUvBFkXX?=
 =?us-ascii?Q?2cWItuse1ZW01TQZm6BgvJXhMxCSk+wAmYJo7cKAtZdqR9QepyUMibUFCRpB?=
 =?us-ascii?Q?oGS9nBENwKHIV+ax8uwYwrbG9z27mLztT7qFHJzYr0yVCBFY/PA0hwSFa276?=
 =?us-ascii?Q?d5Ggo45pwEbL3N9OjE1QceAM2R6OvpmYcKlHLAb45dTZoER4N6VaJZPUIAnv?=
 =?us-ascii?Q?QfOVP8DpzNZ8u/L+dPgvuqUuKfpW+apd8fq4CJZ2zxw7Zmsq+tm5+BVvRpja?=
 =?us-ascii?Q?jQPp0cZ6jWGdts5y9jrRUfibOPBPfhENFoN5xR5/AmKCwsTDJpugGPt0SkuP?=
 =?us-ascii?Q?QgXJRj0aS0A/eVZv758e2c/Nq4imuMMTDURUk8HHtmyi0WWEsImUh1s9jG7f?=
 =?us-ascii?Q?AvB3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:57.5824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b001c08-d0a5-4174-dca9-08d89e0428f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P85r/WG/HQTt2tMgZjHAMESuAj2cX2ZTdub66mB/ot+bxExPd9X0kMpSDVzC7ri+EHCaT8RvIzqPreB7sSpASWVBKZu6ZA1ALEKugUZWZUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are generally moving to int64_t for both offset and bytes parameters
on all io paths.

Main motivation is realization of 64-bit write_zeroes operation for
fast zeroing large disk chunks, up to the whole disk.

We chose signed type, to be consistent with off_t (which is signed) and
with possibility for signed return type (where negative value means
error).

So, prepare bdrv_co_do_copy_on_readv() now.

'bytes' type widening, so callers are safe. Look at the function
itself:

bytes, skip_bytes and progress become int64_t.

bdrv_round_to_clusters() is OK, cluster_bytes now may be large.
trace_bdrv_co_do_copy_on_readv() is OK

looping through cluster_bytes is still OK.

pnum is still capped to max_transfer, and to MAX_BOUNCE_BUFFER when we
are going to do COR operation. Therefor calculations in
qemu_iovec_from_buf() and bdrv_driver_preadv() should not change.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c         | 8 +++++---
 block/trace-events | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/block/io.c b/block/io.c
index b499998f54..d8c07fac56 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1289,7 +1289,7 @@ bdrv_driver_pwritev_compressed(BlockDriverState *bs, int64_t offset,
 }
 
 static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
-        int64_t offset, unsigned int bytes, QEMUIOVector *qiov,
+        int64_t offset, int64_t bytes, QEMUIOVector *qiov,
         size_t qiov_offset, int flags)
 {
     BlockDriverState *bs = child->bs;
@@ -1304,13 +1304,15 @@ static int coroutine_fn bdrv_co_do_copy_on_readv(BdrvChild *child,
     BlockDriver *drv = bs->drv;
     int64_t cluster_offset;
     int64_t cluster_bytes;
-    size_t skip_bytes;
+    int64_t skip_bytes;
     int ret;
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                     BDRV_REQUEST_MAX_BYTES);
-    unsigned int progress = 0;
+    int64_t progress = 0;
     bool skip_write;
 
+    bdrv_check_qiov_request(offset, bytes, qiov, qiov_offset, &error_abort);
+
     if (!drv) {
         return -ENOMEDIUM;
     }
diff --git a/block/trace-events b/block/trace-events
index 8368f4acb0..a5f6ffb7da 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -14,7 +14,7 @@ blk_root_detach(void *child, void *blk, void *bs) "child %p blk %p bs %p"
 bdrv_co_preadv(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwritev(void *bs, int64_t offset, int64_t nbytes, unsigned int flags) "bs %p offset %"PRId64" nbytes %"PRId64" flags 0x%x"
 bdrv_co_pwrite_zeroes(void *bs, int64_t offset, int count, int flags) "bs %p offset %"PRId64" count %d flags 0x%x"
-bdrv_co_do_copy_on_readv(void *bs, int64_t offset, unsigned int bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %"PRId64" bytes %u cluster_offset %"PRId64" cluster_bytes %"PRId64
+bdrv_co_do_copy_on_readv(void *bs, int64_t offset, int64_t bytes, int64_t cluster_offset, int64_t cluster_bytes) "bs %p offset %" PRId64 " bytes %" PRId64 " cluster_offset %" PRId64 " cluster_bytes %" PRId64
 bdrv_co_copy_range_from(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
 bdrv_co_copy_range_to(void *src, uint64_t src_offset, void *dst, uint64_t dst_offset, uint64_t bytes, int read_flags, int write_flags) "src %p offset %"PRIu64" dst %p offset %"PRIu64" bytes %"PRIu64" rw flags 0x%x 0x%x"
 
-- 
2.25.4


