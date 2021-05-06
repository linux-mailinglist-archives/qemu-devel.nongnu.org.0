Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E31375145
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:09:09 +0200 (CEST)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea0K-00047R-PJ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyA-0002F1-I7; Thu, 06 May 2021 05:06:54 -0400
Received: from mail-vi1eur05on2112.outbound.protection.outlook.com
 ([40.107.21.112]:60128 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy3-0002uf-SH; Thu, 06 May 2021 05:06:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/SSAQqeR0RvHi877kdGTCgZ+ic3prbGn3T/VdKBh5/wPN0+vtEaDxB7v3YGTS+1QldxJOaVZQlV1PCDvUXeG9IMmgg0QPHr+IO79dW70Q75Zvbfde0QeiClwxLPmFA0gEF+LM5FS70dCtmvnsWlZFuJzQbji7hmF6oMQYp4hgUfdjbroeFHIKX7Zqgetv1vbfNfD7DmpC6Yztd4vPEltGxvLhHRfhyLDwd2hs3Pq77KsniFkPxhL8iUdBQC0aCIje3vM+Vv71MfifkrpSUb+pIFGdTZzflKenhdghEIQn+JWmES60v5PI6STU2EcJmSOfP+Lj5Tazof/ftRBuTw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CePFD8c9TOv/xlOEc10/J81vYLbfgSth5XopHc7cplk=;
 b=LrTg1w76e5ApQ75FPcdesPJZs5CwUqMGyQzRJjHuPEUFdrqum6vSg/fmshba32G908M39259rrBHbrvY6UuNlfqDGAsn9+5zv6o2SHax5AA3J78wu3I6V6UlgcYfUMKCDuZTNPuhJuipMGYzhfS00/eCOZw+W8VTFb+mLP/k8LfshrjL+1nrvT8s/T9ix2gqa4KPbb3GgwbHmaOVwDOrlP4ea6vUcuC98IdL5EsECfbFTUiTgrnDJEh1yK/fPOHBhfiIDPp03qKqUxK9NneTgcDxkzeLruTiniRYwKLhxE7SxYS5y72Wb8WfqblQmhqevX6ajDMRxI4pSrBzHAG34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CePFD8c9TOv/xlOEc10/J81vYLbfgSth5XopHc7cplk=;
 b=Dg4QK43kWui1rRY/a32okOLUilXIvTfbRu8FHdoDn549psDwMLW5fXqrhbJ7R7yc8JWByYyLJlxdGWo9YQQBpa11Y0wTE8i9KZoJ8fOO0dYqOJnZC9jPCg629CJ0ESoPTh7AKe91SyFbtIQLzFzafXOUbMrBaTDVnI6c+9wckw0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1715.eurprd08.prod.outlook.com (2603:10a6:203:3c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Thu, 6 May
 2021 09:06:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 5/8] block/write-threshold: don't use aio context lock
Date: Thu,  6 May 2021 12:06:18 +0300
Message-Id: <20210506090621.11848-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210506090621.11848-1-vsementsov@virtuozzo.com>
References: <20210506090621.11848-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.236) by
 HE1P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:3:fd::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19897e57-9f79-4512-74e2-08d9106e4545
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1715:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB171548C4C4FC6B75457FD19BC1589@AM5PR0801MB1715.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GSgMZ6s2r2u19AbFlp+5DvY6RUH0b5fmj+Nxro/k1sssCMUc/XA0sScu4hdbxBmeMYiFaV0G90Gc7bleZAZBY9XZwj9IRc8aOg9x8ohy1eRHWVYCp9AsnBQBMsC3odhvOGQR0mtKAqAnx4whz8SNdnusCvOSdYRlbeBYLChqeZ6Dr2rAnOcupb4RT3IT4dXzS0FlKs+xdFZia7KcSQeODDWpJEAudH3xzG8nCTDjdAwd0pYHVBt0+nRlaapNCZVCwSV8GQCD1zv3pl9OQanlGB5dvOJH5KUjLlrhpCiiGtCv7vzxEz9cPRR5sgXxHbt1SQzeG+tLXZLGyWkC4f8aTsFD32a02T0NSS0iY3E2MVPqY/uNhmxYZaPoKS7/HswxyR/xQ5M5Wt26hJSKEM8DSNVGxVAiI4EsC6VtAjsXKzJBE8m47UyWEbDTRYtSs5mYcA1EDpxQUj7jU9Du5QVih6YBgk+HSE3Vn1nhfdeL+Ed86qWj5sJLkT0eP5xdTVfQHlNpbLEklWjP/53fhhJ8yvEIzbOkS0Yi1boLrF4haAGCQGalkJNXv3adFvOHI+NtKjRdCAB3JJpWrN2vu17BahVGMv/ic+p/z6fM+GlXPtC2jA0zIkUjtubSInehTpncuipaILNZFkkpdfcFtBeU+pAII8XIjSa85IQJKxAk9lk1ggHqp8ZFoB4iM7h33Qqg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(136003)(366004)(376002)(36756003)(8676002)(6916009)(52116002)(6506007)(6486002)(6512007)(1076003)(2906002)(66476007)(66556008)(66946007)(5660300002)(4326008)(38350700002)(186003)(478600001)(86362001)(16526019)(38100700002)(6666004)(26005)(8936002)(2616005)(956004)(83380400001)(316002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wope9m3q6p7d4G07LyHpTUnaHsToMrsBV0SbdfjdWRd439eQbPAPBsHKZt8b?=
 =?us-ascii?Q?JGSW3ciwPKkAqMgKpQsLeISYBua+LMO5yaRXeZjVi2OVCRLoueX4S/gfLSIa?=
 =?us-ascii?Q?s2i8xvnoVcCyJPuAxYY8bK7fnSzCODp/wIbwcrlshB1bne9dh6Lx8ufOBjKa?=
 =?us-ascii?Q?awYknuzzMzx7Cx6RAK4+X5j+maQqsK5Yd+UnqbN4qTHOz7Qr5XNQdocUzJQV?=
 =?us-ascii?Q?edx0KGKP7B6jW0OW0dSxHBmtp3xmjwuFQ6u1I51MPHiZI22DG/EuUtuBUw0+?=
 =?us-ascii?Q?s7fVjyPMgYzhiW1gZqhiazndW3u5ft3kJ8TPXL7h7PwDrkRhD1CIT8Q/N64E?=
 =?us-ascii?Q?Tqfp2Gsfwop7faP0TxSBJosm6Hjduc7gf+OQC7KyUfntP5U3JjtXLfKrzNfF?=
 =?us-ascii?Q?EGGRjdMxgKuQWK7XvNnN/Hf4O5Q1S/H7s7atpz5BW7nIYuFJUuVEdj618+Dd?=
 =?us-ascii?Q?tgMAxOQ3G7iqMg9CvVCU+8IbsDGTkiciOv9w8y9iMM5GwoYLoFC4Yxhm2QO5?=
 =?us-ascii?Q?rkiJjL+1IdRuzncQePI1RJUKTcbC+nodL1WHjO9w/FhlC8vcBmOefAIujKEc?=
 =?us-ascii?Q?cSgz4kcpbYmGXmds+XNq23Vp9R/3WeIwXjMYIl7w/yCBE8N1Lz3VE9JN+SEx?=
 =?us-ascii?Q?T6ORwnozF7/v7/1OnAfsn50y9z0e2RayZ1u1VKX6a1i+vBL4W2hOsxgKMRI3?=
 =?us-ascii?Q?GNZf0QXwImGzjl1A0mBEXdeOma8aQ+RsbP6XW8FkoPLeqx9WLzF3DLL2mbCG?=
 =?us-ascii?Q?CE4SCRfWR49+LF7i5ZBG5d1BSeLmrQZU9GkSc2XhB7EhyqBuNAT64i5p4jo5?=
 =?us-ascii?Q?DN5ocGnyfgjvOlthgrnB/Ji5NN6xclhOlhS5IWK2l6BdPxPCsJjHYa9RAo58?=
 =?us-ascii?Q?jy5vwFk6y5igxkwYvZG76DNQGaKmFPpvbnSYQrVSWEs6UvvI28GfNGc3OQDy?=
 =?us-ascii?Q?ombeYfQNBlWFGiXAqSvLhmv6ZFNWisrYE5mt+/9x7qn5Hz2bJnB/kgjbNCdO?=
 =?us-ascii?Q?/xK9v/D+tu2Jwtbe5CtnpZCRYGJNKs5rY7x+Jx1LUZHJHKdYj6HcysXgduLO?=
 =?us-ascii?Q?RFF3UspFzaiKedWL1JZ4xqbilC2H3pivhq4wVXIjQ5OOrtgPtdhsQf2Gh1Nu?=
 =?us-ascii?Q?n40A9FyxXQA9eXqXAZN3PiJeIvkaBIUgber5V2+n+XOH8U1D7oWhftwRuUVj?=
 =?us-ascii?Q?5YKiFOAns4aOZg4McB2jNMEvSfYp3lhusEe7d78rehnqn/n8ayMP4Kru/zDa?=
 =?us-ascii?Q?4PxqEezYGECAt3d3dwRRi8E/+DZFeDsZraZQeOljGqzmC1RGwX4R7ZF29FJ/?=
 =?us-ascii?Q?zPAH7/enojLrgpjwkZaWgPbb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19897e57-9f79-4512-74e2-08d9106e4545
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:44.5815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2/I8xKMbneeQlUERAb0v/U33BbKybZ3TDzt/cLQKV1ME9hQ0SoOd4w1jb3VRrhXEDphIgWOML2B90A6KSoEMC8QB3QxtG+vW5VlRKhEaMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1715
Received-SPF: pass client-ip=40.107.21.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Instead of relying on aio context lock, let's make use of atomic
operations.

The tricky place is bdrv_write_threshold_check_write(): we want
atomically unset bs->write_threshold_offset iff
  offset + bytes > bs->write_threshold_offset
We don't have such atomic operation, so let's go in a loop:

1. fetch wtr atomically
2. if condition satisfied, try cmpxchg (if not satisfied, we are done,
   don't send event)
3. if cmpxchg succeeded, we are done (send event), else go to [1]

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h       |  6 +++++-
 include/block/write-threshold.h |  6 ++++++
 block/write-threshold.c         | 34 +++++++++++++++++----------------
 3 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index eab352f363..e3f3d79f5b 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -954,7 +954,11 @@ struct BlockDriverState {
      */
     int64_t total_sectors;
 
-    /* threshold limit for writes, in bytes. "High water mark". */
+    /*
+     * Threshold limit for writes, in bytes. "High water mark".
+     * Don't access directly, use bdrw_write_threshold* interface.
+     * Protected by atomic access, no lock is needed.
+     */
     uint64_t write_threshold_offset;
 
     /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index c60b9954cd..28c35a1c05 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -24,6 +24,8 @@
  * To be used with thin-provisioned block devices.
  *
  * Use threshold_bytes == 0 to disable.
+ *
+ * Function is thread-safe, no lock is needed.
  */
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
 
@@ -32,6 +34,8 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
  *
  * Get the configured write threshold, in bytes.
  * Zero means no threshold configured.
+ *
+ * Function is thread-safe, no lock is needed.
  */
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
 
@@ -40,6 +44,8 @@ uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
  *
  * Check whether the specified request exceeds the write threshold.
  * If it is, send corresponding event and disable write threshold checking.
+ *
+ * Function is thread-safe, no lock is needed.
  */
 void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes);
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 65a6acd142..8b46bb9a75 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -2,6 +2,7 @@
  * QEMU System Emulator block write threshold notification
  *
  * Copyright Red Hat, Inc. 2014
+ * Copyright (c) 2021 Virtuozzo International GmbH.
  *
  * Authors:
  *  Francesco Romani <fromani@redhat.com>
@@ -14,6 +15,7 @@
 #include "block/block_int.h"
 #include "qemu/coroutine.h"
 #include "block/write-threshold.h"
+#include "qemu/atomic.h"
 #include "qemu/notify.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-block-core.h"
@@ -21,45 +23,45 @@
 
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
 {
-    return bs->write_threshold_offset;
+    return qatomic_read(&bs->write_threshold_offset);
 }
 
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
-    bs->write_threshold_offset = threshold_bytes;
+    qatomic_set(&bs->write_threshold_offset, threshold_bytes);
 }
 
 void qmp_block_set_write_threshold(const char *node_name,
                                    uint64_t threshold_bytes,
                                    Error **errp)
 {
-    BlockDriverState *bs;
-    AioContext *aio_context;
-
-    bs = bdrv_find_node(node_name);
+    BlockDriverState *bs = bdrv_find_node(node_name);
     if (!bs) {
         error_setg(errp, "Device '%s' not found", node_name);
         return;
     }
 
-    aio_context = bdrv_get_aio_context(bs);
-    aio_context_acquire(aio_context);
-
     bdrv_write_threshold_set(bs, threshold_bytes);
-
-    aio_context_release(aio_context);
 }
 
 void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
                                       int64_t bytes)
 {
     int64_t end = offset + bytes;
-    uint64_t wtr = bs->write_threshold_offset;
+    uint64_t wtr;
 
-    if (wtr > 0 && end > wtr) {
-        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
+retry:
+    wtr = bdrv_write_threshold_get(bs);
+    if (wtr == 0 || wtr >= end) {
+        return;
+    }
 
-        /* autodisable to avoid flooding the monitor */
-        bdrv_write_threshold_set(bs, 0);
+    /* autodisable to avoid flooding the monitor */
+    if (qatomic_cmpxchg(&bs->write_threshold_offset, wtr, 0) != wtr) {
+        /* bs->write_threshold_offset changed in parallel */
+        goto retry;
     }
+
+    /* We have cleared bs->write_threshold_offset, so let's send event */
+    qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
 }
-- 
2.29.2


