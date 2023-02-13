Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB12694204
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 10:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVQL-00036E-Jp; Mon, 13 Feb 2023 04:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPa-0001b6-IP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:20 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRVPU-0002n2-Lv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 04:46:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676281568; x=1707817568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lUsO11+oTp4FKS2TBTokJuefTKfILZxysXgQuj7U6pU=;
 b=F368hzecOonDV+3m+N31ECtM0LpMNQH+Y9x8C4id3TEcvtIrnzk4RSau
 ccth3qEFjBun6cYqwDAXUiPkvH8C2tAwCFCj8liGWSmmZ/sB3h7wbL18A
 6aHI5QJnQVgImEH4F6598oNt06BRje5e1+SFPmDfF7TQnODTXenq4Tb4V
 nr6c3Ybof1L5PVmgR0mDoSEnjWdWQ86pzntpLtXgUFy4u1sP2nhFOJgHE
 6Io3Vny8NXE53ofP/q4Bw5urMCanSmnam47GAH9D6dVZ7ev71cnGSMBQ6
 J3kpY1WDk1/ktcliAIyhFmOQJ/BApVv/aLqy2+BrhWqUyje2AiSpunWn3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310487039"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="310487039"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 01:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="670760625"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; d="scan'208";a="670760625"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 01:45:27 -0800
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
Subject: [RFC 37/52] i386: Update X86CPUTopoIDs generating rule for hybrid
 topology
Date: Mon, 13 Feb 2023 17:50:20 +0800
Message-Id: <20230213095035.158240-38-zhao1.liu@linux.intel.com>
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

X86CPUTopoIDs can be parsed form cpu_index or APIC ID. For hybrid CPU
topology, the case, generating form cpu_index, need to update.

In x86_topo_ids_from_idx(), if current topology is hybrid, traverse all
clusters and cores to find the cluster, core and thread that cpu_index
matches.

Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
 hw/i386/x86.c                | 78 ++++++++++++++++++++++++++++++-
 include/hw/i386/topology.h   | 36 --------------
 tests/unit/test-x86-apicid.c | 91 +++++++++++++++++++++++-------------
 3 files changed, 136 insertions(+), 69 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 1c071f8120cb..a09df6d33fff 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -103,6 +103,82 @@ inline void init_apicid_topo_info(X86ApicidTopoInfo *apicid_topo,
     }
 }
 
+/*
+ * Calculate thread/core/package IDs for a specific topology,
+ * based on (contiguous) CPU index
+ */
+static void x86_topo_ids_from_idx(X86MachineState *x86ms,
+                                  unsigned cpu_index,
+                                  X86CPUTopoIDs *topo_ids)
+{
+    MachineState *ms = MACHINE(x86ms);
+    unsigned nr_dies;
+    unsigned nr_modules;
+    unsigned nr_cores;
+    unsigned nr_threads;
+    unsigned cpus_per_pkg;
+    unsigned cpus_per_die;
+
+    nr_dies = machine_topo_get_dies(ms);
+    nr_modules = machine_topo_get_clusters(ms);
+    cpus_per_pkg = machine_topo_get_threads_per_socket(ms);
+    cpus_per_die = cpus_per_pkg / nr_dies;
+
+    topo_ids->pkg_id = cpu_index / cpus_per_pkg;
+    topo_ids->die_id = cpu_index / cpus_per_die % nr_dies;
+
+    if (machine_topo_is_smp(ms)) {
+        nr_cores = machine_topo_get_smp_cores(ms);
+        nr_threads = machine_topo_get_smp_threads(ms);
+
+        topo_ids->module_id = cpu_index / (nr_cores * nr_threads) %
+                              nr_modules;
+        topo_ids->core_id = cpu_index / nr_threads % nr_cores;
+        topo_ids->smt_id = cpu_index % nr_threads;
+    } else {
+        /*
+         * Next we need to traverse in the die, so scale the cpu_index to
+         * the relative index in the die.
+         */
+        int idx = cpu_index % cpus_per_die;
+
+        topo_ids->module_id = 0;
+        topo_ids->core_id = 0;
+        topo_ids->smt_id = 0;
+
+        for (int i = 0; i < nr_modules; i++) {
+            nr_cores = machine_topo_get_cores(ms, i);
+
+            for (int j = 0; j < nr_cores; j++) {
+                nr_threads = machine_topo_get_threads(ms, i, j);
+
+                if (idx < nr_threads) {
+                    topo_ids->module_id = i;
+                    topo_ids->core_id = j;
+                    topo_ids->smt_id = idx;
+                    return;
+                } else {
+                    idx -= nr_threads;
+                }
+            }
+        }
+    }
+}
+
+/*
+ * Make APIC ID for the CPU 'cpu_index'
+ *
+ * 'cpu_index' is a sequential, contiguous ID for the CPU.
+ */
+static inline apic_id_t x86_apicid_from_cpu_idx(X86MachineState *x86ms,
+                                                X86ApicidTopoInfo *apicid_topo,
+                                                unsigned cpu_index)
+{
+    X86CPUTopoIDs topo_ids;
+    x86_topo_ids_from_idx(x86ms, cpu_index, &topo_ids);
+    return x86_apicid_from_topo_ids(apicid_topo, &topo_ids);
+}
+
 /*
  * Calculates initial APIC ID for a specific CPU index
  *
@@ -118,7 +194,7 @@ uint32_t x86_cpu_apic_id_from_index(X86MachineState *x86ms,
 
     init_apicid_topo_info(&apicid_topo, x86ms);
 
-    return x86_apicid_from_cpu_idx(&apicid_topo, cpu_index);
+    return x86_apicid_from_cpu_idx(x86ms, &apicid_topo, cpu_index);
 }
 
 
diff --git a/include/hw/i386/topology.h b/include/hw/i386/topology.h
index 5b29c51329f1..06403ca77087 100644
--- a/include/hw/i386/topology.h
+++ b/include/hw/i386/topology.h
@@ -153,29 +153,6 @@ static inline apic_id_t x86_apicid_from_topo_ids(X86ApicidTopoInfo *apicid_topo,
            topo_ids->smt_id;
 }
 
-/*
- * Calculate thread/core/package IDs for a specific topology,
- * based on (contiguous) CPU index
- */
-static inline void x86_topo_ids_from_idx(X86ApicidTopoInfo *apicid_topo,
-                                         unsigned cpu_index,
-                                         X86CPUTopoIDs *topo_ids)
-{
-    unsigned nr_dies = apicid_topo->max_dies;
-    unsigned nr_modules = apicid_topo->max_modules;
-    unsigned nr_cores = apicid_topo->max_cores;
-    unsigned nr_threads = apicid_topo->max_threads;
-
-    topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
-                       nr_cores * nr_threads);
-    topo_ids->die_id = cpu_index / (nr_modules * nr_cores *
-                       nr_threads) % nr_dies;
-    topo_ids->module_id = cpu_index / (nr_cores * nr_threads) %
-                          nr_modules;
-    topo_ids->core_id = cpu_index / nr_threads % nr_cores;
-    topo_ids->smt_id = cpu_index % nr_threads;
-}
-
 /*
  * Calculate thread/core/package IDs for a specific topology,
  * based on APIC ID
@@ -198,17 +175,4 @@ static inline void x86_topo_ids_from_apicid(apic_id_t apicid,
     topo_ids->pkg_id = apicid >> apicid_pkg_offset(apicid_topo);
 }
 
-/*
- * Make APIC ID for the CPU 'cpu_index'
- *
- * 'cpu_index' is a sequential, contiguous ID for the CPU.
- */
-static inline apic_id_t x86_apicid_from_cpu_idx(X86ApicidTopoInfo *apicid_topo,
-                                                unsigned cpu_index)
-{
-    X86CPUTopoIDs topo_ids;
-    x86_topo_ids_from_idx(apicid_topo, cpu_index, &topo_ids);
-    return x86_apicid_from_topo_ids(apicid_topo, &topo_ids);
-}
-
 #endif /* HW_I386_TOPOLOGY_H */
diff --git a/tests/unit/test-x86-apicid.c b/tests/unit/test-x86-apicid.c
index fd76d1775a10..917d8c480436 100644
--- a/tests/unit/test-x86-apicid.c
+++ b/tests/unit/test-x86-apicid.c
@@ -23,9 +23,36 @@
  */
 
 #include "qemu/osdep.h"
-
+#include "hw/core/cpu.h"
 #include "hw/i386/topology.h"
 
+static void x86_smp_test_topo_ids_from_idx(X86ApicidTopoInfo *apicid_topo,
+                                           unsigned cpu_index,
+                                           X86CPUTopoIDs *topo_ids)
+{
+    unsigned nr_dies = apicid_topo->max_dies;
+    unsigned nr_modules = apicid_topo->max_modules;
+    unsigned nr_cores = apicid_topo->max_cores;
+    unsigned nr_threads = apicid_topo->max_threads;
+
+    topo_ids->pkg_id = cpu_index / (nr_dies * nr_modules *
+                                    nr_cores * nr_threads);
+    topo_ids->die_id = cpu_index / (nr_modules * nr_cores
+                                    * nr_threads) % nr_dies;
+    topo_ids->module_id = cpu_index / (nr_cores * nr_threads) % nr_modules;
+    topo_ids->core_id = cpu_index / nr_threads % nr_cores;
+    topo_ids->smt_id = cpu_index % nr_threads;
+}
+
+static apic_id_t
+x86_smp_test_apicid_from_cpu_idx(X86ApicidTopoInfo *apicid_topo,
+                                 unsigned cpu_index)
+{
+    X86CPUTopoIDs topo_ids;
+    x86_smp_test_topo_ids_from_idx(apicid_topo, cpu_index, &topo_ids);
+    return x86_apicid_from_topo_ids(apicid_topo, &topo_ids);
+}
+
 static void test_topo_bits(void)
 {
     X86ApicidTopoInfo apicid_topo = {0};
@@ -41,10 +68,10 @@ static void test_topo_bits(void)
     g_assert_cmpuint(apicid_die_width(&apicid_topo), ==, 0);
 
     apicid_topo = (X86ApicidTopoInfo) {1, 1, 1, 1};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 3), ==, 3);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 3), ==, 3);
 
 
     /* Test field width calculation for multiple values
@@ -106,37 +133,37 @@ static void test_topo_bits(void)
     g_assert_cmpuint(apicid_pkg_offset(&apicid_topo), ==, 5);
 
     apicid_topo = (X86ApicidTopoInfo) {1, 1, 6, 3};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 0), ==, 0);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 1), ==, 1);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 2), ==, 2);
 
     apicid_topo = (X86ApicidTopoInfo) {1, 1, 6, 3};
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 0), ==,
-                     (1 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 1), ==,
-                     (1 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 2), ==,
-                     (1 << 2) | 2);
-
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 0), ==,
-                     (2 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 1), ==,
-                     (2 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 2), ==,
-                     (2 << 2) | 2);
-
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 0), ==,
-                     (5 << 2) | 0);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 1), ==,
-                     (5 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 2), ==,
-                     (5 << 2) | 2);
-
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 0),
+                     ==, (1 << 2) | 0);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 1),
+                     ==, (1 << 2) | 1);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 1 * 3 + 2),
+                     ==, (1 << 2) | 2);
+
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 0),
+                     ==, (2 << 2) | 0);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 1),
+                     ==, (2 << 2) | 1);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 2 * 3 + 2),
+                     ==, (2 << 2) | 2);
+
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 0),
+                     ==, (5 << 2) | 0);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 1),
+                     ==, (5 << 2) | 1);
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo, 5 * 3 + 2),
+                     ==, (5 << 2) | 2);
+
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo,
                      1 * 6 * 3 + 0 * 3 + 0), ==, (1 << 5));
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo,
                      1 * 6 * 3 + 1 * 3 + 1), ==, (1 << 5) | (1 << 2) | 1);
-    g_assert_cmpuint(x86_apicid_from_cpu_idx(&apicid_topo,
+    g_assert_cmpuint(x86_smp_test_apicid_from_cpu_idx(&apicid_topo,
                      3 * 6 * 3 + 5 * 3 + 2), ==, (3 << 5) | (5 << 2) | 2);
 }
 
-- 
2.34.1


