Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB50E2AC2B6
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 18:43:31 +0100 (CET)
Received: from localhost ([::1]:43778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcBCU-0003ZP-U4
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 12:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcB8A-0006bd-ER
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:39:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kcB81-0000Op-E5
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 12:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604943532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSpYS59Y4m3uZu2muHj0FSIVEK4b/Sj529YepX4aXxQ=;
 b=OEnGLj1BYx/PCTZi1jqBRAVHum3VT9THOKkFf05eeu67oB9thN14l30KSqr0k0C9gyRnBz
 zxor9YVsFJhKI66nkX1jx9WiGg/9UQxg5zcotPTNBVub9enmABPeibBrr9WfwZWlkeWQ7N
 Cw+u+Kyr16NGSVQtrBI5t4cMWqlN6cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-rodt8OuyM1eWqGgjzEmtiQ-1; Mon, 09 Nov 2020 12:38:49 -0500
X-MC-Unique: rodt8OuyM1eWqGgjzEmtiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA7E5F9DE;
 Mon,  9 Nov 2020 17:38:48 +0000 (UTC)
Received: from localhost (ovpn-113-179.ams2.redhat.com [10.36.113.179])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 381EC5C1D0;
 Mon,  9 Nov 2020 17:38:48 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/15] qcow2: Document and enforce the QCowL2Meta invariants
Date: Mon,  9 Nov 2020 18:38:27 +0100
Message-Id: <20201109173839.2135984-4-mreitz@redhat.com>
In-Reply-To: <20201109173839.2135984-1-mreitz@redhat.com>
References: <20201109173839.2135984-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

The QCowL2Meta structure is used to store information about a part of
a write request that touches clusters that need changes in their L2
entries. This happens with newly-allocated clusters or subclusters.

This structure has changed a bit since it was first created and its
current documentation is not quite up-to-date.

A write request can span a region consisting of a combination of
clusters of different types, and qcow2_alloc_host_offset() can
repeatedly call handle_copied() and handle_alloc() to add more
clusters to the mix as long as they all are contiguous on the image
file.

Because of this a write request has a list of QCowL2Meta structures,
one for each part of the request that needs changes in the L2
metadata.

Each one of them spans nb_clusters and has two copy-on-write regions
located immediately before and after the middle region touched by that
part of the write request. Even when those regions themselves are
empty their offsets must be correct because they are used to know the
location of the middle region.

This was not always the case but it is not a problem anymore
because the only two places where QCowL2Meta structures are created
(calculate_l2_meta() and qcow2_co_truncate()) ensure that the
copy-on-write regions are correctly defined, and so do assertions like
the ones in perform_cow().

The conditional initialization of the 'written_to' variable is
therefore unnecessary and is removed by this patch.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201007161323.4667-1-berto@igalia.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h         | 19 +++++++++++--------
 block/qcow2-cluster.c |  5 +++--
 block/qcow2.c         | 19 +++++++++++++++----
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index 125ea9679b..2e0272a7b8 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -435,17 +435,18 @@ typedef struct Qcow2COWRegion {
 
 /**
  * Describes an in-flight (part of a) write request that writes to clusters
- * that are not referenced in their L2 table yet.
+ * that need to have their L2 table entries updated (because they are
+ * newly allocated or need changes in their L2 bitmaps)
  */
 typedef struct QCowL2Meta
 {
-    /** Guest offset of the first newly allocated cluster */
+    /** Guest offset of the first updated cluster */
     uint64_t offset;
 
-    /** Host offset of the first newly allocated cluster */
+    /** Host offset of the first updated cluster */
     uint64_t alloc_offset;
 
-    /** Number of newly allocated clusters */
+    /** Number of updated clusters */
     int nb_clusters;
 
     /** Do not free the old clusters */
@@ -458,14 +459,16 @@ typedef struct QCowL2Meta
     CoQueue dependent_requests;
 
     /**
-     * The COW Region between the start of the first allocated cluster and the
-     * area the guest actually writes to.
+     * The COW Region immediately before the area the guest actually
+     * writes to. This (part of the) write request starts at
+     * cow_start.offset + cow_start.nb_bytes.
      */
     Qcow2COWRegion cow_start;
 
     /**
-     * The COW Region between the area the guest actually writes to and the
-     * end of the last allocated cluster.
+     * The COW Region immediately after the area the guest actually
+     * writes to. This (part of the) write request ends at cow_end.offset
+     * (which must always be set even when cow_end.nb_bytes is 0).
      */
     Qcow2COWRegion cow_end;
 
diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index aa87d3e99b..485b4cb92e 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1049,6 +1049,8 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
     qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
 
     assert(l2_index + m->nb_clusters <= s->l2_slice_size);
+    assert(m->cow_end.offset + m->cow_end.nb_bytes <=
+           m->nb_clusters << s->cluster_bits);
     for (i = 0; i < m->nb_clusters; i++) {
         uint64_t offset = cluster_offset + ((uint64_t)i << s->cluster_bits);
         /* if two concurrent writes happen to the same unallocated cluster
@@ -1070,8 +1072,7 @@ int qcow2_alloc_cluster_link_l2(BlockDriverState *bs, QCowL2Meta *m)
         if (has_subclusters(s) && !m->prealloc) {
             uint64_t l2_bitmap = get_l2_bitmap(s, l2_slice, l2_index + i);
             unsigned written_from = m->cow_start.offset;
-            unsigned written_to = m->cow_end.offset + m->cow_end.nb_bytes ?:
-                m->nb_clusters << s->cluster_bits;
+            unsigned written_to = m->cow_end.offset + m->cow_end.nb_bytes;
             int first_sc, last_sc;
             /* Narrow written_from and written_to down to the current cluster */
             written_from = MAX(written_from, i << s->cluster_bits);
diff --git a/block/qcow2.c b/block/qcow2.c
index 4274806a2a..1b0733238b 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2361,15 +2361,26 @@ static bool merge_cow(uint64_t offset, unsigned bytes,
             continue;
         }
 
-        /* The data (middle) region must be immediately after the
-         * start region */
+        /*
+         * The write request should start immediately after the first
+         * COW region. This does not always happen because the area
+         * touched by the request can be larger than the one defined
+         * by @m (a single request can span an area consisting of a
+         * mix of previously unallocated and allocated clusters, that
+         * is why @l2meta is a list).
+         */
         if (l2meta_cow_start(m) + m->cow_start.nb_bytes != offset) {
+            /* In this case the request starts before this region */
+            assert(offset < l2meta_cow_start(m));
+            assert(m->cow_start.nb_bytes == 0);
             continue;
         }
 
-        /* The end region must be immediately after the data (middle)
-         * region */
+        /* The write request should end immediately before the second
+         * COW region (see above for why it does not always happen) */
         if (m->offset + m->cow_end.offset != offset + bytes) {
+            assert(offset + bytes > m->offset + m->cow_end.offset);
+            assert(m->cow_end.nb_bytes == 0);
             continue;
         }
 
-- 
2.28.0


