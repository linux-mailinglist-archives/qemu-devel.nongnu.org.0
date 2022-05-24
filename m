Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBA8532C06
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 16:12:18 +0200 (CEST)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntVGi-0007Dd-Tb
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 10:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntVAq-0003Gu-RK; Tue, 24 May 2022 10:06:13 -0400
Received: from [187.72.171.209] (port=60107 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1ntVAd-0004xw-Th; Tue, 24 May 2022 10:06:12 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 24 May 2022 11:05:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C3DC48002AF;
 Tue, 24 May 2022 11:05:40 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v6 2/8] target/ppc: Implemented xvi*ger* instructions
Date: Tue, 24 May 2022 11:05:31 -0300
Message-Id: <20220524140537.27451-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
References: <20220524140537.27451-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 May 2022 14:05:41.0038 (UTC)
 FILETIME=[5A1274E0:01D86F77]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xvi4ger8:     VSX Vector 8-bit Signed/Unsigned Integer GER (rank-4 update)
xvi4ger8pp:   VSX Vector 8-bit Signed/Unsigned Integer GER (rank-4 update)
Positive multiply, Positive accumulate
xvi8ger4:     VSX Vector 4-bit Signed Integer GER (rank-8 update)
xvi8ger4pp:   VSX Vector 4-bit Signed Integer GER (rank-8 update)
Positive multiply, Positive accumulate
xvi8ger4spp:  VSX Vector 8-bit Signed/Unsigned Integer GER (rank-4 update)
with Saturate Positive multiply, Positive accumulate
xvi16ger2:    VSX Vector 16-bit Signed Integer GER (rank-2 update)
xvi16ger2pp:  VSX Vector 16-bit Signed Integer GER (rank-2 update)
Positive multiply, Positive accumulate
xvi16ger2s:   VSX Vector 16-bit Signed Integer GER (rank-2 update)
with Saturation
xvi16ger2spp: VSX Vector 16-bit Signed Integer GER (rank-2 update)
with Saturation Positive multiply, Positive accumulate

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h                    |   1 +
 target/ppc/helper.h                 |  13 +++
 target/ppc/insn32.decode            |  18 ++++
 target/ppc/int_helper.c             | 130 ++++++++++++++++++++++++++++
 target/ppc/internal.h               |  15 ++++
 target/ppc/translate/vsx-impl.c.inc |  41 +++++++++
 6 files changed, 218 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c865206827..dff3ca8222 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -238,6 +238,7 @@ typedef union _ppc_vsr_t {
 
 typedef ppc_vsr_t ppc_avr_t;
 typedef ppc_vsr_t ppc_fprp_t;
+typedef ppc_vsr_t ppc_acc_t;
 
 #if !defined(CONFIG_USER_ONLY)
 /* Software TLB cache */
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5e43920b9e..1666797edf 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -133,6 +133,10 @@ DEF_HELPER_FLAGS_1(ftsqrt, TCG_CALL_NO_RWG_SE, i32, i64)
 #define dh_ctype_vsr ppc_vsr_t *
 #define dh_typecode_vsr dh_typecode_ptr
 
+#define dh_alias_acc ptr
+#define dh_ctype_acc ppc_acc_t *
+#define dh_typecode_acc dh_typecode_ptr
+
 DEF_HELPER_FLAGS_3(vavgub, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vavguh, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vavguw, TCG_CALL_NO_RWG, void, avr, avr, avr)
@@ -537,6 +541,15 @@ DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVH, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVW, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVD, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_5(XVI4GER8, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI4GER8PP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI8GER4, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI8GER4PP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI8GER4SPP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI16GER2, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI16GER2S, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI16GER2PP, void, env, vsr, vsr, acc, i32)
+DEF_HELPER_5(XVI16GER2SPP, void, env, vsr, vsr, acc, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c0f545ca38..0e189fe2da 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -175,6 +175,12 @@
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
+# 32 bit GER instructions have all mask bits considered 1
+&MMIRR_XX3      xa xb xt pmsk xmsk ymsk
+%xx_at          23:3
+@XX3_at         ...... ... .. ..... ..... ........ ...          &MMIRR_XX3 xt=%xx_at xb=%xx_xb \
+                                                                pmsk=255 xmsk=15 ymsk=15
+
 &XX3_dm         xt xa xb dm
 @XX3_dm         ...... ..... ..... ..... . dm:2 ..... ...       &XX3_dm xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
@@ -743,3 +749,15 @@ RFEBB           010011-------------- .   0010010010 -   @XL_s
 XXMFACC         011111 ... -- 00000 ----- 0010110001 -   @X_a
 XXMTACC         011111 ... -- 00001 ----- 0010110001 -   @X_a
 XXSETACCZ       011111 ... -- 00011 ----- 0010110001 -   @X_a
+
+## VSX GER instruction
+
+XVI4GER8        111011 ... -- ..... ..... 00100011 ..-  @XX3_at xa=%xx_xa
+XVI4GER8PP      111011 ... -- ..... ..... 00100010 ..-  @XX3_at xa=%xx_xa
+XVI8GER4        111011 ... -- ..... ..... 00000011 ..-  @XX3_at xa=%xx_xa
+XVI8GER4PP      111011 ... -- ..... ..... 00000010 ..-  @XX3_at xa=%xx_xa
+XVI16GER2       111011 ... -- ..... ..... 01001011 ..-  @XX3_at xa=%xx_xa
+XVI16GER2PP     111011 ... -- ..... ..... 01101011 ..-  @XX3_at xa=%xx_xa
+XVI8GER4SPP     111011 ... -- ..... ..... 01100011 ..-  @XX3_at xa=%xx_xa
+XVI16GER2S      111011 ... -- ..... ..... 00101011 ..-  @XX3_at xa=%xx_xa
+XVI16GER2SPP    111011 ... -- ..... ..... 00101010 ..-  @XX3_at xa=%xx_xa
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index b9dd15d607..105b626d1b 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -782,6 +782,136 @@ VCT(uxs, cvtsduw, u32)
 VCT(sxs, cvtsdsw, s32)
 #undef VCT
 
+typedef int64_t do_ger(uint32_t, uint32_t, uint32_t);
+
+static int64_t ger_rank8(uint32_t a, uint32_t b, uint32_t mask)
+{
+    int64_t psum = 0;
+    for (int i = 0; i < 8; i++, mask >>= 1) {
+        if (mask & 1) {
+            psum += sextract32(a, 4 * i, 4) * sextract32(b, 4 * i, 4);
+        }
+    }
+    return psum;
+}
+
+static int64_t ger_rank4(uint32_t a, uint32_t b, uint32_t mask)
+{
+    int64_t psum = 0;
+    for (int i = 0; i < 4; i++, mask >>= 1) {
+        if (mask & 1) {
+            psum += sextract32(a, 8 * i, 8) * (int64_t)extract32(b, 8 * i, 8);
+        }
+    }
+    return psum;
+}
+
+static int64_t ger_rank2(uint32_t a, uint32_t b, uint32_t mask)
+{
+    int64_t psum = 0;
+    for (int i = 0; i < 2; i++, mask >>= 1) {
+        if (mask & 1) {
+            psum += sextract32(a, 16 * i, 16) * sextract32(b, 16 * i, 16);
+        }
+    }
+    return psum;
+}
+
+static void xviger(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b, ppc_acc_t  *at,
+                   uint32_t mask, bool sat, bool acc, do_ger ger)
+{
+    uint8_t pmsk = FIELD_EX32(mask, GER_MSK, PMSK),
+            xmsk = FIELD_EX32(mask, GER_MSK, XMSK),
+            ymsk = FIELD_EX32(mask, GER_MSK, YMSK);
+    uint8_t xmsk_bit, ymsk_bit;
+    int64_t psum;
+    int i, j;
+    for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {
+        for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {
+            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
+                psum = ger(a->VsrW(i), b->VsrW(j), pmsk);
+                if (acc) {
+                    psum += at[i].VsrSW(j);
+                }
+                if (sat && psum > INT32_MAX) {
+                    set_vscr_sat(env);
+                    at[i].VsrSW(j) = INT32_MAX;
+                } else if (sat && psum < INT32_MIN) {
+                    set_vscr_sat(env);
+                    at[i].VsrSW(j) = INT32_MIN;
+                } else {
+                    at[i].VsrSW(j) = (int32_t) psum;
+                }
+            } else {
+                at[i].VsrSW(j) = 0;
+            }
+        }
+    }
+}
+
+QEMU_FLATTEN
+void helper_XVI4GER8(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, false, ger_rank8);
+}
+
+QEMU_FLATTEN
+void helper_XVI4GER8PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, true, ger_rank8);
+}
+
+QEMU_FLATTEN
+void helper_XVI8GER4(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                     ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, false, ger_rank4);
+}
+
+QEMU_FLATTEN
+void helper_XVI8GER4PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, true, ger_rank4);
+}
+
+QEMU_FLATTEN
+void helper_XVI8GER4SPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, true, true, ger_rank4);
+}
+
+QEMU_FLATTEN
+void helper_XVI16GER2(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                      ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, false, ger_rank2);
+}
+
+QEMU_FLATTEN
+void helper_XVI16GER2S(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                       ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, true, false, ger_rank2);
+}
+
+QEMU_FLATTEN
+void helper_XVI16GER2PP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                        ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, false, true, ger_rank2);
+}
+
+QEMU_FLATTEN
+void helper_XVI16GER2SPP(CPUPPCState *env, ppc_vsr_t *a, ppc_vsr_t *b,
+                         ppc_acc_t *at, uint32_t mask)
+{
+    xviger(env, a, b, at, mask, true, true, ger_rank2);
+}
+
 target_ulong helper_vclzlsbb(ppc_avr_t *r)
 {
     target_ulong count = 0;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 8094e0b033..2add128cd1 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -18,6 +18,8 @@
 #ifndef PPC_INTERNAL_H
 #define PPC_INTERNAL_H
 
+#include "hw/registerfields.h"
+
 #define FUNC_MASK(name, ret_type, size, max_val)                  \
 static inline ret_type name(uint##size##_t start,                 \
                               uint##size##_t end)                 \
@@ -291,4 +293,17 @@ G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                             uintptr_t retaddr);
 #endif
 
+FIELD(GER_MSK, XMSK, 0, 4)
+FIELD(GER_MSK, YMSK, 4, 4)
+FIELD(GER_MSK, PMSK, 8, 8)
+
+static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
+{
+    int msk = 0;
+    msk = FIELD_DP32(msk, GER_MSK, XMSK, xmsk);
+    msk = FIELD_DP32(msk, GER_MSK, YMSK, ymsk);
+    msk = FIELD_DP32(msk, GER_MSK, PMSK, pmsk);
+    return msk;
+}
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 235be360e2..6026b203e0 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -17,6 +17,13 @@ static inline TCGv_ptr gen_vsr_ptr(int reg)
     return r;
 }
 
+static inline TCGv_ptr gen_acc_ptr(int reg)
+{
+    TCGv_ptr r = tcg_temp_new_ptr();
+    tcg_gen_addi_ptr(r, cpu_env, acc_full_offset(reg));
+    return r;
+}
+
 #define VSX_LOAD_SCALAR(name, operation)                      \
 static void gen_##name(DisasContext *ctx)                     \
 {                                                             \
@@ -2847,6 +2854,40 @@ static bool trans_XXSETACCZ(DisasContext *ctx, arg_X_a *a)
     return true;
 }
 
+static bool do_ger(DisasContext *ctx, arg_MMIRR_XX3 *a,
+    void (*helper)(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32))
+{
+    uint32_t mask;
+    TCGv_ptr xt, xa, xb;
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    if (unlikely((a->xa / 4 == a->xt) || (a->xb / 4 == a->xt))) {
+        gen_invalid(ctx);
+        return true;
+    }
+
+    xt = gen_acc_ptr(a->xt);
+    xa = gen_vsr_ptr(a->xa);
+    xb = gen_vsr_ptr(a->xb);
+
+    mask = ger_pack_masks(a->pmsk, a->ymsk, a->xmsk);
+    helper(cpu_env, xa, xb, xt, tcg_constant_i32(mask));
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+    return true;
+}
+
+TRANS(XVI4GER8, do_ger, gen_helper_XVI4GER8)
+TRANS(XVI4GER8PP, do_ger,  gen_helper_XVI4GER8PP)
+TRANS(XVI8GER4, do_ger, gen_helper_XVI8GER4)
+TRANS(XVI8GER4PP, do_ger,  gen_helper_XVI8GER4PP)
+TRANS(XVI8GER4SPP, do_ger, gen_helper_XVI8GER4SPP)
+TRANS(XVI16GER2, do_ger, gen_helper_XVI16GER2)
+TRANS(XVI16GER2PP, do_ger, gen_helper_XVI16GER2PP)
+TRANS(XVI16GER2S, do_ger, gen_helper_XVI16GER2S)
+TRANS(XVI16GER2SPP, do_ger, gen_helper_XVI16GER2SPP)
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


