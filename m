Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2236750A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 00:13:19 +0200 (CEST)
Received: from localhost ([::1]:49436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZL5w-0003p8-IN
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 18:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZL3C-00036i-PA; Wed, 21 Apr 2021 18:10:29 -0400
Received: from mail-eopbgr10091.outbound.protection.outlook.com
 ([40.107.1.91]:2883 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZL36-0001g9-Jf; Wed, 21 Apr 2021 18:10:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTw+lcUmqyF/J1LTFruOixnJS6Sm1PjJz6GIFvBiqZ53VVyDyiWKd32kkT9jA4OY9trTT9lxW8qMvaa4dR4cuEzmAKGLv9JDU+qn9MbbqKXSDGCF3jGdxQdb12pSNjRo/MjTSiI3gQpW2X0N1qMtGk9eDLxL6GeiVd1FaeiLSSci2okUBUsm93EVzox6eqTJ9kZJHXO1PXnsLO2N4r9b9CKDpuiph/qfGHnld/v3g8aduKTDN5n9Tyj0RUoIyyTpwJKy19F8sTRL+ATpm994P02iV9hDYwYyuKjpSOcNvU9tFnPHb07jVVEyN87ZuKYjapGadNTGO9GSfb1WpjaJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdr2uVQYW6Y9Wc22dtnzZ2TsOAr+OvsjTCq3/FrAMLA=;
 b=dNInR9GNn/D5ZoWtDxyYvA320A8wnptJP33Plm1w5A2dDsKan0w91qGDHaczTmJZWB7q9Up+OU1b9id/jm40W2B3k1749TjPS/PkSyLWVUoPVKpVwWIR2rTA9YEnJ4fTyup7wflUDvJnaMDUf9KgAzSJCzfWUoCZmvQfsMvcXKCqOgGTDJIUaOYJTRIbGYWhErZbwTFV7NX5Ir9Kf5q4gwpDUQsMS8ocSHBYHUhW8IModtDcDbNqyQZY8QGi2RHouJf+7ZA9uk4jLLLhjNxf7W+kxI1EnhawVfgl7UqddKSmrC8mKJ5niEiP1wBAcfYx7CJKQeQVZkcTnQ0nEJ/bCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdr2uVQYW6Y9Wc22dtnzZ2TsOAr+OvsjTCq3/FrAMLA=;
 b=M78ywajae+xyswUSQUJZDMDZr0jDB1OcSCqAYqVRwFJ1tYsmBjATpfBL6aLH7/NNDfMk/37v6bmSbVwmS6L2SLz2y9ApDlburaZxTAW3AvcmkJi4cf0Ar1/qcW4Vkx+13DhSk0JpBcNlKX6DkJcQavV6HerMFlOfVsjmRaikK5g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6709.eurprd08.prod.outlook.com (2603:10a6:20b:395::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 22:10:15 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Wed, 21 Apr 2021
 22:10:15 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
 eesposit@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH] block: simplify write-threshold and drop write notifiers
Date: Thu, 22 Apr 2021 01:09:50 +0300
Message-Id: <20210421220950.105017-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR05CA0235.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR05CA0235.eurprd05.prod.outlook.com (2603:10a6:3:fb::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 22:10:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d2c00a2-fbd4-4011-d9eb-08d905123dbd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6709C60AF0D4D75543F7BC92C1479@AS8PR08MB6709.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: diCU/LFVijVfPfbIWTogHhxmxL18dTg7VCtBcmHSh/kb9dO1uTIRNwTiqJAdhwxwa7GfvKKGBhaiWt5INtyWA1UxcSo8iFuVQTLKqEfqPOIqiIDMZa4wulPLtqe7WeR8mo2I6rTT5Ady5OhQ0f2r1MLlGy4tvAvjRVPuB9oA90hCE2TzilwXHeH8SGq4FB/BUcU9L8gsgUyNUOIJUend29150E8jfnQB20i2yYa95mnxrA6rcJ6L5DFuA5a4bqU78fMIQauIsXmBgDL6u3lZTWB1MVEVfpng17IOGB6QVU3F82zh86SZDHY+h77Rk/KjSEX49JkIkToQLGtti6ILtLnOEUwqoYZneO+W/LocR0RXpqQsSyhTsKjWjqtc7jSgz1RNUMRm7dqCc41zWOASJWhtroE6egDV92lpUCUUeaZH1LnnFktVfgn+z68YeM5i0C6p+ZhaPOqDnn60DBSqJdheDVw29NB9nW2dYc8qaY8elbKhZsfdxx1Pmb3gw1yQOe/m8HY8hxcwEoGKJNDwIQ0EfCGb5iHC6E4oSIcSO157lsO64PwvPTfkcQ50l4gbXt8luSVwUNmZG5PxaIfnCPsz4cHfgKQoQkdO3KFXKrEvo3f+gIYGcM9QEkN5ll4lAbMOgTo+AiJg19/0BLorJjIQeFxw/r6SHjj+l5djownfrCVjB5pmoGGjeLxGvUql
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39830400003)(376002)(396003)(366004)(5660300002)(6916009)(316002)(86362001)(6506007)(8936002)(66476007)(6486002)(38100700002)(107886003)(66556008)(66946007)(36756003)(6666004)(52116002)(478600001)(2906002)(4326008)(83380400001)(26005)(16526019)(8676002)(38350700002)(2616005)(186003)(1076003)(6512007)(956004)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YU+V7CrVrZV3kTwjSxA3wK69aJNrpW1e4E07qWoYLIwxEN6+NpUIxaDvdudG?=
 =?us-ascii?Q?vtvqGLIePlHlpMqfWVVpBMverXyX1s1of9N00/LhcXizwHhmOdUmaQupJ/5K?=
 =?us-ascii?Q?ci01VYIk3ygmBMBlueJcPWXCEDCKJ9TCpHQ0fZUr1713uk7/aNGdQdA5yFuk?=
 =?us-ascii?Q?Rn1ixGNOTynFuR9kkBsL/+l6/KJbFvjfUOEPP9DS95j1Juh9BePwPHQYHjgV?=
 =?us-ascii?Q?qxaW5fYytKwRsHi3QfiWLdCVcK7+fpWoXi3wfOP1JYQb+9RjP5QJPfZtR2po?=
 =?us-ascii?Q?N6GQThwptEHntlpBiHkgWfgZyEQ/DS7/IC8YMCYuxh9lXCoYAPALh6kfq71r?=
 =?us-ascii?Q?cX6p1/pUhcYhQ3jfsPxmtHA0GAq1Z0BRxyqcodXkMUieFJlAbYf4jOedVTJF?=
 =?us-ascii?Q?dGjpOi9VtSUEq8t5gZmvlek72DAbzoPCd9EXL0qiwlhtGhJ2/9E6b03MMUdq?=
 =?us-ascii?Q?+NILMC7Y6jp5w122RJhTvoKNnDgKN1+X8vqFasEXOJpt/VWrp1pRK8tDvCZM?=
 =?us-ascii?Q?hf0ePnz3QJxQsVGKVAzBs17iwRnsKnxXctD4jFkApPSfw5c6fQW97QnTR6tf?=
 =?us-ascii?Q?qnZXMs81RAqglXyjmPhg9SbSds/qXZF1Q/XkPTIrtcDkoi8pa9ktnfjJr6id?=
 =?us-ascii?Q?SlgsgH+cgYl//ZO9cs8Lb0yFqbwrsSwVZrQHnEwNll88ED0CdW/cHc0E/lYc?=
 =?us-ascii?Q?IPbi3cSgCLlwhfPSWwqkosYSTGVZwfRJhdAj2nJd/JOlXvXiLIrRp7DHk5w0?=
 =?us-ascii?Q?183pPJhBOqcIhH+4XKf95fa7TTqWnAsIQbnAFRmSxuPFPzLhiJQO3CwQigGO?=
 =?us-ascii?Q?dB/6akAsx2IsgIG5E/Z12UTcEEd56WTpGjArkuikVhXPoRfB1npW+rwdn9Tt?=
 =?us-ascii?Q?42926zxxhaoiwTJ9jHrY6vExPsvij/UJ5Dx4l23VdR2HHHBFVQ+Dbkhx3o49?=
 =?us-ascii?Q?ZY+/qlwT41W2zqzHoalfGQHyzZjKq8T+0WL3oVFO0toCui2c2z1AYIYyWlNc?=
 =?us-ascii?Q?Dhu+7AukmUwrhG4k3Zo33U7oaD8f3jGjWK28tgE8KSl/mhSWtLZGezBBcTx9?=
 =?us-ascii?Q?TaHWsV/kh5G/cIWy9tTfvCxt7GFNsGrVIL0VMjfhCdyLdlJcJ4H0R+znVMWL?=
 =?us-ascii?Q?ZGNfUkxmV+SI1N6aYHqARD/XW+wZmIK5EZ10ab4WScum/R2tBF5B5BTkJbpV?=
 =?us-ascii?Q?Divhu6uBioyUg0fUBH3KIr7iSd6AFIr4exWH7tCZYy2pE1PxbAXhmDKRPrHr?=
 =?us-ascii?Q?lzZnAp5HZp9WWetoWy7Linvr8eA7GaZleTafi/gz/EbLcnOORFRS/hfvONb6?=
 =?us-ascii?Q?CQ+twdp2CU0U8pa8LRn5x/g+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2c00a2-fbd4-4011-d9eb-08d905123dbd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 22:10:15.5079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LcXYQIgrZuoWWycFDZFhvnfEzbq0EZJcqmVe+xNIhJjNi20GC5hC4/gdNaiXZi1UICotIHjbRSxC2xk0eatIlqC/5pBDn0X3GEjerDApm9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6709
Received-SPF: pass client-ip=40.107.1.91;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

write-notifiers are used only for write-threshold. New code for such
purpose should create filters.

Let's handle write-threshold simply in generic code and drop write
notifiers at all.

Also move part of write-threshold API that is used only for testing to
the test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

I agree that this could be split into 2-3 parts and not combining
everything into one. But I'm tired now. I can send v2 if needed, so
consider it as RFC. Or take as is if you think it's not too much-in-one.

I also suggest this as a prepartion (and partly substitution) for
"[PATCH v2 0/8] Block layer thread-safety, continued"

 include/block/block_int.h         | 12 -----
 include/block/write-threshold.h   | 24 ---------
 block.c                           |  1 -
 block/io.c                        | 21 +++++---
 block/write-threshold.c           | 87 ++-----------------------------
 tests/unit/test-write-threshold.c | 38 ++++++++++++++
 6 files changed, 54 insertions(+), 129 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..50af58af75 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -957,12 +957,8 @@ struct BlockDriverState {
      */
     int64_t total_sectors;
 
-    /* Callback before write request is processed */
-    NotifierWithReturnList before_write_notifiers;
-
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
-    NotifierWithReturn write_threshold_notifier;
 
     /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
      * Reading from the list can be done with either the BQL or the
@@ -1087,14 +1083,6 @@ void bdrv_parse_filename_strip_prefix(const char *filename, const char *prefix,
 bool bdrv_backing_overridden(BlockDriverState *bs);
 
 
-/**
- * bdrv_add_before_write_notifier:
- *
- * Register a callback that is invoked before write requests are processed but
- * after any throttling or waiting for overlapping requests.
- */
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier);
 
 /**
  * bdrv_add_aio_context_notifier:
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index c646f267a4..23e1bfc123 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -35,28 +35,4 @@ void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes);
  */
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs);
 
-/*
- * bdrv_write_threshold_is_set
- *
- * Tell if a write threshold is set for a given BDS.
- */
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
-
-/*
- * bdrv_write_threshold_exceeded
- *
- * Return the extent of a write request that exceeded the threshold,
- * or zero if the request is below the threshold.
- * Return zero also if the threshold was not set.
- *
- * NOTE: here we assume the following holds for each request this code
- * deals with:
- *
- * assert((req->offset + req->bytes) <= UINT64_MAX)
- *
- * Please not there is *not* an actual C assert().
- */
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req);
-
 #endif
diff --git a/block.c b/block.c
index c5b887cec1..001453105e 100644
--- a/block.c
+++ b/block.c
@@ -381,7 +381,6 @@ BlockDriverState *bdrv_new(void)
     for (i = 0; i < BLOCK_OP_TYPE_MAX; i++) {
         QLIST_INIT(&bs->op_blockers[i]);
     }
-    notifier_with_return_list_init(&bs->before_write_notifiers);
     qemu_co_mutex_init(&bs->reqs_lock);
     qemu_mutex_init(&bs->dirty_bitmap_mutex);
     bs->refcnt = 1;
diff --git a/block/io.c b/block/io.c
index ca2dca3007..e0aa775952 100644
--- a/block/io.c
+++ b/block/io.c
@@ -36,6 +36,8 @@
 #include "qemu/main-loop.h"
 #include "sysemu/replay.h"
 
+#include "qapi/qapi-events-block-core.h"
+
 /* Maximum bounce buffer for copy-on-read and write zeroes, in bytes */
 #define MAX_BOUNCE_BUFFER (32768 << BDRV_SECTOR_BITS)
 
@@ -1974,6 +1976,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
            child->perm & BLK_PERM_RESIZE);
 
     switch (req->type) {
+        uint64_t write_threshold;
+
     case BDRV_TRACKED_WRITE:
     case BDRV_TRACKED_DISCARD:
         if (flags & BDRV_REQ_WRITE_UNCHANGED) {
@@ -1981,8 +1985,15 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
         } else {
             assert(child->perm & BLK_PERM_WRITE);
         }
-        return notifier_with_return_list_notify(&bs->before_write_notifiers,
-                                                req);
+        write_threshold = qatomic_read(&bs->write_threshold_offset);
+        if (write_threshold > 0 && offset + bytes > write_threshold) {
+            qapi_event_send_block_write_threshold(
+                bs->node_name,
+                offset + bytes - write_threshold,
+                write_threshold);
+            qatomic_set(&bs->write_threshold_offset, 0);
+        }
+        return 0;
     case BDRV_TRACKED_TRUNCATE:
         assert(child->perm & BLK_PERM_RESIZE);
         return 0;
@@ -3137,12 +3148,6 @@ bool bdrv_qiov_is_aligned(BlockDriverState *bs, QEMUIOVector *qiov)
     return true;
 }
 
-void bdrv_add_before_write_notifier(BlockDriverState *bs,
-                                    NotifierWithReturn *notifier)
-{
-    notifier_with_return_list_add(&bs->before_write_notifiers, notifier);
-}
-
 void bdrv_io_plug(BlockDriverState *bs)
 {
     BdrvChild *child;
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 85b78dc2a9..9bf4287c6e 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -21,104 +21,23 @@
 
 uint64_t bdrv_write_threshold_get(const BlockDriverState *bs)
 {
-    return bs->write_threshold_offset;
-}
-
-bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
-{
-    return bs->write_threshold_offset > 0;
-}
-
-static void write_threshold_disable(BlockDriverState *bs)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        notifier_with_return_remove(&bs->write_threshold_notifier);
-        bs->write_threshold_offset = 0;
-    }
-}
-
-uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
-                                       const BdrvTrackedRequest *req)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (req->offset > bs->write_threshold_offset) {
-            return (req->offset - bs->write_threshold_offset) + req->bytes;
-        }
-        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
-            return (req->offset + req->bytes) - bs->write_threshold_offset;
-        }
-    }
-    return 0;
-}
-
-static int coroutine_fn before_write_notify(NotifierWithReturn *notifier,
-                                            void *opaque)
-{
-    BdrvTrackedRequest *req = opaque;
-    BlockDriverState *bs = req->bs;
-    uint64_t amount = 0;
-
-    amount = bdrv_write_threshold_exceeded(bs, req);
-    if (amount > 0) {
-        qapi_event_send_block_write_threshold(
-            bs->node_name,
-            amount,
-            bs->write_threshold_offset);
-
-        /* autodisable to avoid flooding the monitor */
-        write_threshold_disable(bs);
-    }
-
-    return 0; /* should always let other notifiers run */
-}
-
-static void write_threshold_register_notifier(BlockDriverState *bs)
-{
-    bs->write_threshold_notifier.notify = before_write_notify;
-    bdrv_add_before_write_notifier(bs, &bs->write_threshold_notifier);
-}
-
-static void write_threshold_update(BlockDriverState *bs,
-                                   int64_t threshold_bytes)
-{
-    bs->write_threshold_offset = threshold_bytes;
+    return qatomic_read(&bs->write_threshold_offset);
 }
 
 void bdrv_write_threshold_set(BlockDriverState *bs, uint64_t threshold_bytes)
 {
-    if (bdrv_write_threshold_is_set(bs)) {
-        if (threshold_bytes > 0) {
-            write_threshold_update(bs, threshold_bytes);
-        } else {
-            write_threshold_disable(bs);
-        }
-    } else {
-        if (threshold_bytes > 0) {
-            /* avoid multiple registration */
-            write_threshold_register_notifier(bs);
-            write_threshold_update(bs, threshold_bytes);
-        }
-        /* discard bogus disable request */
-    }
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
diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fc1c45a2eb..c2f4cd20d7 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -12,6 +12,44 @@
 #include "block/write-threshold.h"
 
 
+/*
+ * bdrv_write_threshold_is_set
+ *
+ * Tell if a write threshold is set for a given BDS.
+ */
+static bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
+{
+    return bs->write_threshold_offset > 0;
+}
+
+/*
+ * bdrv_write_threshold_exceeded
+ *
+ * Return the extent of a write request that exceeded the threshold,
+ * or zero if the request is below the threshold.
+ * Return zero also if the threshold was not set.
+ *
+ * NOTE: here we assume the following holds for each request this code
+ * deals with:
+ *
+ * assert((req->offset + req->bytes) <= UINT64_MAX)
+ *
+ * Please not there is *not* an actual C assert().
+ */
+static uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
+                                              const BdrvTrackedRequest *req)
+{
+    if (bdrv_write_threshold_is_set(bs)) {
+        if (req->offset > bs->write_threshold_offset) {
+            return (req->offset - bs->write_threshold_offset) + req->bytes;
+        }
+        if ((req->offset + req->bytes) > bs->write_threshold_offset) {
+            return (req->offset + req->bytes) - bs->write_threshold_offset;
+        }
+    }
+    return 0;
+}
+
 static void test_threshold_not_set_on_init(void)
 {
     uint64_t res;
-- 
2.29.2


