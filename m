Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA752D32C9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 20:48:44 +0100 (CET)
Received: from localhost ([::1]:55014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmiyZ-0007et-VO
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 14:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikl-00057O-PZ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kmikg-0004qj-A4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TVR/3R4ZqClFMyO1Kzexn8XC/0JTzZKpKAnPNCHy7i0=;
 b=iLNf/QFVf1aJIpLuoEwW6ethNsQG4BukoBc8uwW6oA8DW7cKFPet9aSLDvYWQCXPJraFcW
 tKOaf3DyRzt6g3yPW7aaFhdm9+1zZdMDvRBzyOYhC5xPHJyz6lJelMyxDA8NTTI5eI1Adk
 ynDvDLo2sPAkbE5P3gB26XoGslf88VQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-mktStFnMMwCTGC_xvXopwQ-1; Tue, 08 Dec 2020 14:34:19 -0500
X-MC-Unique: mktStFnMMwCTGC_xvXopwQ-1
Received: by mail-wr1-f72.google.com with SMTP id o17so37100wra.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:34:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TVR/3R4ZqClFMyO1Kzexn8XC/0JTzZKpKAnPNCHy7i0=;
 b=qNPomcFr33oyg9pIzRUJa/xJ6lpM4afAou+HRYC2dVRKEQgCQK7tmGqv6yhvlzxH2T
 lTWNXNjm+VSbzXc81LpHrLm+ANXOPreiiSjP3vmilVIuL9N38WHmNMvAdwABW5VZsO8U
 i7LCWSw26Xorwmi/bePTWaLzdKLlxkOA4xMyK5DNYhm16mYoBdbHjgQFSbOtXZkFgz0+
 tjOaGl9JNGnvWUu5xXdRRCoVBJTNE8QUvAZThcR/JgHwfd9Lkq1zl9RqjKdfp3n1mrjL
 LOOLUNkstoyNdD+N4iTxMxDv7JhPreQRXnSp+b86WR5hvg4xFBjeEWbUbIrcGW0TB7zD
 ZMww==
X-Gm-Message-State: AOAM530aBmR49zrdx3e21LL/gc9SLmVE4/wZoDIvklYSWuptnGxox5Ft
 rb2zoPW8yb15o0GbbtKp6U4VP37o7gT1jAEZS/oPHpEm/rzA4BiTHPmEm3pVWLdoLrAlhiqxnCa
 1AcMEvuovjgDhShotEOLL6icysRz6Isy2hsRiQ5Q1ToIMhRTJ9MWL7lrmIsZQ
X-Received: by 2002:adf:8285:: with SMTP id 5mr12816676wrc.289.1607456056634; 
 Tue, 08 Dec 2020 11:34:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMOl7G+ioQmloLaBk1+tXnmWQgm0LTnxGFUWwK132nHjyiUS7BHyGkViF54vS9YVL2ZPjMJw==
X-Received: by 2002:adf:8285:: with SMTP id 5mr12816647wrc.289.1607456056304; 
 Tue, 08 Dec 2020 11:34:16 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id r20sm2584461wrg.66.2020.12.08.11.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:34:15 -0800 (PST)
Date: Tue, 8 Dec 2020 14:34:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/66] acpi: Extract crs build form acpi_build.c
Message-ID: <20201208193307.646726-12-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yubo Miao <miaoyubo@huawei.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yubo Miao <miaoyubo@huawei.com>

Extract crs build form acpi_build.c, the function could also be used
to build the crs for pxbs for arm. The resources are composed by two parts:
1. The bar space of pci-bridge/pcie-root-ports
2. The resources needed by devices behind PXBs.
The base and limit of memory/io are obtained from the config via two APIs:
pci_bridge_get_base and pci_bridge_get_limit

Signed-off-by: Yubo Miao <miaoyubo@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Message-Id: <20201119014841.7298-5-cenjiahui@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  22 +++
 hw/acpi/aml-build.c         | 285 +++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c        | 293 ------------------------------------
 3 files changed, 307 insertions(+), 293 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index fe0055fffb..e727bea1bc 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -224,6 +224,20 @@ struct AcpiBuildTables {
     BIOSLinker *linker;
 } AcpiBuildTables;
 
+typedef
+struct CrsRangeEntry {
+    uint64_t base;
+    uint64_t limit;
+} CrsRangeEntry;
+
+typedef
+struct CrsRangeSet {
+    GPtrArray *io_ranges;
+    GPtrArray *mem_ranges;
+    GPtrArray *mem_64bit_ranges;
+} CrsRangeSet;
+
+
 /*
  * ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors
  * Serial Bus Type
@@ -432,6 +446,14 @@ build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
                      s->access_width, s->address);
 }
 
+void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit);
+void crs_replace_with_free_ranges(GPtrArray *ranges,
+                                         uint64_t start, uint64_t end);
+void crs_range_set_init(CrsRangeSet *range_set);
+void crs_range_set_free(CrsRangeSet *range_set);
+
+Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set);
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3792ba96ce..f976aa667b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -27,6 +27,9 @@
 #include "sysemu/numa.h"
 #include "hw/boards.h"
 #include "hw/acpi/tpm.h"
+#include "hw/pci/pci_host.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_bridge.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -55,6 +58,128 @@ static void build_append_array(GArray *array, GArray *val)
 
 #define ACPI_NAMESEG_LEN 4
 
+void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit)
+{
+    CrsRangeEntry *entry;
+
+    entry = g_malloc(sizeof(*entry));
+    entry->base = base;
+    entry->limit = limit;
+
+    g_ptr_array_add(ranges, entry);
+}
+
+static void crs_range_free(gpointer data)
+{
+    CrsRangeEntry *entry = (CrsRangeEntry *)data;
+    g_free(entry);
+}
+
+void crs_range_set_init(CrsRangeSet *range_set)
+{
+    range_set->io_ranges = g_ptr_array_new_with_free_func(crs_range_free);
+    range_set->mem_ranges = g_ptr_array_new_with_free_func(crs_range_free);
+    range_set->mem_64bit_ranges =
+            g_ptr_array_new_with_free_func(crs_range_free);
+}
+
+void crs_range_set_free(CrsRangeSet *range_set)
+{
+    g_ptr_array_free(range_set->io_ranges, true);
+    g_ptr_array_free(range_set->mem_ranges, true);
+    g_ptr_array_free(range_set->mem_64bit_ranges, true);
+}
+
+static gint crs_range_compare(gconstpointer a, gconstpointer b)
+{
+    CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
+    CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
+
+    if (entry_a->base < entry_b->base) {
+        return -1;
+    } else if (entry_a->base > entry_b->base) {
+        return 1;
+    } else {
+        return 0;
+    }
+}
+
+/*
+ * crs_replace_with_free_ranges - given the 'used' ranges within [start - end]
+ * interval, computes the 'free' ranges from the same interval.
+ * Example: If the input array is { [a1 - a2],[b1 - b2] }, the function
+ * will return { [base - a1], [a2 - b1], [b2 - limit] }.
+ */
+void crs_replace_with_free_ranges(GPtrArray *ranges,
+                                  uint64_t start, uint64_t end)
+{
+    GPtrArray *free_ranges = g_ptr_array_new();
+    uint64_t free_base = start;
+    int i;
+
+    g_ptr_array_sort(ranges, crs_range_compare);
+    for (i = 0; i < ranges->len; i++) {
+        CrsRangeEntry *used = g_ptr_array_index(ranges, i);
+
+        if (free_base < used->base) {
+            crs_range_insert(free_ranges, free_base, used->base - 1);
+        }
+
+        free_base = used->limit + 1;
+    }
+
+    if (free_base < end) {
+        crs_range_insert(free_ranges, free_base, end);
+    }
+
+    g_ptr_array_set_size(ranges, 0);
+    for (i = 0; i < free_ranges->len; i++) {
+        g_ptr_array_add(ranges, g_ptr_array_index(free_ranges, i));
+    }
+
+    g_ptr_array_free(free_ranges, true);
+}
+
+/*
+ * crs_range_merge - merges adjacent ranges in the given array.
+ * Array elements are deleted and replaced with the merged ranges.
+ */
+static void crs_range_merge(GPtrArray *range)
+{
+    GPtrArray *tmp = g_ptr_array_new_with_free_func(crs_range_free);
+    CrsRangeEntry *entry;
+    uint64_t range_base, range_limit;
+    int i;
+
+    if (!range->len) {
+        return;
+    }
+
+    g_ptr_array_sort(range, crs_range_compare);
+
+    entry = g_ptr_array_index(range, 0);
+    range_base = entry->base;
+    range_limit = entry->limit;
+    for (i = 1; i < range->len; i++) {
+        entry = g_ptr_array_index(range, i);
+        if (entry->base - 1 == range_limit) {
+            range_limit = entry->limit;
+        } else {
+            crs_range_insert(tmp, range_base, range_limit);
+            range_base = entry->base;
+            range_limit = entry->limit;
+        }
+    }
+    crs_range_insert(tmp, range_base, range_limit);
+
+    g_ptr_array_set_size(range, 0);
+    for (i = 0; i < tmp->len; i++) {
+        entry = g_ptr_array_index(tmp, i);
+        crs_range_insert(range, entry->base, entry->limit);
+    }
+    g_ptr_array_free(tmp, true);
+}
+
 static void
 build_append_nameseg(GArray *array, const char *seg)
 {
@@ -1951,6 +2076,166 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                  tpm2_ptr, "TPM2", table_data->len - tpm2_start, 4, NULL, NULL);
 }
 
+Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
+{
+    Aml *crs = aml_resource_template();
+    CrsRangeSet temp_range_set;
+    CrsRangeEntry *entry;
+    uint8_t max_bus = pci_bus_num(host->bus);
+    uint8_t type;
+    int devfn;
+    int i;
+
+    crs_range_set_init(&temp_range_set);
+    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
+        uint64_t range_base, range_limit;
+        PCIDevice *dev = host->bus->devices[devfn];
+
+        if (!dev) {
+            continue;
+        }
+
+        for (i = 0; i < PCI_NUM_REGIONS; i++) {
+            PCIIORegion *r = &dev->io_regions[i];
+
+            range_base = r->addr;
+            range_limit = r->addr + r->size - 1;
+
+            /*
+             * Work-around for old bioses
+             * that do not support multiple root buses
+             */
+            if (!range_base || range_base > range_limit) {
+                continue;
+            }
+
+            if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
+                crs_range_insert(temp_range_set.io_ranges,
+                                 range_base, range_limit);
+            } else { /* "memory" */
+                uint64_t length = range_limit - range_base + 1;
+                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
+                    crs_range_insert(temp_range_set.mem_ranges, range_base,
+                                     range_limit);
+                } else {
+                    crs_range_insert(temp_range_set.mem_64bit_ranges,
+                                     range_base, range_limit);
+                }
+            }
+        }
+
+        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
+        if (type == PCI_HEADER_TYPE_BRIDGE) {
+            uint8_t subordinate = dev->config[PCI_SUBORDINATE_BUS];
+            if (subordinate > max_bus) {
+                max_bus = subordinate;
+            }
+
+            range_base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_IO);
+            range_limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_IO);
+
+             /*
+              * Work-around for old bioses
+              * that do not support multiple root buses
+              */
+            if (range_base && range_base <= range_limit) {
+                crs_range_insert(temp_range_set.io_ranges,
+                                 range_base, range_limit);
+            }
+
+            range_base =
+                pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
+            range_limit =
+                pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
+
+            /*
+             * Work-around for old bioses
+             * that do not support multiple root buses
+             */
+            if (range_base && range_base <= range_limit) {
+                uint64_t length = range_limit - range_base + 1;
+                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
+                    crs_range_insert(temp_range_set.mem_ranges,
+                                     range_base, range_limit);
+                } else {
+                    crs_range_insert(temp_range_set.mem_64bit_ranges,
+                                     range_base, range_limit);
+                }
+            }
+
+            range_base =
+                pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
+            range_limit =
+                pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
+
+            /*
+             * Work-around for old bioses
+             * that do not support multiple root buses
+             */
+            if (range_base && range_base <= range_limit) {
+                uint64_t length = range_limit - range_base + 1;
+                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
+                    crs_range_insert(temp_range_set.mem_ranges,
+                                     range_base, range_limit);
+                } else {
+                    crs_range_insert(temp_range_set.mem_64bit_ranges,
+                                     range_base, range_limit);
+                }
+            }
+        }
+    }
+
+    crs_range_merge(temp_range_set.io_ranges);
+    for (i = 0; i < temp_range_set.io_ranges->len; i++) {
+        entry = g_ptr_array_index(temp_range_set.io_ranges, i);
+        aml_append(crs,
+                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
+                               AML_POS_DECODE, AML_ENTIRE_RANGE,
+                               0, entry->base, entry->limit, 0,
+                               entry->limit - entry->base + 1));
+        crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
+    }
+
+    crs_range_merge(temp_range_set.mem_ranges);
+    for (i = 0; i < temp_range_set.mem_ranges->len; i++) {
+        entry = g_ptr_array_index(temp_range_set.mem_ranges, i);
+        assert(entry->limit <= UINT32_MAX &&
+               (entry->limit - entry->base + 1) <= UINT32_MAX);
+        aml_append(crs,
+                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0, entry->base, entry->limit, 0,
+                                    entry->limit - entry->base + 1));
+        crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
+    }
+
+    crs_range_merge(temp_range_set.mem_64bit_ranges);
+    for (i = 0; i < temp_range_set.mem_64bit_ranges->len; i++) {
+        entry = g_ptr_array_index(temp_range_set.mem_64bit_ranges, i);
+        aml_append(crs,
+                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
+                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
+                                    AML_READ_WRITE,
+                                    0, entry->base, entry->limit, 0,
+                                    entry->limit - entry->base + 1));
+        crs_range_insert(range_set->mem_64bit_ranges,
+                         entry->base, entry->limit);
+    }
+
+    crs_range_set_free(&temp_range_set);
+
+    aml_append(crs,
+        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                            0,
+                            pci_bus_num(host->bus),
+                            max_bus,
+                            0,
+                            max_bus - pci_bus_num(host->bus) + 1));
+
+    return crs;
+}
+
 /* ACPI 5.0: 6.4.3.8.2 Serial Bus Connection Descriptors */
 static Aml *aml_serial_bus_device(uint8_t serial_bus_type, uint8_t flags,
                                   uint16_t type_flags,
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1f5c211245..76e27f8fad 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -613,299 +613,6 @@ static Aml *build_prt(bool is_pci0_prt)
     return method;
 }
 
-typedef struct CrsRangeEntry {
-    uint64_t base;
-    uint64_t limit;
-} CrsRangeEntry;
-
-static void crs_range_insert(GPtrArray *ranges, uint64_t base, uint64_t limit)
-{
-    CrsRangeEntry *entry;
-
-    entry = g_malloc(sizeof(*entry));
-    entry->base = base;
-    entry->limit = limit;
-
-    g_ptr_array_add(ranges, entry);
-}
-
-static void crs_range_free(gpointer data)
-{
-    CrsRangeEntry *entry = (CrsRangeEntry *)data;
-    g_free(entry);
-}
-
-typedef struct CrsRangeSet {
-    GPtrArray *io_ranges;
-    GPtrArray *mem_ranges;
-    GPtrArray *mem_64bit_ranges;
- } CrsRangeSet;
-
-static void crs_range_set_init(CrsRangeSet *range_set)
-{
-    range_set->io_ranges = g_ptr_array_new_with_free_func(crs_range_free);
-    range_set->mem_ranges = g_ptr_array_new_with_free_func(crs_range_free);
-    range_set->mem_64bit_ranges =
-            g_ptr_array_new_with_free_func(crs_range_free);
-}
-
-static void crs_range_set_free(CrsRangeSet *range_set)
-{
-    g_ptr_array_free(range_set->io_ranges, true);
-    g_ptr_array_free(range_set->mem_ranges, true);
-    g_ptr_array_free(range_set->mem_64bit_ranges, true);
-}
-
-static gint crs_range_compare(gconstpointer a, gconstpointer b)
-{
-    CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
-    CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
-
-    if (entry_a->base < entry_b->base) {
-        return -1;
-    } else if (entry_a->base > entry_b->base) {
-        return 1;
-    } else {
-        return 0;
-    }
-}
-
-/*
- * crs_replace_with_free_ranges - given the 'used' ranges within [start - end]
- * interval, computes the 'free' ranges from the same interval.
- * Example: If the input array is { [a1 - a2],[b1 - b2] }, the function
- * will return { [base - a1], [a2 - b1], [b2 - limit] }.
- */
-static void crs_replace_with_free_ranges(GPtrArray *ranges,
-                                         uint64_t start, uint64_t end)
-{
-    GPtrArray *free_ranges = g_ptr_array_new();
-    uint64_t free_base = start;
-    int i;
-
-    g_ptr_array_sort(ranges, crs_range_compare);
-    for (i = 0; i < ranges->len; i++) {
-        CrsRangeEntry *used = g_ptr_array_index(ranges, i);
-
-        if (free_base < used->base) {
-            crs_range_insert(free_ranges, free_base, used->base - 1);
-        }
-
-        free_base = used->limit + 1;
-    }
-
-    if (free_base < end) {
-        crs_range_insert(free_ranges, free_base, end);
-    }
-
-    g_ptr_array_set_size(ranges, 0);
-    for (i = 0; i < free_ranges->len; i++) {
-        g_ptr_array_add(ranges, g_ptr_array_index(free_ranges, i));
-    }
-
-    g_ptr_array_free(free_ranges, true);
-}
-
-/*
- * crs_range_merge - merges adjacent ranges in the given array.
- * Array elements are deleted and replaced with the merged ranges.
- */
-static void crs_range_merge(GPtrArray *range)
-{
-    GPtrArray *tmp =  g_ptr_array_new_with_free_func(crs_range_free);
-    CrsRangeEntry *entry;
-    uint64_t range_base, range_limit;
-    int i;
-
-    if (!range->len) {
-        return;
-    }
-
-    g_ptr_array_sort(range, crs_range_compare);
-
-    entry = g_ptr_array_index(range, 0);
-    range_base = entry->base;
-    range_limit = entry->limit;
-    for (i = 1; i < range->len; i++) {
-        entry = g_ptr_array_index(range, i);
-        if (entry->base - 1 == range_limit) {
-            range_limit = entry->limit;
-        } else {
-            crs_range_insert(tmp, range_base, range_limit);
-            range_base = entry->base;
-            range_limit = entry->limit;
-        }
-    }
-    crs_range_insert(tmp, range_base, range_limit);
-
-    g_ptr_array_set_size(range, 0);
-    for (i = 0; i < tmp->len; i++) {
-        entry = g_ptr_array_index(tmp, i);
-        crs_range_insert(range, entry->base, entry->limit);
-    }
-    g_ptr_array_free(tmp, true);
-}
-
-static Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
-{
-    Aml *crs = aml_resource_template();
-    CrsRangeSet temp_range_set;
-    CrsRangeEntry *entry;
-    uint8_t max_bus = pci_bus_num(host->bus);
-    uint8_t type;
-    int devfn;
-    int i;
-
-    crs_range_set_init(&temp_range_set);
-    for (devfn = 0; devfn < ARRAY_SIZE(host->bus->devices); devfn++) {
-        uint64_t range_base, range_limit;
-        PCIDevice *dev = host->bus->devices[devfn];
-
-        if (!dev) {
-            continue;
-        }
-
-        for (i = 0; i < PCI_NUM_REGIONS; i++) {
-            PCIIORegion *r = &dev->io_regions[i];
-
-            range_base = r->addr;
-            range_limit = r->addr + r->size - 1;
-
-            /*
-             * Work-around for old bioses
-             * that do not support multiple root buses
-             */
-            if (!range_base || range_base > range_limit) {
-                continue;
-            }
-
-            if (r->type & PCI_BASE_ADDRESS_SPACE_IO) {
-                crs_range_insert(temp_range_set.io_ranges,
-                                 range_base, range_limit);
-            } else { /* "memory" */
-                uint64_t length = range_limit - range_base + 1;
-                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
-                    crs_range_insert(temp_range_set.mem_ranges, range_base,
-                                     range_limit);
-                } else {
-                    crs_range_insert(temp_range_set.mem_64bit_ranges,
-                                     range_base, range_limit);
-                }
-            }
-        }
-
-        type = dev->config[PCI_HEADER_TYPE] & ~PCI_HEADER_TYPE_MULTI_FUNCTION;
-        if (type == PCI_HEADER_TYPE_BRIDGE) {
-            uint8_t subordinate = dev->config[PCI_SUBORDINATE_BUS];
-            if (subordinate > max_bus) {
-                max_bus = subordinate;
-            }
-
-            range_base = pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_IO);
-            range_limit = pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_IO);
-
-            /*
-             * Work-around for old bioses
-             * that do not support multiple root buses
-             */
-            if (range_base && range_base <= range_limit) {
-                crs_range_insert(temp_range_set.io_ranges,
-                                 range_base, range_limit);
-            }
-
-            range_base =
-                pci_bridge_get_base(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
-            range_limit =
-                pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_SPACE_MEMORY);
-
-            /*
-             * Work-around for old bioses
-             * that do not support multiple root buses
-             */
-            if (range_base && range_base <= range_limit) {
-                uint64_t length = range_limit - range_base + 1;
-                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
-                    crs_range_insert(temp_range_set.mem_ranges,
-                                     range_base, range_limit);
-                } else {
-                    crs_range_insert(temp_range_set.mem_64bit_ranges,
-                                     range_base, range_limit);
-                }
-            }
-
-            range_base =
-                pci_bridge_get_base(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
-            range_limit =
-                pci_bridge_get_limit(dev, PCI_BASE_ADDRESS_MEM_PREFETCH);
-
-            /*
-             * Work-around for old bioses
-             * that do not support multiple root buses
-             */
-            if (range_base && range_base <= range_limit) {
-                uint64_t length = range_limit - range_base + 1;
-                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
-                    crs_range_insert(temp_range_set.mem_ranges,
-                                     range_base, range_limit);
-                } else {
-                    crs_range_insert(temp_range_set.mem_64bit_ranges,
-                                     range_base, range_limit);
-                }
-            }
-        }
-    }
-
-    crs_range_merge(temp_range_set.io_ranges);
-    for (i = 0; i < temp_range_set.io_ranges->len; i++) {
-        entry = g_ptr_array_index(temp_range_set.io_ranges, i);
-        aml_append(crs,
-                   aml_word_io(AML_MIN_FIXED, AML_MAX_FIXED,
-                               AML_POS_DECODE, AML_ENTIRE_RANGE,
-                               0, entry->base, entry->limit, 0,
-                               entry->limit - entry->base + 1));
-        crs_range_insert(range_set->io_ranges, entry->base, entry->limit);
-    }
-
-    crs_range_merge(temp_range_set.mem_ranges);
-    for (i = 0; i < temp_range_set.mem_ranges->len; i++) {
-        entry = g_ptr_array_index(temp_range_set.mem_ranges, i);
-        assert(entry->limit <= UINT32_MAX &&
-               (entry->limit - entry->base + 1) <= UINT32_MAX);
-        aml_append(crs,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED,
-                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
-                                    AML_READ_WRITE,
-                                    0, entry->base, entry->limit, 0,
-                                    entry->limit - entry->base + 1));
-        crs_range_insert(range_set->mem_ranges, entry->base, entry->limit);
-    }
-
-    crs_range_merge(temp_range_set.mem_64bit_ranges);
-    for (i = 0; i < temp_range_set.mem_64bit_ranges->len; i++) {
-        entry = g_ptr_array_index(temp_range_set.mem_64bit_ranges, i);
-        aml_append(crs,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED,
-                                    AML_MAX_FIXED, AML_NON_CACHEABLE,
-                                    AML_READ_WRITE,
-                                    0, entry->base, entry->limit, 0,
-                                    entry->limit - entry->base + 1));
-        crs_range_insert(range_set->mem_64bit_ranges,
-                         entry->base, entry->limit);
-    }
-
-    crs_range_set_free(&temp_range_set);
-
-    aml_append(crs,
-        aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                            0,
-                            pci_bus_num(host->bus),
-                            max_bus,
-                            0,
-                            max_bus - pci_bus_num(host->bus) + 1));
-
-    return crs;
-}
-
 static void build_hpet_aml(Aml *table)
 {
     Aml *crs;
-- 
MST


