Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27F128DB1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:40:25 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizax-0004mi-M7
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:40:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41523)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizYp-0002ny-H6
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizYn-0005bO-RZ
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:11 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizYn-0004Uu-Cm; Sun, 22 Dec 2019 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=sKZ/LI8kUszYPtNMyvsyF4RnStAXro4R3DTVZkwSSf4=; 
 b=cyWlLEdfBFr+4u6ipZKz7vU6+IMGHm/vwzdw+PFF0EGZA7jgijvi7TIsUahhATyp/0aRlj16hQW9RT50vKe3ub3aboC0ZFckOxIyaGGLlvnQejcfXv40nlB9bficQEBxjb7aMSFHsms2w8eUD0j+UoILyrAT4UweHT3dMUVex0r8cPpkopi4slcKUZJDeac5C1pdSzuk20w0/PMFyaT0dd0Gb/3of2D0DrSZXWjjfEBgf4zlZw/kn/qk1fPQ1HU37h7wqsaSCHIo9eqTByI3zdkXIVsoHeKUpNFVLpgyCqwZnA6cEQj14rCFcDgoWCwpsjsO6IdDZQNrZQwwbJOZ7w==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dD-MH; Sun, 22 Dec 2019 12:37:52 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001Vo-I0; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 11/27] qcow2: Add QCow2SubclusterType and
 qcow2_get_subcluster_type()
Date: Sun, 22 Dec 2019 12:36:52 +0100
Message-Id: <124dca3e5be368048346209754fec38dff404990.1577014346.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577014346.git.berto@igalia.com>
References: <cover.1577014346.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
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
---
 block/qcow2.h | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index 64b0a814f4..321ba9550f 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -80,6 +80,15 @@
 
 #define QCOW_MAX_SUBCLUSTERS_PER_CLUSTER 32
 
+/* The subcluster X [0..31] reads as zeroes */
+#define QCOW_OFLAG_SUB_ZERO(X)    ((1ULL << 63) >> (X))
+/* The subcluster X [0..31] is allocated */
+#define QCOW_OFLAG_SUB_ALLOC(X)   ((1ULL << 31) >> (X))
+/* L2 entry bitmap with all "read as zeroes" bits set */
+#define QCOW_L2_BITMAP_ALL_ZEROES 0xFFFFFFFF00000000ULL
+/* L2 entry bitmap with all allocation bits set */
+#define QCOW_L2_BITMAP_ALL_ALLOC  0x00000000FFFFFFFFULL
+
 /* Size of normal and extended L2 entries */
 #define L2E_SIZE_NORMAL   (sizeof(uint64_t))
 #define L2E_SIZE_EXTENDED (sizeof(uint64_t) * 2)
@@ -455,6 +464,16 @@ typedef enum QCow2ClusterType {
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
@@ -632,6 +651,79 @@ static inline QCow2ClusterType qcow2_get_cluster_type(BlockDriverState *bs,
     }
 }
 
+/* For an image without extended L2 entries, return the
+ * QCow2SubclusterType equivalent of a given QCow2ClusterType */
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
+/* In an image without subsclusters @l2_bitmap is ignored and
+ * @sc_index must be 0. */
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
+        bool sc_zero  = l2_bitmap & QCOW_OFLAG_SUB_ZERO(sc_index);
+        bool sc_alloc = l2_bitmap & QCOW_OFLAG_SUB_ALLOC(sc_index);
+        switch (type) {
+        case QCOW2_CLUSTER_COMPRESSED:
+            if (l2_bitmap != 0) {
+                return QCOW2_SUBCLUSTER_INVALID;
+            }
+            return QCOW2_SUBCLUSTER_COMPRESSED;
+        case QCOW2_CLUSTER_ZERO_PLAIN:
+        case QCOW2_CLUSTER_ZERO_ALLOC:
+            return QCOW2_SUBCLUSTER_INVALID;
+        case QCOW2_CLUSTER_NORMAL:
+            if (!sc_zero && !sc_alloc) {
+                return QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC;
+            } else if (!sc_zero && sc_alloc) {
+                return QCOW2_SUBCLUSTER_NORMAL;
+            } else if (sc_zero && !sc_alloc) {
+                return QCOW2_SUBCLUSTER_ZERO_ALLOC;
+            } else { /* sc_zero && sc_alloc */
+                return QCOW2_SUBCLUSTER_INVALID;
+            }
+        case QCOW2_CLUSTER_UNALLOCATED:
+            if (!sc_zero && !sc_alloc) {
+                return QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN;
+            } else if (!sc_zero && sc_alloc) {
+                return QCOW2_SUBCLUSTER_INVALID;
+            } else if (sc_zero && !sc_alloc) {
+                return QCOW2_SUBCLUSTER_ZERO_PLAIN;
+            } else { /* sc_zero && sc_alloc */
+                return QCOW2_SUBCLUSTER_INVALID;
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


