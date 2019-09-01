Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47546A49DC
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Sep 2019 16:34:06 +0200 (CEST)
Received: from localhost ([::1]:57838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4Qvd-00089l-2W
	for lists+qemu-devel@lfdr.de; Sun, 01 Sep 2019 10:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1i4Qjc-0004fG-NV
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1i4Qjb-0004mr-8O
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:40 -0400
Received: from mga12.intel.com ([192.55.52.136]:16719)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1i4Qja-0004jJ-UW
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 10:21:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Sep 2019 07:21:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,455,1559545200"; d="scan'208";a="211453111"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga002.fm.intel.com with ESMTP; 01 Sep 2019 07:21:36 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Sun,  1 Sep 2019 22:21:15 +0800
Message-Id: <20190901142119.20482-8-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190901142119.20482-1-tao3.xu@intel.com>
References: <20190901142119.20482-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.136
Subject: [Qemu-devel] [PATCH v10 07/11] hmat acpi: Build System Locality
 Latency and Bandwidth Information Structure(s)
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
 qemu-devel@nongnu.org, daniel@linux.ibm.com,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes the memory access latency and bandwidth
information from various memory access initiator proximity domains.
The latency and bandwidth numbers represented in this structure
correspond to rated latency and bandwidth for the platform.
The software could use this information as hint for optimization.

Reviewed-by: Daniel Black <daniel@linux.ibm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v10.
---
 hw/acpi/hmat.c          | 95 ++++++++++++++++++++++++++++++++++++++++-
 hw/acpi/hmat.h          | 41 ++++++++++++++++++
 include/qemu/typedefs.h |  1 +
 include/sysemu/numa.h   | 24 +++++++++++
 4 files changed, 160 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 1368fce7ee..27e7ff63f8 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -67,11 +67,81 @@ static void build_hmat_mpda(GArray *table_data, uint16_t flags, int initiator,
     build_append_int_noprefix(table_data, 0, 8);
 }
 
+/*
+ * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Information
+ * Structure: Table 5-146
+ */
+static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
+                          uint32_t num_initiator, uint32_t num_target,
+                          uint32_t *initiator_pxm, int type)
+{
+    uint32_t s = num_initiator;
+    uint32_t t = num_target;
+    uint8_t m, n;
+    uint8_t mask = 0x0f;
+    int i;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 1, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 32 + 4 * s + 4 * t + 2 * s * t, 4);
+    /* Flags: Bits [3:0] Memory Hierarchy, Bits[7:4] Reserved */
+    build_append_int_noprefix(table_data, hmat_lb->hierarchy & mask, 1);
+    /* Data Type */
+    build_append_int_noprefix(table_data, hmat_lb->data_type, 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Number of Initiator Proximity Domains (s) */
+    build_append_int_noprefix(table_data, s, 4);
+    /* Number of Target Proximity Domains (t) */
+    build_append_int_noprefix(table_data, t, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    /* Entry Base Unit */
+    if (HMAT_IS_LATENCY(type)) {
+        build_append_int_noprefix(table_data, hmat_lb->base_lat, 8);
+    } else {
+        build_append_int_noprefix(table_data, hmat_lb->base_bw, 8);
+    }
+
+    /* Initiator Proximity Domain List */
+    for (i = 0; i < s; i++) {
+        build_append_int_noprefix(table_data, initiator_pxm[i], 4);
+    }
+
+    /* Target Proximity Domain List */
+    for (i = 0; i < t; i++) {
+        build_append_int_noprefix(table_data, i, 4);
+    }
+
+    /* Latency or Bandwidth Entries */
+    for (i = 0; i < s; i++) {
+        m = initiator_pxm[i];
+        for (n = 0; n < t; n++) {
+            uint16_t entry;
+
+            if (HMAT_IS_LATENCY(type)) {
+                entry = hmat_lb->latency[m][n];
+            } else {
+                entry = hmat_lb->bandwidth[m][n];
+            }
+
+            build_append_int_noprefix(table_data, entry, 2);
+        }
+    }
+}
+
 /* Build HMAT sub table structures */
 static void hmat_build_table_structs(GArray *table_data, NumaState *nstat)
 {
     uint16_t flags;
-    int i;
+    uint32_t num_initiator = 0;
+    uint32_t initiator_pxm[MAX_NODES];
+    int i, hrchy, type;
+    HMAT_LB_Info *numa_hmat_lb;
 
     for (i = 0; i < nstat->num_nodes; i++) {
         flags = 0;
@@ -82,6 +152,29 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *nstat)
 
         build_hmat_mpda(table_data, flags, nstat->nodes[i].initiator, i);
     }
+
+    for (i = 0; i < nstat->num_nodes; i++) {
+        if (nstat->nodes[i].has_cpu) {
+            initiator_pxm[num_initiator++] = i;
+        }
+    }
+
+    /*
+     * ACPI 6.3: 5.2.27.4 System Locality Latency and Bandwidth Information
+     * Structure: Table 5-146
+     */
+    for (hrchy = HMAT_LB_MEM_MEMORY;
+         hrchy <= HMAT_LB_MEM_CACHE_3RD_LEVEL; hrchy++) {
+        for (type = HMAT_LB_DATA_ACCESS_LATENCY;
+             type <= HMAT_LB_DATA_WRITE_BANDWIDTH; type++) {
+            numa_hmat_lb = nstat->hmat_lb[hrchy][type];
+
+            if (numa_hmat_lb) {
+                build_hmat_lb(table_data, numa_hmat_lb, num_initiator,
+                              nstat->num_nodes, initiator_pxm, type);
+            }
+        }
+    }
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *nstat)
diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index 0c1839cf6f..79ddb873c1 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -40,6 +40,47 @@
  */
 #define HMAT_PROX_INIT_VALID 0x1
 
+#define HMAT_IS_LATENCY(type) (type <= HMAT_LB_DATA_WRITE_LATENCY)
+
+struct HMAT_LB_Info {
+    /*
+     * Indicates total number of Proximity Domains
+     * that can initiate memory access requests.
+     */
+    uint32_t    num_initiator;
+    /*
+     * Indicates total number of Proximity Domains
+     * that can act as target.
+     */
+    uint32_t    num_target;
+    /*
+     * Indicates it's memory or
+     * the specified level memory side cache.
+     */
+    uint8_t     hierarchy;
+    /*
+     * Present the type of data,
+     * access/read/write latency or bandwidth.
+     */
+    uint8_t     data_type;
+    /* The base unit for latency in nanoseconds. */
+    uint64_t    base_lat;
+    /* The base unit for bandwidth in megabytes per second(MB/s). */
+    uint64_t    base_bw;
+    /*
+     * latency[i][j]:
+     * Indicates the latency based on base_lat
+     * from Initiator Proximity Domain i to Target Proximity Domain j.
+     */
+    uint16_t    latency[MAX_NODES][MAX_NODES];
+    /*
+     * bandwidth[i][j]:
+     * Indicates the bandwidth based on base_bw
+     * from Initiator Proximity Domain i to Target Proximity Domain j.
+     */
+    uint16_t    bandwidth[MAX_NODES][MAX_NODES];
+};
+
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *nstat);
 
 #endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 375770a80f..ad8955ecd8 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -49,6 +49,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct HMAT_LB_Info HMAT_LB_Info;
 typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index a788c3b126..8dbf76c5b4 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -14,6 +14,27 @@ struct CPUArchId;
 #define NUMA_DISTANCE_MAX         254
 #define NUMA_DISTANCE_UNREACHABLE 255
 
+/* the value of AcpiHmatLBInfo flags */
+enum {
+    HMAT_LB_MEM_MEMORY           = 0,
+    HMAT_LB_MEM_CACHE_1ST_LEVEL  = 1,
+    HMAT_LB_MEM_CACHE_2ND_LEVEL  = 2,
+    HMAT_LB_MEM_CACHE_3RD_LEVEL  = 3,
+};
+
+/* the value of AcpiHmatLBInfo data type */
+enum {
+    HMAT_LB_DATA_ACCESS_LATENCY   = 0,
+    HMAT_LB_DATA_READ_LATENCY     = 1,
+    HMAT_LB_DATA_WRITE_LATENCY    = 2,
+    HMAT_LB_DATA_ACCESS_BANDWIDTH = 3,
+    HMAT_LB_DATA_READ_BANDWIDTH   = 4,
+    HMAT_LB_DATA_WRITE_BANDWIDTH  = 5,
+};
+
+#define HMAT_LB_LEVELS    (HMAT_LB_MEM_CACHE_3RD_LEVEL + 1)
+#define HMAT_LB_TYPES     (HMAT_LB_DATA_WRITE_BANDWIDTH + 1)
+
 struct NodeInfo {
     uint64_t node_mem;
     struct HostMemoryBackend *node_memdev;
@@ -41,6 +62,9 @@ struct NumaState {
 
     /* NUMA nodes information */
     NodeInfo nodes[MAX_NODES];
+
+    /* NUMA modes HMAT Locality Latency and Bandwidth Information */
+    HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
 };
 typedef struct NumaState NumaState;
 
-- 
2.20.1


