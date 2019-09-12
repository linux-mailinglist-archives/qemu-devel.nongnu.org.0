Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4DB0876
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 07:51:00 +0200 (CEST)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8I0R-0007Y3-9H
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 01:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1i8Hn1-0003bx-1m
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:37:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1i8Hmy-000315-Kb
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:37:06 -0400
Received: from mga11.intel.com ([192.55.52.93]:18624)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1i8Hmy-0002zn-8C
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 01:37:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 22:37:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,495,1559545200"; d="scan'208";a="186030821"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga007.fm.intel.com with ESMTP; 11 Sep 2019 22:37:02 -0700
From: Tao Xu <tao3.xu@intel.com>
To: imammedo@redhat.com,
	eblake@redhat.com,
	ehabkost@redhat.com
Date: Thu, 12 Sep 2019 13:36:37 +0800
Message-Id: <20190912053638.4858-11-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912053638.4858-1-tao3.xu@intel.com>
References: <20190912053638.4858-1-tao3.xu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v11 10/11] hmat acpi: Build Memory Side Cache
 Information Structure(s)
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
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, dan.j.williams@intel.com
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

Changes in v11:
    - Move numa option patches forward.
---
 hw/acpi/hmat.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 2d76dd0cd1..17a6afec99 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -160,13 +160,62 @@ static void build_hmat_lb(GArray *table_data, HMAT_LB_Info *hmat_lb,
     }
 }
 
+/* ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure: Table 5-147 */
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
     uint32_t *initiator_list;
-    int i, j, hrchy, type;
+    int i, j, hrchy, type, level;
     HMAT_LB_Info *numa_hmat_lb;
+    HMAT_Cache_Info *numa_hmat_cache;
 
     for (i = 0; i < nstat->num_nodes; i++) {
         flags = 0;
@@ -202,6 +251,19 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *nstat)
             }
         }
     }
+
+    /*
+     * ACPI 6.3: 5.2.27.5 Memory Side Cache Information Structure:
+     * Table 5-147
+     */
+    for (i = 0; i < nstat->num_nodes; i++) {
+        for (level = 0; level <= MAX_HMAT_CACHE_LEVEL; level++) {
+            numa_hmat_cache = nstat->hmat_cache[i][level];
+            if (numa_hmat_cache) {
+                build_hmat_cache(table_data, numa_hmat_cache);
+            }
+        }
+    }
     g_free(initiator_list);
 }
 
-- 
2.20.1


