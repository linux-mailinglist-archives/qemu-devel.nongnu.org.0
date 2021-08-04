Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC263DFA19
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 05:49:36 +0200 (CEST)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB7uR-0000Z7-GY
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 23:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tN-0006tS-E5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mB7tM-0000Q5-21
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 23:48:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628048907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67qEV5gdM+CG+tFFSGLrnAUcilav5qnPUbNR3yEn2mo=;
 b=XwZSdSkXMiDozCfsl9KmXzEecIz6BjOv4gaf/W/l1xVaQB6QN54Fo/eo76kCKwdDTNgiE1
 UgFKSmyHGZXTIm7ROXVSP3eOle9rV1dP5+pv5J36mcc3JuhPwJyrZjGj5mz+JXRo4MtFAq
 h5/h+Mfoacda61FLDOZOE8Em5wRjze8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-fWI7iU1UNmefxA_wOXITVQ-1; Tue, 03 Aug 2021 23:48:26 -0400
X-MC-Unique: fWI7iU1UNmefxA_wOXITVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC278712D6;
 Wed,  4 Aug 2021 03:48:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3C78781E6;
 Wed,  4 Aug 2021 03:48:21 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] virtio-pci: implement iommu_enabled()
Date: Wed,  4 Aug 2021 11:48:02 +0800
Message-Id: <20210804034803.1644-3-jasowang@redhat.com>
In-Reply-To: <20210804034803.1644-1-jasowang@redhat.com>
References: <20210804034803.1644-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: mst@redhat.com, Jason Wang <jasowang@redhat.com>, Wei.Huang2@amd.com,
 dgilbert@redhat.com, peterx@redhat.com, Sriyash.Caculo@amd.com,
 pbonzini@redhat.com, chao.gao@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implements the PCI transport version of iommu_enabled. This
is done by comparing the address space returned by
pci_device_iommu_address_space() against address_space_memory.

Note that an ideal approach is to use pci_device_iommu_address_space()
in get_dma_as(), but it might not work well since the IOMMU could be
initialized after the virtio-pci device is initialized.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b321604d9b..050af2517b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1110,6 +1110,19 @@ static AddressSpace *virtio_pci_get_dma_as(DeviceState *d)
     return pci_get_address_space(dev);
 }
 
+static bool virtio_pci_iommu_enabled(DeviceState *d)
+{
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
+    PCIDevice *dev = &proxy->pci_dev;
+    AddressSpace *dma_as = pci_device_iommu_address_space(dev);
+
+    if (dma_as == &address_space_memory) {
+        return false;
+    }
+
+    return true;
+}
+
 static bool virtio_pci_queue_enabled(DeviceState *d, int n)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
@@ -2173,6 +2186,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_enabled = virtio_pci_ioeventfd_enabled;
     k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
     k->get_dma_as = virtio_pci_get_dma_as;
+    k->iommu_enabled = virtio_pci_iommu_enabled;
     k->queue_enabled = virtio_pci_queue_enabled;
 }
 
-- 
2.25.1


