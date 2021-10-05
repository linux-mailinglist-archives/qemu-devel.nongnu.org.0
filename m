Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB06422EAD
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:04:17 +0200 (CEST)
Received: from localhost ([::1]:42002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnrU-0002TU-Iq
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmv4-00020j-5X
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuw-0006ne-EY
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmIowrhu+9mjFv5KTzuVGlB15O8eraSlWO3HkaxiyKg=;
 b=DIMBPU2RSSPbk9FfdUy02/jeQ3DmED3LERQMh8TBr+TrShrxHBdwmtx5kWZSM8F1iYxbot
 Dh/pBS6b0PjUGb5MHtsR8WqHkjsGDvwLhZJQVUvAR7VlmIL+Zbzs5GSUjslBZfw/T2+GcY
 xQ2roHmr2uYU8ab0WFyN9ARnpBvQyfA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-wGhWkZiLOfGv785-p0OUZA-1; Tue, 05 Oct 2021 12:03:44 -0400
X-MC-Unique: wGhWkZiLOfGv785-p0OUZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m2-20020a05600c3b0200b0030cd1310631so1218446wms.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nmIowrhu+9mjFv5KTzuVGlB15O8eraSlWO3HkaxiyKg=;
 b=WH0polW5aF0HAPElVI63PtE/1vEItCLb291NokQENlbgMM0QUEuPyTHGkOvMOd9q+4
 F2vQiNpNrlg3YplXnKtqwdZc7h6yHFod15uNotAOda72OjiIorM82MosrI29shcAcRcf
 eJZTUt0uuwk31dpNyzxG76amwzfkOFJ1sUe3DE2ygDfT1YarZO4SGkSty23D7TtHpue6
 3RhaVIIA0RDrR4mXRNJ3mfyqIIqbTnh+bMNAcT2txsEWq0tAbmCAbnPavTo+xxQz4LbW
 SmBB/36M8K9ZXACTSEcXlGCOxWEz05dillXNin90etONbGD5M0iYqggvtIKnF4wVIxxq
 +5RQ==
X-Gm-Message-State: AOAM531fTeRdRr+jmMbWVqLh533dOCrqD6E0HjxwZU62uSNf70lXpTUw
 ciiYu5jYNniR6kEm2ymoLKDLjpR6sR/pIjQdeC6JEYK/Ak14bpIjO9SO9gofBQDDEDS/IoEsuAi
 0590hu1ldkICSyOwnzw89TGnowZvBAcTcfDAGrm/3ta1cmuwawJhK3h6AoA9V
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr22616009wrs.155.1633449822775; 
 Tue, 05 Oct 2021 09:03:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwdWgz4eSDIq4E3W95izems4T4z4+vZiABEVJ6nJNnaivdbT0WOtH6DYehCVCUTCOzPkIctA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr22615947wrs.155.1633449822389; 
 Tue, 05 Oct 2021 09:03:42 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id z18sm11456594wro.25.2021.10.05.09.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:41 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 39/57] acpi: arm/virt: madt: use build_append_int_noprefix()
 API to compose MADT table
Message-ID: <20211005155946.513818-40-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Drop usage of packed structures and explicit endian conversions
when building MADT table for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-26-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  84 --------------------
 hw/arm/virt-acpi-build.c    | 148 ++++++++++++++++++++++--------------
 2 files changed, 89 insertions(+), 143 deletions(-)

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
+    build_append_int_noprefix(table_data, 0, 4);   /* Flags */
 
-    gicd = acpi_data_push(table_data, sizeof *gicd);
-    gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
-    gicd->length = sizeof(*gicd);
-    gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
-    gicd->version = vms->gic_version;
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
MST


