Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B529139588
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 17:14:03 +0100 (CET)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ir2Lq-0001wg-EM
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 11:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ir2Kj-0001CF-07
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:12:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ir2Kh-0000ya-N9
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 11:12:52 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:43257)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ir2Kh-0000Xf-5k; Mon, 13 Jan 2020 11:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=Va+/q+FVHCj5AkbAoBAwhwM46fRIevZCHDFAEqnHMNQ=; 
 b=IGvP1SXkR8aZoAq2d8LY4ikCfD/DbPuHg4i8/KDdesPGO7moUu6o04kO0DU6TgJC2Kygsgajjt1ivVKXRokk86gsgY8yEMPwuiDsI2qhRY9b21ozNncpEjT1+3xgCpx5oftf4XWmzdrhVE/FMVU2eaS63c/Z4wiUK/zu12NlOhUeA0seIQoWcx5QmtEgRHaFe9GRuUMWWeqaxs8aN4/JQDxUXMxCkK8sswOq85PgdDocXnYREKWp092Px49YKoVxLpZ6uNuEYOMsQs6ZFNaKaDYMVCSj7NatofFpob6Ie4XJaydaI+ShMGajFoO9ZgpeYuwBEJlXqKGzq9LVgLHiPQ==;
Received: from [192.168.12.213] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1ir2KM-0000nT-W3; Mon, 13 Jan 2020 17:12:31 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1ir2Ji-0005Ey-Ur; Mon, 13 Jan 2020 17:11:50 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qcow2: Assert that host cluster offsets fit in L2 table
 entries
Date: Mon, 13 Jan 2020 17:11:46 +0100
Message-Id: <20200113161146.20099-1-berto@igalia.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The standard cluster descriptor in L2 table entries has a field to
store the host cluster offset. When we need to get that offset from an
entry we use L2E_OFFSET_MASK to ensure that we only use the bits that
belong to that field.

But while that mask is used every time we read from an L2 entry, it
is never used when we write to it. Due to the QCOW_MAX_CLUSTER_OFFSET
limit set in the cluster allocation code QEMU can never produce
offsets that don't fit in that field so any such offset would indicate
a bug in QEMU.

Compressed cluster descriptors contain two fields (host cluster offset
and size of the compressed data) and the situation with them is
similar. In this case the masks are not constant but are stored in the
csize_mask and cluster_offset_mask fields of BDRVQcow2State.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
v2: the previous version was sent months ago but fell through the
    cracks, so I'm resending it. I rebased it although the patch
    doesn't need any changes.

 block/qcow2-cluster.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 8982b7b762..e9431f6785 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -777,6 +777,10 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
         (cluster_offset + compressed_size - 1) / QCOW2_COMPRESSED_SECTOR_SIZE -
         (cluster_offset / QCOW2_COMPRESSED_SECTOR_SIZE);
 
+    /* The offset and size must fit in their fields of the L2 table entry */
+    assert((cluster_offset & s->cluster_offset_mask) == cluster_offset);
+    assert((nb_csectors & s->csize_mask) == nb_csectors);
+
     cluster_offset |= QCOW_OFLAG_COMPRESSED |
                       ((uint64_t)nb_csectors << s->csize_shift);
 
@@ -972,6 +976,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 
     assert(l2_index + m->nb_clusters <= s->l2_slice_size);
     for (i = 0; i < m->nb_clusters; i++) {
+        uint64_t offset = cluster_offset + (i << s->cluster_bits);
         /* if two concurrent writes happen to the same unallocated cluster
          * each write allocates separate cluster and writes data concurrently.
          * The first one to complete updates l2 table with pointer to its
@@ -982,8 +987,10 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
             old_cluster[j++] = l2_slice[l2_index + i];
         }
 
-        l2_slice[l2_index + i] = cpu_to_be64((cluster_offset +
-                    (i << s->cluster_bits)) | QCOW_OFLAG_COPIED);
+        /* The offset must fit in the offset field of the L2 table entry */
+        assert((offset & L2E_OFFSET_MASK) == offset);
+
+        l2_slice[l2_index + i] = cpu_to_be64(offset | QCOW_OFLAG_COPIED);
      }
 
 
@@ -1913,6 +1920,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         goto fail;
                     }
 
+                    /* The offset must fit in the offset field */
+                    assert((offset & L2E_OFFSET_MASK) == offset);
+
                     if (l2_refcount > 1) {
                         /* For shared L2 tables, set the refcount accordingly
                          * (it is already 1 and needs to be l2_refcount) */
-- 
2.20.1


