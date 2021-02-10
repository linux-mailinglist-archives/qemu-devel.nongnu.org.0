Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A380F316C7B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:23:28 +0100 (CET)
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tD5-0000JK-73
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t6Q-0003XA-7m
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t6N-0001ex-Pq
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612977391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I1GegRRsYAOEmXogjdvduSgztiri02UqI880GVRk4zo=;
 b=VJYkhOHVWuT9lhj4427EAtObrAaXt+AyWhghw9qRVhizQKnwyKWbh5nYwgNxewSp6vsg81
 w8jjFh8uytVshKEVhlNLHHn4kvmFiePrSPjFRFZPrGMHPKqpbdJJa6unaw0KbAhQpw8bYN
 KtfHrJQ1kh/OSQkm341zYkJ/9HdMGcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-StGjyNspPYW3UH82bEo_fQ-1; Wed, 10 Feb 2021 12:16:29 -0500
X-MC-Unique: StGjyNspPYW3UH82bEo_fQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8863984E243;
 Wed, 10 Feb 2021 17:16:28 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72D592BFEB;
 Wed, 10 Feb 2021 17:16:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/5] softmmu/memory_mapping: factor out adding physical
 memory ranges
Date: Wed, 10 Feb 2021 18:15:36 +0100
Message-Id: <20210210171537.32932-5-david@redhat.com>
In-Reply-To: <20210210171537.32932-1-david@redhat.com>
References: <20210210171537.32932-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out adding an item to the list, to be reused in
RamDiscardMgr context next.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory_mapping.c | 64 +++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index ad4911427a..05e8270edc 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -194,35 +194,17 @@ typedef struct GuestPhysListener {
     MemoryListener listener;
 } GuestPhysListener;
 
-static void guest_phys_blocks_region_add(MemoryListener *listener,
-                                         MemoryRegionSection *section)
+static void guest_phys_block_add(GuestPhysBlockList *list, MemoryRegion *mr,
+                                 hwaddr target_start, hwaddr target_end,
+                                 uint8_t *host_addr)
 {
-    GuestPhysListener *g;
-    uint64_t section_size;
-    hwaddr target_start, target_end;
-    uint8_t *host_addr;
-    GuestPhysBlock *predecessor;
-
-    /* we only care about RAM */
-    if (!memory_region_is_ram(section->mr) ||
-        memory_region_is_ram_device(section->mr) ||
-        memory_region_is_nonvolatile(section->mr)) {
-        return;
-    }
-
-    g            = container_of(listener, GuestPhysListener, listener);
-    section_size = int128_get64(section->size);
-    target_start = section->offset_within_address_space;
-    target_end   = target_start + section_size;
-    host_addr    = memory_region_get_ram_ptr(section->mr) +
-                   section->offset_within_region;
-    predecessor  = NULL;
+    GuestPhysBlock *predecessor = NULL;
 
     /* find continuity in guest physical address space */
-    if (!QTAILQ_EMPTY(&g->list->head)) {
+    if (!QTAILQ_EMPTY(&list->head)) {
         hwaddr predecessor_size;
 
-        predecessor = QTAILQ_LAST(&g->list->head);
+        predecessor = QTAILQ_LAST(&list->head);
         predecessor_size = predecessor->target_end - predecessor->target_start;
 
         /* the memory API guarantees monotonically increasing traversal */
@@ -231,7 +213,7 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
         /* we want continuity in both guest-physical and host-virtual memory */
         if (predecessor->target_end < target_start ||
             predecessor->host_addr + predecessor_size != host_addr ||
-            predecessor->mr != section->mr) {
+            predecessor->mr != mr) {
             predecessor = NULL;
         }
     }
@@ -243,11 +225,11 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
         block->target_start = target_start;
         block->target_end   = target_end;
         block->host_addr    = host_addr;
-        block->mr           = section->mr;
-        memory_region_ref(section->mr);
+        block->mr           = mr;
+        memory_region_ref(mr);
 
-        QTAILQ_INSERT_TAIL(&g->list->head, block, next);
-        ++g->list->num;
+        QTAILQ_INSERT_TAIL(&list->head, block, next);
+        ++list->num;
     } else {
         /* expand predecessor until @target_end; predecessor's start doesn't
          * change
@@ -258,10 +240,32 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
 #ifdef DEBUG_GUEST_PHYS_REGION_ADD
     fprintf(stderr, "%s: target_start=" TARGET_FMT_plx " target_end="
             TARGET_FMT_plx ": %s (count: %u)\n", __func__, target_start,
-            target_end, predecessor ? "joined" : "added", g->list->num);
+            target_end, predecessor ? "joined" : "added", list->num);
 #endif
 }
 
+static void guest_phys_blocks_region_add(MemoryListener *listener,
+                                         MemoryRegionSection *section)
+{
+    GuestPhysListener *g = container_of(listener, GuestPhysListener, listener);
+    hwaddr target_start, target_end;
+    uint8_t *host_addr;
+
+    /* we only care about RAM */
+    if (!memory_region_is_ram(section->mr) ||
+        memory_region_is_ram_device(section->mr) ||
+        memory_region_is_nonvolatile(section->mr)) {
+        return;
+    }
+
+    target_start = section->offset_within_address_space;
+    target_end = target_start + int128_get64(section->size);
+    host_addr = memory_region_get_ram_ptr(section->mr) +
+                section->offset_within_region;
+    guest_phys_block_add(g->list, section->mr, target_start, target_end,
+                         host_addr);
+}
+
 void guest_phys_blocks_append(GuestPhysBlockList *list)
 {
     GuestPhysListener g = { 0 };
-- 
2.29.2


