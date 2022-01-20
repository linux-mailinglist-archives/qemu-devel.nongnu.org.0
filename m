Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7674952DE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 18:06:59 +0100 (CET)
Received: from localhost ([::1]:34804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAatl-0003Np-U3
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 12:06:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgM-0004A5-EC
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:50 -0500
Received: from [2a00:1450:4864:20::336] (port=36530
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgJ-00039u-4t
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso20155867wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PmHXupL03JyCbpDAhPnTSUzNfKvyaSym3zPH6Rc5qOs=;
 b=dk6uBIlGPpiuB5cf1k/dC9/WhSPlCCwUCdrrqVSkm3G1+PWLrX9+6lSo/+Y+wVVqid
 Ef6ec3u6fW7aHC8V+bActdzCqkndPatUYsrKGTqqLq0eIEjxdzrj9uxNWRQv9x02Appq
 euKtytsIwzaHNjlzLTgjM7+FKe9s7G7/vWC8C7atDNStQM9ZmtMiVknBLLLxdRGr+DO4
 6iYVlN4Nl+W/kgasNpBSteRL6UXErco/nFZeoNi/8LsKag790l5jKvrd4CwOa8YQQXRQ
 iBoXbL1LKd3Cg8bIZmv18Yt6zEbjgSgmD2N9VjBR5KzUgYpAjGRmHNnN/9XlzBUtvhLD
 VuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmHXupL03JyCbpDAhPnTSUzNfKvyaSym3zPH6Rc5qOs=;
 b=auYVgJFoSNr1ergC52KBYoVMaQ1qSEWuH85XOavZmZ+W3xUzA5hzfkMScfWb1rCOt6
 XbRLxPChOCusXF7DTJ5CT3faGEqpzrtDOqY1qNINTMlHl/bExYZUmzSAkLs/JGSafR8R
 o5C9yOp1MXEHuecsVlNWKoSSrn2GFwQrvnTyijsXJ1JFhepZlVINtdUfnjtvDSt5GaXP
 WcRZc3+MvhlqPf2HvZhsyZmcy7tHRqW+sxP9hGD1WNh+moykGQ0tTFgcVRSyyJE1vYCw
 KVtnBOk+hjR5ujUhuH1WvTt6dpN/uFkUIEiB2KKKlbr2gWTSad0ZSo2G5TwKuzGKYjL2
 ONrg==
X-Gm-Message-State: AOAM532gStygJdXgYLG1ni/EVaXy/CoEm1euqxalCtUW/+Afwye6TFlJ
 9kNNCkS4vd/RSzIyhNnoQb/WwSs1LMR3pw==
X-Google-Smtp-Source: ABdhPJxAy6H0SQJXE/ifP0H8KQ+Ng1TNyzXI58sPbxpMC8+c0jZ8bWfWD5NJLBDa86Gss2yL3Mp2pg==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr13184130wri.8.1642682205581;
 Thu, 20 Jan 2022 04:36:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/38] hw/arm/virt: Add a control for the the highmem PCIe MMIO
Date: Thu, 20 Jan 2022 12:36:08 +0000
Message-Id: <20220120123630.267975-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Marc Zyngier <maz@kernel.org>

Just like we can control the enablement of the highmem PCIe ECAM
region using highmem_ecam, let's add a control for the highmem
PCIe MMIO  region.

Similarily to highmem_ecam, this region is disabled when highmem
is off.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-id: 20220114140741.1358263-2-maz@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h    |  1 +
 hw/arm/virt-acpi-build.c | 10 ++++------
 hw/arm/virt.c            |  7 +++++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index be0534608f8..cf5d8b83ded 100644
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
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f2514ce77c0..449fab00805 100644
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
index a76d86b5926..16369ce10e4 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1419,7 +1419,7 @@ static void create_pcie(VirtMachineState *vms)
                              mmio_reg, base_mmio, size_mmio);
     memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
 
-    if (vms->highmem) {
+    if (vms->highmem_mmio) {
         /* Map high MMIO space */
         MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
 
@@ -1473,7 +1473,7 @@ static void create_pcie(VirtMachineState *vms)
     qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_ecam, 2, size_ecam);
 
-    if (vms->highmem) {
+    if (vms->highmem_mmio) {
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
@@ -2112,6 +2112,8 @@ static void machvirt_init(MachineState *machine)
 
     virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
 
+    vms->highmem_mmio &= vms->highmem;
+
     create_gic(vms, sysmem);
 
     virt_cpu_post_init(vms, sysmem);
@@ -2899,6 +2901,7 @@ static void virt_instance_init(Object *obj)
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
     vms->highmem_ecam = !vmc->no_highmem_ecam;
+    vms->highmem_mmio = true;
 
     if (vmc->no_its) {
         vms->its = false;
-- 
2.25.1


