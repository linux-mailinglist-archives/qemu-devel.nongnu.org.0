Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA26402B7C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 17:14:58 +0200 (CEST)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcoL-0002k1-RU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 11:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcQ0-0001KE-Aa
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNcPy-0000hy-GC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:49:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631026185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4E/uQ3ximqjYcxuDi/WzuFoXWL53s3VjoQETiq8j70=;
 b=KR4wd8GFN6Lz79PpSIzGJ4BhxIunEqW0DyBjuSPZaTm03XjlRnNJovPHXWLWQKorKH/AZB
 QP1QEoF8zZmuXP/JCVg9E08gDDbJ9hhGNGiiy7vUxzo+3AvQbKLKqZMk5UT0Y+Tm+QWOhv
 unHkhtijgPedKMrwfPQwph2bRCPithk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-r706lS1fMTWanf5eAqG16A-1; Tue, 07 Sep 2021 10:49:44 -0400
X-MC-Unique: r706lS1fMTWanf5eAqG16A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85F5384A5E3;
 Tue,  7 Sep 2021 14:49:43 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DBA15D9DE;
 Tue,  7 Sep 2021 14:49:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/35] acpi: arm/virt: build_spcr: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Date: Tue,  7 Sep 2021 10:48:10 -0400
Message-Id: <20210907144814.741785-32-imammedo@redhat.com>
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
 mst@redhat.com, Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it, replace packed structure with endian agnostic
build_append_FOO() API.

PS:
Spec is Microsoft hosted, however 1.02 is no where to be found
(MS lists only the current revision) and the current revision is 1.07,
so bring comments in line with 1.07 as this is the only available spec.
There is no content change between originally implemented 1.02
(using QEMU code as reference) and 1.07. The only change is renaming
'Reserved2' field to 'Language', with the same 0 value.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
v3:
  * s/acpi_init_table|acpi_table_composed/acpi_table_begin|acpi_table_end/

PS:
   perhaps we should cache MS hosted specs in QEMU tree, given they do not
   maintain old revisions.

CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 include/hw/acpi/acpi-defs.h | 32 -----------------
 hw/arm/virt-acpi-build.c    | 68 ++++++++++++++++++++++---------------
 2 files changed, 41 insertions(+), 59 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 6f2f08a9de..012c4ffb3a 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -117,38 +117,6 @@ typedef struct AcpiFadtData {
 #define ACPI_FADT_ARM_PSCI_COMPLIANT  (1 << 0)
 #define ACPI_FADT_ARM_PSCI_USE_HVC    (1 << 1)
 
-/*
- * Serial Port Console Redirection Table (SPCR), Rev. 1.02
- *
- * For .interface_type see Debug Port Table 2 (DBG2) serial port
- * subtypes in Table 3, Rev. May 22, 2012
- */
-struct AcpiSerialPortConsoleRedirection {
-    ACPI_TABLE_HEADER_DEF
-    uint8_t  interface_type;
-    uint8_t  reserved1[3];
-    struct AcpiGenericAddress base_address;
-    uint8_t  interrupt_types;
-    uint8_t  irq;
-    uint32_t gsi;
-    uint8_t  baud;
-    uint8_t  parity;
-    uint8_t  stopbits;
-    uint8_t  flowctrl;
-    uint8_t  term_type;
-    uint8_t  reserved2;
-    uint16_t pci_device_id;
-    uint16_t pci_vendor_id;
-    uint8_t  pci_bus;
-    uint8_t  pci_slot;
-    uint8_t  pci_func;
-    uint32_t pci_flags;
-    uint8_t  pci_seg;
-    uint32_t reserved3;
-} QEMU_PACKED;
-typedef struct AcpiSerialPortConsoleRedirection
-               AcpiSerialPortConsoleRedirection;
-
 /*
  * ACPI 1.0 Firmware ACPI Control Structure (FACS)
  */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 50ed73b9d0..ea783128a9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -447,39 +447,53 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     g_array_free(its_idmaps, true);
 }
 
+/*
+ * Serial Port Console Redirection Table (SPCR)
+ * Rev: 1.07
+ */
 static void
 build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    AcpiSerialPortConsoleRedirection *spcr;
-    const MemMapEntry *uart_memmap = &vms->memmap[VIRT_UART];
-    int irq = vms->irqmap[VIRT_UART] + ARM_SPI_BASE;
-    int spcr_start = table_data->len;
-
-    spcr = acpi_data_push(table_data, sizeof(*spcr));
-
-    spcr->interface_type = 0x3;    /* ARM PL011 UART */
-
-    spcr->base_address.space_id = AML_AS_SYSTEM_MEMORY;
-    spcr->base_address.bit_width = 8;
-    spcr->base_address.bit_offset = 0;
-    spcr->base_address.access_width = 1;
-    spcr->base_address.address = cpu_to_le64(uart_memmap->base);
-
-    spcr->interrupt_types = (1 << 3); /* Bit[3] ARMH GIC interrupt */
-    spcr->gsi = cpu_to_le32(irq);  /* Global System Interrupt */
+    AcpiTable table = { .sig = "SPCR", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    spcr->baud = 3;                /* Baud Rate: 3 = 9600 */
-    spcr->parity = 0;              /* No Parity */
-    spcr->stopbits = 1;            /* 1 Stop bit */
-    spcr->flowctrl = (1 << 1);     /* Bit[1] = RTS/CTS hardware flow control */
-    spcr->term_type = 0;           /* Terminal Type: 0 = VT100 */
+    acpi_table_begin(&table, table_data);
 
-    spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
-    spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
+    /* Interface Type */
+    build_append_int_noprefix(table_data, 3, 1); /* ARM PL011 UART */
+    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
+    /* Base Address */
+    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
+                     vms->memmap[VIRT_UART].base);
+    /* Interrupt Type */
+    build_append_int_noprefix(table_data,
+        (1 << 3) /* Bit[3] ARMH GIC interrupt */, 1);
+    build_append_int_noprefix(table_data, 0, 1); /* IRQ */
+    /* Global System Interrupt */
+    build_append_int_noprefix(table_data,
+                              vms->irqmap[VIRT_UART] + ARM_SPI_BASE, 4);
+    build_append_int_noprefix(table_data, 3 /* 9600 */, 1); /* Baud Rate */
+    build_append_int_noprefix(table_data, 0 /* No Parity */, 1); /* Parity */
+    /* Stop Bits */
+    build_append_int_noprefix(table_data, 1 /* 1 Stop bit */, 1);
+    /* Flow Control */
+    build_append_int_noprefix(table_data,
+        (1 << 1) /* RTS/CTS hardware flow control */, 1);
+    /* Terminal Type */
+    build_append_int_noprefix(table_data, 0 /* VT100 */, 1);
+    build_append_int_noprefix(table_data, 0, 1); /* Language */
+    /* PCI Device ID  */
+    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
+    /* PCI Vendor ID */
+    build_append_int_noprefix(table_data, 0xffff /* not a PCI device*/, 2);
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Bus Number */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Device Number */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Function Number */
+    build_append_int_noprefix(table_data, 0, 4); /* PCI Flags */
+    build_append_int_noprefix(table_data, 0, 1); /* PCI Segment */
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    build_header(linker, table_data, (void *)(table_data->data + spcr_start),
-                 "SPCR", table_data->len - spcr_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
2.27.0


