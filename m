Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D73AA17D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:37:47 +0200 (CEST)
Received: from localhost ([::1]:60732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYXy-0005QT-95
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRV-0003BU-7o
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1ltYRR-0007ga-Sw
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623861061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xdhpng/kXrzOf1CcBueWIP516qy0BGf+SAgUprQwh5s=;
 b=E/6LKlOKTtVDJii8eUO/Jl6I2siLVAmpri0JVhclQAkNfj8nmJk0QqtRpm693SuoH3qj0J
 uqa0+YIOy3htSlLJ6t+NF2+4Qvg7o1AYCstIEhNjAMDXCV539TP0r8lTNQlwmIjBgq/aMK
 SBeBuSKUUOpDBko3UJuRk6hDJ8F+Pd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-Qc9WLxa_MVeAL3EDa1Dvsw-1; Wed, 16 Jun 2021 12:30:54 -0400
X-MC-Unique: Qc9WLxa_MVeAL3EDa1Dvsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205D41012582;
 Wed, 16 Jun 2021 16:30:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB3916090F;
 Wed, 16 Jun 2021 16:30:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Date: Wed, 16 Jun 2021 18:29:39 +0200
Message-Id: <20210616162940.28630-6-david@redhat.com>
In-Reply-To: <20210616162940.28630-1-david@redhat.com>
References: <20210616162940.28630-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, when someone (i.e., the VM) accesses discarded parts inside a
RAMBlock with a RamDiscardManager managing the corresponding mapped memory
region, postcopy will request migration of the corresponding page from the
source. The source, however, will never answer, because it refuses to
migrate such pages with undefined content ("logically unplugged"): the
pages are never dirty, and get_queued_page() will consequently skip
processing these postcopy requests.

Especially reading discarded ("logically unplugged") ranges is supposed to
work in some setups (for example with current virtio-mem), although it
barely ever happens: still, not placing a page would currently stall the
VM, as it cannot make forward progress.

Let's check the state via the RamDiscardManager (the state e.g.,
of virtio-mem is migrated during precopy) and avoid sending a request
that will never get answered. Place a fresh zero page instead to keep
the VM working. This is the same behavior that would happen
automatically without userfaultfd being active, when accessing virtual
memory regions without populated pages -- "populate on demand".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/postcopy-ram.c | 25 +++++++++++++++++++++----
 migration/ram.c          | 23 +++++++++++++++++++++++
 migration/ram.h          |  1 +
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 2e9697bdd2..673f60ce2b 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -671,6 +671,23 @@ int postcopy_wake_shared(struct PostCopyFD *pcfd,
     return ret;
 }
 
+static int postcopy_request_page(MigrationIncomingState *mis, RAMBlock *rb,
+                                 ram_addr_t start, uint64_t haddr)
+{
+    /*
+     * Discarded pages (via RamDiscardManager) are never migrated. On unlikely
+     * access, place a zeropage, which will also set the relevant bits in the
+     * recv_bitmap accordingly, so we won't try placing a zeropage twice.
+     */
+    if (ramblock_page_is_discarded(rb, start)) {
+        bool received = ramblock_recv_bitmap_test_byte_offset(rb, start);
+
+        return received ? 0 : postcopy_place_page_zero(mis, (void *)haddr, rb);
+    }
+
+    return migrate_send_rp_req_pages(mis, rb, start, haddr);
+}
+
 /*
  * Callback from shared fault handlers to ask for a page,
  * the page must be specified by a RAMBlock and an offset in that rb
@@ -690,7 +707,7 @@ int postcopy_request_shared_page(struct PostCopyFD *pcfd, RAMBlock *rb,
                                         qemu_ram_get_idstr(rb), rb_offset);
         return postcopy_wake_shared(pcfd, client_addr, rb);
     }
-    migrate_send_rp_req_pages(mis, rb, aligned_rbo, client_addr);
+    postcopy_request_page(mis, rb, aligned_rbo, client_addr);
     return 0;
 }
 
@@ -984,8 +1001,8 @@ retry:
              * Send the request to the source - we want to request one
              * of our host page sizes (which is >= TPS)
              */
-            ret = migrate_send_rp_req_pages(mis, rb, rb_offset,
-                                            msg.arg.pagefault.address);
+            ret = postcopy_request_page(mis, rb, rb_offset,
+                                        msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
                 if (ret == -EIO && postcopy_pause_fault_thread(mis)) {
@@ -993,7 +1010,7 @@ retry:
                     goto retry;
                 } else {
                     /* This is a unavoidable fault */
-                    error_report("%s: migrate_send_rp_req_pages() get %d",
+                    error_report("%s: postcopy_request_page() get %d",
                                  __func__, ret);
                     break;
                 }
diff --git a/migration/ram.c b/migration/ram.c
index 03867b4971..54136cd76e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -878,6 +878,29 @@ static uint64_t ramblock_dirty_bitmap_exclude_discarded_pages(RAMBlock *rb)
     return cleared_bits;
 }
 
+/*
+ * Check if a page falls into a discarded range as managed by a
+ * RamDiscardManager responsible for the mapped memory region of the RAMBlock.
+ * Pages inside discarded ranges are never migrated and postcopy has to
+ * place zeropages instead.
+ *
+ * Note: The result is only stable while migration (precopy/postcopy).
+ */
+bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t offset)
+{
+    if (rb->mr && memory_region_has_ram_discard_manager(rb->mr)) {
+        RamDiscardManager *rdm = memory_region_get_ram_discard_manager(rb->mr);
+        MemoryRegionSection section = {
+            .mr = rb->mr,
+            .offset_within_region = offset,
+            .size = int128_get64(TARGET_PAGE_SIZE),
+        };
+
+        return !ram_discard_manager_is_populated(rdm, &section);
+    }
+    return false;
+}
+
 /* Called with RCU critical section */
 static void ramblock_sync_dirty_bitmap(RAMState *rs, RAMBlock *rb)
 {
diff --git a/migration/ram.h b/migration/ram.h
index 4833e9fd5b..6e7f12e556 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -72,6 +72,7 @@ void ramblock_recv_bitmap_set_range(RAMBlock *rb, void *host_addr, size_t nr);
 int64_t ramblock_recv_bitmap_send(QEMUFile *file,
                                   const char *block_name);
 int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *rb);
+bool ramblock_page_is_discarded(RAMBlock *rb, ram_addr_t offset);
 
 /* ram cache */
 int colo_init_ram_cache(void);
-- 
2.31.1


