Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A366BEEF3
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 17:55:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdDMG-0002xY-P9; Fri, 17 Mar 2023 12:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDME-0002wF-Tq
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:55:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pdDMC-0001hJ-VT
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 12:55:10 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PdVb16bZ9z6J7TT;
 Sat, 18 Mar 2023 00:54:05 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 16:55:05 +0000
To: Michael Tsirkin <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <linuxarm@huawei.com>, <ani@anisinha.ca>, <berrange@redhat.com>, Fan Ni
 <fan.ni@samsung.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [RFC PATCH 1/4] hw/acpi: Make Aml and / or crs_range_set optional in
 build_crs
Date: Fri, 17 Mar 2023 16:54:37 +0000
Message-ID: <20230317165440.24846-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
References: <20230317165440.24846-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This allows the same code to be used for two purposes.
1) To fill in the crs_range_set as is later used to
generate the actual AML for the primary PCI host bridge.
2) Create the _CRS AML for the PXB bridges.

The separation is need to allow for DSDT to be generated
before an SSDT for any PXB instances present.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

This could be refactored so that the if (crs) and if (crs_range_set)
checks only occur once, but that then separates the iterating over the
groups and will leave us with two locations to keep up to date for
any future changes. If we did that it would probably make sense to just
split the function.
---
 hw/acpi/aml-build.c         | 75 +++++++++++++++++++++----------------
 hw/i386/acpi-build.c        |  5 ++-
 hw/pci-host/gpex-acpi.c     |  5 ++-
 include/hw/acpi/aml-build.h |  4 +-
 4 files changed, 51 insertions(+), 38 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ea331a20d1..918cbb5b9d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2266,11 +2266,10 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 }
 #endif
 
-Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
+void build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
-               uint16_t bus_nr_offset)
+               uint16_t bus_nr_offset, Aml *crs)
 {
-    Aml *crs = aml_resource_template();
     CrsRangeSet temp_range_set;
     CrsRangeEntry *entry;
     uint8_t max_bus = pci_bus_num(host->bus);
@@ -2380,12 +2379,16 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
     crs_range_merge(temp_range_set.io_ranges);
     for (i = 0; i < temp_range_set.io_ranges->len; i++) {
         entry = g_ptr_array_index(temp_range_set.io_ranges, i);
-        aml_append(crs,
-                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
-                                AML_POS_DECODE, AML_ENTIRE_RANGE,
-                                0, entry->base, entry->limit, io_offset,
-                                entry->limit - entry->base + 1));
-        crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
+        if (crs) {
+            aml_append(crs,
+                       aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                                    AML_POS_DECODE, AML_ENTIRE_RANGE,
+                                    0, entry->base, entry->limit, io_offset,
+                                    entry->limit - entry->base + 1));
+        }
+        if (range_set) {
+            crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
+        }
     }
 
     crs_range_merge(temp_range_set.mem_ranges);
@@ -2393,39 +2396,47 @@ Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
         entry = g_ptr_array_index(temp_range_set.mem_ranges, i);
         assert(entry->limit <= UINT32_MAX &&
                (entry->limit - entry->base + 1) <= UINT32_MAX);
-        aml_append(crs,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
-                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
-                                    AML_READ_WRITE,
-                                    0, entry->base, entry->limit, mmio32_offset,
-                                    entry->limit - entry->base + 1));
-        crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
+        if (crs) {
+            aml_append(crs,
+                       aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                        AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                        AML_READ_WRITE,
+                                        0, entry->base, entry->limit, mmio32_offset,
+                                        entry->limit - entry->base + 1));
+        }
+        if (range_set) {
+            crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
+        }
     }
 
     crs_range_merge(temp_range_set.mem_64bit_ranges);
     for (i = 0; i < temp_range_set.mem_64bit_ranges->len; i++) {
         entry = g_ptr_array_index(temp_range_set.mem_64bit_ranges, i);
-        aml_append(crs,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
-                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
-                                    AML_READ_WRITE,
-                                    0, entry->base, entry->limit, mmio64_offset,
+        if (crs) {
+            aml_append(crs,
+                       aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                        AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                        AML_READ_WRITE,
+                                        0, entry->base, entry->limit, mmio64_offset,
                                     entry->limit - entry->base + 1));
-        crs_range_insert(range_set->mem_64bit_ranges,
-                         entry->base, entry->limit);
+        }
+        if (range_set) {
+            crs_range_insert(range_set->mem_64bit_ranges,
+                             entry->base, entry->limit);
+        }
     }
 
     crs_range_set_free(&temp_range_set);
 
-    aml_append(crs,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                            0,
-                            pci_bus_num(host->bus),
-                            max_bus,
-                            bus_nr_offset,
-                            max_bus - pci_bus_num(host->bus) + 1));
-
-    return crs;
+    if (crs) {
+        aml_append(crs,
+                   aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                                       0,
+                                       pci_bus_num(host->bus),
+                                       max_bus,
+                                       bus_nr_offset,
+                                       max_bus - pci_bus_num(host->bus) + 1));
+    }
 }
 
 /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ec857a117e..d79d1d6f13 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1606,8 +1606,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
             }
 
             aml_append(dev, build_prt(false));
-            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
-                            0, 0, 0, 0);
+            crs = aml_resource_template();
+            build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
+                      0, 0, 0, 0, crs);
             aml_append(dev, aml_name_decl("_CRS", crs));
             aml_append(scope, dev);
             aml_append(dsdt, scope);
diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index 7c7316bc96..6a52d3ea77 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -181,8 +181,9 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
              * 1. The resources the pci-brige/pcie-root-port need.
              * 2. The resources the devices behind pxb need.
              */
-            crs = build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
-                            cfg->pio.base, 0, 0, 0);
+            crs = aml_resource_template();
+            build_crs(PCI_HOST_BRIDGE(BUS(bus)->parent), &crs_range_set,
+                      cfg->pio.base, 0, 0, 0, crs);
             aml_append(dev, aml_name_decl("_CRS", crs));
 
             if (is_cxl) {
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index d1fb08514b..fc2b949fb5 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -479,9 +479,9 @@ void crs_replace_with_free_ranges(GPtrArray *ranges,
 void crs_range_set_init(CrsRangeSet *range_set);
 void crs_range_set_free(CrsRangeSet *range_set);
 
-Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
+void build_crs(PCIHostState *host, CrsRangeSet *range_set, uint32_t io_offset,
                uint32_t mmio32_offset, uint64_t mmio64_offset,
-               uint16_t bus_nr_offset);
+               uint16_t bus_nr_offset, Aml *crs);
 
 void build_srat_memory(GArray *table_data, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
-- 
2.37.2


