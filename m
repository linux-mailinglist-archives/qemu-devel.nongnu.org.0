Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A27620326
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:01:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAxb-0002OC-PB; Mon, 07 Nov 2022 17:51:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxY-0002KP-FD
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAxW-00041m-Fz
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pwe7JxTTsW1Hwjsyvvey5kdafbrQnw6qyFQdVmN9Y1g=;
 b=TGA1KJGhE8+/3uw9W+POyZaaR/lTnKi3maEtgN3osb2dvUuKZt2u0+wBv33dDvJP8bFtm2
 W0oUVSszQQAFI4FRSGlUmBGBvbbVHVRfcz1TESBpmvBbJ1z2CSX65blPOVlsOS+s3KFBZS
 bSUCmLxpHopSSkwnhJjM9/J3X6nXgxY=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-iKPYqBVBMKif7IPdPCTa8g-1; Mon, 07 Nov 2022 17:51:12 -0500
X-MC-Unique: iKPYqBVBMKif7IPdPCTa8g-1
Received: by mail-qv1-f69.google.com with SMTP id
 e9-20020ad45369000000b004bbb737fcf9so8526750qvv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pwe7JxTTsW1Hwjsyvvey5kdafbrQnw6qyFQdVmN9Y1g=;
 b=Co6eBqfc//PPgWnAsMM+PHC95xC2ZHGFLtB0HpQMTpw9WmZVnxFlDuLXB4KnSDQaJF
 Isn93F5NUFDxOVo+YKC5FCJuvlVMqedSudF7tuYZBCoE6vxvWykShD3yHdcM+3JgbQXH
 YrIH/kXpZL6xboUQViL8IP3TW+nkJ+Su4g3mNrs2k0m/lfSArUYAvShgYCBHqLsiey2E
 zTq5cMuP0sUxRRAYbKz/6Zhj67/xAYeUBRfL857GeFw0u6Ojm1ahLouS6c42uJ05FEvM
 GSp2WS4FhMSdmR6u3YN+H/7kPDUs6dlJP59EJp/o/oWndUVvXm2WffWfzX2WfVGYDyoW
 2VqA==
X-Gm-Message-State: ACrzQf14xUg+wIt/k24KwSxF9iaAB+9uFf6jfczrriMEmjfNphhQnVrW
 R68oiHAQYegbNHlkntKhyerLcqQL3gYRVJeRbt40S7pLpxqf8RE3AyblbQ48bTCzekhhBRbSqJ8
 P8rjzJak7bRSYZOyF540ntoV/m2ORhZG4XK+rS9rvTtYZDjM410qUKYIYjF14
X-Received: by 2002:ac8:6ec4:0:b0:3a5:23f2:c5f8 with SMTP id
 f4-20020ac86ec4000000b003a523f2c5f8mr35259804qtv.430.1667861471406; 
 Mon, 07 Nov 2022 14:51:11 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4BJORCeAGrxZxRWUosuHYu7+bJFw9wI4ZR2qWqVOuS4Z2pnGm7vWQ6PxDxmih7m2P1MG/UEA==
X-Received: by 2002:ac8:6ec4:0:b0:3a5:23f2:c5f8 with SMTP id
 f4-20020ac86ec4000000b003a523f2c5f8mr35259781qtv.430.1667861471063; 
 Mon, 07 Nov 2022 14:51:11 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 j3-20020a05620a000300b006fa2dde9db8sm7647251qki.95.2022.11.07.14.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:51:10 -0800 (PST)
Date: Mon, 7 Nov 2022 17:51:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v4 44/83] acpi: pc: vga: use AcpiDevAmlIf interface to build
 VGA device descriptors
Message-ID: <20221107224600.934080-45-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

NB:
We do not expect any functional change in any ACPI tables with this
change. It's only a refactoring.

NB2:
Some targets (or1k) do not support acpi and CONFIG_ACPI is off for them.
However, modules are reused between all architectures so CONFIG_ACPI is
on.  For those architectures, dummy stub function definitions help to
resolve symbols.  This change uses more of these and so it adds a couple
of dummy stub definitions so that symbols for those can be resolved.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
CC: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221107152744.868434-1-ani@anisinha.ca>
---
 hw/display/vga_int.h       |  2 ++
 hw/acpi/aml-build-stub.c   | 10 ++++++++++
 hw/display/acpi-vga-stub.c |  7 +++++++
 hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
 hw/display/vga-pci.c       |  4 ++++
 hw/i386/acpi-build.c       | 26 +-------------------------
 hw/display/meson.build     | 17 +++++++++++++++++
 7 files changed, 67 insertions(+), 25 deletions(-)
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
diff --git a/hw/acpi/aml-build-stub.c b/hw/acpi/aml-build-stub.c
index 8d8ad1a314..89a8fec4af 100644
--- a/hw/acpi/aml-build-stub.c
+++ b/hw/acpi/aml-build-stub.c
@@ -26,6 +26,16 @@ void aml_append(Aml *parent_ctx, Aml *child)
 {
 }
 
+Aml *aml_return(Aml *val)
+{
+    return NULL;
+}
+
+Aml *aml_method(const char *name, int arg_count, AmlSerializeFlag sflag)
+{
+    return NULL;
+}
+
 Aml *aml_resource_template(void)
 {
     return NULL;
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


