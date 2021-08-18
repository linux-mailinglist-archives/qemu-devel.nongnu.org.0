Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC643F0D5E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 23:33:16 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTBT-0002RW-S8
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 17:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7q-0006DE-Qu
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:43000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGT7o-0005pQ-SW
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 17:29:30 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w6so2648453plg.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 14:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s5r7qpgniveSM3WnTFZrHgwHVXy2cCAVB+CqYnFl+i0=;
 b=fk1Wn10sX9NfJfmq/7NwvLCRzkhW0M1EIIPKwPaKAnCM1r9Gk7yg/CI7Ro1/tkxT8O
 SBlHg7zlaR2Qr1hOEe7cOkTiL43jDgtncqNIas0MfgEj0h9A//zq4y5gw+qrgRhFFVuT
 af1tl0jeC3maK1qC0NFPWCFBiH7nXpHBkDl2VyGJOTxqq0BZU1s2Wv6gMuSqY6XiaB5g
 8+oZfSySIj5UBs4BJs8zv+fZJtu9pdhz00rRjUWBCvKpCPKnDXefaFLIUxfZpuC9JMLx
 0ayk0Mhnkr9SgQz9vAOQqdYpE0sRNy33PdOl89xfPrM3Dw2nhoNJV4MwsBcBCD99wKRQ
 5gFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5r7qpgniveSM3WnTFZrHgwHVXy2cCAVB+CqYnFl+i0=;
 b=VtDpNPQPc6dV6SndF60Ama+NkBbtcpKZuaLteczDxxiG/dACxGpTZxbm05eN1ohuZ1
 f0+ySnEGQCcleDcuu48UxmS870BRGZTdTipixq15Sx3agZnoB4w5T+lHgXAnSBl5zQtU
 lM5HPU6AFjFx4o9p3NLWVpOEWspEl/voNrhnGAAVnCRYZGnWnzgLUm+JAfa9vHjI7Yy4
 dVQy7c3dOcTt8IF0AasSc1BVcMg/HJSIxCweIh0QQrqmtkGsqlL++SFBnPBr65pZhslz
 cKhegdYCnsLCan/oqTc7gEh2P2q5nMIOFfRkr7cTdi//sOoWVwFNZOpcizYEatsEXX6N
 a0SA==
X-Gm-Message-State: AOAM533LlkLVHd7BD0ZSLeeWh9JUOKzvC+vNFV+sZK+oikA4An7o5+ky
 8WWAv7+DDf8kUwb5kmxVzLm1exYQCNHRrw==
X-Google-Smtp-Source: ABdhPJz3UPwcuUAuPG+hOaUt3FQPc2FYot3nCejkI5j2Gs6KxmE8S/w+jRGnKDN3vjjdfr5ojae7aw==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr11877540pjb.20.1629322167640; 
 Wed, 18 Aug 2021 14:29:27 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y19sm751965pfe.71.2021.08.18.14.29.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:29:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/14] tcg/arm: Reserve a register for guest_base
Date: Wed, 18 Aug 2021 11:29:11 -1000
Message-Id: <20210818212912.396794-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818212912.396794-1-richard.henderson@linaro.org>
References: <20210818212912.396794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reserve a register for the guest_base using aarch64 for reference.
By doing so, we do not have to recompute it for every memory load.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index 35bd4c68d6..2728035177 100644
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
@@ -1763,7 +1766,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 
 static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1790,7 +1794,7 @@ static void tcg_out_qemu_ld_index(TCGContext *s, MemOp opc,
             && get_alignment_bits(opc) >= MO_64
             && (datalo & 1) == 0 && datahi == datalo + 1) {
             tcg_out_ldrd_r(s, COND_AL, datalo, addrlo, addend);
-        } else if (datalo != addend) {
+        } else if (scratch_addend) {
             tcg_out_ld32_rwb(s, COND_AL, datalo, addend, addrlo);
             tcg_out_ld32_12(s, COND_AL, datahi, addend, 4);
         } else {
@@ -1875,14 +1879,14 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
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
@@ -1891,7 +1895,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 
 static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
                                   TCGReg datalo, TCGReg datahi,
-                                  TCGReg addrlo, TCGReg addend)
+                                  TCGReg addrlo, TCGReg addend,
+                                  bool scratch_addend)
 {
     /* Byte swapping is left to middle-end expansion. */
     tcg_debug_assert((opc & MO_BSWAP) == 0);
@@ -1912,9 +1917,14 @@ static void tcg_out_qemu_st_index(TCGContext *s, ARMCond cond, MemOp opc,
             && get_alignment_bits(opc) >= MO_64
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
@@ -1978,7 +1988,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     mem_index = get_mmuidx(oi);
     addend = tcg_out_tlb_read(s, addrlo, addrhi, opc, mem_index, 0);
 
-    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi, addrlo, addend);
+    tcg_out_qemu_st_index(s, COND_EQ, opc, datalo, datahi,
+                          addrlo, addend, true);
 
     /* The conditional call must come last, as we're going to return here.  */
     label_ptr = s->code_ptr;
@@ -1988,9 +1999,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
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
@@ -3153,6 +3163,13 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
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


