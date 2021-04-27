Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACDD36CA80
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:43:10 +0200 (CEST)
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRjp-0006FG-CG
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRMC-0001uC-6g; Tue, 27 Apr 2021 13:18:44 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRMA-00023I-28; Tue, 27 Apr 2021 13:18:43 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id D94E68013BA;
 Tue, 27 Apr 2021 14:16:53 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 11/15] target/ppc: Move D/DS/X-form integer loads to
 decodetree
Date: Tue, 27 Apr 2021 14:16:45 -0300
Message-Id: <20210427171649.364699-12-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:54.0090 (UTC)
 FILETIME=[1E9D42A0:01D73B89]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=luis.pires@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: richard.henderson@linaro.org, f4bug@amsat.org, lagarcia@br.ibm.com,
 bruno.larsen@eldorado.org.br, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These are all connected by macros in the legacy decoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode                   |  37 ++++
 target/ppc/translate.c                     | 136 ++-------------
 target/ppc/translate/fixedpoint-impl.c.inc | 188 +++++++++++++++++++++
 3 files changed, 238 insertions(+), 123 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 878d2f2f66..bf39ce5c15 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -20,6 +20,43 @@
 &D              rt ra si
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
index 6edde6a53d..a1f0e59afd 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2505,54 +2505,6 @@ GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
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
@@ -2571,21 +2523,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
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
@@ -2606,47 +2543,12 @@ GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
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
@@ -6879,6 +6781,18 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
     tcg_gen_st_i64(src, cpu_env, avr64_offset(regno, high));
 }
 
+static inline int times_4(DisasContext *ctx, int x)
+{
+    return x * 4;
+}
+
+#define REQUIRE_INSNS_FLAGS(CTX, NAME) \
+    do {                                                \
+        if (((CTX)->insns_flags & PPC_##NAME) == 0) {   \
+            return false;                               \
+        }                                               \
+    } while (0)
+
 #include "decode-insn64.c.inc"
 #include "decode-insn32.c.inc"
 
@@ -7064,7 +6978,6 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 #endif
 #if defined(TARGET_PPC64)
-GEN_HANDLER(ld, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_64B),
 GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
 GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
 #endif
@@ -7430,34 +7343,11 @@ GEN_PPC64_R2(rldcr, 0x1E, 0x09),
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
index 7d80e3c002..e15e379931 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -30,6 +30,194 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_PLS_D *a)
     return true;
 }
 
+static bool do_ldst_D(DisasContext *ctx, arg_D *a, bool update,
+                      bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (update && (a->ra == 0 || (!store && a->ra == a->rt))) {
+        return false;
+    }
+    gen_set_access_type(ctx, ACCESS_INT);
+
+    ea = tcg_temp_new();
+    if (a->ra) {
+        tcg_gen_addi_tl(ea, cpu_gpr[a->ra], a->si);
+    } else {
+        tcg_gen_movi_tl(ea, a->si);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+    mop ^= ctx->default_tcg_memop_mask;
+    if (store) {
+        tcg_gen_qemu_st_tl(cpu_gpr[a->rt], ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_tl(cpu_gpr[a->rt], ea, ctx->mem_idx, mop);
+    }
+    if (update) {
+        tcg_gen_mov_tl(cpu_gpr[a->ra], ea);
+    }
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+static bool trans_LBZ(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, false, false, MO_UB);
+}
+
+static bool trans_LBZU(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, true, false, MO_UB);
+}
+
+static bool trans_LHZ(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, false, false, MO_UW);
+}
+
+static bool trans_LHZU(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, true, false, MO_UW);
+}
+
+static bool trans_LHA(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, false, false, MO_SW);
+}
+
+static bool trans_LHAU(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, true, false, MO_SW);
+}
+
+static bool trans_LWZ(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, false, false, MO_UL);
+}
+
+static bool trans_LWZU(DisasContext *ctx, arg_D *a)
+{
+    return do_ldst_D(ctx, a, true, false, MO_UL);
+}
+
+static bool trans_LWA(DisasContext *ctx, arg_D *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_D(ctx, a, false, false, MO_SL);
+}
+
+static bool trans_LD(DisasContext *ctx, arg_D *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_D(ctx, a, false, false, MO_Q);
+}
+
+static bool trans_LDU(DisasContext *ctx, arg_D *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_D(ctx, a, true, false, MO_Q);
+}
+
+static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
+                      bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (update && (a->ra == 0 || (!store && a->ra == a->rt))) {
+        return false;
+    }
+    gen_set_access_type(ctx, ACCESS_INT);
+
+    ea = tcg_temp_new();
+    if (a->ra) {
+        tcg_gen_add_tl(ea, cpu_gpr[a->ra], cpu_gpr[a->rb]);
+    } else {
+        tcg_gen_mov_tl(ea, cpu_gpr[a->rb]);
+    }
+    if (NARROW_MODE(ctx)) {
+        tcg_gen_ext32u_tl(ea, ea);
+    }
+    mop ^= ctx->default_tcg_memop_mask;
+    if (store) {
+        tcg_gen_qemu_st_tl(cpu_gpr[a->rt], ea, ctx->mem_idx, mop);
+    } else {
+        tcg_gen_qemu_ld_tl(cpu_gpr[a->rt], ea, ctx->mem_idx, mop);
+    }
+    if (update) {
+        tcg_gen_mov_tl(cpu_gpr[a->ra], ea);
+    }
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+static bool trans_LBZX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, false, false, MO_UB);
+}
+
+static bool trans_LBZUX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, true, false, MO_UB);
+}
+
+static bool trans_LHZX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, false, false, MO_UW);
+}
+
+static bool trans_LHZUX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, true, false, MO_UW);
+}
+
+static bool trans_LHAX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, false, false, MO_SW);
+}
+
+static bool trans_LHAXU(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, true, false, MO_SW);
+}
+
+static bool trans_LWZX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, false, false, MO_UL);
+}
+
+static bool trans_LWZUX(DisasContext *ctx, arg_X *a)
+{
+    return do_ldst_X(ctx, a, true, false, MO_UL);
+}
+
+static bool trans_LWAX(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_X(ctx, a, false, false, MO_SL);
+}
+
+static bool trans_LWAUX(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_X(ctx, a, true, false, MO_SL);
+}
+
+static bool trans_LDX(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_X(ctx, a, false, false, MO_Q);
+}
+
+static bool trans_LDUX(DisasContext *ctx, arg_X *a)
+{
+    REQUIRE_INSNS_FLAGS(ctx, 64B);
+    return do_ldst_X(ctx, a, true, false, MO_Q);
+}
+
 static bool trans_ADDI(DisasContext *ctx, arg_D *a)
 {
     if (a->ra) {
-- 
2.25.1


