Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2058694850
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa1D-0006QD-58; Mon, 13 Feb 2023 09:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0x-0006M8-Ij
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:07 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0v-0005U3-Pn
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:07 -0500
Received: by mail-pl1-x632.google.com with SMTP id be8so13700307plb.7
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOOkIxFVgPXWV2ES8OUWvowBZVo0ahQSM7wWYcaITEk=;
 b=P8BCSC4QMMVCAigof52w7r8XrRZhwLCqoOvKkohNo4uVuwi2PX0DEUMabBNnxloC3h
 TKK42O9TaoCiLXaiicHdDWIE9NV72Dj7b+Av+FpSOK+trmJrPfmpf4yjBW0mDMSqRcoY
 0uyP1erkERiYsvp9pTfJ6DtyKe1cJNqws8N6UzVbkVwIzo78F2IxNY/sW9lyozsnWqQb
 pvLCqFzmAZLWh9W5cLF5VkfsRmhlqH3U7lnH5tIdUBDWDBhTwTq3MCWRZ3v1YCOuQWZC
 lioEjsD0kmF9kI/5+lUjIvFGGhSIpXhuzJFv1r+pYjvi3b4UQ1j4qcqtD9JIkMqhdaAe
 gSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TOOkIxFVgPXWV2ES8OUWvowBZVo0ahQSM7wWYcaITEk=;
 b=Sp+t+xL/RoDDsrU58TWY4ESatlDMop/h0kSrUN/UV8FrFwpwJzZ9gmkqzpEB9aDICA
 eI/OODy6iCBFpcWwtWIlSZuUeVTliCgsOs3D4DP3OzaUc3iiBr2ICNS+YBkpCl3LmBQ6
 tbpbnh3HuLW3s5XhS5OU5Nauf6bGOHA9VtN0/LArt3eiEdYeRdB5OIJ8H7zU0k1rJzJ6
 lOL7dEcUrcAFL42eXHf1YgxhtlRsdN823IxjJSFHqM0ydByKclPpbeZqxcdTDNhY8rft
 V1oNXqp7tdSky+XOnJv91ev3Yn3C9VOjox5ZENbDLYxEABnYlRMMjB5janrZaea8D9sh
 VD9Q==
X-Gm-Message-State: AO0yUKXj+0VWeyY9YCoSvZLWJU7aqqBiRfGDfMki/GzRIwLLRj9V04D9
 LLA93dcc+IXswFZ2tpbEIFNamw==
X-Google-Smtp-Source: AK7set+u4iucazsP/I2nZW+PlAguD1NTrpkxhT2MWviWalN1qcwpb5hdmGMjD6ssqfMHb+tZUrAUGg==
X-Received: by 2002:a05:6a20:699f:b0:c0:be63:75c9 with SMTP id
 t31-20020a056a20699f00b000c0be6375c9mr29008342pzk.43.1676299264000; 
 Mon, 13 Feb 2023 06:41:04 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:03 -0800 (PST)
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
Subject: [PATCH V2 06/10] hw/riscv/virt: virt-acpi-build.c: Add RHCT Table
Date: Mon, 13 Feb 2023 20:10:34 +0530
Message-Id: <20230213144038.2547584-7-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index f54e3fb731..a2054f79a8 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -35,6 +35,7 @@
 #include "hw/pci-host/gpex.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
+#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -85,6 +86,67 @@ acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
     aml_append(scope, dev);
 }
 
+#define RHCT_NODE_ARRAY_OFFSET 56
+static void
+build_rhct(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
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
+    cpu = &s->soc[0].harts[0];
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
+        for (i = 0; i < s->soc[socket].num_harts; i++) {
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
2.34.1


