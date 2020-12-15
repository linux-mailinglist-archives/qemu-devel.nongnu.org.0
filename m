Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640CB2DA831
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 07:48:17 +0100 (CET)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp488-0007hO-ER
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 01:48:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45R-0005ud-3H
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:29 -0500
Received: from relay1.mymailcheap.com ([144.217.248.102]:60562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kp45N-0004vZ-Tz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 01:45:27 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id D17853F1C5;
 Tue, 15 Dec 2020 06:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id AC0B62A370;
 Tue, 15 Dec 2020 01:45:24 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608014724;
 bh=eGnooaniH90/48CtMlnOSMVavirfnaDqTaKTCdxxx9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qBY1OW09XMG1qsbAvqgUv5pq2XL9aqkjP3s8bsjOCOac3ot8LdCzPoPLFVci30pXx
 0MiMO/HiDTTSxiJV+uohGcINlYVKBIVtQs3hm/FMylsGouVmhJlI8RFQshnVcVrCYR
 syp+pFMbTIX2r4DskjGeHSGVxXKVC8Klh14XSC24=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ORFrgsL5FSaH; Tue, 15 Dec 2020 01:45:23 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 01:45:23 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 8349D41001;
 Tue, 15 Dec 2020 06:45:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="GnaJyb6d"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 59506403B9;
 Tue, 15 Dec 2020 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608014717;
 bh=eGnooaniH90/48CtMlnOSMVavirfnaDqTaKTCdxxx9w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GnaJyb6dI3FWaRBY7MGusQ2FI2sGekLCVt1VAy7ZV3edRZMvAL/QRDa2wn41XdLcb
 xUWfJd2I0bsUoSVO0MgAScEaOcYnrvoweZQ7lT9Sr9/JP29D/RImrdM2or1YEsThCU
 8pg+1ASqz1aaLXaP1waS/ZW1fwYI3LQjyJqNbzGs=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/8] hw/mips: Add a bootloader helper
Date: Tue, 15 Dec 2020 14:45:04 +0800
Message-Id: <20201215064507.30148-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
References: <20201215064200.28751-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 RCPT_COUNT_FIVE(0.00)[5]; ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: 8349D41001
X-Spam: Yes
Received-SPF: pass client-ip=144.217.248.102;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay1.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, chenhuacai@kernel.org,
 f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a bootloader helper to generate simple bootloaders for kernel.
It can help us reduce inline hex hack and also keep MIPS release 6
compatibility easier.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/bootloader.c         | 157 +++++++++++++++++++++++++++++++++++
 hw/mips/meson.build          |   2 +-
 include/hw/mips/bootloader.h |  48 +++++++++++
 3 files changed, 206 insertions(+), 1 deletion(-)
 create mode 100644 hw/mips/bootloader.c
 create mode 100644 include/hw/mips/bootloader.h

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
new file mode 100644
index 0000000000..97916ffd24
--- /dev/null
+++ b/hw/mips/bootloader.c
@@ -0,0 +1,157 @@
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
+/* Base types */
+static void bl_gen_nop(uint32_t **p)
+{
+    stl_p(*p, 0);
+    *p = *p + 1;
+}
+
+static void bl_gen_r_type(uint32_t **p, uint8_t opcode, bl_reg rs, bl_reg rt,
+                            bl_reg rd, uint8_t shift, uint8_t funct)
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
+static void bl_gen_i_type(uint32_t **p, uint8_t opcode, bl_reg rs, bl_reg rt,
+                            uint16_t imm)
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
+static bool bootcpu_supports_isa(uint64_t isa_mask)
+{
+    return cpu_supports_isa(&MIPS_CPU(first_cpu)->env, isa_mask);
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
+    bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x9);
+}
+
+static void bl_gen_lui(uint32_t **p, bl_reg rt, uint16_t imm)
+{
+    /* R6: It's a alias of AUI with RS = 0 */
+    bl_gen_i_type(p, 0xf, 0, rt, imm);
+}
+
+static void bl_gen_ori(uint32_t **p, bl_reg rt, bl_reg rs, uint16_t imm)
+{
+    bl_gen_i_type(p, 0xd, rs, rt, imm);
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
+void bl_gen_write_u32(uint32_t **p, uint32_t val, target_ulong addr)
+{
+    bl_gen_li(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
+
+void bl_gen_write_u64(uint32_t **p, uint64_t val, target_ulong addr)
+{
+    bl_gen_dli(p, BL_REG_K0, val);
+    bl_gen_load_ulong(p, BL_REG_K1, addr);
+    bl_gen_sd(p, BL_REG_K0, BL_REG_K1, 0x0);
+}
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 77b4d8f365..fdb783ff55 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,5 @@
 mips_ss = ss.source_set()
-mips_ss.add(files('mips_int.c'))
+mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
new file mode 100644
index 0000000000..96c7333b9e
--- /dev/null
+++ b/include/hw/mips/bootloader.h
@@ -0,0 +1,48 @@
+#ifndef HW_MIPS_BOOTLOADER_H
+#define HW_MIPS_BOOTLOADER_H
+
+#include "exec/cpu-defs.h"
+
+void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
+void bl_gen_jump_kernel(uint32_t **p, target_ulong sp, target_ulong a0,
+                        target_ulong a1, target_ulong a2, target_ulong a3,
+                        target_ulong kernel_addr);
+void bl_gen_write_u32(uint32_t **p, uint32_t val, target_ulong addr);
+void bl_gen_write_u64(uint32_t **p, uint64_t val, target_ulong addr);
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
+#endif
-- 
2.29.2

