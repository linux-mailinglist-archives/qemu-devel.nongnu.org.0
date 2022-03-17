Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965F94DC14E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 09:32:44 +0100 (CET)
Received: from localhost ([::1]:35682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUlYp-0001GQ-Kc
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 04:32:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUlWp-0007aK-IU
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:30:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUlWn-0006ix-Kj
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 04:30:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647505837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcJV3a96S7DWx5OGmfO1VIJtmj2V3BKsSXHkVYuRwn8=;
 b=NCMINtILULY2dY1Ltw1HBhNTENwm1HyUNPdafIHJ/jcuRqP2opUFzqiw8lzHYfoY6UKXE8
 o/pZ7CowIwaAqBKM+qbpWIezNgQYAOaPPzGjdsGPjS6EL1/naguOE8eOMYJpOFM7nLj7Mv
 NrdnzduJUN4miD6IQ/50AMGYpmj5BJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-GZHv6X-bPTGwZsKxIV1nPw-1; Thu, 17 Mar 2022 04:30:34 -0400
X-MC-Unique: GZHv6X-bPTGwZsKxIV1nPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B151C299E756;
 Thu, 17 Mar 2022 08:30:33 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C1A2EFA3;
 Thu, 17 Mar 2022 08:30:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/display: Allow vga_common_init() to return errors
Date: Thu, 17 Mar 2022 09:30:25 +0100
Message-Id: <20220317083027.16688-3-thuth@redhat.com>
In-Reply-To: <20220317083027.16688-1-thuth@redhat.com>
References: <20220317083027.16688-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vga_common_init() function currently cannot report errors to its
caller. But in the following patch, we'd need this possibility, so
let's change it to take an "Error **" as parameter for this.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/vga_int.h        |  2 +-
 hw/display/ati.c            |  4 +++-
 hw/display/cirrus_vga.c     |  4 +++-
 hw/display/cirrus_vga_isa.c |  4 +++-
 hw/display/qxl.c            |  6 +++++-
 hw/display/vga-isa.c        |  5 ++++-
 hw/display/vga-mmio.c       |  5 ++++-
 hw/display/vga-pci.c        |  8 ++++++--
 hw/display/vga.c            | 11 +++++++++--
 hw/display/virtio-vga.c     |  4 +++-
 hw/display/vmware_vga.c     |  2 +-
 11 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 847e784ca6..305e700014 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -156,7 +156,7 @@ static inline int c6_to_8(int v)
     return (v << 2) | (b << 1) | b;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj);
+bool vga_common_init(VGACommonState *s, Object *obj, Error **errp);
 void vga_init(VGACommonState *s, Object *obj, MemoryRegion *address_space,
               MemoryRegion *address_space_io, bool init_vga_ports);
 MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 31f22754dc..6e38e00502 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -955,7 +955,9 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
     }
 
     /* init vga bits */
-    vga_common_init(vga, OBJECT(s));
+    if (!vga_common_init(vga, OBJECT(s), errp)) {
+        return;
+    }
     vga_init(vga, OBJECT(s), pci_address_space(dev),
              pci_address_space_io(dev), true);
     vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 7da1be3e12..3bb6a58698 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -2956,7 +2956,9 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
         return;
     }
     /* setup VGA */
-    vga_common_init(&s->vga, OBJECT(dev));
+    if (!vga_common_init(&s->vga, OBJECT(dev), errp)) {
+        return;
+    }
     cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
                        pci_address_space_io(dev));
     s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 4f6fb1af3b..96144bd690 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -56,7 +56,9 @@ static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
         return;
     }
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
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
index 90851e730b..46abbc5653 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -62,7 +62,10 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
     s->global_vmstate = true;
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
+
     s->legacy_address_space = isa_address_space(isadev);
     vga_io_memory = vga_init_io(s, OBJECT(dev), &vga_ports, &vbe_ports);
     isa_register_portio_list(isadev, &d->portio_vga,
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 4969368081..75dfcedea5 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -102,7 +102,10 @@ static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
 
     s->vga.bank_offset = 0;
     s->vga.global_vmstate = true;
-    vga_common_init(&s->vga, OBJECT(dev));
+    if (!vga_common_init(&s->vga, OBJECT(dev), errp)) {
+        return;
+    }
+
     sysbus_init_mmio(sbd, &s->vga.vram);
     s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
 }
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 62fb5c38c1..3e5bc259f7 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -239,7 +239,9 @@ static void pci_std_vga_realize(PCIDevice *dev, Error **errp)
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     vga_init(s, OBJECT(dev), pci_address_space(dev), pci_address_space_io(dev),
              true);
 
@@ -275,7 +277,9 @@ static void pci_secondary_vga_realize(PCIDevice *dev, Error **errp)
     bool edid = false;
 
     /* vga + console init */
-    vga_common_init(s, OBJECT(dev));
+    if (!vga_common_init(s, OBJECT(dev), errp)) {
+        return;
+    }
     s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
 
     /* mmio bar */
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 9d1f66af40..ae96023596 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2168,9 +2168,10 @@ static inline uint32_t uint_clamp(uint32_t val, uint32_t vmin, uint32_t vmax)
     return val;
 }
 
-void vga_common_init(VGACommonState *s, Object *obj)
+bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
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
+        return false;
+    }
     vmstate_register_ram(&s->vram, s->global_vmstate ? NULL : DEVICE(obj));
     xen_register_framebuffer(&s->vram);
     s->vram_ptr = memory_region_get_ram_ptr(&s->vram);
@@ -2237,6 +2242,8 @@ void vga_common_init(VGACommonState *s, Object *obj)
     s->default_endian_fb = false;
 #endif
     vga_dirty_log_start(s);
+
+    return true;
 }
 
 static const MemoryRegionPortio vga_portio_list[] = {
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 5a2f7a4540..7b55c8d0e7 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -108,7 +108,9 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 
     /* init vga compat bits */
     vga->vram_size_mb = 8;
-    vga_common_init(vga, OBJECT(vpci_dev));
+    if (!vga_common_init(vga, OBJECT(vpci_dev), errp)) {
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


