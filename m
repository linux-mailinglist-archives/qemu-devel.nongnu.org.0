Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB95B4C5169
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:18:17 +0100 (CET)
Received: from localhost ([::1]:50096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNium-0007c7-Ql
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:18:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhw7-0007El-Si; Fri, 25 Feb 2022 16:15:36 -0500
Received: from [187.72.171.209] (port=1210 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhw3-0004HA-KZ; Fri, 25 Feb 2022 16:15:35 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:57 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E05528001D1;
 Fri, 25 Feb 2022 18:09:56 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 34/49] target/ppc: Implement xxeval
Date: Fri, 25 Feb 2022 18:09:21 -0300
Message-Id: <20220225210936.1749575-35-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:57.0326 (UTC)
 FILETIME=[0AD9BEE0:01D82A8C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v5:
 - Some equivalent functions implemented with tcg_gen_gvec_*
---
 target/ppc/helper.h                 |   1 +
 target/ppc/insn64.decode            |   8 +
 target/ppc/int_helper.c             |  42 ++++++
 target/ppc/translate/vsx-impl.c.inc | 220 ++++++++++++++++++++++++++++
 4 files changed, 271 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 06fac7e082..ef9655c7cd 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -496,6 +496,7 @@ DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
+DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 0963e064b1..fdb859f62d 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -54,6 +54,11 @@
                 ...... ..... ..... ..... ..... .. .... \
                 &8RR_XX4 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
+&8RR_XX4_imm    xt xa xb xc imm
+@8RR_XX4_imm    ........ ........ ........ imm:8 \
+                ...... ..... ..... ..... ..... .. .... \
+                &8RR_XX4_imm xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
+
 &8RR_XX4_uim3   xt xa xb xc uim3
 @8RR_XX4_uim3   ...... .. .... .. ............... uim3:3 \
                 ...... ..... ..... ..... ..... .. ....   \
@@ -184,6 +189,9 @@ PLXVP           000001 00 0--.-- .................. \
 PSTXVP          000001 00 0--.-- .................. \
                 111110 ..... ..... ................     @8LS_D_TSXP
 
+XXEVAL          000001 01 0000 -- ---------- ........ \
+                100010 ..... ..... ..... ..... 01 ....  @8RR_XX4_imm
+
 XXSPLTIDP       000001 01 0000 -- -- ................ \
                 100000 ..... 0010 . ................    @8RR_D
 XXSPLTIW        000001 01 0000 -- -- ................ \
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index d9bfdc290f..ca59cd3d79 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -28,6 +28,7 @@
 #include "fpu/softfloat.h"
 #include "qapi/error.h"
 #include "qemu/guest-random.h"
+#include "tcg/tcg-gvec-desc.h"
 
 #include "helper_regs.h"
 /*****************************************************************************/
@@ -1572,6 +1573,47 @@ void helper_xxinsertw(CPUPPCState *env, ppc_vsr_t *xt,
     *xt = t;
 }
 
+void helper_XXEVAL(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c,
+                   uint32_t desc)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit, imm = simd_data(desc);
+    Int128 conj, disj = int128_zero();
+
+    /* Iterate over set bits from the least to the most significant bit */
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the result of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit = 7 - ctzl(imm);
+        if (bit & 0x4) {
+            conj = a->s128;
+        } else {
+            conj = int128_not(a->s128);
+        }
+        if (bit & 0x2) {
+            conj = int128_and(conj, b->s128);
+        } else {
+            conj = int128_and(conj, int128_not(b->s128));
+        }
+        if (bit & 0x1) {
+            conj = int128_and(conj, c->s128);
+        } else {
+            conj = int128_and(conj, int128_not(c->s128));
+        }
+        disj = int128_or(disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &= imm - 1;
+    }
+
+    t->s128 = disj;
+}
+
 #define XXBLEND(name, sz) \
 void glue(helper_XXBLENDV, name)(ppc_avr_t *t, ppc_avr_t *a, ppc_avr_t *b,  \
                                  ppc_avr_t *c, uint32_t desc)               \
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 92851b8926..b5e07cf3df 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2167,6 +2167,226 @@ TRANS64_FLAGS2(ISA310, PLXV, do_lstxv_PLS_D, false, false)
 TRANS64_FLAGS2(ISA310, PSTXVP, do_lstxv_PLS_D, true, true)
 TRANS64_FLAGS2(ISA310, PLXVP, do_lstxv_PLS_D, false, true)
 
+static void gen_xxeval_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b, TCGv_i64 c,
+                           int64_t imm)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit;
+    TCGv_i64 conj, disj;
+
+    conj = tcg_temp_new_i64();
+    disj = tcg_const_i64(0);
+
+    /* Iterate over set bits from the least to the most significant bit */
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the result of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit = 7 - ctz64(imm);
+        if (bit & 0x4) {
+            tcg_gen_mov_i64(conj, a);
+        } else {
+            tcg_gen_not_i64(conj, a);
+        }
+        if (bit & 0x2) {
+            tcg_gen_and_i64(conj, conj, b);
+        } else {
+            tcg_gen_andc_i64(conj, conj, b);
+        }
+        if (bit & 0x1) {
+            tcg_gen_and_i64(conj, conj, c);
+        } else {
+            tcg_gen_andc_i64(conj, conj, c);
+        }
+        tcg_gen_or_i64(disj, disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &= imm - 1;
+    }
+
+    tcg_gen_mov_i64(t, disj);
+
+    tcg_temp_free_i64(conj);
+    tcg_temp_free_i64(disj);
+}
+
+static void gen_xxeval_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                           TCGv_vec c, int64_t imm)
+{
+    /*
+     * Instead of processing imm bit-by-bit, we'll skip the computation of
+     * conjunctions whose corresponding bit is unset.
+     */
+    int bit;
+    TCGv_vec disj, conj;
+
+    disj = tcg_const_zeros_vec_matching(t);
+    conj = tcg_temp_new_vec_matching(t);
+
+    /* Iterate over set bits from the least to the most significant bit */
+    while (imm) {
+        /*
+         * Get the next bit to be processed with ctz64. Invert the result of
+         * ctz64 to match the indexing used by PowerISA.
+         */
+        bit = 7 - ctz64(imm);
+        if (bit & 0x4) {
+            tcg_gen_mov_vec(conj, a);
+        } else {
+            tcg_gen_not_vec(vece, conj, a);
+        }
+        if (bit & 0x2) {
+            tcg_gen_and_vec(vece, conj, conj, b);
+        } else {
+            tcg_gen_andc_vec(vece, conj, conj, b);
+        }
+        if (bit & 0x1) {
+            tcg_gen_and_vec(vece, conj, conj, c);
+        } else {
+            tcg_gen_andc_vec(vece, conj, conj, c);
+        }
+        tcg_gen_or_vec(vece, disj, disj, conj);
+
+        /* Unset the least significant bit that is set */
+        imm &= imm - 1;
+    }
+
+    tcg_gen_mov_vec(t, disj);
+
+    tcg_temp_free_vec(disj);
+    tcg_temp_free_vec(conj);
+}
+
+static bool trans_XXEVAL(DisasContext *ctx, arg_8RR_XX4_imm *a)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_andc_vec, 0
+    };
+    static const GVecGen4i op = {
+        .fniv = gen_xxeval_vec,
+        .fno = gen_helper_XXEVAL,
+        .fni8 = gen_xxeval_i64,
+        .opt_opc = vecop_list,
+        .vece = MO_64
+    };
+    int xt = vsr_full_offset(a->xt), xa = vsr_full_offset(a->xa),
+        xb = vsr_full_offset(a->xb), xc = vsr_full_offset(a->xc);
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    /* Equivalent functions that can be implemented with a single gen_gvec */
+    switch (a->imm) {
+    case 0b00000000: /* true */
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+        break;
+    case 0b00000011: /* and(B,A) */
+        tcg_gen_gvec_and(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b00000101: /* and(C,A) */
+        tcg_gen_gvec_and(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b00001111: /* A */
+        tcg_gen_gvec_mov(MO_64, xt, xa, 16, 16);
+        break;
+    case 0b00010001: /* and(C,B) */
+        tcg_gen_gvec_and(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b00011011: /* C?B:A */
+        tcg_gen_gvec_bitsel(MO_64, xt, xc, xb, xa, 16, 16);
+        break;
+    case 0b00011101: /* B?C:A */
+        tcg_gen_gvec_bitsel(MO_64, xt, xb, xc, xa, 16, 16);
+        break;
+    case 0b00100111: /* C?A:B */
+        tcg_gen_gvec_bitsel(MO_64, xt, xc, xa, xb, 16, 16);
+        break;
+    case 0b00110011: /* B */
+        tcg_gen_gvec_mov(MO_64, xt, xb, 16, 16);
+        break;
+    case 0b00110101: /* A?C:B */
+        tcg_gen_gvec_bitsel(MO_64, xt, xa, xc, xb, 16, 16);
+        break;
+    case 0b00111100: /* xor(B,A) */
+        tcg_gen_gvec_xor(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b00111111: /* or(B,A) */
+        tcg_gen_gvec_or(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b01000111: /* B?A:C */
+        tcg_gen_gvec_bitsel(MO_64, xt, xb, xa, xc, 16, 16);
+        break;
+    case 0b01010011: /* A?B:C */
+        tcg_gen_gvec_bitsel(MO_64, xt, xa, xb, xc, 16, 16);
+        break;
+    case 0b01010101: /* C */
+        tcg_gen_gvec_mov(MO_64, xt, xc, 16, 16);
+        break;
+    case 0b01011010: /* xor(C,A) */
+        tcg_gen_gvec_xor(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b01011111: /* or(C,A) */
+        tcg_gen_gvec_or(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b01100110: /* xor(C,B) */
+        tcg_gen_gvec_xor(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b01110111: /* or(C,B) */
+        tcg_gen_gvec_or(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10001000: /* nor(C,B) */
+        tcg_gen_gvec_nor(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10011001: /* eqv(C,B) */
+        tcg_gen_gvec_eqv(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b10100000: /* nor(C,A) */
+        tcg_gen_gvec_nor(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b10100101: /* eqv(C,A) */
+        tcg_gen_gvec_eqv(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b10101010: /* not(C) */
+        tcg_gen_gvec_not(MO_64, xt, xc, 16, 16);
+        break;
+    case 0b11000000: /* nor(B,A) */
+        tcg_gen_gvec_nor(MO_64, xt,  xb, xa, 16, 16);
+        break;
+    case 0b11000011: /* eqv(B,A) */
+        tcg_gen_gvec_eqv(MO_64, xt,  xb, xa, 16, 16);
+        break;
+    case 0b11001100: /* not(B) */
+        tcg_gen_gvec_not(MO_64, xt, xb, 16, 16);
+        break;
+    case 0b11101110: /* nand(C,B) */
+        tcg_gen_gvec_nand(MO_64, xt, xc, xb, 16, 16);
+        break;
+    case 0b11110000: /* not(A) */
+        tcg_gen_gvec_not(MO_64, xt, xa, 16, 16);
+        break;
+    case 0b11111010: /* nand(C,A) */
+        tcg_gen_gvec_nand(MO_64, xt, xc, xa, 16, 16);
+        break;
+    case 0b11111100: /* nand(B,A) */
+        tcg_gen_gvec_nand(MO_64, xt, xb, xa, 16, 16);
+        break;
+    case 0b11111111: /* true */
+        set_cpu_vsr(a->xt, tcg_constant_i64(-1), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(-1), false);
+        break;
+    default:
+        /* Fallback to compute all conjunctions/disjunctions */
+        tcg_gen_gvec_4i(xt, xa, xb, xc, 16, 16, a->imm, &op);
+    }
+
+    return true;
+}
+
 static void gen_xxblendv_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
                              TCGv_vec c)
 {
-- 
2.25.1


