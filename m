Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C479D323AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:50:35 +0100 (CET)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErkY-0000tj-Qp
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:50:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhj-0006sJ-U0; Wed, 24 Feb 2021 05:47:39 -0500
Received: from mail-eopbgr80124.outbound.protection.outlook.com
 ([40.107.8.124]:36517 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lErhh-0007Jd-Ao; Wed, 24 Feb 2021 05:47:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giHosXqtz+6VxLHQ8U3S+mf4b7cYV3tS4Z8HWTIZjmyuFTBja+STGeKQ1iZaQ24/fimu4tTHR3Z/KRacbf2ucyowOC1+AuPxqSYnHQK6BvXkhw3L33vAPpPcO4WNFiL74EunwXXPzOlJEp2AHPXtblu+ERBjRZtS8zKn7bMAKzZ+LDCLSiFhvxZguFoZ7kkItV5qCxure0Qc8jtzYtgcouIT0v24h4zanlfAWvJ/lnVUexhSQ3DYjM8rvy93nsaUYuBSDUG04kHr6qSB4l8nhuIgktwz3tU2MlSuaAv5Xijn5YRnaRbJtqXGjDOlFVYTWVVcWxfiyUDci3Twlyy2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZAXcbUYWuNxT7W78l3oP7eQ/GspDYC8NL3NhRFJJ+0=;
 b=FHjVkk+MnfJobr0u6mHB8xnl2JLkebFcu1e7hspZxlIbneHfhFGeKfFsQwZaJDf9PZUrLO/C+XGWeoflNnBMRFa9RvPpTun7tiSjaRlDPAH9MT+9wTakmQD92+d3TMOPVjf64yOi65eCSQSIs2Ek21q3zMCN73QrSXRbMn/0U9XRu/jYspjgHvqGsR8PtMr4wbY2f1o1P5lm0/KvRqGwxBU6K1IM3Yd9EKN+PL72lzMVQNDGw30/WYWIrwSQs0ylHp0bhp3nDF4A6lfdHaTW45mOCoFWBN/GMayEZafS607sbR9RW2wvFpWa8UzlJH4oOAHLeVeg3bmm8Vo8i3u+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZAXcbUYWuNxT7W78l3oP7eQ/GspDYC8NL3NhRFJJ+0=;
 b=Z4UUdOOwhNxNkBBqX08H2sdZH5llCPwPfwtP7LhEXjm+1FvU7yPjsd+4DGvYJcVbMQ2u4eA1/v5zK3YQLaTsT5U8cJQDhmfWwWNx+LLQPwMZk1yWVdyQbQmrYHqh1U/qytkFOoGoh3COlXorBpKmvTtAQv7KagX36GoN/lqB5dQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4951.eurprd08.prod.outlook.com (2603:10a6:20b:eb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 10:47:30 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3868.032; Wed, 24 Feb 2021
 10:47:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH v2 4/6] parallels: support bitmap extension for read-only mode
Date: Wed, 24 Feb 2021 13:47:05 +0300
Message-Id: <20210224104707.88430-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: HE1PR05CA0177.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::25) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.244) by
 HE1PR05CA0177.eurprd05.prod.outlook.com (2603:10a6:3:f8::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 10:47:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e833fb6e-ef3d-4404-bd7c-08d8d8b1954b
X-MS-TrafficTypeDiagnostic: AM6PR08MB4951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4951C261486C52EFA92C07CDC19F9@AM6PR08MB4951.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: knjKqh6t5JvgONklzKXUfVP+uHiJf58LCjLirjmMQHHyOuw+d+0ws0rUFf6UuHQOsxQP4JCefj6QeKvjs3SMm2GtwJEQutXZ6H/s+7cuEd4AYSnFgEDDlz4Wqgw2miylYbLMRtBGhXpfrwui9mh1B1wXM/YQaf66cWrj3VhMhb27pH5wSaDhh7sLUMyGivP6vN2kOB9qWXuRbfTA0hyKi8h8gPv67trhwWDRZsGUmwdl4GrVFnYvtI5mBf6z0WtgukdiuFlCAMS143927xYX9qDz5WU3FFDqEZmIFN/3mbGoX1tYiekflICXIPFhbhNbHjE7B1lDznc3kvq06nKZtQZPRUPLw4o+Qyh7ONiFh+4kiY2sSQ7mUU2JVCdVhMICQ1hfIl+KMVdddUGzJGMLc24YjtseRabfty+sLHlKZYcGuQktVGWLy6QKLWUew4dt7nnsZ7ULFtoJnhc+1d6G6HZva6CV26ZVAQKBP1kzxiHm6JYUqznfhd4a8jef8OEm64bdDwdsT2HiI6V4qjwAsAwg592Jilb9LdDW6Yx3MKcssJ6DbyANwotw8j4ze4aX7kJdpGCOGHcNMUEhj2492Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(136003)(376002)(366004)(396003)(186003)(956004)(2616005)(36756003)(66946007)(2906002)(8936002)(6916009)(26005)(83380400001)(8676002)(16526019)(5660300002)(316002)(30864003)(52116002)(6506007)(86362001)(4326008)(6512007)(478600001)(6486002)(1076003)(66556008)(69590400012)(66476007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NV9SZCx0uyaq2Ad6n5PHoBbp8UYegzvGexwbtNNWXiD98K49Ousa6KsEOY/e?=
 =?us-ascii?Q?3toNiQVchm7ap9rrhE7m6hhTo0jiNhkhgMHV4jqnwir3fDuDHWA2KS4mWKRh?=
 =?us-ascii?Q?pMcY1UrzKuR8TUuDsk1doz88zRwCvY1x7Vk4RbsHd4XkOx9H+tUPSpjtDILA?=
 =?us-ascii?Q?sakoLnkW8+a1pSduLEDYsoEj6QjsCT7Zq3XqSeSi/b6727JJjJZ6mmHKOXZA?=
 =?us-ascii?Q?zyRvdgUrmrmw37zMGfv6l/O4sgJIOsZfFU9m/dp3ULNIn1DR0iui/E9ZQku5?=
 =?us-ascii?Q?sSWkSxk/+ZjGo1wqFAMK4bfjLeXT6FqARTa1GKh6alStHZhUEnD5YLPeMrHM?=
 =?us-ascii?Q?dIkW4IX87Q+ip1H5fdcAGPl+HPcDdU7PmqSuNNXrR4VJOi5vGx3cRBiSWXii?=
 =?us-ascii?Q?IFmdm5AjE3rKmGijqxIsLnU1yB7MQManb+SiAA8YA3bAJCxAlRzEhGghhMzh?=
 =?us-ascii?Q?cGr2K7Y8e4RD1n9msO7V1SOvsRBSJv1eJDNEUAa0KNWFKHTu2/b3Vs+Gu6M5?=
 =?us-ascii?Q?T4jSnTvvgeyC8m80ZrLnt5sAJl0/ateNYf1HWCGVneSGMI1JpMJQ0qt2Xfeq?=
 =?us-ascii?Q?+LusayR8SjE1w3kYLnk86NkjyOZbIudtzpZTns39cYGzEfrkDeerGl8qIhpD?=
 =?us-ascii?Q?187oulHqZZI40dF8MJavWSiE4OMgfpOomoe2eHijk0UGJSNM/kG+gKQ8BFil?=
 =?us-ascii?Q?klIQBARCFUPWR9V71Uxcb870ZVkKgTkw8MooPgS4Qj8uz5igG/Rhy0jopBNF?=
 =?us-ascii?Q?X1ZP4pdQ3OaG1SPOR+/WOA3+4PB9unFw2gQVkJ3yyiqaB+weo2BFnrhGv/ml?=
 =?us-ascii?Q?e85cR+3mmX1gZ26JOwZc52fvyAUtUObirPPQUFUejQ4P/hfq+Vq7MXW917b1?=
 =?us-ascii?Q?oOE9xTnAce6iFY3IOAu09XxVGwlJA83GWAoZ5oeuo6nMDe1QKCyhlY4msMVF?=
 =?us-ascii?Q?ZqkRIbVRBnHkxtni8sfhxQSAo0gPFsHIPlt9yBRYVxmhhqHiRydmq37jySEv?=
 =?us-ascii?Q?dtvC00+qstIVZb6EDru28YFbqAvx4dxdWyfgKzpHr28AHvSEYYhzT8XhCtqw?=
 =?us-ascii?Q?U3mrgQZnhJNcyhuLSbRRPhtHQLot30IDdnUG9k+oeghsBRgXvQmBE/DvbBmP?=
 =?us-ascii?Q?i8mMNl9eVsqmUNa7VmFptg+6Pd2/rfyfMnbh7KiuGNnxKtVyJg98+29DTXBV?=
 =?us-ascii?Q?G0z4fVtbiHiH7q9SefFUGsiFVSeg7mAKFPrzLKZqfnQqK0wslsOzcP+mkYR+?=
 =?us-ascii?Q?wm0j7QN3QQvh05IMOfZBfuW9ua3I4y6iOgIaiVuhhp/EASM+OrWmmEacvbGp?=
 =?us-ascii?Q?zUTwDJz2o7DhzgGjE9WmwrZV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e833fb6e-ef3d-4404-bd7c-08d8d8b1954b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 10:47:30.1223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXOIVmna3D4TmC84E9teUTr+wNNvY1CjhyxtKjMKrrEqzHeBsUwfhMcNvEkCeWdJbS9XxZmtDHuwWKbFsbsRYeERwgLOOCuAYS5MvYrb5Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4951
Received-SPF: pass client-ip=40.107.8.124;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/parallels.h     |   6 +-
 block/parallels-ext.c | 300 ++++++++++++++++++++++++++++++++++++++++++
 block/parallels.c     |  18 +++
 block/meson.build     |   3 +-
 4 files changed, 325 insertions(+), 2 deletions(-)
 create mode 100644 block/parallels-ext.c

diff --git a/block/parallels.h b/block/parallels.h
index 9a9209e320..f22f43f988 100644
--- a/block/parallels.h
+++ b/block/parallels.h
@@ -48,7 +48,8 @@ typedef struct ParallelsHeader {
     uint64_t nb_sectors;
     uint32_t inuse;
     uint32_t data_off;
-    char padding[12];
+    uint32_t flags;
+    uint64_t ext_off;
 } QEMU_PACKED ParallelsHeader;
 
 typedef enum ParallelsPreallocMode {
@@ -85,4 +86,7 @@ typedef struct BDRVParallelsState {
     Error *migration_blocker;
 } BDRVParallelsState;
 
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp);
+
 #endif
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
new file mode 100644
index 0000000000..e0dd0975c6
--- /dev/null
+++ b/block/parallels-ext.c
@@ -0,0 +1,300 @@
+/*
+ * Support of Parallels Format Extension. It's a part of Parallels format
+ * driver.
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "parallels.h"
+#include "crypto/hash.h"
+#include "qemu/uuid.h"
+
+#define PARALLELS_FORMAT_EXTENSION_MAGIC 0xAB234CEF23DCEA87ULL
+
+#define PARALLELS_END_OF_FEATURES_MAGIC 0x0ULL
+#define PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC 0x20385FAE252CB34AULL
+
+typedef struct ParallelsFormatExtensionHeader {
+    uint64_t magic; /* PARALLELS_FORMAT_EXTENSION_MAGIC */
+    uint8_t check_sum[16];
+} QEMU_PACKED ParallelsFormatExtensionHeader;
+
+typedef struct ParallelsFeatureHeader {
+    uint64_t magic;
+    uint64_t flags;
+    uint32_t data_size;
+    uint32_t _unused;
+} QEMU_PACKED ParallelsFeatureHeader;
+
+typedef struct ParallelsDirtyBitmapFeature {
+    uint64_t size;
+    uint8_t id[16];
+    uint32_t granularity;
+    uint32_t l1_size;
+    /* L1 table follows */
+} QEMU_PACKED ParallelsDirtyBitmapFeature;
+
+/* Given L1 table read bitmap data from the image and populate @bitmap */
+static int parallels_load_bitmap_data(BlockDriverState *bs,
+                                      const uint64_t *l1_table,
+                                      uint32_t l1_size,
+                                      BdrvDirtyBitmap *bitmap,
+                                      Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret = 0;
+    uint64_t offset, limit;
+    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
+    uint8_t *buf = NULL;
+    uint64_t i, tab_size =
+        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
+                     s->cluster_size);
+
+    if (tab_size != l1_size) {
+        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
+                   "to bitmap size and cluster size. Expected %" PRIu64,
+                   l1_size, tab_size);
+        return -EINVAL;
+    }
+
+    buf = qemu_blockalign(bs, s->cluster_size);
+    limit = bdrv_dirty_bitmap_serialization_coverage(s->cluster_size, bitmap);
+    for (i = 0, offset = 0; i < tab_size; ++i, offset += limit) {
+        uint64_t count = MIN(bm_size - offset, limit);
+        uint64_t entry = l1_table[i];
+
+        if (entry == 0) {
+            /* No need to deserialize zeros because @bitmap is cleared. */
+            continue;
+        }
+
+        if (entry == 1) {
+            bdrv_dirty_bitmap_deserialize_ones(bitmap, offset, count, false);
+        } else {
+            ret = bdrv_pread(bs->file, entry << BDRV_SECTOR_BITS, buf,
+                             s->cluster_size);
+            if (ret < 0) {
+                error_setg_errno(errp, -ret,
+                                 "Failed to read bitmap data cluster");
+                goto finish;
+            }
+            bdrv_dirty_bitmap_deserialize_part(bitmap, buf, offset, count,
+                                               false);
+        }
+    }
+    ret = 0;
+
+    bdrv_dirty_bitmap_deserialize_finish(bitmap);
+
+finish:
+    qemu_vfree(buf);
+
+    return ret;
+}
+
+/*
+ * @data buffer (of @data_size size) is the Dirty bitmaps feature which
+ * consists of ParallelsDirtyBitmapFeature followed by L1 table.
+ */
+static BdrvDirtyBitmap *parallels_load_bitmap(BlockDriverState *bs,
+                                              uint8_t *data,
+                                              size_t data_size,
+                                              Error **errp)
+{
+    int ret;
+    ParallelsDirtyBitmapFeature bf;
+    g_autofree uint64_t *l1_table = NULL;
+    BdrvDirtyBitmap *bitmap;
+    QemuUUID uuid;
+    char uuidstr[UUID_FMT_LEN + 1];
+    int i;
+
+    if (data_size < sizeof(bf)) {
+        error_setg(errp, "Too small Bitmap Feature area in Parallels Format "
+                   "Extension: %zu bytes, expected at least %zu bytes",
+                   data_size, sizeof(bf));
+        return NULL;
+    }
+    memcpy(&bf, data, sizeof(bf));
+    bf.size = le64_to_cpu(bf.size);
+    bf.granularity = le32_to_cpu(bf.granularity) << BDRV_SECTOR_BITS;
+    bf.l1_size = le32_to_cpu(bf.l1_size);
+    data += sizeof(bf);
+    data_size -= sizeof(bf);
+
+    if (bf.size != bs->total_sectors) {
+        error_setg(errp, "Bitmap size (in sectors) %" PRId64 " differs from "
+                   "disk size in sectors %" PRId64, bf.size, bs->total_sectors);
+        return NULL;
+    }
+
+    if (bf.l1_size * sizeof(uint64_t) > data_size) {
+        error_setg(errp, "Bitmaps feature corrupted: l1 table exceeds "
+                   "extension data_size");
+        return NULL;
+    }
+
+    memcpy(&uuid, bf.id, sizeof(uuid));
+    qemu_uuid_unparse(&uuid, uuidstr);
+    bitmap = bdrv_create_dirty_bitmap(bs, bf.granularity, uuidstr, errp);
+    if (!bitmap) {
+        return NULL;
+    }
+
+    l1_table = g_new(uint64_t, bf.l1_size);
+    for (i = 0; i < bf.l1_size; i++, data += sizeof(uint64_t)) {
+        l1_table[i] = ldq_le_p(data);
+    }
+
+    ret = parallels_load_bitmap_data(bs, l1_table, bf.l1_size, bitmap, errp);
+    if (ret < 0) {
+        bdrv_release_dirty_bitmap(bitmap);
+        return NULL;
+    }
+
+    /* We support format extension only for RO parallels images. */
+    assert(!(bs->open_flags & BDRV_O_RDWR));
+    bdrv_dirty_bitmap_set_readonly(bitmap, true);
+
+    return bitmap;
+}
+
+static int parallels_parse_format_extension(BlockDriverState *bs,
+                                            uint8_t *ext_cluster, Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+    int remaining = s->cluster_size;
+    uint8_t *pos = ext_cluster;
+    ParallelsFormatExtensionHeader eh;
+    g_autofree uint8_t *hash = NULL;
+    size_t hash_len = 0;
+    GSList *bitmaps = NULL, *el;
+
+    memcpy(&eh, pos, sizeof(eh));
+    eh.magic = le64_to_cpu(eh.magic);
+    pos += sizeof(eh);
+    remaining -= sizeof(eh);
+
+    if (eh.magic != PARALLELS_FORMAT_EXTENSION_MAGIC) {
+        error_setg(errp, "Wrong parallels Format Extension magic: 0x%" PRIx64
+                   ", expected: 0x%llx", eh.magic,
+                   PARALLELS_FORMAT_EXTENSION_MAGIC);
+        goto fail;
+    }
+
+    ret = qcrypto_hash_bytes(QCRYPTO_HASH_ALG_MD5, (char *)pos, remaining,
+                             &hash, &hash_len, errp);
+    if (ret < 0) {
+        goto fail;
+    }
+
+    if (hash_len != sizeof(eh.check_sum) ||
+        memcmp(hash, eh.check_sum, sizeof(eh.check_sum)) != 0) {
+        error_setg(errp, "Wrong checksum in Format Extension header. Format "
+                   "extension is corrupted.");
+        goto fail;
+    }
+
+    while (true) {
+        ParallelsFeatureHeader fh;
+        BdrvDirtyBitmap *bitmap;
+
+        if (remaining < sizeof(fh)) {
+            error_setg(errp, "Can not read feature header, as remaining bytes "
+                       "(%d) in Format Extension is less than Feature header "
+                       "size (%zu)", remaining, sizeof(fh));
+            goto fail;
+        }
+
+        memcpy(&fh, pos, sizeof(fh));
+        pos += sizeof(fh);
+        remaining -= sizeof(fh);
+
+        fh.magic = le64_to_cpu(fh.magic);
+        fh.flags = le64_to_cpu(fh.flags);
+        fh.data_size = le32_to_cpu(fh.data_size);
+
+        if (fh.flags) {
+            error_setg(errp, "Flags for extension feature are unsupported");
+            goto fail;
+        }
+
+        if (fh.data_size > remaining) {
+            error_setg(errp, "Feature data_size exceedes Format Extension "
+                       "cluster");
+            goto fail;
+        }
+
+        switch (fh.magic) {
+        case PARALLELS_END_OF_FEATURES_MAGIC:
+            return 0;
+
+        case PARALLELS_DIRTY_BITMAP_FEATURE_MAGIC:
+            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
+            if (!bitmap) {
+                goto fail;
+            }
+            bitmaps = g_slist_append(bitmaps, bitmap);
+            break;
+
+        default:
+            error_setg(errp, "Unknown feature: 0x%" PRIu64, fh.magic);
+            goto fail;
+        }
+
+        pos = ext_cluster + QEMU_ALIGN_UP(pos + fh.data_size - ext_cluster, 8);
+    }
+
+fail:
+    for (el = bitmaps; el; el = el->next) {
+        bdrv_release_dirty_bitmap(el->data);
+    }
+    g_slist_free(bitmaps);
+
+    return -EINVAL;
+}
+
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+    uint8_t *ext_cluster = qemu_blockalign(bs, s->cluster_size);
+
+    assert(ext_off > 0);
+
+    ret = bdrv_pread(bs->file, ext_off, ext_cluster, s->cluster_size);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Failed to read Format Extension cluster");
+        goto out;
+    }
+
+    ret = parallels_parse_format_extension(bs, ext_cluster, errp);
+
+out:
+    qemu_vfree(ext_cluster);
+
+    return ret;
+}
diff --git a/block/parallels.c b/block/parallels.c
index 9594d84978..6ebad2a2bb 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "block/block_int.h"
 #include "block/qdict.h"
@@ -843,6 +844,23 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         goto fail_options;
     }
 
+    if (ph.ext_off) {
+        if (flags & BDRV_O_RDWR) {
+            /*
+             * It's unsafe to open image RW if there is an extension (as we
+             * don't support it). But parallels driver in QEMU historically
+             * ignores the extension, so print warning and don't care.
+             */
+            warn_report("Format Extension ignored in RW mode");
+        } else {
+            ret = parallels_read_format_extension(
+                    bs, le64_to_cpu(ph.ext_off) << BDRV_SECTOR_BITS, errp);
+            if (ret < 0) {
+                goto fail;
+            }
+        }
+    }
+
     if ((flags & BDRV_O_RDWR) && !(flags & BDRV_O_INACTIVE)) {
         s->header->inuse = cpu_to_le32(HEADER_INUSE_MAGIC);
         ret = parallels_update_header(bs);
diff --git a/block/meson.build b/block/meson.build
index eeaefe5809..d21990ec95 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -57,7 +57,8 @@ block_ss.add(when: 'CONFIG_QED', if_true: files(
   'qed-table.c',
   'qed.c',
 ))
-block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'], if_true: files('parallels.c'))
+block_ss.add(when: [libxml2, 'CONFIG_PARALLELS'],
+             if_true: files('parallels.c', 'parallels-ext.c'))
 block_ss.add(when: 'CONFIG_WIN32', if_true: files('file-win32.c', 'win32-aio.c'))
 block_ss.add(when: 'CONFIG_POSIX', if_true: [files('file-posix.c'), coref, iokit])
 block_ss.add(when: libiscsi, if_true: files('iscsi-opts.c'))
-- 
2.29.2


