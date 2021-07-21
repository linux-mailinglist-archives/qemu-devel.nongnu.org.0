Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC33D0AAA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 10:42:16 +0200 (CEST)
Received: from localhost ([::1]:48244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m67nz-0005Fu-7O
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 04:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m67lW-0002zY-6S
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m67lU-0002ye-GC
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 04:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626856779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pYIbNegIBbFZAYEH31zvA+vxAFTXPNVz2U+ab08TGew=;
 b=LhF+5wRVm8EgiiyU01+P380lqzFpPxpYsnb8dKhTlVDJLUzmNJEYlj0eVy38Wo+6vQ1qnb
 KAayxSEhKqQiF9Tx7KJPQFzzob6tt1ISlMrSr0gobn/a7nUBkmSyh7/FF4CJzsR0DTHtpR
 kN1PFwGbBdBsgbszd+/7wk2os7j3Adc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-7IVL-bBKM3Oqn3BooqK6pw-1; Wed, 21 Jul 2021 04:39:38 -0400
X-MC-Unique: 7IVL-bBKM3Oqn3BooqK6pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DAAC362F8;
 Wed, 21 Jul 2021 08:39:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-250.ams2.redhat.com [10.36.113.250])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5B8760BF1;
 Wed, 21 Jul 2021 08:39:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] softmmu/memory_mapping: factor out adding physical
 memory ranges
Date: Wed, 21 Jul 2021 10:38:37 +0200
Message-Id: <20210721083838.6347-4-david@redhat.com>
In-Reply-To: <20210721083838.6347-1-david@redhat.com>
References: <20210721083838.6347-1-david@redhat.com>
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
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's factor out adding a MemoryRegionSection to the list, to be reused in
RamDiscardManager context next.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>
Cc: Thomas Huth <thuth@redhat.com>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory_mapping.c | 41 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index d401ca7e31..a2af02c41c 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -193,29 +193,14 @@ typedef struct GuestPhysListener {
     MemoryListener listener;
 } GuestPhysListener;
 
-static void guest_phys_blocks_region_add(MemoryListener *listener,
+static void guest_phys_block_add_section(GuestPhysListener *g,
                                          MemoryRegionSection *section)
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
+    const hwaddr target_start = section->offset_within_address_space;
+    const hwaddr target_end = target_start + int128_get64(section->size);
+    uint8_t *host_addr = memory_region_get_ram_ptr(section->mr) +
+                         section->offset_within_region;
+    GuestPhysBlock *predecessor = NULL;
 
     /* find continuity in guest physical address space */
     if (!QTAILQ_EMPTY(&g->list->head)) {
@@ -261,6 +246,20 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
 #endif
 }
 
+static void guest_phys_blocks_region_add(MemoryListener *listener,
+                                         MemoryRegionSection *section)
+{
+    GuestPhysListener *g = container_of(listener, GuestPhysListener, listener);
+
+    /* we only care about RAM */
+    if (!memory_region_is_ram(section->mr) ||
+        memory_region_is_ram_device(section->mr) ||
+        memory_region_is_nonvolatile(section->mr)) {
+        return;
+    }
+    guest_phys_block_add_section(g, section);
+}
+
 void guest_phys_blocks_append(GuestPhysBlockList *list)
 {
     GuestPhysListener g = { 0 };
-- 
2.31.1


