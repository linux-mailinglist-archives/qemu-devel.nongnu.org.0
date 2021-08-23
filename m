Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945A3F4310
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 03:28:15 +0200 (CEST)
Received: from localhost ([::1]:48410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHyl4-0004nS-F6
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 21:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mHykH-000496-CX
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:27:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:55464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jingqi.liu@intel.com>)
 id 1mHykE-0003bB-6t
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:27:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="217017009"
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; d="scan'208";a="217017009"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2021 18:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,343,1620716400"; d="scan'208";a="492386053"
Received: from icx-hcc-jingqi.sh.intel.com ([10.239.48.6])
 by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2021 18:27:15 -0700
From: Jingqi Liu <jingqi.liu@intel.com>
To: imammedo@redhat.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, ehabkost@redhat.com, richard.henderson@linaro.org
Subject: [PATCH v3] hw/i386/acpi-build: Get NUMA information from struct
 NumaState
Date: Mon, 23 Aug 2021 09:12:54 +0800
Message-Id: <20210823011254.28506-1-jingqi.liu@intel.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=jingqi.liu@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jingqi Liu <jingqi.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commits aa57020774b ("numa: move numa global variable
nb_numa_nodes into MachineState") and 7e721e7b10e ("numa: move
numa global variable numa_info into MachineState"), we can get
NUMA information completely from MachineState::numa_state.

Remove PCMachineState::numa_nodes and PCMachineState::node_mem,
since they are just copied from MachineState::numa_state.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jingqi Liu <jingqi.liu@intel.com>
---
 hw/i386/acpi-build.c | 12 +++++++-----
 hw/i386/pc.c         |  9 ---------
 include/hw/i386/pc.h |  4 ----
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..e3c9ad011e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1902,6 +1902,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     X86MachineState *x86ms = X86_MACHINE(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
     PCMachineState *pcms = PC_MACHINE(machine);
+    int nb_numa_nodes = machine->numa_state->num_nodes;
+    NodeInfo *numa_info = machine->numa_state->nodes;
     ram_addr_t hotplugabble_address_space_size =
         object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
                                 NULL);
@@ -1945,9 +1947,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     next_base = 0;
     numa_start = table_data->len;
 
-    for (i = 1; i < pcms->numa_nodes + 1; ++i) {
+    for (i = 1; i < nb_numa_nodes + 1; ++i) {
         mem_base = next_base;
-        mem_len = pcms->node_mem[i - 1];
+        mem_len = numa_info[i - 1].node_mem;
         next_base = mem_base + mem_len;
 
         /* Cut out the 640K hole */
@@ -1995,7 +1997,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     }
 
     slots = (table_data->len - numa_start) / sizeof *numamem;
-    for (; slots < pcms->numa_nodes + 2; slots++) {
+    for (; slots < nb_numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
     }
@@ -2011,7 +2013,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     if (hotplugabble_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
         build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, pcms->numa_nodes - 1,
+                          hotplugabble_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
@@ -2513,7 +2515,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         }
     }
 #endif
-    if (pcms->numa_nodes) {
+    if (machine->numa_state->num_nodes) {
         acpi_add_table(table_offsets, tables_blob);
         build_srat(tables_blob, tables->linker, machine);
         if (machine->numa_state->have_numa_distance) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c2b9d62a35..adbc348488 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -800,18 +800,9 @@ void pc_machine_done(Notifier *notifier, void *data)
 
 void pc_guest_info_init(PCMachineState *pcms)
 {
-    int i;
-    MachineState *ms = MACHINE(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
 
     x86ms->apic_xrupt_override = true;
-    pcms->numa_nodes = ms->numa_state->num_nodes;
-    pcms->node_mem = g_malloc0(pcms->numa_nodes *
-                                    sizeof *pcms->node_mem);
-    for (i = 0; i < ms->numa_state->num_nodes; i++) {
-        pcms->node_mem[i] = ms->numa_state->nodes[i].node_mem;
-    }
-
     pcms->machine_done.notify = pc_machine_done;
     qemu_add_machine_init_done_notifier(&pcms->machine_done);
 }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 88dffe7517..31b334e0a4 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -47,10 +47,6 @@ typedef struct PCMachineState {
     bool default_bus_bypass_iommu;
     uint64_t max_fw_size;
 
-    /* NUMA information: */
-    uint64_t numa_nodes;
-    uint64_t *node_mem;
-
     /* ACPI Memory hotplug IO base address */
     hwaddr memhp_io_base;
 } PCMachineState;
-- 
2.21.3


