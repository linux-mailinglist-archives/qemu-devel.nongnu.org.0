Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCC56941EA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:50:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQJ-0002zs-Pb; Mon, 13 Feb 2023 04:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQ8-0002cI-Fb
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:48 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVQ2-0002o2-V1
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281602; x=1707817602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BydP1o1ekiw5I6MG/yQma39JCAMbtJKoPz6lfR2PK3M=;
 b=QDApEW3iAIpzPETkP5Ex76Yz+TcQ6GqtZ0KJ+0CPiw04vft8uCCiBWVS
 2XipzxCt1rusELOf/3DpU+KzUTB8ADmSnltqY9nWnvhw/CPYyqugQEYPs
 lSyzZqeqrdouBhwfRp+x5lTDq4uwvSrzO9eUwL4NycSl6dEGFjHCvaUMu
 kcsX5ur2Sdn3vyDtqyzu4yYlxxcZNxtGKabjEo2TBMREjYS2k4SBdF1ZR
 U1CP2auraZPT0Ok/iX9+H7Rn07nmTwN9kAojWW9Uvua/p1EBkxOaSECun
 /aeARiMfGIJtQq6+ItCbyk+MmBj8F1RSXIfb5y/XWuP5/L+i0+5aihhJB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487176"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487176"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760659"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760659"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:49 -0800
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
 Zhao Liu <zhao1.liu@intel.com>
Subject: [RFC 43/52] hw/machine: Rename MachineClass.smp_props to
 MachineClass.topo_props
Date: Mon, 13 Feb 2023 17:50:26 +0800
Message-Id: <20230213095035.158240-44-zhao1.liu@linux.intel.com>
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

MachineClass.topo_props is better to be compatible with both hybrid
topology and smp topology properties.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/acpi/aml-build.c         |  2 +-
 hw/arm/virt.c               |  6 +++---
 hw/core/machine-topo.c      | 12 ++++++------
 hw/i386/pc.c                |  4 ++--
 hw/i386/pc_piix.c           |  2 +-
 hw/i386/pc_q35.c            |  2 +-
 hw/ppc/spapr.c              |  2 +-
 hw/s390x/s390-virtio-ccw.c  |  2 +-
 include/hw/boards.h         |  2 +-
 tests/unit/test-smp-parse.c | 12 ++++++------
 10 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 693bd8833d10..51634cfd2776 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2030,7 +2030,7 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 0, socket_id, NULL, 0);
         }
 
-        if (mc->smp_props.clusters_supported && mc->smp_props.has_clusters) {
+        if (mc->topo_props.clusters_supported && mc->topo_props.has_clusters) {
             if (cpus->cpus[n].props.cluster_id != cluster_id) {
                 assert(cpus->cpus[n].props.cluster_id > cluster_id);
                 cluster_id = cpus->cpus[n].props.cluster_id;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ae65ba2c929c..5f0517423d8f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2687,7 +2687,7 @@ static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
         ms->possible_cpus->cpus[n].arch_id =
             virt_cpu_mp_affinity(vms, n);
 
-        assert(!mc->smp_props.dies_supported);
+        assert(!mc->topo_props.dies_supported);
         ms->possible_cpus->cpus[n].props.has_socket_id = true;
         ms->possible_cpus->cpus[n].props.socket_id =
             n / (smp_clusters * smp_cores * smp_threads);
@@ -3029,7 +3029,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
-    mc->smp_props.clusters_supported = true;
+    mc->topo_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
@@ -3280,7 +3280,7 @@ static void virt_machine_6_1_options(MachineClass *mc)
 
     virt_machine_6_2_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_props.prefer_sockets = true;
+    mc->topo_props.prefer_sockets = true;
     vmc->no_cpu_topology = true;
 
     /* qemu ITS was introduced with 6.2 */
diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index f9ab08a1252e..8540b473b8db 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -187,11 +187,11 @@ static char *cpu_hierarchy_to_string(MachineState *ms)
 
     g_string_append_printf(s, "sockets (%u)", machine_topo_get_sockets(ms));
 
-    if (mc->smp_props.dies_supported) {
+    if (mc->topo_props.dies_supported) {
         g_string_append_printf(s, " * dies (%u)", machine_topo_get_dies(ms));
     }
 
-    if (mc->smp_props.clusters_supported) {
+    if (mc->topo_props.clusters_supported) {
         g_string_append_printf(s, " * clusters (%u)",
                                machine_topo_get_clusters(ms));
     }
@@ -256,11 +256,11 @@ void machine_parse_smp_config(MachineState *ms,
      * If not supported by the machine, a topology parameter must be
      * omitted or specified equal to 1.
      */
-    if (!mc->smp_props.dies_supported && dies > 1) {
+    if (!mc->topo_props.dies_supported && dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
-    if (!mc->smp_props.clusters_supported && clusters > 1) {
+    if (!mc->topo_props.clusters_supported && clusters > 1) {
         error_setg(errp, "clusters not supported by this machine's CPU topology");
         return;
     }
@@ -276,7 +276,7 @@ void machine_parse_smp_config(MachineState *ms,
     } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-        if (mc->smp_props.prefer_sockets) {
+        if (mc->topo_props.prefer_sockets) {
             /* prefer sockets over cores before 6.2 */
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
@@ -315,7 +315,7 @@ void machine_parse_smp_config(MachineState *ms,
     ms->topo.smp.cores = cores;
     ms->topo.smp.threads = threads;
 
-    mc->smp_props.has_clusters = config->has_clusters;
+    mc->topo_props.has_clusters = config->has_clusters;
 
     /* sanity-check of the computed topology */
     if (sockets * dies * clusters * cores * threads != maxcpus) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c329df56ebd2..9a7ee0affd87 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1928,8 +1928,8 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = pc_machine_device_unplug_cb;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = true;
-    mc->smp_props.dies_supported = true;
-    mc->smp_props.clusters_supported = true;
+    mc->topo_props.dies_supported = true;
+    mc->topo_props.clusters_supported = true;
     mc->default_ram_id = "pc.ram";
 
     object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc66..ce725b3d2927 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -513,7 +513,7 @@ static void pc_i440fx_6_1_machine_options(MachineClass *m)
     pc_i440fx_6_2_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_props.prefer_sockets = true;
+    m->topo_props.prefer_sockets = true;
 }
 
 DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 66cd718b7081..94352f2b8ea8 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -432,7 +432,7 @@ static void pc_q35_6_1_machine_options(MachineClass *m)
     pc_q35_6_2_machine_options(m);
     compat_props_add(m->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     compat_props_add(m->compat_props, pc_compat_6_1, pc_compat_6_1_len);
-    m->smp_props.prefer_sockets = true;
+    m->topo_props.prefer_sockets = true;
 }
 
 DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6faad75afd70..b2e2420af870 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4801,7 +4801,7 @@ static void spapr_machine_6_1_class_options(MachineClass *mc)
     spapr_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
     smc->pre_6_2_numa_affinity = true;
-    mc->smp_props.prefer_sockets = true;
+    mc->topo_props.prefer_sockets = true;
 }
 
 DEFINE_SPAPR_MACHINE(6_1, "6.1", false);
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 9b5020a0d395..28cc3c048d78 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -912,7 +912,7 @@ static void ccw_machine_6_1_class_options(MachineClass *mc)
 {
     ccw_machine_6_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_6_1, hw_compat_6_1_len);
-    mc->smp_props.prefer_sockets = true;
+    mc->topo_props.prefer_sockets = true;
 }
 DEFINE_CCW_MACHINE(6_1, "6.1", false);
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 17be3485e823..48444ab7275b 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -288,7 +288,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
-    TopoCompatProps smp_props;
+    TopoCompatProps topo_props;
     const char *default_ram_id;
 
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index d6816f109084..b6dd5fafd3dd 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -500,11 +500,11 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
 
-    mc->smp_props.prefer_sockets = true;
+    mc->topo_props.prefer_sockets = true;
     check_parse(ms, &data->config, &data->expect_prefer_sockets,
                 data->expect_error, is_valid);
 
-    mc->smp_props.prefer_sockets = false;
+    mc->topo_props.prefer_sockets = false;
     check_parse(ms, &data->config, &data->expect_prefer_cores,
                 data->expect_error, is_valid);
 }
@@ -512,12 +512,12 @@ static void smp_parse_test(MachineState *ms, SMPTestData *data, bool is_valid)
 /* The parsed results of the unsupported parameters should be 1 */
 static void unsupported_params_init(const MachineClass *mc, SMPTestData *data)
 {
-    if (!mc->smp_props.dies_supported) {
+    if (!mc->topo_props.dies_supported) {
         data->expect_prefer_sockets.smp.dies = 1;
         data->expect_prefer_cores.smp.dies = 1;
     }
 
-    if (!mc->smp_props.clusters_supported) {
+    if (!mc->topo_props.clusters_supported) {
         data->expect_prefer_sockets.smp.clusters = 1;
         data->expect_prefer_cores.smp.clusters = 1;
     }
@@ -553,14 +553,14 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->smp_props.dies_supported = true;
+    mc->topo_props.dies_supported = true;
 }
 
 static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->smp_props.clusters_supported = true;
+    mc->topo_props.clusters_supported = true;
 }
 
 static void test_generic_valid(const void *opaque)
-- 
2.34.1


