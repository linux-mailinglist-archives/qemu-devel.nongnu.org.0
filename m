Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6B4694127
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:30:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRV9J-0005Ju-DS; Mon, 13 Feb 2023 04:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV9H-0005JH-2H
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:23 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRV9C-0006LA-IR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676280558; x=1707816558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vbaVTuT6+7W70CdkNUx48hHLCJIcAqUo3+IdSQy6wfc=;
 b=Y6zQdIQMbENq28ANTWw2zzlsLI3y97JIeeQ4wNXJ7eOtmqaJrKw5BgtT
 IMBePg5Quzc9JoevIFCkRRBVPQ/3i246nG0Rwpk56U9QKE0OEzyx32rAA
 y+vLYrvkE6Z5TCDvhDipszlXHF/4iaDMGIDF3FFq7mwU0+mwaYcIppFG7
 4X+USBl5XCZDACsfre6daZeef3W+APFz9Xjq2JDjRSYDJc4/SnFadFf8P
 FdNd12Vv6Os6pgvUE2UE36dGMaThmN/MFA//JvXhplA4MmXXp8+uEe74A
 6OQv1nA5AXjHiD5KC7mAaWYbtbEdpyvbwxa/yzA7XY+FW+CNSyNWmhAoY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="318875633"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="318875633"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:29:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="792659950"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="792659950"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga004.jf.intel.com with ESMTP; 13 Feb 2023 01:29:13 -0800
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
 Robert Hoo <robert.hu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH RESEND 06/18] i386: Introduce module-level cpu topology to
 CPUX86State
Date: Mon, 13 Feb 2023 17:36:13 +0800
Message-Id: <20230213093625.158170-7-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhuocheng Ding <zhuocheng.ding@intel.com>

smp command has the "clusters" parameter but x86 hasn't supported that
level. Though "clusters" was introduced to help define L2 cache topology
[1], using cluster to define x86's L2 cache topology will cause the
compatibility problem:

Currently, x86 defaults that the L2 cache is shared in one core, which
actually implies a default setting "cores per L2 cache is 1" and
therefore implicitly defaults to having as many L2 caches as cores.

For example (i386 PC machine):
-smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 (*)

Considering the topology of the L2 cache, this (*) implicitly means "1
core per L2 cache" and "2 L2 caches per die".

If we use cluster to configure L2 cache topology with the new default
setting "clusters per L2 cache is 1", the above semantics will change
to "2 cores per cluster" and "1 cluster per L2 cache", that is, "2
cores per L2 cache".

So the same command (*) will cause changes in the L2 cache topology,
further affecting the performance of the virtual machine.

Therefore, x86 should only treat cluster as a cpu topology level and
avoid using it to change L2 cache by default for compatibility.

"cluster" in smp is the CPU topology level which is between "core" and
die.

For x86, the "cluster" in smp is corresponding to the module level [2],
which is above the core level. So use the "module" other than "cluster"
in i386 code.

And please note that x86 already has a cpu topology level also named
"cluster" [2], this level is at the upper level of the package. Here,
the cluster in x86 cpu topology is completely different from the
"clusters" as the smp parameter. After the module level is introduced,
the cluster as the smp parameter will actually refer to the module level
of x86.

[1]: 0d87178 (hw/core/machine: Introduce CPU cluster topology support)
[2]: SDM, vol.3, ch.9, 9.9.1 Hierarchical Mapping of Shared Resources.

Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Co-developed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c     | 1 +
 target/i386/cpu.c | 1 +
 target/i386/cpu.h | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index eaff4227bd68..ae1bb562d6e2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -306,6 +306,7 @@ void x86_cpu_pre_plug(HotplugHandler *hotplug_dev,
     init_topo_info(&topo_info, x86ms);
 
     env->nr_dies = ms->smp.dies;
+    env->nr_modules = ms->smp.clusters;
 
     /*
      * If APIC ID is not set,
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 4cda84eb96f1..61ec9a7499b8 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6781,6 +6781,7 @@ static void x86_cpu_initfn(Object *obj)
     CPUX86State *env = &cpu->env;
 
     env->nr_dies = 1;
+    env->nr_modules = 1;
     cpu_set_cpustate_pointers(cpu);
 
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index d4bc19577a21..f3afea765982 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1810,7 +1810,13 @@ typedef struct CPUArchState {
 
     TPRAccess tpr_access_type;
 
+    /* Number of dies per package. */
     unsigned nr_dies;
+    /*
+     * Number of modules per die. Module level in x86 cpu topology is
+     * corresponding to smp.clusters.
+     */
+    unsigned nr_modules;
 } CPUX86State;
 
 struct kvm_msrs;
-- 
2.34.1


