Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD531422F20
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:23:19 +0200 (CEST)
Received: from localhost ([::1]:58498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo9u-0008UL-Lu
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvR-0002BK-Fk
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvP-0007Ar-Gy
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Iuc8htto9LuwnN0+7rdvNY/Z62qo8OZ/1lpPAB9rng=;
 b=N0+33Rl2dKvpyZLryRB5CBk5KS+WcgoZG/By3/LW64D2cn6fcWSzFlXs7wNmjdrXzlU9+T
 ej5BelvlUnJwERQYn9WIR/dbNR2eO2R9kkKOcoRzHdJpvneebWDIMYw0Bktca+chF2eLvb
 Cf3Vdhebw0su2WeGhLL9ufc+qfhx6Dc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-6EIWE64eM82PEf8WQvtBHw-1; Tue, 05 Oct 2021 12:04:12 -0400
X-MC-Unique: 6EIWE64eM82PEf8WQvtBHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p63-20020a1c2942000000b0030ccf0767baso1494402wmp.6
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Iuc8htto9LuwnN0+7rdvNY/Z62qo8OZ/1lpPAB9rng=;
 b=3jbiTRI7D21fDz5TqHRGabikvJcZhH1qQU85lrbR4d5SeeMvLPPZV4enkIQO+ss0Uy
 CXGe7ytz9KKQWhEtc+e+tauWozXheaYbuxPcmt5ne/Cf4rrkWNf2i1O+sSBCum1MapQW
 2v+ZnVcT9VAmlHeuSbEIg4DMxvCT6JJ0gk4CoY3YPUDojElbdzKIc3urVJugRd7YhDsB
 WYMgFqeSKCeNjQQ6q6ver811W52OFqg3BCf2WdOnXbeAR7xGgmN0su3qw/OG9zmHwbev
 SVc2kJTBZmEjAJEtVxzR3tNseJkXv/YncFqxMTu8EcnzH0G7rkQ9U0Fh1VsJK01ru+6S
 d6WA==
X-Gm-Message-State: AOAM530KudpLRKL0RU5rHCNe5e/Z3aBPwtMb8dj1FoMvRzsACL5387/i
 lxkHtlcFvB/KC4U3Zd68z95aqT8DCZu+J1JHzc+6S7P5Geg+nHnuGhSjijcQIT2Eek+VBEPBop5
 n6DkWqrG46Kmu0pJuslo2EGnzvplWONnAvKybSclHwNul85lwhqIxIPv3l78a
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr22639347wry.305.1633449849478; 
 Tue, 05 Oct 2021 09:04:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu8QI5q0k0T1ol0fPzCu+hovsqb79IfgSONjXsrHT+x+m6KGBIbyaRGLjdxy+RFeZJ79Pymw==
X-Received: by 2002:a05:6000:1546:: with SMTP id
 6mr22639251wry.305.1633449849192; 
 Tue, 05 Oct 2021 09:04:09 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id r2sm2467543wmq.28.2021.10.05.09.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:08 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/57] acpi: arm/virt: build_gtdt: use
 acpi_table_begin()/acpi_table_end() instead of build_header()
Message-ID: <20211005155946.513818-47-mst@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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

it replaces error-prone pointer arithmetic for build_header() API,
with 2 calls to start and finish table creation,
which hides offsets magic from API user.

while at it, replace packed structure with endian agnostic
build_append_FOO() API.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-33-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
index 7b79fae0ad..6cec97352b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -559,40 +559,61 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_end(linker, &table);
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
 
-    if (vmc->claim_edge_triggered_timers) {
-        irqflags = ACPI_GTDT_INTERRUPT_MODE_EDGE;
-    } else {
-        irqflags = ACPI_GTDT_INTERRUPT_MODE_LEVEL;
-    }
+    acpi_table_begin(&table, table_data);
 
-    gtdt = acpi_data_push(table_data, sizeof *gtdt);
-    /* The interrupt values are the same with the device tree when adding 16 */
-    gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
-    gtdt->secure_el1_flags = cpu_to_le32(irqflags);
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
 
-    gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
-    gtdt->non_secure_el1_flags = cpu_to_le32(irqflags |
-                                             ACPI_GTDT_CAP_ALWAYS_ON);
-
-    gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
-    gtdt->virtual_timer_flags = cpu_to_le32(irqflags);
-
-    gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
-    gtdt->non_secure_el2_flags = cpu_to_le32(irqflags);
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, vms->oem_id,
-                 vms->oem_table_id);
+    acpi_table_end(linker, &table);
 }
 
 /*
-- 
MST


