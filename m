Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A26A7D60
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:13:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeza-0003zl-1e; Thu, 02 Mar 2023 04:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezX-0003yi-2A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:47 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pXezV-0005QD-B8
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:12:46 -0500
Received: by mail-pj1-x1032.google.com with SMTP id oj5so12207870pjb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2k4EXZKfQUKA+NFhqy+UgqQ7W6/Y203zszftUQA0Hjw=;
 b=h87oX/ekfJ9iK/ipdQy9zc7uFxS5dRBSQxs0Wq2nnyob295Ujz1fF68NnXfc30Q2XW
 e4UKDjBeGNjVBAXLH0SH66tja4uvzN/pqNePHffOMkSa/atk9MiyItRp9oU/VhxrxULb
 z5PoBlFPld39Gadt7uvPlu0q6DDmzGUV0sORpFfrRf97OjYb9kgVdwgLMl+hCnoA00eO
 b6t5I3WoIQPtP9AnKon2ppUr0p06O2vqk72GjSPyNE4ms1eHz0WYAbDhB7s0wrTN65EK
 C87acKkw024Oo3duSiCEJ5c/oGLIS71dWNZ1NLHNABANmCwYpQtBk98GLe8CWDSubznm
 K+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2k4EXZKfQUKA+NFhqy+UgqQ7W6/Y203zszftUQA0Hjw=;
 b=YG2HMx37fdDZ5N/5qZG+p3KdTVzkrZjbWXTjwzq+o81aE93SlSn3Q5JoiedY0GT6P4
 RufWW/MbhyIErTKlktdjjZLdmK83cK4VmL/rbO8/Ctv/6RzIsvoxSYJ+n6fP8iAOaU0c
 aiO3hsQdUgDVg0MK6+sm2FICBqlTZ1MH4AeE/E7fDBqubLtnvKH8OgJ2jSrG+MDVV4/f
 EVWamGAsFzO2UhGC5l9teT7+z+OVDeqSoEBUNAKLrbeROsWMHdveffw02ib2IDBmLvdm
 E2h5n7QSwKn1v5d2ZBKNcuV++Dtttj9WQ0BF4fEEz9Sfw3YRZPRr8r/t7CDxN9yjUQ5c
 eerg==
X-Gm-Message-State: AO0yUKVjPd3V47hbUzGUH7yW1DxSCQ9uWu91OJIkOLwWm+tZskMAMNSq
 l/JGZhTgvsolQWCcU7CuSm30PdjKPkBwP22n
X-Google-Smtp-Source: AK7set8qy+aF7qVMAMUuqo+AMtp/+n4JB6S1Ncue+t4lBKAPSmvBkZhpNuMHEe+cHU44PvqYgbWX2w==
X-Received: by 2002:a17:90b:350c:b0:22b:f622:56ae with SMTP id
 ls12-20020a17090b350c00b0022bf62256aemr10625486pjb.23.1677748364435; 
 Thu, 02 Mar 2023 01:12:44 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 iz12-20020a170902ef8c00b0019945535973sm9850692plb.63.2023.03.02.01.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:12:44 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Igor Mammedov <imammedo@redhat.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Thu,  2 Mar 2023 14:42:09 +0530
Message-Id: <20230302091212.999767-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230302091212.999767-1-sunilvl@ventanamicro.com>
References: <20230302091212.999767-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Add Multiple APIC Description Table (MADT) with the
RINTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
2.34.1


