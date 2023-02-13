Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A466941F9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:52:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOl-0008BU-TW; Mon, 13 Feb 2023 04:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOL-0007n4-Tf
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:00 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOF-0002n2-EP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281491; x=1707817491;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QypxHHuyBV1gVSk5oVVv+KwvgZ9hKxi5suVXOY9rneE=;
 b=aANtFN7xHFXuG3fhQsru81T1wW7pr56l4vyXKlVZ6iqHTkYDiyH9tT76
 DH6pWsaN0XyYIYW52fanw2GBjMWw9LjS8/iv8Atma4Yn56UtdLj1rkkJX
 5zRvivu8XLhpVNjh1h1NvweKxiEsPzY4L0Yj4OB7XGsyO9a/I47m+a5bd
 9QPocylG2PqMcHxwo4N0/+5W9d5c4yy+TdKTrEsHKkyksw6Aj5VSXBfnk
 Bu9//9+CqMhHq78DjuNl4DVs7TBHDmr34FF27pt7IcsGhBmdEB5M+2sWY
 y/nIJ9VUComT/C+iQrGZzDRpJKjj2yGaE3H+AQEGSkjc9XtJOzASJdU3q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486740"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486740"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760516"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760516"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:29 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Subject: [RFC 23/52] arm: Replace MachineState.smp access with topology helpers
Date: Mon, 13 Feb 2023 17:50:06 +0800
Message-Id: <20230213095035.158240-24-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

When MachineState.topo is introduced, the topology related structures
become complicated. So we wrapped the access to topology fields of
MachineState.topo into some helpers, and we are using these helpers
to replace the use of MachineState.smp.

Before arm supports hybrid, here we use smp-specific interface to get
"threads per core" and "cores per cluster".

For other cases, it's straightforward to replace topology access with
wrapped generic interfaces.

Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Radoslaw Biernacki <rad@semihalf.com>
Cc: Leif Lindholm <quic_llindhol@quicinc.com>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/arm/fsl-imx6.c        |  4 ++--
 hw/arm/fsl-imx6ul.c      |  4 ++--
 hw/arm/fsl-imx7.c        |  4 ++--
 hw/arm/highbank.c        |  2 +-
 hw/arm/realview.c        |  2 +-
 hw/arm/sbsa-ref.c        |  8 +++----
 hw/arm/vexpress.c        |  2 +-
 hw/arm/virt-acpi-build.c |  4 ++--
 hw/arm/virt.c            | 50 ++++++++++++++++++++++------------------
 hw/arm/xlnx-zynqmp.c     |  6 ++---
 include/hw/arm/virt.h    |  2 +-
 target/arm/cpu.c         |  2 +-
 target/arm/cpu_tcg.c     |  2 +-
 target/arm/kvm.c         |  2 +-
 14 files changed, 50 insertions(+), 44 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62de..e94dec5e6c8d 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -41,7 +41,7 @@ static void fsl_imx6_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
+    for (i = 0; i < MIN(machine_topo_get_cpus(ms), FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i],
                                 ARM_CPU_TYPE_NAME("cortex-a9"));
@@ -108,7 +108,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     FslIMX6State *s = FSL_IMX6(dev);
     uint16_t i;
     Error *err = NULL;
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
 
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
         error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index d88d6cc1c5f9..1216b7ff1a92 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -160,9 +160,9 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd;
     DeviceState *d;
 
-    if (ms->smp.cpus > 1) {
+    if (machine_topo_get_cpus(ms) > 1) {
         error_setg(errp, "%s: Only a single CPU is supported (%d requested)",
-                   TYPE_FSL_IMX6UL, ms->smp.cpus);
+                   TYPE_FSL_IMX6UL, machine_topo_get_cpus(ms));
         return;
     }
 
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index afc74807990f..f3e569a6ec29 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -36,7 +36,7 @@ static void fsl_imx7_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX7_NUM_CPUS); i++) {
+    for (i = 0; i < MIN(machine_topo_get_cpus(ms), FSL_IMX7_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i],
                                 ARM_CPU_TYPE_NAME("cortex-a7"));
@@ -148,7 +148,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     int i;
     qemu_irq irq;
     char name[NAME_SIZE];
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
 
     if (smp_cpus > FSL_IMX7_NUM_CPUS) {
         error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f12aacea6b86..22d6987eafe1 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -181,7 +181,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     SysBusDevice *busdev;
     qemu_irq pic[128];
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     qemu_irq cpu_irq[4];
     qemu_irq cpu_fiq[4];
     qemu_irq cpu_virq[4];
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index a5aa2f046aec..0a2022a34629 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -87,7 +87,7 @@ static void realview_init(MachineState *machine,
     DriveInfo *dinfo;
     I2CBus *i2c;
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     int done_nic = 0;
     qemu_irq cpu_irq[4];
     int is_mpcore = 0;
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d0979..35f2b83849d5 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -394,7 +394,7 @@ static void create_secure_ram(SBSAMachineState *sms,
 
 static void create_gic(SBSAMachineState *sms)
 {
-    unsigned int smp_cpus = MACHINE(sms)->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(MACHINE(sms));
     SysBusDevice *gicbusdev;
     const char *gictype;
     uint32_t redist0_capacity, redist0_count;
@@ -674,8 +674,8 @@ static void create_secure_ec(MemoryRegion *mem)
 
 static void sbsa_ref_init(MachineState *machine)
 {
-    unsigned int smp_cpus = machine->smp.cpus;
-    unsigned int max_cpus = machine->smp.max_cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
+    unsigned int max_cpus = machine_topo_get_max_cpus(machine);
     SBSAMachineState *sms = SBSA_MACHINE(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     MemoryRegion *sysmem = get_system_memory();
@@ -801,7 +801,7 @@ static void sbsa_ref_init(MachineState *machine)
 
 static const CPUArchIdList *sbsa_ref_possible_cpu_arch_ids(MachineState *ms)
 {
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
     SBSAMachineState *sms = SBSA_MACHINE(ms);
     int n;
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 34b012b528b0..5e486da27ee8 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -207,7 +207,7 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     DeviceState *dev;
     SysBusDevice *busdev;
     int n;
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
 
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49f0..985b945e762d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -67,7 +67,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
     MachineState *ms = MACHINE(vms);
     uint16_t i;
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(ms); i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
@@ -725,7 +725,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, vms->gic_version, 1);
     build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
-    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
+    for (i = 0; i < machine_topo_get_cpus(MACHINE(vms)); i++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
         uint64_t physical_base_address = 0, gich = 0, gicv = 0;
         uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 75f28947de07..ae65ba2c929c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -346,7 +346,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << MACHINE(vms)->smp.cpus) - 1);
+                             (1 << machine_topo_get_cpus(MACHINE(vms))) - 1);
     }
 
     qemu_fdt_add_subnode(ms->fdt, "/timer");
@@ -374,7 +374,10 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     int addr_cells = 1;
     const MachineState *ms = MACHINE(vms);
     const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int smp_cpus = ms->smp.cpus;
+    int smp_cpus = machine_topo_get_cpus(ms);
+    int smp_clusters = machine_topo_get_clusters(ms);
+    int smp_cores = machine_topo_get_smp_cores(ms);
+    int smp_threads = machine_topo_get_smp_threads(ms);
 
     /*
      * See Linux Documentation/devicetree/bindings/arm/cpus.yaml
@@ -461,19 +464,19 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
             char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
             char *map_path;
 
-            if (ms->smp.threads > 1) {
+            if (smp_threads > 1) {
                 map_path = g_strdup_printf(
                     "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
-                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
-                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
-                    (cpu / ms->smp.threads) % ms->smp.cores,
-                    cpu % ms->smp.threads);
+                    cpu / (smp_clusters * smp_cores * smp_threads),
+                    (cpu / (smp_cores * smp_threads)) % smp_clusters,
+                    (cpu / smp_threads) % smp_cores,
+                    cpu % smp_threads);
             } else {
                 map_path = g_strdup_printf(
                     "/cpus/cpu-map/socket%d/cluster%d/core%d",
-                    cpu / (ms->smp.clusters * ms->smp.cores),
-                    (cpu / ms->smp.cores) % ms->smp.clusters,
-                    cpu % ms->smp.cores);
+                    cpu / (smp_clusters * smp_cores),
+                    (cpu / smp_cores) % smp_clusters,
+                    cpu % smp_cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
             qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
@@ -613,7 +616,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << MACHINE(vms)->smp.cpus) - 1);
+                             (1 << machine_topo_get_cpus(MACHINE(vms))) - 1);
     }
 
     qemu_fdt_add_subnode(ms->fdt, "/pmu");
@@ -708,7 +711,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
     SysBusDevice *gicbusdev;
     const char *gictype;
     int i;
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
     uint32_t nb_redist_regions = 0;
     int revision;
 
@@ -1277,7 +1280,7 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine_topo_get_cpus(ms));
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(ms->fdt, nodename);
@@ -1908,7 +1911,7 @@ static VirtGICType finalize_gic_version_do(const char *accel_name,
 static void finalize_gic_version(VirtMachineState *vms)
 {
     const char *accel_name = current_accel_name();
-    unsigned int max_cpus = MACHINE(vms)->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(MACHINE(vms));
     int gics_supported = 0;
 
     /* Determine which GIC versions the current environment supports */
@@ -1958,7 +1961,7 @@ static void finalize_gic_version(VirtMachineState *vms)
  */
 static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
 {
-    int max_cpus = MACHINE(vms)->smp.max_cpus;
+    int max_cpus = machine_topo_get_max_cpus(MACHINE(vms));
     bool aarch64, pmu, steal_time;
     CPUState *cpu;
 
@@ -2032,8 +2035,8 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded;
     bool aarch64 = true;
     bool has_ged = !vmc->no_ged;
-    unsigned int smp_cpus = machine->smp.cpus;
-    unsigned int max_cpus = machine->smp.max_cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
+    unsigned int max_cpus = machine_topo_get_max_cpus(machine);
 
     if (!cpu_type_valid(machine->cpu_type)) {
         error_report("mach-virt: CPU type %s not supported", machine->cpu_type);
@@ -2664,7 +2667,10 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
+    unsigned int smp_clusters = machine_topo_get_clusters(ms);
+    unsigned int smp_cores = machine_topo_get_smp_cores(ms);
+    unsigned int smp_threads = machine_topo_get_smp_threads(ms);
     VirtMachineState *vms = VIRT_MACHINE(ms);
     MachineClass *mc = MACHINE_GET_CLASS(vms);
 
@@ -2684,16 +2690,16 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         assert(!mc->smp_props.dies_supported);
         ms->possible_cpus->cpus[n].props.has_socket_id = true;
         ms->possible_cpus->cpus[n].props.socket_id =
-            n / (ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+            n / (smp_clusters * smp_cores * smp_threads);
         ms->possible_cpus->cpus[n].props.has_cluster_id = true;
         ms->possible_cpus->cpus[n].props.cluster_id =
-            (n / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters;
+            (n / (smp_cores * smp_threads)) % smp_clusters;
         ms->possible_cpus->cpus[n].props.has_core_id = true;
         ms->possible_cpus->cpus[n].props.core_id =
-            (n / ms->smp.threads) % ms->smp.cores;
+            (n / smp_threads) % smp_cores;
         ms->possible_cpus->cpus[n].props.has_thread_id = true;
         ms->possible_cpus->cpus[n].props.thread_id =
-            n % ms->smp.threads;
+            n % smp_threads;
     }
     return ms->possible_cpus;
 }
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 335cfc417d70..773de7a51680 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -213,7 +213,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
                                    const char *boot_cpu, Error **errp)
 {
     int i;
-    int num_rpus = MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
+    int num_rpus = MIN(machine_topo_get_cpus(ms) - XLNX_ZYNQMP_NUM_APU_CPUS,
                        XLNX_ZYNQMP_NUM_RPU_CPUS);
 
     if (num_rpus <= 0) {
@@ -376,7 +376,7 @@ static void xlnx_zynqmp_init(Object *obj)
     MachineState *ms = MACHINE(qdev_get_machine());
     XlnxZynqMPState *s = XLNX_ZYNQMP(obj);
     int i;
-    int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    int num_apus = MIN(machine_topo_get_cpus(ms), XLNX_ZYNQMP_NUM_APU_CPUS);
 
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             TYPE_CPU_CLUSTER);
@@ -449,7 +449,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     MemoryRegion *system_memory = get_system_memory();
     uint8_t i;
     uint64_t ram_size;
-    int num_apus = MIN(ms->smp.cpus, XLNX_ZYNQMP_NUM_APU_CPUS);
+    int num_apus = MIN(machine_topo_get_cpus(ms), XLNX_ZYNQMP_NUM_APU_CPUS);
     const char *boot_cpu = s->boot_cpu ? s->boot_cpu : "apu-cpu[0]";
     ram_addr_t ddr_low_size, ddr_high_size;
     qemu_irq gic_spi[GIC_NUM_SPI_INTR];
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e1ddbea96bea..e046f530990f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -213,7 +213,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version != VIRT_GIC_VERSION_2);
 
-    return (MACHINE(vms)->smp.cpus > redist0_capacity &&
+    return (machine_topo_get_cpus(MACHINE(vms)) > redist0_capacity &&
             vms->highmem_redists) ? 2 : 1;
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf22..a7f1d470eed7 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2079,7 +2079,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
     bool has_secure = cpu->has_el3 || arm_feature(env, ARM_FEATURE_M_SECURITY);
 
     /*
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ccde5080eb70..a098d797637c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -515,7 +515,7 @@ static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
      * Linux wants the number of processors from here.
      * Might as well set the interrupt-controller bit too.
      */
-    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
+    return ((machine_topo_get_cpus(ms) - 1) << 24) | (1 << 23);
 }
 #endif
 
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index f022c644d2ff..eefded5d203b 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -263,7 +263,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
 
     cap_has_mp_state = kvm_check_extension(s, KVM_CAP_MP_STATE);
 
-    if (ms->smp.cpus > 256 &&
+    if (machine_topo_get_cpus(ms) > 256 &&
         !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
         error_report("Using more than 256 vcpus requires a host kernel "
                      "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
-- 
2.34.1


