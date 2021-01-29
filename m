Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EAA308AFF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:13:57 +0100 (CET)
Received: from localhost ([::1]:55428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XLI-0004mP-JN
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X0P-0001YM-3V; Fri, 29 Jan 2021 11:52:22 -0500
Received: from mail-eopbgr60091.outbound.protection.outlook.com
 ([40.107.6.91]:6275 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l5X08-0007Pt-Bl; Fri, 29 Jan 2021 11:52:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLyZnZbr3VONvwl1GXi/QMABSLJlQAXNNtJm4/F++v3j3YTLV95S3zV0TGXDCWO6VTKVBvf9CLoF20on45Tt/53Pgm16wbVw6afIU9jG6uOs3Xh306Mvxxa0raqujIcofJeGzAMZn2rfL4x1oWB92Uzxo4s2yGrmN4yM3M0P0Uu/ixvXHspqWn3GRLjRtZwBGvUeIINtRZWgefF0cccDFCXpFQY/15CkfgmDPh+wMOYaemo19zjffY+OXx3eVvXLvCgHkAGyk0Sgiu4kgpG4/P7ISywM2EkXd9aD8inT1d40aQGbihz10cGjz504L33oA2GbOffcB0EBblFhx6lz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE+Hj0hy6s/TEo5B94bzPZsfhHsPlkA7o2W7jA/5GMM=;
 b=izQectLE3or5AaG1wZsQ8zSDLsCTHdN9cnzXcYZ2A/UrNDZI0tWN5PokpP8cIljXifPgKK/E+HWJ5xE0TIrX3yhYX+bSktDvOU44vogZzuQLO2VtqeElEBpbY4bCvgA5XkXdRDBAUnJ0AHIBi1mrTYWDnyw+fFro2RXPHXw5g6MaBNov0+gjtsM0CzjgiXjHBxK2KSoKQ6sA+++bJyUfjtxwPFFH1N9nJaqwbwJhWDXKOtm9FpKxlQCCVXQEXX9re7zkZNPIendVbBVfYc+B87/Gdf1IReGFD0oPkrrxIz4tbkunLOxd931w2WZ8NBj10XfeZaUqk6nWx7fKszmMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE+Hj0hy6s/TEo5B94bzPZsfhHsPlkA7o2W7jA/5GMM=;
 b=KPwcjNGIk1o4XM2/iwAawg/rGSjDeCgikHu3lJHAbP4I1JngkTCHC2gtRU+ZPJWf/htdQMeAtAWDoFkJVEKr0lXY8lWHLiXWMfms9h/1CLv8Q7PqQTAc79GVEu51Qiiq8jolQ2al6D7wYgdy5Xzpcz0LtoPG2HNxMgFCMUOF/xo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3621.eurprd08.prod.outlook.com (2603:10a6:20b:4b::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Fri, 29 Jan
 2021 16:51:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 16:51:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/7] block/qcow2: introduce cache for compressed writes
Date: Fri, 29 Jan 2021 19:50:25 +0300
Message-Id: <20210129165030.640169-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129165030.640169-1-vsementsov@virtuozzo.com>
References: <20210129165030.640169-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.152]
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.152) by
 AM0PR02CA0001.eurprd02.prod.outlook.com (2603:10a6:208:3e::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 16:51:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7723d43e-f33d-4fb8-b4f6-08d8c4762784
X-MS-TrafficTypeDiagnostic: AM6PR08MB3621:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB36219A80B0423B0B4263DA81C1B99@AM6PR08MB3621.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHCnd1u5ZmPEJSGprzxAeU5r37T5K77NS5wZqUXGpneOntLIJ2hDurldZqJB5z0IbRMrZD+QuuwJ72B+at2ttZYH+zTE0C22JsA8KrZejSWDijw9OwyVtibBdEJqp7eVtH/2bUnObq/OmPoIXXvwIQ0iRjCQKN3YpIqp7RaPlOncUU2YyM5qBwbctPniz74N84n62WxunotnCQptys5h4F4Pd9kwTWrIObNDA3JJySQAOqhILiQdaAS4Bgr6+UbdHwbmIvOzoixNcZtVl9cvGf3KQJY8WiFfVoh1KXwg+FAwyAMVBEyDiGV+qXbftb3sbe69RM45vT4YovtgO54iq3P/himdE/+1bsp9Ti/ddeAClmcitFuM8biqNpl20mqe3E61OM6Tgy9hYWk4o/sivX+zySdhxT1Iq+eeLi0Ksb6o2cJFKadk2OnnxZSzBJtV12Bib3H1jX+YzAKPwkD+ipf1EEYo7Bk1TgI8IxKs7EJ0sLyT/Jl33qepJ314f9CEsP/tDZ2O+NDX3MO8Z96hog==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(39840400004)(376002)(66476007)(19627235002)(83380400001)(30864003)(1076003)(86362001)(8936002)(6486002)(316002)(52116002)(6512007)(66946007)(8676002)(2616005)(2906002)(66556008)(36756003)(4326008)(16526019)(6506007)(26005)(186003)(107886003)(956004)(6916009)(6666004)(5660300002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LeumfMrAxTPe9/fMgZXUnWcIzyfyMfVV1ClDWPz6mdZk/WnLeIC07RZU04HU?=
 =?us-ascii?Q?6CmZBz0iI58Co6fFiz2f1f/QWeN1NZW5hyS+aH5Pp9qui+mOeyrC9VARNvC+?=
 =?us-ascii?Q?5aaZTQa6yjjgM2AlTLVqrS1NflJPQcAvFOSbjZLHBRdAdFFqNYQdtbsDsv7T?=
 =?us-ascii?Q?hVYU21cdxmLXF6C+Np5y7huqqVeNejyuQXv79i7Lru/QK1nl4ZvS4vZe0O6w?=
 =?us-ascii?Q?F2Yy0faSDawBn7hinraFvJjksZ/e4i0Skpf4qNxh/m9IoFld2oyrYs4CUqqG?=
 =?us-ascii?Q?lt66s9GXbq2NC+//BCo30nOaoAgPLe5XBNg3pB8htH6kkoS7VG6ENJo6cg79?=
 =?us-ascii?Q?/+I7y6ZlBvDEWSr+Ih6kPZ6PC2FVnomS32XujJkTmeJgezD1CLP2ovS6tCAw?=
 =?us-ascii?Q?czMLsmPanXLIWml2hxieOvsxlCuNen9imbnO79r+icRS5/v7+DknwvRL8ayS?=
 =?us-ascii?Q?DyPvHaVc2R+xZ9J9Ql4o6YllviXoPYoPg5yz8GHT1FVEfR6zucetP6VcxjKT?=
 =?us-ascii?Q?EmRjOyBxyzXixO0SU7saWGqDRRp1SQoXu4nvTerKf+IErKKTBv88BtuXQzqt?=
 =?us-ascii?Q?F/S4TsXtKRJox4LnJRhN4O4WOlVEBQd5vrcjCWCDpgoRPhhpfyedpauYxgsv?=
 =?us-ascii?Q?Cm3r5/2EVB8e4E5/FUzxD7V5s3GJP7ob2qL45XvMCoY4PFP4jpfp1CjHkxKh?=
 =?us-ascii?Q?d21+iS6PZL7WHB0ID2bxANOOndDlxlxnh3jy3LH5eLIl421vz/R/jiDklUfk?=
 =?us-ascii?Q?7Rvo6zVwCBL7adpAOnfYCbe8aOKhjZz2v5B1rpZR1h7Y1reJ7WGTcE64eJw8?=
 =?us-ascii?Q?HxY9+NDN/FsqpR/IgAHzCO7zsgIsfjUeDTcokSMCOd+B0ohzNebn5pBTPnJN?=
 =?us-ascii?Q?8Zr2zWCc+wbmwEE7WjIH7RuzIRCbm/5bxwHQV4ikP3Ape7qs/gQi0DnbeaUI?=
 =?us-ascii?Q?I38PHCzUiz2riL5yyMH4YUTNy5QA0had90WzqSMHYLpmExD4jfIGHmwALzVf?=
 =?us-ascii?Q?6eUMGPZeKCIt16iNj65PZXIediSg1Q+LrGE1Z33+3Yj2VBikLXmFxo1/YG+A?=
 =?us-ascii?Q?fi50FarH?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7723d43e-f33d-4fb8-b4f6-08d8c4762784
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:51:42.4215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnHyWc9TEYQSU7zzW4Tq7XMHd3L25DTi6BeWtigM60MdPdBfKXpDWUXucPOZmvselpJHHX6wRMYaukG8vHeXOtf6ugBRGdejDhTaAFzZuLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3621
Received-SPF: pass client-ip=40.107.6.91;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, armbru@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compressed writes and O_DIRECT are not friends: they works too slow,
because compressed writes does many small unaligned to 512 writes.

Let's introduce an internal cache, so that compressed writes may work
well when O_DIRECT is on.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.h                        |  29 +
 block/qcow2-compressed-write-cache.c | 770 +++++++++++++++++++++++++++
 block/meson.build                    |   1 +
 3 files changed, 800 insertions(+)
 create mode 100644 block/qcow2-compressed-write-cache.c

diff --git a/block/qcow2.h b/block/qcow2.h
index 0678073b74..fbdedf89fa 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -322,6 +322,8 @@ typedef struct Qcow2BitmapHeaderExt {
     uint64_t bitmap_directory_offset;
 } QEMU_PACKED Qcow2BitmapHeaderExt;
 
+typedef struct Qcow2CompressedWriteCache Qcow2CompressedWriteCache;
+
 #define QCOW2_MAX_THREADS 4
 
 typedef struct BDRVQcow2State {
@@ -1010,4 +1012,31 @@ int coroutine_fn
 qcow2_co_decrypt(BlockDriverState *bs, uint64_t host_offset,
                  uint64_t guest_offset, void *buf, size_t len);
 
+Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild *data_file,
+                                                      int64_t cluster_size,
+                                                      int64_t cache_size);
+void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s);
+int coroutine_fn
+qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
+                               int64_t bytes, void *buf);
+int coroutine_fn
+qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
+                                int64_t bytes, void *buf);
+void coroutine_fn
+qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
+                                          int64_t cluster_data_end);
+int coroutine_fn
+qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s);
+int qcow2_compressed_cache_flush(BlockDriverState *bs,
+                                 Qcow2CompressedWriteCache *state);
+int coroutine_fn
+qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s);
+int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
+                                      Qcow2CompressedWriteCache *s);
+void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
+                                     int64_t size);
+void coroutine_fn
+qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
+                                  int64_t cluster_offset);
+
 #endif
diff --git a/block/qcow2-compressed-write-cache.c b/block/qcow2-compressed-write-cache.c
new file mode 100644
index 0000000000..7bb92cb550
--- /dev/null
+++ b/block/qcow2-compressed-write-cache.c
@@ -0,0 +1,770 @@
+/*
+ * Write cache for qcow2 compressed writes
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
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
+
+#include "block/block_int.h"
+#include "block/block-gen.h"
+#include "qemu/coroutine.h"
+#include "qapi/qapi-events-block-core.h"
+#include "qcow2.h"
+
+typedef struct CacheExtent {
+    int64_t offset;
+    int64_t bytes;
+    void *buf;
+    QLIST_ENTRY(CacheExtent) next;
+} CacheExtent;
+
+typedef struct CacheCluster {
+    int64_t cluster_offset;
+    int64_t n_bytes; /* sum of extents lengths */
+
+    /*
+     * data_end: cluster is full if data_end reached and ready to be flushed.
+     * data_end is absoluted offset, not relative.
+     */
+    int64_t data_end;
+
+    bool in_flight; /* cluster is being flushed now */
+
+    /*
+     * waiters: coroutines to wake after flush. Must be empty when in_flight is
+     * false
+     */
+    CoQueue waiters;
+
+    QTAILQ_ENTRY(CacheCluster) next;
+    QLIST_HEAD(, CacheExtent) extents; /* sorted by offset */
+} CacheCluster;
+
+typedef QTAILQ_HEAD(, CacheCluster) CacheClusterQueue;
+
+struct Qcow2CompressedWriteCache {
+    /*
+     * @data_file and @cluster_size are copied from qcow2 state. Not huge
+     * duplications, seems better to avoid accessing the whole qcow2 state
+     * instead.
+     */
+    BdrvChild *data_file;
+    int64_t cluster_size;
+
+    CoQueue waiters; /* coroutines, waiting for free place in the cache */
+
+    /*
+     * Cache limits not total number of clusters but total number of active
+     * clusters. Active clusters are clusters with non-zero @n_bytes (and
+     * therefor non-empty @extents). This is done so we don't need to wait for
+     * cache flush qcow2_compressed_cache_set_cluster_end() (which may create
+     * cluster with @data_end set but zero @n_bytes), as
+     * qcow2_compressed_cache_set_cluster_end() is intended to be called from
+     * qcow2 mutex critical section.
+     */
+    int nb_active_clusters;
+
+    /*
+     * If max_active_clusters is 0 it means that cache is inactive: all new
+     * writes should fallthrough to data_file immediately.
+     */
+    int max_active_clusters;
+
+    CacheClusterQueue clusters;
+};
+
+/* New extent takes ownership of @buf */
+static CacheExtent *cache_extent_new(int64_t offset, int64_t bytes, void *buf)
+{
+    CacheExtent *e = g_new(CacheExtent, 1);
+
+    *e = (CacheExtent) {
+        .offset = offset,
+        .bytes = bytes,
+        .buf = buf,
+    };
+
+    return e;
+}
+
+static void cache_extent_free(CacheExtent *e)
+{
+    if (e) {
+        g_free(e->buf);
+        g_free(e);
+    }
+}
+
+static CacheCluster *find_cluster(Qcow2CompressedWriteCache *s,
+                                  int64_t cluster_offset)
+{
+    CacheCluster *c;
+
+    assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
+
+    QTAILQ_FOREACH(c, &s->clusters, next) {
+        if (cluster_offset == c->cluster_offset) {
+            return c;
+        }
+    }
+
+    return NULL;
+}
+
+/* Creates "inactive" cluster, which doesn't influence s->nb_active_clusters */
+static CacheCluster *cache_cluster_new(Qcow2CompressedWriteCache *s,
+                                       int64_t cluster_offset)
+{
+    CacheCluster *c;
+
+    assert(!find_cluster(s, cluster_offset));
+
+    c = g_new(CacheCluster, 1);
+    *c = (CacheCluster) {
+        .cluster_offset = cluster_offset,
+        .data_end = cluster_offset + s->cluster_size
+    };
+
+    qemu_co_queue_init(&c->waiters);
+    QTAILQ_INSERT_TAIL(&s->clusters, c, next);
+
+    return c;
+}
+
+static void cache_cluster_free(CacheCluster *cluster)
+{
+    assert(!cluster->in_flight);
+    assert(qemu_co_queue_empty(&cluster->waiters));
+    QLIST_FOREACH_FUNC_SAFE(&cluster->extents, next, cache_extent_free);
+    g_free(cluster);
+}
+
+static bool cache_cluster_is_full(CacheCluster *cluster)
+{
+    assert(cluster->cluster_offset + cluster->n_bytes <= cluster->data_end);
+    return cluster->cluster_offset + cluster->n_bytes == cluster->data_end;
+}
+
+static void cache_cluster_remove(Qcow2CompressedWriteCache *s,
+                                 CacheCluster *cluster)
+{
+    if (cluster->n_bytes) {
+        s->nb_active_clusters--;
+    }
+    QTAILQ_REMOVE(&s->clusters, cluster, next);
+    cache_cluster_free(cluster);
+}
+
+/*
+ * Return number of consequtive clusters starting from @first. Store next after
+ * last extent pointer into @next, store end offset of last extent into
+ * @end_off.
+ */
+static int count_consequitive_extents(CacheExtent *first,
+                                      CacheExtent **next,
+                                      int64_t *end_off)
+{
+    CacheExtent *e;
+    int64_t off = first->offset;
+    int nb = 0;
+
+    for (e = first; e; e = QLIST_NEXT(e, next)) {
+        assert(e->offset >= off);
+        if (e->offset > off) {
+            break;
+        }
+        off += e->bytes;
+        nb++;
+    }
+
+    if (next) {
+        *next = e;
+    }
+
+    if (end_off) {
+        *end_off = off;
+    }
+
+    return nb;
+}
+
+/*
+ * Write consequtive extents, starting from @firest. Store next after last
+ * extent pointer into @next. If align > 1, align end of the whole write by
+ * zero.
+ */
+static int coroutine_fn flush_consequitive_extents(Qcow2CompressedWriteCache *s,
+                                                   CacheExtent *first,
+                                                   CacheExtent **next,
+                                                   int64_t align)
+{
+    CacheExtent *e, *end_extent;
+    int64_t end;
+    int nb_extents = count_consequitive_extents(first, &end_extent, &end);
+    int64_t aligned_end = QEMU_ALIGN_UP(end, align);
+    int64_t tail = aligned_end - end;
+    int64_t len = aligned_end - first->offset;
+
+    /*
+     * Alignment if for flushing full cluster, first extent offset is always
+     * aligned.
+     */
+    assert(QEMU_IS_ALIGNED(first->offset, align));
+
+    if (next) {
+        *next = end_extent;
+    }
+
+    if (tail) {
+        nb_extents++;
+    }
+
+    if (nb_extents > IOV_MAX) {
+        g_autofree void *buf = g_malloc(len);
+        char *p = buf;
+
+        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
+            memcpy(p, e->buf, e->bytes);
+            p += e->bytes;
+        }
+
+        if (tail) {
+            memset(p, 0, tail);
+        }
+
+        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
+        return bdrv_co_pwrite(s->data_file, first->offset, len, buf, 0);
+    } else {
+        int ret;
+        QEMUIOVector qiov;
+        g_autofree void *tail_buf = NULL;
+
+        qemu_iovec_init(&qiov, nb_extents);
+        for (e = first; e != end_extent; e = QLIST_NEXT(e, next)) {
+            qemu_iovec_add(&qiov, e->buf, e->bytes);
+        }
+
+        if (tail) {
+            tail_buf = g_malloc0(tail);
+            qemu_iovec_add(&qiov, tail_buf, tail);
+        }
+
+        BLKDBG_EVENT(s->data_file, BLKDBG_WRITE_COMPRESSED);
+        ret = bdrv_co_pwritev(s->data_file, first->offset, len, &qiov, 0);
+        qemu_iovec_destroy(&qiov);
+        return ret;
+    }
+}
+
+static int coroutine_fn cache_cluster_flush_full(Qcow2CompressedWriteCache *s,
+                                                 CacheCluster *cluster)
+{
+    int ret;
+    CacheExtent *end_extent;
+    int64_t align = MIN(s->cluster_size,
+                        MAX(s->data_file->bs->bl.request_alignment, 4 * 1024));
+
+    assert(cache_cluster_is_full(cluster));
+
+    ret = flush_consequitive_extents(s, QLIST_FIRST(&cluster->extents),
+                                     &end_extent, align);
+
+    assert(end_extent == NULL); /* all extents flushed */
+
+    return ret;
+}
+
+static int coroutine_fn cache_cluster_flush(Qcow2CompressedWriteCache *s,
+                                            CacheCluster *c)
+{
+    int ret;
+    CacheExtent *e = QLIST_FIRST(&c->extents);
+
+    if (cache_cluster_is_full(c)) {
+        return cache_cluster_flush_full(s, c);
+    }
+
+    while (e) {
+        ret = flush_consequitive_extents(s, e, &e, 1);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
+int coroutine_fn qcow2_compressed_cache_co_flush(Qcow2CompressedWriteCache *s)
+{
+    int ret = 0;
+    CacheCluster *c;
+    GList *local_clusters = NULL, *p;
+
+    /*
+     * Make a snapshot of current state: we will not flush clusters created in
+     * parallel with flush operations and don't allow adding more extents to
+     * staged clusters. We are also protected from parallel flush operations
+     * flushing the same clusters.
+     */
+    QTAILQ_FOREACH(c, &s->clusters, next) {
+        if (!c->in_flight && c->n_bytes) {
+            c->in_flight = true;
+            local_clusters = g_list_append(local_clusters, c);
+        }
+    }
+
+    for (p = local_clusters; p; p = p->next) {
+        CacheCluster *c = p->data;
+
+        if (ret == 0) {
+            ret = cache_cluster_flush(s, c);
+        }
+
+        c->in_flight = false;
+        qemu_co_queue_restart_all(&c->waiters);
+
+        if (ret == 0) {
+            cache_cluster_remove(s, c);
+        }
+    }
+
+    g_list_free(local_clusters);
+
+    return ret;
+}
+
+int coroutine_fn
+qcow2_compressed_cache_co_stop_flush(Qcow2CompressedWriteCache *s)
+{
+    int ret, save;
+
+    save = s->max_active_clusters;
+    s->max_active_clusters = 0; /* No more extents */
+
+    ret = qcow2_compressed_cache_co_flush(s);
+    if (ret < 0) {
+        s->max_active_clusters = save;
+        return ret;
+    }
+
+    assert(QTAILQ_EMPTY(&s->clusters));
+    return 0;
+}
+
+/* @cluster takes ownership of @extent */
+static void cluster_add_extent(Qcow2CompressedWriteCache *s,
+                               CacheCluster *cluster, CacheExtent *extent)
+{
+    CacheExtent *e;
+
+    assert(extent->bytes);
+    assert(extent->offset >= cluster->cluster_offset);
+    assert(extent->offset + extent->bytes <= cluster->data_end);
+    assert(!cluster->in_flight);
+
+    e = QLIST_FIRST(&cluster->extents);
+    if (!e) {
+        /* inactive cluster */
+        assert(!cluster->n_bytes);
+        s->nb_active_clusters++;
+        assert(s->nb_active_clusters <= s->max_active_clusters);
+        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
+    } else if (e->offset > extent->offset) {
+        assert(extent->offset + extent->bytes <= e->offset);
+        QLIST_INSERT_HEAD(&cluster->extents, extent, next);
+    } else {
+        while (QLIST_NEXT(e, next) &&
+               QLIST_NEXT(e, next)->offset < extent->offset) {
+            e = QLIST_NEXT(e, next);
+        }
+
+        /* Now e is last element with offset < extent->offset */
+        assert(e->offset + e->bytes <= extent->offset);
+
+        QLIST_INSERT_AFTER(e, extent, next);
+
+        e = QLIST_NEXT(extent, next);
+        if (e) {
+            assert(extent->offset + extent->bytes <= e->offset);
+        }
+    }
+
+    cluster->n_bytes += extent->bytes;
+}
+
+static CacheCluster *find_cluster_to_flush(Qcow2CompressedWriteCache *s)
+{
+    CacheCluster *c;
+
+    QTAILQ_FOREACH(c, &s->clusters, next) {
+        if (!c->in_flight && cache_cluster_is_full(c)) {
+            return c;
+        }
+    }
+
+    return NULL;
+}
+
+/* Cache an extent if there is a place */
+static bool coroutine_fn
+try_cache_extent(Qcow2CompressedWriteCache *s, CacheExtent *extent,
+                 bool *cluster_in_flight)
+{
+    CacheCluster *c;
+    int64_t cluster_offset = QEMU_ALIGN_DOWN(extent->offset, s->cluster_size);
+
+    assert(extent->bytes);
+
+    if (s->max_active_clusters == 0) {
+        *cluster_in_flight = true;
+        return false;
+    }
+
+    *cluster_in_flight = false;
+
+    c = find_cluster(s, cluster_offset);
+    if (c && c->in_flight) {
+        *cluster_in_flight = true;
+        return false;
+    }
+    if (s->nb_active_clusters >= s->max_active_clusters &&
+        (!c || !c->n_bytes))
+    {
+        /*
+         * Cache is full, we can't allocate a new cluster and can't activate
+         * existing inactive cluster
+         */
+        return false;
+    }
+
+    if (!c) {
+        c = cache_cluster_new(s, cluster_offset);
+    }
+
+    cluster_add_extent(s, c, extent);
+
+    if (cache_cluster_is_full(c)) {
+        qemu_co_queue_restart_all(&s->waiters);
+    }
+
+    return true;
+}
+
+/* Takes ownership of @buf, don't free it after call! */
+int coroutine_fn
+qcow2_compressed_cache_co_write(Qcow2CompressedWriteCache *s, int64_t offset,
+                                int64_t bytes, void *buf)
+{
+    int ret;
+    int i;
+    CacheExtent *extents[] = {NULL, NULL};
+    int nb_extents = 0; /* number of non-NULL elements in @extents */
+    int64_t e0_len;
+
+    assert(bytes > 0);
+    assert(bytes < s->cluster_size);
+
+    e0_len = MIN(bytes, QEMU_ALIGN_UP(offset + 1, s->cluster_size) - offset);
+    extents[0] = cache_extent_new(offset, e0_len, buf);
+    nb_extents = 1;
+
+    if (bytes > e0_len) {
+        int64_t e1_len = bytes - e0_len;
+        /*
+         * We have to allocate a new buffer, so that clusters are independent
+         * and can free their extents when needed.
+         */
+        void *e1_buf = g_memdup(((const char *)buf) + e0_len, e1_len);
+
+        extents[1] = cache_extent_new(offset + e0_len, e1_len, e1_buf);
+        nb_extents = 2;
+    }
+
+    while (nb_extents) {
+        bool do_write = false;
+
+        for (i = 0; i < 2; i++) {
+            CacheExtent *e = extents[i];
+
+            do_write = false;
+
+            if (!e) {
+                continue;
+            }
+
+            if (try_cache_extent(s, e, &do_write)) {
+                extents[i] = NULL;
+                nb_extents--;
+                continue;
+            }
+
+            if (do_write) {
+                ret = bdrv_co_pwrite(s->data_file, e->offset, e->bytes,
+                                     e->buf, 0);
+
+                cache_extent_free(e);
+                extents[i] = NULL;
+                nb_extents--;
+
+                if (ret < 0) {
+                    goto out;
+                }
+            }
+        }
+
+        if (do_write) {
+            /*
+             * We yielded during second extent writing. Probably the cache is
+             * already free and we can now cache the first extent.
+             */
+            continue;
+        }
+
+        if (nb_extents) {
+            CacheCluster *cluster = find_cluster_to_flush(s);
+
+            if (cluster) {
+                cluster->in_flight = true;
+                ret = cache_cluster_flush_full(s, cluster);
+                cluster->in_flight = false;
+                qemu_co_queue_restart_all(&cluster->waiters);
+                qemu_co_queue_restart_all(&s->waiters);
+                if (ret < 0) {
+                    goto out;
+                }
+                cache_cluster_remove(s, cluster);
+                continue;
+            }
+
+            qemu_co_queue_wait(&s->waiters, NULL);
+        }
+    }
+
+    ret = 0;
+
+out:
+    for (i = 0; i < 2; i++) {
+        cache_extent_free(extents[i]);
+    }
+
+    return 0;
+}
+
+int coroutine_fn
+qcow2_compressed_cache_co_read(Qcow2CompressedWriteCache *s, int64_t offset,
+                               int64_t bytes, void *buf)
+{
+    CacheCluster *c;
+    CacheExtent *e;
+    int64_t cluster_offset = QEMU_ALIGN_DOWN(offset, s->cluster_size);
+
+    c = find_cluster(s, cluster_offset);
+    if (c) {
+        QLIST_FOREACH(e, &c->extents, next) {
+            if (e->offset == offset && e->bytes <= bytes) {
+                memcpy(buf, e->buf, e->bytes);
+                return 0;
+            }
+        }
+    }
+
+    return bdrv_co_pread(s->data_file, offset, bytes, buf, 0);
+}
+
+/*
+ * Caller states, that there would be no writes to this cluster beyond
+ * specified @cluster_data_end. So, it's OK to flush cluster when it is filled
+ * up to @cluster_data_end and it's OK to align flushing write operation up to
+ * some alignment (not greater than cluster_size of course).
+ */
+void coroutine_fn
+qcow2_compressed_cache_co_set_cluster_end(Qcow2CompressedWriteCache *s,
+                                          int64_t cluster_data_end)
+{
+    int64_t cluster_offset = QEMU_ALIGN_DOWN(cluster_data_end, s->cluster_size);
+    CacheExtent *e;
+    CacheCluster *c;
+
+    c = find_cluster(s, cluster_offset);
+    if (!c) {
+        c = cache_cluster_new(s, cluster_offset);
+    }
+
+    QLIST_FOREACH(e, &c->extents, next) {
+        assert(e->offset + e->bytes <= cluster_data_end);
+    }
+
+    /* Shouldn't set data_end several times */
+    assert(c->data_end == c->cluster_offset + s->cluster_size);
+
+    c->data_end = cluster_data_end;
+    if (cache_cluster_is_full(c)) {
+        qemu_co_queue_restart_all(&s->waiters);
+    }
+}
+
+Qcow2CompressedWriteCache *qcow2_compressed_cache_new(BdrvChild *data_file,
+                                                      int64_t cluster_size,
+                                                      int64_t cache_size)
+{
+    Qcow2CompressedWriteCache *s = g_new(Qcow2CompressedWriteCache, 1);
+
+    assert(cache_size >= cluster_size);
+
+    *s = (Qcow2CompressedWriteCache) {
+        .data_file = data_file,
+        .cluster_size = cluster_size,
+        .max_active_clusters = cache_size / cluster_size,
+    };
+
+    qemu_co_queue_init(&s->waiters);
+    QTAILQ_INIT(&s->clusters);
+
+    return s;
+}
+
+void qcow2_compressed_cache_free(Qcow2CompressedWriteCache *s)
+{
+    if (!s) {
+        return;
+    }
+
+    QTAILQ_FOREACH_FUNC_SAFE(&s->clusters, next, cache_cluster_free);
+    g_free(s);
+}
+
+void qcow2_compressed_cache_set_size(Qcow2CompressedWriteCache *s,
+                                     int64_t size)
+{
+    /*
+     * We don't do flush here. Don't care too much, it's safe to have cache
+     * larger than maximum, it will only decrease until it reaches the new
+     * maximum.
+     */
+    assert(size >= s->cluster_size);
+    s->max_active_clusters = size / s->cluster_size;
+}
+
+void coroutine_fn
+qcow2_compressed_cache_co_discard(Qcow2CompressedWriteCache *s,
+                                  int64_t cluster_offset)
+{
+    CacheCluster *c;
+
+    while (true) {
+        c = find_cluster(s, cluster_offset);
+        if (!c) {
+            return;
+        }
+        if (!c->in_flight) {
+            cache_cluster_remove(s, c);
+            return;
+        }
+        qemu_co_queue_wait(&c->waiters, NULL);
+    }
+}
+
+
+/*
+ * Wrappers for qcow2_compressed_cache_co_flush
+ *
+ * TODO: update scripts/block-coroutine-wrapper to generate this too
+ */
+
+typedef struct Qcow2CompressedCacheCoFlush {
+    BdrvPollCo poll_state;
+    Qcow2CompressedWriteCache *state;
+} Qcow2CompressedCacheCoFlush;
+
+static void coroutine_fn
+qcow2_compressed_cache_co_flush_entry(void *opaque)
+{
+    Qcow2CompressedCacheCoFlush *s = opaque;
+
+    s->poll_state.ret = qcow2_compressed_cache_co_flush(s->state);
+    s->poll_state.in_progress = false;
+
+    aio_wait_kick();
+}
+
+int qcow2_compressed_cache_flush(BlockDriverState *bs,
+                                 Qcow2CompressedWriteCache *state)
+{
+    if (qemu_in_coroutine()) {
+        return qcow2_compressed_cache_co_flush(state);
+    } else {
+        Qcow2CompressedCacheCoFlush s = {
+            .poll_state.bs = bs,
+            .poll_state.in_progress = true,
+
+            .state = state,
+        };
+
+        s.poll_state.co =
+            qemu_coroutine_create(qcow2_compressed_cache_co_flush_entry, &s);
+
+        return bdrv_poll_co(&s.poll_state);
+    }
+}
+
+/*
+ * Wrappers for qcow2_compressed_cache_co_stop_flush
+ *
+ * TODO: update scripts/block-coroutine-wrapper to generate this too
+ */
+
+typedef struct Qcow2CompressedCacheCoStopFlush {
+    BdrvPollCo poll_state;
+    Qcow2CompressedWriteCache *state;
+} Qcow2CompressedCacheCoStopFlush;
+
+static void coroutine_fn
+qcow2_compressed_cache_co_stop_flush_entry(void *opaque)
+{
+    Qcow2CompressedCacheCoStopFlush *s = opaque;
+
+    s->poll_state.ret = qcow2_compressed_cache_co_stop_flush(s->state);
+    s->poll_state.in_progress = false;
+
+    aio_wait_kick();
+}
+
+int qcow2_compressed_cache_stop_flush(BlockDriverState *bs,
+                                      Qcow2CompressedWriteCache *state)
+{
+    if (qemu_in_coroutine()) {
+        return qcow2_compressed_cache_co_stop_flush(state);
+    } else {
+        Qcow2CompressedCacheCoStopFlush s = {
+            .poll_state.bs = bs,
+            .poll_state.in_progress = true,
+
+            .state = state,
+        };
+
+        s.poll_state.co =
+            qemu_coroutine_create(qcow2_compressed_cache_co_stop_flush_entry,
+                                  &s);
+
+        return bdrv_poll_co(&s.poll_state);
+    }
+}
diff --git a/block/meson.build b/block/meson.build
index eeaefe5809..7b94794c28 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -25,6 +25,7 @@ block_ss.add(files(
   'qcow2-bitmap.c',
   'qcow2-cache.c',
   'qcow2-cluster.c',
+  'qcow2-compressed-write-cache.c',
   'qcow2-refcount.c',
   'qcow2-snapshot.c',
   'qcow2-threads.c',
-- 
2.29.2


