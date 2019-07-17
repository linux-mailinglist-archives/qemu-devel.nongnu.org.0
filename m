Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D881A6B71B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 09:07:31 +0200 (CEST)
Received: from localhost ([::1]:54600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hne2E-00029x-QU
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 03:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aik@ozlabs.ru>) id 1hne21-0001er-Ej
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 03:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1hne1z-0006Il-HC
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 03:07:17 -0400
Received: from ozlabs.ru ([107.173.13.209]:33884)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1hne1z-0006GN-9Q; Wed, 17 Jul 2019 03:07:15 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 69042AE800AC;
 Wed, 17 Jul 2019 03:06:37 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 17:06:36 +1000
Message-Id: <20190717070637.101776-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [PATCH qemu v2] spapr_pci: Advertise BAR reallocation
 capability
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pseries guests do not normally allocate PCI resources and rely on
the system firmware doing so. Furthermore at least at some point in
the past the pseries guests won't even allowed to change BARs, probably
it is still the case for phyp. So since the initial commit we have [1]
which prevents resource reallocation.

This is not a problem until we want specific BAR alignments, for example,
PAGE_SIZE==64k to make sure we can still map MMIO BARs directly. For
the boot time devices we handle this in SLOF [2] but since QEMU's RTAS
does not allocate BARs, the guest does this instead and does not align
BARs even if Linux is given pci=resource_alignment=16@pci:0:0 as
PCI_PROBE_ONLY makes Linux ignore alignment requests.

ARM folks added a dial to control PCI_PROBE_ONLY via the device tree [3].
This makes use of the dial to advertise to the guest that we can handle
BAR reassignments. This limits the change to the latest pseries machine
to avoid old guests explosion.

We do not remove the flag from [1] as pseries guests are still supported
under phyp so having that removed may cause problems.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/platforms/pseries/setup.c?h=v5.1#n773
[2] https://git.qemu.org/?p=SLOF.git;a=blob;f=board-qemu/slof/pci-phb.fs;h=06729bcf77a0d4e900c527adcd9befe2a269f65d;hb=HEAD#l338
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f81c11af
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* limited the change by a machine version

---
 include/hw/ppc/spapr.h |  1 +
 hw/ppc/spapr.c         | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 60553d32c4fa..11c8185b94a1 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -120,6 +120,7 @@ struct SpaprMachineClass {
     bool legacy_irq_allocation;
     bool broken_host_serial_model; /* present real host info to the guest */
     bool pre_4_1_migration; /* don't migrate hpt-max-page-size */
+    bool linux_pci_probe;
 
     void (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
                           uint64_t *buid, hwaddr *pio, 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8783b433960c..734d759d65b3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1162,6 +1162,7 @@ static void spapr_dt_ov5_platform_support(SpaprMachineState *spapr, void *fdt,
 static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt)
 {
     MachineState *machine = MACHINE(spapr);
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     int chosen;
     const char *boot_device = machine->boot_order;
     char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
@@ -1219,6 +1220,11 @@ static void spapr_dt_chosen(SpaprMachineState *spapr, void *fdt)
         _FDT(fdt_setprop_string(fdt, chosen, "stdout-path", stdout_path));
     }
 
+    /* We can deal with BAR reallocation just fine, advertise it to the guest */
+    if (smc->linux_pci_probe) {
+        _FDT(fdt_setprop_cell(fdt, chosen, "linux,pci-probe-only", 0));
+    }
+
     spapr_dt_ov5_platform_support(spapr, fdt, chosen);
 
     g_free(stdout_path);
@@ -4432,6 +4438,9 @@ static const TypeInfo spapr_machine_info = {
 static void spapr_machine_4_2_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
+
+    smc->linux_pci_probe = true;
 }
 
 DEFINE_SPAPR_MACHINE(4_2, "4.2", true);
@@ -4441,12 +4450,14 @@ DEFINE_SPAPR_MACHINE(4_2, "4.2", true);
  */
 static void spapr_machine_4_1_class_options(MachineClass *mc)
 {
+    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
     static GlobalProperty compat[] = {
         /* Only allow 4kiB and 64kiB IOMMU pagesizes */
         { TYPE_SPAPR_PCI_HOST_BRIDGE, "pgsz", "0x11000" },
     };
 
     spapr_machine_4_2_class_options(mc);
+    smc->linux_pci_probe = false;
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
 }
 
-- 
2.17.1


