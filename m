Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B88346478
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 18:39:21 +0200 (CEST)
Received: from localhost ([::1]:53362 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbpEW-0004EW-Na
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 12:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33951)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hbobp-0001Cn-Fp
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hbobn-0005vg-4m
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:2020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hbobm-0005M2-MA
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 11:59:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 08:59:15 -0700
X-ExtLoop1: 1
Received: from tao-optiplex-7060.sh.intel.com ([10.239.13.104])
 by orsmga008.jf.intel.com with ESMTP; 14 Jun 2019 08:59:14 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Fri, 14 Jun 2019 23:56:25 +0800
Message-Id: <20190614155626.27932-8-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614155626.27932-1-tao3.xu@intel.com>
References: <20190614155626.27932-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 7/8] hmat acpi: Build System Locality
 Latency and Bandwidth Information Structure(s) in ACPI HMAT
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes the memory access latency and bandwidth
information from various memory access initiator proximity domains.
The latency and bandwidth numbers represented in this structure
correspond to rated latency and bandwidth for the platform.
The software could use this information as hint for optimization.

Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

Changes in v5 -> v4:
    - Separate hmat_build_lb() (Igor)
    - Add more descriptions from ACPI spec (Igor)
    - Drop all global variables and use local variables instead (Igor)
---
 hw/acpi/hmat.c          | 101 +++++++++++++++++++++++++++++++++++++++-
 hw/acpi/hmat.h          |  39 ++++++++++++++++
 include/qemu/typedefs.h |   1 +
 include/sysemu/numa.h   |   3 ++
 include/sysemu/sysemu.h |  24 ++++++++++
 5 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 6fd434c4d9..7da674825f 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -57,6 +57,74 @@ static void build_hmat_spa(GArray *table_data, uint16_t flags,
     build_append_int_noprefix(table_data, length, 8);
 }
 
+/*
+ * ACPI 6.2: 5.2.27.4 System Locality Latency and Bandwidth Information
+ * Structure: Table 5-142
+ */
+static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *numa_hmat_lb,
+                          uint32_t num_initiator, uint32_t num_target,
+                          uint32_t *initiator_pxm, uint32_t *target_pxm,
+                          int type)
+{
+    uint32_t s = num_initiator;
+    uint32_t t = num_target;
+    uint8_t m, n;
+    int i, j;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 1, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 32 + 4 * s + 4 * t + 2 * s * t, 4);
+    /* Flags */
+    build_append_int_noprefix(table_data, numa_hmat_lb->hierarchy, 1);
+    /* Data Type */
+    build_append_int_noprefix(table_data, numa_hmat_lb->data_type, 1);
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
+    if (type <= HMAT_LB_DATA_WRITE_LATENCY) {
+        build_append_int_noprefix(table_data, numa_hmat_lb->base_lat, 8);
+    } else {
+        build_append_int_noprefix(table_data, numa_hmat_lb->base_bw, 8);
+    }
+
+    /* Initiator Proximity Domain List */
+    for (i = 0; i < s; i++) {
+        build_append_int_noprefix(table_data, initiator_pxm[i], 4);
+    }
+
+    /* Target Proximity Domain List */
+    for (i = 0; i < t; i++) {
+        build_append_int_noprefix(table_data, target_pxm[i], 4);
+    }
+
+    /* Latency or Bandwidth Entries */
+    for (i = 0; i < s; i++) {
+        m = initiator_pxm[i];
+        for (j = 0; j < t; j++) {
+            n = target_pxm[j];
+            uint16_t entry;
+
+            if (type <= HMAT_LB_DATA_WRITE_LATENCY) {
+                entry = numa_hmat_lb->latency[m][n] * numa_hmat_lb->base_lat;
+            } else {
+                entry = numa_hmat_lb->bandwidth[m][n] * numa_hmat_lb->base_bw;
+            }
+
+            build_append_int_noprefix(table_data, entry, 2);
+        }
+    }
+}
+
 static int pc_dimm_device_list(Object *obj, void *opaque)
 {
     GSList **list = opaque;
@@ -77,10 +145,13 @@ static void hmat_build_table_structs(GArray *table_data, MachineState *ms)
 {
     GSList *device_list = NULL;
     uint16_t flags;
+    uint32_t num_initiator = 0, num_target = 0;
+    uint32_t initiator_pxm[MAX_NODES], target_pxm[MAX_NODES];
     uint64_t mem_base, mem_len;
-    int i;
+    int i, hrchy, type;
     NumaState *nstat = ms->numa_state;
     NumaMemRange *mem_range;
+    HMAT_LB_Info *numa_hmat_lb;
 
     Object *obj = object_resolve_path_type("", TYPE_ACPI_DEVICE_IF, NULL);
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
@@ -134,6 +205,34 @@ static void hmat_build_table_structs(GArray *table_data, MachineState *ms)
         }
         build_hmat_spa(table_data, flags, mem_base, mem_len, i);
     }
+
+    if (!num_initiator && !num_target) {
+        for (i = 0; i < nstat->num_nodes; i++) {
+            if (nstat->nodes[i].is_initiator) {
+                initiator_pxm[num_initiator++] = i;
+            }
+            if (nstat->nodes[i].is_target) {
+                target_pxm[num_target++] = i;
+            }
+        }
+    }
+
+    /*
+     * ACPI 6.2: 5.2.27.4 System Locality Latency and Bandwidth Information
+     * Structure: Table 5-142
+     */
+    for (hrchy = HMAT_LB_MEM_MEMORY;
+         hrchy <= HMAT_LB_MEM_CACHE_3RD_LEVEL; hrchy++) {
+        for (type = HMAT_LB_DATA_ACCESS_LATENCY;
+             type <= HMAT_LB_DATA_WRITE_BANDWIDTH; type++) {
+            numa_hmat_lb = nstat->hmat_lb[hrchy][type];
+
+            if (numa_hmat_lb) {
+                build_hmat_lb(table_data, numa_hmat_lb, num_initiator,
+                              num_target, initiator_pxm, target_pxm, type);
+            }
+        }
+    }
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, MachineState *ms)
diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index e24b673fad..914a5e3b91 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -38,6 +38,45 @@ enum {
     HMAT_SPA_RESERVATION_HINT = 0x4,
 };
 
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
 void build_hmat(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
 #endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index fcdaae58c4..c0257e936b 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -33,6 +33,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct HMAT_LB_Info HMAT_LB_Info;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 13cff59112..026dbeb78c 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -43,6 +43,9 @@ struct NumaState {
 
     /* NUMA memory ranges */
     GArray *mem_ranges;
+
+    /* NUMA modes HMAT Locality Latency and Bandwidth Information */
+    HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
 };
 typedef struct NumaState NumaState;
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 61579ae71e..85c584c531 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -124,6 +124,30 @@ extern int mem_prealloc;
 #define NUMA_DISTANCE_MAX         254
 #define NUMA_DISTANCE_UNREACHABLE 255
 
+/* the value of AcpiHmatLBInfo flags */
+enum {
+    HMAT_LB_MEM_MEMORY           = 0,
+    HMAT_LB_MEM_CACHE_LAST_LEVEL = 1,
+    HMAT_LB_MEM_CACHE_1ST_LEVEL  = 2,
+    HMAT_LB_MEM_CACHE_2ND_LEVEL  = 3,
+    HMAT_LB_MEM_CACHE_3RD_LEVEL  = 4,
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
+#define MAX_HMAT_CACHE_LEVEL        3
+
+#define HMAT_LB_LEVELS    (HMAT_LB_MEM_CACHE_3RD_LEVEL + 1)
+#define HMAT_LB_TYPES     (HMAT_LB_DATA_WRITE_BANDWIDTH + 1)
+
 #define MAX_OPTION_ROMS 16
 typedef struct QEMUOptionRom {
     const char *name;
-- 
2.20.1


