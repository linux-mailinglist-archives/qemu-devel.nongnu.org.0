Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAAD10ABC2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 09:31:30 +0100 (CET)
Received: from localhost ([::1]:35742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZsjR-0000G4-H1
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 03:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39191)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iZsek-0004BZ-6j
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:26:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iZsei-0000Ls-US
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:26:38 -0500
Received: from mga07.intel.com ([134.134.136.100]:2950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iZsei-0000IR-HN
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 03:26:36 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 00:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,248,1571727600"; d="scan'208";a="211621116"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga003.jf.intel.com with ESMTP; 27 Nov 2019 00:26:33 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 sw@weilnetz.de, mdroth@linux.vnet.ibm.com, thuth@redhat.com,
 lvivier@redhat.com
Subject: [PATCH v18 5/8] hmat acpi: Build System Locality Latency and
 Bandwidth Information Structure(s)
Date: Wed, 27 Nov 2019 16:26:10 +0800
Message-Id: <20191127082613.22903-6-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127082613.22903-1-tao3.xu@intel.com>
References: <20191127082613.22903-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes the memory access latency and bandwidth
information from various memory access initiator proximity domains.
The latency and bandwidth numbers represented in this structure
correspond to rated latency and bandwidth for the platform.
The software could use this information as hint for optimization.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in 18.

Changes in v17:
    - Remove unnecessary header file (Igor)

Changes in v16:
    - Add more description for lb_length (Igor)
    - Drop entry_list and calculate entries in this patch (Igor)

Changes in v13:
    - Calculate the entries in a new patch.
---
 hw/acpi/hmat.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 9ff79308a4..e5ee8b4317 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -25,6 +25,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "sysemu/numa.h"
 #include "hw/acpi/hmat.h"
 
@@ -67,11 +68,89 @@ static void build_hmat_mpda(GArray *table_data, uint16_t flags,
     build_append_int_noprefix(table_data, 0, 8);
 }
 
+/*
+ * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Information
+ * Structure: Table 5-146
+ */
+static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
+                          uint32_t num_initiator, uint32_t num_target,
+                          uint32_t *initiator_list)
+{
+    int i, index;
+    HMAT_LB_Data *lb_data;
+    uint16_t *entry_list;
+    uint32_t base;
+    /* Length in bytes for entire structure */
+    uint32_t lb_length
+        = 32 /* Table length upto and including Entry Base Unit */
+        + 4 * num_initiator /* Initiator Proximity Domain List */
+        + 4 * num_target /* Target Proximity Domain List */
+        + 2 * num_initiator * num_target; /* Latency or Bandwidth Entries */
+
+    /* Type */
+    build_append_int_noprefix(table_data, 1, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, lb_length, 4);
+    /* Flags: Bits [3:0] Memory Hierarchy, Bits[7:4] Reserved */
+    assert(!(hmat_lb->hierarchy >> 4));
+    build_append_int_noprefix(table_data, hmat_lb->hierarchy, 1);
+    /* Data Type */
+    build_append_int_noprefix(table_data, hmat_lb->data_type, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Number of Initiator Proximity Domains (s) */
+    build_append_int_noprefix(table_data, num_initiator, 4);
+    /* Number of Target Proximity Domains (t) */
+    build_append_int_noprefix(table_data, num_target, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    /* Entry Base Unit */
+    if (hmat_lb->data_type <= HMAT_LB_DATA_WRITE_LATENCY) {
+        /* Convert latency base from nanoseconds to picosecond */
+        base = hmat_lb->base * 1000;
+    } else {
+        /* Convert bandwidth base from Byte to Megabyte */
+        base = hmat_lb->base / MiB;
+    }
+    build_append_int_noprefix(table_data, base, 8);
+
+    /* Initiator Proximity Domain List */
+    for (i = 0; i < num_initiator; i++) {
+        build_append_int_noprefix(table_data, initiator_list[i], 4);
+    }
+
+    /* Target Proximity Domain List */
+    for (i = 0; i < num_target; i++) {
+        build_append_int_noprefix(table_data, i, 4);
+    }
+
+    /* Latency or Bandwidth Entries */
+    entry_list = g_malloc0(hmat_lb->list->len * sizeof(uint16_t));
+    for (i = 0; i < hmat_lb->list->len; i++) {
+        lb_data = &g_array_index(hmat_lb->list, HMAT_LB_Data, i);
+        index = lb_data->initiator * num_target + lb_data->target;
+
+        entry_list[index] = (uint16_t)(lb_data->data / hmat_lb->base);
+    }
+
+    for (i = 0; i < num_initiator * num_target; i++) {
+        build_append_int_noprefix(table_data, entry_list[i], 2);
+    }
+
+    g_free(entry_list);
+}
+
 /* Build HMAT sub table structures */
 static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 {
     uint16_t flags;
-    int i;
+    uint32_t num_initiator = 0;
+    uint32_t initiator_list[MAX_NODES];
+    int i, hierarchy, type;
+    HMAT_LB_Info *hmat_lb;
 
     for (i = 0; i < numa_state->num_nodes; i++) {
         flags = 0;
@@ -82,6 +161,29 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 
         build_hmat_mpda(table_data, flags, numa_state->nodes[i].initiator, i);
     }
+
+    for (i = 0; i < numa_state->num_nodes; i++) {
+        if (numa_state->nodes[i].has_cpu) {
+            initiator_list[num_initiator++] = i;
+        }
+    }
+
+    /*
+     * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Information
+     * Structure: Table 5-146
+     */
+    for (hierarchy = HMAT_LB_MEM_MEMORY;
+         hierarchy <= HMAT_LB_MEM_CACHE_3RD_LEVEL; hierarchy++) {
+        for (type = HMAT_LB_DATA_ACCESS_LATENCY;
+             type <= HMAT_LB_DATA_WRITE_BANDWIDTH; type++) {
+            hmat_lb = numa_state->hmat_lb[hierarchy][type];
+
+            if (hmat_lb && hmat_lb->list->len) {
+                build_hmat_lb(table_data, hmat_lb, num_initiator,
+                              numa_state->num_nodes, initiator_list);
+            }
+        }
+    }
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
-- 
2.20.1


