Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86DA7B77D
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 03:19:35 +0200 (CEST)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsdHC-0003ow-Vr
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 21:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52387)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tao3.xu@intel.com>) id 1hsdAN-0001qG-9J
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 21:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1hsdAL-0000dE-Lc
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 21:12:31 -0400
Received: from mga18.intel.com ([134.134.136.126]:12485)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1hsdAL-0000aT-C9
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 21:12:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 18:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,327,1559545200"; d="scan'208";a="200535567"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.37])
 by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2019 18:12:26 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Wed, 31 Jul 2019 09:12:06 +0800
Message-Id: <20190731011209.22538-9-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731011209.22538-1-tao3.xu@intel.com>
References: <20190731011209.22538-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH RESEND v8 08/11] hmat acpi: Build Memory Side
 Cache Information Structure(s)
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
 qemu-devel@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 dan.j.williams@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes memory side cache information for memory
proximity domains if the memory side cache is present and the
physical device forms the memory side cache.
The software could use this information to effectively place
the data in memory to maximize the performance of the system
memory that use the memory side cache.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v8.
---
 hw/acpi/hmat.c          | 64 ++++++++++++++++++++++++++++++++++++++++-
 hw/acpi/hmat.h          | 17 +++++++++++
 include/qemu/typedefs.h |  1 +
 include/sysemu/numa.h   |  3 ++
 include/sysemu/sysemu.h |  2 ++
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 431818dc82..01a6552d51 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -134,14 +134,63 @@ static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
     }
 }
 
+/* ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure: Table 5-143 */
+static void build_hmat_cache(GArray *table_data, HMAT_Cache_Info *hmat_cache)
+{
+    /*
+     * Cache Attributes: Bits [3:0] – Total Cache Levels
+     * for this Memory Proximity Domain
+     */
+    uint32_t cache_attr = hmat_cache->total_levels & 0xF;
+
+    /* Bits [7:4] : Cache Level described in this structure */
+    cache_attr |= (hmat_cache->level & 0xF) << 4;
+
+    /* Bits [11:8] - Cache Associativity */
+    cache_attr |= (hmat_cache->associativity & 0xF) << 8;
+
+    /* Bits [15:12] - Write Policy */
+    cache_attr |= (hmat_cache->write_policy & 0xF) << 12;
+
+    /* Bits [31:16] - Cache Line size in bytes */
+    cache_attr |= (hmat_cache->line_size & 0xFFFF) << 16;
+
+    cache_attr = cpu_to_le32(cache_attr);
+
+    /* Type */
+    build_append_int_noprefix(table_data, 2, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 32, 4);
+    /* Proximity Domain for the Memory */
+    build_append_int_noprefix(table_data, hmat_cache->mem_proximity, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+    /* Memory Side Cache Size */
+    build_append_int_noprefix(table_data, hmat_cache->size, 8);
+    /* Cache Attributes */
+    build_append_int_noprefix(table_data, cache_attr, 4);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /*
+     * Number of SMBIOS handles (n)
+     * Linux kernel uses Memory Side Cache Information Structure
+     * without SMBIOS entries for now, so set Number of SMBIOS handles
+     * as 0.
+     */
+    build_append_int_noprefix(table_data, 0, 2);
+}
+
 /* Build HMAT sub table structures */
 static void hmat_build_table_structs(GArray *table_data, NumaState *nstat)
 {
     uint16_t flags;
     uint32_t num_initiator = 0;
     uint32_t initiator_pxm[MAX_NODES];
-    int i, hrchy, type;
+    int i, hrchy, type, level;
     HMAT_LB_Info *numa_hmat_lb;
+    HMAT_Cache_Info *numa_hmat_cache;
 
     for (i = 0; i < nstat->num_nodes; i++) {
         flags = 0;
@@ -175,6 +224,19 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *nstat)
             }
         }
     }
+
+    /*
+     * ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure:
+     * Table 5-143
+     */
+    for (i = 0; i < nstat->num_nodes; i++) {
+        for (level = 0; level <= MAX_HMAT_CACHE_LEVEL; level++) {
+            numa_hmat_cache = nstat->hmat_cache[i][level];
+            if (numa_hmat_cache) {
+                build_hmat_cache(table_data, numa_hmat_cache);
+            }
+        }
+    }
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *nstat)
diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index 5f050781e6..6c32f12e78 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -81,6 +81,23 @@ struct HMAT_LB_Info {
     uint16_t    bandwidth[MAX_NODES][MAX_NODES];
 };
 
+struct HMAT_Cache_Info {
+    /* The memory proximity domain to which the memory belongs. */
+    uint32_t    mem_proximity;
+    /* Size of memory side cache in bytes. */
+    uint64_t    size;
+    /* Total cache levels for this memory proximity domain. */
+    uint8_t     total_levels;
+    /* Cache level described in this structure. */
+    uint8_t     level;
+    /* Cache Associativity: None/Direct Mapped/Comple Cache Indexing */
+    uint8_t     associativity;
+    /* Write Policy: None/Write Back(WB)/Write Through(WT) */
+    uint8_t     write_policy;
+    /* Cache Line size in bytes. */
+    uint16_t    line_size;
+};
+
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *nstat);
 
 #endif
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c0257e936b..d971f5109e 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -33,6 +33,7 @@ typedef struct FWCfgEntry FWCfgEntry;
 typedef struct FWCfgIoState FWCfgIoState;
 typedef struct FWCfgMemState FWCfgMemState;
 typedef struct FWCfgState FWCfgState;
+typedef struct HMAT_Cache_Info HMAT_Cache_Info;
 typedef struct HMAT_LB_Info HMAT_LB_Info;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index 85ddad99b4..1ed3362917 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -33,6 +33,9 @@ struct NumaState {
 
     /* NUMA modes HMAT Locality Latency and Bandwidth Information */
     HMAT_LB_Info *hmat_lb[HMAT_LB_LEVELS][HMAT_LB_TYPES];
+
+    /* Memory Side Cache Information Structure */
+    HMAT_Cache_Info *hmat_cache[MAX_NODES][MAX_HMAT_CACHE_LEVEL + 1];
 };
 typedef struct NumaState NumaState;
 
diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index fc638f06cd..45525ff8ae 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -144,6 +144,8 @@ enum {
     HMAT_LB_DATA_WRITE_BANDWIDTH  = 5,
 };
 
+#define MAX_HMAT_CACHE_LEVEL        3
+
 #define HMAT_LB_LEVELS    (HMAT_LB_MEM_CACHE_3RD_LEVEL + 1)
 #define HMAT_LB_TYPES     (HMAT_LB_DATA_WRITE_BANDWIDTH + 1)
 
-- 
2.20.1


