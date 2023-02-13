Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5310E69420A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:55:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOp-0008V8-Vi; Mon, 13 Feb 2023 04:45:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOd-000803-9h
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:17 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOW-0002n2-7u
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281508; x=1707817508;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gT65kKalef/lSQOrzqa77fjAKtL8Hxc1ZmfBiu/DCIY=;
 b=ByU9WF3C53jqXKX0kdmGKzTfdrna+5juchDv/4mom4ztvKIoa0CEQPoC
 Uqm88E21xpK3LeHKYjTnJFgQizVn9DVQqcVluTjE7QUhYJWQSL729zjVI
 OcfC9nNCoRx3e09nTww9anj6P7WJMv9qgxOCKT553OiNPSQ487w8qDPGU
 Gj2whBfQot+lVDtGHBESCuSK3HMmSfnep9wm/VZw1YJEA4x+I8Oh9YYhU
 vlM9LxdBy5LOLEBEUasl64VBshzl4Gk5VvLrEFfQ3MMkC1UVca5fi2lZv
 JXprIcyQBKzWvMocVlaVWaKLt5czcD3is29nis/c1zYgvgHpt4Juc8uDv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486789"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486789"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760574"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760574"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:43 -0800
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
 Zhao Liu <zhao1.liu@intel.com>, Helge Deller <deller@gmx.de>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Jia Liu <proljc@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [RFC 26/52] hw: Replace MachineState.smp access with topology helpers
 for all remaining archs
Date: Mon, 13 Feb 2023 17:50:09 +0800
Message-Id: <20230213095035.158240-27-zhao1.liu@linux.intel.com>
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

For alpha, hppa, intc, openrisc, sparc, sparc64, xtensa, since they
don't ask for "threads per core" or "cores per cluster", it's
straightforward to replace topology access with wrapped generic
interfaces.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Helge Deller <deller@gmx.de>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Greg Kurz <groug@kaod.org>
Cc: Jia Liu <proljc@gmail.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/alpha/dp264.c             | 2 +-
 hw/hppa/machine.c            | 6 +++---
 hw/intc/spapr_xive_kvm.c     | 3 ++-
 hw/intc/xics_kvm.c           | 3 ++-
 hw/openrisc/openrisc_sim.c   | 2 +-
 hw/openrisc/virt.c           | 2 +-
 hw/sparc/sun4m.c             | 4 ++--
 hw/sparc64/sun4u.c           | 6 ++++--
 hw/xtensa/sim.c              | 2 +-
 hw/xtensa/xtfpga.c           | 2 +-
 target/openrisc/sys_helper.c | 2 +-
 11 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 4161f559a7bc..9d0f74d72ede 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -60,7 +60,7 @@ static void clipper_init(MachineState *machine)
     char *palcode_filename;
     uint64_t palcode_entry;
     uint64_t kernel_entry, kernel_low;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
 
     /* Create up to 4 cpus.  */
     memset(cpus, 0, sizeof(cpus));
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 7ac68c943f40..9a3189674ad9 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -124,7 +124,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     uint64_t val;
 
     fw_cfg = fw_cfg_init_mem(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, machine_topo_get_cpus(ms));
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
 
@@ -188,7 +188,7 @@ static void machine_hppa_init(MachineState *machine)
     MemoryRegion *rom_region;
     MemoryRegion *cpu_region;
     long i;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     SysBusDevice *s;
 
     /* Create CPUs.  */
@@ -410,7 +410,7 @@ static void machine_hppa_init(MachineState *machine)
 
 static void hppa_machine_reset(MachineState *ms, ShutdownCause reason)
 {
-    unsigned int smp_cpus = ms->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(ms);
     int i;
 
     qemu_devices_reset(reason);
diff --git a/hw/intc/spapr_xive_kvm.c b/hw/intc/spapr_xive_kvm.c
index 61fe7bd2d322..bdb021abceb2 100644
--- a/hw/intc/spapr_xive_kvm.c
+++ b/hw/intc/spapr_xive_kvm.c
@@ -174,7 +174,8 @@ int kvmppc_xive_cpu_connect(XiveTCTX *tctx, Error **errp)
                          vcpu_id);
         if (ret == -ENOSPC) {
             error_append_hint(errp, "Try -smp maxcpus=N with N < %u\n",
-                              MACHINE(qdev_get_machine())->smp.max_cpus);
+                              machine_topo_get_max_cpus(
+                                  MACHINE(qdev_get_machine())));
         }
         return ret;
     }
diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
index 9719d98a179e..f45cc0af8b1e 100644
--- a/hw/intc/xics_kvm.c
+++ b/hw/intc/xics_kvm.c
@@ -169,7 +169,8 @@ void icp_kvm_realize(DeviceState *dev, Error **errp)
                    vcpu_id, strerror(errno));
         if (errno == ENOSPC) {
             error_append_hint(&local_err, "Try -smp maxcpus=N with N < %u\n",
-                              MACHINE(qdev_get_machine())->smp.max_cpus);
+                              machine_topo_get_max_cpus(
+                                  MACHINE(qdev_get_machine())));
         }
         error_propagate(errp, local_err);
         return;
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 35da123aef4c..98dcbde924a8 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -291,7 +291,7 @@ static void openrisc_sim_init(MachineState *machine)
     MemoryRegion *ram;
     hwaddr load_addr;
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
 
     assert(smp_cpus >= 1 && smp_cpus <= OR1KSIM_CPUS_MAX);
     for (n = 0; n < smp_cpus; n++) {
diff --git a/hw/openrisc/virt.c b/hw/openrisc/virt.c
index f8a68a6a6b1f..730013142ca9 100644
--- a/hw/openrisc/virt.c
+++ b/hw/openrisc/virt.c
@@ -476,7 +476,7 @@ static void openrisc_virt_init(MachineState *machine)
     MemoryRegion *ram;
     hwaddr load_addr;
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
     int32_t pic_phandle;
 
     assert(smp_cpus >= 1 && smp_cpus <= VIRT_CPUS_MAX);
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index d9288326d6ac..09f4beaa01df 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -829,8 +829,8 @@ static void sun4m_hw_init(MachineState *machine)
     FWCfgState *fw_cfg;
     DeviceState *dev, *ms_kb_orgate, *serial_orgate;
     SysBusDevice *s;
-    unsigned int smp_cpus = machine->smp.cpus;
-    unsigned int max_cpus = machine->smp.max_cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
+    unsigned int max_cpus = machine_topo_get_max_cpus(machine);
     HostMemoryBackend *ram_memdev = machine->memdev;
     NICInfo *nd = &nd_table[0];
 
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 387181ff7762..c0350311e405 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -711,8 +711,10 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
                                 &FW_CFG_IO(dev)->comb_iomem);
 
     fw_cfg = FW_CFG(dev);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)machine->smp.cpus);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)machine->smp.max_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS,
+                   (uint16_t)machine_topo_get_cpus(machine));
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS,
+                   (uint16_t)machine_topo_get_max_cpus(machine));
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MACHINE_ID, hwdef->machine_id);
     fw_cfg_add_i64(fw_cfg, FW_CFG_KERNEL_ADDR, kernel_entry);
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 946c71cb5b5c..dc2f95554311 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -58,7 +58,7 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
     ram_addr_t ram_size = machine->ram_size;
     int n;
 
-    for (n = 0; n < machine->smp.cpus; n++) {
+    for (n = 0; n < machine_topo_get_cpus(machine); n++) {
         cpu = XTENSA_CPU(cpu_create(machine->cpu_type));
         env = &cpu->env;
 
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index 2a5556a35f50..70c308dd1bf6 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -239,7 +239,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
     const unsigned system_io_size = 224 * MiB;
     uint32_t freq = 10000000;
     int n;
-    unsigned int smp_cpus = machine->smp.cpus;
+    unsigned int smp_cpus = machine_topo_get_cpus(machine);
 
     if (smp_cpus > 1) {
         mx_pic = xtensa_mx_pic_init(31);
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index ec145960e3e5..3f3e57291035 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -262,7 +262,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
         return cpu->parent_obj.cpu_index;
 
     case TO_SPR(0, 129): /* NUMCORES */
-        return ms->smp.max_cpus;
+        return machine_topo_get_max_cpus(ms);
 
     case TO_SPR(0, 1024) ... TO_SPR(0, 1024 + (16 * 32)): /* Shadow GPRs */
         idx = (spr - 1024);
-- 
2.34.1


