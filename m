Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86374616842
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:18:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGKj-00012g-A0; Wed, 02 Nov 2022 12:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKO-0000hR-CL
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGKM-000388-8t
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbMpeH2B2yDvNRhnRf7W+0JnhfGTF11dbplHS1ZfnuQ=;
 b=Z5hEO3A7PURXrC0E4MZmA/6GBuhN5td41td22Wpk0SAJ8Q9K3MEaCpzRlzoTcYewEZ6Cgu
 2EKB9r5CMTZHyZkUdO/5PNzZTrUCVqZvUFtu3ot9NBfmm3zlHkzXStVYKcmTaIqlMyVjnI
 HQX9Fe5unk1IQMQri5kWp/O+h/VIpGs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-178-DAi-9afaNdiGsxUJRwgmRg-1; Wed, 02 Nov 2022 12:10:52 -0400
X-MC-Unique: DAi-9afaNdiGsxUJRwgmRg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so4979220wrg.4
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbMpeH2B2yDvNRhnRf7W+0JnhfGTF11dbplHS1ZfnuQ=;
 b=PMSNLhMI5peyD3dhLi3CzJ+sbxVhHO1LdUKnKkAeznW/UZhPuHGZ3Lc/H61Qr8F9Pq
 cuidxW9valsMx/FY+KqjO6zjKbmTdc2Un7lX9gX/+czeLE5Kv+VLcSnCFZTksnbQ9CUY
 YdLJ4tdX8YVYmwDC7uEY8xq/AVw0hkq/LYD0jnGkID1g9ILJH0iJq0x1nJJBiStkh36S
 2X+zbyVExiW52oSd2J5CrXdNZPAyrKNJGKwxqJ6tf1DhiTXt23ex1eLOkoVzpWfFVwXh
 hzvhPr6XtXLxFfVnZ9Rlh+ZknjFoZlzdENDN2DXXz2zydYQBmBx3cWDkE4zt+eYVaR/q
 FGCw==
X-Gm-Message-State: ACrzQf2frpkM9tdNrJEtmjvfpi9bB4PKuDkLkAVr5vsX5AxSfQDlYcUe
 Xb6wlbc+A48feFI18rhwSS+hQVifU+fFeIrvcqyMXEE4DWCeTD0HoWbv5k2Q5CK4apUW3c8C2KX
 IacXGDmIjPmRpdNm5v/dzoByls9rUM/G/2cfPjRhWsX0z48pACWtmGH0EMwNo
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id
 e2-20020a5d5942000000b0022574254e39mr15483860wri.566.1667405450012; 
 Wed, 02 Nov 2022 09:10:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NNs780C4dWmFn0lFTp3O5p2TpTH2gROujsZJAxzGI60RqfqnNONBDXKGMN7ITkneKcuztBQ==
X-Received: by 2002:a5d:5942:0:b0:225:7425:4e39 with SMTP id
 e2-20020a5d5942000000b0022574254e39mr15483801wri.566.1667405449688; 
 Wed, 02 Nov 2022 09:10:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b003c6b874a0dfsm2831505wmo.14.2022.11.02.09.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:10:49 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:10:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 52/82] acpi: pc: vga: use AcpiDevAmlIf interface to build
 VGA device descriptors
Message-ID: <20221102160336.616599-53-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
NB: we do not expect any functional change in
any ACPI tables with this change. It's only a refactoring.

Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/display/vga_int.h       |  2 ++
 hw/display/acpi-vga-stub.c |  7 +++++++
 hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
 hw/display/vga-pci.c       |  4 ++++
 hw/i386/acpi-build.c       | 26 +-------------------------
 hw/display/meson.build     | 17 +++++++++++++++++
 6 files changed, 57 insertions(+), 25 deletions(-)
 create mode 100644 hw/display/acpi-vga-stub.c
 create mode 100644 hw/display/acpi-vga.c

diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
index 305e700014..330406ad9c 100644
--- a/hw/display/vga_int.h
+++ b/hw/display/vga_int.h
@@ -30,6 +30,7 @@
 #include "ui/console.h"
 
 #include "hw/display/bochs-vbe.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 #define ST01_V_RETRACE      0x08
 #define ST01_DISP_ENABLE    0x01
@@ -195,4 +196,5 @@ void pci_std_vga_mmio_region_init(VGACommonState *s,
                                   MemoryRegion *subs,
                                   bool qext, bool edid);
 
+void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope);
 #endif
diff --git a/hw/display/acpi-vga-stub.c b/hw/display/acpi-vga-stub.c
new file mode 100644
index 0000000000..a9b0ecf76d
--- /dev/null
+++ b/hw/display/acpi-vga-stub.c
@@ -0,0 +1,7 @@
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi_aml_interface.h"
+#include "vga_int.h"
+
+void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+}
diff --git a/hw/display/acpi-vga.c b/hw/display/acpi-vga.c
new file mode 100644
index 0000000000..f0e9ef1fcf
--- /dev/null
+++ b/hw/display/acpi-vga.c
@@ -0,0 +1,26 @@
+#include "qemu/osdep.h"
+#include "hw/acpi/acpi_aml_interface.h"
+#include "hw/pci/pci.h"
+#include "vga_int.h"
+
+void build_vga_aml(AcpiDevAmlIf *adev, Aml *scope)
+{
+    int s3d = 0;
+    Aml *method;
+
+    if (object_dynamic_cast(OBJECT(adev), "qxl-vga")) {
+        s3d = 3;
+    }
+
+    method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0)));
+    aml_append(scope, method);
+
+    method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(0)));
+    aml_append(scope, method);
+
+    method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
+    aml_append(method, aml_return(aml_int(s3d)));
+    aml_append(scope, method);
+}
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 3e5bc259f7..9a91de7ed1 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -35,6 +35,7 @@
 #include "hw/loader.h"
 #include "hw/display/edid.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi_aml_interface.h"
 
 enum vga_pci_flags {
     PCI_VGA_FLAG_ENABLE_MMIO = 1,
@@ -354,11 +355,13 @@ static void vga_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    AcpiDevAmlIfClass *adevc = ACPI_DEV_AML_IF_CLASS(klass);
 
     k->vendor_id = PCI_VENDOR_ID_QEMU;
     k->device_id = PCI_DEVICE_ID_QEMU_VGA;
     dc->vmsd = &vmstate_vga_pci;
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+    adevc->build_dev_aml = build_vga_aml;
 }
 
 static const TypeInfo vga_pci_type_info = {
@@ -369,6 +372,7 @@ static const TypeInfo vga_pci_type_info = {
     .class_init = vga_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { TYPE_ACPI_DEV_AML_IF },
         { },
     },
 };
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4f54b61904..26932b4e2c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -430,7 +430,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         bool hotpluggbale_slot = false;
         bool bridge_in_acpi = false;
         bool cold_plugged_bridge = false;
-        bool is_vga = false;
 
         if (pdev) {
             pc = PCI_DEVICE_GET_CLASS(pdev);
@@ -440,8 +439,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                 continue;
             }
 
-            is_vga = pc->class_id == PCI_CLASS_DISPLAY_VGA;
-
             /*
              * Cold plugged bridges aren't themselves hot-pluggable.
              * Hotplugged bridges *are* hot-pluggable.
@@ -489,28 +486,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(dev, aml_pci_device_dsm());
         }
 
-        if (is_vga) {
-            /* add VGA specific AML methods */
-            int s3d;
-
-            if (object_dynamic_cast(OBJECT(pdev), "qxl-vga")) {
-                s3d = 3;
-            } else {
-                s3d = 0;
-            }
-
-            method = aml_method("_S1D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(0)));
-            aml_append(dev, method);
-
-            method = aml_method("_S2D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(0)));
-            aml_append(dev, method);
-
-            method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
-            aml_append(method, aml_return(aml_int(s3d)));
-            aml_append(dev, method);
-        }
+        call_dev_aml_func(DEVICE(pdev), dev);
 
         bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
         if (bridge_in_acpi) {
diff --git a/hw/display/meson.build b/hw/display/meson.build
index adc53dd8b6..7a725ed80e 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -38,10 +38,21 @@ softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
 
 specific_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
 
+if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
+    config_all_devices.has_key('CONFIG_VGA_PCI') or
+    config_all_devices.has_key('CONFIG_VMWARE_VGA') or
+    config_all_devices.has_key('CONFIG_ATI_VGA')
+   )
+  softmmu_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+                                      if_false: files('acpi-vga-stub.c'))
+endif
+
 if config_all_devices.has_key('CONFIG_QXL')
   qxl_ss = ss.source_set()
   qxl_ss.add(when: 'CONFIG_QXL', if_true: [files('qxl.c', 'qxl-logger.c', 'qxl-render.c'),
                                            pixman, spice])
+  qxl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+                                  if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'qxl': qxl_ss}
 endif
 
@@ -52,6 +63,7 @@ softmmu_ss.add(when: 'CONFIG_ARTIST', if_true: files('artist.c'))
 
 softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d.c', 'ati_dbg.c'))
 
+
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
@@ -87,14 +99,19 @@ if config_all_devices.has_key('CONFIG_VIRTIO_VGA')
                     if_true: [files('virtio-vga.c'), pixman])
   virtio_vga_ss.add(when: 'CONFIG_VHOST_USER_VGA',
                     if_true: files('vhost-user-vga.c'))
+  virtio_vga_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+                                         if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'virtio-vga': virtio_vga_ss}
 
   virtio_vga_gl_ss = ss.source_set()
   virtio_vga_gl_ss.add(when: ['CONFIG_VIRTIO_VGA', virgl, opengl],
                        if_true: [files('virtio-vga-gl.c'), pixman])
+  virtio_vga_gl_ss.add(when: 'CONFIG_ACPI', if_true: files('acpi-vga.c'),
+                                            if_false: files('acpi-vga-stub.c'))
   hw_display_modules += {'virtio-vga-gl': virtio_vga_gl_ss}
 endif
 
 specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_lcdc.c'))
 
+softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('acpi-vga-stub.c'))
 modules += { 'hw-display': hw_display_modules }
-- 
MST


