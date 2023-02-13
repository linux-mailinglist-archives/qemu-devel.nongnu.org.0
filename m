Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C32694851
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:41:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRa11-0006Gh-L3; Mon, 13 Feb 2023 09:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0t-00069r-NX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:03 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pRa0s-0005TZ-8K
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:41:03 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 fu4-20020a17090ad18400b002341fadc370so444937pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 06:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+3u0RokfiHf27XjD4i6Mx9oLVxpDXWFhjR84GcrrvHM=;
 b=UPv4RYOOVUFFCqH6R2CFWZeZZJ5ak7b2ts0HBQkYy1ovG1d8xArloXyE+v74Lj1wpA
 tXoXzZ4rt9eRyjaZEf6PVds3OPawuX35jrNKPStS2F0NvNbWVRnLlRLL11hZSgeLiI6k
 H3+SWsCcdQvW9hRq+SyMSF55Dq/E12g7WcTJHJdnt7Tk0oDrwlqrGx4YcpJo2XeMStHZ
 N21qr2qJ+001RkZstpf86IT3vRxOJ4E+oytlDtmfzN1jZWX8g8rNFjFBIT417UOErGge
 qP/gB9IszyweyJxNGt502+G7OhrDbAoTo38NbPb6NJQBxWZK/RAZK0MMPilMLbTfzR/F
 +aoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+3u0RokfiHf27XjD4i6Mx9oLVxpDXWFhjR84GcrrvHM=;
 b=0x/7nBpPEe3eHuqXLHB/O13jrWhDhUEUqRfDQl9WokE66lh9fcq/H4JsGsowULbE0e
 FCgmTEEU+AEJB3SJ5L7KtftSxJa9gw326RRQMRzCDSkJSwOQ8pmPeWte96T9ksStxtkQ
 /25p/OIui/LO7vtZOXxGkMjfZ6VRbuekzsadw6/JYdjk0lmqse3hMZ+0NV4qGSek7eSs
 ihQYiQqNBO5TW0w3cHE8WblGNJCNb2taWbf3/xj/hn3TzBlQeEoxyHV+yYOgudqzqzLA
 JXDwcY42+pBiMLALpjHkj+bQXUZf3m//Lar2GgmIQrz7m9Hsa2VjeM+A+uKsfvH0Qy7X
 SBPA==
X-Gm-Message-State: AO0yUKWaOGGzBAuEwBO8pViXL96rpd+/u0rmci0XomyitrO1QLdKkh8w
 DVa+I32mz5Dw4dcE6A/F9DjWLQ==
X-Google-Smtp-Source: AK7set9D8UV7qg4n5sPlhULf2l54VjAcJ7V3uYyXRkoYOcBy/YFitdVFOPVxvPWaTX/A3WjtoP5mnw==
X-Received: by 2002:a05:6a21:6713:b0:be:ec6e:6470 with SMTP id
 wh19-20020a056a21671300b000beec6e6470mr18945116pzb.22.1676299260949; 
 Mon, 13 Feb 2023 06:41:00 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b004fb8732a2f9sm3777757pgi.88.2023.02.13.06.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:41:00 -0800 (PST)
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
Subject: [PATCH V2 05/10] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Mon, 13 Feb 2023 20:10:33 +0530
Message-Id: <20230213144038.2547584-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
References: <20230213144038.2547584-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102f.google.com
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

Add Multiple APIC Description Table (MADT) with the
INTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/virt-acpi-build.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 3c4da6c385..f54e3fb731 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -134,6 +134,43 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
     free_aml_allocator();
 }
 
+/* MADT */
+static void
+build_madt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *s)
+{
+    MachineState *mc = MACHINE(s);
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
+    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+        base_hartid = riscv_socket_first_hartid(mc, socket);
+
+        for (int i = 0; i < s->soc[socket].num_harts; i++) {
+            build_append_int_noprefix(table_data, 0x18, 1);    /* Type     */
+            build_append_int_noprefix(table_data, 20, 1);      /* Length   */
+            build_append_int_noprefix(table_data, 1, 1);       /* Version  */
+            build_append_int_noprefix(table_data, 0, 1);       /* Reserved */
+            build_append_int_noprefix(table_data, 1, 4);       /* Flags    */
+            build_append_int_noprefix(table_data,
+                                      (base_hartid + i), 8);   /* hartid   */
+            build_append_int_noprefix(table_data, cpu_id, 4);  /* ACPI ID  */
+            cpu_id++;
+        }
+    }
+
+    acpi_table_end(linker, &table);
+}
+
 static void
 virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
 {
-- 
2.34.1


