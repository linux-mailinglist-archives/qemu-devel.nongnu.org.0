Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA707320D3B
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:44:10 +0100 (CET)
Received: from localhost ([::1]:33774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDueH-00046c-TC
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:44:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuch-0002no-DV
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuce-0006tT-TH
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:42:30 -0500
Received: by mail-wm1-x329.google.com with SMTP id m25so3007949wmi.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CfIgBdFjssnMHa3mkwHM1/bRnpOU7pZnN0fWXKus9GM=;
 b=deMzOCcFGbgK5AQnSfmlRzLmqxJRYpAKrK0QiajKXrUsdBf9hxFjJdMSYO/L+acszF
 R3AmIYe1BTbosVvoiilubCrGxI4G6+GelDh6kyXkc23Yc6BWnSDKljddUrxRF06Q6GQ0
 HKV0SQE2s2fKzozYIXdILsmMghmNm6l8Hpd5O8thG4iQWrklrvyL5qW6QsZ7QRaJ7+Ku
 A9WLolrIVTuYQFMFalO/8ccaNakNBYZTlo5y6Ruh/GdXalZUsrL8a3qTjB2YTL/q6wow
 zpfgpm98INe9W2ajcB1ru6pfnmYzNWGaYUwTxOhi/kNgpJ0mnkS11PWowu/VJaXOepGh
 3vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CfIgBdFjssnMHa3mkwHM1/bRnpOU7pZnN0fWXKus9GM=;
 b=fQYNZzdJLraVPQLiWjP+e9g49Zm2scjujtR7gFjhs84rVIjgD+ZUdlQ9RdAMIJloOa
 OGdqVP18t0FM6vCCzuJM3Jiokce2dovm6YVcNrFkSk3b2WxbGlvJOvWUbGyJZ32nJs+C
 9B6j0bmwE+P8uy6Os+1Lejo+OzWLB5fgo6vDmlFTOi2SlmwY3GG/+MrrazRFPDD+yGvv
 7FcxzWJcDPaosMe1HS6hH1D782dHfQqUI7Tg8BvpuLil0fXPwK8HLwfawdkyC0FZhlwP
 Fn1luWkFSLkfvgDJDQNlXUNbV+cUvZVUrdnyo7YLGATU1Q9XoaMW7CuUnx6RPkcofBIe
 1hlw==
X-Gm-Message-State: AOAM533Ml2XEZ7ioOb+zyfd+gF+Nz7nq3L0mQuzq+qsFrhRk3mUEzZWA
 kQrePthBEEfivh9PFcBb2Ku+EO2q1VU=
X-Google-Smtp-Source: ABdhPJxsfIyxI+Q+wxD9R0TrKtciYb1xQeRRdo2LOXD2Zi0XmZa7rPkotSb3Le1AFXKiOpynhtfkYA==
X-Received: by 2002:a05:600c:2291:: with SMTP id
 17mr9363987wmf.169.1613936547251; 
 Sun, 21 Feb 2021 11:42:27 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v18sm22739074wrf.75.2021.02.21.11.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 11:42:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/43] hw/mips: Add a bootloader helper
Date: Sun, 21 Feb 2021 20:38:50 +0100
Message-Id: <20210221193851.2528045-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221193851.2528045-1-f4bug@amsat.org>
References: <20210221193851.2528045-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
[PMD: Restricted bl_reg enum to C source,
      inverted bl_gen_write() args,
      added license in hw/mips/bootloader.h]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/mips/bootloader.h |  22 ++++
 hw/mips/bootloader.c         | 200 +++++++++++++++++++++++++++++++++++
 hw/mips/meson.build          |   2 +-
 3 files changed, 223 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/mips/bootloader.h
 create mode 100644 hw/mips/bootloader.c

diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
new file mode 100644
index 00000000000..b5f48d71bba
--- /dev/null
+++ b/include/hw/mips/bootloader.h
@@ -0,0 +1,22 @@
+/*
+ * Utility for QEMU MIPS to generate it's simple bootloader
+ *
+ * Copyright (C) 2020 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
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


