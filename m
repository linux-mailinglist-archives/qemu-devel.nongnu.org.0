Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027A8324F8A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 12:55:30 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFFEu-0003E7-UO
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 06:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFCB-0008L3-MV; Thu, 25 Feb 2021 06:52:39 -0500
Received: from mail-eopbgr30137.outbound.protection.outlook.com
 ([40.107.3.137]:1858 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lFFC9-0006sd-V2; Thu, 25 Feb 2021 06:52:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibQQHaV91rBLVIuHFAOu5Wx3yLcRqOjaZpvx7im3EQ9xaYD+2CUbUBx0Te7QXwLf2atykqrxrSUt69+b2ydMdad+QrSAsoM+FSO+YfvlxDsg/XrBcWQy9Qk5HMUDkuq/uxQy+EDZoqR9Tq7VtXIz10fM8vDbEuyFtfGGwxmq68M7OosYlpZuJu04tQ8BG62VnPDouo6M4rFEotVdxQH+5m5HoQokg76rw8U5hq9ucT9mnnRtJYnZxjCv6i1Raiw33itvsYX4W9h48OvRk9ZhClW1xxd4nfTUmKRsGNN5a+mXRCpO7/BGrZJHNZ/2fXEF99TKSFSOsV5Yck4gSgS7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QyD1f8oFeyvEnEDrnC4e+YLRmAOAT7rhg2l+eR2AeE=;
 b=QFA4QR+C9Ezs2L+1CSscwlyqHW98On83rcBfkEyShDT8um8Nh8P0Qdba6ULAGQVAjQ5g36/C4IpZeZHC9ONd9PyVtbiEVYZOsIXxoQKGNPHsRP+/steLBjh/Uo1fDOXdXPR9yAwrs1wZT7c3BhbtK8+XK4gYxrKts0UC96XWsJAzLHb5gqU+3Qij5xY3VccKfZyVKLMEAb+VT5vt30RTmmtbZ4vGH/IhF3OuYs38AH47U5/8KkvNcU+7j53aD92J8VhwZGuFWUuogz+Gj/zhhGVxG+xLQiXif/h2zCP2yFr28dzySuUmmRHSlzJoMbOPKidGTcbtaK3BcUf2LrD5KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QyD1f8oFeyvEnEDrnC4e+YLRmAOAT7rhg2l+eR2AeE=;
 b=qrEtcO/r23HdO4voqo5sqqtuiXALTxve7ZGi3B1dPrvN3BEqHp9c4yLm68ER9NpKm319NMQBGC/IcoJ//k2y4GMv1tJ6+irwIKgEZiQCvfYPeWki/sadN+E0PGtnLcVggmM6iZ401UYAP6tQpx3zUoMaJW7joCKLZOUkXTvqFx0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Thu, 25 Feb
 2021 11:52:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 11:52:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v2 3/3] block/qcow2: introduce inflight writes counters: fix
 discard
Date: Thu, 25 Feb 2021 14:52:05 +0300
Message-Id: <20210225115205.249923-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225115205.249923-1-vsementsov@virtuozzo.com>
References: <20210225115205.249923-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.253]
X-ClientProxiedBy: HE1PR09CA0074.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.253) by
 HE1PR09CA0074.eurprd09.prod.outlook.com (2603:10a6:7:3d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Thu, 25 Feb 2021 11:52:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ac1a685-c920-4873-0ae9-08d8d983d042
X-MS-TrafficTypeDiagnostic: AS8PR08MB6008:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6008B3C33083FD0D148EC332C19E9@AS8PR08MB6008.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJ87rvyE3tCML/8QtEdU2nSTjdt35J2mfZVe3gQS5hs4ZpyiNt3a5MNyn3VMrMWQE4EO3aLinqUXUpsM2kSa5JjANi7Y2u7a/XRzWsqQgJziD6qQexzHd9X3Q8ZAmphK/Lzj1RClFH7CCx05YVwtSexAZ0CIVUV31aHr1k7Te+EzBpL00mN9MZ3FHaznfCPVhxFb9Qhxv+3cRCHNnpqOtztPm17X3W0tsz7Rvb84mYW6roJ84nmmJo7NbJUNLAtvQJKd29XnGxWu4E1M3B+NppWjFiOud4AMNQ4BEItwnTiHgnJhdAkwz4Io7StgU2ZorAX4uyA8qmGMArjVwlo/olEbW40DenYe+TKEyB80ZICyIcVgbu9WaVKdelsMjMfwcP2jCyb463BlPayMWfYYlCSXYADlWhnf4g5HjjLCR4YCVM4QxHjBtyHiIZp+w2jKnicALd1y+p3Vdb8j7sU/6P2XMVkFYHV5AIhapu+pRCZ+NJQkSUtIQNU4lsCWZx0q5kGxe/SMOMVrq7GFT7ymGGkMB72ZbDmv3hfPgp0SdOkSS+om2aal4FB41GDms4UCcSeyxP2n25UQMtx/CoXx1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(83380400001)(36756003)(186003)(8676002)(16526019)(6666004)(478600001)(1076003)(5660300002)(69590400012)(86362001)(4326008)(6486002)(52116002)(6506007)(19627235002)(66556008)(107886003)(26005)(6512007)(956004)(8936002)(316002)(2616005)(6916009)(2906002)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?f/UhybjbY2mhQVMGrvdRrDdCDPlE2IcPdnGev+hagUduc4m9Nv1NleEr2aj1?=
 =?us-ascii?Q?93tdfqeYRKHQSQqenzhgIcvivV6n33MHafFfw+ciG9pbw4HqiRKaQvXerInX?=
 =?us-ascii?Q?mQwn4k4tH4cLWt3IVRzW8eEXpe+U/iuQU0hC5/rT8SUB/bNdIQc3a9af2X82?=
 =?us-ascii?Q?9Iz6a2cHY+IunmTyB73jexZxzGiCMpMJr4PD3Y6Sa1QncATtEzLZTbgwh8pY?=
 =?us-ascii?Q?l8DjAlbJvX/GMLtNyJ8X2Rf+7wzmYuoGNFQjiHwpsItkvI6az+qJ2bLC9uhH?=
 =?us-ascii?Q?ejX6I1NZLnQU05TvLSMJQxmHnvs97vBWNcfoOdfGr6z0p8oyb5thrrTz1EGf?=
 =?us-ascii?Q?x/fc0uMybME8ga0YM0V1+Jr5EA9dPiUZ0xi33imILHtqykVU5sobAcACF22o?=
 =?us-ascii?Q?HPFxt7BDx6ZX28W1cqxU6b9lY3fOuv40R5TV3sc5An9tj6/68VAfKY5S+RFS?=
 =?us-ascii?Q?oEgCYl/idKqox+kIK+vqvJkXtnfMfWaHc4IZNFrJ/mskEYFtbCbUN0rJzzSG?=
 =?us-ascii?Q?7F0HEOAFtH6TFDJkw97NfvvH3bvW2v5G2qgPQAdWgWjdeHOHZ8AfcwS7bZTu?=
 =?us-ascii?Q?a1MBO5LkKKAiPFHOJ6UcCr1XO9OI0qFp90hdGIfrNrl6cs0lapMNO7aoKRgT?=
 =?us-ascii?Q?+6fGHnEadrWcIeoI94NxOwQvQl4dX2fw72qWIw6DoIlELydlMVmgSvwT+zgN?=
 =?us-ascii?Q?DHj29y5M/E9xjcE4J23AjlDGHzoDSvkCjxC/enyyaTdmZMIB25Vr2HVcHous?=
 =?us-ascii?Q?+5zyi+W5h0RIMZf1GN/9d9/qypOy+sizX5t9Qhk33nkLtfgErE0gBVnW6Xsd?=
 =?us-ascii?Q?6wr/0lIQmVeujXWb2ejdVmg7ZBdONIT2vrx5SdFJX3GMt40/MGtuFTqgAsfm?=
 =?us-ascii?Q?jaYxwy7vsYQGbUPXoJQ+2mGa/uVEDD2vMajCk0T1ILD5I8QfY2lkis6g0RKC?=
 =?us-ascii?Q?O/G/D3tufgjJdCsTVTkVX+yVErkeF1b+zJ8nIsyghzu9HLnjMlRtOxy3oErF?=
 =?us-ascii?Q?Na5cUaUAAllQ2XOLkFQpNxzGygIvYim11DN95O90swT7prfwzu91vgHsQpCd?=
 =?us-ascii?Q?jE4TdeV7h7I5IsW4zdVuDorx2G9RBWMoVRnBhnagYqKQJWrwVvYsV66ZwI7H?=
 =?us-ascii?Q?li003Kb2D0RN0rE2lqq2DM/5DQeVwJaraObv4oQbicM+1nBXvkZuxZ2kqfgh?=
 =?us-ascii?Q?W1NiINHiR6ZPGTM2zLytbY6P4GGvpcCoIcFhtZ4QUPIiGx8XNivpO9r6AmHN?=
 =?us-ascii?Q?glfEDAKn3REBVK0C9Gsd2xi3KCzqCDzLbsuSH19FYQ/24Q0HNxUjoUo4RZ0Z?=
 =?us-ascii?Q?3ubIgsxRmbEkFtb2EAEA+QDT?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac1a685-c920-4873-0ae9-08d8d983d042
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 11:52:23.2420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1MIqXzpE7xnQBOTyj+8NzDHF+RZuFKdZ7HXY43EQwnAJde06/mdpGQHNRXYD6qjwiWaQeFow+5zc3h/CgnO6y/gTcUr+6466GefvRlpceo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Received-SPF: pass client-ip=40.107.3.137;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
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

There is a bug in qcow2: host cluster can be discarded (refcount
becomes 0) and reused during data write. In this case data write may
pollute another cluster (recently allocated) or even metadata.

To fix the issue introduce rw-lock: take read-lock on data writing and
write-lock on discard.

Enable qcow2-discard-during-rewrite as it is fixed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                                  |  2 ++
 block/qcow2-cluster.c                          |  4 ++++
 block/qcow2.c                                  | 18 +++++++++++++++++-
 .../tests/qcow2-discard-during-rewrite         |  2 +-
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 0678073b74..7ebb6e2677 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -420,6 +420,8 @@ typedef struct BDRVQcow2State {
      * is to convert the image with the desired compression type set.
      */
     Qcow2CompressionType compression_type;
+
+    CoRwlock discard_rw_lock;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index bd0597842f..e16775dd59 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1938,6 +1938,8 @@ int qcow2_cluster_discard(BlockDriverState *bs, uint64_t offset,
     int64_t cleared;
     int ret;
 
+    qemu_co_rwlock_wrlock(&s->discard_rw_lock);
+
     /* Caller must pass aligned values, except at image end */
     assert(QEMU_IS_ALIGNED(offset, s->cluster_size));
     assert(QEMU_IS_ALIGNED(end_offset, s->cluster_size) ||
@@ -1965,6 +1967,8 @@ fail:
     s->cache_discards = false;
     qcow2_process_discards(bs, ret);
 
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
+
     return ret;
 }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index d9f49a52e7..e1a5d89aa1 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1897,6 +1897,7 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
 
     /* Initialise locks */
     qemu_co_mutex_init(&s->lock);
+    qemu_co_rwlock_init(&s->discard_rw_lock);
 
     if (qemu_in_coroutine()) {
         /* From bdrv_co_create.  */
@@ -2536,12 +2537,14 @@ static coroutine_fn int qcow2_co_pwritev_task(BlockDriverState *bs,
         }
     }
 
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
     qemu_co_mutex_lock(&s->lock);
 
     ret = qcow2_handle_l2meta(bs, &l2meta, true);
     goto out_locked;
 
 out_unlocked:
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
     qemu_co_mutex_lock(&s->lock);
 
 out_locked:
@@ -2605,6 +2608,8 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
 
+        qemu_co_rwlock_rdlock(&s->discard_rw_lock);
+
         qemu_co_mutex_unlock(&s->lock);
 
         if (!aio && cur_bytes != bytes) {
@@ -4097,10 +4102,15 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
 
+        qemu_co_rwlock_rdlock(&s->discard_rw_lock);
         qemu_co_mutex_unlock(&s->lock);
+
         ret = bdrv_co_copy_range_to(src, src_offset, s->data_file, host_offset,
                                     cur_bytes, read_flags, write_flags);
+
+        qemu_co_rwlock_unlock(&s->discard_rw_lock);
         qemu_co_mutex_lock(&s->lock);
+
         if (ret < 0) {
             goto fail;
         }
@@ -4536,13 +4546,19 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     }
 
     ret = qcow2_pre_write_overlap_check(bs, 0, cluster_offset, out_len, true);
-    qemu_co_mutex_unlock(&s->lock);
     if (ret < 0) {
+        qemu_co_mutex_unlock(&s->lock);
         goto fail;
     }
 
+    qemu_co_rwlock_rdlock(&s->discard_rw_lock);
+    qemu_co_mutex_unlock(&s->lock);
+
     BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
     ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+
+    qemu_co_rwlock_unlock(&s->discard_rw_lock);
+
     if (ret < 0) {
         goto fail;
     }
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
index dd9964ef3f..5df0048757 100755
--- a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -1,5 +1,5 @@
 #!/usr/bin/env bash
-# group: quick disabled
+# group: quick
 #
 # Test discarding (and reusing) host cluster during writing data to it.
 #
-- 
2.29.2


