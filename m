Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7259E6F5143
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:24:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6e2-0005Sk-5h; Wed, 03 May 2023 03:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6da-00035N-Ly
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:55 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dM-00077w-UN
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1763ee8f8so30940995e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097839; x=1685689839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kSvmWvewT6DAwHW7Dk3CYO+nDkMqwiVa8dlhAxhzxaQ=;
 b=q0P4zbfOAOurm1+SY9FAvvdKaVvRXqSe9aJF0or2MAGQjf7Hm2IkxL+md3BGvp9vWJ
 bhY4WongLMAux0j4U5+094iTEOhLxuJiN2Z3WDcGSxzGkIcZV5WSfuGXHBkbRxnK3udv
 HhyjuYVKjAzoP+6UXXjhhvLUWU7w1NuBLFhVUDJ2EtyynMIo0rWtCfRuW3Mz34dm9NL9
 Rx8ZQ4D+BRPDlzoHLylQxSQ+Z1ocKFCIx5jjqBfmpVdnqcW54eh2BHZFesyD3v0Ei/Ic
 GDy41TJvkB+szgGPcaaP3AWv31jLomVZx1nlqBvkhHiIQh9rSYwI4Y1qm76TH/n4dWMm
 vPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097839; x=1685689839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSvmWvewT6DAwHW7Dk3CYO+nDkMqwiVa8dlhAxhzxaQ=;
 b=UlEckdXknBjNQ1Cepz1oZXj7H0DlAhjfl/tUAjC54843PxIecHcW9l0QVyPnQLZWBY
 ahcl80xhMPi2z+EBRpZExC6zWwSxd6qr0XxaEcI+ajbQ5l6Z79LkFqAKkdb/7J8vbzGQ
 h7QX44j6/nfMHO751pgg5YOfybtL3ZBxtaWR//gAfWVMxzMl5s9NB0s62Nr2jsXjdVgE
 uVp/MIRZlNfQ3YB3rcskdjoSG6L8BPrY5Xxdwbq+pp2BYLLZCwkNst9r9X82SXv9NesX
 wIApmxf78p0D16HHFqqV5egcJ0tyo4bYyz+Mfl5z8UGNNkvfUyJtkU3Rm2GE87QL1CDO
 fLgA==
X-Gm-Message-State: AC+VfDxj0bg+POHuhv9Yp1AqT0dsh1g5A9vUBby45bVaiO9pa0z0m4Lg
 dAzgbg0zrskez8KbQHyYIuPPBUjltJRgl4S9IsjGjA==
X-Google-Smtp-Source: ACHHUZ53UUnBDGt3burXWM2lXDI82ZAx0hwaIRifm3o8nH/k6WE72BRYepS4sP+0HxhaOtZ6HVNEdA==
X-Received: by 2002:a1c:f706:0:b0:3f1:923e:e6bc with SMTP id
 v6-20020a1cf706000000b003f1923ee6bcmr13453116wmh.0.1683097839278; 
 Wed, 03 May 2023 00:10:39 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 55/57] tcg/aarch64: Support 128-bit load/store
Date: Wed,  3 May 2023 08:06:54 +0100
Message-Id: <20230503070656.1746170-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Use LDXP+STXP when LSE2 is not present and 16-byte atomicity is required,
and LDP/STP otherwise.  This requires allocating a second general-purpose
temporary, as Rs cannot overlap Rn in STXP.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target-con-set.h |   2 +
 tcg/aarch64/tcg-target.h         |   2 +-
 tcg/aarch64/tcg-target.c.inc     | 181 ++++++++++++++++++++++++++++++-
 3 files changed, 181 insertions(+), 4 deletions(-)

diff --git a/tcg/aarch64/tcg-target-con-set.h b/tcg/aarch64/tcg-target-con-set.h
index d6c6866878..74065c7098 100644
--- a/tcg/aarch64/tcg-target-con-set.h
+++ b/tcg/aarch64/tcg-target-con-set.h
@@ -14,6 +14,7 @@ C_O0_I2(lZ, l)
 C_O0_I2(r, rA)
 C_O0_I2(rZ, r)
 C_O0_I2(w, r)
+C_O0_I3(lZ, lZ, l)
 C_O1_I1(r, l)
 C_O1_I1(r, r)
 C_O1_I1(w, r)
@@ -33,4 +34,5 @@ C_O1_I2(w, w, wO)
 C_O1_I2(w, w, wZ)
 C_O1_I3(w, w, w, w)
 C_O1_I4(r, r, rA, rZ, rZ)
+C_O2_I1(r, r, l)
 C_O2_I4(r, r, rZ, rZ, rA, rMZ)
diff --git a/tcg/aarch64/tcg-target.h b/tcg/aarch64/tcg-target.h
index 74ee2ed255..fa6af9746f 100644
--- a/tcg/aarch64/tcg-target.h
+++ b/tcg/aarch64/tcg-target.h
@@ -129,7 +129,7 @@ extern bool have_lse2;
 #define TCG_TARGET_HAS_muluh_i64        1
 #define TCG_TARGET_HAS_mulsh_i64        1
 
-#define TCG_TARGET_HAS_qemu_ldst_i128   0
+#define TCG_TARGET_HAS_qemu_ldst_i128   1
 
 #define TCG_TARGET_HAS_v64              1
 #define TCG_TARGET_HAS_v128             1
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 76a6bfd202..f1627cb96d 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -81,6 +81,7 @@ bool have_lse;
 bool have_lse2;
 
 #define TCG_REG_TMP0 TCG_REG_X30
+#define TCG_REG_TMP1 TCG_REG_X17
 #define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
@@ -404,6 +405,10 @@ typedef enum {
     I3305_LDR_v64   = 0x5c000000,
     I3305_LDR_v128  = 0x9c000000,
 
+    /* Load/store exclusive. */
+    I3306_LDXP      = 0xc8600000,
+    I3306_STXP      = 0xc8200000,
+
     /* Load/store register.  Described here as 3.3.12, but the helper
        that emits them can transform to 3.3.10 or 3.3.13.  */
     I3312_STRB      = 0x38000000 | LDST_ST << 22 | MO_8 << 30,
@@ -468,6 +473,9 @@ typedef enum {
     I3406_ADR       = 0x10000000,
     I3406_ADRP      = 0x90000000,
 
+    /* Add/subtract extended register instructions. */
+    I3501_ADD       = 0x0b200000,
+
     /* Add/subtract shifted register instructions (without a shift).  */
     I3502_ADD       = 0x0b000000,
     I3502_ADDS      = 0x2b000000,
@@ -638,6 +646,12 @@ static void tcg_out_insn_3305(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (imm19 & 0x7ffff) << 5 | rt);
 }
 
+static void tcg_out_insn_3306(TCGContext *s, AArch64Insn insn, TCGReg rs,
+                              TCGReg rt, TCGReg rt2, TCGReg rn)
+{
+    tcg_out32(s, insn | rs << 16 | rt2 << 10 | rn << 5 | rt);
+}
+
 static void tcg_out_insn_3201(TCGContext *s, AArch64Insn insn, TCGType ext,
                               TCGReg rt, int imm19)
 {
@@ -720,6 +734,14 @@ static void tcg_out_insn_3406(TCGContext *s, AArch64Insn insn,
     tcg_out32(s, insn | (disp & 3) << 29 | (disp & 0x1ffffc) << (5 - 2) | rd);
 }
 
+static inline void tcg_out_insn_3501(TCGContext *s, AArch64Insn insn,
+                                     TCGType sf, TCGReg rd, TCGReg rn,
+                                     TCGReg rm, int opt, int imm3)
+{
+    tcg_out32(s, insn | sf << 31 | rm << 16 | opt << 13 |
+              imm3 << 10 | rn << 5 | rd);
+}
+
 /* This function is for both 3.5.2 (Add/Subtract shifted register), for
    the rare occasion when we actually want to supply a shift amount.  */
 static inline void tcg_out_insn_3502S(TCGContext *s, AArch64Insn insn,
@@ -1648,17 +1670,17 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     TCGType addr_type = TARGET_LONG_BITS == 64 ? TCG_TYPE_I64 : TCG_TYPE_I32;
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    MemOp atom_u;
+    MemOp atom_u, s_bits;
     unsigned a_mask;
 
+    s_bits = opc & MO_SIZE;
     h->align = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
                                       have_lse2 ? MO_ATOM_WITHIN16
                                                 : MO_ATOM_IFALIGN,
-                                      false);
+                                      s_bits == MO_128);
     a_mask = (1 << h->align) - 1;
 
 #ifdef CONFIG_SOFTMMU
-    unsigned s_bits = opc & MO_SIZE;
     unsigned s_mask = (1u << s_bits) - 1;
     unsigned mem_index = get_mmuidx(oi);
     TCGReg x3;
@@ -1839,6 +1861,148 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
     }
 }
 
+static TCGLabelQemuLdst *
+prepare_host_addr_base_only(TCGContext *s, HostAddress *h, TCGReg addr_reg,
+                            MemOpIdx oi, bool is_ld)
+{
+    TCGLabelQemuLdst *ldst;
+
+    ldst = prepare_host_addr(s, h, addr_reg, oi, true);
+
+    /* Compose the final address, as LDP/STP have no indexing. */
+    if (h->index != TCG_REG_XZR) {
+        tcg_out_insn(s, 3501, ADD, TCG_TYPE_I64, TCG_REG_TMP0,
+                     h->base, h->index,
+                     h->index_ext == TCG_TYPE_I32 ? MO_32 : MO_64, 0);
+        h->base = TCG_REG_TMP0;
+        h->index = TCG_REG_XZR;
+        h->index_ext = TCG_TYPE_I64;
+    }
+
+    return ldst;
+}
+
+static void tcg_out_qemu_ld128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+
+    ldst = prepare_host_addr_base_only(s, &h, addr_reg, oi, true);
+
+    if (h.atom < MO_128 || have_lse2) {
+        tcg_out_insn(s, 3314, LDP, datalo, datahi, h.base, 0, 0, 0);
+    } else {
+        TCGLabel *l0, *l1 = NULL;
+
+        /*
+         * 16-byte atomicity without LSE2 requires LDXP+STXP loop:
+         * 1: ldxp lo,hi,[addr]
+         *    stxp tmp1,lo,hi,[addr]
+         *    cbnz tmp1, 1b
+         *
+         * If we have already checked for 16-byte alignment, that's all
+         * we need. Otherwise we have determined that misaligned atomicity
+         * may be handled with two 8-byte loads.
+         */
+        if (h.align < MO_128) {
+            /*
+             * TODO: align should be MO_64, so we only need test bit 3,
+             * which means we could use TBNZ instead of AND+CBNE.
+             */
+            l1 = gen_new_label();
+            tcg_out_logicali(s, I3404_ANDI, 0, TCG_REG_TMP1, addr_reg, 15);
+            tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE,
+                           TCG_REG_TMP1, 0, 1, l1);
+        }
+
+        l0 = gen_new_label();
+        tcg_out_label(s, l0);
+
+        tcg_out_insn(s, 3306, LDXP, TCG_REG_XZR, datalo, datahi, h.base);
+        tcg_out_insn(s, 3306, STXP, TCG_REG_TMP1, datalo, datahi, h.base);
+        tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE, TCG_REG_TMP1, 0, 1, l0);
+
+        if (l1) {
+            TCGLabel *l2 = gen_new_label();
+            tcg_out_goto_label(s, l2);
+
+            tcg_out_label(s, l1);
+            tcg_out_insn(s, 3314, LDP, datalo, datahi, h.base, 0, 0, 0);
+
+            tcg_out_label(s, l2);
+        }
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
+static void tcg_out_qemu_st128(TCGContext *s, TCGReg datalo, TCGReg datahi,
+                               TCGReg addr_reg, MemOpIdx oi)
+{
+    TCGLabelQemuLdst *ldst;
+    HostAddress h;
+
+    ldst = prepare_host_addr_base_only(s, &h, addr_reg, oi, false);
+
+    if (h.atom < MO_128 || have_lse2) {
+        tcg_out_insn(s, 3314, STP, datalo, datahi, h.base, 0, 0, 0);
+    } else {
+        TCGLabel *l0, *l1 = NULL;
+
+        /*
+         * 16-byte atomicity without LSE2 requires LDXP+STXP loop:
+         * 1: ldxp xzr,tmp1,[addr]
+         *    stxp tmp1,lo,hi,[addr]
+         *    cbnz tmp1, 1b
+         *
+         * If we have already checked for 16-byte alignment, that's all
+         * we need. Otherwise we have determined that misaligned atomicity
+         * may be handled with two 8-byte stores.
+         */
+        if (h.align < MO_128) {
+            /*
+             * TODO: align should be MO_64, so we only need test bit 3,
+             * which means we could use TBNZ instead of AND+CBNE.
+             */
+            l1 = gen_new_label();
+            tcg_out_logicali(s, I3404_ANDI, 0, TCG_REG_TMP1, addr_reg, 15);
+            tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE,
+                           TCG_REG_TMP1, 0, 1, l1);
+        }
+
+        l0 = gen_new_label();
+        tcg_out_label(s, l0);
+
+        tcg_out_insn(s, 3306, LDXP, TCG_REG_XZR,
+                     TCG_REG_XZR, TCG_REG_TMP1, h.base);
+        tcg_out_insn(s, 3306, STXP, TCG_REG_TMP1, datalo, datahi, h.base);
+        tcg_out_brcond(s, TCG_TYPE_I32, TCG_COND_NE, TCG_REG_TMP1, 0, 1, l0);
+
+        if (l1) {
+            TCGLabel *l2 = gen_new_label();
+            tcg_out_goto_label(s, l2);
+
+            tcg_out_label(s, l1);
+            tcg_out_insn(s, 3314, STP, datalo, datahi, h.base, 0, 0, 0);
+
+            tcg_out_label(s, l2);
+        }
+    }
+
+    if (ldst) {
+        ldst->type = TCG_TYPE_I128;
+        ldst->datalo_reg = datalo;
+        ldst->datahi_reg = datahi;
+        ldst->raddr = tcg_splitwx_to_rx(s->code_ptr);
+    }
+}
+
 static const tcg_insn_unit *tb_ret_addr;
 
 static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
@@ -2176,6 +2340,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_qemu_st_i64:
         tcg_out_qemu_st(s, REG0(0), a1, a2, ext);
         break;
+    case INDEX_op_qemu_ld_i128:
+        tcg_out_qemu_ld128(s, a0, a1, a2, args[3]);
+        break;
+    case INDEX_op_qemu_st_i128:
+        tcg_out_qemu_st128(s, REG0(0), REG0(1), a2, args[3]);
+        break;
 
     case INDEX_op_bswap64_i64:
         tcg_out_rev(s, TCG_TYPE_I64, MO_64, a0, a1);
@@ -2813,9 +2983,13 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_qemu_ld_i32:
     case INDEX_op_qemu_ld_i64:
         return C_O1_I1(r, l);
+    case INDEX_op_qemu_ld_i128:
+        return C_O2_I1(r, r, l);
     case INDEX_op_qemu_st_i32:
     case INDEX_op_qemu_st_i64:
         return C_O0_I2(lZ, l);
+    case INDEX_op_qemu_st_i128:
+        return C_O0_I3(lZ, lZ, l);
 
     case INDEX_op_deposit_i32:
     case INDEX_op_deposit_i64:
@@ -2944,6 +3118,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_FP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_X18); /* platform register */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP0);
 }
 
-- 
2.34.1


