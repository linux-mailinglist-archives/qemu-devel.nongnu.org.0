Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B633D59C0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:48:00 +0200 (CEST)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m801X-0005Dg-3P
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zyN-0001ny-JT
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zyL-0008Bg-Sy
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HY2O81q7lhI5+M54gUmEHMRD7ZyjvQBDj8+RCP7AAcU=;
 b=SdvIn9Rn25xXHnFpudX9d05URwE/h6TvIbCU49b8CRPfWbt9YHJyAUjn3zQGswkKixHrgW
 w2PjPJGUULDYvVZ7wGumgbiuCWhdyzpjSarTCU7+mhR5dJh5umiTIIH/nyCqdbrGqZS8Zp
 hOG5b5BmHRpOIxT28bjvpMpesCS3xUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-Kd0zYcgEMf-cEInV-34wnw-1; Mon, 26 Jul 2021 08:44:39 -0400
X-MC-Unique: Kd0zYcgEMf-cEInV-34wnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46071107B807;
 Mon, 26 Jul 2021 12:44:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4DEE60C4A;
 Mon, 26 Jul 2021 12:44:36 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 7/7] migration: clear the memory region dirty bitmap when
 skipping free pages
Date: Mon, 26 Jul 2021 13:43:31 +0100
Message-Id: <20210726124331.124710-8-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Wang <wei.w.wang@intel.com>

When skipping free pages to send, their corresponding dirty bits in the
memory region dirty bitmap need to be cleared. Otherwise the skipped
pages will be sent in the next round after the migration thread syncs
dirty bits from the memory region dirty bitmap.

Cc: David Hildenbrand <david@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Reported-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Wei Wang <wei.w.wang@intel.com>
Message-Id: <20210722083055.23352-1-wei.w.wang@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 74 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 08b3cb7a4a..7a43bfd7af 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -789,6 +789,53 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return find_next_bit(bitmap, size, start);
 }
 
+static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
+                                                       RAMBlock *rb,
+                                                       unsigned long page)
+{
+    uint8_t shift;
+    hwaddr size, start;
+
+    if (!rb->clear_bmap || !clear_bmap_test_and_clear(rb, page)) {
+        return;
+    }
+
+    shift = rb->clear_bmap_shift;
+    /*
+     * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
+     * can make things easier sometimes since then start address
+     * of the small chunk will always be 64 pages aligned so the
+     * bitmap will always be aligned to unsigned long. We should
+     * even be able to remove this restriction but I'm simply
+     * keeping it.
+     */
+    assert(shift >= 6);
+
+    size = 1ULL << (TARGET_PAGE_BITS + shift);
+    start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
+    trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
+    memory_region_clear_dirty_bitmap(rb->mr, start, size);
+}
+
+static void
+migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
+                                                 RAMBlock *rb,
+                                                 unsigned long start,
+                                                 unsigned long npages)
+{
+    unsigned long i, chunk_pages = 1UL << rb->clear_bmap_shift;
+    unsigned long chunk_start = QEMU_ALIGN_DOWN(start, chunk_pages);
+    unsigned long chunk_end = QEMU_ALIGN_UP(start + npages, chunk_pages);
+
+    /*
+     * Clear pages from start to start + npages - 1, so the end boundary is
+     * exclusive.
+     */
+    for (i = chunk_start; i < chunk_end; i += chunk_pages) {
+        migration_clear_memory_region_dirty_bitmap(rs, rb, i);
+    }
+}
+
 static inline bool migration_bitmap_clear_dirty(RAMState *rs,
                                                 RAMBlock *rb,
                                                 unsigned long page)
@@ -803,26 +850,9 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
      * the page in the chunk we clear the remote dirty bitmap for all.
      * Clearing it earlier won't be a problem, but too late will.
      */
-    if (rb->clear_bmap && clear_bmap_test_and_clear(rb, page)) {
-        uint8_t shift = rb->clear_bmap_shift;
-        hwaddr size = 1ULL << (TARGET_PAGE_BITS + shift);
-        hwaddr start = (((ram_addr_t)page) << TARGET_PAGE_BITS) & (-size);
-
-        /*
-         * CLEAR_BITMAP_SHIFT_MIN should always guarantee this... this
-         * can make things easier sometimes since then start address
-         * of the small chunk will always be 64 pages aligned so the
-         * bitmap will always be aligned to unsigned long.  We should
-         * even be able to remove this restriction but I'm simply
-         * keeping it.
-         */
-        assert(shift >= 6);
-        trace_migration_bitmap_clear_dirty(rb->idstr, start, size, page);
-        memory_region_clear_dirty_bitmap(rb->mr, start, size);
-    }
+    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
 
     ret = test_and_clear_bit(page, rb->bmap);
-
     if (ret) {
         rs->migration_dirty_pages--;
     }
@@ -2741,6 +2771,14 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
         npages = used_len >> TARGET_PAGE_BITS;
 
         qemu_mutex_lock(&ram_state->bitmap_mutex);
+        /*
+         * The skipped free pages are equavalent to be sent from clear_bmap's
+         * perspective, so clear the bits from the memory region bitmap which
+         * are initially set. Otherwise those skipped pages will be sent in
+         * the next round after syncing from the memory region bitmap.
+         */
+        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
+                                                         start, npages);
         ram_state->migration_dirty_pages -=
                       bitmap_count_one_with_offset(block->bmap, start, npages);
         bitmap_clear(block->bmap, start, npages);
-- 
2.31.1


