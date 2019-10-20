Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA45DDE3A
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Oct 2019 13:21:26 +0200 (CEST)
Received: from localhost ([::1]:59382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iM9H3-0008V5-Aa
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 07:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35746)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iM97h-0002eP-UF
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iM97g-0002z5-H7
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:45 -0400
Received: from mga12.intel.com ([192.55.52.136]:63374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iM97g-0002wA-5Z
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 07:11:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 04:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,319,1566889200"; d="scan'208";a="371917572"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2019 04:11:41 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Subject: [PATCH v13 07/12] numa: Calculate hmat latency and bandwidth entry
 list
Date: Sun, 20 Oct 2019 19:11:20 +0800
Message-Id: <20191020111125.27659-8-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191020111125.27659-1-tao3.xu@intel.com>
References: <20191020111125.27659-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
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

New patch in v13.
---
 hw/core/numa.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 3cf77f6ac9..4033a5a470 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -474,6 +474,45 @@ static void complete_init_numa_distance(MachineState *ms)
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
+        hmat_lb->entry_latency = entry_list;
+    } else {
+        /* Convert base from Byte to Megabyte */
+        hmat_lb->base_bandwidth = base / MiB;
+        hmat_lb->entry_bandwidth = entry_list;
+    }
+}
+
 void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size)
 {
@@ -512,9 +551,10 @@ void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
 
 void numa_complete_configuration(MachineState *ms)
 {
-    int i;
+    int i, hierarchy, type;
     MachineClass *mc = MACHINE_GET_CLASS(ms);
     NodeInfo *numa_info = ms->numa_state->nodes;
+    HMAT_LB_Info *numa_hmat_lb;
 
     /*
      * If memory hotplug is enabled (slots > 0) but without '-numa'
@@ -611,6 +651,21 @@ void numa_complete_configuration(MachineState *ms)
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


