Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5936941F5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:51:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVOo-0008Me-7q; Mon, 13 Feb 2023 04:45:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOk-0008DF-O2
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:22 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVOg-0002o2-0J
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281518; x=1707817518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KMrei+EtNL/UOGEdOXu/70OFLOch1lKNzTCYU64RxRc=;
 b=XY4YUIk8sWXnkopEPgpBHxBKTdB3Tsd2Gw7SHY5QgCQVxTCYUMH0f8jX
 UFLVW0FV65KSMz+Pm26r/nrFYwRoeIZS2foF9oaSUjf9WM+1CJ/ef8+YM
 KfbgOuXcfrtGvC5Oxdemd6uTC4FznUaiBTeUQUouKn3EcpLaUgRikvCP8
 WWnVlqlfYmjTY+KSjaoXcEiA8+sN6AmYkVbV7X14eEjA9cdBAzW7lPuy/
 BUrBbdSRmSwvBFuSAV6x0PEkSAhAIFBbDPylIQgocvYInP2kZKgJFMVNM
 JhYAMmE6RsLvPCbTP5vvmGR4wf9FfieAHoHgTDlrDv7MfbC8OCBSU8bGk w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486814"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:44:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760582"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760582"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:44:52 -0800
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
Subject: [RFC 28/52] hw/core/machine: Remove support of MachineState.smp
Date: Mon, 13 Feb 2023 17:50:11 +0800
Message-Id: <20230213095035.158240-29-zhao1.liu@linux.intel.com>
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

Now the all uses of MachineState.smp are replaced by MachineState.topo.
It's time to completely remove smp field.

And clean up the struct CpuTopology in include/hw/boards.h.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c        |  8 --------
 hw/core/machine.c             |  9 +--------
 include/hw/boards.h           | 23 +----------------------
 include/hw/cpu/cpu-topology.h | 11 +++--------
 4 files changed, 5 insertions(+), 46 deletions(-)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index cdbe65ffd9fd..12c05510c1b5 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -307,14 +307,6 @@ void machine_parse_smp_config(MachineState *ms,
     maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    ms->smp.cpus = cpus;
-    ms->smp.sockets = sockets;
-    ms->smp.dies = dies;
-    ms->smp.clusters = clusters;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
-    ms->smp.max_cpus = maxcpus;
-
     ms->topo.cpus = cpus;
     ms->topo.max_cpus = maxcpus;
     ms->topo.smp.sockets = sockets;
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 56e796c18873..fad990f49b03 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1093,16 +1093,9 @@ static void machine_initfn(Object *obj)
     }
 
     /* default to mc->default_cpus */
-    ms->smp.cpus = mc->default_cpus;
-    ms->smp.max_cpus = mc->default_cpus;
-    ms->smp.sockets = 1;
-    ms->smp.dies = 1;
-    ms->smp.clusters = 1;
-    ms->smp.cores = 1;
-    ms->smp.threads = 1;
-
     ms->topo.cpus = mc->default_cpus;
     ms->topo.max_cpus = mc->default_cpus;
+
     ms->topo.topo_type = CPU_TOPO_TYPE_SMP;
     ms->topo.smp.sockets = 1;
     ms->topo.smp.dies = 1;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 78e52af38cb1..9364c90d5f1a 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -299,26 +299,6 @@ typedef struct DeviceMemoryState {
     MemoryRegion mr;
 } DeviceMemoryState;
 
-/**
- * CpuTopology:
- * @cpus: the number of present logical processors on the machine
- * @sockets: the number of sockets on the machine
- * @dies: the number of dies in one socket
- * @clusters: the number of clusters in one die
- * @cores: the number of cores in one cluster
- * @threads: the number of threads in one core
- * @max_cpus: the maximum number of logical processors on the machine
- */
-typedef struct CpuTopology {
-    unsigned int cpus;
-    unsigned int sockets;
-    unsigned int dies;
-    unsigned int clusters;
-    unsigned int cores;
-    unsigned int threads;
-    unsigned int max_cpus;
-} CpuTopology;
-
 /**
  * MachineState:
  */
@@ -360,8 +340,7 @@ struct MachineState {
     const char *cpu_type;
     AccelState *accelerator;
     CPUArchIdList *possible_cpus;
-    CpuTopology smp;
-    GeneralCpuTopology topo; /* TODO: Completely replace MachineState.smp */
+    CpuTopology topo;
     struct NVDIMMState *nvdimms_state;
     struct NumaState *numa_state;
 };
diff --git a/include/hw/cpu/cpu-topology.h b/include/hw/cpu/cpu-topology.h
index 87d832556229..829f98d3a73f 100644
--- a/include/hw/cpu/cpu-topology.h
+++ b/include/hw/cpu/cpu-topology.h
@@ -88,7 +88,7 @@ typedef struct HybridCpuTopology {
 } HybridCpuTopology;
 
 /**
- * GeneralCpuTopology - General cpu topology defination.
+ * CpuTopology - General cpu topology defination.
  *
  * It supports one of two topologies: smp topology or hybrid topology.
  *
@@ -101,7 +101,7 @@ typedef struct HybridCpuTopology {
  * @hybrid: the hybrid cpu topology informantion. Only valid when
  *          topo_type is CPU_TOPO_TYPE_HYBRID.
  */
-typedef struct GeneralCpuTopology {
+typedef struct CpuTopology {
     unsigned int cpus;
     unsigned int max_cpus;
     CpuTopoType topo_type;
@@ -109,11 +109,6 @@ typedef struct GeneralCpuTopology {
         SmpCpuTopology smp;
         HybridCpuTopology hybrid;
     };
-} GeneralCpuTopology; /*
-                       * TODO: This name is temporary, just to distinguish it
-                       * from the CpuTopology in boards.h. When CpuTopology in
-                       * boards.h is merged here, it will be uniformly named as
-                       * CpuTopology.
-                       */
+} CpuTopology;
 
 #endif /* CPU_TOPOLOGY_H */
-- 
2.34.1


