Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09135488272
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:41:13 +0100 (CET)
Received: from localhost ([::1]:35076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66P8-0001mW-6g
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:44:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65IE-0001ME-Pd
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:36 -0500
Received: from [2607:f8b0:4864:20::102b] (port=50764
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I7-0003cv-6P
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:28 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gp5so7109505pjb.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n8gyEPwJzcgJlBpee50d2KiUG6+KHxHBpSh7KBn9vpk=;
 b=TPdJ0Xdt8DFWsKDC9mvsysDkQ45FGcn0BTCRF7mMS80dzmEp2pO7AawXHuNhsxSOlP
 7QlfvRK01fG3mcSRNCkEecrRD2F4HQPMP18cHCIEX5eyT7FWYFSDUmta8hxt5iyu7yT0
 3dewr5P5sxiBMWUstXopFgQgYW1kQ+zQCGlSv+NCDlPaapVSxLVCfyypn8r9D134vg+z
 yJtRtl+cA95OhWMEGXGLw+yWSx6NCPi2zOhzkNlLcUMu5yvLJnGPCph2KgyS/4IscZNM
 lQmJCgl/W6KshdIwIuw/lSRZwnoFGIB1Kt4Yg9QO9Z+YJk7xeg9coQGvTRPCIZ0qNIVm
 voSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n8gyEPwJzcgJlBpee50d2KiUG6+KHxHBpSh7KBn9vpk=;
 b=sQvVLAUIaO8SZbBARyi0gQpJyoMxIhU9Fq0btIZHtTK5msYtUX9HOxV7XPCQjZy2OD
 H0fcq3xlAcYCzuKvbAj2CngLTuj9eGB9i7fDU5J+0luNjfk6yQMo8dvTAPhUo8mu6e9v
 DyHNj/y+gLOGG0HNbjW5L5BsO30sbEZm4BFH1fFfx+5tuIdlHxPWEBEvChB6Rn5ZlcnA
 KnW/uKpg7d9k5QeQiOKTcA0MA17+kXwJK0Nxi0GtqZcAJy0N4N/XfejQs3Q6X5uIs6f2
 hVLqerdGUR3nLTiM4NRM/T33MZmH5lwaeHKUGMua9LFApvVN/34G8mH0kRa/NkPH0qMH
 Fkgg==
X-Gm-Message-State: AOAM531SyjBVsTUPC6hG0DSQlSj1cqc6xdjnR67dkjaSUGkQDg1tE6G1
 RT8/pbykfLEkdx5QiNqjjuYIVlYCk2n37A==
X-Google-Smtp-Source: ABdhPJwq1rA9GOqX4+quYI7IsifetYTiCOAloLzFhSuHlEZhB1jgkqepZ9FtWsete2O1xnoAbPMyJQ==
X-Received: by 2002:a17:90b:3ec5:: with SMTP id
 rm5mr19449380pjb.100.1641623605934; 
 Fri, 07 Jan 2022 22:33:25 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/7] tcg/arm: Reserve a register for guest_base
Date: Fri,  7 Jan 2022 22:33:12 -0800
Message-Id: <20220108063313.477784-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220108063313.477784-1-richard.henderson@linaro.org>
References: <20220108063313.477784-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reserve a register for the guest_base using aarch64 for reference.
By doing so, we do not have to recompute it for every memory load.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b6ef279cae..1c00311877 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -84,6 +84,9 @@ static const int tcg_target_call_oarg_regs[2] = {
 
 #define TCG_REG_TMP  TCG_REG_R12
 #define TCG_VEC_TMP  TCG_REG_Q15
+#ifndef CONFIG_SOFTMMU
+#define TCG_REG_GUEST_BASE  TCG_REG_R11
+#endif
 
 typedef enum {
     COND_EQ = 0x0,
@@ -1590,7 +1593,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1616,7 +1620,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
         if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
-        } else if (datalo != addend) {
+        } else if (scratch_addend) {
             tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
             tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
         } else {
@@ -1700,14 +1704,14 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     label_ptr = s->code_ptr;
     tcg_out_bl_imm(s, COND_NE, 0);
 
-    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend);
+    tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, addend, true);
 
     add_qemu_ldst_label(s, true, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, guest_base);
-        tcg_out_qemu_ld_index(s, opc, datalo, datahi, addrlo, TCG_REG_TMP);
+        tcg_out_qemu_ld_index(s, opc, datalo, datahi,
+                              addrlo, TCG_REG_GUEST_BASE, false);
     } else {
         tcg_out_qemu_ld_direct(s, opc, datalo, datahi, addrlo);
     }
@@ -1716,7 +1720,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1736,9 +1741,14 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
         if (get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_strd_r(s, cond, datalo, addrlo, addend);
-        } else {
+        } else if (scratch_addend) {
             tcg_out_st32_rwb(s, cond, datalo, addend, addrlo);
             tcg_out_st32_12(s, cond, datahi, addend, 4);
+        } else {
+            tcg_out_dat_reg(s, cond, ARITH_ADD, TCG_REG_TMP,
+                            addend, addrlo, SHIFT_IMM_LSL(0));
+            tcg_out_st32_12(s, cond, datalo, TCG_REG_TMP, 0);
+            tcg_out_st32_12(s, cond, datahi, TCG_REG_TMP, 4);
         }
         break;
     default:
@@ -1801,7 +1811,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     mem_index = get_mmuidx(oi);
     addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
 
-    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi, addrlo, addend);
+    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
+                          addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
     label_ptr = s->code_ptr;
@@ -1811,9 +1822,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
                         s->code_ptr, label_ptr);
 #else /* !CONFIG_SOFTMMU */
     if (guest_base) {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_TMP, guest_base);
-        tcg_out_qemu_st_index(s, COND_AL, opc, datalo,
-                              datahi, addrlo, TCG_REG_TMP);
+        tcg_out_qemu_st_index(s, COND_AL, opc, datalo, datahi,
+                              addrlo, TCG_REG_GUEST_BASE, false);
     } else {
         tcg_out_qemu_st_direct(s, opc, datalo, datahi, addrlo);
     }
@@ -2955,6 +2965,13 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
 
+#ifndef CONFIG_SOFTMMU
+    if (guest_base) {
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_GUEST_BASE, guest_base);
+        tcg_regset_set_reg(s->reserved_regs, TCG_REG_GUEST_BASE);
+    }
+#endif
+
     tcg_out_b_reg(s, COND_AL, tcg_target_call_iarg_regs[1]);
 
     /*
-- 
2.25.1


