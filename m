Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE1C3F0CA5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:22:37 +0200 (CEST)
Received: from localhost ([::1]:42722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS56-0002Wx-Hq
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2J-0007zU-KL
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2D-00066z-BO
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id t13so3334495pfl.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TW2jPB+qt2tYLCLMQFTHUpeWPukL7tgvM1aowRW86hI=;
 b=yUjnjwCDD8adKLXQfGGIzgqtrpnGtmTC0IgFivRXjOTldM20Uao3JEj9UnjOaamXwH
 xd/Cd/dI4fbQaIUTMQ8VSlqZAsbJ4/A7H+69gQ+4a/isYWYziRNyhQ/KZKPFTebM4rHv
 Nv36JX8Xd68tBX+0Njm7Z0NMvqAMZyvQN2/MCutbXNJXtlug19WLTzf/AtAL86tTpy7g
 UkG/s49QpMlvMc4znWxdENrc6y9C8EKjZNgKMHmcZZpgs3XFXsvpe1fIt4lPtgl3QJTw
 tOaTjQIeM5mjmxb6+TI75ujyCo9Sj7K2U0fmzPzFZmXAQyHMFDWzupGBEUOHAEotu7ar
 lLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TW2jPB+qt2tYLCLMQFTHUpeWPukL7tgvM1aowRW86hI=;
 b=MFVUEIDU9eKbjMVtN1Qt5Zebtlw2vJ2NvGIVscIQnSNz/5rL70ffcSzU7FlLg1DGAn
 3Vl0lc18s1ZLEdW/kehavVRC2DcRsOKbt1Xc3R0bfHxpHUYjPX9RwPzUIalKxGeX0z5V
 nbFcohKmZB3vTs47CKkMmn6xeoGFiEfO8WFJDczLByuEWot7gcJ8yIYepdom3YVuRLst
 pL+j/dERBhd9oQ3qxVI6dFmergLsJDCHXZ3xRTd1eKHG8QOymoMYMpd1ySimd/YxYU9L
 Katgr6EWQwxif6+F96QHD2Tvuf/Ozxp9y4ITw5wquLGDfIK5AnbNZobtvRqYBnI5GiGO
 U7gw==
X-Gm-Message-State: AOAM533hZG+HzNmg3XaZem+ETBQh69euu/KPknh8pXHi6hyOL9wfwzOI
 VWy+lzul6WMQIPcD70Olhy2m/vPnL4T5xA==
X-Google-Smtp-Source: ABdhPJxfhwm1QOogYDU/qn3PpHWdq2pZOcByW5kJxwsMUo1bRyWwMdPTRfwGHdszDBYjlEh0oFPeKw==
X-Received: by 2002:a63:790b:: with SMTP id u11mr10394040pgc.71.1629317975388; 
 Wed, 18 Aug 2021 13:19:35 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/16] tcg/mips: Support unaligned access for user-only
Date: Wed, 18 Aug 2021 10:19:16 -1000
Message-Id: <20210818201931.393394-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

This is kinda sorta the opposite of the other tcg hosts, where
we get (normal) alignment checks for free with host SIGBUS and
need to add code to support unaligned accesses.

Fortunately, the ISA contains pairs of instructions that are
used to implement unaligned memory accesses.  Use them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |   2 -
 tcg/mips/tcg-target.c.inc | 324 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 318 insertions(+), 8 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index 3a62055f04..3afbb31918 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -209,8 +209,6 @@ extern bool use_mips32r2_instructions;
 
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t);
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 02dc4b63ae..7ed0de9dae 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -24,6 +24,8 @@
  * THE SOFTWARE.
  */
 
+#include "../tcg-ldst.c.inc"
+
 #ifdef HOST_WORDS_BIGENDIAN
 # define MIPS_BE  1
 #else
@@ -230,16 +232,26 @@ typedef enum {
     OPC_ORI      = 015 << 26,
     OPC_XORI     = 016 << 26,
     OPC_LUI      = 017 << 26,
+    OPC_BNEL     = 025 << 26,
+    OPC_BNEZALC_R6 = 030 << 26,
     OPC_DADDIU   = 031 << 26,
+    OPC_LDL      = 032 << 26,
+    OPC_LDR      = 033 << 26,
     OPC_LB       = 040 << 26,
     OPC_LH       = 041 << 26,
+    OPC_LWL      = 042 << 26,
     OPC_LW       = 043 << 26,
     OPC_LBU      = 044 << 26,
     OPC_LHU      = 045 << 26,
+    OPC_LWR      = 046 << 26,
     OPC_LWU      = 047 << 26,
     OPC_SB       = 050 << 26,
     OPC_SH       = 051 << 26,
+    OPC_SWL      = 052 << 26,
     OPC_SW       = 053 << 26,
+    OPC_SDL      = 054 << 26,
+    OPC_SDR      = 055 << 26,
+    OPC_SWR      = 056 << 26,
     OPC_LD       = 067 << 26,
     OPC_SD       = 077 << 26,
 
@@ -1035,8 +1047,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 }
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
@@ -1344,7 +1354,82 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
     return true;
 }
-#endif
+
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *l = new_ldst_label(s);
+
+    l->is_ld = is_ld;
+    l->addrlo_reg = addrlo;
+    l->addrhi_reg = addrhi;
+
+    /* We are expecting a_bits to max out at 7, much lower than ANDI. */
+    tcg_debug_assert(a_bits < 16);
+    tcg_out_opc_imm(s, OPC_ANDI, TCG_TMP0, addrlo, a_mask);
+
+    l->label_ptr[0] = s->code_ptr;
+    if (use_mips32r6_instructions) {
+        tcg_out_opc_br(s, OPC_BNEZALC_R6, TCG_REG_ZERO, TCG_TMP0);
+    } else {
+        tcg_out_opc_br(s, OPC_BNEL, TCG_TMP0, TCG_REG_ZERO);
+        tcg_out_nop(s);
+    }
+
+    l->raddr = tcg_splitwx_to_rx(s->code_ptr);
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    void *target;
+
+    if (!reloc_pc16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
+        return false;
+    }
+
+    if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
+        /* A0 is env, A1 is skipped, A2:A3 is the uint64_t address. */
+        TCGReg a2 = MIPS_BE ? l->addrhi_reg : l->addrlo_reg;
+        TCGReg a3 = MIPS_BE ? l->addrlo_reg : l->addrhi_reg;
+
+        if (a3 != TCG_REG_A2) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
+        } else if (a2 != TCG_REG_A3) {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, a3);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, a2);
+        } else {
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_TMP0, TCG_REG_A2);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A2, TCG_REG_A3);
+            tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_A3, TCG_TMP0);
+        }
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
+    }
+    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
+
+    /*
+     * Tail call to the helper, with the return address back inline.
+     * We have arrived here via BNEL, so $31 is already set.
+     */
+    target = (l->is_ld ? helper_unaligned_ld : helper_unaligned_st);
+    tcg_out_call_int(s, target, true);
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+#endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
                                    TCGReg base, MemOp opc, bool is_64)
@@ -1450,6 +1535,117 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
+static void __attribute__((unused))
+tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+                                    TCGReg base, MemOp opc, bool is_64)
+{
+    const MIPSInsn lw1 = MIPS_BE ? OPC_LWL : OPC_LWR;
+    const MIPSInsn lw2 = MIPS_BE ? OPC_LWR : OPC_LWL;
+    const MIPSInsn ld1 = MIPS_BE ? OPC_LDL : OPC_LDR;
+    const MIPSInsn ld2 = MIPS_BE ? OPC_LDR : OPC_LDL;
+
+    bool sgn = (opc & MO_SIGN);
+
+    switch (opc & (MO_SSIZE | MO_BSWAP)) {
+    case MO_SW | MO_BE:
+    case MO_UW | MO_BE:
+        tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 0);
+        tcg_out_opc_imm(s, OPC_LBU, TCG_TMP1, base, 1);
+        tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
+        tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
+        break;
+
+    case MO_SW | MO_LE:
+    case MO_UW | MO_LE:
+        tcg_out_opc_imm(s, OPC_LBU, TCG_TMP0, base, 0);
+        tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP1, base, 1);
+        tcg_out_opc_sa(s, OPC_SLL, TCG_TMP1, TCG_TMP1, 8);
+        tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
+        break;
+
+    case MO_SL:
+    case MO_UL:
+        tcg_out_opc_imm(s, lw1, lo, base, 0);
+        tcg_out_opc_imm(s, lw2, lo, base, 3);
+        if (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn) {
+            tcg_out_ext32u(s, lo, lo);
+        }
+        break;
+
+    case MO_UL | MO_BSWAP:
+    case MO_SL | MO_BSWAP:
+        if (use_mips32r2_instructions) {
+            tcg_out_opc_imm(s, lw1, lo, base, 0);
+            tcg_out_opc_imm(s, lw2, lo, base, 3);
+            tcg_out_bswap32(s, lo, lo,
+                            TCG_TARGET_REG_BITS == 64 && is_64
+                            ? (sgn ? TCG_BSWAP_OS : TCG_BSWAP_OZ) : 0);
+        } else {
+            const tcg_insn_unit *subr =
+                (TCG_TARGET_REG_BITS == 64 && is_64 && !sgn
+                 ? bswap32u_addr : bswap32_addr);
+
+            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0);
+            tcg_out_bswap_subr(s, subr);
+            /* delay slot */
+            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 3);
+            tcg_out_mov(s, is_64 ? TCG_TYPE_I64 : TCG_TYPE_I32, lo, TCG_TMP3);
+        }
+        break;
+
+    case MO_Q:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_opc_imm(s, ld1, lo, base, 0);
+            tcg_out_opc_imm(s, ld2, lo, base, 7);
+        } else {
+            tcg_out_opc_imm(s, lw1, MIPS_BE ? hi : lo, base, 0 + 0);
+            tcg_out_opc_imm(s, lw2, MIPS_BE ? hi : lo, base, 0 + 3);
+            tcg_out_opc_imm(s, lw1, MIPS_BE ? lo : hi, base, 4 + 0);
+            tcg_out_opc_imm(s, lw2, MIPS_BE ? lo : hi, base, 4 + 3);
+        }
+        break;
+
+    case MO_Q | MO_BSWAP:
+        if (TCG_TARGET_REG_BITS == 64) {
+            if (use_mips32r2_instructions) {
+                tcg_out_opc_imm(s, ld1, lo, base, 0);
+                tcg_out_opc_imm(s, ld2, lo, base, 7);
+                tcg_out_bswap64(s, lo, lo);
+            } else {
+                tcg_out_opc_imm(s, ld1, TCG_TMP0, base, 0);
+                tcg_out_bswap_subr(s, bswap64_addr);
+                /* delay slot */
+                tcg_out_opc_imm(s, ld2, TCG_TMP0, base, 7);
+                tcg_out_mov(s, TCG_TYPE_I64, lo, TCG_TMP3);
+            }
+        } else if (use_mips32r2_instructions) {
+            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
+            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
+            tcg_out_opc_imm(s, lw1, TCG_TMP1, base, 4 + 0);
+            tcg_out_opc_imm(s, lw2, TCG_TMP1, base, 4 + 3);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, TCG_TMP0);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, TCG_TMP1);
+            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? lo : hi, TCG_TMP0, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, MIPS_BE ? hi : lo, TCG_TMP1, 16);
+        } else {
+            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 0 + 0);
+            tcg_out_bswap_subr(s, bswap32_addr);
+            /* delay slot */
+            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 0 + 3);
+            tcg_out_opc_imm(s, lw1, TCG_TMP0, base, 4 + 0);
+            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? lo : hi, TCG_TMP3);
+            tcg_out_bswap_subr(s, bswap32_addr);
+            /* delay slot */
+            tcg_out_opc_imm(s, lw2, TCG_TMP0, base, 4 + 3);
+            tcg_out_mov(s, TCG_TYPE_I32, MIPS_BE ? hi : lo, TCG_TMP3);
+        }
+        break;
+
+    default:
+        tcg_abort();
+    }
+}
+
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
@@ -1458,6 +1654,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits, s_bits;
 #endif
     TCGReg base = TCG_REG_A0;
 
@@ -1487,7 +1685,27 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     } else {
         tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-    tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
+    /*
+     * R6 removes the left/right instructions but requires the
+     * system to support misaligned memory accesses.
+     */
+    if (use_mips32r6_instructions) {
+        if (a_bits) {
+            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+        }
+        tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+    } else {
+        if (a_bits && a_bits != s_bits) {
+            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+        }
+        if (a_bits >= s_bits) {
+            tcg_out_qemu_ld_direct(s, data_regl, data_regh, base, opc, is_64);
+        } else {
+            tcg_out_qemu_ld_unalign(s, data_regl, data_regh, base, opc, is_64);
+        }
+    }
 #endif
 }
 
@@ -1552,6 +1770,79 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
     }
 }
 
+static void __attribute__((unused))
+tcg_out_qemu_st_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
+                                    TCGReg base, MemOp opc)
+{
+    const MIPSInsn sw1 = MIPS_BE ? OPC_SWL : OPC_SWR;
+    const MIPSInsn sw2 = MIPS_BE ? OPC_SWR : OPC_SWL;
+    const MIPSInsn sd1 = MIPS_BE ? OPC_SDL : OPC_SDR;
+    const MIPSInsn sd2 = MIPS_BE ? OPC_SDR : OPC_SDL;
+
+    /* Don't clutter the code below with checks to avoid bswapping ZERO.  */
+    if ((lo | hi) == 0) {
+        opc &= ~MO_BSWAP;
+    }
+
+    switch (opc & (MO_SIZE | MO_BSWAP)) {
+    case MO_16 | MO_BE:
+        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
+        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 0);
+        tcg_out_opc_imm(s, OPC_SB, lo, base, 1);
+        break;
+
+    case MO_16 | MO_LE:
+        tcg_out_opc_sa(s, OPC_SRL, TCG_TMP0, lo, 8);
+        tcg_out_opc_imm(s, OPC_SB, lo, base, 0);
+        tcg_out_opc_imm(s, OPC_SB, TCG_TMP0, base, 1);
+        break;
+
+    case MO_32 | MO_BSWAP:
+        tcg_out_bswap32(s, TCG_TMP3, lo, 0);
+        lo = TCG_TMP3;
+        /* fall through */
+    case MO_32:
+        tcg_out_opc_imm(s, sw1, lo, base, 0);
+        tcg_out_opc_imm(s, sw2, lo, base, 3);
+        break;
+
+    case MO_64 | MO_BSWAP:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_bswap64(s, TCG_TMP3, lo);
+            lo = TCG_TMP3;
+        } else if (use_mips32r2_instructions) {
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP0, 0, MIPS_BE ? hi : lo);
+            tcg_out_opc_reg(s, OPC_WSBH, TCG_TMP1, 0, MIPS_BE ? lo : hi);
+            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP0, TCG_TMP0, 16);
+            tcg_out_opc_sa(s, OPC_ROTR, TCG_TMP1, TCG_TMP1, 16);
+            hi = MIPS_BE ? TCG_TMP0 : TCG_TMP1;
+            lo = MIPS_BE ? TCG_TMP1 : TCG_TMP0;
+        } else {
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? lo : hi, 0);
+            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0);
+            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 3);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
+            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4);
+            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 7);
+            break;
+        }
+        /* fall through */
+    case MO_64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_opc_imm(s, sd1, lo, base, 0);
+            tcg_out_opc_imm(s, sd2, lo, base, 7);
+        } else {
+            tcg_out_opc_imm(s, sw1, MIPS_BE ? hi : lo, base, 0);
+            tcg_out_opc_imm(s, sw2, MIPS_BE ? hi : lo, base, 3);
+            tcg_out_opc_imm(s, sw1, MIPS_BE ? lo : hi, base, 4);
+            tcg_out_opc_imm(s, sw2, MIPS_BE ? lo : hi, base, 7);
+        }
+        break;
+
+    default:
+        tcg_abort();
+    }
+}
 static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
@@ -1560,6 +1851,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits, s_bits;
 #endif
     TCGReg base = TCG_REG_A0;
 
@@ -1578,7 +1871,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    base = TCG_REG_A0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
@@ -1590,7 +1882,27 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     } else {
         tcg_out_opc_reg(s, ALIAS_PADD, base, TCG_GUEST_BASE_REG, addr_regl);
     }
-    tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    a_bits = get_alignment_bits(opc);
+    s_bits = opc & MO_SIZE;
+    /*
+     * R6 removes the left/right instructions but requires the
+     * system to support misaligned memory accesses.
+     */
+    if (use_mips32r6_instructions) {
+        if (a_bits) {
+            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+        }
+        tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+    } else {
+        if (a_bits && a_bits != s_bits) {
+            tcg_out_test_alignment(s, true, addr_regl, addr_regh, a_bits);
+        }
+        if (a_bits >= s_bits) {
+            tcg_out_qemu_st_direct(s, data_regl, data_regh, base, opc);
+        } else {
+            tcg_out_qemu_st_unalign(s, data_regl, data_regh, base, opc);
+        }
+    }
 #endif
 }
 
-- 
2.25.1


