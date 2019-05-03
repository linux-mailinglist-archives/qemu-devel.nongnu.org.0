Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C98B12AD0
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 11:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMUfz-00031D-AQ
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 05:40:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hMUex-0002bZ-Hg
	for qemu-devel@nongnu.org; Fri, 03 May 2019 05:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hMUeu-0005MH-N5
	for qemu-devel@nongnu.org; Fri, 03 May 2019 05:39:15 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:36030)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hMUeu-0005J5-4l; Fri, 03 May 2019 05:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:Cc:To:From;
	bh=jzIvCeYjHa1BNoF9zJsEAuP4EQ3Rz6mekQkzZKCVRGA=; 
	b=OQrjdLTndLRcQVnyvUjHv4SJKuzanthl2vBnQynvVe4UVwLe7khCV3/9iebiBqlh9/JxeaNG9GzvqqAmyBUyTFwPGkmFUfyBXqlYaC4Kgroid9JqoRRxTDXcyQfqOpg09ZCVTcXccUn4duTqfr6oWIV1YBhi9/JinCHIVKLYjIA3FKz4pe4+JZ5t8clNq+I0nvNnN1p/cTi987h1Y8P4rAiH16As+tTSdRX04uZNhZAWpvoELy65eHzzjbZpGTtQ7BS0mqM5VIP0X9oLDFEgdKNOvuqHLF7ga4YECt5vNFDG1hPXXzmWg4WLApS+24Jnv1HhMf5jVB2D9HcV08E8mQ==;
Received: from 87-92-6-174.bb.dnainternet.fi ([87.92.6.174] helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hMUec-00061g-DH; Fri, 03 May 2019 11:38:54 +0200
Received: from berto by perseus.local with local (Exim 4.89)
	(envelope-from <berto@igalia.com>)
	id 1hMUeN-0002MC-Pq; Fri, 03 May 2019 12:38:39 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 12:38:32 +0300
Message-Id: <20190503093832.9015-1-berto@igalia.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: [Qemu-devel] [PATCH] qcow2: Assert that host cluster offsets fit in
 L2 table entries
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
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
---
 block/qcow2-cluster.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 974a4e8656..4a96966ab9 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -799,6 +799,10 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     nb_csectors = ((cluster_offset + compressed_size - 1) >> 9) -
                   (cluster_offset >> 9);
 
+    /* The offset and size must fit in their fields of the L2 table entry */
+    assert((cluster_offset & s->cluster_offset_mask) == cluster_offset);
+    assert((nb_csectors & s->csize_mask) == nb_csectors);
+
     cluster_offset |= QCOW_OFLAG_COMPRESSED |
                       ((uint64_t)nb_csectors << s->csize_shift);
 
@@ -984,6 +988,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
 
     assert(l2_index + m->nb_clusters <= s->l2_slice_size);
     for (i = 0; i < m->nb_clusters; i++) {
+        uint64_t offset = cluster_offset + (i << s->cluster_bits);
         /* if two concurrent writes happen to the same unallocated cluster
          * each write allocates separate cluster and writes data concurrently.
          * The first one to complete updates l2 table with pointer to its
@@ -994,8 +999,10 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
             old_cluster[j++] = l2_slice[l2_index + i];
         }
 
-        l2_slice[l2_index + i] = cpu_to_be64((cluster_offset +
-                    (i << s->cluster_bits)) | QCOW_OFLAG_COPIED);
+        /* The offset must fit in the offset field of the L2 table entry */
+        assert((offset & L2E_OFFSET_MASK) == offset);
+
+        l2_slice[l2_index + i] = cpu_to_be64(offset | QCOW_OFLAG_COPIED);
      }
 
 
@@ -1928,6 +1935,9 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         goto fail;
                     }
 
+                    /* The offset must fit in the offset field */
+                    assert((offset & L2E_OFFSET_MASK) == offset);
+
                     if (l2_refcount > 1) {
                         /* For shared L2 tables, set the refcount accordingly
                          * (it is already 1 and needs to be l2_refcount) */
-- 
2.11.0


