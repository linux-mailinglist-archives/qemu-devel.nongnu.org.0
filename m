Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4016A1811
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTa4-0006sE-RF; Fri, 24 Feb 2023 03:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa2-0006qb-A1
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:26 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pVTa0-0001BZ-O6
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:37:26 -0500
Received: by mail-pg1-x530.google.com with SMTP id p6so7140817pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hh/djYQrNEMIF4psgzBsXUExvtPb1Y7t1bLiWNMzWsY=;
 b=QUkueUZsLHensYWot5KF1SNrq3HQcqOrpUpvXmtA4Oo80A+hmEid2niMRDHeEtSOLU
 k8EI5CqYIpTTG/Wb9xy+H9yAjDlOTV3CRMmGapiOIL07dSQ18aFEIMTehA66oAPqaSnn
 5a84tGU0HeaKzKuB/VZFyLnl9utzwKoLDwAWMhQQXjLIS4d4bHgoqCPfMbrps0DEoMPE
 UoHhlklG4XEDNotyIdsQyHNaCNC5rS+rvTBL1GyVZFudgwftJGrC6Wt9HUyQrlKJImL9
 gEHltmIGO1fI4rzjQ5s25OhxsKU5sMX/6+EtqFz+mA0z0IDp9x7Ypd4VLSjs1BW825gq
 z+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hh/djYQrNEMIF4psgzBsXUExvtPb1Y7t1bLiWNMzWsY=;
 b=FsryhudMDqOK4ueAwtpk3lYYIAv0LliutcyMaZ0wulFNQ+/E1DurecotOOCSuupcE9
 9Xo9qLGOGBChnsOv5iYYDxiaqRLj2K9laq9PpFdQPsBvTSLyBr2jwL/QQvHcs923qY8v
 C6CBbQTo75sgoRxPgtnROjWrdnjAt5AoO0USOTRvvxqOtbxBPbadv4/Kcx98Et7dSt0X
 SUcQMqB3K0/XpM2lO51N4CLpjwj/72e55fQSUappAdfaiUc3JcCI4hldluIodezjCcYE
 cqjPsRRQOnjHYnnACJcHVRB6frp6t+TIk0JnyDT5cwnp5Gu78DG2Wh75ZXudk+h7g7iu
 8cCA==
X-Gm-Message-State: AO0yUKWeePV3Ueqjrix+mZ1o6s/8VOXVTd1vpqnycyOxtva0PzDQOxjZ
 1pFgEzBTmtw3ahlaxjJTdMA2iQ==
X-Google-Smtp-Source: AK7set+OqaXmsGgdVMih3/Ns+B20PqXQOVemtTtes7Lmuk6ZB3rPCoJcFoNepP2NWMuUpPZDtR6bLQ==
X-Received: by 2002:aa7:8f0b:0:b0:578:ac9f:79a9 with SMTP id
 x11-20020aa78f0b000000b00578ac9f79a9mr14119875pfr.15.1677227843518; 
 Fri, 24 Feb 2023 00:37:23 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 e3-20020aa78243000000b005dd98927cc5sm2507945pfn.76.2023.02.24.00.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 00:37:23 -0800 (PST)
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
Subject: [PATCH V4 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Fri, 24 Feb 2023 14:06:58 +0530
Message-Id: <20230224083701.2657063-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
References: <20230224083701.2657063-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
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
 hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3a5e2e6d53..8b85b34c55 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -132,6 +133,46 @@ static void build_dsdt(GArray *table_data,
     free_aml_allocator();
 }
 
+/* MADT */
+static void build_madt(GArray *table_data,
+                       BIOSLinker *linker,
+                       RISCVVirtState *s)
+{
+    MachineState *ms = MACHINE(s);
+    int socket;
+    uint16_t base_hartid = 0;
+    uint32_t cpu_id = 0;
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
+    for (socket = 0; socket < riscv_socket_count(ms); socket++) {
+        base_hartid = riscv_socket_first_hartid(ms, socket);
+
+        for (int i = 0; i < s->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
+            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
+            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
+            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
+            build_append_int_noprefix(table_data,
+                                      (base_hartid + i), 8);   /* Hart ID  */
+
+            /* ACPI Processor UID  */
+            build_append_int_noprefix(table_data, cpu_id, 4);
+            cpu_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
     GArray *table_offsets;
@@ -153,6 +194,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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


