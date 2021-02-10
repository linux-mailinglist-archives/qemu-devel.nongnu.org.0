Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748CA316C8E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:26:59 +0100 (CET)
Received: from localhost ([::1]:59516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tGU-0003zr-92
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t6c-0003vY-KV
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l9t6a-0001li-4y
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612977403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxPeKm8BLovfCxogO+cgDUCCtCt6oX5cZ4BQNTWesMs=;
 b=ifOqGZxQu0FqUKdIdA4p+hvbpVnRCMraQfOVG/IrVTYqgef3JoJvHQI9+sIwOl2Pkvtggr
 BMML45Y1VGtdE1b59brYXT9xDsWfzZbUtKnKghCBzUOYVidxMGcyrgFXefSEoAWVEDUjwc
 cjJfFmn7YBdLrojIPVwRljrco+nuacc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-nMzY3dxNPgqPrZXzuxZq4w-1; Wed, 10 Feb 2021 12:16:41 -0500
X-MC-Unique: nMzY3dxNPgqPrZXzuxZq4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FF4584E243;
 Wed, 10 Feb 2021 17:16:40 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-218.ams2.redhat.com [10.36.113.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A86260657;
 Wed, 10 Feb 2021 17:16:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] softmmu/memory_mapping: optimize for RamDiscardMgr
 sections
Date: Wed, 10 Feb 2021 18:15:37 +0100
Message-Id: <20210210171537.32932-6-david@redhat.com>
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

virtio-mem logically plugs/unplugs memory within a sparse memory region
and notifies via the RamDiscardMgr interface when parts become
plugged (populated) or unplugged (discarded).

Currently, we end up (via the two users)
1) zeroing all logically unplugged/discarded memory during TPM resets.
2) reading all logically unplugged/discarded memory when dumping, to
   figure out the content is zero.

1) is always bad, because we assume unplugged memory stays discarded
   (and is already implicitly zero).
2) isn't that bad with anonymous memory, we end up reading the zero
   page (slow and unnecessary, though). However, once we use some
   file-backed memory (future use case), even reading will populate memory.

Let's cut out all parts marked as not-populated (discarded) via the
RamDiscardMgr. As virtio-mem is the single user, this now means that
logically unplugged memory ranges will no longer be included in the
dump, which results in smaller dump files and faster dumping.

virtio-mem has a minimum granularity of 1 MiB (and the default is usually
2 MiB). Theoretically, we can see quite some fragmentation, in practice
we won't have it completely fragmented in 1 MiB pieces. Still, we might
end up with many physical ranges.

Both, the ELF format and kdump seem to be ready to support many
individual ranges (e.g., for ELF it seems to be UINT32_MAX, kdump has a
linear bitmap).

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
 softmmu/memory_mapping.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index 05e8270edc..c9a3da6b54 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -244,6 +244,35 @@ static void guest_phys_block_add(GuestPhysBlockList *list, MemoryRegion *mr,
 #endif
 }
 
+typedef struct GuestPhysRDL {
+    GuestPhysBlockList *list;
+    RamDiscardListener listener;
+    MemoryRegionSection *section;
+} GuestPhysRDL;
+
+static int guest_phys_ram_discard_notify_populate(RamDiscardListener *listener,
+                                                  const MemoryRegion *const_mr,
+                                                  ram_addr_t offset,
+                                                  ram_addr_t size)
+{
+    GuestPhysRDL *rdl = container_of(listener, GuestPhysRDL, listener);
+    MemoryRegionSection *s = rdl->section;
+    const hwaddr mr_start = MAX(offset, s->offset_within_region);
+    const hwaddr mr_end = MIN(offset + size,
+                              s->offset_within_region + int128_get64(s->size));
+    uint8_t *host_addr;
+
+    if (mr_start >= mr_end) {
+        return 0;
+    }
+
+    host_addr = memory_region_get_ram_ptr(s->mr) + mr_start;
+    guest_phys_block_add(rdl->list, s->mr,
+                         mr_start + s->offset_within_address_space,
+                         mr_end + s->offset_within_address_space, host_addr);
+    return 0;
+}
+
 static void guest_phys_blocks_region_add(MemoryListener *listener,
                                          MemoryRegionSection *section)
 {
@@ -258,6 +287,22 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
         return;
     }
 
+    /* for special sparse regions, only add populated parts */
+    if (memory_region_has_ram_discard_mgr(section->mr)) {
+        RamDiscardMgr *rdm = memory_region_get_ram_discard_mgr(section->mr);
+        RamDiscardMgrClass *rdmc = RAM_DISCARD_MGR_GET_CLASS(rdm);
+        GuestPhysRDL rdl = {
+            .list = g->list,
+            .section = section,
+        };
+
+        ram_discard_listener_init(&rdl.listener,
+                                  guest_phys_ram_discard_notify_populate, NULL,
+                                  NULL);
+        rdmc->replay_populated(rdm, section->mr, &rdl.listener);
+        return;
+    }
+
     target_start = section->offset_within_address_space;
     target_end = target_start + int128_get64(section->size);
     host_addr = memory_region_get_ram_ptr(section->mr) +
-- 
2.29.2


