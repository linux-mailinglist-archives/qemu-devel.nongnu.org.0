Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895A402B4C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:04:17 +0200 (CEST)
Received: from localhost ([::1]:38970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNce0-0005Xt-HN
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPj-0000MJ-J6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPh-0000TL-Ae
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V0XjxOxvFMBZsv8sCqGVsyYe72OeLYyXIeFUU8Xi7c8=;
 b=Vajgm0pVoZYAFZSmvOMsP8KWyG23IS85LGgubTa8XZj9bcpQ4LcA6CIpNeRwbep1gJDSDN
 BSaJjnQMo4h1exb1LaMPz6zGBru7zpjCHO3APS02qSsgDgjcw0DUQ1svG08p/VN91NOSsn
 PWiT29Fe2d+prPaal5vXDhuz3iyDXeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-tJG7UZJgNYmpz4Edq45Grw-1; Tue, 07 Sep 2021 10:49:25 -0400
X-MC-Unique: tJG7UZJgNYmpz4Edq45Grw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DACF100670E;
 Tue,  7 Sep 2021 14:49:24 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 739455D9CA;
 Tue,  7 Sep 2021 14:49:19 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/35] acpi: arm/virt: madt: use
 build_append_int_noprefix() API to compose MADT table
Date: Tue,  7 Sep 2021 10:48:04 -0400
Message-Id: <20210907144814.741785-26-imammedo@redhat.com>
In-Reply-To: <20210907144814.741785-1-imammedo@redhat.com>
References: <20210907144814.741785-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 eauger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop usage of packed structures and explicit endian conversions
when building MADT table for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v2:
  * fix invalid ITS length (use v6.0 Errata instead of v60 definition)

CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
CC: eauger@redhat.com
---
 include/hw/acpi/acpi-defs.h |  84 --------------------
 hw/arm/virt-acpi-build.c    | 150 +++++++++++++++++++++---------------
 2 files changed, 90 insertions(+), 144 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 3f174ba208..bcada37601 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -163,90 +163,6 @@ struct AcpiFacsDescriptorRev1 {
 } QEMU_PACKED;
 typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
-/* Values for Type in APIC sub-headers */
-
-#define ACPI_APIC_GENERIC_CPU_INTERFACE 11
-#define ACPI_APIC_GENERIC_DISTRIBUTOR   12
-#define ACPI_APIC_GENERIC_MSI_FRAME     13
-#define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
-#define ACPI_APIC_GENERIC_TRANSLATOR    15
-#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
-
-/*
- * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
- */
-#define ACPI_SUB_HEADER_DEF   /* Common ACPI sub-structure header */\
-    uint8_t  type;                               \
-    uint8_t  length;
-
-/* Sub-structures for MADT */
-
-struct AcpiMadtGenericCpuInterface {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint32_t cpu_interface_number;
-    uint32_t uid;
-    uint32_t flags;
-    uint32_t parking_version;
-    uint32_t performance_interrupt;
-    uint64_t parked_address;
-    uint64_t base_address;
-    uint64_t gicv_base_address;
-    uint64_t gich_base_address;
-    uint32_t vgic_interrupt;
-    uint64_t gicr_base_address;
-    uint64_t arm_mpidr;
-} QEMU_PACKED;
-
-typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
-
-/* GICC CPU Interface Flags */
-#define ACPI_MADT_GICC_ENABLED 1
-
-struct AcpiMadtGenericDistributor {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint32_t gic_id;
-    uint64_t base_address;
-    uint32_t global_irq_base;
-    /* ACPI 5.1 Errata 1228 Present GIC version in MADT table */
-    uint8_t version;
-    uint8_t reserved2[3];
-} QEMU_PACKED;
-
-typedef struct AcpiMadtGenericDistributor AcpiMadtGenericDistributor;
-
-struct AcpiMadtGenericMsiFrame {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint32_t gic_msi_frame_id;
-    uint64_t base_address;
-    uint32_t flags;
-    uint16_t spi_count;
-    uint16_t spi_base;
-} QEMU_PACKED;
-
-typedef struct AcpiMadtGenericMsiFrame AcpiMadtGenericMsiFrame;
-
-struct AcpiMadtGenericRedistributor {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint64_t base_address;
-    uint32_t range_length;
-} QEMU_PACKED;
-
-typedef struct AcpiMadtGenericRedistributor AcpiMadtGenericRedistributor;
-
-struct AcpiMadtGenericTranslator {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint32_t translation_id;
-    uint64_t base_address;
-    uint32_t reserved2;
-} QEMU_PACKED;
-
-typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;
-
 /*
  * Generic Timer Description Table (GTDT)
  */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e3bdcd44e8..a9a78d904a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -568,94 +568,124 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /*
- * ACPI spec, Revision 5.0
+ * ACPI spec, Revision 5.1 Errata A
  * 5.2.12 Multiple APIC Description Table (MADT)
  */
+static void build_append_gicr(GArray *table_data, uint64_t base, uint32_t size)
+{
+    build_append_int_noprefix(table_data, 0xE, 1);  /* Type */
+    build_append_int_noprefix(table_data, 16, 1);   /* Length */
+    build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+    /* Discovery Range Base Addres */
+    build_append_int_noprefix(table_data, base, 8);
+    build_append_int_noprefix(table_data, size, 4); /* Discovery Range Length */
+}
+
 static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
+    int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    const int *irqmap = vms->irqmap;
-    AcpiMadtGenericDistributor *gicd;
-    AcpiMadtGenericMsiFrame *gic_msi;
-    int i;
     AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
     /* Local Interrupt Controller Address */
     build_append_int_noprefix(table_data, 0, 4);
-    build_append_int_noprefix(table_data, 0, 4); /* Flags */
-
-    gicd = acpi_data_push(table_data, sizeof *gicd);
-    gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
-    gicd->length = sizeof(*gicd);
-    gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
-    gicd->version = vms->gic_version;
+    build_append_int_noprefix(table_data, 0, 4);   /* Flags */
+
+    /* 5.2.12.15 GIC Distributor Structure */
+    build_append_int_noprefix(table_data, 0xC, 1); /* Type */
+    build_append_int_noprefix(table_data, 24, 1);  /* Length */
+    build_append_int_noprefix(table_data, 0, 2);   /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);   /* GIC ID */
+    /* Physical Base Address */
+    build_append_int_noprefix(table_data, memmap[VIRT_GIC_DIST].base, 8);
+    build_append_int_noprefix(table_data, 0, 4);   /* System Vector Base */
+    /* GIC version */
+    build_append_int_noprefix(table_data, vms->gic_version, 1);
+    build_append_int_noprefix(table_data, 0, 3);   /* Reserved */
 
     for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
-        AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
-                                                           sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+        uint64_t physical_base_address = 0, gich = 0, gicv = 0;
+        uint32_t vgic_interrupt = vms->virt ? PPI(ARCH_GIC_MAINT_IRQ) : 0;
+        uint32_t pmu_interrupt = arm_feature(&armcpu->env, ARM_FEATURE_PMU) ?
+                                             PPI(VIRTUAL_PMU_IRQ) : 0;
 
-        gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
-        gicc->length = sizeof(*gicc);
         if (vms->gic_version == 2) {
-            gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
-            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
-            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
+            physical_base_address = memmap[VIRT_GIC_CPU].base;
+            gicv = memmap[VIRT_GIC_VCPU].base;
+            gich = memmap[VIRT_GIC_HYP].base;
         }
-        gicc->cpu_interface_number = cpu_to_le32(i);
-        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
-        gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
 
-        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
-            gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
-        }
-        if (vms->virt) {
-            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
-        }
+        /* 5.2.12.14 GIC Structure */
+        build_append_int_noprefix(table_data, 0xB, 1);  /* Type */
+        build_append_int_noprefix(table_data, 76, 1);   /* Length */
+        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+        build_append_int_noprefix(table_data, i, 4);    /* GIC ID */
+        build_append_int_noprefix(table_data, i, 4);    /* ACPI Processor UID */
+        /* Flags */
+        build_append_int_noprefix(table_data, 1, 4);    /* Enabled */
+        /* Parking Protocol Version */
+        build_append_int_noprefix(table_data, 0, 4);
+        /* Performance Interrupt GSIV */
+        build_append_int_noprefix(table_data, pmu_interrupt, 4);
+        build_append_int_noprefix(table_data, 0, 8); /* Parked Address */
+        /* Physical Base Address */
+        build_append_int_noprefix(table_data, physical_base_address, 8);
+        build_append_int_noprefix(table_data, gicv, 8); /* GICV */
+        build_append_int_noprefix(table_data, gich, 8); /* GICH */
+        /* VGIC Maintenance interrupt */
+        build_append_int_noprefix(table_data, vgic_interrupt, 4);
+        build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
+        /* MPIDR */
+        build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
     }
 
     if (vms->gic_version == 3) {
-        AcpiMadtGenericTranslator *gic_its;
-        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
-        AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
-                                                         sizeof *gicr);
-
-        gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
-        gicr->length = sizeof(*gicr);
-        gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
-        gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
-
-        if (nb_redist_regions == 2) {
-            gicr = acpi_data_push(table_data, sizeof(*gicr));
-            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
-            gicr->length = sizeof(*gicr);
-            gicr->base_address =
-                cpu_to_le64(memmap[VIRT_HIGH_GIC_REDIST2].base);
-            gicr->range_length =
-                cpu_to_le32(memmap[VIRT_HIGH_GIC_REDIST2].size);
+        build_append_gicr(table_data, memmap[VIRT_GIC_REDIST].base,
+                                      memmap[VIRT_GIC_REDIST].size);
+        if (virt_gicv3_redist_region_count(vms) == 2) {
+            build_append_gicr(table_data, memmap[VIRT_HIGH_GIC_REDIST2].base,
+                                          memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
         if (its_class_name() && !vmc->no_its) {
-            gic_its = acpi_data_push(table_data, sizeof *gic_its);
-            gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
-            gic_its->length = sizeof(*gic_its);
-            gic_its->translation_id = 0;
-            gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
+            /*
+             * FIXME: Structure is from Revision 6.0 where 'GIC Structure'
+             * has additional fields on top of implemented 5.1 Errata A,
+             * to make it consistent with v6.0 we need to bump everything
+             * to v6.0
+             */
+            /*
+             * ACPI spec, Revision 6.0 Errata A
+             * (original 6.0 definition has invalid Length)
+             * 5.2.12.18 GIC ITS Structure
+             */
+            build_append_int_noprefix(table_data, 0xF, 1);  /* Type */
+            build_append_int_noprefix(table_data, 20, 1);   /* Length */
+            build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+            build_append_int_noprefix(table_data, 0, 4);    /* GIC ITS ID */
+            /* Physical Base Address */
+            build_append_int_noprefix(table_data, memmap[VIRT_GIC_ITS].base, 8);
+            build_append_int_noprefix(table_data, 0, 4);    /* Reserved */
         }
     } else {
-        gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
-        gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
-        gic_msi->length = sizeof(*gic_msi);
-        gic_msi->gic_msi_frame_id = 0;
-        gic_msi->base_address = cpu_to_le64(memmap[VIRT_GIC_V2M].base);
-        gic_msi->flags = cpu_to_le32(1);
-        gic_msi->spi_count = cpu_to_le16(NUM_GICV2M_SPIS);
-        gic_msi->spi_base = cpu_to_le16(irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE);
+        const uint16_t spi_base = vms->irqmap[VIRT_GIC_V2M] + ARM_SPI_BASE;
+
+        /* 5.2.12.16 GIC MSI Frame Structure */
+        build_append_int_noprefix(table_data, 0xD, 1);  /* Type */
+        build_append_int_noprefix(table_data, 24, 1);   /* Length */
+        build_append_int_noprefix(table_data, 0, 2);    /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);    /* GIC MSI Frame ID */
+        /* Physical Base Address */
+        build_append_int_noprefix(table_data, memmap[VIRT_GIC_V2M].base, 8);
+        build_append_int_noprefix(table_data, 1, 4);    /* Flags */
+        /* SPI Count */
+        build_append_int_noprefix(table_data, NUM_GICV2M_SPIS, 2);
+        build_append_int_noprefix(table_data, spi_base, 2); /* SPI Base */
     }
     acpi_table_end(linker, &table);
 }
-- 
2.27.0


