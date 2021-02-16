Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBD131CEA9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 18:08:44 +0100 (CET)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3q7-000595-1T
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 12:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3UX-0007E2-Bg; Tue, 16 Feb 2021 11:46:25 -0500
Received: from mail-eopbgr60108.outbound.protection.outlook.com
 ([40.107.6.108]:14830 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lC3UM-000776-O2; Tue, 16 Feb 2021 11:46:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB+eu3PXBCJNNzAZe+Y2xKcDAdVABIOcCUsfHQqEmWRsGOsPAVV8uWPVaJtgjYtR/w6CYAG3UM201at7bmN6GnojsZeDGeEWIrf3NoYqUwvi763SmA2cVO3oCnZgb/8I15dtPwW2sFRCzhWVzgh7Dpq0VXiJSZlTw6Lvfdx8v8R2/d05aguYSPOdIKecn3hRy4qrjLBBRYjbrgp7jBhvSA47LyPautnncpw6Q2W48wnp/d82bkEs4IH5BxFAJHLALX7H/UOejlqSNV+OsFAvcmR7eRUb46kMFssLu4QE37Du8Hv3WeFMZMTjfZKJ8eS4aO+htG7nGdmO/PKZWLEUjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuGU6TuagRtKV0lcjZFGdemn7Z7JhbICM9umZ7iyLok=;
 b=UCguwIjC00pWLeJjGZgAh8pyI3jCjEoQdzvbena+GoQzOpR+RJG0PT4Hn2JhJEzpTbKX25XhiIF76DKxOhKy4soKzwpa/3aaGzTUmb5DWaxgRAN/p6vgt9Tx/mSxqDX2vxkHMpFA4oAohV0wDAqLaCxaqXbBV3MMa9rcUeArSZ6a5npEosUwr4FTtRnTZNP4oRlho19vglqkMBbHiezf8xN0XSvLRIP4P4+pM28vHog1japMIlL9jKdZeyYlTdIrtsf4c06OPBoDVytfVUGQp8Z2Odmf1UN5CLuJQ75aAE5cbVlpzhrombWTQYZmOOP9c1u0K/HeVAxKKPJxDN3xJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuGU6TuagRtKV0lcjZFGdemn7Z7JhbICM9umZ7iyLok=;
 b=bIdX3Uoey/OW5Xk/b5J+J/aM2eEHeQy899nB10oHLhd7fUbtQQd4dCFna9Sl7tdB7314Xi9F8MvXf2wiyE+iJXlHXX8Yz7m1NExGFhh8IYdnsasXmNqH9LdWPbY1kn8Kcg4jg6nvI5wFVYbERqQ/kg5le6Z9I1Z4tGBmVX8sldQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6359.eurprd08.prod.outlook.com (2603:10a6:20b:31a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:45:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%9]) with mapi id 15.20.3846.043; Tue, 16 Feb 2021
 16:45:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, den@openvz.org, stefanha@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com
Subject: [PATCH 3/5] parallels: support bitmap extension for read-only mode
Date: Tue, 16 Feb 2021 19:45:25 +0300
Message-Id: <20210216164527.37745-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216164527.37745-1-vsementsov@virtuozzo.com>
References: <20210216164527.37745-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.244]
X-ClientProxiedBy: AM3PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:207:3::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.244) by
 AM3PR05CA0149.eurprd05.prod.outlook.com (2603:10a6:207:3::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 16:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81a66dd8-d2f7-4fda-bd71-08d8d29a4cb8
X-MS-TrafficTypeDiagnostic: AS8PR08MB6359:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6359D0E93218069ED4AAE5EFC1879@AS8PR08MB6359.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:293;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JJKDjCZzbW+ORfypPjr52zWbZLz5aDhP4nXbtjegDDSvR9mm3H2DjB/ZZL2xtUHN59c7YYqQKXDWzPJk+uYEgOUZsJv5pjvxR6WDGpPQp+DzumDDKpqmprwhszCr8L9il9mnINcoNn0VWBSBKQekUEtmxSa0lsMVDANo1Q7XrHwq9N4qFcJqAQC6NWAcpehGl8wnwHgR0r19KhlRTUgnDhJu4XItD7fkZAsvhRp/4Md/FtUQspDHxeDD0qKZnHaBkj8NyJdbgWaXA8VrMxnp8isIX9FLdW/Y1fjkWCV0YnV6itqezIWc6oRw6O1EoU5mLaODsFIL9kZQPDfEEYIu4vd1xPivUwcHOg4ogxZvk5miRPXtzMvunsjyuv5uVnzKkPuF0yt65mHPnGKAe2Zs8NkhmhvVHB+pAw2KdQFwz8tgbliSUjqLwXIKkbvZscz5ZxkVd34P5tkbdizRnhhhMMofhCupHA+AqfkL4NBzGCAtXKr75eVRgCF9d/XIx2mEgFgNDoUFMnOU/jI5E5gKbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(346002)(39850400004)(396003)(8936002)(956004)(316002)(83380400001)(36756003)(26005)(30864003)(8676002)(2616005)(5660300002)(1076003)(66946007)(66556008)(86362001)(52116002)(6512007)(186003)(2906002)(6486002)(6506007)(4326008)(16526019)(66476007)(6666004)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gFd4a7H/MsmzdDQql86duo4zt1mfxhh6EC6MtboY+nTUGwJmq03X2ScNO5qQ?=
 =?us-ascii?Q?Ix0Gs+J6pnqrfZYrnDz/YxiEN8BsSxCRTrnWFrGS4dUDpgo8QxzNAi+AxccC?=
 =?us-ascii?Q?KeWsPq8gNiDvz7cE7z6I3kWYk3Jc1cz1Rmro8jyfWQH4LX+5Eo4m/KvguKQU?=
 =?us-ascii?Q?xiGMRR1BrXz6DG9ZVJrC/4b36oSOXDdsYQoI5mcYB4dozIdCmGsCDRdnHqWy?=
 =?us-ascii?Q?TEo0Kte1pIcZhsW57m8l/lkJAvqkr4GfamtrR7BhGrLhgY++4Z44cuT8ra0R?=
 =?us-ascii?Q?uOvtqLnh0gk3h8ZgVlMSQTKysWHGXwtY8eq/mUIsQtuNMtkxSxygF0gPUUie?=
 =?us-ascii?Q?mknYKNZqqc72wFWUvR2T3fzIGtDapW1q6wkgfZYUQREnP5V+oY+tim1cvvIU?=
 =?us-ascii?Q?jly8XIkqszAI6eu7PjkMR+SWmE9ru+pUVZTgCovdHEYgdYny2SCrRanQSmhk?=
 =?us-ascii?Q?NfNzX0AphPDNcf1tcc+CXvig6D5DSDxlRiR+nBVMSPIsuJkiSFbAEJl3AIEa?=
 =?us-ascii?Q?PPumsAg8pwHCSylhrmvkyzBpyILNSQ8XGppaf9d3oN5BFRxW44w1VMSqjbT1?=
 =?us-ascii?Q?b+XGK5BLe7hDNtlWfHhlWBSXJUd0snLp2rOIBLA5xnCxNlVmhMz+QNr5mld8?=
 =?us-ascii?Q?jABls7gsnB/TiIh3IMt5W1YF3welxdVP55wDQfgDO7pahTyz6fi+vwC6K+jy?=
 =?us-ascii?Q?1CdMLm36l7UpWJHmZOdJd5gpfCgoKeCyxXzkQdb/vgbpZdSvVI99I3fLwkuD?=
 =?us-ascii?Q?5NPGeWITpCPCF4hGb1I6PDplL8TWvz2+EkdlTg9aKD9aHDmuIzSl/QC+h9pU?=
 =?us-ascii?Q?y+drgDJSw49QSmZb2TlgPEeH4TT//jpuiSee7DBATT9YDb6MY6rv0lw4MH3v?=
 =?us-ascii?Q?dO4gKNjI5H7O3WXKO58hTRvB90nREVnzQJWcNJR5d+HYtHTiIfuRID21NI7T?=
 =?us-ascii?Q?ZeR8rFmaKNQKBGs0BGbsekbAOd1HNMbi3TMzSXzK19TXXH2Pb4sNKX7GHp6O?=
 =?us-ascii?Q?8AwoI/N3c2ON2vo9JEXiNg/JSEiXTuIYB91Btrnz51StE7kcstyMfqdqosn6?=
 =?us-ascii?Q?oV0Ugl15Ctrl3JBmWlik5avRhLwcvxu6vTK49AsPZtnwIaDW47EPhQmsJidz?=
 =?us-ascii?Q?1yy6LvD5ksdQ4SbA/X4Sxgfbvo2Ys3Sgg599xfon1yWdbzi+Ovjxstnb0DFS?=
 =?us-ascii?Q?nP/Piv+E83S+6MeJjT4uYrhVY6eS6xC/DSBd1/7E3rRKTCE17x3jrutlLqd2?=
 =?us-ascii?Q?x014LA883dANn4/kCssNag2klvdFCOXdfahlbCgvZiMPHJjK5PI2qZ1ERLMH?=
 =?us-ascii?Q?U7vlQrQOrCz+Uv6H4ylDE/Cs?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a66dd8-d2f7-4fda-bd71-08d8d29a4cb8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 16:45:42.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGh4yaNNze3hq/J0hjLXNkMQZW92E0fcZg4bExiwVKq/aUWP4b90HcasNNVpc8KtQVx0izM7J5y3pU6VnL0UPHdKUTndwV8591zI88YAwLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6359
Received-SPF: pass client-ip=40.107.6.108;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/parallels.h     |   6 +-
 block/parallels-ext.c | 286 ++++++++++++++++++++++++++++++++++++++++++
 block/parallels.c     |  18 +++
 block/meson.build     |   3 +-
 4 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 block/parallels-ext.c

diff --git a/block/parallels.h b/block/parallels.h
index 5aa101cfc8..2dbb7668a3 100644
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
@@ -84,4 +85,7 @@ typedef struct BDRVParallelsState {
     Error *migration_blocker;
 } BDRVParallelsState;
 
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp);
+
 #endif
diff --git a/block/parallels-ext.c b/block/parallels-ext.c
new file mode 100644
index 0000000000..b825b55124
--- /dev/null
+++ b/block/parallels-ext.c
@@ -0,0 +1,286 @@
+/*
+ * Support for Parallels Format Extansion. It's a part of parallels format
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
+    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
+    uint64_t bm_size = bdrv_dirty_bitmap_size(bitmap);
+    uint8_t *buf = NULL;
+    uint64_t i, tab_size =
+        DIV_ROUND_UP(bdrv_dirty_bitmap_serialization_size(bitmap, 0, bm_size),
+                     cluster_size);
+
+    if (tab_size != l1_size) {
+        error_setg(errp, "Bitmap table size %" PRIu32 " does not correspond "
+                   "to bitmap size and cluster size. Expected %" PRIu64,
+                   l1_size, tab_size);
+        return -EINVAL;
+    }
+
+    buf = qemu_blockalign(bs, cluster_size);
+    limit = bdrv_dirty_bitmap_serialization_coverage(cluster_size, bitmap);
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
+                             cluster_size);
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
+
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
+    l1_table = g_memdup(data, bf.l1_size * sizeof(uint64_t));
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
+    int remaining = s->tracks << BDRV_SECTOR_BITS; /* one cluster */
+    uint8_t *pos = ext_cluster;
+    ParallelsFormatExtensionHeader eh;
+    g_autofree uint8_t *hash = NULL;
+    size_t hash_len = 0;
+    BdrvDirtyBitmap *bitmap = NULL;
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
+            if (bitmap) {
+                error_setg(errp, "Multiple bitmaps in Format Extension");
+                goto fail;
+            }
+            bitmap = parallels_load_bitmap(bs, pos, fh.data_size, errp);
+            if (!bitmap) {
+                goto fail;
+            }
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
+    if (bitmap) {
+        bdrv_release_dirty_bitmap(bitmap);
+    }
+
+    return -EINVAL;
+}
+
+int parallels_read_format_extension(BlockDriverState *bs,
+                                    int64_t ext_off, Error **errp)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int ret;
+    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
+    uint8_t *ext_cluster = qemu_blockalign(bs, cluster_size);
+
+    assert(ext_off > 0);
+
+    ret = bdrv_pread(bs->file, ext_off, ext_cluster, cluster_size);
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
index 3c22dfdc9d..d33b1fa7b8 100644
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


