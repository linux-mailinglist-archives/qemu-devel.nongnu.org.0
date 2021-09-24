Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53086417421
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:02:51 +0200 (CEST)
Received: from localhost ([::1]:42836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkqo-0005a7-C7
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:02:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkKn-0006Ge-F1
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mTkKl-0001WR-NY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632486583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q4xJ20+Oj4bMOHFi2968/MYlIzT87a8VWNZ/Qy0S+RY=;
 b=fjPYbhP11Rig7EpOJL5F3febLLBGDLpIXse/B3Ub1skQgVBFWzERKC8/NJecgxFnbjfKi+
 sn7iUmsUlMvNsFUZjnympmSL51gsCfNJ7E9desIpLCpBBmgjyaVExmQKs6x4mTkKAxab25
 XnwI9pXAVliwXoADwG9Pv2vC2vQ5ftg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-jyh7G5ZIPSiN0aI72L-d-g-1; Fri, 24 Sep 2021 08:29:42 -0400
X-MC-Unique: jyh7G5ZIPSiN0aI72L-d-g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F804101F000;
 Fri, 24 Sep 2021 12:29:41 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4516962465;
 Fri, 24 Sep 2021 12:29:33 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/35] acpi: madt: arm/x86: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Fri, 24 Sep 2021 08:27:48 -0400
Message-Id: <20210924122802.1455362-22-imammedo@redhat.com>
In-Reply-To: <20210924122802.1455362-1-imammedo@redhat.com>
References: <20210924122802.1455362-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhaosl@gmail.com,
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 eauger@redhat.com, ani@anisinha.ca
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

CC: marcel.apfelbaum@gmail.com
CC: shannon.zhaosl@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
CC: drjones@redhat.com
CC: eauger@redhat.com
---
 include/hw/acpi/acpi-defs.h |  9 ---------
 hw/arm/virt-acpi-build.c    | 19 +++++++++++--------
 hw/i386/acpi-common.c       | 19 +++++++++++--------
 3 files changed, 22 insertions(+), 25 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c4f0a202e8..c7fa5caa06 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -176,15 +176,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 #define ACPI_DUAL_PIC                0
 #define ACPI_MULTIPLE_APIC           1
 
-/* Master MADT */
-
-struct AcpiMultipleApicTable {
-    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
-    uint32_t local_apic_address;     /* Physical address of local APIC */
-    uint32_t flags;
-} QEMU_PACKED;
-typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
-
 /* Values for Type in APIC sub-headers */
 
 #define ACPI_APIC_PROCESSOR          0
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ba02cf281..e3bdcd44e8 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -567,19 +567,26 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
-/* MADT */
+/*
+ * ACPI spec, Revision 5.0
+ * 5.2.12 Multiple APIC Description Table (MADT)
+ */
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int madt_start = table_data->len;
     const MemMapEntry *memmap = vms->memmap;
     const int *irqmap = vms->irqmap;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    acpi_data_push(table_data, sizeof(AcpiMultipleApicTable));
+    acpi_table_begin(&table, table_data);
+    /* Local Interrupt Controller Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 0, 4); /* Flags */
 
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
@@ -650,11 +657,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
         gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
     }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /* FADT */
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf9..a0cde1d874 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -71,24 +71,29 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
     }
 }
 
+/*
+ * ACPI spec, Revision 1.0b
+ * 5.2.8 Multiple APIC Description Table
+ */
 void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
                      const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
-    int madt_start = table_data->len;
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
     bool x2apic_mode = false;
 
-    AcpiMultipleApicTable *madt;
     AcpiMadtIoApic *io_apic;
     AcpiMadtIntsrcovr *intsrcovr;
     int i;
+    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
+                        .oem_table_id = oem_table_id };
 
-    madt = acpi_data_push(table_data, sizeof *madt);
-    madt->local_apic_address = cpu_to_le32(APIC_DEFAULT_ADDRESS);
-    madt->flags = cpu_to_le32(1);
+    acpi_table_begin(&table, table_data);
+    /* Local APIC Address */
+    build_append_int_noprefix(table_data, APIC_DEFAULT_ADDRESS, 4);
+    build_append_int_noprefix(table_data, 1 /* PCAT_COMPAT */, 4); /* Flags */
 
     for (i = 0; i < apic_ids->len; i++) {
         adevc->madt_cpu(adev, i, apic_ids, table_data);
@@ -156,8 +161,6 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         local_nmi->lint         = 1; /* ACPI_LINT1 */
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, oem_id, oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
-- 
2.27.0


