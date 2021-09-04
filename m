Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D24400C0F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:18:01 +0200 (CEST)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYMi-0007Hh-CC
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYFS-00046g-BD
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:10:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mMYFQ-000376-PN
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 12:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630771827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8kfjj2auJUTWsrYRa4bhrmtWiFLuI/ch0INa0gWGHg=;
 b=F815jeLccTNiwgQmH7fGuU95hKQTntg6drgRtbmHL3N6BgPiuPLGvNO6Nmcn/NR7xW0o5Z
 EEhu+zCpMQwDGcsPbr00VTvuJEEjyoPcRf+bCyu3i9J11QcmMkaUgwwSuXjWuYzQyP/QJs
 XVrXdDGfq/rrW3tBJp5qAmziCrLx/X4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-oBxeRrlvMlWX2oM7HmDXVw-1; Sat, 04 Sep 2021 12:10:26 -0400
X-MC-Unique: oBxeRrlvMlWX2oM7HmDXVw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DAF107ACCD;
 Sat,  4 Sep 2021 16:10:25 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE0E360C9D;
 Sat,  4 Sep 2021 16:09:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/9] migration/ram: Don't passs RAMState to
 migration_clear_memory_region_dirty_bitmap_*()
Date: Sat,  4 Sep 2021 18:09:07 +0200
Message-Id: <20210904160913.17785-4-david@redhat.com>
In-Reply-To: <20210904160913.17785-1-david@redhat.com>
References: <20210904160913.17785-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The parameter is unused, let's drop it.

Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 7a43bfd7af..bb908822d5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -789,8 +789,7 @@ unsigned long migration_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
     return find_next_bit(bitmap, size, start);
 }
 
-static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
-                                                       RAMBlock *rb,
+static void migration_clear_memory_region_dirty_bitmap(RAMBlock *rb,
                                                        unsigned long page)
 {
     uint8_t shift;
@@ -818,8 +817,7 @@ static void migration_clear_memory_region_dirty_bitmap(RAMState *rs,
 }
 
 static void
-migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
-                                                 RAMBlock *rb,
+migration_clear_memory_region_dirty_bitmap_range(RAMBlock *rb,
                                                  unsigned long start,
                                                  unsigned long npages)
 {
@@ -832,7 +830,7 @@ migration_clear_memory_region_dirty_bitmap_range(RAMState *rs,
      * exclusive.
      */
     for (i = chunk_start; i < chunk_end; i += chunk_pages) {
-        migration_clear_memory_region_dirty_bitmap(rs, rb, i);
+        migration_clear_memory_region_dirty_bitmap(rb, i);
     }
 }
 
@@ -850,7 +848,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
      * the page in the chunk we clear the remote dirty bitmap for all.
      * Clearing it earlier won't be a problem, but too late will.
      */
-    migration_clear_memory_region_dirty_bitmap(rs, rb, page);
+    migration_clear_memory_region_dirty_bitmap(rb, page);
 
     ret = test_and_clear_bit(page, rb->bmap);
     if (ret) {
@@ -2777,8 +2775,7 @@ void qemu_guest_free_page_hint(void *addr, size_t len)
          * are initially set. Otherwise those skipped pages will be sent in
          * the next round after syncing from the memory region bitmap.
          */
-        migration_clear_memory_region_dirty_bitmap_range(ram_state, block,
-                                                         start, npages);
+        migration_clear_memory_region_dirty_bitmap_range(block, start, npages);
         ram_state->migration_dirty_pages -=
                       bitmap_count_one_with_offset(block->bmap, start, npages);
         bitmap_clear(block->bmap, start, npages);
-- 
2.31.1


