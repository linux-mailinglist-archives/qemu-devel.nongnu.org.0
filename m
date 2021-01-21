Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD692FE87A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:14:10 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Xuj-000796-EL
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:14:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l2Xo3-000714-26
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1l2Xo1-0006uN-5P
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611227232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1eULhF2tyFRkP1zUYI/GYmvW16zwAnBRia2WSMsPkM=;
 b=hLKFguoWRAsdn0bLKSGLkQgJAFck2vjofYj/xgClyoRS62I/ktCQyV5IMQxmQqTBeLoGzo
 kwSK0SR9Sfy4wBAmUduKRIS7wi+/oGn5k8VS+9dH7Ms/PWJMi8al3hBxEMj5e/CjWSWvHw
 NeW8My0xF1g4+TeQ2DSE8Oi60MlDOus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-uIkcf6o5PpuFeYNTufFFkw-1; Thu, 21 Jan 2021 06:07:08 -0500
X-MC-Unique: uIkcf6o5PpuFeYNTufFFkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733C5100C600;
 Thu, 21 Jan 2021 11:07:07 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D340710013BD;
 Thu, 21 Jan 2021 11:06:55 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/11] vfio: Sanity check maximum number of DMA mappings
 with RamDiscardMgr
Date: Thu, 21 Jan 2021 12:05:35 +0100
Message-Id: <20210121110540.33704-7-david@redhat.com>
In-Reply-To: <20210121110540.33704-1-david@redhat.com>
References: <20210121110540.33704-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although RamDiscardMgr can handle running into the maximum number of
DMA mappings by propagating errors when creating a DMA mapping, we want
to sanity check and warn the user early that there is a theoretical setup
issue and that virtio-mem might not be able to provide as much memory
towards a VM as desired.

As suggested by Alex, let's use the number of KVM memory slots to guess
how many other mappings we might see over time.

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
index 78be813a53..166ec6ec62 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -761,6 +761,49 @@ static void vfio_register_ram_discard_notifier(VFIOContainer *container,
                               vfio_ram_discard_notify_discard_all);
     rdmc->register_listener(rdm, section->mr, &vrdl->listener);
     QLIST_INSERT_HEAD(&container->vrdl_list, vrdl, next);
+
+    /*
+     * Sanity-check if we have a theoretically problematic setup where we could
+     * exceed the maximum number of possible DMA mappings over time. We assume
+     * that each mapped section in the same address space as a RamDiscardMgr
+     * section consumes exactly one DMA mapping, with the exception of
+     * RamDiscardMgr sections; i.e., we don't expect to have gIOMMU sections in
+     * the same address space as RamDiscardMgr sections.
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
2.29.2


