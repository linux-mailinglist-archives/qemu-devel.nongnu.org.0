Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E77861371C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:56:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIT-0002dr-8o; Mon, 31 Oct 2022 08:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIC-0000rZ-AV
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUI6-00036L-FM
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vbMpeH2B2yDvNRhnRf7W+0JnhfGTF11dbplHS1ZfnuQ=;
 b=Twn0iCXcZIZWWho323wchb8g2aoqvyCBobO4KNz5D6Ww7Z9gHCiqRcDVYoTY/Yc8oq2YE4
 VL3KmS2TZmJx00fyuo0V5tcQc6kLSdIRRpPee13A2x4ChLN8kWNYjwcagC4MXy6938325T
 zunh1ZwnN6EgODTYEa84mJ1s977MMUU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-BPxRAukdPfCsB7xsBSdcyA-1; Mon, 31 Oct 2022 08:53:20 -0400
X-MC-Unique: BPxRAukdPfCsB7xsBSdcyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b003c56da8e894so8324369wma.0
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vbMpeH2B2yDvNRhnRf7W+0JnhfGTF11dbplHS1ZfnuQ=;
 b=7FDmhqVy7oBnyi//OlJhHyb70oigUuYd8IhFpQTqvwMbButaU5vj4rmPKIbet557rN
 6qRgDxLl79R4Pte6idlIQGH+gsKiHSPTOn+n8qU2RS3yY9Dit2gd2ussmd/WsAzU5Nn3
 xe5neHFjtxRh3+orrTtkzrIOk1r3ZVP+tCGmdUQzmszVUnhxmNAoiGXVZ7H5VfMewmDG
 tuzyW2A+8FJ+J0X3FlyU/3n5PnbdfcoGs37xDrr5x9SW6nNzckC1P0Ayvq6NJxfgK5FD
 qXQcFR+lvVIz8DQdHyyotknWjIulpWQx4G5u70Smlbx4f4BKSw6G71mhAgj3GJO4yarG
 envQ==
X-Gm-Message-State: ACrzQf1YRkn9L8IGr4ubGs3TjGilUUqOTqsGRTkTBpd2Qj2HrrDgdh+b
 sb7wM1Iml3sALFRq0Yzhtn867ZE/pXsOpiekdELjwxyjES0tIO/zYMOpffwiHpUp1xzHOAZ1o9R
 blXC5H2N/20QZlzAlQHTtzQ6JufLtwSfrV/Oz6mPXd2mZkoLp94sGgI2J8Yno
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr8150691wrm.396.1667220798667; 
 Mon, 31 Oct 2022 05:53:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Kb4fZX7FpjECW5sJFLhOKofdk4Yl1jGlibXj1FFrOzQ8peREPJQfx3ZrL+DAbXnp7X9SvBg==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr8150668wrm.396.1667220798290; 
 Mon, 31 Oct 2022 05:53:18 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 h5-20020a05600c350500b003b4a68645e9sm7537624wmq.34.2022.10.31.05.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:17 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 54/86] acpi: pc: vga: use AcpiDevAmlIf interface to build VGA
 device descriptors
Message-ID: <20221031124928.128475-55-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


