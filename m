Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D457422E6B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:52:08 +0200 (CEST)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnfj-00013q-2w
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuU-0001cp-DA
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmuS-0006LV-6W
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLUEbIzvV2N7lkZsbc8CHTUdFKm2dW0+2UECt7Ns1Mg=;
 b=IvRFn+ab2w7QhgOwOOYQ3BU3wTCTqQKB9LFuPSfopXE4QoYCz3uzG06jDcd+SfU26LaInx
 LwOoMkz40Wp1lJTTXBH4uwNbr+BXuwk/9CKZuvGB01amFOfUoT+muXZoANgn4kdS0m1chN
 OLfbOb8VrNfDFGhb3cBR0fMlLrN6MqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-t-xw3kU6NnehyYYEcBCdaA-1; Tue, 05 Oct 2021 12:03:14 -0400
X-MC-Unique: t-xw3kU6NnehyYYEcBCdaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 x23-20020a05600c21d700b0030d23749278so1502644wmj.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hLUEbIzvV2N7lkZsbc8CHTUdFKm2dW0+2UECt7Ns1Mg=;
 b=W5JayEaQFAhf2BX4vFHI9bi3By8kX+xN7moJ46sx0j3j1CHlWTw+LpvHfUGytmfSze
 P/FfVc7AyZEhMX88pYeecjFL0TvPexTRXKOwdvjVgvqilTxvLrWKCskp54mfIm1CWrxW
 8bfeeWqoTmwiL+0ISlY4lhbM+CyBmwoGR7hi3+7BMaeXohvHbrYtEKQIrMV0FUZHnP7h
 MHmigmJy02xvBAsEgzFk0/CRCCy6eDxuRu/h5mCeu8Qm60VkBNOf54eWJfriMCP+AJE1
 E+o2sA1pk2wi+VdfcF5f6fYdYJrThAQyDxNF929A++zahI6QA96ek9rKg4RuYIWXP/0k
 l5Yw==
X-Gm-Message-State: AOAM531MueIJkVlHFuIrln0D6x2S+HkvoZ81IehWlxfGGwCOGNWnG4Zj
 bIkI9knYILLvNXtN//sYKaVqTA6+oGlIuCEas0pfrxKQrlHaUnRPMpEBldlmSg4fgfQBRswYPvv
 o7jt6x/wqjLM+N32ztN6vEYTtCnLJeICE3AQJ8rZNPGGwiOaACwgZlqgBe7Re
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr4304856wme.13.1633449791606;
 Tue, 05 Oct 2021 09:03:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5bB2qWqsinJXb5hSwh/qRQe85pV2uTw86JRI+TVr5jDKueiWM0ppy8BE0Q1Z40eICCqY07g==
X-Received: by 2002:a1c:ac03:: with SMTP id v3mr4304590wme.13.1633449789282;
 Tue, 05 Oct 2021 09:03:09 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id w5sm17949753wrq.86.2021.10.05.09.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:08 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/57] acpi: build_dmar_q35: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-33-mst@redhat.com>
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

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

While at it switch to build_append_int_noprefix() to build
table entries tables.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-19-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 68 -----------------------------
 hw/i386/acpi-build.c        | 85 ++++++++++++++++++++-----------------
 2 files changed, 47 insertions(+), 106 deletions(-)

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
index 078097a060..c65ab1d6a5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2086,8 +2086,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 static void
 insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
 {
+    const size_t device_scope_size = 6 /* device scope structure */ +
+                                     2 /* 1 path entry */;
     GArray *scope_blob = opaque;
-    AcpiDmarDeviceScope *scope = NULL;
 
     if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
         /* Dmar Scope Type: 0x02 for PCI Bridge */
@@ -2098,8 +2099,7 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
     }
 
     /* length */
-    build_append_int_noprefix(scope_blob,
-                              sizeof(*scope) + sizeof(scope->path[0]), 1);
+    build_append_int_noprefix(scope_blob, device_scope_size, 1);
     /* reserved */
     build_append_int_noprefix(scope_blob, 0, 2);
     /* enumeration_id */
@@ -2131,26 +2131,26 @@ dmar_host_bridges(Object *obj, void *opaque)
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
     /*
      * A PCI bus walk, for each PCI host bridge.
      * Insert scope for each PCI bridge and endpoint device which
@@ -2164,43 +2164,52 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
         dmar_flags |= 0x1;      /* Flags: 0x1: INT_REMAP */
     }
 
-    dmar = acpi_data_push(table_data, sizeof(*dmar));
-    dmar->host_address_width = intel_iommu->aw_bits - 1;
-    dmar->flags = dmar_flags;
+    acpi_table_begin(&table, table_data);
+    /* Host Address Width */
+    build_append_int_noprefix(table_data, intel_iommu->aw_bits - 1, 1);
+    build_append_int_noprefix(table_data, dmar_flags, 1); /* Flags */
+    g_array_append_vals(table_data, rsvd10, sizeof(rsvd10)); /* Reserved */
 
-    /* DMAR Remapping Hardware Unit Definition structure */
-    drhd = acpi_data_push(table_data, sizeof(*drhd) + ioapic_scope_size);
-    drhd->type = cpu_to_le16(ACPI_DMAR_TYPE_HARDWARE_UNIT);
-    drhd->length =
-        cpu_to_le16(sizeof(*drhd) + ioapic_scope_size + scope_blob->len);
-    drhd->flags = 0;            /* Don't include all pci device */
-    drhd->pci_segment = cpu_to_le16(0);
-    drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
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
MST


