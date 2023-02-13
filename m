Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FFC694218
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:57:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQI-0002zi-U7; Mon, 13 Feb 2023 04:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPa-0001b7-IN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:20 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPU-0002o2-MQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281568; x=1707817568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LbIBx9OtUQnbbe6kZCQOlJq8E9y1jdZtSG9kZ/TN2oM=;
 b=BxKAVdwXpeg64VmBwjN72KVFkuxcdBrrShOuY0LkD0rhBiML2c+eAR9L
 p6Bf94BTCjeJoGs5VAnINL2vGQhSMwFSzviEGIjfw/yYllpbEScio40Oz
 LHpjSEjPJMW4faPQ+U1kM8k3pgUSsmyX7wLJcsUFmTvClqXQyAigWAHxU
 4du3svBgyjebYSUivPLRG4PWmkQgV4pwzX/GwNFMSh/j0YZ/drv2pHTMw
 N89kTvv2BD3aqlb8MVr4DXYn2xGlL1S8JZP2tBAM+WW1v69Cb9VhvJ+Fs
 5xJ531QjruO4rKexmL0Hkn9j93hrFY3/VrIlYO7FmR7kd9ghtbZ5BptS/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487067"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487067"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760633"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760633"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:30 -0800
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
Subject: [RFC 38/52] i386: Introduce hybrid_core_type to CPUX86State
Date: Mon, 13 Feb 2023 17:50:21 +0800
Message-Id: <20230213095035.158240-39-zhao1.liu@linux.intel.com>
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

Currently, x86 only supports two hybrid core types: Intel Core and Intel
Atom [1], so add the core type definations for Intel Core and Intel
Atom, and add hybrid_core_type in CPUX86State.

[1]: SDM, vol.2, ch.3, 3.3 Instructions (A-L), CPUID, CPUID.1AH:EAX[bits
     31-24].

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c     | 4 ++++
 target/i386/cpu.c | 1 +
 target/i386/cpu.h | 8 ++++++++
 3 files changed, 13 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index a09df6d33fff..f381fdc43180 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -383,6 +383,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     CPUArchId *cpu_slot;
     X86CPUTopoIDs topo_ids;
     X86CPU *cpu = X86_CPU(dev);
+    CPUX86State *env = &cpu->env;
     MachineState *ms = MACHINE(hotplug_dev);
     X86MachineState *x86ms = X86_MACHINE(hotplug_dev);
     X86ApicidTopoInfo apicid_topo;
@@ -564,6 +565,9 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
         return;
     }
 
+    env->hybrid_core_type =
+        machine_topo_get_hybrid_core_type(ms, cpu->cluster_id, cpu->core_id);
+
     cs = CPU(cpu);
     cs->cpu_index = idx;
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 7d6722ab3292..266e981b79e2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6845,6 +6845,7 @@ static void x86_cpu_initfn(Object *obj)
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
     CPUX86State *env = &cpu->env;
 
+    env->hybrid_core_type = INVALID_HYBRID_TYPE;
     cpu_set_cpustate_pointers(cpu);
 
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 30b2aa6ab10d..bb4e370f9768 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1543,6 +1543,12 @@ typedef struct CPUCaches {
         CPUCacheInfo *l3_cache;
 } CPUCaches;
 
+typedef enum {
+    INVALID_HYBRID_TYPE = 0,
+    INTEL_ATOM_TYPE,
+    INTEL_CORE_TYPE,
+} X86HybridCoreType;
+
 typedef struct HVFX86LazyFlags {
     target_ulong result;
     target_ulong auxbits;
@@ -1825,6 +1831,8 @@ typedef struct CPUArchState {
     uint32_t umwait;
 
     TPRAccess tpr_access_type;
+
+    X86HybridCoreType hybrid_core_type;
 } CPUX86State;
 
 struct kvm_msrs;
-- 
2.34.1


