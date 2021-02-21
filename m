Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9DB320AF9
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:40:00 +0100 (CET)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDptv-0002QI-2D
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpou-0005hR-Ge
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpos-0002N9-Mf
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:34:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id v14so16329609wro.7
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ve8RjuoAWGH2WX8beLgrtVqqJfaNMmArR28tW7YrT0s=;
 b=UUNH9uxqgXaRs57RPjjFwJAG39rMW2go8Qxf+b0opm/VMO1TOqKTBO6glgNjY5yPWb
 Lt2t8GMcWHDNm+7vX6l3Yl3frRXHSO2vfkjE4VtJ49WAEF39XTGYXsYRURVkxjgIOv7n
 u/QxNoetzuB74l+GmFETMrtoBJl97N3/kAjMqWEfaIwdASZ/GOuGz804p4j3ElrAwpKo
 daS2OB3h3qX8l6USdUmzmV2dhyeRA98Xc535L02jQc1rqCDZuIvBc9XhX0iP+xjvNow0
 CVDB9nbDBlkn6qEzH99HpQu7HwkxEUj3Wv+Cl0etrBlcWbEWslF5zOO5t+Fd7MBZncw0
 378g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ve8RjuoAWGH2WX8beLgrtVqqJfaNMmArR28tW7YrT0s=;
 b=erk0adR5qKjZi2rgzbx6g77tM9bLZqH5ccbKgOWgDNwCuRJclT+CDiQGk3sidJU+t5
 jjjmzfRfXGf0OabKLcbS/L/jN/OFtgy/K5bgc8ZAKuNgdGf6LdhvPYv70TEEn92g8qmb
 9wpa1GGN5Pg79z/QUDNzVWYFd8N9AoZt8CRbB83/kCZ0SeQAReP9nIw0TVGW4f4imKOz
 nlMjL3A2dzxMz+jhEN9hOAh8uk42POLzfP2/CdFSg7YBo3ovaFSQMIs/mRwOzhTJ2IgN
 ssSvN+Er75jxu1RmazoXWnCiCANvxSCLZeLjVyFAAJknWAyEcdyNBQZe+4LAYdIPlAWy
 P/MA==
X-Gm-Message-State: AOAM5314b782aZQz1+4l15kaRlRIGuZy5V0qK6NW9KhYbOEYF5xPxfIs
 3emdLMZscvDLpvYjeAhIc5U/uWS58mE=
X-Google-Smtp-Source: ABdhPJzTkxyEAOaOdIjUzNO4NIke6Q5FeJDqOGNncqXHzCh5qkUn5tHKnJ/KZz9Y/UmMyEgdVxIAog==
X-Received: by 2002:adf:f089:: with SMTP id n9mr18012900wro.98.1613918084981; 
 Sun, 21 Feb 2021 06:34:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h12sm30179756wru.18.2021.02.21.06.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:34:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/43] hw/mips: Add a bootloader helper
Date: Sun, 21 Feb 2021 15:33:51 +0100
Message-Id: <20210221143432.2468220-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Add a bootloader helper to generate simple bootloaders for kernel.
It can help us reduce inline hex hack and also keep MIPS release 6
compatibility easier.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210127065424.114125-2-jiaxun.yang@flygoat.com>
[PMD: Restricted bl_reg enum to C source, inverted bl_gen_write() args]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mips/bootloader.h |  14 +++
 hw/mips/bootloader.c         | 200 +++++++++++++++++++++++++++++++++++
 hw/mips/meson.build          |   2 +-
 3 files changed, 215 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/mips/bootloader.h
 create mode 100644 hw/mips/bootloader.c

diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
new file mode 100644
index 00000000000..88eb9f49180
--- /dev/null
+++ b/include/hw/mips/bootloader.h
@@ -0,0 +1,14 @@
+#ifndef HW_MIPS_BOOTLOADER_H
+#define HW_MIPS_BOOTLOADER_H
+
+#include "exec/cpu-defs.h"
+
+void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
+void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
+                        target_ulong a1, target_ulong a2, target_ulong a3,
+                        target_ulong kernel_addr);
+void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
+void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
+void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
+
+#endif
diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
new file mode 100644
index 00000000000..6ec83144909
--- /dev/null
+++ b/hw/mips/bootloader.c
@@ -0,0 +1,200 @@
+/*
+ * Utility for QEMU MIPS to generate it's simple bootloader
+ *
+ * Instructions used here are carefully selected to keep compatibility with
+ * MIPS Release 6.
+ *
+ * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "cpu.h"
+#include "hw/mips/bootloader.h"
+
+typedef enum bl_reg {
+    BL_REG_ZERO = 0,
+    BL_REG_AT = 1,
+    BL_REG_V0 = 2,
+    BL_REG_V1 = 3,
+    BL_REG_A0 = 4,
+    BL_REG_A1 = 5,
+    BL_REG_A2 = 6,
+    BL_REG_A3 = 7,
+    BL_REG_T0 = 8,
+    BL_REG_T1 = 9,
+    BL_REG_T2 = 10,
+    BL_REG_T3 = 11,
+    BL_REG_T4 = 12,
+    BL_REG_T5 = 13,
+    BL_REG_T6 = 14,
+    BL_REG_T7 = 15,
+    BL_REG_S0 = 16,
+    BL_REG_S1 = 17,
+    BL_REG_S2 = 18,
+    BL_REG_S3 = 19,
+    BL_REG_S4 = 20,
+    BL_REG_S5 = 21,
+    BL_REG_S6 = 22,
+    BL_REG_S7 = 23,
+    BL_REG_T8 = 24,
+    BL_REG_T9 = 25,
+    BL_REG_K0 = 26,
+    BL_REG_K1 = 27,
+    BL_REG_GP = 28,
+    BL_REG_SP = 29,
+    BL_REG_FP = 30,
+    BL_REG_RA = 31,
+} bl_reg;
+
+static bool bootcpu_supports_isa(uint64_t isa_mask)
+{
+    return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
+}
+
+/* Base types */
+static void bl_gen_nop(uint32_t **p)
+{
+    stl_p(*p, 0);
+    *p = *p + 1;
+}
+
+static void bl_gen_r_type(uint32_t **p, uint8_t opcode,
+                          bl_reg rs, bl_reg rt, bl_reg rd,
+                          uint8_t shift, uint8_t funct)
+{
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, opcode);
+    insn = deposit32(insn, 21, 5, rs);
+    insn = deposit32(insn, 16, 5, rt);
+    insn = deposit32(insn, 11, 5, rd);
+    insn = deposit32(insn, 6, 5, shift);
+    insn = deposit32(insn, 0, 6, funct);
+
+    stl_p(*p, insn);
+    *p = *p + 1;
+}
+
+static void bl_gen_i_type(uint32_t **p, uint8_t opcode,
+                          bl_reg rs, bl_reg rt, uint16_t imm)
+{
+    uint32_t insn = 0;
+
+    insn = deposit32(insn, 26, 6, opcode);
+    insn = deposit32(insn, 21, 5, rs);
+    insn = deposit32(insn, 16, 5, rt);
+    insn = deposit32(insn, 0, 16, imm);
+
+    stl_p(*p, insn);
+    *p = *p + 1;
+}
+
+/* Single instructions */
+static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
+    } else {
+        g_assert_not_reached(); /* unsupported */
+    }
+}
+
+static void bl_gen_jalr(uint32_t **p, bl_reg rs)
+{
+    bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
+}
+
+static void bl_gen_lui(uint32_t **p, bl_reg rt, uint16_t imm)
+{
+    /* R6: It's a alias of AUI with RS = 0 */
+    bl_gen_i_type(p, 0x0f, 0, rt, imm);
+}
+
+static void bl_gen_ori(uint32_t **p, bl_reg rt, bl_reg rs, uint16_t imm)
+{
+    bl_gen_i_type(p, 0x0d, rs, rt, imm);
+}
+
+static void bl_gen_sw(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+{
+    bl_gen_i_type(p, 0x2b, base, rt, offset);
+}
+
+static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_i_type(p, 0x3f, base, rt, offset);
+    } else {
+        g_assert_not_reached(); /* unsupported */
+    }
+}
+
+/* Pseudo instructions */
+static void bl_gen_li(uint32_t **p, bl_reg rt, uint32_t imm)
+{
+    bl_gen_lui(p, rt, extract32(imm, 16, 16));
+    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+}
+
+static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
+{
+    bl_gen_li(p, rt, extract64(imm, 32, 32));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_ori(p, rt, rt, extract64(imm, 16, 16));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_ori(p, rt, rt, extract64(imm, 0, 16));
+}
+
+static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
+{
+    if (bootcpu_supports_isa(ISA_MIPS3)) {
+        bl_gen_dli(p, rt, imm); /* 64bit */
+    } else {
+        bl_gen_li(p, rt, imm); /* 32bit */
+    }
+}
+
+/* Helpers */
+void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr)
+{
+    bl_gen_load_ulong(p, BL_REG_T9, jump_addr);
+    bl_gen_jalr(p, BL_REG_T9);
+    bl_gen_nop(p); /* delay slot */
+}
+
+void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
+                        target_ulong a1, target_ulong a2, target_ulong a3,
+                        target_ulong kernel_addr)
+{
+    bl_gen_load_ulong(p, BL_REG_SP, sp);
+    bl_gen_load_ulong(p, BL_REG_A0, a0);
+    bl_gen_load_ulong(p, BL_REG_A1, a1);
+    bl_gen_load_ulong(p, BL_REG_A2, a2);
+    bl_gen_load_ulong(p, BL_REG_A3, a3);
+
+    bl_gen_jump_to(p, kernel_addr);
+}
+
+void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
+{
+    bl_gen_load_ulong(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
+
+void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
+{
+    bl_gen_li(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
+
+void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val)
+{
+    bl_gen_dli(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index ee19cc204dc..1195716dc73 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,5 @@
 mips_ss = ss.source_set()
-mips_ss.add(files('mips_int.c'))
+mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-- 
2.26.2


