Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3154402B39
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:57:39 +0200 (CEST)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcXa-0001hI-9n
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPP-0007hv-Bq
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPN-0000DX-6p
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5yTnQYvOstwYslxg/jk3tdtZF9IMoj9ETPD/uwLOzQs=;
 b=QUJ4UXsmM5j/7uS9tmOd67y7wzgqGevDghici0D2GXbH/1haiYjPcbq+HW02JRn/6B8kHk
 I6/OHrlckmqOVKl7jNuX6+ofWPjb1qT+kP4RtTP4S56Yc2K5ZJAyVBjxUew69AdRdlj2sH
 aodvoQiIm2xF88rKbU2nstLBQJFcQ9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-p5l2WeKbORyoublR2moNHw-1; Tue, 07 Sep 2021 10:49:07 -0400
X-MC-Unique: p5l2WeKbORyoublR2moNHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F877194093A;
 Tue,  7 Sep 2021 14:49:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6FC5D9CA;
 Tue,  7 Sep 2021 14:49:04 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/35] acpi: build_dmar_q35: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:47:57 -0400
Message-Id: <20210907144814.741785-19-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wangxingang5@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries tables.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  - rebase on top 26863366b29 (hw/i386/acpi-build: Add DMAR support to bypass iommu)
  - s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: wangxingang5@huawei.com
CC: marcel.apfelbaum@gmail.com
---
 include/hw/acpi/acpi-defs.h | 68 --------------------------
 hw/i386/acpi-build.c        | 97 ++++++++++++++++++++-----------------
 2 files changed, 53 insertions(+), 112 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index d293304f9c..c4f0a202e8 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -358,74 +358,6 @@ struct AcpiGenericTimerTable {
 } QEMU_PACKED;
 typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
 
-/* DMAR - DMA Remapping table r2.2 */
-struct AcpiTableDmar {
-    ACPI_TABLE_HEADER_DEF
-    uint8_t host_address_width; /* Maximum DMA physical addressability */
-    uint8_t flags;
-    uint8_t reserved[10];
-} QEMU_PACKED;
-typedef struct AcpiTableDmar AcpiTableDmar;
-
-/* Masks for Flags field above */
-#define ACPI_DMAR_INTR_REMAP        1
-#define ACPI_DMAR_X2APIC_OPT_OUT    (1 << 1)
-
-/* Values for sub-structure type for DMAR */
-enum {
-    ACPI_DMAR_TYPE_HARDWARE_UNIT = 0,       /* DRHD */
-    ACPI_DMAR_TYPE_RESERVED_MEMORY = 1,     /* RMRR */
-    ACPI_DMAR_TYPE_ATSR = 2,                /* ATSR */
-    ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,   /* RHSR */
-    ACPI_DMAR_TYPE_ANDD = 4,                /* ANDD */
-    ACPI_DMAR_TYPE_RESERVED = 5             /* Reserved for furture use */
-};
-
-/*
- * Sub-structures for DMAR
- */
-
-/* Device scope structure for DRHD. */
-struct AcpiDmarDeviceScope {
-    uint8_t entry_type;
-    uint8_t length;
-    uint16_t reserved;
-    uint8_t enumeration_id;
-    uint8_t bus;
-    struct {
-        uint8_t device;
-        uint8_t function;
-    } path[];
-} QEMU_PACKED;
-typedef struct AcpiDmarDeviceScope AcpiDmarDeviceScope;
-
-/* Type 0: Hardware Unit Definition */
-struct AcpiDmarHardwareUnit {
-    uint16_t type;
-    uint16_t length;
-    uint8_t flags;
-    uint8_t reserved;
-    uint16_t pci_segment;   /* The PCI Segment associated with this unit */
-    uint64_t address;   /* Base address of remapping hardware register-set */
-    AcpiDmarDeviceScope scope[];
-} QEMU_PACKED;
-typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
-
-/* Type 2: Root Port ATS Capability Reporting Structure */
-struct AcpiDmarRootPortATS {
-    uint16_t type;
-    uint16_t length;
-    uint8_t flags;
-    uint8_t reserved;
-    uint16_t pci_segment;
-    AcpiDmarDeviceScope scope[];
-} QEMU_PACKED;
-typedef struct AcpiDmarRootPortATS AcpiDmarRootPortATS;
-
-/* Masks for Flags field above */
-#define ACPI_DMAR_INCLUDE_PCI_ALL   1
-#define ACPI_DMAR_ATSR_ALL_PORTS    1
-
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 51e0ba07b6..2875c4f393 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2064,8 +2064,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 static void
 insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
 {
+    const size_t device_scope_size = 6 /* device scope structure */ +
+                                     2 /* 1 path entry */;
     GArray *scope_blob = opaque;
-    AcpiDmarDeviceScope *scope = NULL;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
         /* Dmar Scope Type: 0x02 for PCI Bridge */
@@ -2076,8 +2077,7 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
     }
 
     /* length */
-    build_append_int_noprefix(scope_blob,
-                              sizeof(*scope) + sizeof(scope->path[0]), 1);
+    build_append_int_noprefix(scope_blob, device_scope_size, 1);
     /* reserved */
     build_append_int_noprefix(scope_blob, 0, 2);
     /* enumeration_id */
@@ -2109,26 +2109,31 @@ dmar_host_bridges(Object *obj, void *opaque)
 }
 
 /*
- * VT-d spec 8.1 DMA Remapping Reporting Structure
- * (version Oct. 2014 or later)
+ * Intel ® Virtualization Technology for Directed I/O
+ * Architecture Specification. Revision 3.3
+ * 8.1 DMA Remapping Reporting Structure
  */
 static void
 build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
                const char *oem_table_id)
 {
-    int dmar_start = table_data->len;
-
-    AcpiTableDmar *dmar;
-    AcpiDmarHardwareUnit *drhd;
-    AcpiDmarRootPortATS *atsr;
     uint8_t dmar_flags = 0;
+    uint8_t rsvd10[10] = {};
+    /* Root complex IOAPIC uses one path only */
+    const size_t ioapic_scope_size = 6 /* device scope structure */ +
+                                     2 /* 1 path entry */;
     X86IOMMUState *iommu = x86_iommu_get_default();
-    AcpiDmarDeviceScope *scope = NULL;
-    /* Root complex IOAPIC use one path[0] only */
-    size_t ioapic_scope_size = sizeof(*scope) + sizeof(scope->path[0]);
     IntelIOMMUState *intel_iommu = INTEL_IOMMU_DEVICE(iommu);
     GArray *scope_blob = g_array_new(false, true, 1);
 
+    AcpiTable table = { .sig = "DMAR", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
+
+    assert(iommu);
+    if (x86_iommu_ir_supported(iommu)) {
+        dmar_flags |= 0x1;      /* Flags: 0x1: INT_REMAP */
+    }
+
     /*
      * A PCI bus walk, for each PCI host bridge.
      * Insert scope for each PCI bridge and endpoint device which
@@ -2137,48 +2142,52 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
     object_child_foreach_recursive(object_get_root(),
                                    dmar_host_bridges, scope_blob);
 
-    assert(iommu);
-    if (x86_iommu_ir_supported(iommu)) {
-        dmar_flags |= 0x1;      /* Flags: 0x1: INT_REMAP */
-    }
-
-    dmar = acpi_data_push(table_data, sizeof(*dmar));
-    dmar->host_address_width = intel_iommu->aw_bits - 1;
-    dmar->flags = dmar_flags;
-
-    /* DMAR Remapping Hardware Unit Definition structure */
-    drhd = acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_size);
-    drhd->type = cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
-    drhd->length =
-        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->len);
-    drhd->flags = 0;            /* Don't include all pci device */
-    drhd->pci_segment = cpu_to_le16(0);
-    drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
+    acpi_table_begin(&table, table_data);
+    /* Host Address Width */
+    build_append_int_noprefix(table_data, intel_iommu->aw_bits - 1, 1);
+    build_append_int_noprefix(table_data, dmar_flags, 1); /* Flags */
+    g_array_append_vals(table_data, rsvd10, sizeof(rsvd10)); /* Reserved */
+
+    /* 8.3 DMAR Remapping Hardware Unit Definition structure */
+    build_append_int_noprefix(table_data, 0, 2); /* Type */
+    /* Length */
+    build_append_int_noprefix(table_data,
+                              16 + ioapic_scope_size + scope_blob->len, 2);
+    /* Flags */
+    build_append_int_noprefix(table_data, 0 /* Don't include all pci device */ ,
+                              1);
+    build_append_int_noprefix(table_data, 0 , 1); /* Reserved */
+    build_append_int_noprefix(table_data, 0 , 2); /* Segment Number */
+    /* Register Base Address */
+    build_append_int_noprefix(table_data, Q35_HOST_BRIDGE_IOMMU_ADDR , 8);
 
     /* Scope definition for the root-complex IOAPIC. See VT-d spec
      * 8.3.1 (version Oct. 2014 or later). */
-    scope = &drhd->scope[0];
-    scope->entry_type = 0x03;   /* Type: 0x03 for IOAPIC */
-    scope->length = ioapic_scope_size;
-    scope->enumeration_id = ACPI_BUILD_IOAPIC_ID;
-    scope->bus = Q35_PSEUDO_BUS_PLATFORM;
-    scope->path[0].device = PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC);
-    scope->path[0].function = PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC);
+    build_append_int_noprefix(table_data, 0x03 /* IOAPIC */, 1); /* Type */
+    build_append_int_noprefix(table_data, ioapic_scope_size, 1); /* Length */
+    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
+    /* Enumeration ID */
+    build_append_int_noprefix(table_data, ACPI_BUILD_IOAPIC_ID, 1);
+    /* Start Bus Number */
+    build_append_int_noprefix(table_data, Q35_PSEUDO_BUS_PLATFORM, 1);
+    /* Path, {Device, Function} pair */
+    build_append_int_noprefix(table_data, PCI_SLOT(Q35_PSEUDO_DEVFN_IOAPIC), 1);
+    build_append_int_noprefix(table_data, PCI_FUNC(Q35_PSEUDO_DEVFN_IOAPIC), 1);
 
     /* Add scope found above */
     g_array_append_vals(table_data, scope_blob->data, scope_blob->len);
     g_array_free(scope_blob, true);
 
     if (iommu->dt_supported) {
-        atsr = acpi_data_push(table_data, sizeof(*atsr));
-        atsr->type = cpu_to_le16(ACPI_DMAR_TYPE_ATSR);
-        atsr->length = cpu_to_le16(sizeof(*atsr));
-        atsr->flags = ACPI_DMAR_ATSR_ALL_PORTS;
-        atsr->pci_segment = cpu_to_le16(0);
+        /* 8.5 Root Port ATS Capability Reporting Structure */
+        build_append_int_noprefix(table_data, 2, 2); /* Type */
+        build_append_int_noprefix(table_data, 8, 2); /* Length */
+        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1); /* Flags */
+        build_append_int_noprefix(table_data, 0, 1); /* Reserved */
+        build_append_int_noprefix(table_data, 0, 2); /* Segment Number */
     }
 
-    build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
2.27.0


