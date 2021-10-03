Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3874202F6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 18:49:21 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX4fv-0003Ti-Vj
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 12:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4d3-0000nB-Ak
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4cv-00024O-RC
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:19 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A22C60E90;
 Sun,  3 Oct 2021 16:46:11 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mX4cr-00EUhe-Nj; Sun, 03 Oct 2021 17:46:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/arm/virt: Key enablement of highmem PCIe on
 highmem_ecam
Date: Sun,  3 Oct 2021 17:46:01 +0100
Message-Id: <20211003164605.3116450-2-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211003164605.3116450-1-maz@kernel.org>
References: <20211003164605.3116450-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the highmem PCIe region is oddly keyed on the highmem
attribute instead of highmem_ecam. Move the enablement of this PCIe
region over to highmem_ecam.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt-acpi-build.c | 10 ++++------
 hw/arm/virt.c            |  4 ++--
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..d7bef0e627 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -157,10 +157,9 @@ static void acpi_dsdt_add_virtio(Aml *scope,
 }
 
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
-                              uint32_t irq, bool use_highmem, bool highmem_ecam,
-                              VirtMachineState *vms)
+                              uint32_t irq, VirtMachineState *vms)
 {
-    int ecam_id = VIRT_ECAM_ID(highmem_ecam);
+    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     struct GPEXConfig cfg = {
         .mmio32 = memmap[VIRT_PCIE_MMIO],
         .pio    = memmap[VIRT_PCIE_PIO],
@@ -169,7 +168,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .bus    = vms->bus,
     };
 
-    if (use_highmem) {
+    if (vms->highmem_ecam) {
         cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
     }
 
@@ -712,8 +711,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
-    acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem, vms->highmem_ecam, vms);
+    acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE), vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7170aaacd5..8021d545c3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1362,7 +1362,7 @@ static void create_pcie(VirtMachineState *vms)
                              mmio_reg, base_mmio, size_mmio);
     memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
 
-    if (vms->highmem) {
+    if (vms->highmem_ecam) {
         /* Map high MMIO space */
         MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
 
@@ -1416,7 +1416,7 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_ecam, 2, size_ecam);
 
-    if (vms->highmem) {
+    if (vms->highmem_ecam) {
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
-- 
2.30.2


