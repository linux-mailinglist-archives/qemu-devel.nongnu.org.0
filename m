Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FC6AD11C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 23:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIwz-00077e-Bs; Mon, 06 Mar 2023 17:04:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIws-00072d-S8
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:50 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pZIwp-0006rw-6U
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 17:04:50 -0500
Received: by mail-pl1-x62b.google.com with SMTP id i5so12106701pla.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 14:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678140286;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOpYKIeN5vKellg3Iht21zb8f5DYIGJ7B3B8YuQ0gk4=;
 b=gSunpMsa5D7aXIMdCqHXO7VlvxGH8LqznELuqfolZvygfOtg9Wg1VBsyEoltACtgq8
 YR7Gx8NaLH9XzxGV2t5dMouA6N1SthXxhjcCTOFpA8a4q7XqD9fJyidX/efnoAHsrkJX
 s8ZKbOW2xdxwDlCYH3PJxivSjFslvVKhxaWUZMnQ39muqJA2n3SuDCOI+BOWeLDVMxMn
 KPNrSrlhUQrliQp9GA02ZPjMPRaAnZD4Y+pR9hPXqt9Q5BraHeoE7YeHNfMKbbnAG1Mc
 8N+3Xn4ccG45oM6PI8iac1fXPvHczhPclauth/DoXda5vTAT8vjltp/4G5BdIBmQ9HMJ
 qNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678140286;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOpYKIeN5vKellg3Iht21zb8f5DYIGJ7B3B8YuQ0gk4=;
 b=yjKus7SAo0i8VxmIxbIJaOk3AY3JR/dicI59gIbZ2lPiJMJG+gFvY4/dDvw88Dq6zm
 ZMA5zUfB2oODfi62rmOHe4NjlNgnledrj9fHbkgPtkOui8QhiC7r/D2vzV1qPxIcwYoM
 mIFdLpBqPKASXcbqXIaV+LvK+FJ+ZyRnCpM+M3oWYPpyfxmESZDPaIco2x/9HZI7DO3u
 TB+SFh7ogQR8KG8qC6bXiPyrTrhh6jUj8U/V2sZnohgEJc4cKzkfRUxc65CaF4SMVtpP
 uWVevT3XOELhzkPVxBUsbZSIx26GndZBCeMfZ4X3TdBkaSjW0YLL7MST47DpMvWQp+cG
 bhpQ==
X-Gm-Message-State: AO0yUKVrV6gm6/pg3YzF84kl1eRy/0YQRiYYdqxtt0axraccqFAM4aMN
 lDEi/LnPzBi6elnU/1P9r9vedw==
X-Google-Smtp-Source: AK7set+8Wafma+r4uUjG/HdzgpegXPpySxmMPjUTgy5lFoLTvvyfjenI71fQRqbLjIEpGIW6i8zI3g==
X-Received: by 2002:a17:90a:1d1:b0:237:2edb:d4e3 with SMTP id
 17-20020a17090a01d100b002372edbd4e3mr12719689pjd.27.1678140286304; 
 Mon, 06 Mar 2023 14:04:46 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 s26-20020a63215a000000b005034a57b963sm6579468pgm.58.2023.03.06.14.04.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 14:04:45 -0800 (PST)
Subject: [PULL 19/22] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Mon,  6 Mar 2023 14:02:56 -0800
Message-Id: <20230306220259.7748-20-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306220259.7748-1-palmer@rivosinc.com>
References: <20230306220259.7748-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sunil V L <sunilvl@ventanamicro.com>

Add Multiple APIC Description Table (MADT) with the
RINTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Message-ID: <20230302091212.999767-6-sunilvl@ventanamicro.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 hw/riscv/virt-acpi-build.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index d6947fdc74..026d1eaf88 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -160,6 +161,36 @@ static void build_dsdt(GArray *table_data,
     free_aml_allocator();
 }
 
+/*
+ * ACPI spec, Revision 6.5+
+ * 5.2.12 Multiple APIC Description Table (MADT)
+ * REF: https://github.com/riscv-non-isa/riscv-acpi/issues/15
+ *      https://drive.google.com/file/d/1R6k4MshhN3WTT-hwqAquu5nX6xSEqK2l/view
+ */
+static void build_madt(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    MachineState *ms = MACHINE(s);
+    const CPUArchIdList *arch_ids = mc->possible_cpu_arch_ids(ms);
+
+    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+    /* Local Interrupt Controller Address */
+    build_append_int_noprefix(table_data, 0, 4);
+    build_append_int_noprefix(table_data, 0, 4);   /* MADT Flags */
+
+    /* RISC-V Local INTC structures per HART */
+    for (int i = 0; i < arch_ids->len; i++) {
+        riscv_acpi_madt_add_rintc(i, arch_ids, table_data);
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
     GArray *table_offsets;
@@ -181,6 +212,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev6(tables_blob, tables->linker, s, dsdt);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_madt(tables_blob, tables->linker, s);
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.39.2


