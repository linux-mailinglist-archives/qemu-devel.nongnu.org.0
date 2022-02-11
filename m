Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE944B1B9C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 02:50:33 +0100 (CET)
Received: from localhost ([::1]:48038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIL4x-0008O5-S0
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 20:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnf-00052x-3J
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:42 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42838
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIKnc-0007Si-Dd
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 20:32:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i6so11582042pfc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKMjMlXFJG6hvG1+zESWbFSMe4fCNR2aaQRlmfkml/s=;
 b=VTAV11oVtV1f1Ysr2SuomphFG+5J4bLgNbbW6p9hAmF/DJgob/pGpq1yYu8q+nhqWD
 O4tyK7FNlW1gNonJQGtrAWNfoT2MI2kMexSpNqt+FhJTtgvtSDGrfezuFGvMw4uFXcYL
 /AFr99K9KqCf6Fv0bvnSNoygYARzNcoYgUXIZUkL7gIzniRGBsxOGb0OUPvAD+yS17po
 4X1VmO8o4382DXxFvRGrEUXaciDObZfC8i30QCyOHlVoVBcdgs9l+a6DHkSD58Tgjw9Y
 vQpCz+35BRhtwHE75YuScQxpfcZgn/5Xq75j3HOp+ifd8b2QIbXa0lJcmnHc5liR56Ue
 OLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKMjMlXFJG6hvG1+zESWbFSMe4fCNR2aaQRlmfkml/s=;
 b=HzSmXQ1M0q/LWvidQvcwPWzhMJTVzN0x2hyazjy57rBI5Ukj/pTVY81YzqqSIN1q0K
 7LH/+NOWJi4vs+DIEVzn8lupOSFC4G/nXc3s19y3L5Kas/L/H3g9JEch9P4+cGyV+s/x
 vU93kuSlQyE8GL6dVSFDPLi3HgiiXAZi/e9DomW7tobzAqqcfakPcYhI/xj8C2BkVlCQ
 EngymFJiY6aSvG3O0XYraAaFQnOdlT5eytwLJrXV3BCnk2XmSsz2bGbtZYy5791jMoI+
 DHwqQCnc/UO/WFuRp/wvY7++HdiKEOrRFFM2GX22FpdwK6tUXHGsgjTtSaXpo473MLCO
 Zl3g==
X-Gm-Message-State: AOAM530UTc2if06XJkRQBNCE+lMdXlLqeqcHpeeEFFILuu3RZe0v2s3n
 4IOqPUQOrafOaq2b5OSy+Quqx+KddN4iHhpg
X-Google-Smtp-Source: ABdhPJxgNjq+PsgEz0a91H/1GcKdPE8Nr+hZ58KDmfLAdWq7kUY5JT+lyO6S/5gDU70dQmBJZi4mLw==
X-Received: by 2002:a63:4d66:: with SMTP id n38mr8263483pgl.597.1644543155000; 
 Thu, 10 Feb 2022 17:32:35 -0800 (PST)
Received: from localhost.localdomain ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id h5sm25738788pfi.111.2022.02.10.17.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 17:32:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/34] tcg/mips: Support unaligned access for user-only
Date: Fri, 11 Feb 2022 12:30:49 +1100
Message-Id: <20220211013059.17994-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211013059.17994-1-richard.henderson@linaro.org>
References: <20220211013059.17994-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is kinda sorta the opposite of the other tcg hosts, where
we get (normal) alignment checks for free with host SIGBUS and
need to add code to support unaligned accesses.

Fortunately, the ISA contains pairs of instructions that are
used to implement unaligned memory accesses.  Use them.

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.h     |   2 -
 tcg/mips/tcg-target.c.inc | 334 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 328 insertions(+), 8 deletions(-)

diff --git a/tcg/mips/tcg-target.h b/tcg/mips/tcg-target.h
index c366fdf74b..7669213175 100644
--- a/tcg/mips/tcg-target.h
+++ b/tcg/mips/tcg-target.h
@@ -207,8 +207,6 @@ extern bool use_mips32r2_instructions;
 void tb_target_set_jmp_target(uintptr_t, uintptr_t, uintptr_t, uintptr_t)
     QEMU_ERROR("code path is reachable");
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 
 #endif
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index 27b020e66c..2c94ac2ed6 100644
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
 
@@ -1015,8 +1027,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 }
 
 #if defined(CONFIG_SOFTMMU)
-#include "../tcg-ldst.c.inc"
-
 static void * const qemu_ld_helpers[(MO_SSIZE | MO_BSWAP) + 1] = {
     [MO_UB]   = helper_ret_ldub_mmu,
     [MO_SB]   = helper_ret_ldsb_mmu,
@@ -1324,7 +1334,82 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
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
@@ -1430,6 +1515,127 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg lo, TCGReg hi,
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
+        tcg_out_opc_imm(s, OPC_LBU, lo, base, 1);
+        if (use_mips32r2_instructions) {
+            tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
+        } else {
+            tcg_out_opc_sa(s, OPC_SLL, TCG_TMP0, TCG_TMP0, 8);
+            tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
+        }
+        break;
+
+    case MO_SW | MO_LE:
+    case MO_UW | MO_LE:
+        if (use_mips32r2_instructions && lo != base) {
+            tcg_out_opc_imm(s, OPC_LBU, lo, base, 0);
+            tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP0, base, 1);
+            tcg_out_opc_bf(s, OPC_INS, lo, TCG_TMP0, 31, 8);
+        } else {
+            tcg_out_opc_imm(s, OPC_LBU, TCG_TMP0, base, 0);
+            tcg_out_opc_imm(s, sgn ? OPC_LB : OPC_LBU, TCG_TMP1, base, 1);
+            tcg_out_opc_sa(s, OPC_SLL, TCG_TMP1, TCG_TMP1, 8);
+            tcg_out_opc_reg(s, OPC_OR, lo, TCG_TMP0, TCG_TMP1);
+        }
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
+    case MO_UQ:
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
+    case MO_UQ | MO_BSWAP:
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
+        g_assert_not_reached();
+    }
+}
+
 static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
 {
     TCGReg addr_regl, addr_regh __attribute__((unused));
@@ -1438,6 +1644,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits, s_bits;
 #endif
     TCGReg base = TCG_REG_A0;
 
@@ -1467,7 +1675,27 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is_64)
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
 
@@ -1532,6 +1760,79 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg lo, TCGReg hi,
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
+            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 0 + 0);
+            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 0 + 3);
+            tcg_out_bswap32(s, TCG_TMP3, MIPS_BE ? hi : lo, 0);
+            tcg_out_opc_imm(s, sw1, TCG_TMP3, base, 4 + 0);
+            tcg_out_opc_imm(s, sw2, TCG_TMP3, base, 4 + 3);
+            break;
+        }
+        /* fall through */
+    case MO_64:
+        if (TCG_TARGET_REG_BITS == 64) {
+            tcg_out_opc_imm(s, sd1, lo, base, 0);
+            tcg_out_opc_imm(s, sd2, lo, base, 7);
+        } else {
+            tcg_out_opc_imm(s, sw1, MIPS_BE ? hi : lo, base, 0 + 0);
+            tcg_out_opc_imm(s, sw2, MIPS_BE ? hi : lo, base, 0 + 3);
+            tcg_out_opc_imm(s, sw1, MIPS_BE ? lo : hi, base, 4 + 0);
+            tcg_out_opc_imm(s, sw2, MIPS_BE ? lo : hi, base, 4 + 3);
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
@@ -1540,6 +1841,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
     MemOp opc;
 #if defined(CONFIG_SOFTMMU)
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits, s_bits;
 #endif
     TCGReg base = TCG_REG_A0;
 
@@ -1558,7 +1861,6 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
                         data_regl, data_regh, addr_regl, addr_regh,
                         s->code_ptr, label_ptr);
 #else
-    base = TCG_REG_A0;
     if (TCG_TARGET_REG_BITS > TARGET_LONG_BITS) {
         tcg_out_ext32u(s, base, addr_regl);
         addr_regl = base;
@@ -1570,7 +1872,27 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is_64)
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


