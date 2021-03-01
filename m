Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE02328337
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:15:50 +0100 (CET)
Received: from localhost ([::1]:45426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlD3-00043e-J0
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGlAA-00028y-A4
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:12:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lGlA8-0003Tx-FY
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614615167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=voQ6vGrVGrtv1/Gt+CSy1bszM8wXuK7Aj5ODGwvGILE=;
 b=JZ7tUBEFeXmdsIXVMVzWU06Qa+Eo4FB7FTVD4H3I+jwxBNm5/VgY3wSWvJkkGFd/7WIZbp
 WzN5LPDka6FYXEXiYcDY855ItQZvTb/lIfSOrCFHv3ZB6yHf+zE5X8s3URA3TUyZRsOJdS
 r6Z0mj54HNx1Pv2OJwxRvCcyYmb7+18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-xwHI_g27NO6YiInMupRbtQ-1; Mon, 01 Mar 2021 11:12:46 -0500
X-MC-Unique: xwHI_g27NO6YiInMupRbtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1129CE64C;
 Mon,  1 Mar 2021 16:12:44 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-87.ams2.redhat.com [10.36.114.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B06619C45;
 Mon,  1 Mar 2021 16:12:42 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] softmmu/memory_mapping: optimize for RamDiscardManager
 sections
Date: Mon,  1 Mar 2021 17:11:37 +0100
Message-Id: <20210301161137.78941-6-david@redhat.com>
In-Reply-To: <20210301161137.78941-1-david@redhat.com>
References: <20210301161137.78941-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio-mem logically plugs/unplugs memory within a sparse memory region
and notifies via the RamDiscardManager interface when parts become
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
RamDiscardManager. As virtio-mem is the single user, this now means that
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
Cc: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 softmmu/memory_mapping.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
index 28d28cc702..30a12d4321 100644
--- a/softmmu/memory_mapping.c
+++ b/softmmu/memory_mapping.c
@@ -247,6 +247,15 @@ static void guest_phys_block_add_section(GuestPhysListener *g,
 #endif
 }
 
+static int guest_phys_ram_populate_cb(MemoryRegionSection *section,
+                                      void *opaque)
+{
+    GuestPhysListener *g = opaque;
+
+    guest_phys_block_add_section(g, section);
+    return 0;
+}
+
 static void guest_phys_blocks_region_add(MemoryListener *listener,
                                          MemoryRegionSection *section)
 {
@@ -258,6 +267,17 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
         memory_region_is_nonvolatile(section->mr)) {
         return;
     }
+
+    /* for special sparse regions, only add populated parts */
+    if (memory_region_has_ram_discard_manager(section->mr)) {
+        RamDiscardManager *rdm;
+
+        rdm = memory_region_get_ram_discard_manager(section->mr);
+        ram_discard_manager_replay_populated(rdm, section,
+                                             guest_phys_ram_populate_cb, g);
+        return;
+    }
+
     guest_phys_block_add_section(g, section);
 }
 
-- 
2.29.2


