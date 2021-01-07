Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB122ECF00
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:50:17 +0100 (CET)
Received: from localhost ([::1]:53386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTo0-00085W-MU
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThP-00085F-3z
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:27 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cenjiahui@huawei.com>)
 id 1kxThK-0002ps-31
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:43:26 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DBPTq4Yxmzl2FN;
 Thu,  7 Jan 2021 19:42:07 +0800 (CST)
Received: from localhost (10.174.184.155) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 7 Jan 2021
 19:43:08 +0800
From: Jiahui Cen <cenjiahui@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 5/8] acpi/gpex: Exclude pxb's resources from PCI0
Date: Thu, 7 Jan 2021 19:40:40 +0800
Message-ID: <20210107114043.9624-6-cenjiahui@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107114043.9624-1-cenjiahui@huawei.com>
References: <20210107114043.9624-1-cenjiahui@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.155]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=cenjiahui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xieyingtai@huawei.com, Jiahui Cen <cenjiahui@huawei.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exclude the resources of extra root bridges from PCI0's _CRS. Otherwise,
the resource windows would overlap in guest, and the IO resource window
would fail to be registered.

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/pci-host/gpex-acpi.c | 64 +++++++++++++-------
 1 file changed, 43 insertions(+), 21 deletions(-)

diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
index cb13e75d2f..446912d771 100644
--- a/hw/pci-host/gpex-acpi.c
+++ b/hw/pci-host/gpex-acpi.c
@@ -146,6 +146,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     Aml *method, *crs, *dev, *rbuf;
     PCIBus *bus = cfg->bus;
     CrsRangeSet crs_range_set;
+    CrsRangeEntry *entry;
+    int i;
 
     /* start to construct the tables for pxb */
     crs_range_set_init(&crs_range_set);
@@ -193,7 +195,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
             aml_append(scope, dev);
         }
     }
-    crs_range_set_free(&crs_range_set);
 
     /* tables for the main */
     dev = aml_device("%s", "PCI0");
@@ -211,36 +212,55 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(method, aml_return(aml_int(cfg->ecam.base)));
     aml_append(dev, method);
 
+    /*
+     * At this point crs_range_set has all the ranges used by pci
+     * busses *other* than PCI0.  These ranges will be excluded from
+     * the PCI0._CRS.
+     */
     rbuf = aml_resource_template();
     aml_append(rbuf,
         aml_word_bus_number(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
                             0x0000, 0x0000, nr_pcie_buses - 1, 0x0000,
                             nr_pcie_buses));
     if (cfg->mmio32.size) {
-        aml_append(rbuf,
-                   aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio32.base,
-                                    cfg->mmio32.base + cfg->mmio32.size - 1,
-                                    0x0000,
-                                    cfg->mmio32.size));
+        crs_replace_with_free_ranges(crs_range_set.mem_ranges,
+                                     cfg->mmio32.base,
+                                     cfg->mmio32.base + cfg->mmio32.size - 1);
+        for (i = 0; i < crs_range_set.mem_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.mem_ranges, i);
+            aml_append(rbuf,
+                aml_dword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                 AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                 entry->base, entry->limit,
+                                 0x0000, entry->limit - entry->base + 1));
+        }
     }
     if (cfg->pio.size) {
-        aml_append(rbuf,
-                   aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
-                                AML_ENTIRE_RANGE, 0x0000, 0x0000,
-                                cfg->pio.size - 1,
-                                cfg->pio.base,
-                                cfg->pio.size));
+        crs_replace_with_free_ranges(crs_range_set.io_ranges,
+                                     0x0000,
+                                     cfg->pio.size - 1);
+        for (i = 0; i < crs_range_set.io_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.io_ranges, i);
+            aml_append(rbuf,
+                aml_dword_io(AML_MIN_FIXED, AML_MAX_FIXED, AML_POS_DECODE,
+                             AML_ENTIRE_RANGE, 0x0000, entry->base,
+                             entry->limit, cfg->pio.base,
+                             entry->limit - entry->base + 1));
+        }
     }
     if (cfg->mmio64.size) {
-        aml_append(rbuf,
-                   aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
-                                    AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
-                                    cfg->mmio64.base,
-                                    cfg->mmio64.base + cfg->mmio64.size - 1,
-                                    0x0000,
-                                    cfg->mmio64.size));
+        crs_replace_with_free_ranges(crs_range_set.mem_64bit_ranges,
+                                     cfg->mmio64.base,
+                                     cfg->mmio64.base + cfg->mmio64.size - 1);
+        for (i = 0; i < crs_range_set.mem_64bit_ranges->len; i++) {
+            entry = g_ptr_array_index(crs_range_set.mem_64bit_ranges, i);
+            aml_append(rbuf,
+                aml_qword_memory(AML_POS_DECODE, AML_MIN_FIXED, AML_MAX_FIXED,
+                                 AML_NON_CACHEABLE, AML_READ_WRITE, 0x0000,
+                                 entry->base,
+                                 entry->limit, 0x0000,
+                                 entry->limit - entry->base + 1));
+        }
     }
     aml_append(dev, aml_name_decl("_CRS", rbuf));
 
@@ -259,4 +279,6 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
     aml_append(dev_res0, aml_name_decl("_CRS", crs));
     aml_append(dev, dev_res0);
     aml_append(scope, dev);
+
+    crs_range_set_free(&crs_range_set);
 }
-- 
2.29.2


