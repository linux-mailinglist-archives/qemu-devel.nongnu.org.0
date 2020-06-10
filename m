Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD961F5745
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:07:06 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2Jl-00051T-Kf
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gb-0002J6-Th; Wed, 10 Jun 2020 11:03:49 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2GX-0006vz-C7; Wed, 10 Jun 2020 11:03:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=VTJ0AleYo0FtKqUbQGMQJVxhmwOgUpH8CMhdCjrgWgs=; 
 b=jL2wnb5Mdn4V8Lplb5aCBWpZiAQgITHO91qcKVX705DrdvSUAhhKspvDEQRmdLblkj06YYO+nfZtGoAcUc3qRfkCPTShzHQV+OM2gtSeSC+YXtZC4rgUnSqpeXpqxXJeoxz5F1VItEgc3rd30kQjTccn57NpYDEW3nX5pYIoRsNTdKmmYmeWQJHht6fgsKNkdhvJKNdqzlOlngW73QjxQf+5+EDepzqkYVTpNsI0szi/in3UtVQxejg+4EnSIECwD9FaMmPX1DmWzEZ9cUt0MkZ8XAe9i+Slf01I4Ag6NDjFCAU5OoaB+dmebBvaksgk+X5Q7z/XwHDM6csjv8woeA==;
Received: from [81.0.38.199] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jj2GR-0007gv-CG; Wed, 10 Jun 2020 17:03:39 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jj2GC-0007N4-3H; Wed, 10 Jun 2020 17:03:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/34] qcow2: Add qcow2_get_subcluster_range_type()
Date: Wed, 10 Jun 2020 17:02:53 +0200
Message-Id: <812b66824859bee38019fc4d35bda0985b13789f.1591801197.git.berto@igalia.com>
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

There are situations in which we want to know how many contiguous
subclusters of the same type there are in a given cluster. This can be
done by simply iterating over the subclusters and repeatedly calling
qcow2_get_subcluster_type() for each one of them.

However once we determined the type of a subcluster we can check the
rest efficiently by counting the number of adjacent ones (or zeroes)
in the bitmap. This is what this function does.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-cluster.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 8b2fc550b7..32dc6e75e3 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -375,6 +375,57 @@ fail:
     return ret;
 }
 
+/*
+ * For a given L2 entry, count the number of contiguous subclusters of
+ * the same type starting from @sc_from. Compressed clusters are
+ * treated as if they were divided into subclusters of size
+ * s->subcluster_size.
+ *
+ * Return the number of contiguous subclusters and set @type to the
+ * subcluster type.
+ *
+ * If the L2 entry is invalid return -errno and set @type to
+ * QCOW2_SUBCLUSTER_INVALID.
+ */
+G_GNUC_UNUSED
+static int qcow2_get_subcluster_range_type(BlockDriverState *bs,
+                                           uint64_t l2_entry,
+                                           uint64_t l2_bitmap,
+                                           unsigned sc_from,
+                                           QCow2SubclusterType *type)
+{
+    BDRVQcow2State *s = bs->opaque;
+    uint32_t val;
+
+    *type = qcow2_get_subcluster_type(bs, l2_entry, l2_bitmap, sc_from);
+
+    if (*type == QCOW2_SUBCLUSTER_INVALID) {
+        return -EINVAL;
+    } else if (!has_subclusters(s) || *type == QCOW2_SUBCLUSTER_COMPRESSED) {
+        return s->subclusters_per_cluster - sc_from;
+    }
+
+    switch (*type) {
+    case QCOW2_SUBCLUSTER_NORMAL:
+        val = l2_bitmap | QCOW_OFLAG_SUB_ALLOC_RANGE(0, sc_from);
+        return cto32(val) - sc_from;
+
+    case QCOW2_SUBCLUSTER_ZERO_PLAIN:
+    case QCOW2_SUBCLUSTER_ZERO_ALLOC:
+        val = (l2_bitmap | QCOW_OFLAG_SUB_ZERO_RANGE(0, sc_from)) >> 32;
+        return cto32(val) - sc_from;
+
+    case QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN:
+    case QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC:
+        val = ((l2_bitmap >> 32) | l2_bitmap)
+            & ~QCOW_OFLAG_SUB_ALLOC_RANGE(0, sc_from);
+        return ctz32(val) - sc_from;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Checks how many clusters in a given L2 slice are contiguous in the image
  * file. As soon as one of the flags in the bitmask stop_flags changes compared
-- 
2.20.1


