Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AC69419E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:44:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVNJ-00041q-03; Mon, 13 Feb 2023 04:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVNB-0003uC-Vy
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:46 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVN4-0002ea-8k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281418; x=1707817418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3VrwrZM8cijXlYI5X1fGYyYv2/UyVxTYkrVwAR2eG78=;
 b=OZFanbQ6oDtbLuRmwkYLT6TYYfjbAUKTimtcxxyN2dellvMXpZkLLJRP
 rlFZgMmPvW+BJQZsuTpDge71sh6AM8MUSf3ZBPeAhfK30rvoKJaXD1H2N
 YuWzj4eANitWdZmaI1h49wXSIoiwT0mILIo4sCvztfdl5iD1SeCZXsmKi
 GfJSZh/4/g5H82Knrsfyv8GBNso2UrWsZ7xwcybVeTMbQD21nj9xIEAPu
 yPD6EQtcEFuLjAaJQRxw0I+/wStSsb8v90fAmFBlLxyABkBm7Z28iCkGq
 vy37Ju4LURLvyVCDmbHhImJ55q4MhDJEbb/JL3JaIRMMW+j6/gBLRqKFW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310486456"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310486456"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670759838"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670759838"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:43:33 -0800
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
Subject: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
Date: Mon, 13 Feb 2023 17:49:52 +0800
Message-Id: <20230213095035.158240-10-zhao1.liu@linux.intel.com>
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

Under the hybrid cpu topology, some CPUs care about the core type.
For example, Intel's Alder Lake series CPU contains two types of cores:
Intel Core and Intel Atom. The type information of these two types is
exposed in 1A leaf of CPUID.

Core type should also be part of the hybrid topology, and
MachineState.cpu_type cannot provide different type information for
different cpus in the same machine, so add a type field for the core
level in the hybrid cpu topology.

Additionally, add a helper to get core type information from
MachineState. Though core_type is only used in hybrid case, don't
use assert since it may be used to initialize some generic fields.

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/core/machine-topo.c        | 12 ++++++++++++
 include/hw/boards.h           |  3 +++
 include/hw/cpu/cpu-topology.h |  2 ++
 3 files changed, 17 insertions(+)

diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c
index b20160479629..e0ec07b53d42 100644
--- a/hw/core/machine-topo.c
+++ b/hw/core/machine-topo.c
@@ -51,6 +51,18 @@ unsigned int machine_topo_get_smp_threads(const MachineState *ms)
     return ms->topo.smp.threads;
 }
 
+unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
+                                               unsigned int cluster_id,
+                                               unsigned int core_id)
+{
+    if (!machine_topo_is_smp(ms)) {
+        return ms->topo.hybrid.cluster_list[cluster_id]
+                       .core_list[core_id].core_type;
+    } else {
+        return 0;
+    }
+}
+
 unsigned int machine_topo_get_threads(const MachineState *ms,
                                       unsigned int cluster_id,
                                       unsigned int core_id)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 34b64b012022..78e52af38cb1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -484,6 +484,9 @@ unsigned int machine_topo_get_dies(const MachineState *ms);
 unsigned int machine_topo_get_clusters(const MachineState *ms);
 unsigned int machine_topo_get_smp_cores(const MachineState *ms);
 unsigned int machine_topo_get_smp_threads(const MachineState *ms);
+unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
+                                               unsigned int cluster_id,
+                                               unsigned int core_id);
 unsigned int machine_topo_get_threads(const MachineState *ms,
                                       unsigned int cluster_id,
                                       unsigned int core_id);
diff --git a/include/hw/cpu/cpu-topology.h b/include/hw/cpu/cpu-topology.h
index 8268ea3a8569..87d832556229 100644
--- a/include/hw/cpu/cpu-topology.h
+++ b/include/hw/cpu/cpu-topology.h
@@ -45,9 +45,11 @@ typedef struct SmpCpuTopology {
 /**
  * HybridCore - hybrid core topology defination:
  * @threads: the number of threads in one core.
+ * @core_type: the type of current core.
  */
 typedef struct HybridCore {
     unsigned int threads;
+    unsigned int core_type;
 } HybridCore;
 
 /**
-- 
2.34.1


