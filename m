Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B7335DC19
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 12:03:30 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWFtJ-00052D-Mx
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 06:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFor-0000Ff-0a
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWFoo-0005A0-Pl
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 05:58:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618307930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OF2Avqhi1NxubbIevtnHklbZmpcAhaxAAg2V6MJw3Es=;
 b=SY98rnZLzl4gExUkFyEFowWjGN2BcKbqOhZAZU4fCFUwqwiROg3ml2GdcX1zAbVDMIhygf
 hRAFf8b2AB11DuE8ud90YC7DNbKambCblyPmHvlopzHkFujsDWg/FM48/OPKHqC6DEnKMQ
 uM6anOxb2r5Qpyq7TpW8xbzFvoZi1wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-aF9ya0ZnM2KbHo44ke_vnA-1; Tue, 13 Apr 2021 05:58:48 -0400
X-MC-Unique: aF9ya0ZnM2KbHo44ke_vnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9607C9127B;
 Tue, 13 Apr 2021 09:58:47 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-69.ams2.redhat.com [10.36.115.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B95BF5E1A4;
 Tue, 13 Apr 2021 09:58:37 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v7 08/13] vfio: Sanity check maximum number of DMA
 mappings with RamDiscardManager
Date: Tue, 13 Apr 2021 11:55:26 +0200
Message-Id: <20210413095531.25603-9-david@redhat.com>
In-Reply-To: <20210413095531.25603-1-david@redhat.com>
References: <20210413095531.25603-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although RamDiscardManager can handle running into the maximum number of
DMA mappings by propagating errors when creating a DMA mapping, we want
to sanity check and warn the user early that there is a theoretical setup
issue and that virtio-mem might not be able to provide as much memory
towards a VM as desired.

As suggested by Alex, let's use the number of KVM memory slots to guess
how many other mappings we might see over time.

Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Alex Williamson <alex.williamson@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Cc: Marek Kedzierski <mkedzier@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/vfio/common.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 79628d60ae..f8a2fe8441 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -728,6 +728,49 @@ static void vfio_register_ram_discard_listener(VFIOContainer *container,
                               vfio_ram_discard_notify_discard, true);
     ram_discard_manager_register_listener(rdm, &vrdl->listener, section);
     QLIST_INSERT_HEAD(&container->vrdl_list, vrdl, next);
+
+    /*
+     * Sanity-check if we have a theoretically problematic setup where we could
+     * exceed the maximum number of possible DMA mappings over time. We assume
+     * that each mapped section in the same address space as a RamDiscardManager
+     * section consumes exactly one DMA mapping, with the exception of
+     * RamDiscardManager sections; i.e., we don't expect to have gIOMMU sections
+     * in the same address space as RamDiscardManager sections.
+     *
+     * We assume that each section in the address space consumes one memslot.
+     * We take the number of KVM memory slots as a best guess for the maximum
+     * number of sections in the address space we could have over time,
+     * also consuming DMA mappings.
+     */
+    if (container->dma_max_mappings) {
+        unsigned int vrdl_count = 0, vrdl_mappings = 0, max_memslots = 512;
+
+#ifdef CONFIG_KVM
+        if (kvm_enabled()) {
+            max_memslots = kvm_get_max_memslots();
+        }
+#endif
+
+        QLIST_FOREACH(vrdl, &container->vrdl_list, next) {
+            hwaddr start, end;
+
+            start = QEMU_ALIGN_DOWN(vrdl->offset_within_address_space,
+                                    vrdl->granularity);
+            end = ROUND_UP(vrdl->offset_within_address_space + vrdl->size,
+                           vrdl->granularity);
+            vrdl_mappings += (end - start) / vrdl->granularity;
+            vrdl_count++;
+        }
+
+        if (vrdl_mappings + max_memslots - vrdl_count >
+            container->dma_max_mappings) {
+            warn_report("%s: possibly running out of DMA mappings. E.g., try"
+                        " increasing the 'block-size' of virtio-mem devies."
+                        " Maximum possible DMA mappings: %d, Maximum possible"
+                        " memslots: %d", __func__, container->dma_max_mappings,
+                        max_memslots);
+        }
+    }
 }
 
 static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
-- 
2.30.2


