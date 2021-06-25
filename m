Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 350A33B40CD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:47:24 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiQl-0002XQ-5h
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0W-0004YE-0P
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lwi0Q-0007Wb-Fx
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624612809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90/w1G0sfYvvJ5KFPAjRfWJW1H2GVFMyn/XGx9tEe8s=;
 b=OVrAmJlh/T+jMoiDF+svW8urCGdyOPRcW0s7KcxrozG8FcOKWZ9GzSmIalkRPGCx/5Z7JC
 UIzaw31d3WuPO9iNzt6tjsaNP2j07SyeaM3a5eMP1cKHSvzofpEewONT8FcCzKAsRgNvwH
 60D/SWmC5Z1rXohSjlIqeE8j9K011Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-Hl3KOMuINL-L6O8DPtR7lQ-1; Fri, 25 Jun 2021 05:20:07 -0400
X-MC-Unique: Hl3KOMuINL-L6O8DPtR7lQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFB01891E94;
 Fri, 25 Jun 2021 09:20:06 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E225960E3A;
 Fri, 25 Jun 2021 09:20:01 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 50/53] acpi: arm/virt: build_gtdt: use
 acpi_init_table()/acpi_table_composed() instead of build_header()
Date: Fri, 25 Jun 2021 05:18:15 -0400
Message-Id: <20210625091818.1047980-52-imammedo@redhat.com>
In-Reply-To: <20210625091818.1047980-1-imammedo@redhat.com>
References: <20210625091818.1047980-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-arm@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it, replace packed structure with endian agnostic
build_append_FOO() API.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: drjones@redhat.com
CC: peter.maydell@linaro.org
CC: shannon.zhaosl@gmail.com
CC: qemu-arm@nongnu.org
---
 include/hw/acpi/acpi-defs.h | 25 -------------
 hw/arm/virt-acpi-build.c    | 75 ++++++++++++++++++++++++-------------
 2 files changed, 48 insertions(+), 52 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 012c4ffb3a..0b375e7589 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -131,29 +131,4 @@ struct AcpiFacsDescriptorRev1 {
 } QEMU_PACKED;
 typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
-/*
- * Generic Timer Description Table (GTDT)
- */
-#define ACPI_GTDT_INTERRUPT_MODE_LEVEL    (0 << 0)
-#define ACPI_GTDT_INTERRUPT_MODE_EDGE     (1 << 0)
-#define ACPI_GTDT_CAP_ALWAYS_ON           (1 << 2)
-
-struct AcpiGenericTimerTable {
-    ACPI_TABLE_HEADER_DEF
-    uint64_t counter_block_addresss;
-    uint32_t reserved;
-    uint32_t secure_el1_interrupt;
-    uint32_t secure_el1_flags;
-    uint32_t non_secure_el1_interrupt;
-    uint32_t non_secure_el1_flags;
-    uint32_t virtual_timer_interrupt;
-    uint32_t virtual_timer_flags;
-    uint32_t non_secure_el2_interrupt;
-    uint32_t non_secure_el2_flags;
-    uint64_t counter_read_block_address;
-    uint32_t platform_timer_count;
-    uint32_t platform_timer_offset;
-} QEMU_PACKED;
-typedef struct AcpiGenericTimerTable AcpiGenericTimerTable;
-
 #endif
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e8553dcae5..8f28e82760 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -455,40 +455,61 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_composed(linker, &table);
 }
 
-/* GTDT */
+/*
+ * ACPI spec, Revision 5.1
+ * 5.2.24 Generic Timer Description Table (GTDT)
+ */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    int gtdt_start = table_data->len;
-    AcpiGenericTimerTable *gtdt;
-    uint32_t irqflags;
-
-    if (vmc->claim_edge_triggered_timers) {
-        irqflags = ACPI_GTDT_INTERRUPT_MODE_EDGE;
-    } else {
-        irqflags = ACPI_GTDT_INTERRUPT_MODE_LEVEL;
-    }
-
-    gtdt = acpi_data_push(table_data, sizeof *gtdt);
-    /* The interrupt values are the same with the device tree when adding 16 */
-    gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
-    gtdt->secure_el1_flags = cpu_to_le32(irqflags);
-
-    gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
-    gtdt->non_secure_el1_flags = cpu_to_le32(irqflags |
-                                             ACPI_GTDT_CAP_ALWAYS_ON);
+    /*
+     * Table 5-117 Flag Definitions
+     * set only "Timer interrupt Mode" and assume "Timer Interrupt
+     * polarity" bit as '0: Interrupt is Active high'
+     */
+    uint32_t irqflags = vmc->claim_edge_triggered_timers ?
+        1 : /* Interrupt is Edge triggered */
+        0;  /* Interrupt is Level triggered  */
+    AcpiTable table = { .sig = "GTDT", .rev = 2, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
 
-    gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
-    gtdt->virtual_timer_flags = cpu_to_le32(irqflags);
+    acpi_init_table(&table, table_data);
 
-    gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
-    gtdt->non_secure_el2_flags = cpu_to_le32(irqflags);
+    /* CntControlBase Physical Address */
+    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
+    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    /*
+     * FIXME: clarify comment:
+     * The interrupt values are the same with the device tree when adding 16
+     */
+    /* Secure EL1 timer GSIV */
+    build_append_int_noprefix(table_data, ARCH_TIMER_S_EL1_IRQ + 16, 4);
+    /* Secure EL1 timer Flags */
+    build_append_int_noprefix(table_data, irqflags, 4);
+    /* Non-Secure EL1 timer GSIV */
+    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL1_IRQ + 16, 4);
+    /* Non-Secure EL1 timer Flags */
+    build_append_int_noprefix(table_data, irqflags |
+                              1UL << 2, /* Always-on Capability */
+                              4);
+    /* Virtual timer GSIV */
+    build_append_int_noprefix(table_data, ARCH_TIMER_VIRT_IRQ + 16, 4);
+    /* Virtual Timer Flags */
+    build_append_int_noprefix(table_data, irqflags, 4);
+    /* Non-Secure EL2 timer GSIV */
+    build_append_int_noprefix(table_data, ARCH_TIMER_NS_EL2_IRQ + 16, 4);
+    /* Non-Secure EL2 timer Flags */
+    build_append_int_noprefix(table_data, irqflags, 4);
+    /* CntReadBase Physical address */
+    build_append_int_noprefix(table_data, 0, 8);
+    /* Platform Timer Count */
+    build_append_int_noprefix(table_data, 0, 4);
+    /* Platform Timer Offset */
+    build_append_int_noprefix(table_data, 0, 4);
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_composed(linker, &table);
 }
 
 /*
-- 
2.27.0


