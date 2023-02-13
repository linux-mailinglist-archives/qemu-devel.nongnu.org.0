Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265616941D5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:47:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOo-0008Mb-2q; Mon, 13 Feb 2023 04:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOB-0007Zh-N6
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:49 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVO6-0002o2-5h
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:44:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281482; x=1707817482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W/ae+xuw4P2OvU9WIFOFMTZ2QE9l8aTm3Jfz3/8dQQU=;
 b=bcrGmbwx9EwP6ya4VGFcTMF5SiiX4iYnfAaUkPNo07EYcvqyk/Ly13bd
 x7Gb3WtE7Uf5Biwgg2COellyNH/08oMQE3svobQsaOiahpy+qNuRkeOhD
 vL7ObkLANz8G7I++XxnB6qCrgLL2VNZD1wEzwEnja9tmIhlYwPd+5V8or
 UCMK8Jg0R2W2x+J3ckld/QvO/DTEIZ2AFaVoY49pcNA6GP8GOeQLq2iQ8
 0RSZiZG3IW8qGpShTfDZpwk5PeLtw6srJ3M9SF1WCk+t3csF5Yf35BeJ0
 lafEVV7TqXlpdmSOlRfgdNY7JcFz+two0PVbugQvNoKfQThr4l/YYL14h g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486714"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486714"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760409"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760409"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:25 -0800
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
 Zhao Liu <zhao1.liu@intel.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Vijai Kumar K <vijai@behindbytes.com>
Subject: [RFC 22/52] riscv: Replace MachineState.smp access with topology
 helpers
Date: Mon, 13 Feb 2023 17:50:05 +0800
Message-Id: <20230213095035.158240-23-zhao1.liu@linux.intel.com>
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

In the codes of riscv, it's straightforward to replace topology access
with wrapped generic interfaces.

Cc: Bin Meng <bin.meng@windriver.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alistair Francis <alistair.francis@wdc.com>
CC: Vijai Kumar K <vijai@behindbytes.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/riscv/microchip_pfsoc.c | 11 ++++++-----
 hw/riscv/numa.c            | 21 +++++++++++----------
 hw/riscv/opentitan.c       |  8 ++++----
 hw/riscv/shakti_c.c        |  2 +-
 hw/riscv/sifive_e.c        | 10 ++++++----
 hw/riscv/sifive_u.c        | 28 ++++++++++++++--------------
 hw/riscv/virt.c            | 24 +++++++++++++-----------
 7 files changed, 55 insertions(+), 49 deletions(-)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561f1..30295cce17e7 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -164,7 +164,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 
     object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
                             TYPE_RISCV_HART_ARRAY);
-    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
+    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts",
+                         machine_topo_get_cpus(ms) - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type",
                          TYPE_RISCV_CPU_SIFIVE_U54);
@@ -249,10 +250,10 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
 
     /* CLINT */
     riscv_aclint_swi_create(memmap[MICROCHIP_PFSOC_CLINT].base,
-        0, ms->smp.cpus, false);
+        0, machine_topo_get_cpus(ms), false);
     riscv_aclint_mtimer_create(
         memmap[MICROCHIP_PFSOC_CLINT].base + RISCV_ACLINT_SWI_SIZE,
-        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, machine_topo_get_cpus(ms),
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
 
@@ -276,11 +277,11 @@ static void microchip_pfsoc_soc_realize(DeviceState *dev, Error **errp)
                                 l2lim_mem);
 
     /* create PLIC hart topology configuration string */
-    plic_hart_config = riscv_plic_hart_config_string(ms->smp.cpus);
+    plic_hart_config = riscv_plic_hart_config_string(machine_topo_get_cpus(ms));
 
     /* PLIC */
     s->plic = sifive_plic_create(memmap[MICROCHIP_PFSOC_PLIC].base,
-        plic_hart_config, ms->smp.cpus, 0,
+        plic_hart_config, machine_topo_get_cpus(ms), 0,
         MICROCHIP_PFSOC_PLIC_NUM_SOURCES,
         MICROCHIP_PFSOC_PLIC_NUM_PRIORITIES,
         MICROCHIP_PFSOC_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index 472010256183..1fabdc42e767 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -37,13 +37,14 @@ int riscv_socket_count(const MachineState *ms)
 
 int riscv_socket_first_hartid(const MachineState *ms, int socket_id)
 {
-    int i, first_hartid = ms->smp.cpus;
+    int i, first_hartid, cpus = machine_topo_get_cpus(ms);
 
+    first_hartid = cpus;
     if (!numa_enabled(ms)) {
         return (!socket_id) ? 0 : -1;
     }
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         if (ms->possible_cpus->cpus[i].props.node_id != socket_id) {
             continue;
         }
@@ -52,18 +53,18 @@ int riscv_socket_first_hartid(const MachineState *ms, int socket_id)
         }
     }
 
-    return (first_hartid < ms->smp.cpus) ? first_hartid : -1;
+    return (first_hartid < cpus) ? first_hartid : -1;
 }
 
 int riscv_socket_last_hartid(const MachineState *ms, int socket_id)
 {
-    int i, last_hartid = -1;
+    int i, last_hartid = -1, cpus = machine_topo_get_cpus(ms);
 
     if (!numa_enabled(ms)) {
-        return (!socket_id) ? ms->smp.cpus - 1 : -1;
+        return (!socket_id) ? cpus - 1 : -1;
     }
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         if (ms->possible_cpus->cpus[i].props.node_id != socket_id) {
             continue;
         }
@@ -72,7 +73,7 @@ int riscv_socket_last_hartid(const MachineState *ms, int socket_id)
         }
     }
 
-    return (last_hartid < ms->smp.cpus) ? last_hartid : -1;
+    return (last_hartid < cpus) ? last_hartid : -1;
 }
 
 int riscv_socket_hart_count(const MachineState *ms, int socket_id)
@@ -80,7 +81,7 @@ int riscv_socket_hart_count(const MachineState *ms, int socket_id)
     int first_hartid, last_hartid;
 
     if (!numa_enabled(ms)) {
-        return (!socket_id) ? ms->smp.cpus : -1;
+        return (!socket_id) ? machine_topo_get_cpus(ms) : -1;
     }
 
     first_hartid = riscv_socket_first_hartid(ms, socket_id);
@@ -208,7 +209,7 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
     int64_t nidx = 0;
 
     if (ms->numa_state->num_nodes) {
-        nidx = idx / (ms->smp.cpus / ms->numa_state->num_nodes);
+        nidx = idx / (machine_topo_get_cpus(ms) / ms->numa_state->num_nodes);
         if (ms->numa_state->num_nodes <= nidx) {
             nidx = ms->numa_state->num_nodes - 1;
         }
@@ -220,7 +221,7 @@ int64_t riscv_numa_get_default_cpu_node_id(const MachineState *ms, int idx)
 const CPUArchIdList *riscv_numa_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
-    unsigned int max_cpus = ms->smp.max_cpus;
+    unsigned int max_cpus = machine_topo_get_max_cpus(ms);
 
     if (ms->possible_cpus) {
         assert(ms->possible_cpus->len == max_cpus);
diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index 353f030d80c1..fb59c43dcc08 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -143,11 +143,11 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     LowRISCIbexSoCState *s = RISCV_IBEX_SOC(dev_soc);
     MemoryRegion *sys_mem = get_system_memory();
-    int i;
+    int i, cpus = machine_topo_get_cpus(ms);
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
+    object_property_set_int(OBJECT(&s->cpus), "num-harts", cpus,
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", s->resetvec,
                             &error_abort);
@@ -186,10 +186,10 @@ static void lowrisc_ibex_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->plic), 0, memmap[IBEX_DEV_PLIC].base);
 
-    for (i = 0; i < ms->smp.cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         CPUState *cpu = qemu_get_cpu(i);
 
-        qdev_connect_gpio_out(DEVICE(&s->plic), ms->smp.cpus + i,
+        qdev_connect_gpio_out(DEVICE(&s->plic), cpus + i,
                               qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EXT));
     }
 
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index e43cc9445cb1..34499510e2f0 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -110,7 +110,7 @@ static void shakti_c_soc_state_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&sss->cpus), &error_abort);
 
     sss->plic = sifive_plic_create(shakti_c_memmap[SHAKTI_C_PLIC].base,
-        (char *)SHAKTI_C_PLIC_HART_CONFIG, ms->smp.cpus, 0,
+        (char *)SHAKTI_C_PLIC_HART_CONFIG, machine_topo_get_cpus(ms), 0,
         SHAKTI_C_PLIC_NUM_SOURCES,
         SHAKTI_C_PLIC_NUM_PRIORITIES,
         SHAKTI_C_PLIC_PRIORITY_BASE,
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 3e3f4b0088ca..ca3a7a0877cd 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -178,7 +178,8 @@ static void sifive_e_soc_init(Object *obj)
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus, TYPE_RISCV_HART_ARRAY);
-    object_property_set_int(OBJECT(&s->cpus), "num-harts", ms->smp.cpus,
+    object_property_set_int(OBJECT(&s->cpus), "num-harts",
+                            machine_topo_get_cpus(ms),
                             &error_abort);
     object_property_set_int(OBJECT(&s->cpus), "resetvec", 0x1004, &error_abort);
     object_initialize_child(obj, "riscv.sifive.e.gpio0", &s->gpio,
@@ -191,6 +192,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
     const MemMapEntry *memmap = sifive_e_memmap;
     SiFiveESoCState *s = RISCV_E_SOC(dev);
     MemoryRegion *sys_mem = get_system_memory();
+    unsigned int cpus = machine_topo_get_cpus(ms);
 
     object_property_set_str(OBJECT(&s->cpus), "cpu-type", ms->cpu_type,
                             &error_abort);
@@ -204,7 +206,7 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_E_DEV_PLIC].base,
-        (char *)SIFIVE_E_PLIC_HART_CONFIG, ms->smp.cpus, 0,
+        (char *)SIFIVE_E_PLIC_HART_CONFIG, cpus, 0,
         SIFIVE_E_PLIC_NUM_SOURCES,
         SIFIVE_E_PLIC_NUM_PRIORITIES,
         SIFIVE_E_PLIC_PRIORITY_BASE,
@@ -215,10 +217,10 @@ static void sifive_e_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_E_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_E_DEV_PLIC].size);
     riscv_aclint_swi_create(memmap[SIFIVE_E_DEV_CLINT].base,
-        0, ms->smp.cpus, false);
+        0, cpus, false);
     riscv_aclint_mtimer_create(memmap[SIFIVE_E_DEV_CLINT].base +
             RISCV_ACLINT_SWI_SIZE,
-        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
     create_unimplemented_device("riscv.sifive.e.aon",
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda5d..c7f969510209 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -99,7 +99,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     MachineState *ms = MACHINE(s);
     uint64_t mem_size = ms->ram_size;
     void *fdt;
-    int cpu, fdt_size;
+    int cpu, fdt_size, num_cpus = machine_topo_get_cpus(ms);
     uint32_t *cells;
     char *nodename;
     uint32_t plic_phandle, prci_phandle, gpio_phandle, phandle = 1;
@@ -175,7 +175,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#size-cells", 0x0);
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
 
-    for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
+    for (cpu = num_cpus - 1; cpu >= 0; cpu--) {
         int cpu_phandle = phandle++;
         nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         char *intc = g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
@@ -207,8 +207,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         g_free(nodename);
     }
 
-    cells =  g_new0(uint32_t, ms->smp.cpus * 4);
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    cells =  g_new0(uint32_t, num_cpus * 4);
+    for (cpu = 0; cpu < num_cpus; cpu++) {
         nodename =
             g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
@@ -227,7 +227,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         0x0, memmap[SIFIVE_U_DEV_CLINT].base,
         0x0, memmap[SIFIVE_U_DEV_CLINT].size);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
-        cells, ms->smp.cpus * sizeof(uint32_t) * 4);
+        cells, num_cpus * sizeof(uint32_t) * 4);
     g_free(cells);
     g_free(nodename);
 
@@ -258,8 +258,8 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
     g_free(nodename);
 
     plic_phandle = phandle++;
-    cells =  g_new0(uint32_t, ms->smp.cpus * 4 - 2);
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    cells =  g_new0(uint32_t, machine_topo_get_cpus(ms) * 4 - 2);
+    for (cpu = 0; cpu < machine_topo_get_cpus(ms); cpu++) {
         nodename =
             g_strdup_printf("/cpus/cpu@%d/interrupt-controller", cpu);
         uint32_t intc_phandle = qemu_fdt_get_phandle(fdt, nodename);
@@ -283,7 +283,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
         (char **)&plic_compat, ARRAY_SIZE(plic_compat));
     qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
     qemu_fdt_setprop(fdt, nodename, "interrupts-extended",
-        cells, (ms->smp.cpus * 4 - 2) * sizeof(uint32_t));
+        cells, (machine_topo_get_cpus(ms) * 4 - 2) * sizeof(uint32_t));
     qemu_fdt_setprop_cells(fdt, nodename, "reg",
         0x0, memmap[SIFIVE_U_DEV_PLIC].base,
         0x0, memmap[SIFIVE_U_DEV_PLIC].size);
@@ -797,10 +797,10 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     MemoryRegion *l2lim_mem = g_new(MemoryRegion, 1);
     char *plic_hart_config;
-    int i, j;
+    int i, j, cpus = machine_topo_get_cpus(ms);
     NICInfo *nd = &nd_table[0];
 
-    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", ms->smp.cpus - 1);
+    qdev_prop_set_uint32(DEVICE(&s->u_cpus), "num-harts", cpus - 1);
     qdev_prop_set_uint32(DEVICE(&s->u_cpus), "hartid-base", 1);
     qdev_prop_set_string(DEVICE(&s->u_cpus), "cpu-type", s->cpu_type);
     qdev_prop_set_uint64(DEVICE(&s->u_cpus), "resetvec", 0x1004);
@@ -837,11 +837,11 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
                                 l2lim_mem);
 
     /* create PLIC hart topology configuration string */
-    plic_hart_config = riscv_plic_hart_config_string(ms->smp.cpus);
+    plic_hart_config = riscv_plic_hart_config_string(cpus);
 
     /* MMIO */
     s->plic = sifive_plic_create(memmap[SIFIVE_U_DEV_PLIC].base,
-        plic_hart_config, ms->smp.cpus, 0,
+        plic_hart_config, cpus, 0,
         SIFIVE_U_PLIC_NUM_SOURCES,
         SIFIVE_U_PLIC_NUM_PRIORITIES,
         SIFIVE_U_PLIC_PRIORITY_BASE,
@@ -857,10 +857,10 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sifive_uart_create(system_memory, memmap[SIFIVE_U_DEV_UART1].base,
         serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
     riscv_aclint_swi_create(memmap[SIFIVE_U_DEV_CLINT].base, 0,
-        ms->smp.cpus, false);
+        cpus, false);
     riscv_aclint_mtimer_create(memmap[SIFIVE_U_DEV_CLINT].base +
             RISCV_ACLINT_SWI_SIZE,
-        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
+        RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, cpus,
         RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
         CLINT_TIMEBASE_FREQ, false);
 
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index b81081c70b1c..4b0a3dab5ec1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -506,16 +506,17 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     char *imsic_name;
     MachineState *ms = MACHINE(s);
     int socket_count = riscv_socket_count(ms);
-    uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
+    uint32_t imsic_max_hart_per_socket, imsic_guest_bits, cpus;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
 
+    cpus = machine_topo_get_cpus(ms);
     *msi_m_phandle = (*phandle)++;
     *msi_s_phandle = (*phandle)++;
-    imsic_cells = g_new0(uint32_t, ms->smp.cpus * 2);
+    imsic_cells = g_new0(uint32_t, cpus * 2);
     imsic_regs = g_new0(uint32_t, socket_count * 4);
 
     /* M-level IMSIC node */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < cpus; cpu++) {
         imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
     }
@@ -544,7 +545,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
         NULL, 0);
     qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+        imsic_cells, cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
         socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
@@ -562,7 +563,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     g_free(imsic_name);
 
     /* S-level IMSIC node */
-    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
+    for (cpu = 0; cpu < cpus; cpu++) {
         imsic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
         imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
     }
@@ -593,7 +594,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(ms->fdt, imsic_name, "msi-controller",
         NULL, 0);
     qemu_fdt_setprop(ms->fdt, imsic_name, "interrupts-extended",
-        imsic_cells, ms->smp.cpus * sizeof(uint32_t) * 2);
+        imsic_cells, cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(ms->fdt, imsic_name, "reg", imsic_regs,
         socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(ms->fdt, imsic_name, "riscv,num-ids",
@@ -732,7 +733,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     char *clust_name;
     int socket, phandle_pos;
     MachineState *ms = MACHINE(s);
-    uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
+    uint32_t msi_m_phandle = 0, msi_s_phandle = 0, cpus;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
     int socket_count = riscv_socket_count(ms);
 
@@ -743,9 +744,10 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
 
-    intc_phandles = g_new0(uint32_t, ms->smp.cpus);
+    cpus = machine_topo_get_cpus(ms);
+    intc_phandles = g_new0(uint32_t, cpus);
 
-    phandle_pos = ms->smp.cpus;
+    phandle_pos = cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
@@ -776,7 +778,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         *msi_pcie_phandle = msi_s_phandle;
     }
 
-    phandle_pos = ms->smp.cpus;
+    phandle_pos = cpus;
     for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
@@ -1113,7 +1115,7 @@ static FWCfgState *create_fw_cfg(const MachineState *ms)
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16,
                                   &address_space_memory);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine_topo_get_cpus(ms));
 
     return fw_cfg;
 }
-- 
2.34.1


