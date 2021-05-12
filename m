Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAA37D3F2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 21:48:53 +0200 (CEST)
Received: from localhost ([::1]:42780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lguqi-0003GC-3G
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 15:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6z-0002hq-A4; Wed, 12 May 2021 15:01:38 -0400
Received: from [201.28.113.2] (port=1436 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1lgu6x-0002Bm-3I; Wed, 12 May 2021 15:01:37 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 15:56:07 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id B92278000C2;
 Wed, 12 May 2021 15:56:06 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 24/31] target/ppc: Move D/DS/X-form integer loads to
 decodetree
Date: Wed, 12 May 2021 15:54:34 -0300
Message-Id: <20210512185441.3619828-25-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 May 2021 18:56:07.0094 (UTC)
 FILETIME=[7713D560:01D74760]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, luis.pires@eldorado.org.br,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These are all connected by macros in the legacy decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
- Common code of do_ldst_D and do_ldst_X moved to do_ldst;
- @D{,S} instead of @PLS_D{,S} for non-prefixed loads;
- do_ldst_PLS_D moved to the next patch.
---
 target/ppc/insn32.decode                   |  37 ++++++
 target/ppc/translate.c                     | 147 ++++-----------------
 target/ppc/translate/fixedpoint-impl.c.inc |  89 +++++++++++++
 3 files changed, 150 insertions(+), 123 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d93ae905a4..860b96d866 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -20,6 +20,43 @@
 &D              rt ra si:int64_t
 @D              ...... rt:5 ra:5 si:s16                 &D
 
+%ds_si          2:s14  !function=times_4
+@DS             ...... rt:5 ra:5 .............. ..      &D si=%ds_si
+
+&X              rt ra rb
+@X              ...... rt:5 ra:5 rb:5 .......... .      &X
+
+### Fixed-Point Load Instructions
+
+LBZ             100010 ..... ..... ................     @D
+LBZU            100011 ..... ..... ................     @D
+LBZX            011111 ..... ..... ..... 0001010111 -   @X
+LBZUX           011111 ..... ..... ..... 0001110111 -   @X
+
+LHZ             101000 ..... ..... ................     @D
+LHZU            101001 ..... ..... ................     @D
+LHZX            011111 ..... ..... ..... 0100010111 -   @X
+LHZUX           011111 ..... ..... ..... 0100110111 -   @X
+
+LHA             101010 ..... ..... ................     @D
+LHAU            101011 ..... ..... ................     @D
+LHAX            011111 ..... ..... ..... 0101010111 -   @X
+LHAXU           011111 ..... ..... ..... 0101110111 -   @X
+
+LWZ             100000 ..... ..... ................     @D
+LWZU            100001 ..... ..... ................     @D
+LWZX            011111 ..... ..... ..... 0000010111 -   @X
+LWZUX           011111 ..... ..... ..... 0000110111 -   @X
+
+LWA             111010 ..... ..... ..............10     @DS
+LWAX            011111 ..... ..... ..... 0101010101 -   @X
+LWAUX           011111 ..... ..... ..... 0101110101 -   @X
+
+LD              111010 ..... ..... ..............00     @DS
+LDU             111010 ..... ..... ..............01     @DS
+LDX             011111 ..... ..... ..... 0000010101 -   @X
+LDUX            011111 ..... ..... ..... 0000110101 -   @X
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            001110 ..... ..... ................     @D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 7f2ebcb442..32d217071b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3412,54 +3412,6 @@ GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
 GEN_QEMU_STORE_64(st64r, BSWAP_MEMOP(MO_Q))
 #endif
 
-#define GEN_LD(name, ldop, opc, type)                                         \
-static void glue(gen_, name)(DisasContext *ctx)                               \
-{                                                                             \
-    TCGv EA;                                                                  \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    gen_addr_imm_index(ctx, EA, 0);                                           \
-    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                       \
-    tcg_temp_free(EA);                                                        \
-}
-
-#define GEN_LDU(name, ldop, opc, type)                                        \
-static void glue(gen_, name##u)(DisasContext *ctx)                            \
-{                                                                             \
-    TCGv EA;                                                                  \
-    if (unlikely(rA(ctx->opcode) == 0 ||                                      \
-                 rA(ctx->opcode) == rD(ctx->opcode))) {                       \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    if (type == PPC_64B)                                                      \
-        gen_addr_imm_index(ctx, EA, 0x03);                                    \
-    else                                                                      \
-        gen_addr_imm_index(ctx, EA, 0);                                       \
-    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                       \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-}
-
-#define GEN_LDUX(name, ldop, opc2, opc3, type)                                \
-static void glue(gen_, name##ux)(DisasContext *ctx)                           \
-{                                                                             \
-    TCGv EA;                                                                  \
-    if (unlikely(rA(ctx->opcode) == 0 ||                                      \
-                 rA(ctx->opcode) == rD(ctx->opcode))) {                       \
-        gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);                   \
-        return;                                                               \
-    }                                                                         \
-    gen_set_access_type(ctx, ACCESS_INT);                                     \
-    EA = tcg_temp_new();                                                      \
-    gen_addr_reg_index(ctx, EA);                                              \
-    gen_qemu_##ldop(ctx, cpu_gpr[rD(ctx->opcode)], EA);                       \
-    tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);                             \
-    tcg_temp_free(EA);                                                        \
-}
-
 #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)                   \
 static void glue(gen_, name##x)(DisasContext *ctx)                            \
 {                                                                             \
@@ -3478,21 +3430,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
 #define GEN_LDX_HVRM(name, ldop, opc2, opc3, type)                            \
     GEN_LDX_E(name, ldop, opc2, opc3, type, PPC_NONE, CHK_HVRM)
 
-#define GEN_LDS(name, ldop, op, type)                                         \
-GEN_LD(name, ldop, op | 0x20, type);                                          \
-GEN_LDU(name, ldop, op | 0x21, type);                                         \
-GEN_LDUX(name, ldop, 0x17, op | 0x01, type);                                  \
-GEN_LDX(name, ldop, 0x17, op | 0x00, type)
-
-/* lbz lbzu lbzux lbzx */
-GEN_LDS(lbz, ld8u, 0x02, PPC_INTEGER);
-/* lha lhau lhaux lhax */
-GEN_LDS(lha, ld16s, 0x0A, PPC_INTEGER);
-/* lhz lhzu lhzux lhzx */
-GEN_LDS(lhz, ld16u, 0x08, PPC_INTEGER);
-/* lwz lwzu lwzux lwzx */
-GEN_LDS(lwz, ld32u, 0x00, PPC_INTEGER);
-
 #define GEN_LDEPX(name, ldop, opc2, opc3)                                     \
 static void glue(gen_, name##epx)(DisasContext *ctx)                          \
 {                                                                             \
@@ -3513,47 +3450,12 @@ GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
 #endif
 
 #if defined(TARGET_PPC64)
-/* lwaux */
-GEN_LDUX(lwa, ld32s, 0x15, 0x0B, PPC_64B);
-/* lwax */
-GEN_LDX(lwa, ld32s, 0x15, 0x0A, PPC_64B);
-/* ldux */
-GEN_LDUX(ld, ld64_i64, 0x15, 0x01, PPC_64B);
-/* ldx */
-GEN_LDX(ld, ld64_i64, 0x15, 0x00, PPC_64B);
-
 /* CI load/store variants */
 GEN_LDX_HVRM(ldcix, ld64_i64, 0x15, 0x1b, PPC_CILDST)
 GEN_LDX_HVRM(lwzcix, ld32u, 0x15, 0x15, PPC_CILDST)
 GEN_LDX_HVRM(lhzcix, ld16u, 0x15, 0x19, PPC_CILDST)
 GEN_LDX_HVRM(lbzcix, ld8u, 0x15, 0x1a, PPC_CILDST)
 
-static void gen_ld(DisasContext *ctx)
-{
-    TCGv EA;
-    if (Rc(ctx->opcode)) {
-        if (unlikely(rA(ctx->opcode) == 0 ||
-                     rA(ctx->opcode) == rD(ctx->opcode))) {
-            gen_inval_exception(ctx, POWERPC_EXCP_INVAL_INVAL);
-            return;
-        }
-    }
-    gen_set_access_type(ctx, ACCESS_INT);
-    EA = tcg_temp_new();
-    gen_addr_imm_index(ctx, EA, 0x03);
-    if (ctx->opcode & 0x02) {
-        /* lwa (lwau is undefined) */
-        gen_qemu_ld32s(ctx, cpu_gpr[rD(ctx->opcode)], EA);
-    } else {
-        /* ld - ldu */
-        gen_qemu_ld64_i64(ctx, cpu_gpr[rD(ctx->opcode)], EA);
-    }
-    if (Rc(ctx->opcode)) {
-        tcg_gen_mov_tl(cpu_gpr[rA(ctx->opcode)], EA);
-    }
-    tcg_temp_free(EA);
-}
-
 /* lq */
 static void gen_lq(DisasContext *ctx)
 {
@@ -7726,6 +7628,14 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+/*
+ * Helpers for decodetree used by !function for decoding arguments.
+ */
+static int times_4(DisasContext *ctx, int x)
+{
+    return x * 4;
+}
+
 /*
  * Helpers for trans_* functions to check for specific insns flags.
  * Use token pasting to ensure that we use the proper flag with the
@@ -7752,6 +7662,21 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
 # define REQUIRE_64BIT(CTX)  REQUIRE_INSNS_FLAGS(CTX, 64B)
 #endif
 
+/*
+ * Helpers for implementing sets of trans_* functions.
+ * Defer the implementation of NAME to FUNC, with optional extra arguments.
+ */
+#define TRANS(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { return FUNC(ctx, a, __VA_ARGS__); }
+
+#define TRANS64(NAME, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { REQUIRE_64BIT(ctx); return FUNC(ctx, a, __VA_ARGS__); }
+
+/* TODO: More TRANS* helpers for extra insn_flags checks. */
+
+
 #include "decode-insn32.c.inc"
 #include "decode-insn64.c.inc"
 #include "translate/fixedpoint-impl.c.inc"
@@ -7936,7 +7861,6 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 #endif
 #if defined(TARGET_PPC64)
-GEN_HANDLER(ld, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_64B),
 GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
 GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
 #endif
@@ -8302,34 +8226,11 @@ GEN_PPC64_R2(rldcr, 0x1E, 0x09),
 GEN_PPC64_R4(rldimi, 0x1E, 0x06),
 #endif
 
-#undef GEN_LD
-#undef GEN_LDU
-#undef GEN_LDUX
 #undef GEN_LDX_E
-#undef GEN_LDS
-#define GEN_LD(name, ldop, opc, type)                                         \
-GEN_HANDLER(name, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_LDU(name, ldop, opc, type)                                        \
-GEN_HANDLER(name##u, opc, 0xFF, 0xFF, 0x00000000, type),
-#define GEN_LDUX(name, ldop, opc2, opc3, type)                                \
-GEN_HANDLER(name##ux, 0x1F, opc2, opc3, 0x00000001, type),
 #define GEN_LDX_E(name, ldop, opc2, opc3, type, type2, chk)                   \
 GEN_HANDLER_E(name##x, 0x1F, opc2, opc3, 0x00000001, type, type2),
-#define GEN_LDS(name, ldop, op, type)                                         \
-GEN_LD(name, ldop, op | 0x20, type)                                           \
-GEN_LDU(name, ldop, op | 0x21, type)                                          \
-GEN_LDUX(name, ldop, 0x17, op | 0x01, type)                                   \
-GEN_LDX(name, ldop, 0x17, op | 0x00, type)
-
-GEN_LDS(lbz, ld8u, 0x02, PPC_INTEGER)
-GEN_LDS(lha, ld16s, 0x0A, PPC_INTEGER)
-GEN_LDS(lhz, ld16u, 0x08, PPC_INTEGER)
-GEN_LDS(lwz, ld32u, 0x00, PPC_INTEGER)
+
 #if defined(TARGET_PPC64)
-GEN_LDUX(lwa, ld32s, 0x15, 0x0B, PPC_64B)
-GEN_LDX(lwa, ld32s, 0x15, 0x0A, PPC_64B)
-GEN_LDUX(ld, ld64_i64, 0x15, 0x01, PPC_64B)
-GEN_LDX(ld, ld64_i64, 0x15, 0x00, PPC_64B)
 GEN_LDX_E(ldbr, ld64ur_i64, 0x14, 0x10, PPC_NONE, PPC2_DBRX, CHK_NONE)
 
 /* HV/P7 and later only */
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 9a8da29c64..4c3eff6979 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -36,6 +36,95 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_D *d, arg_PLS_D *a)
     return true;
 }
 
+/*
+ * Fixed-Point Load/Store Instructions
+ */
+
+static bool do_ldst(DisasContext *ctx, int rt, int ra, TCGv displ, bool update,
+                    bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (update && (ra == 0 || (!store && ra == rt))) {
+        gen_invalid(ctx);
+        return true;
+    }
+    gen_set_access_type(ctx, ACCESS_INT);
+
+    ea = tcg_temp_new();
+    if (ra) {
+        tcg_gen_add_tl(ea, cpu_gpr[ra], displ);
+    } else {
+        tcg_gen_mov_tl(ea, displ);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+    mop ^= ctx->default_tcg_memop_mask;
+    if (store) {
+        tcg_gen_qemu_st_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_tl(cpu_gpr[rt], ea, ctx->mem_idx, mop);
+    }
+    if (update) {
+        tcg_gen_mov_tl(cpu_gpr[ra], ea);
+    }
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+static bool do_ldst_D(DisasContext *ctx, arg_D *a, bool update, bool store,
+                      MemOp mop)
+{
+    return do_ldst(ctx, a->rt, a->ra, tcg_constant_tl(a->si), update, store, mop);
+}
+
+static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
+                      bool store, MemOp mop)
+{
+    return do_ldst(ctx, a->rt, a->ra, cpu_gpr[a->rb], update, store, mop);
+}
+
+/* Load Byte and Zero */
+TRANS(LBZ, do_ldst_D, false, false, MO_UB)
+TRANS(LBZX, do_ldst_X, false, false, MO_UB)
+TRANS(LBZU, do_ldst_D, true, false, MO_UB)
+TRANS(LBZUX, do_ldst_X, true, false, MO_UB)
+
+/* Load Halfword and Zero */
+TRANS(LHZ, do_ldst_D, false, false, MO_UW)
+TRANS(LHZX, do_ldst_X, false, false, MO_UW)
+TRANS(LHZU, do_ldst_D, true, false, MO_UW)
+TRANS(LHZUX, do_ldst_X, true, false, MO_UW)
+
+/* Load Halfword Algebraic */
+TRANS(LHA, do_ldst_D, false, false, MO_SW)
+TRANS(LHAX, do_ldst_X, false, false, MO_SW)
+TRANS(LHAU, do_ldst_D, true, false, MO_SW)
+TRANS(LHAXU, do_ldst_X, true, false, MO_SW)
+
+/* Load Word and Zero */
+TRANS(LWZ, do_ldst_D, false, false, MO_UL)
+TRANS(LWZX, do_ldst_X, false, false, MO_UL)
+TRANS(LWZU, do_ldst_D, true, false, MO_UL)
+TRANS(LWZUX, do_ldst_X, true, false, MO_UL)
+
+/* Load Word Algebraic */
+TRANS64(LWA, do_ldst_D, false, false, MO_SL)
+TRANS64(LWAX, do_ldst_X, false, false, MO_SL)
+TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
+
+/* Load Doubleword */
+TRANS64(LD, do_ldst_D, false, false, MO_Q)
+TRANS64(LDX, do_ldst_X, false, false, MO_Q)
+TRANS64(LDU, do_ldst_D, true, false, MO_Q)
+TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
+
+/*
+ * Fixed-Point Arithmetic Instructions
+ */
+
 static bool trans_ADDI(DisasContext *ctx, arg_D *a)
 {
     if (a->ra) {
-- 
2.25.1


