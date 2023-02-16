Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53092699A64
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:43:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShKT-0004lR-I0; Thu, 16 Feb 2023 11:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKR-0004hq-DP
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:51 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pShKP-0000Xz-NN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:41:51 -0500
Received: by mail-pl1-x62c.google.com with SMTP id l9so31841plk.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bQDU46N3rDTzLn5FXJmqO5LODOp0HEKx8SmnOWYr7Ew=;
 b=CoZVnyNqRTKC8FLFL4xIKQpERcuj+6Mv7psJ+nz9lxfCHif6ksW3olhIxO/GF4NNSI
 BDVjidZ2jCmgnlHcgr+rfb+Q8dReZp9JurV2ahqDSu6XJriVmojL+tbrTzV5baz6rvsy
 UwnqMkRVv+NY9Q0yCnYeoZV9evAiwPRAqn/NKNkToJTTTR6dGD4qIveL8YlO4jAi0qEA
 WYP096tj0l8GK+Xsn9FgBDVyiAkc1+C5U5E7qaQfCkC5UlgZDDoR3EFguWBabpBEPhNb
 tIMIB5zkkxuhXbQBhqkALkR6426jr+MFwEy0BG5ABia+6UZHR37kN9p3Fe4JP5up+FaS
 rxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bQDU46N3rDTzLn5FXJmqO5LODOp0HEKx8SmnOWYr7Ew=;
 b=rsh6AIouVMCAiPD5Sble+KV+RuTMqm2r9EQIW2Ag7tcuIuuMZYGG43B8bkDp0Y8//D
 xskvxx1wA8QeFurpbubSLXgMzfsPM9a42/Vf/DMcWCOUbRDgeuQL+jRX4HITmB9bd1qJ
 DcTCKRhpJHWO7/SNqXYtfsUlwe5JL9QwTq4zVJRfTo45F/V8l/TQTmoRIjOQ1m4Tr6WF
 /0P0ecg8jh0l2VxKqIe7OIiNue6LfXId4ABc0lKdbc3bUbfy471wmoFTgnBgH1kwyYLy
 9aAAi0mTShew4gHQDiHqAKu0SH6086gyBOkODL0wyDEThBqXXuq+NPQ51oG4b7bw3Kt9
 MFIg==
X-Gm-Message-State: AO0yUKUF6Rp2uasAsS+yWt7vXmO3rSgqAh1xhjcetEriOrEJRYswe6de
 T9SQZNMdplJCCFhyBVrd9Wb4EA==
X-Google-Smtp-Source: AK7set84VREEjcdDuUNQcbugCCNTp8hPZr+uU0qorCW5LXD66vjEDZTf0Cy6TgfLyA3hkv4FRPx8TA==
X-Received: by 2002:a05:6a20:468a:b0:c7:40a1:ac1b with SMTP id
 el10-20020a056a20468a00b000c740a1ac1bmr1116232pzb.50.1676565708490; 
 Thu, 16 Feb 2023 08:41:48 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 q20-20020a638c54000000b004fbd10af99asm1385243pgn.60.2023.02.16.08.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:41:48 -0800 (PST)
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
Subject: [PATCH V3 5/8] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Thu, 16 Feb 2023 22:11:22 +0530
Message-Id: <20230216164125.1945633-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
References: <20230216164125.1945633-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62c.google.com
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
---
 hw/riscv/virt-acpi-build.c | 44 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 30af974db3..58e49cd6d6 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -32,6 +32,7 @@
 #include "sysemu/reset.h"
 #include "migration/vmstate.h"
 #include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
@@ -123,6 +124,46 @@ static void build_dsdt(GArray *table_data,
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
@@ -144,6 +185,9 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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


