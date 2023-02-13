Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4667D69420B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:56:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVPA-0000jf-JP; Mon, 13 Feb 2023 04:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVP1-0000fh-Mu
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:39 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOv-0002o2-4G
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281533; x=1707817533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BbPlHc8/O9/9mfNv0C8Qk5fw+NHT1MgudnqhciWVQpg=;
 b=WFt8VUgqDT068G204jxXgCFPzqT+2Y9ZK1jgokF347WEnMKbojKO1yJP
 nvXFI32vauuwx3+qFJ2z1oUvS84s8ih8i4UYYyJhGCei4jdviiJTwclJW
 xUqFViZGXG+bwN5S/Mn/ndSEIwKxin5rUfbE5olfZ7dAGZtAPeJUEb2Gd
 sBwjn5DQtKSbAy/2lPfofWktNJh5qRiXjIh5M97KP8uki03fh2fmLOSQK
 k+Py7MmD6eLxaVehaS4j/T+GPwKDipGNSJbMjA1rd535fPuOyLAal6kLk
 kSdPt3U3yCmcMhe/058CYe35Eai7kdIy6yuobfpZhSBD7AGs7nVmRzNjI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486880"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486880"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760601"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760601"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:04 -0800
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
Subject: [RFC 31/52] i386/cpu: Use CPUState.topo to replace X86CPUTopoInfo to
 get topology info
Date: Mon, 13 Feb 2023 17:50:14 +0800
Message-Id: <20230213095035.158240-32-zhao1.liu@linux.intel.com>
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

X86CPUTopoInfo is associated with the APIC ID, and strictly speaking, it
represents the topology levels and topology information of the APIC ID.

While CPUState.topo (TopologyState) represents the specific topology
information of the current CPU.

For smp topology, the topology information in X86CPUTopoInfo is same as
CPUState.topo, but it may be different for hybrid topology.

Therefore, X86CPUTopoInfo should be used for APIC ID related work, and
CPUState.topo should be preferred in general CPU topology related use
cases.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 target/i386/cpu.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2188097c3ee1..f626d74639ed 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -387,6 +387,7 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
                                       uint32_t *eax, uint32_t *ebx,
                                       uint32_t *ecx, uint32_t *edx)
 {
+    CPUState *cs = CPU(cpu);
     X86CPUTopoIDs topo_ids;
 
     x86_topo_ids_from_apicid(cpu->apic_id, topo_info, &topo_ids);
@@ -407,7 +408,7 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
      *  NOTE: CoreId is already part of apic_id. Just use it. We can
      *  use all the 8 bits to represent the core_id here.
      */
-    *ebx = ((topo_info->threads_per_core - 1) << 8) | (topo_ids.core_id & 0xFF);
+    *ebx = ((cs->topo.threads_per_core - 1) << 8) | (topo_ids.core_id & 0xFF);
 
     /*
      * CPUID_Fn8000001E_ECX [Node Identifiers] (NodeId)
@@ -431,7 +432,7 @@ static void encode_topo_cpuid8000001e(X86CPU *cpu, X86CPUTopoInfo *topo_info,
      * NodeId is combination of node and socket_id which is already decoded
      * in apic_id. Just use it by shifting.
      */
-    *ecx = ((topo_info->dies_per_pkg - 1) << 8) |
+    *ecx = ((cs->topo.dies_per_socket - 1) << 8) |
            ((cpu->apic_id >> apicid_die_offset(topo_info)) & 0xFF);
 
     *edx = 0;
@@ -5257,15 +5258,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
     uint32_t limit;
     uint32_t signature[3];
     X86CPUTopoInfo topo_info;
-    uint32_t cpus_per_pkg;
 
     topo_info.dies_per_pkg = cs->topo.dies_per_socket;
     topo_info.modules_per_die = cs->topo.clusters_per_die;
     topo_info.cores_per_module = cs->topo.cores_per_cluster;
     topo_info.threads_per_core = cs->topo.threads_per_core;
 
-    cpus_per_pkg = cs->topo.threads_per_socket;
-
     /* Calculate & apply limits for different index ranges */
     if (index >= 0xC0000000) {
         limit = env->cpuid_xlevel2;
@@ -5301,8 +5299,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
             *ecx |= CPUID_EXT_OSXSAVE;
         }
         *edx = env->features[FEAT_1_EDX];
-        if (cpus_per_pkg > 1) {
-            *ebx |= cpus_per_pkg << 16;
+        if (cs->topo.threads_per_socket > 1) {
+            *ebx |= cs->topo.threads_per_socket << 16;
             *edx |= CPUID_HT;
         }
         if (!cpu->enable_pmu) {
@@ -5339,9 +5337,8 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
              */
             if (*eax & 31) {
                 int host_vcpus_per_cache = 1 + ((*eax & 0x3FFC000) >> 14);
-                int vcpus_per_socket = cpus_per_pkg;
-                int cores_per_socket = cpus_per_pkg /
-                                       topo_info.threads_per_core;
+                int vcpus_per_socket = cs->topo.threads_per_socket;
+                int cores_per_socket = cs->topo.cores_per_socket;
                 if (cores_per_socket > 1) {
                     *eax &= ~0xFC000000;
                     *eax |= (pow2ceil(cores_per_socket) - 1) << 26;
@@ -5473,12 +5470,12 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
-            *ebx = topo_info.threads_per_core;
+            *ebx = cs->topo.threads_per_core;
             *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
             break;
         case 1:
             *eax = apicid_pkg_offset(&topo_info);
-            *ebx = cpus_per_pkg;
+            *ebx = cs->topo.threads_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
             break;
         default:
@@ -5509,17 +5506,17 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
         switch (count) {
         case 0:
             *eax = apicid_core_offset(&topo_info);
-            *ebx = topo_info.threads_per_core;
+            *ebx = cs->topo.threads_per_core;
             *ecx |= CPUID_TOPOLOGY_LEVEL_SMT;
             break;
         case 1:
             *eax = apicid_die_offset(&topo_info);
-            *ebx = cpus_per_pkg / topo_info.dies_per_pkg;
+            *ebx = cs->topo.threads_per_socket / cs->topo.dies_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_CORE;
             break;
         case 2:
             *eax = apicid_pkg_offset(&topo_info);
-            *ebx = cpus_per_pkg;
+            *ebx = cs->topo.threads_per_socket;
             *ecx |= CPUID_TOPOLOGY_LEVEL_DIE;
             break;
         default:
@@ -5744,7 +5741,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
          * discards multiple thread information if it is set.
          * So don't set it here for Intel to make Linux guests happy.
          */
-        if (cpus_per_pkg > 1) {
+        if (cs->topo.threads_per_socket > 1) {
             if (env->cpuid_vendor1 != CPUID_VENDOR_INTEL_1 ||
                 env->cpuid_vendor2 != CPUID_VENDOR_INTEL_2 ||
                 env->cpuid_vendor3 != CPUID_VENDOR_INTEL_3) {
@@ -5806,7 +5803,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
              *eax |= (cpu_x86_virtual_addr_width(env) << 8);
         }
         *ebx = env->features[FEAT_8000_0008_EBX];
-        if (cpus_per_pkg > 1) {
+        if (cs->topo.threads_per_socket > 1) {
             /*
              * Bits 15:12 is "The number of bits in the initial
              * Core::X86::Apic::ApicId[ApicId] value that indicate
@@ -5814,7 +5811,7 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
              * Bits 7:0 is "The number of threads in the package is NC+1"
              */
             *ecx = (apicid_pkg_offset(&topo_info) << 12) |
-                   (cpus_per_pkg - 1);
+                   (cs->topo.threads_per_socket - 1);
         } else {
             *ecx = 0;
         }
-- 
2.34.1


