Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314313BF071
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 21:46:16 +0200 (CEST)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1DUt-0000oW-87
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 15:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DIy-0002e4-VW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1DIw-0007jm-8g
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 15:33:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625686433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJ5LwKOrrp3cXPafTOZWAfLKPhKVXnWGeznvU4GZumI=;
 b=ZlqMP5ZIcauyBiXWgP0RJXLa2M/wmu044cKADr8qz+eLI2P+XVvEk2PZLGoShApbgItWSx
 /nBjCdUMf9Mxu/oWkFbupJsOcVCeTpMTyBjAKIT+nf5/VuB2fVLW1Ar7xM5P8Nql3mpw/2
 y7vnHA2UjaiKZV7j1VHxW5cBTTqrioU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-UEJKfup5OaW8_oDDc0o_tw-1; Wed, 07 Jul 2021 15:33:52 -0400
X-MC-Unique: UEJKfup5OaW8_oDDc0o_tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AD5B10B7463;
 Wed,  7 Jul 2021 19:33:51 +0000 (UTC)
Received: from localhost (ovpn-113-79.rdu2.redhat.com [10.10.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7E9E5D6A8;
 Wed,  7 Jul 2021 19:33:50 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 10/15] vfio: Sanity check maximum number of DMA mappings with
 RamDiscardManager
Date: Wed,  7 Jul 2021 15:32:36 -0400
Message-Id: <20210707193241.2659335-11-ehabkost@redhat.com>
In-Reply-To: <20210707193241.2659335-1-ehabkost@redhat.com>
References: <20210707193241.2659335-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210413095531.25603-9-david@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/vfio/common.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 79628d60aed..f8a2fe8441a 100644
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
2.31.1


