Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94501FA22D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:59:13 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkwCH-0006xv-0L
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuO-00038V-Vt
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45917
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvuJ-0000Yx-BO
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZVlrKDqgEgfNKrKTmg+HbYIgOFjHjy9/9rz8chXYbk=;
 b=ZTm7nd9FgdpMWmXBfjtIdhpvIaElMUzodhuRiShgf63tMAQH1Korxv62F7iIwYtmx432g1
 3J5O/tFGheAFU+9Ddp5Gg4XDFX8XlM+MD4QMoI4NfhOzMnWM4hPe9UNrtZ+hTyVGYegVHT
 F+7JufQ33C4ZMcQQYQoGBJAztdA88XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-Jk0ecidRP3KFAznRnUQjcQ-1; Mon, 15 Jun 2020 16:40:33 -0400
X-MC-Unique: Jk0ecidRP3KFAznRnUQjcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CABF45AED0
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 20:40:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F395F60F80;
 Mon, 15 Jun 2020 20:40:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A2C8C113524E; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/84] qdev: Convert uses of qdev_set_parent_bus() with
 Coccinelle
Date: Mon, 15 Jun 2020 22:39:21 +0200
Message-Id: <20200615204008.3069956-38-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 16:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In addition to the qdev_create() patterns converted so far, we have a
qdev_set_parent_bus() pattern.  Mostly when we embed a device in a
parent device rather than allocating it on the heap.

This pattern also puts devices in the dangerous "no QOM parent, but
plugged into bus" state I explained in recent commit "qdev: New
qdev_new(), qdev_realize(), etc."

Apply same solution: convert to qdev_realize().  Coccinelle script:

    @@
    expression dev, bus, errp;
    symbol true;
    @@
    -    qdev_set_parent_bus(DEVICE(dev), bus);
         ...
    -    object_property_set_bool(OBJECT(dev), true, "realized", errp);
    +    qdev_realize(DEVICE(dev), bus, errp);

    @ depends on !(file in "qdev-monitor.c") && !(file in "hw/core/qdev.c")@
    expression dev, bus, errp;
    symbol true;
    @@
    -    qdev_set_parent_bus(dev, bus);
         ...
    -    object_property_set_bool(OBJECT(dev), true, "realized", errp);
    +    qdev_realize(dev, bus, errp);

    @@
    expression dev, bus;
    symbol true;
    @@
    -    qdev_set_parent_bus(DEVICE(dev), bus);
         ...
    -    qdev_init_nofail(DEVICE(dev));
    +    qdev_realize(DEVICE(dev), bus, &error_fatal);

Unconverted uses of qdev_set_parent_bus() remain.  They'll be
converted later in this series.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20200610053247.1583243-12-armbru@redhat.com>
[Also convert new hw/virtio/vhost-user-vsock-pci.c]
---
 hw/display/virtio-gpu-pci.c      | 3 +--
 hw/display/virtio-vga.c          | 3 +--
 hw/i386/amd_iommu.c              | 3 +--
 hw/isa/piix4.c                   | 3 +--
 hw/misc/macio/macio.c            | 7 ++-----
 hw/pci-host/designware.c         | 3 +--
 hw/pci-host/gpex.c               | 3 +--
 hw/pci-host/pnv_phb3.c           | 3 +--
 hw/pci-host/pnv_phb4.c           | 3 +--
 hw/pci-host/q35.c                | 3 +--
 hw/pci-host/versatile.c          | 3 +--
 hw/pci-host/xilinx-pcie.c        | 3 +--
 hw/s390x/vhost-vsock-ccw.c       | 3 +--
 hw/s390x/virtio-ccw-9p.c         | 3 +--
 hw/s390x/virtio-ccw-balloon.c    | 3 +--
 hw/s390x/virtio-ccw-blk.c        | 3 +--
 hw/s390x/virtio-ccw-crypto.c     | 3 +--
 hw/s390x/virtio-ccw-gpu.c        | 3 +--
 hw/s390x/virtio-ccw-input.c      | 3 +--
 hw/s390x/virtio-ccw-net.c        | 3 +--
 hw/s390x/virtio-ccw-rng.c        | 3 +--
 hw/s390x/virtio-ccw-scsi.c       | 6 ++----
 hw/s390x/virtio-ccw-serial.c     | 3 +--
 hw/virtio/vhost-scsi-pci.c       | 3 +--
 hw/virtio/vhost-user-blk-pci.c   | 3 +--
 hw/virtio/vhost-user-fs-pci.c    | 3 +--
 hw/virtio/vhost-user-scsi-pci.c  | 3 +--
 hw/virtio/vhost-user-vsock-pci.c | 3 +--
 hw/virtio/vhost-vsock-pci.c      | 3 +--
 hw/virtio/virtio-9p-pci.c        | 3 +--
 hw/virtio/virtio-balloon-pci.c   | 3 +--
 hw/virtio/virtio-blk-pci.c       | 3 +--
 hw/virtio/virtio-crypto-pci.c    | 3 +--
 hw/virtio/virtio-input-pci.c     | 3 +--
 hw/virtio/virtio-iommu-pci.c     | 3 +--
 hw/virtio/virtio-net-pci.c       | 3 +--
 hw/virtio/virtio-pmem-pci.c      | 3 +--
 hw/virtio/virtio-rng-pci.c       | 3 +--
 hw/virtio/virtio-scsi-pci.c      | 3 +--
 hw/virtio/virtio-serial-pci.c    | 3 +--
 hw/xen/xen-legacy-backend.c      | 3 +--
 41 files changed, 43 insertions(+), 87 deletions(-)

diff --git a/hw/display/virtio-gpu-pci.c b/hw/display/virtio-gpu-pci.c
index 3d152ff5c8..b532fe8b5f 100644
--- a/hw/display/virtio-gpu-pci.c
+++ b/hw/display/virtio-gpu-pci.c
@@ -33,9 +33,8 @@ static void virtio_gpu_pci_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     int i;
     Error *local_error = NULL;
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     virtio_pci_force_virtio_1(vpci_dev);
-    object_property_set_bool(OBJECT(vdev), true, "realized", &local_error);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), &local_error);
 
     if (local_error) {
         error_propagate(errp, local_error);
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 95757a6619..68a062ece6 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -137,9 +137,8 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     vpci_dev->common.offset = offset;
 
     /* init virtio bits */
-    qdev_set_parent_bus(DEVICE(g), BUS(&vpci_dev->bus));
     virtio_pci_force_virtio_1(vpci_dev);
-    object_property_set_bool(OBJECT(g), true, "realized", &err);
+    qdev_realize(DEVICE(g), BUS(&vpci_dev->bus), &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 4346060e62..b26d30da57 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1549,8 +1549,7 @@ static void amdvi_realize(DeviceState *dev, Error **errp)
 
     /* This device should take care of IOMMU PCI properties */
     x86_iommu->type = TYPE_AMD;
-    qdev_set_parent_bus(DEVICE(&s->pci), &bus->qbus);
-    object_property_set_bool(OBJECT(&s->pci), true, "realized", errp);
+    qdev_realize(DEVICE(&s->pci), &bus->qbus, errp);
     ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
                                          AMDVI_CAPAB_SIZE, errp);
     if (ret < 0) {
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9a10fb9b3c..f634bcb2d1 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -182,9 +182,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     i8257_dma_init(isa_bus, 0);
 
     /* RTC */
-    qdev_set_parent_bus(DEVICE(&s->rtc), BUS(isa_bus));
     qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
+    qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index 53a9fd5696..216bdc69c0 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -356,9 +356,7 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         object_property_set_link(OBJECT(&s->pmu), OBJECT(sysbus_dev), "gpio",
                                  &error_abort);
         qdev_prop_set_bit(DEVICE(&s->pmu), "has-adb", ns->has_adb);
-        qdev_set_parent_bus(DEVICE(&s->pmu), BUS(&s->macio_bus));
-
-        object_property_set_bool(OBJECT(&s->pmu), true, "realized", &err);
+        qdev_realize(DEVICE(&s->pmu), BUS(&s->macio_bus), &err);
         if (err) {
             error_propagate(errp, err);
             return;
@@ -374,11 +372,10 @@ static void macio_newworld_realize(PCIDevice *d, Error **errp)
         /* CUDA */
         object_initialize_child(OBJECT(s), "cuda", &s->cuda, sizeof(s->cuda),
                                 TYPE_CUDA, &error_abort, NULL);
-        qdev_set_parent_bus(DEVICE(&s->cuda), BUS(&s->macio_bus));
         qdev_prop_set_uint64(DEVICE(&s->cuda), "timebase-frequency",
                              s->frequency);
 
-        object_property_set_bool(OBJECT(&s->cuda), true, "realized", &err);
+        qdev_realize(DEVICE(&s->cuda), BUS(&s->macio_bus), &err);
         if (err) {
             error_propagate(errp, err);
             return;
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index dd245516dd..2e97d6b17f 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -688,8 +688,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                        "pcie-bus-address-space");
     pci_setup_iommu(pci->bus, designware_pcie_host_set_iommu, s);
 
-    qdev_set_parent_bus(DEVICE(&s->root), BUS(pci->bus));
-    qdev_init_nofail(DEVICE(&s->root));
+    qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
 }
 
 static const VMStateDescription vmstate_designware_pcie_host = {
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 0ca604dc62..3dfb3bf599 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -98,9 +98,8 @@ static void gpex_host_realize(DeviceState *dev, Error **errp)
                                      pci_swizzle_map_irq_fn, s, &s->io_mmio,
                                      &s->io_ioport, 0, 4, TYPE_PCIE_BUS);
 
-    qdev_set_parent_bus(DEVICE(&s->gpex_root), BUS(pci->bus));
     pci_bus_set_route_irq_fn(pci->bus, gpex_route_intx_pin_to_irq);
-    qdev_init_nofail(DEVICE(&s->gpex_root));
+    qdev_realize(DEVICE(&s->gpex_root), BUS(pci->bus), &error_fatal);
 }
 
 static const char *gpex_host_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 74618fadf0..8dcfe4a2fd 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1064,8 +1064,7 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
     /* Add a single Root port */
     qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
     qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_set_parent_bus(DEVICE(&phb->root), BUS(pci->bus));
-    qdev_init_nofail(DEVICE(&phb->root));
+    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
 }
 
 void pnv_phb3_update_regions(PnvPHB3 *phb)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 23cf093928..e30ae9ad5b 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1210,8 +1210,7 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     /* Add a single Root port */
     qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
     qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_set_parent_bus(DEVICE(&phb->root), BUS(pci->bus));
-    qdev_init_nofail(DEVICE(&phb->root));
+    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
 
     /* Setup XIVE Source */
     if (phb->big_phb) {
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index b788f17b2c..43ed5188cc 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -64,8 +64,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
                                 s->mch.address_space_io,
                                 0, TYPE_PCIE_BUS);
     PC_MACHINE(qdev_get_machine())->bus = pci->bus;
-    qdev_set_parent_bus(DEVICE(&s->mch), BUS(pci->bus));
-    qdev_init_nofail(DEVICE(&s->mch));
+    qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
 
 static const char *q35_host_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index ea7390c6fa..616882a80d 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -409,7 +409,6 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     h->bus = &s->pci_bus;
 
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PCI_HOST);
-    qdev_set_parent_bus(DEVICE(&s->pci_dev), BUS(&s->pci_bus));
 
     for (i = 0; i < 4; i++) {
         sysbus_init_irq(sbd, &s->irq[i]);
@@ -459,7 +458,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     }
 
     /* TODO Remove once realize propagates to child devices. */
-    object_property_set_bool(OBJECT(&s->pci_dev), true, "realized", errp);
+    qdev_realize(DEVICE(&s->pci_dev), BUS(&s->pci_bus), errp);
 }
 
 static void versatile_pci_host_realize(PCIDevice *d, Error **errp)
diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
index e06f2b59cf..e4fc8abb6a 100644
--- a/hw/pci-host/xilinx-pcie.c
+++ b/hw/pci-host/xilinx-pcie.c
@@ -137,8 +137,7 @@ static void xilinx_pcie_host_realize(DeviceState *dev, Error **errp)
                                      pci_swizzle_map_irq_fn, s, &s->mmio,
                                      &s->io, 0, 4, TYPE_PCIE_BUS);
 
-    qdev_set_parent_bus(DEVICE(&s->root), BUS(pci->bus));
-    qdev_init_nofail(DEVICE(&s->root));
+    qdev_realize(DEVICE(&s->root), BUS(pci->bus), &error_fatal);
 }
 
 static const char *xilinx_pcie_host_root_bus_path(PCIHostState *host_bridge,
diff --git a/hw/s390x/vhost-vsock-ccw.c b/hw/s390x/vhost-vsock-ccw.c
index 12dee15e11..0822ecca89 100644
--- a/hw/s390x/vhost-vsock-ccw.c
+++ b/hw/s390x/vhost-vsock-ccw.c
@@ -24,8 +24,7 @@ static void vhost_vsock_ccw_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VHostVSockCCWState *dev = VHOST_VSOCK_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void vhost_vsock_ccw_class_init(ObjectClass *klass, void *data)
diff --git a/hw/s390x/virtio-ccw-9p.c b/hw/s390x/virtio-ccw-9p.c
index 08e1d5d416..88c8884fc5 100644
--- a/hw/s390x/virtio-ccw-9p.c
+++ b/hw/s390x/virtio-ccw-9p.c
@@ -21,8 +21,7 @@ static void virtio_ccw_9p_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     V9fsCCWState *dev = VIRTIO_9P_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_9p_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-balloon.c b/hw/s390x/virtio-ccw-balloon.c
index ef3308ecab..4c7631a433 100644
--- a/hw/s390x/virtio-ccw-balloon.c
+++ b/hw/s390x/virtio-ccw-balloon.c
@@ -21,8 +21,7 @@ static void virtio_ccw_balloon_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VirtIOBalloonCcw *dev = VIRTIO_BALLOON_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_balloon_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-blk.c b/hw/s390x/virtio-ccw-blk.c
index 7287932b7e..2294ce1ce4 100644
--- a/hw/s390x/virtio-ccw-blk.c
+++ b/hw/s390x/virtio-ccw-blk.c
@@ -21,8 +21,7 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_blk_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-crypto.c b/hw/s390x/virtio-ccw-crypto.c
index 1a2690cf9e..ca6753bff3 100644
--- a/hw/s390x/virtio-ccw-crypto.c
+++ b/hw/s390x/virtio-ccw-crypto.c
@@ -21,8 +21,7 @@ static void virtio_ccw_crypto_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     DeviceState *vdev = DEVICE(&dev->vdev);
     Error *err = NULL;
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", &err);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/s390x/virtio-ccw-gpu.c b/hw/s390x/virtio-ccw-gpu.c
index f69e3ff5a0..c301e2586b 100644
--- a/hw/s390x/virtio-ccw-gpu.c
+++ b/hw/s390x/virtio-ccw-gpu.c
@@ -20,8 +20,7 @@ static void virtio_ccw_gpu_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VirtIOGPUCcw *dev = VIRTIO_GPU_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_gpu_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-input.c b/hw/s390x/virtio-ccw-input.c
index b257dfd467..5601e25dee 100644
--- a/hw/s390x/virtio-ccw-input.c
+++ b/hw/s390x/virtio-ccw-input.c
@@ -20,8 +20,7 @@ static void virtio_ccw_input_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VirtIOInputCcw *dev = VIRTIO_INPUT_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static Property virtio_ccw_input_properties[] = {
diff --git a/hw/s390x/virtio-ccw-net.c b/hw/s390x/virtio-ccw-net.c
index 26c4d873bf..3860d4e6ea 100644
--- a/hw/s390x/virtio-ccw-net.c
+++ b/hw/s390x/virtio-ccw-net.c
@@ -24,8 +24,7 @@ static void virtio_ccw_net_realize(VirtioCcwDevice *ccw_dev, Error **errp)
 
     virtio_net_set_netclient_name(&dev->vdev, qdev->id,
                                   object_get_typename(OBJECT(qdev)));
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_net_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-rng.c b/hw/s390x/virtio-ccw-rng.c
index d575e30cc6..4077160f49 100644
--- a/hw/s390x/virtio-ccw-rng.c
+++ b/hw/s390x/virtio-ccw-rng.c
@@ -22,8 +22,7 @@ static void virtio_ccw_rng_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     DeviceState *vdev = DEVICE(&dev->vdev);
     Error *err = NULL;
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", &err);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/s390x/virtio-ccw-scsi.c b/hw/s390x/virtio-ccw-scsi.c
index 3cb3ad669d..6e4beef700 100644
--- a/hw/s390x/virtio-ccw-scsi.c
+++ b/hw/s390x/virtio-ccw-scsi.c
@@ -33,8 +33,7 @@ static void virtio_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
         g_free(bus_name);
     }
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void virtio_ccw_scsi_instance_init(Object *obj)
@@ -78,8 +77,7 @@ static void vhost_ccw_scsi_realize(VirtioCcwDevice *ccw_dev, Error **errp)
     VHostSCSICcw *dev = VHOST_SCSI_CCW(ccw_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 static void vhost_ccw_scsi_instance_init(Object *obj)
diff --git a/hw/s390x/virtio-ccw-serial.c b/hw/s390x/virtio-ccw-serial.c
index 1764db2e70..61958228d1 100644
--- a/hw/s390x/virtio-ccw-serial.c
+++ b/hw/s390x/virtio-ccw-serial.c
@@ -33,8 +33,7 @@ static void virtio_ccw_serial_realize(VirtioCcwDevice *ccw_dev, Error **errp)
         g_free(bus_name);
     }
 
-    qdev_set_parent_bus(vdev, BUS(&ccw_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&ccw_dev->bus), errp);
 }
 
 
diff --git a/hw/virtio/vhost-scsi-pci.c b/hw/virtio/vhost-scsi-pci.c
index 5da6bb6449..095af23f3f 100644
--- a/hw/virtio/vhost-scsi-pci.c
+++ b/hw/virtio/vhost-scsi-pci.c
@@ -53,8 +53,7 @@ static void vhost_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = vs->conf.num_queues + 3;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_scsi_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-user-blk-pci.c b/hw/virtio/vhost-user-blk-pci.c
index 58d7c31735..4f5d5cbf44 100644
--- a/hw/virtio/vhost-user-blk-pci.c
+++ b/hw/virtio/vhost-user-blk-pci.c
@@ -58,8 +58,7 @@ static void vhost_user_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = dev->vdev.num_queues + 1;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_user_blk_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
index ae36f1172d..e11c889d82 100644
--- a/hw/virtio/vhost-user-fs-pci.c
+++ b/hw/virtio/vhost-user-fs-pci.c
@@ -44,8 +44,7 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_user_fs_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-user-scsi-pci.c b/hw/virtio/vhost-user-scsi-pci.c
index 6f3375fe55..4705cd54e8 100644
--- a/hw/virtio/vhost-user-scsi-pci.c
+++ b/hw/virtio/vhost-user-scsi-pci.c
@@ -59,8 +59,7 @@ static void vhost_user_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = vs->conf.num_queues + 3;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_user_scsi_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index 0a6847e6fc..f4cf95873d 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -40,8 +40,7 @@ static void vhost_user_vsock_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VHostUserVSockPCI *dev = VHOST_USER_VSOCK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_user_vsock_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index 01effe3d52..a815278e69 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -44,8 +44,7 @@ static void vhost_vsock_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VHostVSockPCI *dev = VHOST_VSOCK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void vhost_vsock_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-9p-pci.c b/hw/virtio/virtio-9p-pci.c
index 6507ce340b..cbcb062faa 100644
--- a/hw/virtio/virtio-9p-pci.c
+++ b/hw/virtio/virtio-9p-pci.c
@@ -38,8 +38,7 @@ static void virtio_9p_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     V9fsPCIState *dev = VIRTIO_9P_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static Property virtio_9p_pci_properties[] = {
diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index cc25df0a3d..5adc4e5819 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -48,8 +48,7 @@ static void virtio_balloon_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->class_code = PCI_CLASS_OTHERS;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_balloon_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-blk-pci.c b/hw/virtio/virtio-blk-pci.c
index 28838fa958..849cc7dfd8 100644
--- a/hw/virtio/virtio-blk-pci.c
+++ b/hw/virtio/virtio-blk-pci.c
@@ -55,8 +55,7 @@ static void virtio_blk_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         vpci_dev->nvectors = dev->vdev.conf.num_queues + 1;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_blk_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-crypto-pci.c b/hw/virtio/virtio-crypto-pci.c
index 0bebe0149d..72be531c95 100644
--- a/hw/virtio/virtio-crypto-pci.c
+++ b/hw/virtio/virtio-crypto-pci.c
@@ -53,9 +53,8 @@ static void virtio_crypto_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         return;
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     virtio_pci_force_virtio_1(vpci_dev);
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
     object_property_set_link(OBJECT(vcrypto),
                  OBJECT(vcrypto->vdev.conf.cryptodev), "cryptodev",
                  NULL);
diff --git a/hw/virtio/virtio-input-pci.c b/hw/virtio/virtio-input-pci.c
index 5a965408df..74651a42ea 100644
--- a/hw/virtio/virtio-input-pci.c
+++ b/hw/virtio/virtio-input-pci.c
@@ -49,9 +49,8 @@ static void virtio_input_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOInputPCI *vinput = VIRTIO_INPUT_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&vinput->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     virtio_pci_force_virtio_1(vpci_dev);
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_input_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 3dfbf55b47..632533abaf 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -54,11 +54,10 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                           "-no-acpi\n");
         return;
     }
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     object_property_set_link(OBJECT(dev),
                              OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
                              "primary-bus", errp);
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
index ea43040f7b..489b5dbad6 100644
--- a/hw/virtio/virtio-net-pci.c
+++ b/hw/virtio/virtio-net-pci.c
@@ -52,8 +52,7 @@ static void virtio_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 
     virtio_net_set_netclient_name(&dev->vdev, qdev->id,
                                   object_get_typename(OBJECT(qdev)));
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_net_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index fe2af00fa1..11d0c8ebc6 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -22,8 +22,7 @@ static void virtio_pmem_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOPMEMPCI *pmem_pci = VIRTIO_PMEM_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&pmem_pci->vdev);
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_pmem_pci_set_addr(MemoryDeviceState *md, uint64_t addr,
diff --git a/hw/virtio/virtio-rng-pci.c b/hw/virtio/virtio-rng-pci.c
index 8aaf54b781..cf1afb47a6 100644
--- a/hw/virtio/virtio-rng-pci.c
+++ b/hw/virtio/virtio-rng-pci.c
@@ -36,8 +36,7 @@ static void virtio_rng_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     DeviceState *vdev = DEVICE(&vrng->vdev);
     Error *err = NULL;
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", &err);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), &err);
     if (err) {
         error_propagate(errp, err);
         return;
diff --git a/hw/virtio/virtio-scsi-pci.c b/hw/virtio/virtio-scsi-pci.c
index e82e7e5680..c23a134202 100644
--- a/hw/virtio/virtio-scsi-pci.c
+++ b/hw/virtio/virtio-scsi-pci.c
@@ -64,8 +64,7 @@ static void virtio_scsi_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         g_free(bus_name);
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static void virtio_scsi_pci_class_init(ObjectClass *klass, void *data)
diff --git a/hw/virtio/virtio-serial-pci.c b/hw/virtio/virtio-serial-pci.c
index 22ab4d8562..95d25d54da 100644
--- a/hw/virtio/virtio-serial-pci.c
+++ b/hw/virtio/virtio-serial-pci.c
@@ -65,8 +65,7 @@ static void virtio_serial_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
         g_free(bus_name);
     }
 
-    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
-    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+    qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
 static Property virtio_serial_pci_properties[] = {
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 1c25373852..ef7c832e2e 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -278,9 +278,8 @@ static struct XenLegacyDevice *xen_be_get_xendev(const char *type, int dom,
     xendev = g_malloc0(ops->size);
     object_initialize(&xendev->qdev, ops->size, TYPE_XENBACKEND);
     OBJECT(xendev)->free = g_free;
-    qdev_set_parent_bus(DEVICE(xendev), xen_sysbus);
     qdev_set_id(DEVICE(xendev), g_strdup_printf("xen-%s-%d", type, dev));
-    qdev_init_nofail(DEVICE(xendev));
+    qdev_realize(DEVICE(xendev), xen_sysbus, &error_fatal);
     object_unref(OBJECT(xendev));
 
     xendev->type  = type;
-- 
2.26.2


