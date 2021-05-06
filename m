Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F0A375153
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 11:14:22 +0200 (CEST)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lea5N-0000pl-FZ
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 05:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZyA-0002Fj-Tp; Thu, 06 May 2021 05:06:56 -0400
Received: from mail-eopbgr60134.outbound.protection.outlook.com
 ([40.107.6.134]:38452 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leZy5-0002qw-Uh; Thu, 06 May 2021 05:06:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJop2oWOg5MRv90bOY5gGQOMxHrdMeELLT5U7hcD6LjLePryfyuY4DhUilLITP0Gdf3kHMh1teXjzK0whaRs7qQ79XCglm2A4Qw7jgc80YBGY6jvkJ2cf0mNreAGYmL2+f4uFobb1U8oRs5a4oHL5jO1QoAqIze0jBrDNk9gKASkDB3yIfN7MmrLqJ9SFy2pJr8pjZ209PXmPlTrKAQ90eJVGk+rOwkJzVPALgmDSgWheUhAYkvHqNu4Uqcq3vnLNnJFHsYBMDKGderGj9aQlIaQwITAjYrGFwWK6ZN8T1t3fwLybjfOGE2cShcXRvxblf9gBHGgNrgy9/XWwZECmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipnajDPxQi5JFjkMmqwu9zp0XRy/bvuDSis1eMOZO34=;
 b=FqygTFghmENaQaIPgWC85bV6EkVbepmquPsRRnNrlZ1kLPcNIxtI+0XZixN0hjHiFpRUaR0eAxp9yaM44OZDzud+odM4O9OSqz9PdnY4OTcGx5vUWYxT06S8skK2veJtY8U9F8a9PjM5JXrL3erYdKTAz+P52SqJKnXGidfDNTynqUq9l3KLu+EL8HlHlTo/OZG8/rS8OVFKTAMWR2uU+UFP1Kanjc0Yjuiwpg1vI4+f7AuZw/J++GvSlP3AZLxaE88i5wzj/SD8zeeevlcrUICTV6rgZqKdZxvzsp+n5Dgf8Kij/dE46N08EUTRvv4iXKCCXT9l7BSyonygNT3PTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipnajDPxQi5JFjkMmqwu9zp0XRy/bvuDSis1eMOZO34=;
 b=Sb88OkXczkZXVCopQGL++v5Q13Nk4tWzqYNFTuKR4RKDOxWqa/Urlr/j8kbouAdwaccOdJMAKHRv78WtDMcODNTo6CXfm5ExC4GR/aVJCc84w8BljWZ3QzPKs4uxB1vHd7qi++LfGZgCE/qChFDD7lBtNi3S4fAcmFQCJuO9Luw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6807.eurprd08.prod.outlook.com (2603:10a6:20b:395::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Thu, 6 May
 2021 09:06:40 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 09:06:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 eesposit@redhat.com, pbonzini@redhat.com
Subject: [PATCH v3 1/8] block/write-threshold: don't use write notifiers
Date: Thu,  6 May 2021 12:06:14 +0300
Message-Id: <20210506090621.11848-2-vsementsov@virtuozzo.com>
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
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 09:06:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5112c54c-fb08-40e7-542c-08d9106e428f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB680797CB3080722A5D057811C1589@AS8PR08MB6807.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NFQnTG78YiYQ1PPFQRnm5ObR+I2CJfRzAaxrt+6AOVKABouYiE8aVviyei1M8+eydI3+3Gm2nJzwVJ8NeHxCg2zZAXy1qLlmOFiRJOgAxGPz05r6bPNUWFPIB6/VkSj6d2USz+cTXBvS6IOFg0YgYYZsb3jb0cAJ5NZfNlKmZhRJyNqRD0crjdtCvreSjBrCDSPM1w4dNw3b/oRiiF0V4y3YCZjPQg0MT5IrLTE/lf/GaEIXTHLFZ1kUiDU508ry2S8813QbbJbuzHXuFLos2RWAa+qkwNRpjHck4/ePStxtsa2gwxxp9USVgnbUqAxyC7T40VMabyFLKqlfUubTjRva4nSF9epA8oR6liLmSx6rzNGrtJ6NOX4xSovWxlM0/Ya0XcdgONdmIZBYz+L8pXrnrjdDrTOHCm4tl2zm6sIQjg/cg0rhseY7oZTKDRFypa+WPlbmWuGtB9yiL2KWykGJtgvvRXuRF+KN0ebHMIgTJ3rjWsSKT+YfWCJtSS62w4XkBuc+odIdaPxFuk77XsQMajgAndwfB9tW/NilpumdauDZmKjTn68gzug6aaGIk5Pedrg2yCyNPFv4fW08TzLBLjGRoQK8SiPhZMD60nBrgAMsdSKOUj/9nf/TOdmlaRSRjNUB2zHiUOKbE31ZWri3AOqkGQ4PxjE+llE7kIaTNnZ/ptwPU7FPWX7u+VHz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(39830400003)(396003)(6486002)(38100700002)(6506007)(956004)(2616005)(66946007)(83380400001)(66476007)(38350700002)(4326008)(26005)(66556008)(86362001)(36756003)(1076003)(6666004)(478600001)(6916009)(5660300002)(2906002)(316002)(6512007)(8936002)(8676002)(186003)(16526019)(52116002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UqLcZRmwE6QvxGoNidGp6euBfMBG26kE0Xq2rYQstBDGJF0NJcr76Jw0fYFP?=
 =?us-ascii?Q?Rm5eZiqvYod+XG+LqkZmHajh5jTqAq/LNt467sTT2Tg+mceBnNckKhjVtrkx?=
 =?us-ascii?Q?NxJrOKDet2EliwK/1p0EBG163Aj0d5aj5QnhQL3byE6VrpVdARwdI6jKVXg1?=
 =?us-ascii?Q?mDf/0ia6yJ382sNpnjoEk35vB88eFTgkPPWxdTsAfl48PpJNUkKccWBkRPdL?=
 =?us-ascii?Q?kI7t08w3ePPexMqIWIjSMlpIgMf9gCdl7ETPcwSB5NFmZt6cpp/xuTwLeMJc?=
 =?us-ascii?Q?Vs9WK745tk/sX89hHHkt/39FH7tK7X3E8sqK1T/dw/721trNYQC5BW/bY7x/?=
 =?us-ascii?Q?Rw5+Fzt/RZAA6PEGwWMBB6Sh1nHbJWPfQTtlxZ5FAb3onwkAM69PajUBNEEV?=
 =?us-ascii?Q?LsRPU2p9QC2ZrDw2qfsDebx++hX3cl7ws25VQ/sEm+Y4YDzTEd48V8ySss7I?=
 =?us-ascii?Q?wzhrfcBPnOpDI+NnAtIV2yfrmBnd5MqN3bgC0GlTqPqxxxFExnnDdTfpVAFJ?=
 =?us-ascii?Q?NQmu5s2E2hg2fXeUCcMN5RMIWtcYnTUAn6NJ1Ii27ePXFvFRlfAokTNKVNaC?=
 =?us-ascii?Q?CZQaMcOCeUmrCseW5zbHeOf/Xc77UYjb07BVZeDmUt1L6t/oHBSwdxGrGpPl?=
 =?us-ascii?Q?g0fLP700V1jHc41UzKemf9d0Bp3/FgwaTYP7A+bLbAU+UXZjQ8IMmPz8dNz9?=
 =?us-ascii?Q?mla2Rux6ZmcjwN0XXMHmJ12ulQD5gNpb7X4UXGVP9mwOgg1yn3KKF37vrQoe?=
 =?us-ascii?Q?5PTKZzXK8qq0O7isbvi7bkk9CXq45+uBfAmO/QhnZzuaWLdkznma/ESQ1IVT?=
 =?us-ascii?Q?g9YegdJJ9YqbZ4wOLPWBNPfgWcSY4vkPzyMASvD4ephm7SjZ/xfxUWoNiuXC?=
 =?us-ascii?Q?xJ/vf6X0E4rfvb5DoX6py8LfAitO17EJV/xnsSV5OhqwdDTGrK48IsMat2dq?=
 =?us-ascii?Q?maHP41wNrSRTkkxU7sSdyxs8Mt/c5w/KUD2uRTOvBgg2xJD6YNcs4siPMEg6?=
 =?us-ascii?Q?iHCVLvsbxGiwkFUja3srGadAloGUnIaqf8o7da4s6KSShJ0XON3aUNJdzILm?=
 =?us-ascii?Q?D5kXDQOk5mL5PQttkk7+iWDmPbTtnVzUsvVpdwmqzuu1aw7ZeAWq5BQ/j6GP?=
 =?us-ascii?Q?3w6CFIqy/KgVrcMqLFvt6ATuY8emYHkmP8TRQJtnBbZiMdjklcgOyYKpFB94?=
 =?us-ascii?Q?/iuFYqIuIkxUntb/BpL912SkdGg9HHmZWnj2yEBzNOECh2JoU7CMojDGXZur?=
 =?us-ascii?Q?OHR814r3GZT/wAPDF6WD2dygM7iIDt1HtgHPlpJp2Mz3bX7wk23/JpQgsA6g?=
 =?us-ascii?Q?MiYDDEXOySGA53oq+7AY5+/y?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5112c54c-fb08-40e7-542c-08d9106e428f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 09:06:40.0225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBTVat4QgWKCaF0jedwgbRdiUriSuvepKPCi0p+GNak7NyQY6ZxmLWwP5AXfXs25rAQli+YdDGy83p5HYnFuqUGXoFzlCALhTa2H8skrYZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6807
Received-SPF: pass client-ip=40.107.6.134;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

write-notifiers are used only for write-threshold. New code for such
purpose should create filters.

Let's better special-case write-threshold and drop write notifiers at
all. (Actually, write-threshold is special-cased anyway, as the only
user of write-notifiers)

So, create a new direct interface for bdrv_co_write_req_prepare() and
drop all write-notifier related logic from write-threshold.c.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block_int.h       |  1 -
 include/block/write-threshold.h |  9 +++++
 block/io.c                      |  5 ++-
 block/write-threshold.c         | 70 +++++++--------------------------
 4 files changed, 27 insertions(+), 58 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index c823f5b1b3..51f51286a5 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -959,7 +959,6 @@ struct BlockDriverState {
 
     /* threshold limit for writes, in bytes. "High water mark". */
     uint64_t write_threshold_offset;
-    NotifierWithReturn write_threshold_notifier;
 
     /* Writing to the list requires the BQL _and_ the dirty_bitmap_mutex.
      * Reading from the list can be done with either the BQL or the
diff --git a/include/block/write-threshold.h b/include/block/write-threshold.h
index c646f267a4..555afd0de6 100644
--- a/include/block/write-threshold.h
+++ b/include/block/write-threshold.h
@@ -59,4 +59,13 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs);
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req);
 
+/*
+ * bdrv_write_threshold_check_write
+ *
+ * Check whether the specified request exceeds the write threshold.
+ * If it is, send corresponding event and disable write threshold checking.
+ */
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes);
+
 #endif
diff --git a/block/io.c b/block/io.c
index 35b6c56efc..3520de51bb 100644
--- a/block/io.c
+++ b/block/io.c
@@ -30,6 +30,7 @@
 #include "block/blockjob_int.h"
 #include "block/block_int.h"
 #include "block/coroutines.h"
+#include "block/write-threshold.h"
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
@@ -2008,8 +2009,8 @@ bdrv_co_write_req_prepare(BdrvChild *child, int64_t offset, int64_t bytes,
         } else {
             assert(child->perm & BLK_PERM_WRITE);
         }
-        return notifier_with_return_list_notify(&bs->before_write_notifiers,
-                                                req);
+        bdrv_write_threshold_check_write(bs, offset, bytes);
+        return 0;
     case BDRV_TRACKED_TRUNCATE:
         assert(child->perm & BLK_PERM_RESIZE);
         return 0;
diff --git a/block/write-threshold.c b/block/write-threshold.c
index 85b78dc2a9..71df3c434f 100644
--- a/block/write-threshold.c
+++ b/block/write-threshold.c
@@ -29,14 +29,6 @@ bool bdrv_write_threshold_is_set(const BlockDriverState *bs)
     return bs->write_threshold_offset > 0;
 }
 
-static void write_threshold_disable(BlockDriverState *bs)
-{
-    if (bdrv_write_threshold_is_set(bs)) {
-        notifier_with_return_remove(&bs->write_threshold_notifier);
-        bs->write_threshold_offset = 0;
-    }
-}
-
 uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
                                        const BdrvTrackedRequest *req)
 {
@@ -51,55 +43,9 @@ uint64_t bdrv_write_threshold_exceeded(const BlockDriverState *bs,
     return 0;
 }
 
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
-}
-
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
+    bs->write_threshold_offset = threshold_bytes;
 }
 
 void qmp_block_set_write_threshold(const char *node_name,
@@ -122,3 +68,17 @@ void qmp_block_set_write_threshold(const char *node_name,
 
     aio_context_release(aio_context);
 }
+
+void bdrv_write_threshold_check_write(BlockDriverState *bs, int64_t offset,
+                                      int64_t bytes)
+{
+    int64_t end = offset + bytes;
+    uint64_t wtr = bs->write_threshold_offset;
+
+    if (wtr > 0 && end > wtr) {
+        qapi_event_send_block_write_threshold(bs->node_name, end - wtr, wtr);
+
+        /* autodisable to avoid flooding the monitor */
+        bdrv_write_threshold_set(bs, 0);
+    }
+}
-- 
2.29.2


