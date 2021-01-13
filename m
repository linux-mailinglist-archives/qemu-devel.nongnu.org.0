Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAC2F4F32
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:51:44 +0100 (CET)
Received: from localhost ([::1]:32986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziQx-0003H3-7V
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:51:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziLU-0006Un-Tv
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kziLT-00069X-1J
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ko5WBFXoVfjkU3bTSNRILLRsJH5HnXFXKxAL8O3vHL0=;
 b=fmHScRWiMOYGWH7Y6ia4W/pK4wVsZxUzj6cl9kZDfQtFlvpetanHKdWRcaewJYxGcYaZFI
 pC1gguy7CiBvhXz0iC96Q/sdCm9ntkWBb47Axj+F6Hznb9Zr9/e2u15aLUTWgAym/lAEVt
 nht3KhLXSN38Akxc7F8Q6ueC5fUn8jI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-FS_j2EIsNG-QB6amoIe8cQ-1; Wed, 13 Jan 2021 10:45:58 -0500
X-MC-Unique: FS_j2EIsNG-QB6amoIe8cQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CA3681470A
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:45:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-95.pek2.redhat.com [10.72.12.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65CE277BE2;
 Wed, 13 Jan 2021 15:45:56 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] virtio-pci:add support for configure interrupt
Date: Wed, 13 Jan 2021 23:45:38 +0800
Message-Id: <20210113154540.24981-3-lulu@redhat.com>
In-Reply-To: <20210113154540.24981-1-lulu@redhat.com>
References: <20210113154540.24981-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for configure interrupt, use kvm_irqfd_assign and set the
gsi to kernel. When the configure notifier was eventfd_signal by host
kernel, this will finally inject an msix interrupt to guest

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/virtio-pci.c         | 93 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-bus.h |  2 +
 2 files changed, 95 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 36524a5728..f8053e1fab 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -762,6 +762,98 @@ undo:
     return ret;
 }
 
+ static int kvm_virtio_pci_config_irqfd_use(VirtIOPCIProxy *proxy,
+                                 unsigned int vector)
+{
+    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *n = virtio_queue_get_config_notifier(vdev);
+    assert(irqfd);
+    return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqfd->virq);
+}
+
+static void kvm_virtio_pci_config_irqfd_release(VirtIOPCIProxy *proxy,
+                                      unsigned int vector)
+{
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *n = virtio_queue_get_config_notifier(vdev);
+    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
+    assert(irqfd);
+    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
+    return;
+}
+static int kvm_virtio_pci_config_vector_use(VirtIOPCIProxy *proxy,
+                                        unsigned int vector)
+{
+    VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
+    int ret;
+
+    if (irqfd->users == 0) {
+        ret = kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->pci_dev);
+        if (ret < 0) {
+            return ret;
+        }
+        irqfd->virq = ret;
+    }
+    irqfd->users++;
+
+    return 0;
+}
+static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
+{
+
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    int ret;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    vector = vdev->config_vector ;
+    ret = kvm_virtio_pci_config_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    ret = kvm_virtio_pci_config_irqfd_use(proxy,  vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    return 0;
+undo:
+    kvm_virtio_pci_config_irqfd_release(proxy, vector);
+    return ret;
+}
+static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy)
+{
+    PCIDevice *dev = &proxy->pci_dev;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    unsigned int vector;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    vector = vdev->config_vector ;
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return;
+    }
+    kvm_virtio_pci_config_irqfd_release(proxy, vector);
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+
+static int virtio_pci_set_guest_config_notifier(DeviceState *d,  bool assign,
+                                         bool with_irqfd)
+{
+    VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    EventNotifier *notifier = virtio_queue_get_config_notifier(vdev);
+    int r = 0;
+    if (assign) {
+        r = event_notifier_init(notifier, 1);
+        virtio_set_config_notifier_fd_handler(vdev, true, with_irqfd);
+        kvm_virtio_pci_vector_config_use(proxy);
+    } else {
+        virtio_set_config_notifier_fd_handler(vdev, false, with_irqfd);
+        kvm_virtio_pci_vector_config_release(proxy);
+        event_notifier_cleanup(notifier);
+    }
+    return r;
+}
+
 static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
 {
     PCIDevice *dev = &proxy->pci_dev;
@@ -2137,6 +2229,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
     k->get_dma_as = virtio_pci_get_dma_as;
     k->queue_enabled = virtio_pci_queue_enabled;
+    k->set_config_notifiers = virtio_pci_set_guest_config_notifier;
 }
 
 static const TypeInfo virtio_pci_bus_info = {
diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.h
index ef8abe49c5..dae81ee414 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -93,6 +93,8 @@ struct VirtioBusClass {
      */
     bool has_variable_vring_alignment;
     AddressSpace *(*get_dma_as)(DeviceState *d);
+    int (*set_config_notifiers)(DeviceState *d, bool assign, bool with_irqfd);
+
 };
 
 struct VirtioBusState {
-- 
2.21.3


