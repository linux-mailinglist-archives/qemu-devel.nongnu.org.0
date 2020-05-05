Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14C21C5F20
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 19:44:27 +0200 (CEST)
Received: from localhost ([::1]:51248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jW1cI-0005KH-HC
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 13:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1Xd-0006qb-2m; Tue, 05 May 2020 13:39:37 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jW1Xb-0008A1-J6; Tue, 05 May 2020 13:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=OzcuQ93stjNT5Z/5Ct91V4VOKF7GOZGb/iVq4+6tkDk=; 
 b=Kms9Wt9G/GmkpZI2BOJv2MtskZ4eCCv8hJ/b9XXaqOn7sQvhYzl6srm3HVm7lZu3MEZ5n7ien6umfXxTIuQ6PKRtyR0yOBaRj3B6PDCmjfUtjEv2hnAs4CeTF6X7MU1BRNP9BFZgpo/DgoFuaVYe4EI/Pf/VGVyQOr27STC6hEi5ptK7XYqR4OYRkMAZt7yMkchuVGDmdFiVOPd8tBmD7V05igKcvJPtQ8WzRR0pngi8llcHcRpMVNsmtVL0tcC593xl2R0y0Gjfn+B0kScvZ1dS0DtQoSBHZbaJr3iCICeUE2tdmR66cW0HhKwfelaP+rriBWS2umgcmn4mRquEjg==;
Received: from static.160.43.0.81.ibercom.com ([81.0.43.160]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jW1Ws-00025U-ER; Tue, 05 May 2020 19:38:50 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jW1Wd-00044D-3r; Tue, 05 May 2020 19:38:35 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/31] qcow2: Add subcluster support to zero_in_l2_slice()
Date: Tue,  5 May 2020 19:38:21 +0200
Message-Id: <6d0481b79b5ecf9e3ba1496ef550e1e830073de6.1588699789.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1588699789.git.berto@igalia.com>
References: <cover.1588699789.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 13:38:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QCOW_OFLAG_ZERO bit that indicates that a cluster reads as
zeroes is only used in standard L2 entries. Extended L2 entries use
individual 'all zeroes' bits for each subcluster.

This must be taken into account when updating the L2 entry and also
when deciding that an existing entry does not need to be updated.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index f500cbfb8e..bf32ed0825 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1913,7 +1913,6 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
     int l2_index;
     int ret;
     int i;
-    bool unmap = !!(flags & BDRV_REQ_MAY_UNMAP);
 
     ret = get_cluster_table(bs, offset, &l2_slice, &l2_index);
     if (ret < 0) {
@@ -1925,28 +1924,31 @@ static int zero_in_l2_slice(BlockDriverState *bs, uint64_t offset,
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


