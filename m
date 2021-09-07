Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D11D402B53
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:07:46 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNchN-00048w-F5
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPb-0008VT-Ul
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPZ-0000N1-PY
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrbAP40KyT2FSEl7T3qy5dr8TiCOg3YjK6jIltvbQ5E=;
 b=NnA/7ACU1Tvdns2/AdoU24gcE9cbwSffd3dWIwDA6oJQXk5tgwqyMvOw3f8eH07Hh2qCNy
 XBEjLjZHXfLk3IE0sgJxikw6DbL3n2xP6sMk+clTVXsKi4mfOuoVEz1noAKImsrP933j5Z
 ZNm/M+dmOgvBX7Nw+6P/gcUW9ND0AY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-HI3M1oALPPeU_eeY2YcrYg-1; Tue, 07 Sep 2021 10:49:20 -0400
X-MC-Unique: HI3M1oALPPeU_eeY2YcrYg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B09E84A5E4;
 Tue,  7 Sep 2021 14:49:19 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15F755D9DE;
 Tue,  7 Sep 2021 14:49:12 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/35] acpi: x86: madt: use build_append_int_noprefix() API
 to compose MADT table
Date: Tue,  7 Sep 2021 10:48:03 -0400
Message-Id: <20210907144814.741785-25-imammedo@redhat.com>
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
Cc: eauger@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Drop usage of packed structures and explicit endian conversions
when building MADT table for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: marcel.apfelbaum@gmail.com
CC: eauger@redhat.com
---
 include/hw/acpi/acpi-defs.h |  64 ------------------
 hw/i386/acpi-common.c       | 127 ++++++++++++++++++------------------
 2 files changed, 65 insertions(+), 126 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af4fa412a5..3f174ba208 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -165,17 +165,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
 /* Values for Type in APIC sub-headers */
 
-#define ACPI_APIC_PROCESSOR          0
-#define ACPI_APIC_IO                 1
-#define ACPI_APIC_XRUPT_OVERRIDE     2
-#define ACPI_APIC_NMI                3
-#define ACPI_APIC_LOCAL_NMI          4
-#define ACPI_APIC_ADDRESS_OVERRIDE   5
-#define ACPI_APIC_IO_SAPIC           6
-#define ACPI_APIC_LOCAL_SAPIC        7
-#define ACPI_APIC_XRUPT_SOURCE       8
-#define ACPI_APIC_LOCAL_X2APIC       9
-#define ACPI_APIC_LOCAL_X2APIC_NMI      10
 #define ACPI_APIC_GENERIC_CPU_INTERFACE 11
 #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
 #define ACPI_APIC_GENERIC_MSI_FRAME     13
@@ -192,59 +181,6 @@ typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
 /* Sub-structures for MADT */
 
-struct AcpiMadtProcessorApic {
-    ACPI_SUB_HEADER_DEF
-    uint8_t  processor_id;           /* ACPI processor id */
-    uint8_t  local_apic_id;          /* Processor's local APIC id */
-    uint32_t flags;
-} QEMU_PACKED;
-typedef struct AcpiMadtProcessorApic AcpiMadtProcessorApic;
-
-struct AcpiMadtIoApic {
-    ACPI_SUB_HEADER_DEF
-    uint8_t  io_apic_id;             /* I/O APIC ID */
-    uint8_t  reserved;               /* Reserved - must be zero */
-    uint32_t address;                /* APIC physical address */
-    uint32_t interrupt;              /* Global system interrupt where INTI
-                                 * lines start */
-} QEMU_PACKED;
-typedef struct AcpiMadtIoApic AcpiMadtIoApic;
-
-struct AcpiMadtIntsrcovr {
-    ACPI_SUB_HEADER_DEF
-    uint8_t  bus;
-    uint8_t  source;
-    uint32_t gsi;
-    uint16_t flags;
-} QEMU_PACKED;
-typedef struct AcpiMadtIntsrcovr AcpiMadtIntsrcovr;
-
-struct AcpiMadtLocalNmi {
-    ACPI_SUB_HEADER_DEF
-    uint8_t  processor_id;           /* ACPI processor id */
-    uint16_t flags;                  /* MPS INTI flags */
-    uint8_t  lint;                   /* Local APIC LINT# */
-} QEMU_PACKED;
-typedef struct AcpiMadtLocalNmi AcpiMadtLocalNmi;
-
-struct AcpiMadtProcessorX2Apic {
-    ACPI_SUB_HEADER_DEF
-    uint16_t reserved;
-    uint32_t x2apic_id;              /* Processor's local x2APIC ID */
-    uint32_t flags;
-    uint32_t uid;                    /* Processor object _UID */
-} QEMU_PACKED;
-typedef struct AcpiMadtProcessorX2Apic AcpiMadtProcessorX2Apic;
-
-struct AcpiMadtLocalX2ApicNmi {
-    ACPI_SUB_HEADER_DEF
-    uint16_t flags;                  /* MPS INTI flags */
-    uint32_t uid;                    /* Processor object _UID */
-    uint8_t  lint;                   /* Local APIC LINT# */
-    uint8_t  reserved[3];            /* Local APIC LINT# */
-} QEMU_PACKED;
-typedef struct AcpiMadtLocalX2ApicNmi AcpiMadtLocalX2ApicNmi;
-
 struct AcpiMadtGenericCpuInterface {
     ACPI_SUB_HEADER_DEF
     uint16_t reserved;
diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 7983a13a93..aa7b5c357e 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -38,7 +38,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
                        bool force_enabled)
 {
     uint32_t apic_id = apic_ids->cpus[uid].arch_id;
-    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 : 0;
+    /* Flags – Local APIC Flags */
+    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
+                     1 /* Enabled */ : 0;
 
     /* ACPI spec says that LAPIC entry for non present
      * CPU may be omitted from MADT or it must be marked
@@ -47,24 +49,47 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
      * should be put in MADT but kept disabled.
      */
     if (apic_id < 255) {
-        AcpiMadtProcessorApic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_PROCESSOR;
-        apic->length = sizeof(*apic);
-        apic->processor_id = uid;
-        apic->local_apic_id = apic_id;
-        apic->flags = cpu_to_le32(flags);
+        /* Rev 1.0b, Table 5-13 Processor Local APIC Structure */
+        build_append_int_noprefix(entry, 0, 1);       /* Type */
+        build_append_int_noprefix(entry, 8, 1);       /* Length */
+        build_append_int_noprefix(entry, uid, 1);     /* ACPI Processor ID */
+        build_append_int_noprefix(entry, apic_id, 1); /* APIC ID */
+        build_append_int_noprefix(entry, flags, 4); /* Flags */
     } else {
-        AcpiMadtProcessorX2Apic *apic = acpi_data_push(entry, sizeof *apic);
-
-        apic->type = ACPI_APIC_LOCAL_X2APIC;
-        apic->length = sizeof(*apic);
-        apic->uid = cpu_to_le32(uid);
-        apic->x2apic_id = cpu_to_le32(apic_id);
-        apic->flags = cpu_to_le32(flags);
+        /* Rev 4.0, 5.2.12.12 Processor Local x2APIC Structure */
+        build_append_int_noprefix(entry, 9, 1);       /* Type */
+        build_append_int_noprefix(entry, 16, 1);      /* Length */
+        build_append_int_noprefix(entry, 0, 2);       /* Reserved */
+        build_append_int_noprefix(entry, apic_id, 4); /* X2APIC ID */
+        build_append_int_noprefix(entry, flags, 4);   /* Flags */
+        build_append_int_noprefix(entry, uid, 4);     /* ACPI Processor UID */
     }
 }
 
+static void build_ioapic(GArray *entry, uint8_t id, uint32_t addr, uint32_t irq)
+{
+    /* Rev 1.0b, 5.2.8.2 IO APIC */
+    build_append_int_noprefix(entry, 1, 1);    /* Type */
+    build_append_int_noprefix(entry, 12, 1);   /* Length */
+    build_append_int_noprefix(entry, id, 1);   /* IO APIC ID */
+    build_append_int_noprefix(entry, 0, 1);    /* Reserved */
+    build_append_int_noprefix(entry, addr, 4); /* IO APIC Address */
+    build_append_int_noprefix(entry, irq, 4);  /* System Vector Base */
+}
+
+static void
+build_xrupt_override(GArray *entry, uint8_t src, uint32_t gsi, uint16_t flags)
+{
+    /* Rev 1.0b, 5.2.8.3.1 Interrupt Source Overrides */
+    build_append_int_noprefix(entry, 2, 1);  /* Type */
+    build_append_int_noprefix(entry, 10, 1); /* Length */
+    build_append_int_noprefix(entry, 0, 1);  /* Bus */
+    build_append_int_noprefix(entry, src, 1);  /* Source */
+    /* Global System Interrupt Vector */
+    build_append_int_noprefix(entry, gsi, 4);
+    build_append_int_noprefix(entry, flags, 2);  /* Flags */
+}
+
 /*
  * ACPI spec, Revision 1.0b
  * 5.2.8 Multiple APIC Description Table
@@ -73,14 +98,11 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
                      X86MachineState *x86ms, AcpiDeviceIf *adev,
                      const char *oem_id, const char *oem_table_id)
 {
+    int i;
+    bool x2apic_mode = false;
     MachineClass *mc = MACHINE_GET_CLASS(x86ms);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
     AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
-    bool x2apic_mode = false;
-
-    AcpiMadtIoApic *io_apic;
-    AcpiMadtIntsrcovr *intsrcovr;
-    int i;
     AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
                         .oem_table_id = oem_table_id };
 
@@ -96,30 +118,14 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
         }
     }
 
-    io_apic = acpi_data_push(table_data, sizeof *io_apic);
-    io_apic->type = ACPI_APIC_IO;
-    io_apic->length = sizeof(*io_apic);
-    io_apic->io_apic_id = ACPI_BUILD_IOAPIC_ID;
-    io_apic->address = cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
-    io_apic->interrupt = cpu_to_le32(0);
-
+    build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID, IO_APIC_DEFAULT_ADDRESS, 0);
     if (x86ms->ioapic2) {
-        AcpiMadtIoApic *io_apic2;
-        io_apic2 = acpi_data_push(table_data, sizeof *io_apic);
-        io_apic2->type = ACPI_APIC_IO;
-        io_apic2->length = sizeof(*io_apic);
-        io_apic2->io_apic_id = ACPI_BUILD_IOAPIC_ID + 1;
-        io_apic2->address = cpu_to_le32(IO_APIC_SECONDARY_ADDRESS);
-        io_apic2->interrupt = cpu_to_le32(IO_APIC_SECONDARY_IRQBASE);
+        build_ioapic(table_data, ACPI_BUILD_IOAPIC_ID + 1,
+                     IO_APIC_SECONDARY_ADDRESS, IO_APIC_SECONDARY_IRQBASE);
     }
 
     if (x86ms->apic_xrupt_override) {
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = 0;
-        intsrcovr->gsi    = cpu_to_le32(2);
-        intsrcovr->flags  = cpu_to_le16(0); /* conforms to bus specifications */
+        build_xrupt_override(table_data, 0, 2, 0);
     }
 
     for (i = 1; i < 16; i++) {
@@ -127,32 +133,29 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
             /* No need for a INT source override structure. */
             continue;
         }
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = i;
-        intsrcovr->gsi    = cpu_to_le32(i);
-        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
+        build_xrupt_override(table_data, i, i, 0xd);
     }
 
     if (x2apic_mode) {
-        AcpiMadtLocalX2ApicNmi *local_nmi;
-
-        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
-        local_nmi->type   = ACPI_APIC_LOCAL_X2APIC_NMI;
-        local_nmi->length = sizeof(*local_nmi);
-        local_nmi->uid    = 0xFFFFFFFF; /* all processors */
-        local_nmi->flags  = cpu_to_le16(0);
-        local_nmi->lint   = 1; /* ACPI_LINT1 */
+        /* Rev 4.0, 5.2.12.13 Local x2APIC NMI Structure*/
+        build_append_int_noprefix(table_data, 0xA, 1); /* Type */
+        build_append_int_noprefix(table_data, 12, 1);  /* Length */
+        build_append_int_noprefix(table_data, 0, 2);   /* Flags */
+        /* ACPI Processor UID */
+        build_append_int_noprefix(table_data, 0xFFFFFFFF /* all processors */,
+                                  4);
+        /* Local x2APIC INTI# */
+        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
+        build_append_int_noprefix(table_data, 0, 3);
     } else {
-        AcpiMadtLocalNmi *local_nmi;
-
-        local_nmi = acpi_data_push(table_data, sizeof *local_nmi);
-        local_nmi->type         = ACPI_APIC_LOCAL_NMI;
-        local_nmi->length       = sizeof(*local_nmi);
-        local_nmi->processor_id = 0xff; /* all processors */
-        local_nmi->flags        = cpu_to_le16(0);
-        local_nmi->lint         = 1; /* ACPI_LINT1 */
+        /* Rev 1.0b, 5.2.8.3.3 Local APIC NMI */
+        build_append_int_noprefix(table_data, 4, 1);  /* Type */
+        build_append_int_noprefix(table_data, 6, 1);  /* Length */
+        /* ACPI Processor ID */
+        build_append_int_noprefix(table_data, 0xff /* all processors */, 1);
+        build_append_int_noprefix(table_data, 0, 2);  /* Flags */
+        /* Local APIC INTI# */
+        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
     }
 
     acpi_table_end(linker, &table);
-- 
2.27.0


