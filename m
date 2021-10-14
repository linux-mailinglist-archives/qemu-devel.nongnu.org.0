Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8342E2A3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 22:18:49 +0200 (CEST)
Received: from localhost ([::1]:51068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb7Bg-0007AQ-I4
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 16:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75V-0006Vo-Mw; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:12168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mb75R-0002Qc-Rx; Thu, 14 Oct 2021 16:12:25 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8A1EA756066;
 Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4E608756060; Thu, 14 Oct 2021 22:12:18 +0200 (CEST)
Message-Id: <b6f768023603dc2c4d130720bcecdbea459b7668.1634241019.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1634241019.git.balaton@eik.bme.hu>
References: <cover.1634241019.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 4/6] ppc/pegasos2: Access MV64361 registers via their memory
 region
Date: Thu, 14 Oct 2021 21:50:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org,
    qemu-ppc@nongnu.org
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of relying on the mapped address of the MV64361 registers
access them via their memory region. This is not a problem at reset
time when these registers are mapped at the default address but the
guest could change this later and then the RTAS calls accessing PCI
config registers could fail. None of the guests actually do this so
this only avoids a theoretical problem not seen in practice.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/pci-host/mv64361.c |   1 +
 hw/ppc/pegasos2.c     | 117 ++++++++++++++++++++----------------------
 2 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index 92b0f5d047..00b3ff7d90 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -869,6 +869,7 @@ static void mv64361_realize(DeviceState *dev, Error **errp)
     s->base_addr_enable = 0x1fffff;
     memory_region_init_io(&s->regs, OBJECT(s), &mv64361_ops, s,
                           TYPE_MV64361, 0x10000);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->regs);
     for (i = 0; i < 2; i++) {
         g_autofree char *name = g_strdup_printf("pcihost%d", i);
         object_initialize_child(OBJECT(dev), name, &s->pci[i],
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index a9e3625f56..a861bf16b8 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -205,56 +205,49 @@ static void pegasos2_init(MachineState *machine)
     }
 }
 
-static uint32_t pegasos2_pci_config_read(AddressSpace *as, int bus,
+static uint32_t pegasos2_mv_reg_read(Pegasos2MachineState *pm,
+                                     uint32_t addr, uint32_t len)
+{
+    MemoryRegion *r = sysbus_mmio_get_region(SYS_BUS_DEVICE(pm->mv), 0);
+    uint64_t val = 0xffffffffULL;
+    memory_region_dispatch_read(r, addr, &val, size_memop(len) | MO_LE,
+                                MEMTXATTRS_UNSPECIFIED);
+    return val;
+}
+
+static void pegasos2_mv_reg_write(Pegasos2MachineState *pm, uint32_t addr,
+                                  uint32_t len, uint32_t val)
+{
+    MemoryRegion *r = sysbus_mmio_get_region(SYS_BUS_DEVICE(pm->mv), 0);
+    memory_region_dispatch_write(r, addr, val, size_memop(len) | MO_LE,
+                                 MEMTXATTRS_UNSPECIFIED);
+}
+
+static uint32_t pegasos2_pci_config_read(Pegasos2MachineState *pm, int bus,
                                          uint32_t addr, uint32_t len)
 {
-    hwaddr pcicfg = (bus ? 0xf1000c78 : 0xf1000cf8);
-    uint32_t val = 0xffffffff;
-
-    stl_le_phys(as, pcicfg, addr | BIT(31));
-    switch (len) {
-    case 4:
-        val = ldl_le_phys(as, pcicfg + 4);
-        break;
-    case 2:
-        val = lduw_le_phys(as, pcicfg + 4);
-        break;
-    case 1:
-        val = ldub_phys(as, pcicfg + 4);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
-        break;
+    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+    uint64_t val = 0xffffffffULL;
+
+    if (len <= 4) {
+        pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
+        val = pegasos2_mv_reg_read(pm, pcicfg + 4, len);
     }
     return val;
 }
 
-static void pegasos2_pci_config_write(AddressSpace *as, int bus, uint32_t addr,
-                                      uint32_t len, uint32_t val)
+static void pegasos2_pci_config_write(Pegasos2MachineState *pm, int bus,
+                                      uint32_t addr, uint32_t len, uint32_t val)
 {
-    hwaddr pcicfg = (bus ? 0xf1000c78 : 0xf1000cf8);
-
-    stl_le_phys(as, pcicfg, addr | BIT(31));
-    switch (len) {
-    case 4:
-        stl_le_phys(as, pcicfg + 4, val);
-        break;
-    case 2:
-        stw_le_phys(as, pcicfg + 4, val);
-        break;
-    case 1:
-        stb_phys(as, pcicfg + 4, val);
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
-        break;
-    }
+    hwaddr pcicfg = bus ? 0xc78 : 0xcf8;
+
+    pegasos2_mv_reg_write(pm, pcicfg, 4, addr | BIT(31));
+    pegasos2_mv_reg_write(pm, pcicfg + 4, len, val);
 }
 
 static void pegasos2_machine_reset(MachineState *machine)
 {
     Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
-    AddressSpace *as = CPU(pm->cpu)->as;
     void *fdt;
     uint64_t d[2];
     int sz;
@@ -265,51 +258,51 @@ static void pegasos2_machine_reset(MachineState *machine)
     }
 
     /* Otherwise, set up devices that board firmware would normally do */
-    stl_le_phys(as, 0xf1000000, 0x28020ff);
-    stl_le_phys(as, 0xf1000278, 0xa31fc);
-    stl_le_phys(as, 0xf100f300, 0x11ff0400);
-    stl_le_phys(as, 0xf100f10c, 0x80000000);
-    stl_le_phys(as, 0xf100001c, 0x8000000);
-    pegasos2_pci_config_write(as, 0, PCI_COMMAND, 2, PCI_COMMAND_IO |
+    pegasos2_mv_reg_write(pm, 0, 4, 0x28020ff);
+    pegasos2_mv_reg_write(pm, 0x278, 4, 0xa31fc);
+    pegasos2_mv_reg_write(pm, 0xf300, 4, 0x11ff0400);
+    pegasos2_mv_reg_write(pm, 0xf10c, 4, 0x80000000);
+    pegasos2_mv_reg_write(pm, 0x1c, 4, 0x8000000);
+    pegasos2_pci_config_write(pm, 0, PCI_COMMAND, 2, PCI_COMMAND_IO |
                               PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
-    pegasos2_pci_config_write(as, 1, PCI_COMMAND, 2, PCI_COMMAND_IO |
+    pegasos2_pci_config_write(pm, 1, PCI_COMMAND, 2, PCI_COMMAND_IO |
                               PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x9);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 0) << 8) |
                               0x50, 1, 0x2);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x109);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_CLASS_PROG, 1, 0xf);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               0x40, 1, 0xb);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               0x50, 4, 0x17171717);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 1) << 8) |
                               PCI_COMMAND, 2, 0x87);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 2) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 2) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x409);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 3) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 3) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x409);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x9);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
                               0x48, 4, 0xf00);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
                               0x40, 4, 0x558020);
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 4) << 8) |
                               0x90, 4, 0xd00);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 5) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 5) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x309);
 
-    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 6) << 8) |
+    pegasos2_pci_config_write(pm, 1, (PCI_DEVFN(12, 6) << 8) |
                               PCI_INTERRUPT_LINE, 2, 0x309);
 
     /* Device tree and VOF set up */
@@ -404,7 +397,7 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
         }
         addr = ldl_be_phys(as, args);
         len = ldl_be_phys(as, args + 4);
-        val = pegasos2_pci_config_read(as, !(addr >> 24),
+        val = pegasos2_pci_config_read(pm, !(addr >> 24),
                                        addr & 0x0fffffff, len);
         stl_be_phys(as, rets, 0);
         stl_be_phys(as, rets + 4, val);
@@ -421,7 +414,7 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, Pegasos2MachineState *pm,
         addr = ldl_be_phys(as, args);
         len = ldl_be_phys(as, args + 4);
         val = ldl_be_phys(as, args + 8);
-        pegasos2_pci_config_write(as, !(addr >> 24),
+        pegasos2_pci_config_write(pm, !(addr >> 24),
                                   addr & 0x0fffffff, len, val);
         stl_be_phys(as, rets, 0);
         return H_SUCCESS;
-- 
2.21.4


