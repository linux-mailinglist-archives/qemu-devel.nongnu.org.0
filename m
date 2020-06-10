Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC281F578A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:17:20 +0200 (CEST)
Received: from localhost ([::1]:60384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2Tf-00040F-L2
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gw-0002iX-HV; Wed, 10 Jun 2020 11:04:10 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gr-0006w4-8P; Wed, 10 Jun 2020 11:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=+DmjjyZHHWdutW0VaiL2W0gHvH6gXYupbWQx9py7wZo=; 
 b=bUg7llAETu5/0/pZgn6NOsq+fq4U6JYoLHr4yJu0YAn8OuyWf1FENSMjpEpLPaQb/Qe/NYvjxfsP1GAn+81rPcwbWdBdkUdXbalOpvv6YlYYAlJx2+PVXDCw0mQrfhb+FbGck5bv1RUe5eF3/Jg7uAKsZ5AjxPl9io9HYk4WYDMxntltrZWyEiUaiHHUKkcCwwRP78KqFjCSZy5VXOJ5TmAWRNYxWIoxG9tgZ7GYsJ1MLjEUMjPafZYGGXC3FnQsGI+WeMrTBi5MgB6k/u8SoU+bcIMj0RwdngSuJnz4C65WePdJnXGagID6C4yw6ePAgC/8c2Smd5XIDRtN1aWztA==;
Received: from [81.0.38.199] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jj2GR-0007gu-Cv; Wed, 10 Jun 2020 17:03:39 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jj2GC-0007N0-2R; Wed, 10 Jun 2020 17:03:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/34] qcow2: Add QCow2SubclusterType and
 qcow2_get_subcluster_type()
Date: Wed, 10 Jun 2020 17:02:52 +0200
Message-Id: <c07bba15ee7253bd08d67241bcd806938c70d3cf.1591801197.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1591801197.git.berto@igalia.com>
References: <cover.1591801197.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 11:03:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds QCow2SubclusterType, which is the subcluster-level
version of QCow2ClusterType. All QCOW2_SUBCLUSTER_* values have the
the same meaning as their QCOW2_CLUSTER_* equivalents (when they
exist). See below for details and caveats.

In images without extended L2 entries clusters are treated as having
exactly one subcluster so it is possible to replace one data type with
the other while keeping the exact same semantics.

With extended L2 entries there are new possible values, and every
subcluster in the same cluster can obviously have a different
QCow2SubclusterType so functions need to be adapted to work on the
subcluster level.

There are several things that have to be taken into account:

  a) QCOW2_SUBCLUSTER_COMPRESSED means that the whole cluster is
     compressed. We do not support compression at the subcluster
     level.

  b) There are two different values for unallocated subclusters:
     QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN which means that the whole
     cluster is unallocated, and QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC
     which means that the cluster is allocated but the subcluster is
     not. The latter can only happen in images with extended L2
     entries.

  c) QCOW2_SUBCLUSTER_INVALID is used to detect the cases where an L2
     entry has a value that violates the specification. The caller is
     responsible for handling these situations.

     To prevent compatibility problems with images that have invalid
     values but are currently being read by QEMU without causing side
     effects, QCOW2_SUBCLUSTER_INVALID is only returned for images
     with extended L2 entries.

qcow2_cluster_to_subcluster_type() is added as a separate function
from qcow2_get_subcluster_type(), but this is only temporary and both
will be merged in a subsequent patch.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h | 126 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 125 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 82b86f6cec..3aec6f452a 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -80,6 +80,21 @@
 
 #define QCOW_EXTL2_SUBCLUSTERS_PER_CLUSTER 32
 
+/* The subcluster X [0..31] is allocated */
+#define QCOW_OFLAG_SUB_ALLOC(X)   (1ULL << (X))
+/* The subcluster X [0..31] reads as zeroes */
+#define QCOW_OFLAG_SUB_ZERO(X)    (QCOW_OFLAG_SUB_ALLOC(X) << 32)
+/* Subclusters [X, Y) (0 <= X <= Y <= 32) are allocated */
+#define QCOW_OFLAG_SUB_ALLOC_RANGE(X, Y) \
+    (QCOW_OFLAG_SUB_ALLOC(Y) - QCOW_OFLAG_SUB_ALLOC(X))
+/* Subclusters [X, Y) (0 <= X <= Y <= 32) read as zeroes */
+#define QCOW_OFLAG_SUB_ZERO_RANGE(X, Y) \
+    (QCOW_OFLAG_SUB_ALLOC_RANGE(X, Y) << 32)
+/* L2 entry bitmap with all allocation bits set */
+#define QCOW_L2_BITMAP_ALL_ALLOC  (QCOW_OFLAG_SUB_ALLOC_RANGE(0, 32))
+/* L2 entry bitmap with all "read as zeroes" bits set */
+#define QCOW_L2_BITMAP_ALL_ZEROES (QCOW_OFLAG_SUB_ZERO_RANGE(0, 32))
+
 /* Size of normal and extended L2 entries */
 #define L2E_SIZE_NORMAL   (sizeof(uint64_t))
 #define L2E_SIZE_EXTENDED (sizeof(uint64_t) * 2)
@@ -462,6 +477,33 @@ typedef struct QCowL2Meta
     QLIST_ENTRY(QCowL2Meta) next_in_flight;
 } QCowL2Meta;
 
+/*
+ * In images with standard L2 entries all clusters are treated as if
+ * they had one subcluster so QCow2ClusterType and QCow2SubclusterType
+ * can be mapped to each other and have the exact same meaning
+ * (QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC cannot happen in these images).
+ *
+ * In images with extended L2 entries QCow2ClusterType refers to the
+ * complete cluster and QCow2SubclusterType to each of the individual
+ * subclusters, so there are several possible combinations:
+ *
+ *     |--------------+---------------------------|
+ *     | Cluster type | Possible subcluster types |
+ *     |--------------+---------------------------|
+ *     | UNALLOCATED  |         UNALLOCATED_PLAIN |
+ *     |              |                ZERO_PLAIN |
+ *     |--------------+---------------------------|
+ *     | NORMAL       |         UNALLOCATED_ALLOC |
+ *     |              |                ZERO_ALLOC |
+ *     |              |                    NORMAL |
+ *     |--------------+---------------------------|
+ *     | COMPRESSED   |                COMPRESSED |
+ *     |--------------+---------------------------|
+ *
+ * QCOW2_SUBCLUSTER_INVALID means that the L2 entry is incorrect and
+ * the image should be marked corrupt.
+ */
+
 typedef enum QCow2ClusterType {
     QCOW2_CLUSTER_UNALLOCATED,
     QCOW2_CLUSTER_ZERO_PLAIN,
@@ -470,6 +512,16 @@ typedef enum QCow2ClusterType {
     QCOW2_CLUSTER_COMPRESSED,
 } QCow2ClusterType;
 
+typedef enum QCow2SubclusterType {
+    QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN,
+    QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC,
+    QCOW2_SUBCLUSTER_ZERO_PLAIN,
+    QCOW2_SUBCLUSTER_ZERO_ALLOC,
+    QCOW2_SUBCLUSTER_NORMAL,
+    QCOW2_SUBCLUSTER_COMPRESSED,
+    QCOW2_SUBCLUSTER_INVALID,
+} QCow2SubclusterType;
+
 typedef enum QCow2MetadataOverlap {
     QCOW2_OL_MAIN_HEADER_BITNR      = 0,
     QCOW2_OL_ACTIVE_L1_BITNR        = 1,
@@ -634,9 +686,11 @@ static inline int64_t qcow2_vm_state_offset(BDRVQcow2State *s)
 static inline QCow2ClusterType qcow2_get_cluster_type(BlockDriverState *bs,
                                                       uint64_t l2_entry)
 {
+    BDRVQcow2State *s = bs->opaque;
+
     if (l2_entry & QCOW_OFLAG_COMPRESSED) {
         return QCOW2_CLUSTER_COMPRESSED;
-    } else if (l2_entry & QCOW_OFLAG_ZERO) {
+    } else if ((l2_entry & QCOW_OFLAG_ZERO) && !has_subclusters(s)) {
         if (l2_entry & L2E_OFFSET_MASK) {
             return QCOW2_CLUSTER_ZERO_ALLOC;
         }
@@ -656,6 +710,76 @@ static inline QCow2ClusterType qcow2_get_cluster_type(BlockDriverState *bs,
     }
 }
 
+/*
+ * For an image without extended L2 entries, return the
+ * QCow2SubclusterType equivalent of a given QCow2ClusterType.
+ */
+static inline
+QCow2SubclusterType qcow2_cluster_to_subcluster_type(QCow2ClusterType type)
+{
+    switch (type) {
+    case QCOW2_CLUSTER_COMPRESSED:
+        return QCOW2_SUBCLUSTER_COMPRESSED;
+    case QCOW2_CLUSTER_ZERO_PLAIN:
+        return QCOW2_SUBCLUSTER_ZERO_PLAIN;
+    case QCOW2_CLUSTER_ZERO_ALLOC:
+        return QCOW2_SUBCLUSTER_ZERO_ALLOC;
+    case QCOW2_CLUSTER_NORMAL:
+        return QCOW2_SUBCLUSTER_NORMAL;
+    case QCOW2_CLUSTER_UNALLOCATED:
+        return QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+/*
+ * In an image without subsclusters @l2_bitmap is ignored and
+ * @sc_index must be 0.
+ * Return QCOW2_SUBCLUSTER_INVALID if an invalid l2 entry is detected
+ * (this checks the whole entry and bitmap, not only the bits related
+ * to subcluster @sc_index).
+ */
+static inline
+QCow2SubclusterType qcow2_get_subcluster_type(BlockDriverState *bs,
+                                              uint64_t l2_entry,
+                                              uint64_t l2_bitmap,
+                                              unsigned sc_index)
+{
+    BDRVQcow2State *s = bs->opaque;
+    QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);
+    assert(sc_index < s->subclusters_per_cluster);
+
+    if (has_subclusters(s)) {
+        switch (type) {
+        case QCOW2_CLUSTER_COMPRESSED:
+            return QCOW2_SUBCLUSTER_COMPRESSED;
+        case QCOW2_CLUSTER_NORMAL:
+            if ((l2_bitmap >> 32) & l2_bitmap) {
+                return QCOW2_SUBCLUSTER_INVALID;
+            } else if (l2_bitmap & QCOW_OFLAG_SUB_ZERO(sc_index)) {
+                return QCOW2_SUBCLUSTER_ZERO_ALLOC;
+            } else if (l2_bitmap & QCOW_OFLAG_SUB_ALLOC(sc_index)) {
+                return QCOW2_SUBCLUSTER_NORMAL;
+            } else {
+                return QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC;
+            }
+        case QCOW2_CLUSTER_UNALLOCATED:
+            if (l2_bitmap & QCOW_L2_BITMAP_ALL_ALLOC) {
+                return QCOW2_SUBCLUSTER_INVALID;
+            } else if (l2_bitmap & QCOW_OFLAG_SUB_ZERO(sc_index)) {
+                return QCOW2_SUBCLUSTER_ZERO_PLAIN;
+            } else {
+                return QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
+            }
+        default:
+            g_assert_not_reached();
+        }
+    } else {
+        return qcow2_cluster_to_subcluster_type(type);
+    }
+}
+
 /* Check whether refcounts are eager or lazy */
 static inline bool qcow2_need_accurate_refcounts(BDRVQcow2State *s)
 {
-- 
2.20.1


