Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019CB1F578F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:17:30 +0200 (CEST)
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2To-0004MA-P6
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gv-0002gd-IN; Wed, 10 Jun 2020 11:04:09 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gr-0006wD-FP; Wed, 10 Jun 2020 11:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=wwP+F61UHuBD2MYWJK+ZYjI142FX+Mf725oBfkWGky0=; 
 b=Gr5+q/YR5Qtn1aQNXbzPMc0bF3iA+k7xsybnQlVTWyPRyKfl8SY1hPIq4kKiNGyDvSuS3ux429tlYtOKYjoQjQsCACdiyZ1dBr6PzSeRcRsQ/92Ng8BNvw65YJgK/xP8kP2BQJ69Yvuwsp5WyVmJXsqma4iopB82WBm95fS9xixvm6l2FvbvZ5dVDTyqN7Xh3OYZdrCiZNViWg2bfLIBndauZMi8chFCi7PUQC5RZju4FnYB1a+rv8ohOgLUVm0A72jiyJzP96/f9cqulzwy+LHedRcxgryNgeDJtA2POUQxurESpvUVtEHBgEllbkjl0Sq2iC9YdqN+/X2VuB/uug==;
Received: from [81.0.38.199] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jj2GR-0007h7-Jp; Wed, 10 Jun 2020 17:03:39 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jj2GC-0007NT-BL; Wed, 10 Jun 2020 17:03:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 23/34] qcow2: Add subcluster support to
 discard_in_l2_slice()
Date: Wed, 10 Jun 2020 17:03:01 +0200
Message-Id: <402a16641f750c1069e0926c454f1da7b2eca10b.1591801197.git.berto@igalia.com>
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

Two things need to be taken into account here:

1) With full_discard == true the L2 entry must be cleared completely.
   This also includes the L2 bitmap if the image has extended L2
   entries.

2) With full_discard == false we have to make the discarded cluster
   read back as zeroes. With normal L2 entries this is done with the
   QCOW_OFLAG_ZERO bit, whereas with extended L2 entries this is done
   with the individual 'all zeroes' bits for each subcluster.

   Note however that QCOW_OFLAG_ZERO is not supported in v2 qcow2
   images so, if there is a backing file, discard cannot guarantee
   that the image will read back as zeroes. If this is important for
   the caller it should forbid it as qcow2_co_pdiscard() does (see
   80f5c01183 for more details).

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2-cluster.c | 52 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 4e59bbd545..edfc8ea91c 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1847,11 +1847,17 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     assert(nb_clusters <= INT_MAX);
 
     for (i = 0; i < nb_clusters; i++) {
-        uint64_t old_l2_entry;
-
-        old_l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
+        uint64_t old_l2_entry = get_l2_entry(s, l2_slice, l2_index + i);
+        uint64_t old_l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
+        uint64_t new_l2_entry = old_l2_entry;
+        uint64_t new_l2_bitmap = old_l2_bitmap;
+        QCow2ClusterType cluster_type =
+            qcow2_get_cluster_type(bs, old_l2_entry);
 
         /*
+         * If full_discard is true, the cluster should not read back as zeroes,
+         * but rather fall through to the backing file.
+         *
          * If full_discard is false, make sure that a discarded area reads back
          * as zeroes for v3 images (we cannot do it for v2 without actually
          * writing a zero-filled buffer). We can skip the operation if the
@@ -1860,40 +1866,28 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
          *
          * TODO We might want to use bdrv_block_status(bs) here, but we're
          * holding s->lock, so that doesn't work today.
-         *
-         * If full_discard is true, the sector should not read back as zeroes,
-         * but rather fall through to the backing file.
          */
-        switch (qcow2_get_cluster_type(bs, old_l2_entry)) {
-        case QCOW2_CLUSTER_UNALLOCATED:
-            if (full_discard || !bs->backing) {
-                continue;
+        if (full_discard) {
+            new_l2_entry = new_l2_bitmap = 0;
+        } else if (bs->backing || qcow2_cluster_is_allocated(cluster_type)) {
+            if (has_subclusters(s)) {
+                new_l2_entry = 0;
+                new_l2_bitmap = QCOW_L2_BITMAP_ALL_ZEROES;
+            } else {
+                new_l2_entry = s->qcow_version >= 3 ? QCOW_OFLAG_ZERO : 0;
             }
-            break;
+        }
 
-        case QCOW2_CLUSTER_ZERO_PLAIN:
-            if (!full_discard) {
-                continue;
-            }
-            break;
-
-        case QCOW2_CLUSTER_ZERO_ALLOC:
-        case QCOW2_CLUSTER_NORMAL:
-        case QCOW2_CLUSTER_COMPRESSED:
-            break;
-
-        default:
-            abort();
+        if (old_l2_entry == new_l2_entry && old_l2_bitmap == new_l2_bitmap) {
+            continue;
         }
 
         /* First remove L2 entries */
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-        if (!full_discard && s->qcow_version >= 3) {
-            set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
-        } else {
-            set_l2_entry(s, l2_slice, l2_index + i, 0);
+        set_l2_entry(s, l2_slice, l2_index + i, new_l2_entry);
+        if (has_subclusters(s)) {
+            set_l2_bitmap(s, l2_slice, l2_index + i, new_l2_bitmap);
         }
-
         /* Then decrease the refcount */
         qcow2_free_any_clusters(bs, old_l2_entry, 1, type);
     }
-- 
2.20.1


