Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F7C42E21A
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:40:25 +0200 (CEST)
Received: from localhost ([::1]:47846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6aW-0000jI-G1
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mb6Y8-00079f-EP
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:37:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mb6Y4-0001ok-7i
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:37:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634240269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4IIn5FfRmsTRZ9AeKZq11V56b+P1lmh1IkI9t8odD7c=;
 b=YZcvNcbB2AydCmg3L6cHxthZSW8luSEmAJ9crcUCbyPLAblyB7UaO2qZZTLUhFv1mvkiEv
 CMTB6eGWy3klJaahjdjYPFArgirFRRgixqUvooB5DZBmN4QdXQngKeK5Krp7nCIYye9CpD
 XRvrSo/70LfE+DrOBicx5JikCsimQyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-UoD60wjXPnOfWO1W8yHOFg-1; Thu, 14 Oct 2021 15:37:46 -0400
X-MC-Unique: UoD60wjXPnOfWO1W8yHOFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C1D18125C0;
 Thu, 14 Oct 2021 19:37:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BECE6060F;
 Thu, 14 Oct 2021 19:36:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB28418007AC; Thu, 14 Oct 2021 21:36:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] microvm: add device tree support.
Date: Thu, 14 Oct 2021 21:36:17 +0200
Message-Id: <20211014193617.2475578-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allows edk2 detect virtio-mmio devices and pcie ecam.
See comment in hw/i386/microvm-dt.c for more details.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/i386/microvm-dt.h               |   8 +
 include/hw/i386/microvm.h          |   4 +
 hw/i386/microvm-dt.c               | 341 +++++++++++++++++++++++++++++
 hw/i386/microvm.c                  |   2 +
 .gitlab-ci.d/buildtest.yml         |   1 -
 configs/targets/i386-softmmu.mak   |   1 +
 configs/targets/x86_64-softmmu.mak |   1 +
 hw/i386/meson.build                |   2 +-
 8 files changed, 358 insertions(+), 2 deletions(-)
 create mode 100644 hw/i386/microvm-dt.h
 create mode 100644 hw/i386/microvm-dt.c

diff --git a/hw/i386/microvm-dt.h b/hw/i386/microvm-dt.h
new file mode 100644
index 000000000000..77c79cbdd9fb
--- /dev/null
+++ b/hw/i386/microvm-dt.h
@@ -0,0 +1,8 @@
+#ifndef HW_I386_MICROVM_DT_H
+#define HW_I386_MICROVM_DT_H
+
+#include "hw/i386/microvm.h"
+
+void dt_setup_microvm(MicrovmMachineState *mms);
+
+#endif
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index f25f8374413f..4d9c732d4b2b 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -104,6 +104,10 @@ struct MicrovmMachineState {
     Notifier machine_done;
     Notifier powerdown_req;
     struct GPEXConfig gpex;
+
+    /* device tree */
+    void *fdt;
+    uint32_t ioapic_phandle[2];
 };
 
 #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
new file mode 100644
index 000000000000..875ba9196394
--- /dev/null
+++ b/hw/i386/microvm-dt.c
@@ -0,0 +1,341 @@
+/*
+ * microvm device tree support
+ *
+ * This generates an device tree for microvm and exports it via fw_cfg
+ * as "etc/fdt" to the firmware (edk2 specifically).
+ *
+ * The use case is to allow edk2 find the pcie ecam and the virtio
+ * devices, without adding an ACPI parser, reusing the fdt parser
+ * which is needed anyway for the arm platform.
+ *
+ * Note 1: The device tree is incomplete. CPUs and memory is missing
+ *         for example, those can be detected using other fw_cfg files.
+ *         Also pci ecam irq routing is not there, edk2 doesn't use
+ *         interrupts.
+ *
+ * Note 2: This is for firmware only. OSes should use the more
+ *         complete ACPI tables for hardware discovery.
+ *
+ * ----------------------------------------------------------------------
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "sysemu/device_tree.h"
+#include "hw/char/serial.h"
+#include "hw/i386/fw_cfg.h"
+#include "hw/rtc/mc146818rtc.h"
+#include "hw/sysbus.h"
+#include "hw/virtio/virtio-mmio.h"
+#include "hw/usb/xhci.h"
+
+#include "microvm-dt.h"
+
+static bool debug;
+
+static void dt_add_microvm_irq(MicrovmMachineState *mms,
+                               const char *nodename, uint32_t irq)
+{
+    int index = 0;
+
+    if (irq >= IO_APIC_SECONDARY_IRQBASE) {
+        irq -= IO_APIC_SECONDARY_IRQBASE;
+        index++;
+    }
+
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "interrupt-parent",
+                          mms->ioapic_phandle[index]);
+    qemu_fdt_setprop_cells(mms->fdt, nodename, "interrupts", irq, 0);
+}
+
+static void dt_add_virtio(MicrovmMachineState *mms, VirtIOMMIOProxy *mmio)
+{
+    SysBusDevice *dev = SYS_BUS_DEVICE(mmio);
+    VirtioBusState *mmio_virtio_bus = &mmio->bus;
+    BusState *mmio_bus = &mmio_virtio_bus->parent_obj;
+    char *nodename;
+
+    if (QTAILQ_EMPTY(&mmio_bus->children)) {
+        return;
+    }
+
+    hwaddr base = dev->mmio[0].addr;
+    hwaddr size = 512;
+    unsigned index = (base - VIRTIO_MMIO_BASE) / size;
+    uint32_t irq = mms->virtio_irq_base + index;
+
+    nodename = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop_string(mms->fdt, nodename, "compatible", "virtio,mmio");
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop(mms->fdt, nodename, "dma-coherent", NULL, 0);
+    dt_add_microvm_irq(mms, nodename, irq);
+    g_free(nodename);
+}
+
+static void dt_add_xhci(MicrovmMachineState *mms)
+{
+    const char compat[] = "generic-xhci";
+    uint32_t irq = MICROVM_XHCI_IRQ;
+    hwaddr base = MICROVM_XHCI_BASE;
+    hwaddr size = XHCI_LEN_REGS;
+    char *nodename;
+
+    nodename = g_strdup_printf("/usb@%" PRIx64, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop(mms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop(mms->fdt, nodename, "dma-coherent", NULL, 0);
+    dt_add_microvm_irq(mms, nodename, irq);
+    g_free(nodename);
+}
+
+static void dt_add_pcie(MicrovmMachineState *mms)
+{
+    hwaddr base = PCIE_MMIO_BASE;
+    int nr_pcie_buses;
+    char *nodename;
+
+    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop_string(mms->fdt, nodename,
+                            "compatible", "pci-host-ecam-generic");
+    qemu_fdt_setprop_string(mms->fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "#address-cells", 3);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop(mms->fdt, nodename, "dma-coherent", NULL, 0);
+
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg",
+                                 2, PCIE_ECAM_BASE, 2, PCIE_ECAM_SIZE);
+    if (mms->gpex.mmio64.size) {
+        qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "ranges",
+
+                                     1, FDT_PCI_RANGE_MMIO,
+                                     2, mms->gpex.mmio32.base,
+                                     2, mms->gpex.mmio32.base,
+                                     2, mms->gpex.mmio32.size,
+
+                                     1, FDT_PCI_RANGE_MMIO_64BIT,
+                                     2, mms->gpex.mmio64.base,
+                                     2, mms->gpex.mmio64.base,
+                                     2, mms->gpex.mmio64.size);
+    } else {
+        qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "ranges",
+
+                                     1, FDT_PCI_RANGE_MMIO,
+                                     2, mms->gpex.mmio32.base,
+                                     2, mms->gpex.mmio32.base,
+                                     2, mms->gpex.mmio32.size);
+    }
+
+    nr_pcie_buses = PCIE_ECAM_SIZE / PCIE_MMCFG_SIZE_MIN;
+    qemu_fdt_setprop_cells(mms->fdt, nodename, "bus-range", 0,
+                           nr_pcie_buses - 1);
+}
+
+static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
+{
+    hwaddr base = dev->mmio[0].addr;
+    char *nodename;
+    uint32_t ph;
+    int index;
+
+    switch (base) {
+    case IO_APIC_DEFAULT_ADDRESS:
+        index = 0;
+        break;
+    case IO_APIC_SECONDARY_ADDRESS:
+        index = 1;
+        break;
+    default:
+        fprintf(stderr, "unknown ioapic @ %" PRIx64 "\n", base);
+        return;
+    }
+
+    nodename = g_strdup_printf("/ioapic%d@%" PRIx64, index + 1, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop_string(mms->fdt, nodename,
+                            "compatible", "intel,ce4100-ioapic");
+    qemu_fdt_setprop(mms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "#interrupt-cells", 0x2);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg",
+                                 2, base, 2, 0x1000);
+
+    ph = qemu_fdt_alloc_phandle(mms->fdt);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "phandle", ph);
+    qemu_fdt_setprop_cell(mms->fdt, nodename, "linux,phandle", ph);
+    mms->ioapic_phandle[index] = ph;
+
+    g_free(nodename);
+}
+
+static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
+{
+    const char compat[] = "ns16550";
+    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", NULL);
+    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
+    hwaddr size = 8;
+    char *nodename;
+
+    nodename = g_strdup_printf("/serial@%" PRIx64, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop(mms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg", 2, base, 2, size);
+    dt_add_microvm_irq(mms, nodename, irq);
+
+    if (base == 0x3f8 /* com1 */) {
+        qemu_fdt_setprop_string(mms->fdt, "/chosen", "stdout-path", nodename);
+    }
+
+    g_free(nodename);
+}
+
+static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
+{
+    const char compat[] = "motorola,mc146818";
+    uint32_t irq = RTC_ISA_IRQ;
+    hwaddr base = RTC_ISA_BASE;
+    hwaddr size = 8;
+    char *nodename;
+
+    nodename = g_strdup_printf("/rtc@%" PRIx64, base);
+    qemu_fdt_add_subnode(mms->fdt, nodename);
+    qemu_fdt_setprop(mms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(mms->fdt, nodename, "reg", 2, base, 2, size);
+    dt_add_microvm_irq(mms, nodename, irq);
+    g_free(nodename);
+}
+
+static void dt_setup_isa_bus(MicrovmMachineState *mms, DeviceState *bridge)
+{
+    BusState *bus = qdev_get_child_bus(bridge, "isa.0");
+    BusChild *kid;
+    Object *obj;
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        DeviceState *dev = kid->child;
+
+        /* serial */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_ISA_SERIAL);
+        if (obj) {
+            dt_add_isa_serial(mms, ISA_DEVICE(obj));
+            continue;
+        }
+
+        /* rtc */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_MC146818_RTC);
+        if (obj) {
+            dt_add_isa_rtc(mms, ISA_DEVICE(obj));
+            continue;
+        }
+
+        if (debug) {
+            fprintf(stderr, "%s: unhandled: %s\n", __func__,
+                    object_get_typename(OBJECT(dev)));
+        }
+    }
+}
+
+static void dt_setup_sys_bus(MicrovmMachineState *mms)
+{
+    BusState *bus;
+    BusChild *kid;
+    Object *obj;
+
+    /* sysbus devices */
+    bus = sysbus_get_default();
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        DeviceState *dev = kid->child;
+
+        /* ioapic */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_IOAPIC);
+        if (obj) {
+            dt_add_ioapic(mms, SYS_BUS_DEVICE(obj));
+            continue;
+        }
+    }
+
+    QTAILQ_FOREACH(kid, &bus->children, sibling) {
+        DeviceState *dev = kid->child;
+
+        /* virtio */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_MMIO);
+        if (obj) {
+            dt_add_virtio(mms, VIRTIO_MMIO(obj));
+            continue;
+        }
+
+        /* xhci */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_XHCI_SYSBUS);
+        if (obj) {
+            dt_add_xhci(mms);
+            continue;
+        }
+
+        /* pcie */
+        obj = object_dynamic_cast(OBJECT(dev), TYPE_GPEX_HOST);
+        if (obj) {
+            dt_add_pcie(mms);
+            continue;
+        }
+
+        /* isa */
+        obj = object_dynamic_cast(OBJECT(dev), "isabus-bridge");
+        if (obj) {
+            dt_setup_isa_bus(mms, DEVICE(obj));
+            continue;
+        }
+
+        if (debug) {
+            obj = object_dynamic_cast(OBJECT(dev), TYPE_IOAPIC);
+            if (obj) {
+                /* ioapic already added in first pass */
+                continue;
+            }
+            fprintf(stderr, "%s: unhandled: %s\n", __func__,
+                    object_get_typename(OBJECT(dev)));
+        }
+    }
+}
+
+void dt_setup_microvm(MicrovmMachineState *mms)
+{
+    X86MachineState *x86ms = X86_MACHINE(mms);
+    int size = 0;
+
+    mms->fdt = create_device_tree(&size);
+
+    /* root node */
+    qemu_fdt_setprop_string(mms->fdt, "/", "compatible", "linux,microvm");
+    qemu_fdt_setprop_cell(mms->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(mms->fdt, "/", "#size-cells", 0x2);
+
+    qemu_fdt_add_subnode(mms->fdt, "/chosen");
+    dt_setup_sys_bus(mms);
+
+    /* add to fw_cfg */
+    fprintf(stderr, "%s: add etc/fdt to fw_cfg\n", __func__);
+    fw_cfg_add_file(x86ms->fw_cfg, "etc/fdt", mms->fdt, size);
+
+    if (debug) {
+        fprintf(stderr, "%s: writing microvm.fdt\n", __func__);
+        g_file_set_contents("microvm.fdt", mms->fdt, size, NULL);
+        int ret = system("dtc -I dtb -O dts microvm.fdt");
+        if (ret != 0) {
+            fprintf(stderr, "%s: oops, dtc not installed?\n", __func__);
+        }
+    }
+}
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index f257ec5a0bc1..8d6ebea3414d 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -28,6 +28,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "acpi-microvm.h"
+#include "microvm-dt.h"
 
 #include "hw/loader.h"
 #include "hw/irq.h"
@@ -626,6 +627,7 @@ static void microvm_machine_done(Notifier *notifier, void *data)
                                             machine_done);
 
     acpi_setup_microvm(mms);
+    dt_setup_microvm(mms);
 }
 
 static void microvm_powerdown_req(Notifier *notifier, void *data)
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5c378e35f91f..6c1301e91287 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -575,7 +575,6 @@ build-without-default-features:
     CONFIGURE_ARGS:
       --without-default-features
       --disable-capstone
-      --disable-fdt
       --disable-pie
       --disable-qom-cast-debug
       --disable-slirp
diff --git a/configs/targets/i386-softmmu.mak b/configs/targets/i386-softmmu.mak
index 5babf71895db..6b3c99fc86c5 100644
--- a/configs/targets/i386-softmmu.mak
+++ b/configs/targets/i386-softmmu.mak
@@ -1,3 +1,4 @@
 TARGET_ARCH=i386
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
 TARGET_XML_FILES= gdb-xml/i386-32bit.xml
diff --git a/configs/targets/x86_64-softmmu.mak b/configs/targets/x86_64-softmmu.mak
index 75e42bc84047..197817c94346 100644
--- a/configs/targets/x86_64-softmmu.mak
+++ b/configs/targets/x86_64-softmmu.mak
@@ -1,4 +1,5 @@
 TARGET_ARCH=x86_64
 TARGET_BASE_ARCH=i386
 TARGET_SUPPORTS_MTTCG=y
+TARGET_NEED_FDT=y
 TARGET_XML_FILES= gdb-xml/i386-64bit.xml
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index c502965219d6..213e2e82b3d7 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -11,7 +11,7 @@ i386_ss.add(when: 'CONFIG_X86_IOMMU', if_true: files('x86-iommu.c'),
                                       if_false: files('x86-iommu-stub.c'))
 i386_ss.add(when: 'CONFIG_AMD_IOMMU', if_true: files('amd_iommu.c'))
 i386_ss.add(when: 'CONFIG_I440FX', if_true: files('pc_piix.c'))
-i386_ss.add(when: 'CONFIG_MICROVM', if_true: files('microvm.c', 'acpi-microvm.c'))
+i386_ss.add(when: 'CONFIG_MICROVM', if_true: files('microvm.c', 'acpi-microvm.c', 'microvm-dt.c'))
 i386_ss.add(when: 'CONFIG_Q35', if_true: files('pc_q35.c'))
 i386_ss.add(when: 'CONFIG_VMMOUSE', if_true: files('vmmouse.c'))
 i386_ss.add(when: 'CONFIG_VMPORT', if_true: files('vmport.c'))
-- 
2.31.1


