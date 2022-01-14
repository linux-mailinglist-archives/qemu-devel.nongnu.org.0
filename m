Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E514048EBBE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:36:02 +0100 (CET)
Received: from localhost ([::1]:42886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NgQ-0004FL-1F
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFY-0006iv-Cb
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:16 -0500
Received: from [2604:1380:4601:e00::1] (port=44100 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n8NFV-0002pw-Pe
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:08:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F343DB825EE;
 Fri, 14 Jan 2022 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9017C36AEC;
 Fri, 14 Jan 2022 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642169284;
 bh=EJPREJ2hbzrlmOKbYFYOpDsisqpwtXTDNLV0Fhn5LAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aLHdlj9DKlj4+sO9BXEHhwwSBp6gqdTcDBLK2INrjs5YZwjNzg5nEnNoejnTn0VRE
 vmeGcCnK0zLUiSh8dBPKG6b6G826Y9WaEqTKrjVMEQ420vNmJQUYQoE4VWn/nMQHEB
 Erf9OD8H8YdWuJrRDTvsKa3KI1d8rk/TDpqH7lJOXM8IfGyJvZk/N7b0PKvQmUqMyK
 CC7OtRs1R4Rx+idzZ1Rtn3M57n1mZeH29Vb4IJ9BAYUt8zYbjk3ZkXeAMQd2iEVpE3
 1QY5k2leYKTtAD4y0d3vjsVevNUsVY8LC7zYdSNLxx7LaIjI9nXnYmOv8NPsF9LtTQ
 SgiTufwnzujHQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n8NFK-000V8K-VE; Fri, 14 Jan 2022 14:08:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] hw/arm/virt: Add a control for the the highmem PCIe
 MMIO
Date: Fri, 14 Jan 2022 14:07:36 +0000
Message-Id: <20220114140741.1358263-2-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114140741.1358263-1-maz@kernel.org>
References: <20220114140741.1358263-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=maz@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just like we can control the enablement of the highmem PCIe ECAM
region using highmem_ecam, let's add a control for the highmem
PCIe MMIO  region.

Similarily to highmem_ecam, this region is disabled when highmem
is off.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt-acpi-build.c | 10 ++++------
 hw/arm/virt.c            |  7 +++++--
 include/hw/arm/virt.h    |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f2514ce77c..449fab0080 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -158,10 +158,9 @@ static void acpi_dsdt_add_virtio(Aml *scope,
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
@@ -170,7 +169,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .bus    = vms->bus,
     };
 
-    if (use_highmem) {
+    if (vms->highmem_mmio) {
         cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
     }
 
@@ -869,8 +868,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
-    acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
-                      vms->highmem, vms->highmem_ecam, vms);
+    acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
                       HOTPLUG_HANDLER(vms->acpi_dev),
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b45b52c90e..ed8ea96acc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1412,7 +1412,7 @@ static void create_pcie(VirtMachineState *vms)
                              mmio_reg, base_mmio, size_mmio);
     memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
 
-    if (vms->highmem) {
+    if (vms->highmem_mmio) {
         /* Map high MMIO space */
         MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
 
@@ -1466,7 +1466,7 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_ecam, 2, size_ecam);
 
-    if (vms->highmem) {
+    if (vms->highmem_mmio) {
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
@@ -2105,6 +2105,8 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
+    vms->highmem_mmio &= vms->highmem;
+
     create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
@@ -2802,6 +2804,7 @@ static void virt_instance_init(Object *obj)
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
+    vms->highmem_mmio = true;
 
     if (vmc->no_its) {
         vms->its = false;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index dc6b66ffc8..9c54acd10d 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -143,6 +143,7 @@ struct VirtMachineState {
     bool secure;
     bool highmem;
     bool highmem_ecam;
+    bool highmem_mmio;
     bool its;
     bool tcg_its;
     bool virt;
-- 
2.30.2


