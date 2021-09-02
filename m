Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD13FEEBB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:34:58 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmro-0001J0-RN
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZg-0000OA-Nd
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mLmZd-0007i2-TR
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630588568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7L0Ww5ZtJIWwXdTZgEvvFjlW/4+KXUyA6zkwceb3III=;
 b=LjTX6sX30knyLecF6dZIqaKJ647T3SF9uGTEE2HgC7X5FgmIDC7anIx4ArFHEYCu7d8uAx
 zEnkIizQLVGlGtFXV8gy3Ek9ds66d+6OAXpuy3SYKdiavlepAfqVnG4BgSRs80SOCRU6L1
 +B/wKC85GuFwvh+6xVmIljflOTDXz64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-1O4pRCVEO8e8e5H1z57ETQ-1; Thu, 02 Sep 2021 09:16:07 -0400
X-MC-Unique: 1O4pRCVEO8e8e5H1z57ETQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9370A10835C2;
 Thu,  2 Sep 2021 13:16:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3125D6B541;
 Thu,  2 Sep 2021 13:16:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 9/9] migration/ram: Handle RAMBlocks with a
 RamDiscardManager on background snapshots
Date: Thu,  2 Sep 2021 15:14:32 +0200
Message-Id: <20210902131432.23103-10-david@redhat.com>
In-Reply-To: <20210902131432.23103-1-david@redhat.com>
References: <20210902131432.23103-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 migration/ram.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index de47650c90..2f7ceb84b8 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1650,6 +1650,16 @@ static inline void populate_range(RAMBlock *block, ram_addr_t offset,
     }
 }
 
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
@@ -1659,9 +1669,32 @@ static inline void populate_range(RAMBlock *block, ram_addr_t offset,
  *
  * @block: RAM block to populate
  */
-static void ram_block_populate_pages(RAMBlock *block)
+static void ram_block_populate_pages(RAMBlock *rb)
 {
-    populate_range(block, 0, block->used_length);
+    /*
+     * Skip populating all pages that fall into a discarded range as managed by
+     * a RamDiscardManager responsible for the mapped memory region of the
+     * RAMBlock. Such discarded ("logically unplugged") parts of a RAMBlock
+     * must not get populated automatically. We don't have to track
+     * modifications via userfaultfd WP reliably, because these pages will
+     * not be part of the migration stream either way -- see
+     * ramblock_dirty_bitmap_exclude_discarded_pages().
+     *
+     * Note: The result is only stable while migrating (precopy/postcopy).
+     */
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = rb->mr->size,
+        };
+
+        ram_discard_manager_replay_populated(rdm, &section,
+                                             populate_section, NULL);
+    } else {
+        populate_range(rb, 0, rb->used_length);
+    }
 }
 
 /*
-- 
2.31.1


