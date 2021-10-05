Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00771422E3A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:44:54 +0200 (CEST)
Received: from localhost ([::1]:56564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnYj-0006IW-1I
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuy-0001zZ-E0
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuw-0006nE-4s
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jcVjkn40dXJnt0SRinvAbwQ4Tsn9n9c0MB6NMS/GVJc=;
 b=JYwJM71d03RcUVXLkBSNI/Ex1i97Aia6Km7YVQ4m4H1EbHr49dMFKyAoZpFjb9H59p1oT7
 BhMPK94IRyj8s31JiuNfXDiEn4YiY8EJgHIpvBqFdfxDWtRXUT82wowAOwVSUD1Z+G0Q8S
 k9cNBnzENwM0JfEhHXIETkm09K5L5o4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-LJKvgy8RNy-Z3IlcVYiJyA-1; Tue, 05 Oct 2021 12:03:41 -0400
X-MC-Unique: LJKvgy8RNy-Z3IlcVYiJyA-1
Received: by mail-wm1-f71.google.com with SMTP id
 x23-20020a05600c21d700b0030d23749278so1503173wmj.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jcVjkn40dXJnt0SRinvAbwQ4Tsn9n9c0MB6NMS/GVJc=;
 b=1nBhRcW2V+KTGyPe2+5NVVx2sgpt42N8hOrRCCnfsYOwRXPor3RJLjorOnJXRQp2uX
 azQpOHegPENJSkwrfO6pfk6px1VjRuZ/BB77gH5IW46i8H65xsxeAw0Ljp8ZLVAdYCb0
 z+KfekzqHHRvGpv3VDrgNWiPtYVmIuv0gIB2axzAwMAZE7AsIru/qTmXRO59ocQJMIFS
 Kg/1ex/XOsLNc1Lu3ZmjoUx22li61jbJHt+ICTeLNx8fY04MxMkdWt5FIMWJK2RLIX9l
 7D5SDaFWpNrWENJCErEXxswHVaM5KWEY1kKsO+IBNLPt32ocn2bEYMvuUDpYKWlYY7Kh
 PJuw==
X-Gm-Message-State: AOAM531hSTBQWc15n+HbLyzAVG04V166bsZjyLdU919Z2G6OcGDC9pzX
 1o1WzXJxuz81EenCVU2h6zmN4RZr7jqrs+t154dxrlcuUt2OO99RT9OGPHCwo4hBIHZu8KJQ9VA
 UjMOiNBYDg2/PhkVoBsPpb78Qdu6yblxa0PhAqnRiVdefWeUWTg1Pz0VRv1o4
X-Received: by 2002:adf:f486:: with SMTP id l6mr21736343wro.375.1633449819371; 
 Tue, 05 Oct 2021 09:03:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQfgXOdNutJDq2MPdBvvcpQ59k8sx6aEI3bDCw90pWoC6/k+BGIgfJgnGDSQ3x2ouYenwYPw==
X-Received: by 2002:adf:f486:: with SMTP id l6mr21736297wro.375.1633449819042; 
 Tue, 05 Oct 2021 09:03:39 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id o1sm18106059wru.91.2021.10.05.09.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:38 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/57] acpi: x86: madt: use build_append_int_noprefix() API to
 compose MADT table
Message-ID: <20211005155946.513818-39-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Drop usage of packed structures and explicit endian conversions
when building MADT table for arm/x86 and use endian agnostic
build_append_int_noprefix() API to build it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-25-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h |  64 ------------------
 hw/i386/acpi-common.c       | 129 +++++++++++++++++++-----------------
 2 files changed, 67 insertions(+), 126 deletions(-)

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
index 7983a13a93..4aaafbdd7b 100644
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
 
@@ -96,30 +118,15 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
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
+        build_xrupt_override(table_data, 0, 2,
+            0 /* Flags: Conforms to the specifications of the bus */);
     }
 
     for (i = 1; i < 16; i++) {
@@ -127,32 +134,30 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
             /* No need for a INT source override structure. */
             continue;
         }
-        intsrcovr = acpi_data_push(table_data, sizeof *intsrcovr);
-        intsrcovr->type   = ACPI_APIC_XRUPT_OVERRIDE;
-        intsrcovr->length = sizeof(*intsrcovr);
-        intsrcovr->source = i;
-        intsrcovr->gsi    = cpu_to_le32(i);
-        intsrcovr->flags  = cpu_to_le16(0xd); /* active high, level triggered */
+        build_xrupt_override(table_data, i, i,
+            0xd /* Flags: Active high, Level Triggered */);
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
+        /* Local x2APIC LINT# */
+        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
+        build_append_int_noprefix(table_data, 0, 3); /* Reserved */
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
+        build_append_int_noprefix(table_data, 0xFF /* all processors */, 1);
+        build_append_int_noprefix(table_data, 0, 2);  /* Flags */
+        /* Local APIC INTI# */
+        build_append_int_noprefix(table_data, 1 /* ACPI_LINT1 */, 1);
     }
 
     acpi_table_end(linker, &table);
-- 
MST


