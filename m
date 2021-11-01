Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08344236C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:28:53 +0100 (CET)
Received: from localhost ([::1]:53606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhfnQ-0007zm-Ph
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUq-0007Cv-RT
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhfUk-0000dS-T1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 18:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635804574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAlWjWoEMOZw+xZxC0WiKGp4PGVHqFH6WrrAJ6wsQRw=;
 b=GoLLN1wNyvFYthfWuKJ/aDTifADeBYFs3Ce5GNm6q591gVE0i0hdW9DNJn87mipuxeap+D
 BQT3xtpFeOmj3/Qs1TK8d7ESuF6i81Wkr/3LnFJsan0VVPFBxy0zON9RJ+OiNfUTOsISw0
 XOaYP2nLdXDsY/RyS0bKQiy6MZrEdEs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-gKrj9XiKN6WNGXO2Jeb28g-1; Mon, 01 Nov 2021 18:09:33 -0400
X-MC-Unique: gKrj9XiKN6WNGXO2Jeb28g-1
Received: by mail-wr1-f71.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so139978wrh.14
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 15:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAlWjWoEMOZw+xZxC0WiKGp4PGVHqFH6WrrAJ6wsQRw=;
 b=1QWP6H3C5qv5imdpLrC1sLsF18D74RXeudzyVLmJUzOXLcoAwR3JC4qcrRfZ9Rce0a
 bJ4T1NhnGjkhPwXwGBjL1eUmlgdNwtuqLzVit7Y29eMklhWb2GAsBjxxdTx1sF2KeiGC
 I0riz5l0wjpXTyhz6eFtEcx3NlIWla3ur8CoYcdRQdw2PwJDNhHR3Abtl1ptzkEgFMb1
 m0mMqBhY/Z8NOKPehAYt6Gnp/4ygIs+430/nkDSjY2em81nXOTJAF7aAUB7EcKtxLUaU
 KXT7hlZDieziEZQVCkFaNQSq6+YPg45f/eeldSgwL6XSMzw9q7DuH76IbDC/ZJod5CIX
 tz5A==
X-Gm-Message-State: AOAM5304KaWJkUvScI7vmmgyHgX+RaAl5zgas1BFbzpvttVbIHuJM4Zf
 /CufsXFP3YQrHBkR4R5OwEDLwO9EhnQCnBpXc0igjZusdT9JemMVWXl/dR4jpGShEEP1cvfxdtt
 iomIA04Kt9sHq1yprwldw9LS2mM2CZOiI0l1Zl2cq4/MrtQXAahgdDES+HkUxpF5Zc5A=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr33450618wrt.275.1635804571811; 
 Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtxtTYPSTZydDNAKjX/wG8BXfEAdBg4wUEf4pzVhU0q8NeY6R4dn/NUoY2vV1PgKczmSzIOA==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr33450569wrt.275.1635804571558; 
 Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id h16sm9219637wrm.27.2021.11.01.15.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 15:09:31 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] migration/ram: Handle RAMBlocks with a RamDiscardManager
 on the migration source
Date: Mon,  1 Nov 2021 23:09:05 +0100
Message-Id: <20211101220912.10039-14-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211101220912.10039-1-quintela@redhat.com>
References: <20211101220912.10039-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We don't want to migrate memory that corresponds to discarded ranges as
managed by a RamDiscardManager responsible for the mapped memory region of
the RAMBlock. The content of these pages is essentially stale and
without any guarantees for the VM ("logically unplugged").

Depending on the underlying memory type, even reading memory might populate
memory on the source, resulting in an undesired memory consumption. Of
course, on the destination, even writing a zeropage consumes memory,
which we also want to avoid (similar to free page hinting).

Currently, virtio-mem tries achieving that goal (not migrating "unplugged"
memory that was discarded) by going via qemu_guest_free_page_hint() - but
it's hackish and incomplete.

For example, background snapshots still end up reading all memory, as
they don't do bitmap syncs. Postcopy recovery code will re-add
previously cleared bits to the dirty bitmap and migrate them.

Let's consult the RamDiscardManager after setting up our dirty bitmap
initially and when postcopy recovery code reinitializes it: clear
corresponding bits in the dirty bitmaps (e.g., of the RAMBlock and inside
KVM). It's important to fixup the dirty bitmap *after* our initial bitmap
sync, such that the corresponding dirty bits in KVM are actually cleared.

As colo is incompatible with discarding of RAM and inhibits it, we don't
have to bother.

Note: if a misbehaving guest would use discarded ranges after migration
started we would still migrate that memory: however, then we already
populated that memory on the migration source.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index ae2601bf3b..e8c06f207c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -858,6 +858,60 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     return ret;
 }
 
+static void dirty_bitmap_clear_section(MemoryRegionSection *section,
+                                       void *opaque)
+{
+    const hwaddr offset = section->offset_within_region;
+    const hwaddr size = int128_get64(section->size);
+    const unsigned long start = offset >> TARGET_PAGE_BITS;
+    const unsigned long npages = size >> TARGET_PAGE_BITS;
+    RAMBlock *rb = section->mr->ram_block;
+    uint64_t *cleared_bits = opaque;
+
+    /*
+     * We don't grab ram_state->bitmap_mutex because we expect to run
+     * only when starting migration or during postcopy recovery where
+     * we don't have concurrent access.
+     */
+    if (!migration_in_postcopy() && !migrate_background_snapshot()) {
+        migration_clear_memory_region_dirty_bitmap_range(rb, start, npages);
+    }
+    *cleared_bits += bitmap_count_one_with_offset(rb->bmap, start, npages);
+    bitmap_clear(rb->bmap, start, npages);
+}
+
+/*
+ * Exclude all dirty pages from migration that fall into a discarded range as
+ * managed by a RamDiscardManager responsible for the mapped memory region of
+ * the RAMBlock. Clear the corresponding bits in the dirty bitmaps.
+ *
+ * Discarded pages ("logically unplugged") have undefined content and must
+ * not get migrated, because even reading these pages for migration might
+ * result in undesired behavior.
+ *
+ * Returns the number of cleared bits in the RAMBlock dirty bitmap.
+ *
+ * Note: The result is only stable while migrating (precopy/postcopy).
+ */
+static uint64_t ramblock_dirty_bitmap_clear_discarded_pages(RAMBlock *rb)
+{
+    uint64_t cleared_bits = 0;
+
+    if (rb->mr && rb->bmap && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = 0,
+            .size = int128_make64(qemu_ram_get_used_length(rb)),
+        };
+
+        ram_discard_manager_replay_discarded(rdm, &section,
+                                             dirty_bitmap_clear_section,
+                                             &cleared_bits);
+    }
+    return cleared_bits;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
@@ -2675,6 +2729,19 @@ static void ram_list_init_bitmaps(void)
     }
 }
 
+static void migration_bitmap_clear_discarded_pages(RAMState *rs)
+{
+    unsigned long pages;
+    RAMBlock *rb;
+
+    RCU_READ_LOCK_GUARD();
+
+    RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
+            pages = ramblock_dirty_bitmap_clear_discarded_pages(rb);
+            rs->migration_dirty_pages -= pages;
+    }
+}
+
 static void ram_init_bitmaps(RAMState *rs)
 {
     /* For memory_global_dirty_log_start below.  */
@@ -2691,6 +2758,12 @@ static void ram_init_bitmaps(RAMState *rs)
     }
     qemu_mutex_unlock_ramlist();
     qemu_mutex_unlock_iothread();
+
+    /*
+     * After an eventual first bitmap sync, fixup the initial bitmap
+     * containing all 1s to exclude any discarded pages from migration.
+     */
+    migration_bitmap_clear_discarded_pages(rs);
 }
 
 static int ram_init_all(RAMState **rsp)
@@ -4119,6 +4192,10 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
      */
     bitmap_complement(block->bmap, block->bmap, nbits);
 
+    /* Clear dirty bits of discarded ranges that we don't want to migrate. */
+    ramblock_dirty_bitmap_clear_discarded_pages(block);
+
+    /* We'll recalculate migration_dirty_pages in ram_state_resume_prepare(). */
     trace_ram_dirty_bitmap_reload_complete(block->idstr);
 
     /*
-- 
2.33.1


