Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25A3C93AD
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 00:17:31 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3nC6-0005oO-T1
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 18:17:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1m3n9Q-00039t-85; Wed, 14 Jul 2021 18:14:44 -0400
Received: from mail.mutex.one ([62.77.152.124]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1m3n9L-0000no-KC; Wed, 14 Jul 2021 18:14:44 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 14976BF4216D;
 Thu, 15 Jul 2021 01:14:38 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SQOycn8klq8c; Thu, 15 Jul 2021 01:14:35 +0300 (EEST)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.1.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 47667BF42253;
 Thu, 15 Jul 2021 01:14:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1626300875; bh=0y3kAsupOf2n/2nJXHd8epJSGrH1he85JAtQt8O60WQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hA9uX5FrTKvxLMsVLLf7Npc9arjd5NycmvKtfo90U1jafkQuBdcnl90qLBrkbU2u7
 QRGYAC90xoOg4wx0sRFTA20q0td632MSCLAMsnxljl7hUE7hZ7YX8o9Ba63ajHY0jy
 n+EWm20RYr39W01QA1HJ8/fddriVyby4VIbj60bA=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] acpi: Consolidate the handling of OEM ID and OEM Table ID
 fields
Date: Thu, 15 Jul 2021 01:14:09 +0300
Message-Id: <20210714221409.32630-2-posteuca@mutex.one>
In-Reply-To: <20210714221409.32630-1-posteuca@mutex.one>
References: <20210714221409.32630-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "open list : ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Marian Postevca <posteuca@mutex.one>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduces structure AcpiBuildOem to hold the value of OEM fields and
uses dedicated helper functions to initialize/set the values.
Unnecessary dynamically allocated OEM fields are re-factored to static
allocation.

Signed-off-by: Marian Postevca <posteuca@mutex.one>
---
 hw/acpi/hmat.h                   |  2 +-
 hw/i386/acpi-common.h            |  2 +-
 include/hw/acpi/acpi-build-oem.h | 61 +++++++++++++++++++++++++
 include/hw/acpi/aml-build.h      | 15 +++---
 include/hw/acpi/ghes.h           |  2 +-
 include/hw/acpi/pci.h            |  2 +-
 include/hw/acpi/vmgenid.h        |  2 +-
 include/hw/arm/virt.h            |  4 +-
 include/hw/i386/x86.h            |  4 +-
 include/hw/mem/nvdimm.h          |  4 +-
 hw/acpi/aml-build.c              | 26 +++++------
 hw/acpi/ghes-stub.c              |  1 +
 hw/acpi/ghes.c                   |  5 +-
 hw/acpi/hmat.c                   |  4 +-
 hw/acpi/nvdimm.c                 | 22 +++++----
 hw/acpi/pci.c                    |  4 +-
 hw/acpi/vmgenid.c                |  6 ++-
 hw/arm/virt-acpi-build.c         | 40 ++++++----------
 hw/arm/virt.c                    | 16 +++----
 hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------
 hw/i386/acpi-common.c            |  4 +-
 hw/i386/acpi-microvm.c           | 13 ++----
 hw/i386/x86.c                    | 19 ++++----
 23 files changed, 189 insertions(+), 147 deletions(-)
 create mode 100644 include/hw/acpi/acpi-build-oem.h

diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index b57f0e7e80..c1ce9aaa48 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -38,6 +38,6 @@
 #define HMAT_PROXIMITY_INITIATOR_VALID  0x1
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
-                const char *oem_id, const char *oem_table_id);
+                AcpiBuildOem *bld_oem);
 
 #endif
diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
index a68825acf5..f5e793a950 100644
--- a/hw/i386/acpi-common.h
+++ b/hw/i386/acpi-common.h
@@ -10,6 +10,6 @@
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
-                     const char *oem_id, const char *oem_table_id);
+                     AcpiBuildOem *bld_oem);
 
 #endif
diff --git a/include/hw/acpi/acpi-build-oem.h b/include/hw/acpi/acpi-build-oem.h
new file mode 100644
index 0000000000..410ebbb9c5
--- /dev/null
+++ b/include/hw/acpi/acpi-build-oem.h
@@ -0,0 +1,61 @@
+#ifndef QEMU_HW_ACPI_BUILD_OEM_H
+#define QEMU_HW_ACPI_BUILD_OEM_H
+
+/*
+ * Utilities for working with ACPI OEM ID and OEM TABLE ID fields
+ *
+ * Copyright (c) 2021 Marian Postevca
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/cutils.h"
+
+#define ACPI_BUILD_APPNAME6 "BOCHS "
+#define ACPI_BUILD_APPNAME8 "BXPC    "
+
+#define ACPI_BUILD_OEM_ID_SIZE 6
+#define ACPI_BUILD_OEM_TABLE_ID_SIZE 8
+
+typedef struct AcpiBuildOem {
+    char oem_id[ACPI_BUILD_OEM_ID_SIZE + 1];
+    char oem_table_id[ACPI_BUILD_OEM_TABLE_ID_SIZE + 1];
+} AcpiBuildOem;
+
+static inline void ACPI_BUILD_OEM_SET_ID(AcpiBuildOem *bld_oem,
+                                         const char *oem_id)
+{
+    pstrcpy(bld_oem->oem_id, sizeof bld_oem->oem_id, oem_id);
+}
+
+static inline void ACPI_BUILD_OEM_SET_TABLE_ID(AcpiBuildOem *bld_oem,
+                                               const char *oem_table_id)
+{
+    pstrcpy(bld_oem->oem_table_id,
+            sizeof bld_oem->oem_table_id, oem_table_id);
+}
+
+static inline void ACPI_BUILD_OEM_INIT(AcpiBuildOem *bld_oem,
+                                       const char *oem_id,
+                                       const char *oem_table_id)
+{
+    ACPI_BUILD_OEM_SET_ID(bld_oem, oem_id);
+    ACPI_BUILD_OEM_SET_TABLE_ID(bld_oem, oem_table_id);
+}
+
+static inline void ACPI_BUILD_OEM_INIT_DEFAULT(AcpiBuildOem *bld_oem)
+{
+    ACPI_BUILD_OEM_INIT(bld_oem, ACPI_BUILD_APPNAME6, ACPI_BUILD_APPNAME8);
+}
+
+#endif /* QEMU_HW_ACPI_BUILD_OEM_H */
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 471266d739..c19621a29c 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -3,9 +3,8 @@
 
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/acpi/acpi-build-oem.h"
 
-#define ACPI_BUILD_APPNAME6 "BOCHS "
-#define ACPI_BUILD_APPNAME8 "BXPC    "
 
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
@@ -416,7 +415,7 @@ void build_append_int_noprefix(GArray *table, uint64_t value, int size);
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id);
+             AcpiBuildOem *bld_oem);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
@@ -426,10 +425,10 @@ void
 build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id);
+           AcpiBuildOem *bld_oem);
 void
 build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id);
+           AcpiBuildOem *bld_oem);
 
 int
 build_append_named_dword(GArray *array, const char *name_format, ...)
@@ -460,11 +459,11 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags);
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
-                const char *oem_id, const char *oem_table_id);
+                AcpiBuildOem *bld_oem);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
-                const char *oem_id, const char *oem_table_id);
+                AcpiBuildOem *bld_oem);
 
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
-                const char *oem_id, const char *oem_table_id);
+                AcpiBuildOem *bld_oem);
 #endif
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e9..c6dbb076cb 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -69,7 +69,7 @@ typedef struct AcpiGhesState {
 
 void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker);
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
-                     const char *oem_id, const char *oem_table_id);
+                     AcpiBuildOem *bld_oem);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
                           GArray *hardware_errors);
 int acpi_ghes_record_errors(uint8_t notify, uint64_t error_physical_addr);
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index b5deee0a9d..c1a2cbb7e7 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -34,6 +34,6 @@ typedef struct AcpiMcfgInfo {
 } AcpiMcfgInfo;
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
-                const char *oem_id, const char *oem_table_id);
+                AcpiBuildOem *bld_oem);
 Aml *aml_pci_device_dsm(void);
 #endif
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index dc8bb3433e..c4488c5ef8 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -31,7 +31,7 @@ static inline Object *find_vmgenid_dev(void)
 }
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker, const char *oem_id);
+                        BIOSLinker *linker, AcpiBuildOem *bld_oem);
 void vmgenid_add_fw_cfg(VmGenIdState *vms, FWCfgState *s, GArray *guid);
 
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9661c46699..594867807c 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -38,6 +38,7 @@
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi-build-oem.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -165,8 +166,7 @@ struct VirtMachineState {
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
     PCIBus *bus;
-    char *oem_id;
-    char *oem_table_id;
+    AcpiBuildOem bld_oem;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 6e9244a82c..6927219cee 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -27,6 +27,7 @@
 #include "hw/isa/isa.h"
 #include "hw/i386/ioapic.h"
 #include "qom/object.h"
+#include "hw/acpi/acpi-build-oem.h"
 
 struct X86MachineClass {
     /*< private >*/
@@ -66,8 +67,7 @@ struct X86MachineState {
     OnOffAuto smm;
     OnOffAuto acpi;
 
-    char *oem_id;
-    char *oem_table_id;
+    AcpiBuildOem bld_oem;
     /*
      * Address space used by IOAPIC device. All IOAPIC interrupts
      * will be translated to MSI messages in the address space.
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..1c0cc3b5e7 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -154,8 +154,8 @@ void nvdimm_init_acpi_state(NVDIMMState *state, MemoryRegion *io,
 void nvdimm_build_srat(GArray *table_data);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots, const char *oem_id,
-                       const char *oem_table_id);
+                       uint32_t ram_slots,
+                       AcpiBuildOem *bld_oem);
 void nvdimm_plug(NVDIMMState *state);
 void nvdimm_acpi_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d5103e6d7b..c8b95c57f2 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1695,7 +1695,7 @@ Aml *aml_object_type(Aml *object)
 void
 build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_id, const char *oem_table_id)
+             AcpiBuildOem *bld_oem)
 {
     unsigned tbl_offset = (char *)h - table_data->data;
     unsigned checksum_offset = (char *)&h->checksum - table_data->data;
@@ -1703,9 +1703,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
     h->length = cpu_to_le32(len);
     h->revision = rev;
 
-    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
+    strpadcpy((char *)h->oem_id, sizeof h->oem_id, bld_oem->oem_id, ' ');
     strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
-              oem_table_id, ' ');
+              bld_oem->oem_table_id, ' ');
 
     h->oem_revision = cpu_to_le32(1);
     memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
@@ -1825,7 +1825,7 @@ build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
 /* Build rsdt table */
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id)
+           AcpiBuildOem *bld_oem)
 {
     int i;
     unsigned rsdt_entries_offset;
@@ -1848,13 +1848,13 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     }
     build_header(linker, table_data,
                  (void *)(table_data->data + rsdt_start),
-                 "RSDT", rsdt_len, 1, oem_id, oem_table_id);
+                 "RSDT", rsdt_len, 1, bld_oem);
 }
 
 /* Build xsdt table */
 void
 build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
-           const char *oem_id, const char *oem_table_id)
+           AcpiBuildOem *bld_oem)
 {
     int i;
     unsigned xsdt_entries_offset;
@@ -1877,7 +1877,7 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
     }
     build_header(linker, table_data,
                  (void *)(table_data->data + xsdt_start),
-                 "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+                 "XSDT", xsdt_len, 1, bld_oem);
 }
 
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
@@ -1896,7 +1896,7 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
  * (Revision 2.0 or later)
  */
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
-                const char *oem_id, const char *oem_table_id)
+                AcpiBuildOem *bld_oem)
 {
     int slit_start, i, j;
     slit_start = table_data->len;
@@ -1917,12 +1917,12 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     build_header(linker, table_data,
                  (void *)(table_data->data + slit_start),
                  "SLIT",
-                 table_data->len - slit_start, 1, oem_id, oem_table_id);
+                 table_data->len - slit_start, 1, bld_oem);
 }
 
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
-                const char *oem_id, const char *oem_table_id)
+                AcpiBuildOem *bld_oem)
 {
     int off;
     int fadt_start = tbl->len;
@@ -2041,7 +2041,7 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
 build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
-                 "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
+                 "FACP", tbl->len - fadt_start, f->rev, bld_oem);
 }
 
 #ifdef CONFIG_TPM
@@ -2051,7 +2051,7 @@ build_hdr:
  * of TCG ACPI Specification, Family “1.2” and “2.0”, Version 1.2, Rev 8
  */
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
-                const char *oem_id, const char *oem_table_id)
+                AcpiBuildOem *bld_oem)
 {
     uint8_t start_method_params[12] = {};
     unsigned log_addr_offset, tpm2_start;
@@ -2100,7 +2100,7 @@ void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                                    ACPI_BUILD_TPMLOG_FILE, 0);
     build_header(linker, table_data,
                  (void *)(table_data->data + tpm2_start),
-                 "TPM2", table_data->len - tpm2_start, 4, oem_id, oem_table_id);
+                 "TPM2", table_data->len - tpm2_start, 4, bld_oem);
 }
 #endif
 
diff --git a/hw/acpi/ghes-stub.c b/hw/acpi/ghes-stub.c
index c315de1802..309f5cd1ce 100644
--- a/hw/acpi/ghes-stub.c
+++ b/hw/acpi/ghes-stub.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/acpi/acpi-build-oem.h"
 #include "hw/acpi/ghes.h"
 
 int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index a749b84d62..01a6cb678d 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -21,6 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "hw/acpi/acpi-build-oem.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/aml-build.h"
 #include "qemu/error-report.h"
@@ -360,7 +361,7 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 
 /* Build Hardware Error Source Table */
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
-                     const char *oem_id, const char *oem_table_id)
+                     AcpiBuildOem *bld_oem)
 {
     uint64_t hest_start = table_data->len;
 
@@ -373,7 +374,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
     build_header(linker, table_data, (void *)(table_data->data + hest_start),
-                 "HEST", table_data->len - hest_start, 1, oem_id, oem_table_id);
+                 "HEST", table_data->len - hest_start, 1, bld_oem);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index edb3fd91b2..de954dbd33 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -254,7 +254,7 @@ static void hmat_build_table_structs(GArray *table_data, NumaState *numa_state)
 }
 
 void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
-                const char *oem_id, const char *oem_table_id)
+                AcpiBuildOem *bld_oem)
 {
     int hmat_start = table_data->len;
 
@@ -265,5 +265,5 @@ void build_hmat(GArray *table_data, BIOSLinker *linker, NumaState *numa_state,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + hmat_start),
-                 "HMAT", table_data->len - hmat_start, 2, oem_id, oem_table_id);
+                 "HMAT", table_data->len - hmat_start, 2, bld_oem);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e3d5fe1939..3ae9281b3c 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -403,7 +403,7 @@ void nvdimm_plug(NVDIMMState *state)
 
 static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
                               GArray *table_data, BIOSLinker *linker,
-                              const char *oem_id, const char *oem_table_id)
+                              AcpiBuildOem *bld_oem)
 {
     NvdimmFitBuffer *fit_buf = &state->fit_buf;
     unsigned int header;
@@ -418,8 +418,7 @@ static void nvdimm_build_nfit(NVDIMMState *state, GArray *table_offsets,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, oem_id,
-                 oem_table_id);
+                 sizeof(NvdimmNfitHeader) + fit_buf->fit->len, 1, bld_oem);
 }
 
 #define NVDIMM_DSM_MEMORY_SIZE      4096
@@ -1280,9 +1279,11 @@ static void nvdimm_build_nvdimm_devices(Aml *root_dev, uint32_t ram_slots)
 static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
                               BIOSLinker *linker,
                               NVDIMMState *nvdimm_state,
-                              uint32_t ram_slots, const char *oem_id)
+                              uint32_t ram_slots,
+                              AcpiBuildOem *bld_oem)
 {
     Aml *ssdt, *sb_scope, *dev;
+    AcpiBuildOem tmp_bld_oem;
     int mem_addr_offset, nvdimm_ssdt;
 
     acpi_add_table(table_offsets, table_data);
@@ -1331,9 +1332,11 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
         NVDIMM_DSM_MEM_FILE, 0);
+
+    ACPI_BUILD_OEM_INIT(&tmp_bld_oem, bld_oem->oem_id, "NVDIMM");
     build_header(linker, table_data,
-        (void *)(table_data->data + nvdimm_ssdt),
-                 "SSDT", table_data->len - nvdimm_ssdt, 1, oem_id, "NVDIMM");
+                 (void *)(table_data->data + nvdimm_ssdt),
+                 "SSDT", table_data->len - nvdimm_ssdt, 1, &tmp_bld_oem);
     free_aml_allocator();
 }
 
@@ -1361,8 +1364,7 @@ void nvdimm_build_srat(GArray *table_data)
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
                        BIOSLinker *linker, NVDIMMState *state,
-                       uint32_t ram_slots, const char *oem_id,
-                       const char *oem_table_id)
+                       uint32_t ram_slots, AcpiBuildOem *bld_oem)
 {
     GSList *device_list;
 
@@ -1372,7 +1374,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
     }
 
     nvdimm_build_ssdt(table_offsets, table_data, linker, state,
-                      ram_slots, oem_id);
+                      ram_slots, bld_oem);
 
     device_list = nvdimm_get_device_list();
     /* no NVDIMM device is plugged. */
@@ -1381,6 +1383,6 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
     }
 
     nvdimm_build_nfit(state, table_offsets, table_data, linker,
-                      oem_id, oem_table_id);
+                      bld_oem);
     g_slist_free(device_list);
 }
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 75b1103ec4..e1569d686c 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -29,7 +29,7 @@
 #include "hw/pci/pcie_host.h"
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
-                const char *oem_id, const char *oem_table_id)
+                AcpiBuildOem *bld_oem)
 {
     int mcfg_start = table_data->len;
 
@@ -57,5 +57,5 @@ void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
     build_append_int_noprefix(table_data, 0, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
-                 "MCFG", table_data->len - mcfg_start, 1, oem_id, oem_table_id);
+                 "MCFG", table_data->len - mcfg_start, 1, bld_oem);
 }
diff --git a/hw/acpi/vmgenid.c b/hw/acpi/vmgenid.c
index 4f41a13ea0..004aac92c1 100644
--- a/hw/acpi/vmgenid.c
+++ b/hw/acpi/vmgenid.c
@@ -24,11 +24,12 @@
 #include "sysemu/reset.h"
 
 void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
-                        BIOSLinker *linker, const char *oem_id)
+                        BIOSLinker *linker, AcpiBuildOem *bld_oem)
 {
     Aml *ssdt, *dev, *scope, *method, *addr, *if_ctx;
     uint32_t vgia_offset;
     QemuUUID guid_le;
+    AcpiBuildOem tmp_bld_oem;
 
     /* Fill in the GUID values.  These need to be converted to little-endian
      * first, since that's what the guest expects
@@ -116,9 +117,10 @@ void vmgenid_build_acpi(VmGenIdState *vms, GArray *table_data, GArray *guid,
         ACPI_BUILD_TABLE_FILE, vgia_offset, sizeof(uint32_t),
         VMGENID_GUID_FW_CFG_FILE, 0);
 
+    ACPI_BUILD_OEM_INIT(&tmp_bld_oem, bld_oem->oem_id, "VMGENID");
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, oem_id, "VMGENID");
+        "SSDT", ssdt->buf->len, 1, &tmp_bld_oem);
     free_aml_allocator();
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 037cc1fd82..137212e2fd 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -435,8 +435,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     iort->length = cpu_to_le32(iort_length);
 
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
-                 "IORT", table_data->len - iort_start, 0, vms->oem_id,
-                 vms->oem_table_id);
+                 "IORT", table_data->len - iort_start, 0, &vms->bld_oem);
 }
 
 static void
@@ -470,8 +469,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
     build_header(linker, table_data, (void *)(table_data->data + spcr_start),
-                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+                 "SPCR", table_data->len - spcr_start, 2, &vms->bld_oem);
 }
 
 static void
@@ -523,8 +521,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     }
 
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
-                 "SRAT", table_data->len - srat_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+                 "SRAT", table_data->len - srat_start, 3, &vms->bld_oem);
 }
 
 /* GTDT */
@@ -559,8 +556,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+                 table_data->len - gtdt_start, 2, &vms->bld_oem);
 }
 
 /* MADT */
@@ -649,8 +645,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+                 table_data->len - madt_start, 3, &vms->bld_oem);
 }
 
 /* FADT */
@@ -680,7 +675,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
         g_assert_not_reached();
     }
 
-    build_fadt(table_data, linker, &fadt, vms->oem_id, vms->oem_table_id);
+    build_fadt(table_data, linker, &fadt, &vms->bld_oem);
 }
 
 /* DSDT */
@@ -746,8 +741,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, vms->oem_id,
-                 vms->oem_table_id);
+                 "DSDT", dsdt->buf->len, 2, &vms->bld_oem);
     free_aml_allocator();
 }
 
@@ -806,8 +800,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
            .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
            .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
         };
-        build_mcfg(tables_blob, tables->linker, &mcfg, vms->oem_id,
-                   vms->oem_table_id);
+        build_mcfg(tables_blob, tables->linker, &mcfg, &vms->bld_oem);
     }
 
     acpi_add_table(table_offsets, tables_blob);
@@ -816,8 +809,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     if (vms->ras) {
         build_ghes_error_table(tables->hardware_errors, tables->linker);
         acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->linker, vms->oem_id,
-                        vms->oem_table_id);
+        acpi_build_hest(tables_blob, tables->linker, &vms->bld_oem);
     }
 
     if (ms->numa_state->num_nodes > 0) {
@@ -825,15 +817,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_srat(tables_blob, tables->linker, vms);
         if (ms->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, ms, vms->oem_id,
-                       vms->oem_table_id);
+            build_slit(tables_blob, tables->linker, ms, &vms->bld_oem);
         }
     }
 
     if (ms->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          ms->nvdimms_state, ms->ram_slots, vms->oem_id,
-                          vms->oem_table_id);
+                          ms->nvdimms_state, ms->ram_slots, &vms->bld_oem);
     }
 
     if (its_class_name() && !vmc->no_its) {
@@ -844,21 +834,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 #ifdef CONFIG_TPM
     if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
         acpi_add_table(table_offsets, tables_blob);
-        build_tpm2(tables_blob, tables->linker, tables->tcpalog, vms->oem_id,
-                   vms->oem_table_id);
+        build_tpm2(tables_blob, tables->linker, tables->tcpalog, &vms->bld_oem);
     }
 #endif
 
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
-    build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
-               vms->oem_table_id);
+    build_xsdt(tables_blob, tables->linker, table_offsets, &vms->bld_oem);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             .revision = 2,
-            .oem_id = vms->oem_id,
+            .oem_id = vms->bld_oem.oem_id,
             .xsdt_tbl_offset = &xsdt,
             .rsdt_tbl_offset = NULL,
         };
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0b..76fac4b085 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2177,7 +2177,7 @@ static char *virt_get_oem_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    return g_strdup(vms->oem_id);
+    return g_strdup(vms->bld_oem.oem_id);
 }
 
 static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
@@ -2185,20 +2185,19 @@ static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
     VirtMachineState *vms = VIRT_MACHINE(obj);
     size_t len = strlen(value);
 
-    if (len > 6) {
+    if (len > ACPI_BUILD_OEM_ID_SIZE) {
         error_setg(errp,
                    "User specified oem-id value is bigger than 6 bytes in size");
         return;
     }
-
-    strncpy(vms->oem_id, value, 6);
+    ACPI_BUILD_OEM_SET_ID(&vms->bld_oem, value);
 }
 
 static char *virt_get_oem_table_id(Object *obj, Error **errp)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
-    return g_strdup(vms->oem_table_id);
+    return g_strdup(vms->bld_oem.oem_table_id);
 }
 
 static void virt_set_oem_table_id(Object *obj, const char *value,
@@ -2207,12 +2206,12 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
     VirtMachineState *vms = VIRT_MACHINE(obj);
     size_t len = strlen(value);
 
-    if (len > 8) {
+    if (len > ACPI_BUILD_OEM_TABLE_ID_SIZE) {
         error_setg(errp,
                    "User specified oem-table-id value is bigger than 8 bytes in size");
         return;
     }
-    strncpy(vms->oem_table_id, value, 8);
+    ACPI_BUILD_OEM_SET_TABLE_ID(&vms->bld_oem, value);
 }
 
 
@@ -2764,8 +2763,7 @@ static void virt_instance_init(Object *obj)
 
     virt_flash_create(vms);
 
-    vms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
-    vms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
+    ACPI_BUILD_OEM_INIT_DEFAULT(&vms->bld_oem);
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 17836149fe..292a35b916 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -24,6 +24,7 @@
 #include "qapi/error.h"
 #include "qapi/qmp/qnum.h"
 #include "acpi-build.h"
+#include "hw/acpi/acpi-build-oem.h"
 #include "acpi-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
@@ -1835,13 +1836,12 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 1, x86ms->oem_id, x86ms->oem_table_id);
+                 "DSDT", dsdt->buf->len, 1, &x86ms->bld_oem);
     free_aml_allocator();
 }
 
 static void
-build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
-           const char *oem_table_id)
+build_hpet(GArray *table_data, BIOSLinker *linker, AcpiBuildOem *bld_oem)
 {
     Acpi20Hpet *hpet;
     int hpet_start = table_data->len;
@@ -1854,13 +1854,13 @@ build_hpet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
                  (void *)(table_data->data + hpet_start),
-                 "HPET", sizeof(*hpet), 1, oem_id, oem_table_id);
+                 "HPET", sizeof(*hpet), 1, bld_oem);
 }
 
 #ifdef CONFIG_TPM
 static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
-               const char *oem_id, const char *oem_table_id)
+               AcpiBuildOem *bld_oem)
 {
     int tcpa_start = table_data->len;
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
@@ -1882,7 +1882,7 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + tcpa_start),
-                 "TCPA", sizeof(*tcpa), 2, oem_id, oem_table_id);
+                 "TCPA", sizeof(*tcpa), 2, bld_oem);
 }
 #endif
 
@@ -2018,8 +2018,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     build_header(linker, table_data,
                  (void *)(table_data->data + srat_start),
                  "SRAT",
-                 table_data->len - srat_start, 1, x86ms->oem_id,
-                 x86ms->oem_table_id);
+                 table_data->len - srat_start, 1, &x86ms->bld_oem);
 }
 
 /*
@@ -2077,8 +2076,8 @@ dmar_host_bridges(Object *obj, void *opaque)
  * (version Oct. 2014 or later)
  */
 static void
-build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
-               const char *oem_table_id)
+build_dmar_q35(GArray *table_data, BIOSLinker *linker,
+               AcpiBuildOem *bld_oem)
 {
     int dmar_start = table_data->len;
 
@@ -2142,7 +2141,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     }
 
     build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_table_id);
+                 "DMAR", table_data->len - dmar_start, 1, bld_oem);
 }
 
 /*
@@ -2153,8 +2152,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
  * Helpful to speedup Windows guests and ignored by others.
  */
 static void
-build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
-           const char *oem_table_id)
+build_waet(GArray *table_data, BIOSLinker *linker, AcpiBuildOem *bld_oem)
 {
     int waet_start = table_data->len;
 
@@ -2170,7 +2168,7 @@ build_waet(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     build_append_int_noprefix(table_data, 1 << 1 /* ACPI PM timer good */, 4);
 
     build_header(linker, table_data, (void *)(table_data->data + waet_start),
-                 "WAET", table_data->len - waet_start, 1, oem_id, oem_table_id);
+                 "WAET", table_data->len - waet_start, 1, bld_oem);
 }
 
 /*
@@ -2272,8 +2270,8 @@ ivrs_host_bridges(Object *obj, void *opaque)
 }
 
 static void
-build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
-                const char *oem_table_id)
+build_amd_iommu(GArray *table_data, BIOSLinker *linker,
+                AcpiBuildOem *bld_oem)
 {
     int ivhd_table_len = 24;
     int iommu_start = table_data->len;
@@ -2368,8 +2366,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     }
 
     build_header(linker, table_data, (void *)(table_data->data + iommu_start),
-                 "IVRS", table_data->len - iommu_start, 1, oem_id,
-                 oem_table_id);
+                 "IVRS", table_data->len - iommu_start, 1, bld_oem);
 }
 
 typedef
@@ -2427,6 +2424,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    AcpiBuildOem slic_bld_oem;
+    AcpiBuildOem *bld_oem;
     char *oem_id;
     char *oem_table_id;
 
@@ -2438,15 +2437,18 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     if (slic_oem.id) {
         oem_id = slic_oem.id;
     } else {
-        oem_id = x86ms->oem_id;
+        oem_id = x86ms->bld_oem.oem_id;
     }
 
     if (slic_oem.table_id) {
         oem_table_id = slic_oem.table_id;
     } else {
-        oem_table_id = x86ms->oem_table_id;
+        oem_table_id = x86ms->bld_oem.oem_table_id;
     }
 
+    ACPI_BUILD_OEM_INIT(&slic_bld_oem, oem_id, oem_table_id);
+    bld_oem = &x86ms->bld_oem;
+
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
     ACPI_BUILD_DPRINTF("init ACPI tables\n");
@@ -2480,36 +2482,34 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     pm.fadt.facs_tbl_offset = &facs;
     pm.fadt.dsdt_tbl_offset = &dsdt;
     pm.fadt.xdsdt_tbl_offset = &dsdt;
-    build_fadt(tables_blob, tables->linker, &pm.fadt, oem_id, oem_table_id);
+    build_fadt(tables_blob, tables->linker, &pm.fadt, &slic_bld_oem);
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, x86ms,
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-                    x86ms->oem_table_id);
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), bld_oem);
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
         acpi_add_table(table_offsets, tables_blob);
         vmgenid_build_acpi(VMGENID(vmgenid_dev), tables_blob,
-                           tables->vmgenid, tables->linker, x86ms->oem_id);
+                           tables->vmgenid, tables->linker, bld_oem);
     }
 
     if (misc.has_hpet) {
         acpi_add_table(table_offsets, tables_blob);
-        build_hpet(tables_blob, tables->linker, x86ms->oem_id,
-                   x86ms->oem_table_id);
+        build_hpet(tables_blob, tables->linker, bld_oem);
     }
 #ifdef CONFIG_TPM
     if (misc.tpm_version != TPM_VERSION_UNSPEC) {
         if (misc.tpm_version == TPM_VERSION_1_2) {
             acpi_add_table(table_offsets, tables_blob);
             build_tpm_tcpa(tables_blob, tables->linker, tables->tcpalog,
-                           x86ms->oem_id, x86ms->oem_table_id);
+                           bld_oem);
         } else { /* TPM_VERSION_2_0 */
             acpi_add_table(table_offsets, tables_blob);
             build_tpm2(tables_blob, tables->linker, tables->tcpalog,
-                       x86ms->oem_id, x86ms->oem_table_id);
+                       bld_oem);
         }
     }
 #endif
@@ -2518,40 +2518,36 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_srat(tables_blob, tables->linker, machine);
         if (machine->numa_state->have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
-            build_slit(tables_blob, tables->linker, machine, x86ms->oem_id,
-                       x86ms->oem_table_id);
+            build_slit(tables_blob, tables->linker, machine, bld_oem);
         }
         if (machine->numa_state->hmat_enabled) {
             acpi_add_table(table_offsets, tables_blob);
             build_hmat(tables_blob, tables->linker, machine->numa_state,
-                       x86ms->oem_id, x86ms->oem_table_id);
+                       bld_oem);
         }
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
-                   x86ms->oem_table_id);
+        build_mcfg(tables_blob, tables->linker, &mcfg, bld_oem);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
         if (IOMMUType == TYPE_AMD) {
             acpi_add_table(table_offsets, tables_blob);
-            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
-                            x86ms->oem_table_id);
+            build_amd_iommu(tables_blob, tables->linker, bld_oem);
         } else if (IOMMUType == TYPE_INTEL) {
             acpi_add_table(table_offsets, tables_blob);
-            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
-                           x86ms->oem_table_id);
+            build_dmar_q35(tables_blob, tables->linker, bld_oem);
         }
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
                           machine->nvdimms_state, machine->ram_slots,
-                          x86ms->oem_id, x86ms->oem_table_id);
+                          bld_oem);
     }
 
     acpi_add_table(table_offsets, tables_blob);
-    build_waet(tables_blob, tables->linker, x86ms->oem_id, x86ms->oem_table_id);
+    build_waet(tables_blob, tables->linker, bld_oem);
 
     /* Add tables supplied by user (if any) */
     for (u = acpi_table_first(); u; u = acpi_table_next(u)) {
@@ -2564,13 +2560,13 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets,
-               oem_id, oem_table_id);
+               &slic_bld_oem);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             .revision = 0,
-            .oem_id = x86ms->oem_id,
+            .oem_id = bld_oem->oem_id,
             .xsdt_tbl_offset = NULL,
             .rsdt_tbl_offset = &rsdt,
         };
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf9..bd768d4b43 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -73,7 +73,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
-                     const char *oem_id, const char *oem_table_id)
+                     AcpiBuildOem *bld_oem)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
@@ -158,6 +158,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, oem_id, oem_table_id);
+                 table_data->len - madt_start, 1, bld_oem);
 }
 
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 1a0f77b911..cee3dfc249 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -148,7 +148,7 @@ build_dsdt_microvm(GArray *table_data, BIOSLinker *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-                 "DSDT", dsdt->buf->len, 2, x86ms->oem_id, x86ms->oem_table_id);
+                 "DSDT", dsdt->buf->len, 2, &x86ms->bld_oem);
     free_aml_allocator();
 }
 
@@ -200,24 +200,21 @@ static void acpi_build_microvm(AcpiBuildTables *tables,
     pmfadt.dsdt_tbl_offset = &dsdt;
     pmfadt.xdsdt_tbl_offset = &dsdt;
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt(tables_blob, tables->linker, &pmfadt, x86ms->oem_id,
-               x86ms->oem_table_id);
+    build_fadt(tables_blob, tables->linker, &pmfadt, &x86ms->bld_oem);
 
     acpi_add_table(table_offsets, tables_blob);
     acpi_build_madt(tables_blob, tables->linker, X86_MACHINE(machine),
-                    ACPI_DEVICE_IF(x86ms->acpi_dev), x86ms->oem_id,
-                    x86ms->oem_table_id);
+                    ACPI_DEVICE_IF(x86ms->acpi_dev), &x86ms->bld_oem);
 
     xsdt = tables_blob->len;
-    build_xsdt(tables_blob, tables->linker, table_offsets, x86ms->oem_id,
-               x86ms->oem_table_id);
+    build_xsdt(tables_blob, tables->linker, table_offsets, &x86ms->bld_oem);
 
     /* RSDP is in FSEG memory, so allocate it separately */
     {
         AcpiRsdpData rsdp_data = {
             /* ACPI 2.0: 5.2.4.3 RSDP Structure */
             .revision = 2, /* xsdt needs v2 */
-            .oem_id = x86ms->oem_id,
+            .oem_id = x86ms->bld_oem.oem_id,
             .xsdt_tbl_offset = &xsdt,
             .rsdt_tbl_offset = NULL,
         };
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 00448ed55a..7495a7fa74 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1205,7 +1205,7 @@ static char *x86_machine_get_oem_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
 
-    return g_strdup(x86ms->oem_id);
+    return g_strdup(x86ms->bld_oem.oem_id);
 }
 
 static void x86_machine_set_oem_id(Object *obj, const char *value, Error **errp)
@@ -1213,21 +1213,20 @@ static void x86_machine_set_oem_id(Object *obj, const char *value, Error **errp)
     X86MachineState *x86ms = X86_MACHINE(obj);
     size_t len = strlen(value);
 
-    if (len > 6) {
+    if (len > ACPI_BUILD_OEM_ID_SIZE) {
         error_setg(errp,
                    "User specified "X86_MACHINE_OEM_ID" value is bigger than "
                    "6 bytes in size");
         return;
     }
-
-    strncpy(x86ms->oem_id, value, 6);
+    ACPI_BUILD_OEM_SET_ID(&x86ms->bld_oem, value);
 }
 
 static char *x86_machine_get_oem_table_id(Object *obj, Error **errp)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
 
-    return g_strdup(x86ms->oem_table_id);
+    return g_strdup(x86ms->bld_oem.oem_table_id);
 }
 
 static void x86_machine_set_oem_table_id(Object *obj, const char *value,
@@ -1236,14 +1235,13 @@ static void x86_machine_set_oem_table_id(Object *obj, const char *value,
     X86MachineState *x86ms = X86_MACHINE(obj);
     size_t len = strlen(value);
 
-    if (len > 8) {
+    if (len > ACPI_BUILD_OEM_TABLE_ID_SIZE) {
         error_setg(errp,
                    "User specified "X86_MACHINE_OEM_TABLE_ID
-                   " value is bigger than "
-                   "8 bytes in size");
+                   " value is bigger than 8 bytes in size");
         return;
     }
-    strncpy(x86ms->oem_table_id, value, 8);
+    ACPI_BUILD_OEM_SET_TABLE_ID(&x86ms->bld_oem, value);
 }
 
 static void x86_machine_get_bus_lock_ratelimit(Object *obj, Visitor *v,
@@ -1270,9 +1268,8 @@ static void x86_machine_initfn(Object *obj)
     x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->acpi = ON_OFF_AUTO_AUTO;
     x86ms->pci_irq_mask = ACPI_BUILD_PCI_IRQS;
-    x86ms->oem_id = g_strndup(ACPI_BUILD_APPNAME6, 6);
-    x86ms->oem_table_id = g_strndup(ACPI_BUILD_APPNAME8, 8);
     x86ms->bus_lock_ratelimit = 0;
+    ACPI_BUILD_OEM_INIT_DEFAULT(&x86ms->bld_oem);
 }
 
 static void x86_machine_class_init(ObjectClass *oc, void *data)
-- 
2.31.1



