Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 518E46EAF80
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:50:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptyF-00086L-08; Fri, 21 Apr 2023 12:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppty7-0007qm-32; Fri, 21 Apr 2023 12:50:43 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppty3-0004RM-8x; Fri, 21 Apr 2023 12:50:42 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q30lF60LHz67MCh;
 Sat, 22 Apr 2023 00:45:45 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 17:50:33 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
CC: <qemu-arm@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <linuxarm@huawei.com>, 
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC] hw/arm/virt: Provide DT binding generation for PCI eXpander
 Bridges
Date: Fri, 21 Apr 2023 17:50:37 +0100
Message-ID: <20230421165037.2506-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch and the problem it is trying to resolve will form part of a talk
I will be giving next week at Linaro Connect. https://sched.co/1K85p

So in the spirit of giving people almost no warning... Plus being able to
say the discussion has kicked off here is the simplest solution I could
come up with. If we can agree on an approach to the sizing of memory
windows question by Thursday even better (I'll update the slides!) ;)

This is a precursor for CXL on arm-virt (for which DT support was
requested). CXL QEMU emulation uses pxb-cxl which inherits from the
slightly simpler pxb-pcie. ACPI support for these additional host bridges
has been available for some time but relies an interesting dance with
EDK2:
* During initial board creation the PXB buses are largely ignored
  and ACPI tables + DT passed to EDK2 only expose the root bus on
  which the section of the PXB instance that exists as a normal PCI EP
  may be discovered.
* EDK2 then carries out full PCI bus enumeration, including the buses
  below the PXB host bridges.
* Finally EDK2 calls back into QEMU to rebuild the tables via
  virt_acpi_build_update(), at which point the correct DSDT for the
  PXB host bridges is generated and an adjust DSDT section is generated
  for the primary host bridge (holes are bunched in the _CRS).

For device tree bindings there is no such dance with the firmware and as
such we need QEMU to directly present device tree entries for the primary
PCIe bus and the PXB instances.

This cannot be fully done either at initial PCIe instantiation, (PXB
instances not yet instantiated) or at in virt_machine_done() as it is
for ACPI (virtio-mem hot plug routines rely on presence of primary PCIe bus).
Thus the proposed solution is to set things up initially without being
careful and later update it with additional checks that we don't get
overlapping bus numbers.

It 'might' be possible to use hotplug handlers to update the DT as we
go along, but that would be rather challenging as each additional PXB
introduction would sometimes require an update of the dt for all other
instances.

Note: The linux,pci-domain dt element is more restrictive than the
equivalent in ACPI, so for now just put each PXB in it's own domain. I'll
look to address relaxing that on the kernel side, but then this code won't
initially work with older kernels - so this lack of alignment with ACPI
systems may have to persist (you end up with a single segment for ACPI
systems, and multiple for DT).

Another question is how to allocate the resources. A PXB instance uses
a section of the ECAM space (which is fine as that is defined by bus
numbers) and also part of each of the PCI windows. When EDK2 is involved,
the allocation of the windows is done after enumeration of connected
PCI devices / switches etc with heuristics adding extra space for
hotplug.  Thus the windows configured for the bridges can be easily
established and written into the ACPI _CRS entries.

I've considered two options:
1) (More or less) enumerate the full PCI topology in QEMU, just don't
   actually write the registers for routing. Apply similar heuristics
   (note that EDK2 and the kernel may have different ones and they
   have changed over time) to establish how much memory is needed
   in each window. This is a complex solution that may still provide
   allocations that aren't big enough for the kernel to then
   enumerate the PCI topology using it's algorithms.
2) Use the one thing we definitely control for PXB instances, the base
   bus number.  Based on how many buses are available to each PXB
   instance allocate a proportion of the available memory windows. Again,
   it's more than possible that this won't leave enough room to provide
   all of the necessary space to accommodate BARs, but is fairly simple to
   implement and fairly simple to understand when the allocation doesn't
   work. This option is what the current code does.

Note that either way any regressions should be limited to systems using
DT with PXB instances which would be odd given they don't currently work.

RFC being posted to get feedback on the general approach we should take.
One option would be to ignore pxb-pcie and only deal with pxb-cxl on
the basis that removes risk of regressions because we don't support
CXL on arm-virt yet.  However, code will end up much the same so we
can discuss this without the added fun that CXL will bring.

Other more minor nasties:
* EDK2 breaks if we pass it a DT that includes the PXB instances.
* Need to look closer at the interrupt mapping - or potentially make this
  MSI/MSIX only. Equivalent is broken on x86 / q35 :)

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/arm/virt.c        | 214 +++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pci.c         |  21 +++++
 include/hw/pci/pci.h |   1 +
 3 files changed, 236 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..4648437bba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -55,6 +55,8 @@
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "hw/pci/pci_bridge.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/core/sysbus-fdt.h"
@@ -1648,6 +1650,210 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 }
 
+static void virt_add_pxb_dt(VirtMachineState *vms, PCIBus *pxb_bus,
+                            int max_bus_num, hwaddr mmio_per_bus,
+                            hwaddr mmio_high_per_bus,
+                            int pci_domain,
+                            Error **errp)
+{
+    void *fdt = MACHINE(vms)->fdt;
+    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    char *nodename_pxb;
+    uint8_t bus_num = pci_bus_num(pxb_bus);
+    hwaddr base_mmio_pxb = vms->memmap[VIRT_PCIE_MMIO].base +
+        mmio_per_bus * bus_num;
+    hwaddr size_mmio_pxb;
+    hwaddr base_mmio_high_pxb = vms->memmap[VIRT_HIGH_PCIE_MMIO].base +
+        mmio_high_per_bus * bus_num;
+    hwaddr size_mmio_high_pxb;
+    hwaddr base_ecam_pxb, size_ecam_pxb;
+    int buses;
+
+    buses = pci_bus_count_buses(pxb_bus);
+    if (bus_num + buses >= max_bus_num) {
+        error_setg(errp,
+                   "Insufficient bus numbers (req %d > avail: %d) available for PXB topology",
+                   buses, max_bus_num - bus_num - 1);
+        return;
+    }
+
+    base_ecam_pxb = vms->memmap[ecam_id].base;
+    base_ecam_pxb += bus_num * PCIE_MMCFG_SIZE_MIN;
+    size_ecam_pxb = PCIE_MMCFG_SIZE_MIN * (max_bus_num - bus_num);
+    size_mmio_pxb = mmio_per_bus * (max_bus_num - bus_num);
+    size_mmio_high_pxb = mmio_high_per_bus * (max_bus_num - bus_num);
+    nodename_pxb = g_strdup_printf("/pcie@%" PRIx64, base_mmio_pxb);
+    qemu_fdt_add_subnode(fdt, nodename_pxb);
+    qemu_fdt_setprop_cell(fdt, nodename_pxb, "linux,pci-domain", pci_domain);
+    qemu_fdt_setprop_string(fdt, nodename_pxb, "device_type", "pci");
+    qemu_fdt_setprop_cell(fdt, nodename_pxb, "#address-cells", 3);
+    qemu_fdt_setprop_cell(fdt, nodename_pxb, "#size-cells", 2);
+    qemu_fdt_setprop_string(fdt, nodename_pxb,
+                            "compatible", "pci-host-ecam-generic");
+    /* I'm not sure what this should be. */
+    if (vms->msi_phandle) {
+        qemu_fdt_setprop_cells(fdt, nodename_pxb, "msi-map",
+                               0, vms->msi_phandle, 0, 0x10000);
+    }
+    qemu_fdt_setprop_cells(fdt, nodename_pxb, "bus-range",
+                           bus_num, max_bus_num - 1);
+    qemu_fdt_setprop_sized_cells(fdt, nodename_pxb, "reg", 2, base_ecam_pxb,
+                                 2, size_ecam_pxb);
+
+    if (vms->highmem_mmio) {
+        qemu_fdt_setprop_sized_cells(fdt, nodename_pxb, "ranges",
+                                     1, FDT_PCI_RANGE_IOPORT, 2, 0,
+                                     /* No PIO space for PXB */
+                                     2, 0, 2, 0,
+                                     1, FDT_PCI_RANGE_MMIO,
+                                     2, base_mmio_pxb,
+                                     2, base_mmio_pxb,
+                                     2, size_mmio_pxb,
+                                     1, FDT_PCI_RANGE_MMIO_64BIT,
+                                     2, base_mmio_high_pxb,
+                                     2, base_mmio_high_pxb,
+                                     2, size_mmio_high_pxb);
+    } else {
+        qemu_fdt_setprop_sized_cells(fdt, nodename_pxb, "ranges",
+                                     1, FDT_PCI_RANGE_IOPORT, 2, 0,
+                                     2, 0, 2, 0,
+                                     1, FDT_PCI_RANGE_MMIO,
+                                     2, base_mmio_pxb,
+                                     2, base_mmio_pxb,
+                                     2, size_mmio_pxb);
+    }
+}
+
+static void virt_update_pci_dt(VirtMachineState *vms, Error **errp)
+{
+    void *fdt = MACHINE(vms)->fdt;
+    char *nodename = vms->pciehb_nodename;
+    hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
+    hwaddr base_mmio_high = vms->memmap[VIRT_HIGH_PCIE_MMIO].base;
+    hwaddr size_mmio, size_mmio_high;
+    hwaddr base_pio = vms->memmap[VIRT_PCIE_PIO].base;
+    hwaddr size_pio = vms->memmap[VIRT_PCIE_PIO].size;
+    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+    hwaddr base_ecam = vms->memmap[ecam_id].base;
+    int total_bus_nr = vms->memmap[ecam_id].size / PCIE_MMCFG_SIZE_MIN;
+    hwaddr mmio_per_bus, mmio_high_per_bus, size_ecam;
+    int pci_domain = 1; /* Main bus is 0 */
+    int buses, max_bus_nr;
+    PCIBus *bus;
+
+    /*
+     * EDK2 ACPI flow for PXB instances breaks if we modify the DT to incorporate
+     * them. So for now only enable DT for PXBs if acpi=off
+     */
+    if (virt_is_acpi_enabled(vms)) {
+        return;
+    }
+
+    /*
+     * Only support PCI Expander Bridges if highmem_ecam available.
+     * Hard to squeeze them into the smaller ecam.
+     */
+    if (!vms->highmem_ecam) {
+        return;
+    }
+
+    /* First update DT for the main PCI bus */
+    bus = vms->bus;
+    max_bus_nr = total_bus_nr;
+    /* Find the max bus nr as smallest of the PXB buses */
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        uint8_t bus_num;
+
+        if (!pci_bus_is_root(bus)) {
+            continue;
+        }
+        bus_num = pci_bus_num(bus);
+        if (bus_num < max_bus_nr) {
+            max_bus_nr = bus_num;
+        }
+    }
+
+    buses = pci_bus_count_buses(vms->bus);
+    if (buses >= max_bus_nr) {
+        error_setg(errp,
+                   "Insufficient bus numbers (req %d > avail: %d) available for primary PCIe toplogy",
+                   buses, max_bus_nr - 1);
+        return;
+    }
+
+    /*
+     * For other resources options are:
+     * 1) Divide them up based on bus number ranges.
+     * 2) Discover what is needed by doing part of bus enumeration.
+     *    This is complex, and we may not want that complexity in QEMU.
+     */
+
+    size_ecam = max_bus_nr * PCIE_MMCFG_SIZE_MIN;
+    if (size_ecam > vms->memmap[ecam_id].size) {
+        size_ecam = vms->memmap[ecam_id].size;
+    }
+
+    mmio_per_bus = vms->memmap[VIRT_PCIE_MMIO].size / total_bus_nr;
+    size_mmio = mmio_per_bus * max_bus_nr;
+    mmio_high_per_bus = vms->memmap[VIRT_HIGH_PCIE_MMIO].size / total_bus_nr;
+    size_mmio_high = mmio_high_per_bus * max_bus_nr;
+    qemu_fdt_setprop_cells(fdt, nodename, "bus-range", 0, max_bus_nr - 1);
+
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", 2, base_ecam,
+                                 2, size_ecam);
+
+    /*
+     * Leave all of PIO space for the main GPEX  - avoids issues with
+     * regions that are too small to map in OS.
+     */
+    if (vms->highmem_mmio) {
+        qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
+                                     1, FDT_PCI_RANGE_IOPORT, 2, 0,
+                                     2, base_pio, 2, size_pio,
+                                     1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
+                                     2, base_mmio, 2, size_mmio,
+                                     1, FDT_PCI_RANGE_MMIO_64BIT,
+                                     2, base_mmio_high,
+                                     2, base_mmio_high, 2, size_mmio_high);
+    } else {
+        qemu_fdt_setprop_sized_cells(fdt, nodename, "ranges",
+                                     1, FDT_PCI_RANGE_IOPORT, 2, 0,
+                                     2, base_pio, 2, size_pio,
+                                     1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
+                                     2, base_mmio, 2, size_mmio);
+    }
+
+    /* Now add the PCI Expander Bridges (PXB) */
+    bus = vms->bus;
+    QLIST_FOREACH(bus, &bus->child, sibling) {
+        uint16_t max_bus_num = 0x100;
+        PCIBus *bus_start = vms->bus;
+        int bus_num = pci_bus_num(bus);
+
+        if (!pci_bus_is_root(bus)) {
+            continue;
+        }
+
+        /* Find the minimum PXB bus number greater than this one */
+        QLIST_FOREACH(bus_start, &bus_start->child, sibling) {
+            uint8_t this_bus_num;
+
+            if (!pci_bus_is_root(bus_start)) {
+                continue;
+            }
+
+            this_bus_num = pci_bus_num(bus_start);
+            if (this_bus_num > bus_num &&
+                this_bus_num < max_bus_num) {
+                max_bus_num = this_bus_num;
+            }
+        }
+
+        virt_add_pxb_dt(vms, bus, max_bus_num, mmio_per_bus, mmio_high_per_bus,
+                        pci_domain++, errp);
+    }
+}
+
 static
 void virt_machine_done(Notifier *notifier, void *data)
 {
@@ -1658,6 +1864,14 @@ void virt_machine_done(Notifier *notifier, void *data)
     struct arm_boot_info *info = &vms->bootinfo;
     AddressSpace *as = arm_boot_address_space(cpu, info);
 
+    /*
+     * If PCI Expander Bridges pxb-pcie, have been added, the adjustments to
+     * the main PCIe DT entries and creation of those for the PXB host bridge
+     * entires, may only be created after all PCI devices are present as only
+     * at that time can resource requirements (bus numbers etc) be known.
+     */
+    virt_update_pci_dt(vms, &error_fatal);
+
     /*
      * If the user provided a dtb, we assume the dynamic sysbus nodes
      * already are integrated there. This corresponds to a use case where
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..47fd581fe4 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -552,6 +552,27 @@ void pci_root_bus_cleanup(PCIBus *bus)
     qbus_unrealize(BUS(bus));
 }
 
+int pci_bus_count_buses(PCIBus *bus)
+{
+    int buses = 0;
+    int devfn;
+
+    for (devfn = 0; devfn < 256; devfn++) {
+        PCIDevice *d;
+
+        if (!bus->devices[devfn]) {
+            continue;
+        }
+        d = bus->devices[devfn];
+        if (!object_dynamic_cast(OBJECT(d), TYPE_PCI_BRIDGE)) {
+            continue;
+        }
+        buses += pci_bus_count_buses(&PCI_BRIDGE(d)->sec_bus);
+        buses++;
+    }
+    return buses;
+}
+
 void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
                   void *irq_opaque, int nirq)
 {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..565a968c14 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -282,6 +282,7 @@ PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *address_space_io,
                          uint8_t devfn_min, const char *typename);
 void pci_root_bus_cleanup(PCIBus *bus);
+int pci_bus_count_buses(PCIBus *bus);
 void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
                   void *irq_opaque, int nirq);
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
-- 
2.37.2


