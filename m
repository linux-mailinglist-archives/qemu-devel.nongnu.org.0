Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D779D600C7B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 12:32:43 +0200 (CEST)
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okNQH-00068W-SM
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 06:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNG2-0005ZG-GT
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1okNFv-0002jv-If
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 06:22:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666002119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CUmuBayH2IwXrZOqiOOw0ZM/zudD5I79Wh4vG9uuN/c=;
 b=expW8EgA83yGBPtCcGlqQNHuxABZhQJqAstgdat3Co9biWY+r3eSpXSSlcfdedpIclvqo6
 WfVIxAnHK8y4ngVEKULw54O/7L6iBHRhspdhvvmWF+Qh9flxgOQ41Mg1HKNPxJqFXMTt5w
 4hlyFqxQVPycLR//lH7ImT3XK+TP9gk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-8-8ZxhEONtSur4DclXvO0w-1; Mon, 17 Oct 2022 06:21:57 -0400
X-MC-Unique: 8-8ZxhEONtSur4DclXvO0w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228F03C30510;
 Mon, 17 Oct 2022 10:21:52 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1E36492B04;
 Mon, 17 Oct 2022 10:21:49 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	ani@anisinha.ca
Subject: [PATCH 01/11] acpi: pc: vga: use AcpiDevAmlIf interface to build VGA
 device descriptors
Date: Mon, 17 Oct 2022 12:21:36 +0200
Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
In-Reply-To: <20221017102146.2254096-1-imammedo@redhat.com>
References: <20221017102146.2254096-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/display/vga_int.h       |  2 ++
 hw/display/acpi-vga-stub.c |  7 +++++++
 hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
 hw/display/meson.build     | 17 +++++++++++++++++
 hw/display/vga-pci.c       |  4 ++++
 hw/i386/acpi-build.c       | 26 +-------------------------
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
-- 
2.31.1


