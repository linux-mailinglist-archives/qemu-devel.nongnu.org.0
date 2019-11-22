Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB325106772
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 09:03:03 +0100 (CET)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iY3uA-0004Fa-M3
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 03:03:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iY3gn-0005vS-9i
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iY3gl-000300-St
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:49:13 -0500
Received: from mga18.intel.com ([134.134.136.126]:36768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iY3gl-0002kF-L3
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 02:49:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 23:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,229,1571727600"; d="scan'208";a="210178609"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by orsmga003.jf.intel.com with ESMTP; 21 Nov 2019 23:49:08 -0800
From: Tao Xu <tao3.xu@intel.com>
To: mst@redhat.com, imammedo@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, armbru@redhat.com,
 sw@weilnetz.de, mdroth@linux.vnet.ibm.com, thuth@redhat.com,
 lvivier@redhat.com
Subject: [PATCH v17 12/14] hmat acpi: Build Memory Side Cache Information
 Structure(s)
Date: Fri, 22 Nov 2019 15:48:24 +0800
Message-Id: <20191122074826.1373-13-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122074826.1373-1-tao3.xu@intel.com>
References: <20191122074826.1373-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
 qemu-devel@nongnu.org, Daniel Black <daniel@linux.ibm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liu Jingqi <jingqi.liu@intel.com>

This structure describes memory side cache information for memory
proximity domains if the memory side cache is present and the
physical device forms the memory side cache.
The software could use this information to effectively place
the data in memory to maximize the performance of the system
memory that use the memory side cache.

Reviewed-by: Daniel Black <daniel@linux.ibm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Liu Jingqi <jingqi.liu@intel.com>
Signed-off-by: Tao Xu <tao3.xu@intel.com>
---

No changes in v17.

Changes in v16:
    - Use checks and assert to replace masks (Igor)
    - Fields in Cache Attributes are promoted to uint32_t before
      shifting (Igor)
    - Drop cpu_to_le32() (Igor)

Changes in v13:
    - rename level as cache_level
---
 hw/acpi/hmat.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index e5ee8b4317..bb6adb0ccf 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -143,14 +143,62 @@ static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
     g_free(entry_list);
 }
 
+/* ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure: Table 5-147 */
+static void build_hmat_cache(GArray *table_data, uint8_t total_levels,
+                             NumaHmatCacheOptions *hmat_cache)
+{
+    /*
+     * Cache Attributes: Bits [3:0] – Total Cache Levels
+     * for this Memory Proximity Domain
+     */
+    uint32_t cache_attr = total_levels;
+
+    /* Bits [7:4] : Cache Level described in this structure */
+    cache_attr |= (uint32_t) hmat_cache->level << 4;
+
+    /* Bits [11:8] - Cache Associativity */
+    cache_attr |= (uint32_t) hmat_cache->assoc << 8;
+
+    /* Bits [15:12] - Write Policy */
+    cache_attr |= (uint32_t) hmat_cache->policy << 12;
+
+    /* Bits [31:16] - Cache Line size in bytes */
+    cache_attr |= (uint32_t) hmat_cache->line << 16;
+
+    /* Type */
+    build_append_int_noprefix(table_data, 2, 2);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Length */
+    build_append_int_noprefix(table_data, 32, 4);
+    /* Proximity Domain for the Memory */
+    build_append_int_noprefix(table_data, hmat_cache->node_id, 4);
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
 static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 {
     uint16_t flags;
     uint32_t num_initiator = 0;
     uint32_t initiator_list[MAX_NODES];
-    int i, hierarchy, type;
+    int i, hierarchy, type, cache_level, total_levels;
     HMAT_LB_Info *hmat_lb;
+    NumaHmatCacheOptions *hmat_cache;
 
     for (i = 0; i < numa_state->num_nodes; i++) {
         flags = 0;
@@ -184,6 +232,25 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
             }
         }
     }
+
+    /*
+     * ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure:
+     * Table 5-147
+     */
+    for (i = 0; i < numa_state->num_nodes; i++) {
+        total_levels = 0;
+        for (cache_level = 1; cache_level < HMAT_LB_LEVELS; cache_level++) {
+            if (numa_state->hmat_cache[i][cache_level]) {
+                total_levels++;
+            }
+        }
+        for (cache_level = 0; cache_level <= total_levels; cache_level++) {
+            hmat_cache = numa_state->hmat_cache[i][cache_level];
+            if (hmat_cache) {
+                build_hmat_cache(table_data, total_levels, hmat_cache);
+            }
+        }
+    }
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state)
-- 
2.20.1


