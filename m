Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 125062EF4F7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:38:48 +0100 (CET)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtqh-0006BB-0X
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoV-0004Q8-Ge
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:31 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:46986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoR-0002pi-Qd
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id d13so9366388wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jdOk99DwEgR6uV3BnG6e53Xn4wFxnSp+zoQof5hSqoQ=;
 b=xWFmZslBu2UvkBRQ785jonj6vVxvYTM5Z3gvCvHihW9wQI22ZmylAop47SmGAFmKFw
 PEBG8OhoYxRDSkAdPOcX6iuWxDegPIJ2XR9UaHlE4Hs/EQDuv9eO3VKMWSkZGw7hHdUo
 1IjkJYQiPs9BYZMKQEAX+zsQPORwfxNZy63xE9u53pA/FhjtFKf9mq2H1D7o7KjyoYIU
 KQ3gALJfWrE4EVxGe71nzKT+dz0X5T8oJgsF4XA/8+nxP0WOldHsfh2EeRye8ciRiUqB
 qX+bqNhZEUeVhH3HNKwuC14VpN0EJT5kmJ46P7/8VpzB38u//93kWX1tvwF4RZdUd59p
 z0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jdOk99DwEgR6uV3BnG6e53Xn4wFxnSp+zoQof5hSqoQ=;
 b=SYbs+yQPHQIdtD2QFBvBwi6+okqE2OvI+2RTG9S+fVVcUIV2/eQ5tf6a3GIqY4Ub4x
 XRg/2KLbGjFG+bikdJlKj3AJQwfbM0QxcTpCg5N+wGCIa71MxKqcsjh1uOmBzg66J93w
 K6A73CC/t48NXJ5KEbOFAQ+djCuo3ooltHS+Wt1lW2MWRSqrTlLnbOM9gBq+R2u52wcJ
 qG0Wjz9Ge5MTgllOLmfYmorhMJIMz98HY5+AUsmdsrM/RVIVdkndkDFjy9HIpcCHTR12
 f1JiGIN3Kr9KiGrWxZt/rrPAGNy/q/ceDOB6WMuDlX5ixUTt4+KnXOHmtrbPwjTxW265
 6VmA==
X-Gm-Message-State: AOAM5335UCLzd3AOTCSYMHSLtGrJxRw1ixp0d5U51YxIklUqy7fxEvBZ
 r2DqiuzbOddn6lmNM76jJ9YagePbsJMoFw==
X-Google-Smtp-Source: ABdhPJzO/GAL+HwStZ1sy7DY9YDTV7EMorhfEZWK+PQ3bNdGuCSxHL/59FBEZB+PaFr5KVhPl1DDOA==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr4175051wrt.267.1610120186185; 
 Fri, 08 Jan 2021 07:36:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] hw/arm/virt: Remove virt machine state 'smp_cpus'
Date: Fri,  8 Jan 2021 15:36:00 +0000
Message-Id: <20210108153621.3868-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Jones <drjones@redhat.com>

virt machine's 'smp_cpus' and machine->smp.cpus must always have the
same value. And, anywhere we have virt machine state we have machine
state. So let's remove the redundancy. Also, to make it easier to see
that machine->smp is the true source for "smp_cpus" and "max_cpus",
avoid passing them in function parameters, preferring instead to get
them from the state.

No functional change intended.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Ying Fang <fangying1@huawei.com>
Message-id: 20201215174815.51520-1-drjones@redhat.com
[PMM: minor formatting tweak to smp_cpus variable declaration]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h    |  3 +--
 hw/arm/virt-acpi-build.c |  9 +++++----
 hw/arm/virt.c            | 21 ++++++++++-----------
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index abf54fab498..e4a2d216420 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -151,7 +151,6 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
-    int smp_cpus;
     void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
@@ -182,7 +181,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version == VIRT_GIC_VERSION_3);
 
-    return vms->smp_cpus > redist0_capacity ? 2 : 1;
+    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
 }
 
 #endif /* QEMU_ARM_VIRT_H */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 711cf2069fe..9d9ee240534 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -59,11 +59,12 @@
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
-static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
+static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
 {
+    MachineState *ms = MACHINE(vms);
     uint16_t i;
 
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < ms->smp.cpus; i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
@@ -484,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < vms->smp_cpus; i++) {
+    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -603,7 +604,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
+    acpi_dsdt_add_cpus(scope, vms);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index bf3a7171118..86070dfd98b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -323,7 +323,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << vms->smp_cpus) - 1);
+                             (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
     qemu_fdt_add_subnode(vms->fdt, "/timer");
@@ -350,6 +350,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int cpu;
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
+    int smp_cpus = ms->smp.cpus;
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -364,7 +365,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
      *  The simplest way to go is to examine affinity IDs of all our CPUs. If
      *  at least one of them has Aff3 populated, we set #address-cells to 2.
      */
-    for (cpu = 0; cpu < vms->smp_cpus; cpu++) {
+    for (cpu = 0; cpu < smp_cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
 
         if (armcpu->mp_affinity & ARM_AFF3_MASK) {
@@ -377,7 +378,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
 
-    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
+    for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
         CPUState *cs = CPU(armcpu);
@@ -387,8 +388,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
         qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                     armcpu->dtb_compatible);
 
-        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
-            && vms->smp_cpus > 1) {
+        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED && smp_cpus > 1) {
             qemu_fdt_setprop_string(vms->fdt, nodename,
                                         "enable-method", "psci");
         }
@@ -534,7 +534,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << vms->smp_cpus) - 1);
+                             (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
     qemu_fdt_add_subnode(vms->fdt, "/pmu");
@@ -1674,9 +1674,9 @@ static void finalize_gic_version(VirtMachineState *vms)
  * virt_cpu_post_init() must be called after the CPUs have
  * been realized and the GIC has been created.
  */
-static void virt_cpu_post_init(VirtMachineState *vms, int max_cpus,
-                               MemoryRegion *sysmem)
+static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
+    int max_cpus = MACHINE(vms)->smp.max_cpus;
     bool aarch64, pmu, steal_time;
     CPUState *cpu;
 
@@ -1829,8 +1829,6 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    vms->smp_cpus = smp_cpus;
-
     if (vms->virt && kvm_enabled()) {
         error_report("mach-virt: KVM does not support providing "
                      "Virtualization extensions to the guest CPU");
@@ -1846,6 +1844,7 @@ static void machvirt_init(MachineState *machine)
     create_fdt(vms);
 
     possible_cpus = mc->possible_cpu_arch_ids(machine);
+    assert(possible_cpus->len == max_cpus);
     for (n = 0; n < possible_cpus->len; n++) {
         Object *cpuobj;
         CPUState *cs;
@@ -1966,7 +1965,7 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vms);
 
-    virt_cpu_post_init(vms, possible_cpus->len, sysmem);
+    virt_cpu_post_init(vms, sysmem);
 
     fdt_add_pmu_nodes(vms);
 
-- 
2.20.1


