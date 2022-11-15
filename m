Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6158629E28
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 16:55:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxyw-00063A-K8; Tue, 15 Nov 2022 10:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyt-0005yt-Pd
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:36:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouxyp-0008Od-SN
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 10:36:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668526567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4j3dbCKGLbNDGAn+c9H7VpwArQIYSq5GKQxPanVzcRI=;
 b=MV9SJVAGRh+5+poi6m3rXYogzwfGprq8hd09bmT7MOPdKrXd7x89i33ilIeMDI/VwRUJda
 J1juMOsg6PSZo23mWKEza8WyO5OEzGsUsnP6lKRj6U2zDNSWxfxlbUp91dPuWvRM2NpkHl
 +zmI/WbiY3Gn8b4v4emq3MNO1aj0gQ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-my1_ThKENq6pBGElsRbJMQ-1; Tue, 15 Nov 2022 10:36:04 -0500
X-MC-Unique: my1_ThKENq6pBGElsRbJMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DDD5857FB0;
 Tue, 15 Nov 2022 15:36:03 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7574F2166B2C;
 Tue, 15 Nov 2022 15:36:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Fam Zheng <fam@euphon.net>
Subject: [PULL 13/30] migration: Use non-atomic ops for clear log bitmap
Date: Tue, 15 Nov 2022 16:34:57 +0100
Message-Id: <20221115153514.28003-14-quintela@redhat.com>
In-Reply-To: <20221115153514.28003-1-quintela@redhat.com>
References: <20221115153514.28003-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Xu <peterx@redhat.com>

Since we already have bitmap_mutex to protect either the dirty bitmap or
the clear log bitmap, we don't need atomic operations to set/clear/test on
the clear log bitmap.  Switching all ops from atomic to non-atomic
versions, meanwhile touch up the comments to show which lock is in charge.

Introduced non-atomic version of bitmap_test_and_clear_atomic(), mostly the
same as the atomic version but simplified a few places, e.g. dropped the
"old_bits" variable, and also the explicit memory barriers.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/exec/ram_addr.h | 11 +++++-----
 include/exec/ramblock.h |  3 +++
 include/qemu/bitmap.h   |  1 +
 util/bitmap.c           | 45 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 1500680458..f4fb6a2111 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -42,7 +42,8 @@ static inline long clear_bmap_size(uint64_t pages, uint8_t shift)
 }
 
 /**
- * clear_bmap_set: set clear bitmap for the page range
+ * clear_bmap_set: set clear bitmap for the page range.  Must be with
+ * bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @start: the start page number
@@ -55,12 +56,12 @@ static inline void clear_bmap_set(RAMBlock *rb, uint64_t start,
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    bitmap_set_atomic(rb->clear_bmap, start >> shift,
-                      clear_bmap_size(npages, shift));
+    bitmap_set(rb->clear_bmap, start >> shift, clear_bmap_size(npages, shift));
 }
 
 /**
- * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set
+ * clear_bmap_test_and_clear: test clear bitmap for the page, clear if set.
+ * Must be with bitmap_mutex held.
  *
  * @rb: the ramblock to operate on
  * @page: the page number to check
@@ -71,7 +72,7 @@ static inline bool clear_bmap_test_and_clear(RAMBlock *rb, uint64_t page)
 {
     uint8_t shift = rb->clear_bmap_shift;
 
-    return bitmap_test_and_clear_atomic(rb->clear_bmap, page >> shift, 1);
+    return bitmap_test_and_clear(rb->clear_bmap, page >> shift, 1);
 }
 
 static inline bool offset_in_ramblock(RAMBlock *b, ram_addr_t offset)
diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 6cbedf9e0c..adc03df59c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -53,6 +53,9 @@ struct RAMBlock {
      * and split clearing of dirty bitmap on the remote node (e.g.,
      * KVM).  The bitmap will be set only when doing global sync.
      *
+     * It is only used during src side of ram migration, and it is
+     * protected by the global ram_state.bitmap_mutex.
+     *
      * NOTE: this bitmap is different comparing to the other bitmaps
      * in that one bit can represent multiple guest pages (which is
      * decided by the `clear_bmap_shift' variable below).  On
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 82a1d2f41f..3ccb00865f 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -253,6 +253,7 @@ void bitmap_set(unsigned long *map, long i, long len);
 void bitmap_set_atomic(unsigned long *map, long i, long len);
 void bitmap_clear(unsigned long *map, long start, long nr);
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr);
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr);
 void bitmap_copy_and_clear_atomic(unsigned long *dst, unsigned long *src,
                                   long nr);
 unsigned long bitmap_find_next_zero_area(unsigned long *map,
diff --git a/util/bitmap.c b/util/bitmap.c
index f81d8057a7..8d12e90a5a 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -240,6 +240,51 @@ void bitmap_clear(unsigned long *map, long start, long nr)
     }
 }
 
+bool bitmap_test_and_clear(unsigned long *map, long start, long nr)
+{
+    unsigned long *p = map + BIT_WORD(start);
+    const long size = start + nr;
+    int bits_to_clear = BITS_PER_LONG - (start % BITS_PER_LONG);
+    unsigned long mask_to_clear = BITMAP_FIRST_WORD_MASK(start);
+    bool dirty = false;
+
+    assert(start >= 0 && nr >= 0);
+
+    /* First word */
+    if (nr - bits_to_clear > 0) {
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+        nr -= bits_to_clear;
+        bits_to_clear = BITS_PER_LONG;
+        p++;
+    }
+
+    /* Full words */
+    if (bits_to_clear == BITS_PER_LONG) {
+        while (nr >= BITS_PER_LONG) {
+            if (*p) {
+                dirty = true;
+                *p = 0;
+            }
+            nr -= BITS_PER_LONG;
+            p++;
+        }
+    }
+
+    /* Last word */
+    if (nr) {
+        mask_to_clear &= BITMAP_LAST_WORD_MASK(size);
+        if ((*p) & mask_to_clear) {
+            dirty = true;
+        }
+        *p &= ~mask_to_clear;
+    }
+
+    return dirty;
+}
+
 bool bitmap_test_and_clear_atomic(unsigned long *map, long start, long nr)
 {
     unsigned long *p = map + BIT_WORD(start);
-- 
2.38.1


