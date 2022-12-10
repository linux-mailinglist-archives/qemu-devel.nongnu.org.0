Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239B0648F8A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:56:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p42CG-0003PL-Bs; Sat, 10 Dec 2022 10:55:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42C5-0003MU-MD
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:19 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p42C3-0004GI-Ht
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:55:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so1936295wmr.4
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWm8sNYh82p69beZ7suEXNMk1EYMXcOVTbGuJ5uURmo=;
 b=ZGItBjrQOZ7FV9Jav3PMjzhf/h97b/fFDFa4vb4gv8E3sKxkzps8uAGOxOC6t+Br+8
 sTnu38IlwL0mF30Q2MRoZuY1HpsUIDLgD6qywqnlT6zy8O2FXtUHoNedBmG5IGCGhmGL
 pNztmZwXSot8OczTdHu+QkrXYOY671HhhdELV/e/ooBvEB5JWCuzcIRaFlXrSoe4Itmu
 EqA3BT23+IX/6QnVXotK3JalPpVniJG8KqhkkSOyPhnigq9+PhyCDmLRZOAQMagrJ/U4
 oYFaV5puce6RoAn7WVQxoWT/58OxWykIcoqeOT0PLSfVFevO/9GetsQ2B9HHnddmFwob
 4UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWm8sNYh82p69beZ7suEXNMk1EYMXcOVTbGuJ5uURmo=;
 b=WESMDMGgw9LWvKBS95RNSwfDGoWiIU7evmbYAXXspTb5JkmBQQoloCUoo92Xr8CSvy
 i/didd1B2vPXh3y7W6NKanr40Dj6xuHeMrGutVV+Jgh4F6nrmXpeZmNCANnaLpMwYf6i
 AXoE2jQ+r87H4Lm20ApYViyVDVnSP52Eon5v4/am9aH+U2SurNto7P4S3nGY3NbXRCEH
 JgeYranIMGz+/b8wuM795JoxN54JvhE5Lco9NVM+7Lsa5V3eitd7cCJW8kN3UUTJeSI+
 lQLiagIfBVkmkA1rszSFHmKnUNk3+17hNjJUCHwAO+vtMFf4IK0hieTkdQsql2EAlAbc
 XUqQ==
X-Gm-Message-State: ANoB5pn8fxzg0r0/v3YRtCZFovY5Yj4F9liuJVtl38J5emTf3OLdYUwZ
 CzTG9142j/WKipm4/mve+c92Wugg8hiGhjHw8NA=
X-Google-Smtp-Source: AA0mqf6bgC2Vi8OXMU2R+1vZDngEnudtyT5iRjopvy/BFdy36PxBDQu+auGLSUaVVLCSeC112yM+kg==
X-Received: by 2002:a1c:f617:0:b0:3c6:e60f:3f4f with SMTP id
 w23-20020a1cf617000000b003c6e60f3f4fmr8022726wmc.6.1670687711135; 
 Sat, 10 Dec 2022 07:55:11 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h67-20020a1c2146000000b003d1de805de5sm3231329wmh.16.2022.12.10.07.55.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 10 Dec 2022 07:55:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH-for-8.0 1/7] hw/mips/bootloader: Handle buffers as opaque
 arrays
Date: Sat, 10 Dec 2022 16:54:56 +0100
Message-Id: <20221210155502.74609-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210155502.74609-1-philmd@linaro.org>
References: <20221210155502.74609-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

It is irrelevant to the API what the buffers to fill are made of.
In particular, some MIPS ISA have 16-bit wide instructions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/bootloader.c         | 55 +++++++++++++++++++++---------------
 hw/mips/malta.c              | 19 +++++++------
 include/hw/mips/bootloader.h | 10 +++----
 3 files changed, 48 insertions(+), 36 deletions(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index f5f42f2bf2..fc14eb0894 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -55,16 +55,20 @@ static bool bootcpu_supports_isa(uint64_t isa_mask)
 }
 
 /* Base types */
-static void bl_gen_nop(uint32_t **p)
+static void bl_gen_nop(void **ptr)
 {
-    stl_p(*p, 0);
-    *p = *p + 1;
+    uint32_t *p = (uint32_t *)*ptr;
+
+    stl_p(p, 0);
+    p++;
+    *ptr = p;
 }
 
-static void bl_gen_r_type(uint32_t **p, uint8_t opcode,
+static void bl_gen_r_type(void **ptr, uint8_t opcode,
                           bl_reg rs, bl_reg rt, bl_reg rd,
                           uint8_t shift, uint8_t funct)
 {
+    uint32_t *p = (uint32_t *)*ptr;
     uint32_t insn = 0;
 
     insn = deposit32(insn, 26, 6, opcode);
@@ -74,13 +78,16 @@ static void bl_gen_r_type(uint32_t **p, uint8_t opcode,
     insn = deposit32(insn, 6, 5, shift);
     insn = deposit32(insn, 0, 6, funct);
 
-    stl_p(*p, insn);
-    *p = *p + 1;
+    stl_p(p, insn);
+    p++;
+
+    *ptr = p;
 }
 
-static void bl_gen_i_type(uint32_t **p, uint8_t opcode,
+static void bl_gen_i_type(void **ptr, uint8_t opcode,
                           bl_reg rs, bl_reg rt, uint16_t imm)
 {
+    uint32_t *p = (uint32_t *)*ptr;
     uint32_t insn = 0;
 
     insn = deposit32(insn, 26, 6, opcode);
@@ -88,12 +95,14 @@ static void bl_gen_i_type(uint32_t **p, uint8_t opcode,
     insn = deposit32(insn, 16, 5, rt);
     insn = deposit32(insn, 0, 16, imm);
 
-    stl_p(*p, insn);
-    *p = *p + 1;
+    stl_p(p, insn);
+    p++;
+
+    *ptr = p;
 }
 
 /* Single instructions */
-static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
+static void bl_gen_dsll(void **p, bl_reg rd, bl_reg rt, uint8_t sa)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
         bl_gen_r_type(p, 0, 0, rt, rd, sa, 0x38);
@@ -102,28 +111,28 @@ static void bl_gen_dsll(uint32_t **p, bl_reg rd, bl_reg rt, uint8_t sa)
     }
 }
 
-static void bl_gen_jalr(uint32_t **p, bl_reg rs)
+static void bl_gen_jalr(void **p, bl_reg rs)
 {
     bl_gen_r_type(p, 0, rs, 0, BL_REG_RA, 0, 0x09);
 }
 
-static void bl_gen_lui(uint32_t **p, bl_reg rt, uint16_t imm)
+static void bl_gen_lui(void **p, bl_reg rt, uint16_t imm)
 {
     /* R6: It's a alias of AUI with RS = 0 */
     bl_gen_i_type(p, 0x0f, 0, rt, imm);
 }
 
-static void bl_gen_ori(uint32_t **p, bl_reg rt, bl_reg rs, uint16_t imm)
+static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
 {
     bl_gen_i_type(p, 0x0d, rs, rt, imm);
 }
 
-static void bl_gen_sw(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 {
     bl_gen_i_type(p, 0x2b, base, rt, offset);
 }
 
-static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
+static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
         bl_gen_i_type(p, 0x3f, base, rt, offset);
@@ -133,13 +142,13 @@ static void bl_gen_sd(uint32_t **p, bl_reg rt, uint8_t base, uint16_t offset)
 }
 
 /* Pseudo instructions */
-static void bl_gen_li(uint32_t **p, bl_reg rt, uint32_t imm)
+static void bl_gen_li(void **p, bl_reg rt, uint32_t imm)
 {
     bl_gen_lui(p, rt, extract32(imm, 16, 16));
     bl_gen_ori(p, rt, rt, extract32(imm, 0, 16));
 }
 
-static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
+static void bl_gen_dli(void **p, bl_reg rt, uint64_t imm)
 {
     bl_gen_li(p, rt, extract64(imm, 32, 32));
     bl_gen_dsll(p, rt, rt, 16);
@@ -148,7 +157,7 @@ static void bl_gen_dli(uint32_t **p, bl_reg rt, uint64_t imm)
     bl_gen_ori(p, rt, rt, extract64(imm, 0, 16));
 }
 
-static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
+static void bl_gen_load_ulong(void **p, bl_reg rt, target_ulong imm)
 {
     if (bootcpu_supports_isa(ISA_MIPS3)) {
         bl_gen_dli(p, rt, imm); /* 64bit */
@@ -158,14 +167,14 @@ static void bl_gen_load_ulong(uint32_t **p, bl_reg rt, target_ulong imm)
 }
 
 /* Helpers */
-void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr)
+void bl_gen_jump_to(void **p, target_ulong jump_addr)
 {
     bl_gen_load_ulong(p, BL_REG_T9, jump_addr);
     bl_gen_jalr(p, BL_REG_T9);
     bl_gen_nop(p); /* delay slot */
 }
 
-void bl_gen_jump_kernel(uint32_t **p,
+void bl_gen_jump_kernel(void **p,
                         bool set_sp, target_ulong sp,
                         bool set_a0, target_ulong a0,
                         bool set_a1, target_ulong a1,
@@ -192,7 +201,7 @@ void bl_gen_jump_kernel(uint32_t **p,
     bl_gen_jump_to(p, kernel_addr);
 }
 
-void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
+void bl_gen_write_ulong(void **p, target_ulong addr, target_ulong val)
 {
     bl_gen_load_ulong(p, BL_REG_K0, val);
     bl_gen_load_ulong(p, BL_REG_K1, addr);
@@ -203,14 +212,14 @@ void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val)
     }
 }
 
-void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val)
+void bl_gen_write_u32(void **p, target_ulong addr, uint32_t val)
 {
     bl_gen_li(p, BL_REG_K0, val);
     bl_gen_load_ulong(p, BL_REG_K1, addr);
     bl_gen_sw(p, BL_REG_K0, BL_REG_K1, 0x0);
 }
 
-void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val)
+void bl_gen_write_u64(void **p, target_ulong addr, uint64_t val)
 {
     bl_gen_dli(p, BL_REG_K0, val);
     bl_gen_load_ulong(p, BL_REG_K1, addr);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 1f4e0c7acc..944730af98 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -838,6 +838,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
     uint32_t *p;
+    void *v;
 
     /* Small bootloader */
     p = (uint32_t *)base;
@@ -880,38 +881,39 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 #else
 #define cpu_to_gt32 cpu_to_be32
 #endif
+    v = p;
 
     /* move GT64120 registers from 0x14000000 to 0x1be00000 */
-    bl_gen_write_u32(&p, /* GT_ISD */
+    bl_gen_write_u32(&v, /* GT_ISD */
                      cpu_mips_phys_to_kseg1(NULL, 0x14000000 + 0x68),
                      cpu_to_gt32(0x1be00000 << 3));
 
     /* setup MEM-to-PCI0 mapping */
     /* setup PCI0 io window to 0x18000000-0x181fffff */
-    bl_gen_write_u32(&p, /* GT_PCI0IOLD */
+    bl_gen_write_u32(&v, /* GT_PCI0IOLD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x48),
                      cpu_to_gt32(0x18000000 << 3));
-    bl_gen_write_u32(&p, /* GT_PCI0IOHD */
+    bl_gen_write_u32(&v, /* GT_PCI0IOHD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x50),
                      cpu_to_gt32(0x08000000 << 3));
     /* setup PCI0 mem windows */
-    bl_gen_write_u32(&p, /* GT_PCI0M0LD */
+    bl_gen_write_u32(&v, /* GT_PCI0M0LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x58),
                      cpu_to_gt32(0x10000000 << 3));
-    bl_gen_write_u32(&p, /* GT_PCI0M0HD */
+    bl_gen_write_u32(&v, /* GT_PCI0M0HD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x60),
                      cpu_to_gt32(0x07e00000 << 3));
 
-    bl_gen_write_u32(&p, /* GT_PCI0M1LD */
+    bl_gen_write_u32(&v, /* GT_PCI0M1LD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x80),
                      cpu_to_gt32(0x18200000 << 3));
-    bl_gen_write_u32(&p, /* GT_PCI0M1HD */
+    bl_gen_write_u32(&v, /* GT_PCI0M1HD */
                      cpu_mips_phys_to_kseg1(NULL, 0x1be00000 + 0x88),
                      cpu_to_gt32(0x0bc00000 << 3));
 
 #undef cpu_to_gt32
 
-    bl_gen_jump_kernel(&p,
+    bl_gen_jump_kernel(&v,
                        true, ENVP_VADDR - 64,
                        /*
                         * If semihosting is used, arguments have already been
@@ -922,6 +924,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
                        true, ENVP_VADDR + 8,
                        true, loaderparams.ram_low_size,
                        kernel_entry);
+    p = (uint32_t *)v;
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
diff --git a/include/hw/mips/bootloader.h b/include/hw/mips/bootloader.h
index fffb0b7da8..c32f6c2835 100644
--- a/include/hw/mips/bootloader.h
+++ b/include/hw/mips/bootloader.h
@@ -11,16 +11,16 @@
 
 #include "exec/cpu-defs.h"
 
-void bl_gen_jump_to(uint32_t **p, target_ulong jump_addr);
-void bl_gen_jump_kernel(uint32_t **p,
+void bl_gen_jump_to(void **ptr, target_ulong jump_addr);
+void bl_gen_jump_kernel(void **ptr,
                         bool set_sp, target_ulong sp,
                         bool set_a0, target_ulong a0,
                         bool set_a1, target_ulong a1,
                         bool set_a2, target_ulong a2,
                         bool set_a3, target_ulong a3,
                         target_ulong kernel_addr);
-void bl_gen_write_ulong(uint32_t **p, target_ulong addr, target_ulong val);
-void bl_gen_write_u32(uint32_t **p, target_ulong addr, uint32_t val);
-void bl_gen_write_u64(uint32_t **p, target_ulong addr, uint64_t val);
+void bl_gen_write_ulong(void **ptr, target_ulong addr, target_ulong val);
+void bl_gen_write_u32(void **ptr, target_ulong addr, uint32_t val);
+void bl_gen_write_u64(void **ptr, target_ulong addr, uint64_t val);
 
 #endif
-- 
2.38.1


