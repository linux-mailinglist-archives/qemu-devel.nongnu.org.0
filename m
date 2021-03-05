Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BED32F2A6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:35:26 +0100 (CET)
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFIL-0008SU-AS
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMT-0004h1-UC; Fri, 05 Mar 2021 12:35:38 -0500
Received: from mail-eopbgr20134.outbound.protection.outlook.com
 ([40.107.2.134]:49806 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIEMR-0005EG-98; Fri, 05 Mar 2021 12:35:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mt0+DCZoPNMTwdHTPXZDMKXSde+k02TpR7wmqbkMOdhpRH5fBhOEoClVNWhlLGGpk6G3x62noN8p+qT9/ICQoHlxNLb2yGrcP4IBsNvAJe+p+GGcEW+Nv+RYK9gY32lbTDQX/vtG83xnKvOG6rXWaV7pd6jzJJQGQJDwUfs5PAdu25KKY+Oym5U3IOYfNl9q/KQSss0VDfEgV/rc0e/e7sQJBH3ql1RlVZ26bklxVNZQCerMeQBc+Kx9g16xjbbSCMa00XjHa15kpZ2K+HAq9Y868Dswui+2FJAUnQ4B5gV/1/qChZDNBOYw2jsHuM40Jc5zcmhYCpkXU9TJGnJ9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42OGlUD99CJV/hXRGe+/X0EzOEnI74ar1pVUsDwjesw=;
 b=DBu+3bYLaZQjvjEBfFZPRQqS2vg5fR9voLKOH4QAETsK5pOcv2nCxf8y61jDWGsTYSq3/A2yjgslRjrAOD1BJ3uMyxB0wqpHLnP6cmgaqUKzal/5VQW6SPkdXTawY0XToQBpYhsSjMwbhaglmqU8x+3mGkBhWetyOkjKoDvqUv7rRjRPCmDM+Q139LTsT6f5XR/Yus06Qu2X7O7FjyY3OJIZGn7cJyza6xPn6iXZ0ss7KpLuhQfmzqLHswXUqfW1TUJRdzNYpgCV7tYqvAOLGES0q+CpAyMQ9ag2tR8UUqtuk9q5VSKYKo2FkqV/NbbnCoP1OE2yxdHu+lb5ZeQYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42OGlUD99CJV/hXRGe+/X0EzOEnI74ar1pVUsDwjesw=;
 b=fN3OpmhHl+Vf0zybfwidf7Jd2bmPvWRSc7cl8VYJZWMfQ6yDpE06lduvukBf6iEOXlJ6S5mXa5C8GUoJ+fZF4C2e31dzibF1jvrfzt9x+CzPDiorptLrRHV7uapY1Lio13aCqg6ijsUYARcFeqS4vCv/uddi49bxnV5xUmlfMMw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4850.eurprd08.prod.outlook.com (2603:10a6:20b:d2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.26; Fri, 5 Mar
 2021 17:35:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 17:35:31 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com
Subject: [PATCH v3 6/6] block/qcow2: use seqcache for compressed writes
Date: Fri,  5 Mar 2021 20:35:07 +0300
Message-Id: <20210305173507.393137-7-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210305173507.393137-1-vsementsov@virtuozzo.com>
References: <20210305173507.393137-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR02CA0119.eurprd02.prod.outlook.com
 (2603:10a6:7:29::48) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR02CA0119.eurprd02.prod.outlook.com (2603:10a6:7:29::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 17:35:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ec31d52-192e-43f4-e8a8-08d8dffd130c
X-MS-TrafficTypeDiagnostic: AM6PR08MB4850:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4850082C4B74C163BCEC6898C1969@AM6PR08MB4850.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7S4D3nuC5YSvNlZRxJisKedY7cJtE9HSpWL7KtxPkch4ZZ8kovIKTpVa6yKZNy0R9Wx7QaVOOsJpOKGoJHQ4rzXnou1PslcIpLhtO5cX3vWrFwOqdkY1CgfnMj/zSX/Ntf0A9HJKvvwOINp3wW9+ICVuQgJwTxrFanuOba7+svKHqhwhXNuaskvBuAdpfBZsg2oiq78WM6eTOo4efTrEoFvuNyI3u8+15bQgbzwmYL/ALxbIM5dDdL6igp0kjaNct0y8Z2VFPtt0FEQ1pi20ShuOUQVHwlqm6gHSGrWkz+ivDDUX4+s92UqWApG4Cf4zMnMnELvql09XdpR7U/wSL81xnoK/mKtkbppnhEtW8LdAnO7ozDHN7Dclh8E9ht/y9zE0MJp17jsM0cib4JuWLgflM5qN7YlW7aNBxuwJbtoqXdi12OGG8jqUI+DbEWq5KhEw2OtItDGWGhhj6G4K/PnHz//4IRUDK/uNCWLDChpUXg+GfzY+AJcXB3Ghl7k2lLAmY00WOIvLhLWCKiqxx6PIiDnIk/RMIHpTyXjm0Cqw4pfIJHapWYl9trRopAKTDqtzWWg14jXOK/awnnLbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(66476007)(52116002)(66946007)(478600001)(316002)(66556008)(6486002)(19627235002)(6512007)(16526019)(5660300002)(186003)(83380400001)(8676002)(4326008)(2906002)(2616005)(86362001)(956004)(6666004)(26005)(6506007)(6916009)(69590400012)(36756003)(8936002)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YcLDAte2uFR2ip0a3ZIRoa3z1lxf24Xo1/nnv1F0/i4rIyvr1M6qSw12NcCZ?=
 =?us-ascii?Q?66KsaYBurdsmo0ztE/Kd8FwqVmUhLoX4x7khOXwGvAkna6dv7GGjdxCSJVDv?=
 =?us-ascii?Q?1+3DGCAzlDwRLKuGILZPRTKlC5jDXTt+3j42AT86dzXsfSr8PuzY2l66hXP9?=
 =?us-ascii?Q?XO0iH4TZx+LMW5larg2a4D8W8PjpKua7ArhmVDwxAGZWmY81EKXMnRvmqzcj?=
 =?us-ascii?Q?zjd3H5pvpUm6Yqq156QIKtx5NhZ+/77VUgnNPwAfqluijOyjsWWrD3wxd5Lp?=
 =?us-ascii?Q?oTHZZ/dH5O6oH3u7Em8ZZBKPxcDNQthWL0d7I86vF+7mHNeKoQpjI/2+nUFZ?=
 =?us-ascii?Q?ImGqv/knqP8TM9XGkwhf3CIdmaKqA7coa65wkGOvx9jvDTVeWJgGfNYZAvFK?=
 =?us-ascii?Q?vxSm7BXFw0DEz0Jmc9FKzu17oOuDGbUhoDUu4cAY8HrZ2M4y5byBWqIH36Wx?=
 =?us-ascii?Q?vYd46+CHdot/DyFHJIGbcey/SIMSpNkHVjnyZrkIRW2zM/sTFMTuMJpZWDDm?=
 =?us-ascii?Q?OeS2ZUErrjy9EoKgNeu8a2mnAUTq0xh5VrJzmksVT6nr/olIaK6e1rofJPcd?=
 =?us-ascii?Q?U4oQYh9xvqDNfHWqOA13j7zyT0rc0yywHi5qiGKh2mNCmG5wa0/w3XM2js5G?=
 =?us-ascii?Q?F/enuGsTC01cjw22vMputCUhkThu2ICOHmcK4L+2WqmzmKIzMy0+g1DYx7vX?=
 =?us-ascii?Q?ZXfoEemys6G94vbncef6yeuAVnMDiiXJFiyBp/NwRrfo1rmkCsxHyes0oI+n?=
 =?us-ascii?Q?1i5FQ4+GszyfwZ0vaTRpsDKIIkxH4p5UJotK0HE5MryKqdsdEXqcldPKt26t?=
 =?us-ascii?Q?QTyiQMoHCoFs4Skj7hQtNaJcSZb982jqbbo+y5+/Tr5e2SWzxd4H7Y+PHPhw?=
 =?us-ascii?Q?+KfedMmPpUnKlTRNJCzAgQ1ZVT+djTIHyKiK91FDCn/DD/fO2PsuNMra/qN7?=
 =?us-ascii?Q?pvz6zh/AwqwbFkcX+QsVnBAzlonE9TdoG6DNk0fX6ApTOe/M0JbJ66jys3Gq?=
 =?us-ascii?Q?zvXVcGhiIosLThXuDqxkAtQleL+RADv0RLiQmtZQn2XYaXAKTwySaLwNbwHu?=
 =?us-ascii?Q?wCRHfZHeelvUBdB/7QevsSusTEIIEM5SDEbdduv1DEir+GnyWjQzVkr35FRd?=
 =?us-ascii?Q?LXqkOs1zM0G0RwUe/002NohXGfLBD5LkFvuM6Oc96TUrLwk9EZZTzjg2X0mB?=
 =?us-ascii?Q?zeTWtQVEW4s3si39NQlNKvp9b2VNGGbg/GXifd38/xPfmkBcaC3e3NXmVWW6?=
 =?us-ascii?Q?XCERAAq4KoKarjYL/OSpOu4UTxCe2Tv0x1bu6B5GvtWNy06pzXbou4RJUPHs?=
 =?us-ascii?Q?5z0epmzVJWx3q2mcX818bza/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec31d52-192e-43f4-e8a8-08d8dffd130c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 17:35:31.3816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoUOsNs2tyvQQOyI80GVdAR2Mqj3sAnr74AULf517eJNV5Utt2EBgWbV4+KrW1mSuYhfXwXnlqg61jFw6DGeOcbwP0dSssblWauGabQPcUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4850
Received-SPF: pass client-ip=40.107.2.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

Compressed writes are unaligned to 512, which works very slow in
O_DIRECT mode. Let's use the cache.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/coroutines.h     |   3 +
 block/qcow2.h          |   4 ++
 block/qcow2-refcount.c |  10 +++
 block/qcow2.c          | 158 ++++++++++++++++++++++++++++++++++++++---
 4 files changed, 164 insertions(+), 11 deletions(-)

diff --git a/block/coroutines.h b/block/coroutines.h
index 4cfb4946e6..cb8e05830e 100644
--- a/block/coroutines.h
+++ b/block/coroutines.h
@@ -66,4 +66,7 @@ int coroutine_fn bdrv_co_readv_vmstate(BlockDriverState *bs,
 int coroutine_fn bdrv_co_writev_vmstate(BlockDriverState *bs,
                                         QEMUIOVector *qiov, int64_t pos);
 
+int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs);
+int generated_co_wrapper qcow2_flush_compressed_cache(BlockDriverState *bs);
+
 #endif /* BLOCK_COROUTINES_INT_H */
diff --git a/block/qcow2.h b/block/qcow2.h
index e18d8dfbae..8b8fed0950 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -28,6 +28,7 @@
 #include "crypto/block.h"
 #include "qemu/coroutine.h"
 #include "qemu/units.h"
+#include "qemu/seqcache.h"
 #include "block/block_int.h"
 
 //#define DEBUG_ALLOC
@@ -422,6 +423,9 @@ typedef struct BDRVQcow2State {
     Qcow2CompressionType compression_type;
 
     GHashTable *inflight_writes_counters;
+
+    SeqCache *compressed_cache;
+    int compressed_flush_ret;
 } BDRVQcow2State;
 
 typedef struct Qcow2COWRegion {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 464d133368..218917308e 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -29,6 +29,7 @@
 #include "qemu/bswap.h"
 #include "qemu/cutils.h"
 #include "trace.h"
+#include "block/coroutines.h"
 
 static int64_t alloc_clusters_noref(BlockDriverState *bs, uint64_t size,
                                     uint64_t max);
@@ -1040,6 +1041,10 @@ static int QEMU_WARN_UNUSED_RESULT update_refcount(BlockDriverState *bs,
                 qcow2_cache_discard(s->l2_table_cache, table);
             }
 
+            if (s->compressed_cache) {
+                seqcache_discard_cluster(s->compressed_cache, cluster_offset);
+            }
+
             if (s->discard_passthrough[type]) {
                 update_refcount_discard(bs, cluster_offset, s->cluster_size);
             }
@@ -1349,6 +1354,11 @@ int coroutine_fn qcow2_write_caches(BlockDriverState *bs)
     BDRVQcow2State *s = bs->opaque;
     int ret;
 
+    ret = qcow2_flush_compressed_cache(bs);
+    if (ret < 0) {
+        return ret;
+    }
+
     ret = qcow2_cache_write(bs, s->l2_table_cache);
     if (ret < 0) {
         return ret;
diff --git a/block/qcow2.c b/block/qcow2.c
index 6ee94421e0..5f3713cd6f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -42,6 +42,7 @@
 #include "qapi/qapi-visit-block-core.h"
 #include "crypto.h"
 #include "block/aio_task.h"
+#include "block/coroutines.h"
 
 /*
   Differences with QCOW:
@@ -1834,6 +1835,10 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     s->inflight_writes_counters =
         g_hash_table_new_full(g_int64_hash, g_int64_equal, g_free, g_free);
 
+    if (!has_data_file(bs) && (bs->file->bs->open_flags & BDRV_O_NOCACHE)) {
+        s->compressed_cache = seqcache_new(s->cluster_size);
+    }
+
     return ret;
 
  fail:
@@ -2653,6 +2658,91 @@ fail_nometa:
     return ret;
 }
 
+/*
+ * Flush one cluster of compressed cache if exists. If @unfinished is true and
+ * there is no finished cluster to flush, flush the unfinished one. Otherwise
+ * flush only finished clusters.
+ *
+ * Return 0 if nothing to flush, 1 if one cluster successfully flushed and <0 on
+ * error.
+ */
+static int coroutine_fn
+qcow2_co_compressed_flush_one(BlockDriverState *bs, bool unfinished)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    int64_t align = 1;
+    int64_t offset, bytes;
+    uint8_t *buf;
+
+    if (!s->compressed_cache) {
+        return 0;
+    }
+
+    if (!seqcache_get_next_flush(s->compressed_cache, &offset, &bytes, &buf,
+                                 &unfinished))
+    {
+        return 0;
+    }
+
+    qcow2_inflight_writes_inc(bs, offset, bytes);
+
+    /*
+     * Don't try to align-up unfinished cached cluster, parallel write to it is
+     * possible! For finished host clusters data in the tail of the cluster will
+     * be never used. So, take some good alignment for speed.
+     *
+     * Note also, that seqcache guarantees that allocated size of @buf is enough
+     * to fill the cluster up to the end, so we are safe to align up with
+     * align <= cluster_size.
+     */
+    if (!unfinished) {
+        align = MIN(s->cluster_size,
+                    MAX(s->data_file->bs->bl.request_alignment,
+                        bdrv_opt_mem_align(bs)));
+    }
+
+    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
+    ret = bdrv_co_pwrite(s->data_file, offset,
+                         QEMU_ALIGN_UP(offset + bytes, align) - offset,
+                         buf, 0);
+    if (ret < 0 && s->compressed_flush_ret == 0) {
+        /*
+         * The data that was "written" earlier is lost. We don't want to
+         * care with storing it somehow to retry flushing later. Also, how much
+         * data will we have to store, if not drop it after failed flush?
+         * After this point qcow2_co_flush_compressed_cache() (and
+         * qcow2_flush_compressed_cache()) never return success.
+         */
+        s->compressed_flush_ret = ret;
+    }
+
+    seqcache_discard_cluster(s->compressed_cache, offset);
+
+    qcow2_inflight_writes_dec(bs, offset, bytes);
+
+    return ret < 0 ? ret : 1;
+}
+
+int coroutine_fn qcow2_co_flush_compressed_cache(BlockDriverState *bs)
+{
+    BDRVQcow2State *s = bs->opaque;
+
+    if (s->compressed_cache) {
+        uint64_t nb_clusters = seqcache_nb_clusters(s->compressed_cache);
+
+        /*
+         * If parallel writes are possible we don't want to loop forever. So
+         * flush only clusters available at start of flush operation.
+         */
+        while (nb_clusters--) {
+            qcow2_co_compressed_flush_one(bs, true);
+        }
+    }
+
+    return s->compressed_flush_ret;
+}
+
 static int qcow2_inactivate(BlockDriverState *bs)
 {
     BDRVQcow2State *s = bs->opaque;
@@ -2667,6 +2757,13 @@ static int qcow2_inactivate(BlockDriverState *bs)
                           bdrv_get_device_or_node_name(bs));
     }
 
+    ret = qcow2_flush_compressed_cache(bs);
+    if (ret) {
+        result = ret;
+        error_report("Failed to flush the compressed write cache: %s",
+                     strerror(-ret));
+    }
+
     ret = qcow2_cache_flush(bs, s->l2_table_cache);
     if (ret) {
         result = ret;
@@ -2699,6 +2796,12 @@ static void qcow2_close(BlockDriverState *bs)
         qcow2_inactivate(bs);
     }
 
+    /*
+     * Cache should be flushed in qcow2_inactivate() and should be empty in
+     * inactive mode. So we are safe to free it.
+     */
+    seqcache_free(s->compressed_cache);
+
     cache_clean_timer_del(bs);
     qcow2_cache_destroy(s->l2_table_cache);
     qcow2_cache_destroy(s->refcount_block_cache);
@@ -4558,18 +4661,42 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
         goto fail;
     }
 
-    qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
+    if (s->compressed_cache) {
+        /*
+         * It's important to do seqcache_write() in the same critical section
+         * (by s->lock) as qcow2_alloc_compressed_cluster_offset(), so that the
+         * cache is filled sequentially.
+         */
+        seqcache_write(s->compressed_cache, cluster_offset, out_len, out_buf);
 
-    qemu_co_mutex_unlock(&s->lock);
+        qemu_co_mutex_unlock(&s->lock);
 
-    BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
-    ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+        ret = qcow2_co_compressed_flush_one(bs, false);
+        if (ret < 0) {
+            /*
+             * if ret < 0 it probably not this request which failed, but some
+             * previous one that was cached. Moreover, when we write to the
+             * cache we probably may always report success, because
+             * seqcache_write() never fails. Still, it's better to inform
+             * compressed backup now then wait until final flush.
+             */
+            goto fail;
+        }
+    } else {
+        qcow2_inflight_writes_inc(bs, cluster_offset, out_len);
 
-    qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
+        qemu_co_mutex_unlock(&s->lock);
 
-    if (ret < 0) {
-        goto fail;
+        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
+        ret = bdrv_co_pwrite(s->data_file, cluster_offset, out_len, out_buf, 0);
+
+        qcow2_inflight_writes_dec(bs, cluster_offset, out_len);
+
+        if (ret < 0) {
+            goto fail;
+        }
     }
+
 success:
     ret = 0;
 fail:
@@ -4681,10 +4808,19 @@ qcow2_co_preadv_compressed(BlockDriverState *bs,
 
     out_buf = qemu_blockalign(bs, s->cluster_size);
 
-    BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
-    ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
-    if (ret < 0) {
-        goto fail;
+    /*
+     * seqcache_read may return less bytes than csize, as csize may exceed
+     * actual compressed data size. So we are OK if seqcache_read returns
+     * something > 0.
+     */
+    if (!s->compressed_cache ||
+        seqcache_read(s->compressed_cache, coffset, csize, buf) <= 0)
+    {
+        BLKDBG_EVENT(bs->file, BLKDBG_READ_COMPRESSED);
+        ret = bdrv_co_pread(bs->file, coffset, csize, buf, 0);
+        if (ret < 0) {
+            goto fail;
+        }
     }
 
     if (qcow2_co_decompress(bs, out_buf, s->cluster_size, buf, csize) < 0) {
-- 
2.29.2


