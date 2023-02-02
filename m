Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD256874B8
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRap-0004gw-Dd; Wed, 01 Feb 2023 23:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRab-0004Sj-UP
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:52 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaa-0001Em-74
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:49 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 ha3-20020a17090af3c300b00230222051a6so711686pjb.2
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnHKZ5LhaBWpW9NwjdW0SuQ4r9YMLuHVjxY2bCFQzEo=;
 b=K3d/bj7+Q8AZoZMpcFT7YSbCtfxXMIQ2ex7v7CEVM3jV0MbBv702mwDW3JyrKcXRWV
 Bb48MIoekKezWBr+UZ+McfRZK2spIJBWSMkslaAIWfrg4OsSCA6ldqWCnU9TUAuTv8yw
 Nb6bEkQW+CjYJlnmuyIateRvOnF30TBm7S/6gG0YZ1Ke8l5Q6kSz8D8y+mqSd03MwGd6
 a3NSuPayCbz4wmPQ+JQPYim6Se8BvWXxrrP+pWXkiKJr7Ii88ljYZYA1+h0I5B+bsy0g
 TLW+ayZ1orhGBpbSiOI0xjaaKG9R0HTKDE+9ZHEYZ4qgydrlSU8g/iUm2ezbFl66chZ2
 b9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xnHKZ5LhaBWpW9NwjdW0SuQ4r9YMLuHVjxY2bCFQzEo=;
 b=XePl1kz/6HiuoOwznFfLIsRVJheUsZSm+NuxtiZ2JV0WYO1wdT7UYYeiTsqhy3knf9
 ZytAC9d7eZaIivaen4J292EVx46Xvycd+pk2bmAsvjQcKaF7LHZsftSo6KYvCmyGGn3K
 NOQdS74rVGZCrQ1rVCfIDMBJdk65Fg8l/x++qKDBijvfv+O78OVpsQzJfF1GktaVeOH+
 ly460/iVFFNG+5NXNstBLDnZOQmYeXoQEQccLF0gq1Ixwc8niz9PqW+JCZdkmjwMstB9
 gF19f8SjUwxgYSTX6n/576c1t3h+juuHHc9wQMSm3HvXnbyu131pDl37ME7mxDVA63vv
 d/rQ==
X-Gm-Message-State: AO0yUKVgTOmejpcDitkT5zgQaRd7aQqNyF+X5l/D4iK0wSP5vLkErmXJ
 AqCcvmyCX/g/B3pTZ8RHbliA2Q==
X-Google-Smtp-Source: AK7set9RIJ39pMfz3KLhS3QfUDb01Fl6jUStDTO82VAIrocIM8xgn9P8P0UCMmihGbk1oMXo48hSXw==
X-Received: by 2002:a17:902:e551:b0:196:2143:5eff with SMTP id
 n17-20020a170902e55100b0019621435effmr6138108plf.24.1675313567079; 
 Wed, 01 Feb 2023 20:52:47 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:46 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 06/10] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Date: Thu,  2 Feb 2023 10:22:19 +0530
Message-Id: <20230202045223.2594627-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
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

RISC-V ACPI platforms need to provide RISC-V Hart Capabilities
Table (RHCT). Add this to the ACPI tables.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 62 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 2f65f1e2e5..b04f179cb5 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -35,6 +35,7 @@
 #include "hw/pci-host/gpex.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
+#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -88,6 +89,67 @@ acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
     aml_append(scope, dev);
 }
 
+#define RHCT_NODE_ARRAY_OFFSET 56
+static void
+build_rhct(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
+{
+    MachineState *ms = MACHINE(vms);
+    uint32_t acpi_proc_id = 0;
+    int i, socket;
+    RISCVCPU *cpu;
+    char *isa;
+    size_t len, aligned_len;
+    uint32_t isa_offset, num_rhct_nodes;
+
+    AcpiTable table = { .sig = "RHCT", .rev = 1, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
+
+    acpi_table_begin(&table, table_data);
+
+    build_append_int_noprefix(table_data, 0x0, 4);   /* Reserved */
+    build_append_int_noprefix(table_data,
+                              RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, 8);
+
+    /* ISA + N hart info */
+    num_rhct_nodes = 1 + ms->smp.cpus;
+    build_append_int_noprefix(table_data, num_rhct_nodes, 4);
+    build_append_int_noprefix(table_data, RHCT_NODE_ARRAY_OFFSET, 4);
+
+    /* ISA string node */
+    isa_offset = table_data->len - table.table_offset;
+    build_append_int_noprefix(table_data, 0, 2);   /* Type 0*/
+
+    cpu = &vms->soc[0].harts[0];
+    isa = riscv_isa_string(cpu);
+    len = 8 + strlen(isa) + 1;
+    aligned_len = (len % 2) ? (len + 1) : len;
+
+    build_append_int_noprefix(table_data, aligned_len, 2);   /* Total length */
+    build_append_int_noprefix(table_data, 0x1, 2);           /* Revision */
+
+    /* ISA string length including NUL */
+    build_append_int_noprefix(table_data, strlen(isa) + 1, 2);
+    g_array_append_vals(table_data, isa, strlen(isa) + 1);   /* ISA string */
+
+    if (aligned_len != len) {
+        build_append_int_noprefix(table_data, 0x0, 1);   /* pad */
+    }
+
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        for (i = 0; i < vms->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0xFFFF, 2);  /* Type */
+            build_append_int_noprefix(table_data, 16, 2);      /* Length */
+            build_append_int_noprefix(table_data, 0x1, 2);     /* Revision */
+            build_append_int_noprefix(table_data, 1, 2); /* number of offsets */
+            build_append_int_noprefix(table_data, acpi_proc_id, 4); /* UID */
+            build_append_int_noprefix(table_data, isa_offset, 4);
+            acpi_proc_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 /* FADT */
 static void
 build_fadt_rev6(GArray *table_data, BIOSLinker *linker,
-- 
2.38.0


