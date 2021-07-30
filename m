Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767913DB58C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 10:57:30 +0200 (CEST)
Received: from localhost ([::1]:33196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9OKf-0007BF-Hg
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 04:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9OHx-0001FH-Ct
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m9OHu-0007nG-Ds
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627635277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12IgdDqbAG2zdxCmsPRWEcu/fd32i5J9A3qDO5CdSJc=;
 b=RPNrcmcDC3zD3HfHTrzWPBiIMlw4L/AwaoVjc27/jj4PIqR3z2qCRiUYYfUm+5fjmBE8JY
 WlNENPajihS+z6l3gf2YVnU8v3VhNWyA9aBCQ1ZpajVe0p9I1pM3hLKCtgBQxvLK5ZKh27
 Bnopf3CuYP5Y/SYapC4KE7z3WnPLJfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-C72uVisFOzOGOpwqzuYgKw-1; Fri, 30 Jul 2021 04:54:36 -0400
X-MC-Unique: C72uVisFOzOGOpwqzuYgKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 300F293920;
 Fri, 30 Jul 2021 08:54:35 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CBD760C13;
 Fri, 30 Jul 2021 08:54:28 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
Date: Fri, 30 Jul 2021 10:52:49 +0200
Message-Id: <20210730085249.8246-8-david@redhat.com>
In-Reply-To: <20210730085249.8246-1-david@redhat.com>
References: <20210730085249.8246-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already don't ever migrate memory that corresponds to discarded ranges
as managed by a RamDiscardManager responsible for the mapped memory region
of the RAMBlock.

virtio-mem uses this mechanism to logically unplug parts of a RAMBlock.
Right now, we still populate zeropages for the whole usable part of the
RAMBlock, which is undesired because:

1. Even populating the shared zeropage will result in memory getting
   consumed for page tables.
2. Memory backends without a shared zeropage (like hugetlbfs and shmem)
   will populate an actual, fresh page, resulting in an unintended
   memory consumption.

Discarded ("logically unplugged") parts have to remain discarded. As
these pages are never part of the migration stream, there is no need to
track modifications via userfaultfd WP reliably for these parts.

Further, any writes to these ranges by the VM are invalid and the
behavior is undefined.

Note that Linux only supports userfaultfd WP on private anonymous memory
for now, which usually results in the shared zeropage getting populated.
The issue will become more relevant once userfaultfd WP supports shmem
and hugetlb.

Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 53 +++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 01cea01774..fd5949734e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1639,6 +1639,28 @@ out:
     return ret;
 }
 
+static inline void populate_range(RAMBlock *block, hwaddr offset, hwaddr size)
+{
+    char *ptr = (char *) block->host;
+
+    for (; offset < size; offset += qemu_real_host_page_size) {
+        char tmp = *(ptr + offset);
+
+        /* Don't optimize the read out */
+        asm volatile("" : "+r" (tmp));
+    }
+}
+
+static inline int populate_section(MemoryRegionSection *section, void *opaque)
+{
+    const hwaddr size = int128_get64(section->size);
+    hwaddr offset = section->offset_within_region;
+    RAMBlock *block = section->mr->ram_block;
+
+    populate_range(block, offset, size);
+    return 0;
+}
+
 /*
  * ram_block_populate_pages: populate memory in the RAM block by reading
  *   an integer from the beginning of each page.
@@ -1648,16 +1670,31 @@ out:
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_pages(RAMBlock *block)
+static void ram_block_populate_pages(RAMBlock *rb)
 {
-    char *ptr = (char *) block->host;
-
-    for (ram_addr_t offset = 0; offset < block->used_length;
-            offset += qemu_real_host_page_size) {
-        char tmp = *(ptr + offset);
+    /*
+     * Skip populating all pages that fall into a discarded range as managed by
+     * a RamDiscardManager responsible for the mapped memory region of the
+     * RAMBlock. Such discarded ("logically unplugged") parts of a RAMBlock
+     * must not get populated automatically. We don't have to track
+     * modifications via userfaultfd WP reliably, because these pages will
+     * not be part of the migration stream either way -- see
+     * ramblock_dirty_bitmap_exclude_discarded_pages().
+     *
+     * Note: The result is only stable while migration (precopy/postcopy).
+     */
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = rb->mr->size,
+        };
 
-        /* Don't optimize the read out */
-        asm volatile("" : "+r" (tmp));
+        ram_discard_manager_replay_populated(rdm, &section,
+                                             populate_section, NULL);
+    } else {
+        populate_range(rb, 0, qemu_ram_get_used_length(rb));
     }
 }
 
-- 
2.31.1


