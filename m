Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEEC4DB1DA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:49:51 +0100 (CET)
Received: from localhost ([::1]:49842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUU2A-0003tw-BM
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:49:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdP-0004Pl-Qa
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdM-00045l-2Q
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ofp+3Yv7leIsX0vZqpUiZePX2ZANPGkDj4oR7EFv+2k=;
 b=FZrXnKCZ37W/xjtu/P1NySu2ibw52xJaA7UWBYg45VautpwlG+Ca2p7zshwNDQQ7uZ0Jcj
 3arJ/3s2pSMQMhyZv2DffcgMJMHw7KhMuhHQKNAtcIZUR5uoVYb2a9+KXK7lpKKn0fxfzc
 54bXIE/hFcxfheadRI6+QLh6KM4seKo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-ErUb_cmwMPGf9by3C9oY2g-1; Wed, 16 Mar 2022 09:24:07 -0400
X-MC-Unique: ErUb_cmwMPGf9by3C9oY2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7865E8D3764;
 Wed, 16 Mar 2022 13:24:07 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E614B8D46;
 Wed, 16 Mar 2022 13:24:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/display: Allow vga_common_init() to return errors
Date: Wed, 16 Mar 2022 14:24:01 +0100
Message-Id: <20220316132402.1190346-3-thuth@redhat.com>
In-Reply-To: <20220316132402.1190346-1-thuth@redhat.com>
References: <20220316132402.1190346-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vga_common_init() function currently cannot report errors to its
caller. But in the following patch, we'd need this possibility, so
let's change it to take an "Error **" as parameter for this.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/ati.c            |  7 ++++++-
 hw/display/cirrus_vga.c     |  7 ++++++-
 hw/display/cirrus_vga_isa.c |  7 ++++++-
 hw/display/qxl.c            |  6 +++++-
 hw/display/vga-isa.c        |  9 ++++++++-
 hw/display/vga-mmio.c       |  8 +++++++-
 hw/display/vga-pci.c        | 15 +++++++++++++--
 hw/display/vga.c            |  9 +++++++--
 hw/display/vga_int.h        |  2 +-
 hw/display/virtio-vga.c     |  7 ++++++-
 hw/display/vmware_vga.c     |  2 +-
 11 files changed, 66 insertions(+), 13 deletions(-)

diff --git a/hw/display/ati.c b/hw/display/ati.c
index 31f22754dc..d2def7a4d3 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -926,6 +926,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
 {
     ATIVGAState *s = ATI_VGA(dev);
     VGACommonState *vga = &s->vga;
+    Error *local_err = NULL;
 
     if (s->model) {
         int i;
@@ -955,7 +956,11 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
     }
 
     /* init vga bits */
-    vga_common_init(vga, OBJECT(s));
+    vga_common_init(vga, OBJECT(s), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vga_init(vga, OBJECT(s), pci_address_space(dev),
              pci_address_space_io(dev), true);
     vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 7da1be3e12..037f842322 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2944,6 +2944,7 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
     CirrusVGAState *s = &d->cirrus_vga;
     PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
     int16_t device_id = pc->device_id;
+    Error *local_err = NULL;
 
     /*
      * Follow real hardware, cirrus card emulated has 4 MB video memory.
@@ -2956,7 +2957,11 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
         return;
     }
     /* setup VGA */
-    vga_common_init(&s->vga, OBJECT(dev));
+    vga_common_init(&s->vga, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
                        pci_address_space_io(dev));
     s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 4f6fb1af3b..8ac017d0ce 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -46,6 +46,7 @@ static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
     ISADevice *isadev = ISA_DEVICE(dev);
     ISACirrusVGAState *d = ISA_CIRRUS_VGA(dev);
     VGACommonState *s = &d->cirrus_vga.vga;
+    Error *local_err = NULL;
 
     /* follow real hardware, cirrus card emulated has 4 MB video memory.
        Also accept 8 MB/16 MB for backward compatibility. */
@@ -56,7 +57,11 @@ static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
         return;
     }
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    vga_common_init(s, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     cirrus_init_common(&d->cirrus_vga, OBJECT(dev), CIRRUS_ID_CLGD5430, 0,
                        isa_address_space(isadev),
                        isa_address_space_io(isadev));
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 1f9ad31943..adbdbcaeb6 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -2215,7 +2215,11 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     qxl_init_ramsize(qxl);
     vga->vbe_size = qxl->vgamem_size;
     vga->vram_size_mb = qxl->vga.vram_size / MiB;
-    vga_common_init(vga, OBJECT(dev));
+    vga_common_init(vga, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vga_init(vga, OBJECT(dev),
              pci_address_space(dev), pci_address_space_io(dev), false);
     portio_list_init(&qxl->vga_port_list, OBJECT(dev), qxl_vga_portio_list,
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 90851e730b..ba0f679a2d 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/isa/isa.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
@@ -60,9 +61,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     VGACommonState *s = &d->state;
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
+    Error *local_err = NULL;
 
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    vga_common_init(s, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     s->legacy_address_space = isa_address_space(isadev);
     vga_io_memory = vga_init_io(s, OBJECT(dev), &vga_ports, &vbe_ports);
     isa_register_portio_list(isadev, &d->portio_vga,
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 4969368081..2c1b7d9973 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -88,6 +88,7 @@ static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
 {
     VGAMmioState *s = VGA_MMIO(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    Error *local_err = NULL;
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &vga_mm_ctrl_ops, s,
                           "vga-mmio", 0x100000);
@@ -102,7 +103,12 @@ static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
 
     s->vga.bank_offset = 0;
     s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, OBJECT(dev));
+    vga_common_init(&s->vga, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
     sysbus_init_mmio(sbd, &s->vga.vram);
     s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
 }
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 62fb5c38c1..0ce159fc12 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
@@ -235,11 +236,16 @@ static void pci_std_vga_realize(PCIDevice *dev, Error **errp)
 {
     PCIVGAState *d = PCI_VGA(dev);
     VGACommonState *s = &d->vga;
+    Error *local_err = NULL;
     bool qext = false;
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    vga_common_init(s, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vga_init(s, OBJECT(dev), pci_address_space(dev), pci_address_space_io(dev),
              true);
 
@@ -271,11 +277,16 @@ static void pci_secondary_vga_realize(PCIDevice *dev, Error **errp)
 {
     PCIVGAState *d = PCI_VGA(dev);
     VGACommonState *s = &d->vga;
+    Error *local_err = NULL;
     bool qext = false;
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    vga_common_init(s, OBJECT(dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
 
     /* mmio bar */
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 9d1f66af40..7fc6ab7e4f 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2168,9 +2168,10 @@ static inline uint32_t uint_clamp(uint32_t val, uint32_t vmin, uint32_t vmax)
     return val;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj)
+void vga_common_init(VGACommonState *s, Object *obj, Error **errp)
 {
     int i, j, v, b;
+    Error *local_err = NULL;
 
     for(i = 0;i < 256; i++) {
         v = 0;
@@ -2206,7 +2207,11 @@ void vga_common_init(VGACommonState *s, Object *obj)
 
     s->is_vbe_vmstate = 1;
     memory_region_init_ram_nomigrate(&s->vram, obj, "vga.vram", s->vram_size,
-                           &error_fatal);
+                                     &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vmstate_register_ram(&s->vram, s->global_vmstate ? NULL : DEVICE(obj));
     xen_register_framebuffer(&s->vram);
     s->vram_ptr = memory_region_get_ram_ptr(&s->vram);
diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 847e784ca6..3e8892df28 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
     return (v << 2) | (b << 1) | b;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj);
+void vga_common_init(VGACommonState *s, Object *obj, Error **errp);
 void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
               MemoryRegion *address_space_io, bool init_vga_ports);
 MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 5a2f7a4540..4276c49b93 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -103,12 +103,17 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VirtIOVGABase *vvga = VIRTIO_VGA_BASE(vpci_dev);
     VirtIOGPUBase *g = vvga->vgpu;
     VGACommonState *vga = &vvga->vga;
+    Error *local_err = NULL;
     uint32_t offset;
     int i;
 
     /* init vga compat bits */
     vga->vram_size_mb = 8;
-    vga_common_init(vga, OBJECT(vpci_dev));
+    vga_common_init(vga, OBJECT(vpci_dev), &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
     vga_init(vga, OBJECT(vpci_dev), pci_address_space(&vpci_dev->pci_dev),
              pci_address_space_io(&vpci_dev->pci_dev), true);
     pci_register_bar(&vpci_dev->pci_dev, 0,
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 0cc43a1f15..98c83474ad 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1254,7 +1254,7 @@ static void vmsvga_init(DeviceState *dev, struct vmsvga_state_s *s,
                            &error_fatal);
     s->fifo_ptr = memory_region_get_ram_ptr(&s->fifo_ram);
 
-    vga_common_init(&s->vga, OBJECT(dev));
+    vga_common_init(&s->vga, OBJECT(dev), &error_fatal);
     vga_init(&s->vga, OBJECT(dev), address_space, io, true);
     vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
     s->new_depth = 32;
-- 
2.27.0


