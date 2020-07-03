Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD31C213D70
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 18:18:07 +0200 (CEST)
Received: from localhost ([::1]:57724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrOO6-0001wL-Os
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 12:18:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5p-0003Y0-4M; Fri, 03 Jul 2020 11:59:13 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:41724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jrO5k-0007Ro-Ms; Fri, 03 Jul 2020 11:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=aMuuCrkm6jb/Fwfen0zTLd5G0fJLNMoVelFlkz/Cs/c=; 
 b=BEIrUmBEwz8flFvlyiRYmL7oS2bS+uJxPNI4ylppYR4u0Ug+2vJ8mqsOeC5Xa+nITLHJGoc/k1n+Bdk6BbCcV2jvuuJQlHcUxNAFRtmKnCnIxjeDo5SfxJOY7VJ4eZeHW2Xw0ge8aXmI6WEnTmkRmUMCU0WjPiaq510e0TepDC3hpO/WZz3vE2owwIqSvZzUlEIxSiG8yyQwe2eJlVl9xjLXeUjWLwbCA9NlQGl4oFJfRrvWGgXh3UYgCIZ/U8Q9eZCJdMC3b2QtvFXZ5ualZs37W9g4jmbPvYBmJObeZJJ8xn/vvRxGtjy61i9RWY8S3BXfOF3Zp643bW7nY55UWA==;
Received: from [81.0.49.0] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jrO5L-0001Qe-EU; Fri, 03 Jul 2020 17:58:43 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jrO52-0007QC-7P; Fri, 03 Jul 2020 17:58:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 22/34] qcow2: Add subcluster support to zero_in_l2_slice()
Date: Fri,  3 Jul 2020 17:58:08 +0200
Message-Id: <7063755ad1c4f0f930f6816f9f00e9b94e927351.1593791819.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593791819.git.berto@igalia.com>
References: <cover.1593791819.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 11:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

The QCOW_OFLAG_ZERO bit that indicates that a cluster reads as
zeroes is only used in standard L2 entries. Extended L2 entries use
individual 'all zeroes' bits for each subcluster.

This must be taken into account when updating the L2 entry and also
when deciding that an existing entry does not need to be updated.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-cluster.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 492296a90f..cb07fd00a1 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1957,7 +1957,6 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     int l2_index;
     int ret;
     int i;
-    bool unmap = !!(flags & BDRV_REQ_MAY_UNMAP);
 
     ret = get_cluster_table(bs, offset, &l2_slice, &l2_index);
     if (ret < 0) {
@@ -1969,28 +1968,31 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     assert(nb_clusters <= INT_MAX);
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t old_offset;
-        QCow2ClusterType cluster_type;
+        uint64_t old_l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
+        uint64_t old_l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+        QCow2ClusterType type = qcow2_get_cluster_type(bs, old_l2_entry);
+        bool unmap = (type == QCOW2_CLUSTER_COMPRESSED) ||
+            ((flags & BDRV_REQ_MAY_UNMAP) && qcow2_cluster_is_allocated(type));
+        uint64_t new_l2_entry = unmap ? 0 : old_l2_entry;
+        uint64_t new_l2_bitmap = old_l2_bitmap;
 
-        old_offset = get_l2_entry(s, l2_slice, l2_index + i);
+        if (has_subclusters(s)) {
+            new_l2_bitmap = QCOW_L2_BITMAP_ALL_ZEROES;
+        } else {
+            new_l2_entry |= QCOW_OFLAG_ZERO;
+        }
 
-        /*
-         * Minimize L2 changes if the cluster already reads back as
-         * zeroes with correct allocation.
-         */
-        cluster_type = qcow2_get_cluster_type(bs, old_offset);
-        if (cluster_type == QCOW2_CLUSTER_ZERO_PLAIN ||
-            (cluster_type == QCOW2_CLUSTER_ZERO_ALLOC && !unmap)) {
+        if (old_l2_entry == new_l2_entry && old_l2_bitmap == new_l2_bitmap) {
             continue;
         }
 
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-        if (cluster_type == QCOW2_CLUSTER_COMPRESSED || unmap) {
-            set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
-            qcow2_free_any_clusters(bs, old_offset, 1, QCOW2_DISCARD_REQUEST);
-        } else {
-            uint64_t entry = get_l2_entry(s, l2_slice, l2_index + i);
-            set_l2_entry(s, l2_slice, l2_index + i, entry | QCOW_OFLAG_ZERO);
+        if (unmap) {
+            qcow2_free_any_clusters(bs, old_l2_entry, 1, QCOW2_DISCARD_REQUEST);
+        }
+        set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
+        if (has_subclusters(s)) {
+            set_l2_bitmap(s, l2_slice, l2_index + i, new_l2_bitmap);
         }
     }
 
-- 
2.20.1


