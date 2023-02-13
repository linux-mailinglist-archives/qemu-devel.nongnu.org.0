Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEE4694201
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOl-0008Bb-Sb; Mon, 13 Feb 2023 04:45:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVO9-0007Za-UF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:47 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVO4-0002kj-M8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281480; x=1707817480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e2ENqKazMcHMWmGRSxxi07qTD8v4tTI5fPc6UEuMlvM=;
 b=Wyod7VA7kqrxYN8bQL/HMDURAwuLDu/bqizKl162ZVPkXlZF15MQSl5V
 lnb6Q/DCShEymThykE5XnQAm9CoMCOY9EiDHxoVfwg5mnW8JZak5DSmA9
 eJpP93pVBQM6268M37lO2oW+sc2+y6+zGj0edJjjYjnh+jI3jsbnTBGzC
 HDfQCPggLlCzzi4+2OsOrz0GG9rQrOne12xe038snPadyi0/vaBj7o/Nj
 HrLrLJRQHsdMEkUjRsaIFPgjcbWXrFCg+HVXQ+mVVGnXUg7OXUnzwnCyA
 0fnSd1wPJgT2y+g2vzkv47Rtn39txPuX7uWD20eH4SZakCphO1XyN9+Gs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486689"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486689"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760313"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760313"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:20 -0800
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
 =?UTF-8?q?Herv=C3=A9=20Poussinea?= <hpoussin@reactos.or>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: [RFC 21/52] ppc: Replace MachineState.smp access with topology helpers
Date: Mon, 13 Feb 2023 17:50:04 +0800
Message-Id: <20230213095035.158240-22-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Before ppc supports hybrid, here we use smp-specific interface to get
"threads per core" and "cores per cluster".

For other cases, it's straightforward to replace topology access with
wrapped generic interfaces.

Cc: Hervé Poussinea <hpoussin@reactos.or>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/ppc/e500.c         |  6 +++---
 hw/ppc/mac_newworld.c | 16 +++++++++-------
 hw/ppc/mac_oldworld.c | 12 +++++++-----
 hw/ppc/pnv.c          | 11 +++++++----
 hw/ppc/prep.c         |  3 ++-
 hw/ppc/spapr.c        | 37 ++++++++++++++++++++-----------------
 hw/ppc/spapr_rtas.c   | 17 +++++++++--------
 7 files changed, 57 insertions(+), 45 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 117c9c08eddf..e999bd27dbc2 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -371,7 +371,7 @@ static int ppce500_load_device_tree(PPCE500MachineState *pms,
                                     bool dry_run)
 {
     MachineState *machine = MACHINE(pms);
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
     CPUPPCState *env = first_cpu->env_ptr;
     int ret = -1;
@@ -808,7 +808,7 @@ static DeviceState *ppce500_init_mpic_qemu(PPCE500MachineState *pms,
     SysBusDevice *s;
     int i, j, k;
     MachineState *machine = MACHINE(pms);
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     const PPCE500MachineClass *pmc = PPCE500_MACHINE_GET_CLASS(pms);
 
     dev = qdev_new(TYPE_OPENPIC);
@@ -915,7 +915,7 @@ void ppce500_init(MachineState *machine)
     struct boot_info *boot_info = NULL;
     int dt_size;
     int i;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     /* irq num for pin INTA, INTB, INTC and INTD is 1, 2, 3 and
      * 4 respectively */
     unsigned int pci_irq_nrs[PCI_NUM_PINS] = {1, 2, 3, 4};
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 460c14b5e368..54212afb29e3 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -136,7 +136,7 @@ static void ppc_core99_init(MachineState *machine)
     CPUPPCState *env = NULL;
     char *filename;
     IrqLines *openpic_irqs;
-    int i, j, k, ppc_boot_device, machine_arch, bios_size = -1;
+    int i, j, k, cpus, ppc_boot_device, machine_arch, bios_size = -1;
     const char *bios_name = machine->firmware ?: PROM_FILENAME;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     hwaddr kernel_base = 0, initrd_base = 0, cmdline_base = 0;
@@ -155,8 +155,9 @@ static void ppc_core99_init(MachineState *machine)
     hwaddr nvram_addr = 0xFFF04000;
     uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
+    cpus = machine_topo_get_cpus(machine);
     /* init CPUs */
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -253,9 +254,9 @@ static void ppc_core99_init(MachineState *machine)
         }
     }
 
-    openpic_irqs = g_new0(IrqLines, machine->smp.cpus);
+    openpic_irqs = g_new0(IrqLines, cpus);
     dev = DEVICE(cpu);
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         /* Mac99 IRQ connection between OpenPIC outputs pins
          * and PowerPC input pins
          */
@@ -393,7 +394,7 @@ static void ppc_core99_init(MachineState *machine)
     /* OpenPIC */
     s = SYS_BUS_DEVICE(pic_dev);
     k = 0;
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         for (j = 0; j < OPENPIC_OUTPUT_NB; j++) {
             sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
         }
@@ -472,8 +473,9 @@ static void ppc_core99_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
+                   (uint16_t)machine_topo_get_max_cpus(machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, machine_arch);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 2e4cc3fe0b22..9b715ed6b438 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -90,7 +90,7 @@ static void ppc_heathrow_init(MachineState *machine)
     PowerPCCPU *cpu = NULL;
     CPUPPCState *env = NULL;
     char *filename;
-    int i, bios_size = -1;
+    int i, cpus, bios_size = -1;
     MemoryRegion *bios = g_new(MemoryRegion, 1);
     uint64_t bios_addr;
     uint32_t kernel_base = 0, initrd_base = 0, cmdline_base = 0;
@@ -106,8 +106,9 @@ static void ppc_heathrow_init(MachineState *machine)
     void *fw_cfg;
     uint64_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq() : TBFREQ;
 
+    cpus = machine_topo_get_cpus(machine);
     /* init CPUs */
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         cpu = POWERPC_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
@@ -260,7 +261,7 @@ static void ppc_heathrow_init(MachineState *machine)
     }
 
     /* Connect the heathrow PIC outputs to the 6xx bus */
-    for (i = 0; i < machine->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         switch (PPC_INPUT(env)) {
         case PPC_FLAGS_INPUT_6xx:
             /* XXX: we register only 1 output pin for heathrow PIC */
@@ -315,8 +316,9 @@ static void ppc_heathrow_init(MachineState *machine)
     sysbus_mmio_map(s, 0, CFG_ADDR);
     sysbus_mmio_map(s, 1, CFG_ADDR + 2);
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
+                   (uint16_t)machine_topo_get_max_cpus(machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_HEATHROW);
     fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_base);
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 44b1fbbc9329..1bdd3202115c 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -938,8 +938,9 @@ static void pnv_init(MachineState *machine)
         exit(1);
     }
 
-    pnv->num_chips =
-        machine->smp.max_cpus / (machine->smp.cores * machine->smp.threads);
+    pnv->num_chips = machine_topo_get_max_cpus(machine) /
+                     (machine_topo_get_smp_cores(machine) *
+                     machine_topo_get_smp_threads(machine));
     /*
      * TODO: should we decide on how many chips we can create based
      * on #cores and Venice vs. Murano vs. Naples chip type etc...,
@@ -969,9 +970,11 @@ static void pnv_init(MachineState *machine)
         snprintf(chip_name, sizeof(chip_name), "chip[%d]", i);
         object_property_add_child(OBJECT(pnv), chip_name, chip);
         object_property_set_int(chip, "chip-id", i, &error_fatal);
-        object_property_set_int(chip, "nr-cores", machine->smp.cores,
+        object_property_set_int(chip, "nr-cores",
+                                machine_topo_get_smp_cores(machine),
                                 &error_fatal);
-        object_property_set_int(chip, "nr-threads", machine->smp.threads,
+        object_property_set_int(chip, "nr-threads",
+                                machine_topo_get_smp_threads(machine),
                                 &error_fatal);
         /*
          * The POWER8 machine use the XICS interrupt interface.
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index fcbe4c583765..aefdf986f641 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -382,7 +382,8 @@ static void ibm_40p_init(MachineState *machine)
         boot_device = machine->boot_config.order[0];
     }
 
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
+                   (uint16_t)machine_topo_get_max_cpus(machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, ARCH_PREP);
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 4921198b9d6f..6faad75afd70 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -119,7 +119,7 @@
 static int spapr_vcpu_id(SpaprMachineState *spapr, int cpu_index)
 {
     MachineState *ms = MACHINE(spapr);
-    unsigned int smp_threads = ms->smp.threads;
+    unsigned int smp_threads = machine_topo_get_smp_threads(ms);
 
     assert(spapr->vsmt);
     return
@@ -171,7 +171,8 @@ int spapr_max_server_number(SpaprMachineState *spapr)
     MachineState *ms = MACHINE(spapr);
 
     assert(spapr->vsmt);
-    return DIV_ROUND_UP(ms->smp.max_cpus * spapr->vsmt, ms->smp.threads);
+    return DIV_ROUND_UP(machine_topo_get_max_cpus(ms) * spapr->vsmt,
+                        machine_topo_get_smp_threads(ms));
 }
 
 static int spapr_fixup_cpu_smt_dt(void *fdt, int offset, PowerPCCPU *cpu,
@@ -659,8 +660,8 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq() : 1000000000;
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
-    unsigned int smp_threads = ms->smp.threads;
-    uint32_t vcpus_per_socket = smp_threads * ms->smp.cores;
+    unsigned int smp_threads = machine_topo_get_smp_threads(ms);
+    uint32_t vcpus_per_socket = smp_threads * machine_topo_get_smp_cores(ms);
     uint32_t pft_size_prop[] = {0, cpu_to_be32(spapr->htab_shift)};
     int compat_smt = MIN(smp_threads, ppc_compat_max_vthreads(cpu));
     SpaprDrc *drc;
@@ -866,7 +867,8 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
         cpu_to_be32(max_device_addr & 0xffffffff),
         cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE >> 32),
         cpu_to_be32(SPAPR_MEMORY_BLOCK_SIZE & 0xffffffff),
-        cpu_to_be32(ms->smp.max_cpus / ms->smp.threads),
+        cpu_to_be32(machine_topo_get_max_cpus(ms) /
+                    machine_topo_get_smp_threads(ms)),
     };
 
     _FDT(rtas = fdt_add_subnode(fdt, 0, "rtas"));
@@ -936,7 +938,7 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
      */
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-size", RTAS_MIN_SIZE +
                           RTAS_ERROR_LOG_MAX +
-                          ms->smp.max_cpus * sizeof(uint64_t) * 2 +
+                          machine_topo_get_max_cpus(ms) * sizeof(uint64_t) * 2 +
                           sizeof(uint64_t)));
     _FDT(fdt_setprop_cell(fdt, rtas, "rtas-error-log-max",
                           RTAS_ERROR_LOG_MAX));
@@ -2503,7 +2505,7 @@ static void spapr_validate_node_memory(MachineState *machine, Error **errp)
 /* find cpu slot in machine->possible_cpus by core_id */
 static CPUArchId *spapr_find_cpu_slot(MachineState *ms, uint32_t id, int *idx)
 {
-    int index = id / ms->smp.threads;
+    int index = id / machine_topo_get_smp_threads(ms);
 
     if (index >= ms->possible_cpus->len) {
         return NULL;
@@ -2522,7 +2524,7 @@ static void spapr_set_vsmt_mode(SpaprMachineState *spapr, Error **errp)
     bool vsmt_user = !!spapr->vsmt;
     int kvm_smt = kvmppc_smt_threads();
     int ret;
-    unsigned int smp_threads = ms->smp.threads;
+    unsigned int smp_threads = machine_topo_get_smp_threads(ms);
 
     if (!kvm_enabled() && (smp_threads > 1)) {
         error_setg(errp, "TCG cannot support more than 1 thread/core "
@@ -2594,9 +2596,9 @@ static void spapr_init_cpus(SpaprMachineState *spapr)
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     const char *type = spapr_get_cpu_core_type(machine->cpu_type);
     const CPUArchIdList *possible_cpus;
-    unsigned int smp_cpus = machine->smp.cpus;
-    unsigned int smp_threads = machine->smp.threads;
-    unsigned int max_cpus = machine->smp.max_cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
+    unsigned int smp_threads = machine_topo_get_smp_threads(machine);
+    unsigned int max_cpus = machine_topo_get_max_cpus(machine);
     int boot_cores_nr = smp_cpus / smp_threads;
     int i;
 
@@ -4002,7 +4004,7 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
     const char *type = object_get_typename(OBJECT(dev));
     CPUArchId *core_slot;
     int index;
-    unsigned int smp_threads = machine->smp.threads;
+    unsigned int smp_threads = machine_topo_get_smp_threads(machine);
 
     if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
         error_setg(errp, "CPU hotplug not supported for this machine");
@@ -4320,16 +4322,16 @@ spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
 
 static int64_t spapr_get_default_cpu_node_id(const MachineState *ms, int idx)
 {
-    return idx / ms->smp.cores % ms->numa_state->num_nodes;
+    return idx / machine_topo_get_smp_cores(ms) % ms->numa_state->num_nodes;
 }
 
 static const CPUArchIdList *spapr_possible_cpu_arch_ids(MachineState *machine)
 {
     int i;
-    unsigned int smp_threads = machine->smp.threads;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_threads = machine_topo_get_smp_threads(machine);
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     const char *core_type;
-    int spapr_max_cores = machine->smp.max_cpus / smp_threads;
+    int spapr_max_cores = machine_topo_get_max_cpus(machine) / smp_threads;
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
     if (!mc->has_hotpluggable_cpus) {
@@ -4500,7 +4502,8 @@ bool spapr_set_vcpu_id(PowerPCCPU *cpu, int cpu_index, Error **errp)
         error_setg(errp, "Can't create CPU with id %d in KVM", vcpu_id);
         error_append_hint(errp, "Adjust the number of cpus to %d "
                           "or try to raise the number of threads per core\n",
-                          vcpu_id * ms->smp.threads / spapr->vsmt);
+                          vcpu_id * machine_topo_get_smp_threads(ms) /
+                          spapr->vsmt);
         return false;
     }
 
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 3f664ea02ccf..e377299a28ee 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -279,14 +279,15 @@ static void rtas_ibm_get_system_parameter(PowerPCCPU *cpu,
 
     switch (parameter) {
     case RTAS_SYSPARM_SPLPAR_CHARACTERISTICS: {
-        g_autofree char *param_val = g_strdup_printf("MaxEntCap=%d,"
-                                                     "DesMem=%" PRIu64 ","
-                                                     "DesProcs=%d,"
-                                                     "MaxPlatProcs=%d",
-                                                     ms->smp.max_cpus,
-                                                     ms->ram_size / MiB,
-                                                     ms->smp.cpus,
-                                                     ms->smp.max_cpus);
+        g_autofree char *param_val =
+            g_strdup_printf("MaxEntCap=%d,"
+                            "DesMem=%" PRIu64 ","
+                            "DesProcs=%d,"
+                            "MaxPlatProcs=%d",
+                            machine_topo_get_max_cpus(ms),
+                            ms->ram_size / MiB,
+                            machine_topo_get_cpus(ms),
+                            machine_topo_get_max_cpus(ms));
         if (pcc->n_host_threads > 0) {
             /*
              * Add HostThrs property. This property is not present in PAPR but
-- 
2.34.1


