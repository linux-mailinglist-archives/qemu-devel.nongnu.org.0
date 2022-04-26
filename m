Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CF50FE4B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:07:14 +0200 (CEST)
Received: from localhost ([::1]:36302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKuP-0004Rf-7g
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeY-0004Ay-Ab; Tue, 26 Apr 2022 08:50:50 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeW-00005X-7T; Tue, 26 Apr 2022 08:50:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E74C180009B;
 Tue, 26 Apr 2022 09:50:36 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 2/7] target/ppc: Implemented xvi*ger* instructions
Date: Tue, 26 Apr 2022 09:50:23 -0300
Message-Id: <20220426125028.18844-3-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:37.0240 (UTC)
 FILETIME=[3A086B80:01D8596C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
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
---
 target/ppc/cpu.h                    |  5 ++
 target/ppc/helper.h                 |  3 +
 target/ppc/insn32.decode            | 15 +++++
 target/ppc/int_helper.c             | 85 +++++++++++++++++++++++++++++
 target/ppc/internal.h               | 28 ++++++++++
 target/ppc/translate/vsx-impl.c.inc | 50 +++++++++++++++++
 6 files changed, 186 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c2b6c987c0..ee55c6cfa2 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2688,6 +2688,11 @@ static inline uint64_t *cpu_vsrl_ptr(CPUPPCState *env, int i)
     return (uint64_t *)((uintptr_t)env + vsr64_offset(i, false));
 }
 
+static inline ppc_vsr_t *cpu_vsr_ptr(CPUPPCState *env, int i)
+{
+    return (ppc_vsr_t *)((uintptr_t)env + vsr_full_offset(i));
+}
+
 static inline long avr64_offset(int i, bool high)
 {
     return vsr64_offset(i + 32, high);
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index aa6773c4a5..06553517de 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -537,6 +537,9 @@ DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVH, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVW, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_5(XXBLENDVD, void, vsr, vsr, vsr, vsr, i32)
+DEF_HELPER_6(XVI4GER8, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVI8GER4, void, env, i32, i32, i32, i32, i32)
+DEF_HELPER_6(XVI16GER2, void, env, i32, i32, i32, i32, i32)
 
 DEF_HELPER_2(efscfsi, i32, env, i32)
 DEF_HELPER_2(efscfui, i32, env, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7a76bedfa6..653f50db93 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -170,6 +170,9 @@
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
+%xx_at          23:3 !function=times_4
+@XX3_at         ...... ... .. ..... ..... ........ ...          &XX3 xt=%xx_at xb=%xx_xb
+
 &XX3_dm         xt xa xb dm
 @XX3_dm         ...... ..... ..... ..... . dm:2 ..... ...       &XX3_dm xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
@@ -719,3 +722,15 @@ RFEBB           010011-------------- .   0010010010 -   @XL_s
 XXMFACC         011111 ... -- 00000 ----- 0010110001 -   @X_a
 XXMTACC         011111 ... -- 00001 ----- 0010110001 -   @X_a
 XXSETACCZ       011111 ... -- 00011 ----- 0010110001 -   @X_a
+
+## Vector GER instruction
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
index 8c1674510b..bd2f1a7c2a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -782,6 +782,91 @@ VCT(uxs, cvtsduw, u32)
 VCT(sxs, cvtsdsw, s32)
 #undef VCT
 
+/*
+ * Packed VSX Integer GER Flags
+ * 00 - no accumulation no saturation
+ * 01 - accumulate but no saturation
+ * 10 - no accumulation but with saturation
+ * 11 - accumulate with saturation
+ */
+static inline bool get_sat(uint32_t flags)
+{
+    return flags & 0x2;
+}
+
+static inline bool get_acc(uint32_t flags)
+{
+    return flags & 0x1;
+}
+
+#define GET_VsrN(a, i) (extract32(a->VsrB((i) / 2), (i) % 2 ? 4 : 0, 4))
+#define GET_VsrB(a, i) a->VsrB(i)
+#define GET_VsrH(a, i) a->VsrH(i)
+
+#define GET_VsrSN(a, i) (sextract32(a->VsrSB((i) / 2), (i) % 2 ? 4 : 0, 4))
+#define GET_VsrSB(a, i) a->VsrSB(i)
+#define GET_VsrSH(a, i) a->VsrSH(i)
+
+#define XVIGER(NAME, RANK, EL)                                                 \
+    void NAME(CPUPPCState *env, uint32_t a_r, uint32_t b_r,                    \
+              uint32_t  at_r, uint32_t mask, uint32_t packed_flags)            \
+    {                                                                          \
+        ppc_vsr_t *a = cpu_vsr_ptr(env, a_r), *b = cpu_vsr_ptr(env, b_r), *at; \
+        bool sat = get_sat(packed_flags), acc = get_acc(packed_flags);         \
+        uint8_t pmsk = ger_get_pmsk(mask), xmsk = ger_get_xmsk(mask),          \
+                ymsk = ger_get_ymsk(mask);                                     \
+        uint8_t pmsk_bit, xmsk_bit, ymsk_bit;                                  \
+        int64_t psum;                                                          \
+        int32_t va, vb;                                                        \
+        int i, j, k;                                                           \
+        for (i = 0, xmsk_bit = 1 << 3; i < 4; i++, xmsk_bit >>= 1) {           \
+            at = cpu_vsr_ptr(env, at_r + i);                                   \
+            for (j = 0, ymsk_bit = 1 << 3; j < 4; j++, ymsk_bit >>= 1) {       \
+                if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {                  \
+                    psum = 0;                                                  \
+                    for (k = 0, pmsk_bit = 1 << (RANK - 1); k < RANK;          \
+                         k++, pmsk_bit >>= 1) {                                \
+                        if (pmsk_bit & pmsk) {                                 \
+                            va = (int32_t)GET_VsrS##EL(a, RANK * i + k);       \
+                            vb = (int32_t) ((RANK == 4) ?                      \
+                                                GET_Vsr##EL(b, RANK * j + k) : \
+                                                GET_VsrS##EL(b, RANK * j + k));\
+                            psum += va * vb;                                   \
+                        }                                                      \
+                    }                                                          \
+                    if (acc) {                                                 \
+                        psum += at->VsrSW(j);                                  \
+                    }                                                          \
+                    if (sat && psum > INT32_MAX) {                             \
+                        set_vscr_sat(env);                                     \
+                        at->VsrSW(j) = INT32_MAX;                              \
+                    } else if (sat && psum < INT32_MIN) {                      \
+                        set_vscr_sat(env);                                     \
+                        at->VsrSW(j) = INT32_MIN;                              \
+                    } else {                                                   \
+                        at->VsrSW(j) = (int32_t) psum;                         \
+                    }                                                          \
+                } else {                                                       \
+                    at->VsrSW(j) = 0;                                          \
+                }                                                              \
+            }                                                                  \
+        }                                                                      \
+    }
+
+XVIGER(helper_XVI4GER8, 8, N)
+XVIGER(helper_XVI8GER4, 4, B)
+XVIGER(helper_XVI16GER2, 2, H)
+
+#undef GER_MULT
+#undef XVIGER_NAME
+#undef XVIGER
+#undef GET_VsrN
+#undef GET_VsrB
+#undef GET_VsrH
+#undef GET_VsrSN
+#undef GET_VsrSB
+#undef GET_VsrSH
+
 target_ulong helper_vclzlsbb(ppc_avr_t *r)
 {
     target_ulong count = 0;
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 8094e0b033..a994d98238 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -291,4 +291,32 @@ G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                             uintptr_t retaddr);
 #endif
 
+/*
+ * Auxiliary functions to pack/unpack masks for GER instructions.
+ *
+ * Packed format:
+ *  Bits 0-3: xmsk
+ *  Bits 4-7: ymsk
+ *  Bits 8-15: pmsk
+ */
+static inline uint8_t ger_get_xmsk(uint32_t packed_masks)
+{
+    return packed_masks & 0xF;
+}
+
+static inline uint8_t ger_get_ymsk(uint32_t packed_masks)
+{
+    return (packed_masks >> 4) & 0xF;
+}
+
+static inline uint8_t ger_get_pmsk(uint32_t packed_masks)
+{
+    return (packed_masks >> 8) & 0xFF;
+}
+
+static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
+{
+    return (pmsk & 0xFF) << 8 | (ymsk & 0xF) << 4 | (xmsk & 0xF);
+}
+
 #endif /* PPC_INTERNAL_H */
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 919b889c40..1eb68c7081 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2823,6 +2823,56 @@ static bool trans_XXSETACCZ(DisasContext *ctx, arg_X_a *a)
     return true;
 }
 
+/*
+ * Packed VSX Integer GER Flags
+ * 00 - no accumulation no saturation
+ * 01 - accumulate but no saturation
+ * 10 - no accumulation but with saturation
+ * 11 - accumulate with saturation
+ */
+static uint32_t pack_flags_xvi(int acc, int sat)
+{
+    return (sat << 1) | acc;
+}
+
+static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a, uint32_t op,
+                             void (*helper)(TCGv_env, TCGv_i32, TCGv_i32,
+                                            TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    uint32_t mask;
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    if (unlikely((a->xa / 4 == a->xt / 4) || (a->xb / 4 == a->xt / 4))) {
+        gen_invalid(ctx);
+        return true;
+    }
+
+    mask = 0xFFFFFFFF;
+    helper(cpu_env, tcg_constant_i32(a->xa), tcg_constant_i32(a->xb),
+           tcg_constant_i32(a->xt), tcg_constant_i32(mask),
+           tcg_constant_i32(op));
+    return true;
+}
+
+/* Used to keep line length < 80 */
+#define GER_NOP pack_flags_xvi(0, 0)
+#define GER_PP  pack_flags_xvi(1, 0)
+#define GER_SAT pack_flags_xvi(0, 1)
+#define GER_SPP pack_flags_xvi(1, 1)
+TRANS(XVI4GER8, do_ger_XX3, GER_NOP, gen_helper_XVI4GER8)
+TRANS(XVI4GER8PP, do_ger_XX3, GER_PP, gen_helper_XVI4GER8)
+TRANS(XVI8GER4, do_ger_XX3, GER_NOP, gen_helper_XVI8GER4)
+TRANS(XVI8GER4PP, do_ger_XX3, GER_PP, gen_helper_XVI8GER4)
+TRANS(XVI8GER4SPP, do_ger_XX3, GER_SPP, gen_helper_XVI8GER4)
+TRANS(XVI16GER2, do_ger_XX3, GER_NOP, gen_helper_XVI16GER2)
+TRANS(XVI16GER2PP, do_ger_XX3, GER_PP, gen_helper_XVI16GER2)
+TRANS(XVI16GER2S, do_ger_XX3, GER_SAT, gen_helper_XVI16GER2)
+TRANS(XVI16GER2SPP, do_ger_XX3, GER_SPP, gen_helper_XVI16GER2)
+#undef GER_NOP
+#undef GER_PP
+#undef GER_SAT
+#undef GER_SPP
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


