Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C07D20C7A6
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 13:24:16 +0200 (CEST)
Received: from localhost ([::1]:50762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpVPz-0001s1-AW
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 07:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6T-0007Xh-7D; Sun, 28 Jun 2020 07:04:05 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6M-0000Xd-1a; Sun, 28 Jun 2020 07:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=vkGYrXfcdj4PNvZd6fOUVK45aqY2/Zl/2hS53SipmT0=; 
 b=DgYEfOLcgW4Anc1v8HxI5CABUq0sDgaJ2oL0Q3h5szK5GCrSW2XBi9kAy7nMBcXspWHabm/xwUsFZB5wTju9hn56eJUwVAqdSf9hTZMrje4Ly0RxCtIuaC89Lzp5uSdMobe+vCPxAArktxx2eDY8f+dozUWU/p5X3vQulv8kgxhmb9kNiiZ6w3tBsrBZ40jf4a8R2+JKBrMJOjhh2VoNUad5NXMyLaQJIFBEbTqRC0g3jrCdiO7LdQguxTMI1UKxu+UxcmFHPvTSqaonFO7XQwzRNjuBHCkvjwVlIaxBYyyzwk5urFgbM+es9dkSuBA4J00dKffHX83ddOMct2eJiA==;
Received: from 26.red-79-158-236.dynamicip.rima-tde.net ([79.158.236.26]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jpV5Y-0002gt-D0; Sun, 28 Jun 2020 13:03:10 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jpV5I-00039i-CH; Sun, 28 Jun 2020 13:02:52 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 30/34] qcow2: Add prealloc field to QCowL2Meta
Date: Sun, 28 Jun 2020 13:02:39 +0200
Message-Id: <0dd88b3b4d3e90b28267267d7686cf5350d9dea0.1593342067.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593342067.git.berto@igalia.com>
References: <cover.1593342067.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 07:03:08
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

This field allows us to indicate that the L2 metadata update does not
come from a write request with actual data but from a preallocation
request.

For traditional images this does not make any difference, but for
images with extended L2 entries this means that the clusters are
allocated normally in the L2 table but individual subclusters are
marked as unallocated.

This will allow preallocating images that have a backing file.

There is one special case: when we resize an existing image we can
also request that the new clusters are preallocated. If the image
already had a backing file then we have to hide any possible stale
data and zero out the new clusters (see commit 955c7d6687 for more
details).

In this case the subclusters cannot be left as unallocated so the L2
bitmap must be updated.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/qcow2.h         | 8 ++++++++
 block/qcow2-cluster.c | 2 +-
 block/qcow2.c         | 6 ++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 4ef4ae4ab0..f3499e53bf 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -463,6 +463,14 @@ typedef struct QCowL2Meta
      */
     bool skip_cow;
 
+    /**
+     * Indicates that this is not a normal write request but a preallocation.
+     * If the image has extended L2 entries this means that no new individual
+     * subclusters will be marked as allocated in the L2 bitmap (but any
+     * existing contents of that bitmap will be kept).
+     */
+    bool prealloc;
+
     /**
      * The I/O vector with the data from the actual guest write request.
      * If non-NULL, this is meant to be merged together with the data
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 1641976028..c8217081f2 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1066,7 +1066,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
         set_l2_entry(s, l2_slice, l2_index + i, offset | QCOW_OFLAG_COPIED);
 
         /* Update bitmap with the subclusters that were just written */
-        if (has_subclusters(s)) {
+        if (has_subclusters(s) && !m->prealloc) {
             uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
             unsigned written_from = m->cow_start.offset;
             unsigned written_to = m->cow_end.offset + m->cow_end.nb_bytes ?:
diff --git a/block/qcow2.c b/block/qcow2.c
index 72bd25e774..003f166024 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2086,6 +2086,7 @@ static coroutine_fn int qcow2_handle_l2meta(BlockDriverState *bs,
         QCowL2Meta *next;
 
         if (link_l2) {
+            assert(!l2meta->prealloc);
             ret = qcow2_alloc_cluster_link_l2(bs, l2meta);
             if (ret) {
                 goto out;
@@ -3131,6 +3132,7 @@ static int coroutine_fn preallocate_co(BlockDriverState *bs, uint64_t offset,
 
         while (meta) {
             QCowL2Meta *next = meta->next;
+            meta->prealloc = true;
 
             ret = qcow2_alloc_cluster_link_l2(bs, meta);
             if (ret < 0) {
@@ -4224,6 +4226,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
         int64_t clusters_allocated;
         int64_t old_file_size, last_cluster, new_file_size;
         uint64_t nb_new_data_clusters, nb_new_l2_tables;
+        bool subclusters_need_allocation = false;
 
         /* With a data file, preallocation means just allocating the metadata
          * and forwarding the truncate request to the data file */
@@ -4305,6 +4308,8 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
                                    BDRV_REQ_ZERO_WRITE, NULL);
             if (ret >= 0) {
                 flags &= ~BDRV_REQ_ZERO_WRITE;
+                /* Ensure that we read zeroes and not backing file data */
+                subclusters_need_allocation = true;
             }
         } else {
             ret = -1;
@@ -4343,6 +4348,7 @@ static int coroutine_fn qcow2_co_truncate(BlockDriverState *bs, int64_t offset,
                     .offset       = nb_clusters << s->cluster_bits,
                     .nb_bytes     = 0,
                 },
+                .prealloc     = !subclusters_need_allocation,
             };
             qemu_co_queue_init(&allocation.dependent_requests);
 
-- 
2.20.1


