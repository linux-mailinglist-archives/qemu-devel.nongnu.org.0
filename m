Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F148D6874BB
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 05:54:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNRam-0004ah-Ob; Wed, 01 Feb 2023 23:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaZ-0004RA-2W
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:47 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pNRaX-0001E1-Is
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 23:52:46 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so90818pjp.0
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 20:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbhV7ZtkZcHXjWUQc3+IGI4C3Mx+0jb5hp/aNqWZgQI=;
 b=Sy5QlpnSQnP2+JGVKM95/4MAUblym/1Xy0CScIqSO/Kn4S1n3GLyF/YIZL7bRlOfaW
 W6zzsrEtUlX6IgRUWFMNOe5mXHuEMIn932HAbPTkvp5YQ4m2tyRLpRMZbG8GAtbE1GXm
 LuEXMFOpNP7UNQssvXuM43cMnq/ztiyIGua96dSlb+x6n1dSKHONs94h1QgpI8xSKc4O
 Pfvwgbc+E5RU14DrW+WZwu7vCOk+XhVloYVbRQg3OX7KiVH9V0q0w5120Te9P5S5pjqA
 6U/b5RwQ5pInYwkcsbvzLcG6Hm7wBYwhhw7N49cZip3Su35TqANxXmRiglcpAKc0f1Hu
 vcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qbhV7ZtkZcHXjWUQc3+IGI4C3Mx+0jb5hp/aNqWZgQI=;
 b=ynspXec6s6Hk4+Tk8/qmCfSIuZT/XRutMCT3sB1KKlqctDQVRPCSRMU8VahAmF9Bhb
 IwAdL8q7yCVraHJ8dZYfn3lcBSo5kLuciZ1lpCl74D9gRI7bIdH0DCTiftmVKjjEauI8
 PX3pQMH3ESFwEpSpnqGucxeAoHpIzmH47OnZpW/tcwg+63tWHxXqagDkUsZ4KaThrwQY
 pnLmhlIkr9r08MJXJ/XzFcacgDj//BUlVastqhZs9mm3sSXaYuJneDdKNIhHG02pRAF4
 hftESrM08dOyQYQ/u2jA3JnH3ZCr9B1v46GxYlJ34y1U/Nd3YFywwWF3VGXGHQAPP1/u
 8AOw==
X-Gm-Message-State: AO0yUKWlQxS4MYNEOUSbVTxMFERStO16OA9si2Ki31kAUAwKCtddHDJi
 MAvhxDthJbtw5dS5201mwWBIbA==
X-Google-Smtp-Source: AK7set8iiIYu+Ql4j1HOjO/G09WeFbTrU64fLl1exlANlsyeYgnMM/huf35ElG1ILU+nzvcRuwU+og==
X-Received: by 2002:a17:902:e883:b0:198:a49b:9f20 with SMTP id
 w3-20020a170902e88300b00198a49b9f20mr6771326plg.56.1675313564179; 
 Wed, 01 Feb 2023 20:52:44 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b001965540395fsm11222265ply.105.2023.02.01.20.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 20:52:43 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 05/10] hw/riscv/virt: virt-acpi-build.c: Add RINTC in MADT
Date: Thu,  2 Feb 2023 10:22:18 +0530
Message-Id: <20230202045223.2594627-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
INTC structure for each cpu.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt-acpi-build.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 0410b955bd..2f65f1e2e5 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -137,6 +137,43 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
     free_aml_allocator();
 }
 
+/* MADT */
+static void
+build_madt(GArray *table_data, BIOSLinker *linker, RISCVVirtState *vms)
+{
+    MachineState *mc = MACHINE(vms);
+    int socket;
+    uint16_t base_hartid = 0;
+    uint32_t cpu_id = 0;
+
+    AcpiTable table = { .sig = "APIC", .rev = 6, .oem_id = vms->oem_id,
+                        .oem_table_id = vms->oem_table_id };
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
+        for (int i = 0; i < vms->soc[socket].num_harts; i++) {
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
 virt_acpi_build(RISCVVirtState *vms, AcpiBuildTables *tables)
 {
-- 
2.38.0


