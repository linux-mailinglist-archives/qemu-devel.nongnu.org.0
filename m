Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FF72D09ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:06:25 +0100 (CET)
Received: from localhost ([::1]:44276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km8j9-00070z-Rg
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8gu-0005f3-Cf
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:04:04 -0500
Received: from relay2.mymailcheap.com ([217.182.66.162]:52830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1km8ge-0008WG-Ir
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:04:04 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id BECF83EDFC;
 Mon,  7 Dec 2020 06:03:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id EB9562A379;
 Mon,  7 Dec 2020 00:03:45 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1607317426;
 bh=HutcaZYyuTUEkXqJXioMKO3eP00QO/I/C6hI8S3vRFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vzxv74JUboEasrQ6hiJyWu/ciLPbNP53Zaf0LawetFWSAnOaqLcemfTTwfof+LVCK
 lzFk8BKV9fLLWboe06SN6jrupoppbz8IRZJVaOSo1Bhsi42t2imK7awkJ6ZUOnBbNS
 36l/0WTG6hrVC6Zdvye22AUZl8qD3r2cT5exazWc=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2rS-IAK3N7Z4; Mon,  7 Dec 2020 00:03:45 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon,  7 Dec 2020 00:03:42 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
 by mail20.mymailcheap.com (Postfix) with ESMTP id BB67F41FD2;
 Mon,  7 Dec 2020 05:03:41 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="ExWp/W7d"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id BC30241FB1;
 Mon,  7 Dec 2020 05:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1607317399;
 bh=HutcaZYyuTUEkXqJXioMKO3eP00QO/I/C6hI8S3vRFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ExWp/W7d3rhqKSVt9348DIG+mXWaoVzeJWN3lMQNy/4JORNk5v4AhdWb76zho4AQw
 UWl6VILJ8IqOkWD/EQ8pBIUoH9Qk9YAEJ/ZGer4ZfnnWyyoPBdHo+h5X7Vc3rhNs+U
 aC+XNPZRlUuPrdDepC9KziQ9zXHO6KfV8PsX3vGU=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] hw/mips: Add a bootloader helper
Date: Mon,  7 Dec 2020 13:02:27 +0800
Message-Id: <20201207050231.2712-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
References: <20201207050231.2712-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BB67F41FD2
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all]; RCPT_COUNT_FIVE(0.00)[5];
 ML_SERVERS(-3.10)[148.251.23.173];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=217.182.66.162;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay2.mymailcheap.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a bootloader helper to generate simple bootloaders for kernel.
It can help us reduce inline hex hack and also keep MIPS release 6
compatibility easier.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/bootloader.c      | 150 ++++++++++++++++++++++++++++++++++++++
 hw/mips/meson.build       |   2 +-
 include/hw/mips/cpudevs.h |   8 ++
 3 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 hw/mips/bootloader.c

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
new file mode 100644
index 0000000000..3210c26bb7
--- /dev/null
+++ b/hw/mips/bootloader.c
@@ -0,0 +1,150 @@
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
+#include "hw/mips/cpudevs.h"
+
+/* Base types */
+static void bl_gen_nop(uint32_t **p)
+{
+    stl_p(*p, 0);
+    *p = *p + 1;
+}
+
+static void bl_gen_r_type(uint32_t **p, uint8_t opcode, uint8_t rs, uint8_t rt,
+                            uint8_t rd, uint8_t shift, uint8_t funct)
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
+static void bl_gen_i_type(uint32_t **p, uint8_t opcode, uint8_t rs, uint8_t rt,
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
+/* Single instructions */
+static void bl_gen_dsll(uint32_t **p, uint8_t rd, uint8_t rt, uint8_t sa)
+{
+    /* R6: OK, 32: NO */
+    bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
+}
+
+static void bl_gen_daddiu(uint32_t **p, uint8_t rt, uint8_t rs, uint16_t imm)
+{
+    /* R6: OK, 32: NO */
+    bl_gen_i_type(p, 0x19, rs, rt, imm);
+}
+
+static void bl_gen_jalr(uint32_t **p, uint8_t rs)
+{
+    /* R6: OK, 32: OK */
+    bl_gen_r_type(p, 0, rs, 0, 31, 0, 0x9);
+}
+
+static void bl_gen_lui(uint32_t **p, uint8_t rt, uint16_t imm)
+{
+    /* R6: It's a alias of AUI with RS = 0, 32: OK */
+    bl_gen_i_type(p, 0xf, 0, rt, imm);
+}
+
+static void bl_gen_ori(uint32_t **p, uint8_t rt, uint8_t rs, uint16_t imm)
+{
+    /* R6: OK, 32: OK */
+    bl_gen_i_type(p, 0xd, rs, rt, imm);
+}
+
+static void bl_gen_sw(uint32_t **p, uint8_t rt, uint8_t base, uint16_t offset)
+{
+    /* R6: OK, 32: NO */
+    bl_gen_i_type(p, 0x2b, base, rt, offset);
+}
+
+static void bl_gen_sd(uint32_t **p, uint8_t rt, uint8_t base, uint16_t offset)
+{
+    /* R6: OK, 32: NO */
+    bl_gen_i_type(p, 0x3f, base, rt, offset);
+}
+
+/* Pseudo instructions */
+static void bl_gen_li(uint32_t **p, uint8_t rt, uint32_t imm)
+{
+    /* R6: OK, 32 OK */
+    bl_gen_lui(p, rt, extract32(imm, 16, 16));
+    bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
+}
+
+static void bl_gen_dli(uint32_t **p, uint8_t rt, uint64_t imm)
+{
+    /* R6: OK, 32 NO */
+    bl_gen_li(p, rt, extract64(imm, 32, 32));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_daddiu(p, rt, rt, extract64(imm, 16, 16));
+    bl_gen_dsll(p, rt, rt, 16);
+    bl_gen_daddiu(p, rt, rt, extract64(imm, 0, 16));
+}
+
+/* Helpers */
+void bl_gen_jump_to(uint32_t **p, uint32_t jump_addr)
+{
+    /* Use ra to jump */
+    bl_gen_li(p, 31, jump_addr);
+    bl_gen_jalr(p, 31);
+    bl_gen_nop(p); /* delay slot, useless for R6 */
+}
+
+void bl_gen_jump_kernel(uint32_t **p, uint32_t sp, uint32_t a0,
+                        uint32_t a1, uint32_t a2, uint32_t a3,
+                        uint32_t kernel_addr)
+{
+    bl_gen_li(p, 29, sp);
+    bl_gen_li(p, 4, a0);
+    bl_gen_li(p, 5, a1);
+    bl_gen_li(p, 6, a2);
+    bl_gen_li(p, 7, a3);
+
+    bl_gen_jump_to(p, kernel_addr);
+}
+
+void bl_gen_writel(uint32_t **p, uint32_t val, uint32_t addr)
+{
+    bl_gen_li(p, 26, val);
+    bl_gen_li(p, 27, addr);
+    bl_gen_sw(p, 26, 27, 0x0);
+}
+
+void bl_gen_writeq(uint32_t **p, uint64_t val, uint32_t addr)
+{
+    /* 64 Only */
+    bl_gen_dli(p, 26, val);
+    bl_gen_li(p, 27, addr);
+    bl_gen_sd(p, 26, 27, 0x0);
+}
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index bcdf96be69..053459377f 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,5 +1,5 @@
 mips_ss = ss.source_set()
-mips_ss.add(files('addr.c', 'mips_int.c'))
+mips_ss.add(files('addr.c', 'bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
diff --git a/include/hw/mips/cpudevs.h b/include/hw/mips/cpudevs.h
index 291f59281a..0b3e060c95 100644
--- a/include/hw/mips/cpudevs.h
+++ b/include/hw/mips/cpudevs.h
@@ -12,6 +12,14 @@ uint64_t cpu_mips_kvm_um_phys_to_kseg0(void *opaque, uint64_t addr);
 bool mips_um_ksegs_enabled(void);
 void mips_um_ksegs_enable(void);
 
+/* bootloader.c */
+void bl_gen_jump_to(uint32_t **p, uint32_t jump_addr);
+void bl_gen_jump_kernel(uint32_t **p, uint32_t sp, uint32_t a0,
+                        uint32_t a1, uint32_t a2, uint32_t a3,
+                        uint32_t kernel_addr);
+void bl_gen_writel(uint32_t **p, uint32_t val, uint32_t addr);
+void bl_gen_writeq(uint32_t **p, uint64_t val, uint32_t addr);
+
 /* mips_int.c */
 void cpu_mips_irq_init_cpu(MIPSCPU *cpu);
 
-- 
2.29.2

