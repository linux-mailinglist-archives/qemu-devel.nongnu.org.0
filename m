Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42BF2871
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 08:52:29 +0100 (CET)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iScah-0006pq-A3
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 02:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iScUC-0001Tc-61
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iScU8-0005ly-Sr
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:41 -0500
Received: from mga02.intel.com ([134.134.136.20]:5092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iScU8-0005Xf-Ks
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 02:45:40 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 23:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,277,1569308400"; d="scan'208";a="404016888"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 23:45:35 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com
Subject: [PATCH v15 07/12] numa: Calculate hmat latency and bandwidth entry
 list
Date: Thu,  7 Nov 2019 15:45:06 +0800
Message-Id: <20191107074511.14304-8-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191107074511.14304-1-tao3.xu@intel.com>
References: <20191107074511.14304-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
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
Cc: jingqi.liu@intel.com, tao3.xu@intel.com, fan.du@intel.com,
 qemu-devel@nongnu.org, jonathan.cameron@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compress HMAT latency and bandwidth raw data into uint16_t data,
which can be stored in HMAT table.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v15.

Changes in v14:
    - Convert latency from ns to ps, because ACPI 6.3 HMAT table use
      ps as minimum unit
---
 hw/core/numa.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index f391760c20..523dd80822 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -483,6 +483,47 @@ static void complete_init_numa_distance(MachineState *ms)
     }
 }
 
+static void calculate_hmat_entry_list(HMAT_LB_Info *hmat_lb, int num_nodes)
+{
+    int i, index;
+    uint16_t *entry_list;
+    uint64_t base;
+    GArray *lb_data_list;
+    HMAT_LB_Data *lb_data;
+
+    if (hmat_lb->data_type <= HMAT_LB_DATA_WRITE_LATENCY) {
+        base = hmat_lb->base_latency;
+        lb_data_list = hmat_lb->latency;
+    } else {
+        base = hmat_lb->base_bandwidth;
+        lb_data_list = hmat_lb->bandwidth;
+    }
+
+    entry_list = g_malloc0(lb_data_list->len * sizeof(uint16_t));
+    for (i = 0; i < lb_data_list->len; i++) {
+        lb_data = &g_array_index(lb_data_list, HMAT_LB_Data, i);
+        index = lb_data->initiator * num_nodes + lb_data->target;
+        if (entry_list[index]) {
+            error_report("Duplicate configuration of the latency for "
+                "initiator=%d and target=%d.", lb_data->initiator,
+                lb_data->target);
+            exit(1);
+        }
+
+        entry_list[index] = (uint16_t)(lb_data->rawdata / base);
+    }
+
+    if (hmat_lb->data_type <= HMAT_LB_DATA_WRITE_LATENCY) {
+        /* Convert latency base from nanoseconds to picosecond */
+        hmat_lb->base_latency = base * 1000;
+        hmat_lb->entry_latency = entry_list;
+    } else {
+        /* Convert bandwidth base from Byte to Megabyte */
+        hmat_lb->base_bandwidth = base / MiB;
+        hmat_lb->entry_bandwidth = entry_list;
+    }
+}
+
 void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size)
 {
@@ -521,9 +562,10 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 
 void numa_complete_configuration(MachineState *ms)
 {
-    int i;
+    int i, hierarchy, type;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     NodeInfo *numa_info = ms->numa_state->nodes;
+    HMAT_LB_Info *numa_hmat_lb;
 
     /*
      * If memory hotplug is enabled (slots > 0) but without '-numa'
@@ -620,6 +662,21 @@ void numa_complete_configuration(MachineState *ms)
             /* Validation succeeded, now fill in any missing distances. */
             complete_init_numa_distance(ms);
         }
+
+        if (ms->numa_state->hmat_enabled) {
+            for (hierarchy = HMAT_LB_MEM_MEMORY;
+                 hierarchy <= HMAT_LB_MEM_CACHE_3RD_LEVEL; hierarchy++) {
+                for (type = HMAT_LB_DATA_ACCESS_LATENCY;
+                    type <= HMAT_LB_DATA_WRITE_BANDWIDTH; type++) {
+                    numa_hmat_lb = ms->numa_state->hmat_lb[hierarchy][type];
+
+                    if (numa_hmat_lb) {
+                        calculate_hmat_entry_list(numa_hmat_lb,
+                                                  ms->numa_state->num_nodes);
+                    }
+                }
+            }
+        }
     }
 }
 
-- 
2.20.1


