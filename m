Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA886699A5A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:42:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKV-0004me-4S; Thu, 16 Feb 2023 11:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKU-0004mE-0G
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:54 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKS-0000Uw-98
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:53 -0500
Received: by mail-pj1-x1035.google.com with SMTP id k24so2445154pji.2
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ER5dLhasZFwWT+uFZAaTQunfEUaR+z8UfEsUegNMGpU=;
 b=Q59tISiM6qktXtVcS2/NcQF7aVm3+4a9HF4T9hORjtXo4dmVWv7hglKJrtplv98/4J
 1JZgpi3FNfHrvJiEBOrsLHaVDCL985mphLGqocvUosU4qhrRtP7bQoxqVmKpFkMLuy/7
 5tNNWsjbfcmv4PMTWOHKEA/FGKp8a9Ia/X68sRAWeG7Up6mFEiLAPQOtzk1xnTbZWsXN
 tO5BPLwA9cu7KgCsvVX2JR9k7hYlMhr+txAm/qTLApkpI4R8hesK2GEvhIK8DeFG/zC1
 2j3CaaEICYECpg+SH52+bkeCDChw0YxJ4cgDynlhmg3rJwtCW+TPkiVedI68gmqWOLIi
 VDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ER5dLhasZFwWT+uFZAaTQunfEUaR+z8UfEsUegNMGpU=;
 b=Oy3Gk4KDsHJqAI+GZ1iskScVnSBFzDizpJ7DIh9IYM2gMsaHlijW0ro40PpY8wDYPH
 0h4akpOVka5CHq9z5yOaS6aJWeFuAlT0VS6JNQ8A+dlQTXF6cI8JcYzd01OU3rGPMREP
 zdyMfM1HDfss5HUnGbuq1bfbkORksRmBUeapn5hRuT+SfJByDiUF8rmJsCT9s0MHPKac
 LMIgMU2jZQt4aM3YbC3H2LFWUd8CCKRnrawYvoSDb0qvzY5/94nkujDN4ze3oboZ6c8T
 CCq5sKzGOY1xgN7E86X5c6tp4GMBIGTfpnVIkjfRJmPHa30tKqnmAVAbglrd/c4R7JAO
 AvYQ==
X-Gm-Message-State: AO0yUKU5M7KeRpqNldwIpu6xzEoj0BKlgBuf/gEXW1Bh/f4Xerc903r+
 HVOP+MbyuesNBqkRXh079UKXphYfuIEni003
X-Google-Smtp-Source: AK7set9hwkGlOd5aIFkr0U2d7NJFgSAUxohVUVEc640jokf3Z4B/+P6QkR64o6sQqsgrujoPmLPTeQ==
X-Received: by 2002:a05:6a20:6a0f:b0:bf:2a24:b9fd with SMTP id
 p15-20020a056a206a0f00b000bf2a24b9fdmr7247562pzk.38.1676565711547; 
 Thu, 16 Feb 2023 08:41:51 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:51 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V3 6/8] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Date: Thu, 16 Feb 2023 22:11:23 +0530
Message-Id: <20230216164125.1945633-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1035.google.com
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

RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
Table (RHCT). Add this to the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 76 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 58e49cd6d6..ef6990582d 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -33,6 +33,7 @@
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
 #include "hw/riscv/numa.h"
+#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -74,6 +75,78 @@ static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
     aml_append(scope, dev);
 }
 
+#define RHCT_NODE_ARRAY_OFFSET 56
+static void build_rhct(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    uint32_t acpi_proc_id = 0;
+    int i, socket;
+    RISCVCPU *cpu;
+    char *isa;
+    size_t len, aligned_len;
+    uint32_t isa_offset, num_rhct_nodes;
+
+    AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = s->oem_id,
+                        .oem_table_id = s->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    build_append_int_noprefix(table_data, 0x0, 4);   /* Reserved */
+
+    /* Time Base Frequency */
+    build_append_int_noprefix(table_data,
+                              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
+
+    /* ISA + N hart info */
+    num_rhct_nodes = 1 + ms->smp.cpus;
+
+    /* Number of RHCT nodes*/
+    build_append_int_noprefix(table_data, num_rhct_nodes, 4);
+
+    /* Offset to the RHCT node array */
+    build_append_int_noprefix(table_data, RHCT_NODE_ARRAY_OFFSET, 4);
+
+    /* ISA string node */
+    isa_offset = table_data->len - table.table_offset;
+    build_append_int_noprefix(table_data, 0, 2);   /* Type 0 */
+
+    cpu = &s->soc[0].harts[0];
+    isa = riscv_isa_string(cpu);
+    len = 8 + strlen(isa) + 1;
+    aligned_len = (len % 2) ? (len + 1) : len;
+
+    build_append_int_noprefix(table_data, aligned_len, 2);   /* Length */
+    build_append_int_noprefix(table_data, 0x1, 2);           /* Revision */
+
+    /* ISA string length including NUL */
+    build_append_int_noprefix(table_data, strlen(isa) + 1, 2);
+    g_array_append_vals(table_data, isa, strlen(isa) + 1);   /* ISA string */
+
+    if (aligned_len != len) {
+        build_append_int_noprefix(table_data, 0x0, 1);   /* Optional Padding */
+    }
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        for (i = 0; i < s->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
+            build_append_int_noprefix(table_data, 16, 2);      /* Length */
+            build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
+            build_append_int_noprefix(table_data, 1, 2); /* Number of offsets */
+
+            /* ACPI Processor UID */
+            build_append_int_noprefix(table_data, acpi_proc_id, 4);
+
+            /* Offsets[0] */
+            build_append_int_noprefix(table_data, isa_offset, 4);
+            acpi_proc_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 /* FADT */
 static void build_fadt_rev6(GArray *table_data,
                             BIOSLinker *linker,
@@ -188,6 +261,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    build_rhct(tables_blob, tables->linker, s);
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.34.1


