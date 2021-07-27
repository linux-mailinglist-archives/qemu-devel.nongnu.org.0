Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F53D7132
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 10:30:30 +0200 (CEST)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8ITt-0002u8-Iy
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 04:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8IQb-0006zh-Ez
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m8IQY-0007Op-JW
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 04:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627374422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zg2rRImryq8KfAmpDVFmGL30U08l4spZunQYLca4K6Y=;
 b=NMTQNd+Kn9hlIFpC6wMzTD1a/vg6fbes4FCccPK8f6N25GVLSL7XGpdz72prsGkPIuGoNL
 l2B/ZTHZ7akWDJGCSP+hly7e8nK82AHfh6T0QPsWq+xSClwRwuOcWFfaNVofRumoWJR03/
 dKe27A9sV0IFIs12aYEf3jWnK5Jc3Es=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-m085-UxiNTSNkpLGC7x_Aw-1; Tue, 27 Jul 2021 04:27:00 -0400
X-MC-Unique: m085-UxiNTSNkpLGC7x_Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 740A71008068;
 Tue, 27 Jul 2021 08:26:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-128.ams2.redhat.com [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6B660C0F;
 Tue, 27 Jul 2021 08:26:38 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/4] softmmu/memory_mapping: factor out adding physical
 memory ranges
Date: Tue, 27 Jul 2021 10:25:44 +0200
Message-Id: <20210727082545.17934-4-david@redhat.com>
In-Reply-To: <20210727082545.17934-1-david@redhat.com>
References: <20210727082545.17934-1-david@redhat.com>
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
Reviewed-by: Peter Xu <peterx@redhat.com>
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


