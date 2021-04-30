Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D548F36F3CA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:40:44 +0200 (CEST)
Received: from localhost ([::1]:42220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcI95-00059N-Qm
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHle-0003Zk-Tm
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:30 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHlF-0007f9-LW
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:16:30 -0400
Received: by mail-pg1-x530.google.com with SMTP id s22so27259588pgk.6
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Enh/EW47Yz0hTObkzuvr9E0z7+LlBitSxI+p3uq2KvI=;
 b=n5TT253XxJIRSl9aHJGbf//o3d3NMNqoNpMpnCnaDBTzewJZoOixz2o83UPQ0PsBKP
 /Zf7zUpXm9kdx3WLJNLM0o6sHk+yI1DSQbnfOXyk9Lfg6ALksxG745vm3XeTqT/1QBuu
 KPQEgXBShtYFwseZHCzzxcoxP7G/dj9qJiA7b3fyK5a2mtV+/4uE8p0g+8sQay3M2j/v
 AxiUBeh1ro3vrQd5FNc3w/Dsk2Z/92nzEs1UVvAjr4McQF7fjufECI92GhDoOWfaOo39
 AEQ/HP48OghULWAGBCmSKdTorYcc8xlJ6xDI3lz+i6TVJzTIZQmb0zixRj8sYXnZJLIv
 w/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Enh/EW47Yz0hTObkzuvr9E0z7+LlBitSxI+p3uq2KvI=;
 b=ruMhDTo7CDO68TzGbb9gn1JkDP3iQNZRZ+aTvVOxJWJvQmsXQeJBJx05Kr5b05DdOW
 35DowVCwCi8PW1cswrRdVA0RfXDVpP/5q1qaLaMarb+dqpBTvDpAa41Em7VDOiQ0zIKY
 sLJ9fqJHbZfM7LT64YF3lLsGQT+XE2O+GLO855YLI9vpZlbXhUj61GavizlbL7f2Lzqb
 x++jIQH4XD0dkZa/zQLsUfw6VzcR7MGgo8IUdQrncchdstwrCjcyCRDpSbwVv2+L8D+/
 moEyoQBRx9UcDu2BDkA07ZgYovWYqN9q66DzY/aGsw31nI+Dae7AKco5xcrmnMuEL+1V
 221w==
X-Gm-Message-State: AOAM532A6i9cRgFMmhd9x7uerFNtFy/8Pp2E0IML75flfrwowGPlAFhD
 G1HIH0Y4QPDr7Dc672ldHE/G7v37G+0VQQ==
X-Google-Smtp-Source: ABdhPJzCDfq+zsBtVwRwvr5QVprozyh2XunkRoYElkeRvgoYQaAiQW6ZQg3+eRwkXGjSbz2ZMcL1bQ==
X-Received: by 2002:a63:120a:: with SMTP id h10mr2412946pgl.212.1619745363103; 
 Thu, 29 Apr 2021 18:16:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:16:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/30] target/ppc: Move D/DS/X-form integer loads to
 decodetree
Date: Thu, 29 Apr 2021 18:15:40 -0700
Message-Id: <20210430011543.1017113-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430011543.1017113-1-richard.henderson@linaro.org>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are all connected by macros in the legacy decoding.
Decode the D and DS forms into the PLS_D argument set so
that prefixed insns can share code.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn32.decode                   |  37 ++++++
 target/ppc/translate.c                     | 145 ++++-----------------
 target/ppc/translate/fixedpoint-impl.c.inc | 114 ++++++++++++++++
 3 files changed, 174 insertions(+), 122 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2ed25c7e67..1c1b4620fc 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -26,6 +26,43 @@
 &PLS_D          rt ra si:int64_t r:bool
 @PLS_D          ...... rt:5 ra:5 si:s16                 &PLS_D r=0
 
+%ds_si          2:s14  !function=times_4
+@PLS_DS         ...... rt:5 ra:5 .............. ..      &PLS_D si=%ds_si r=0
+
+&X              rt ra rb
+@X              ...... rt:5 ra:5 rb:5 .......... .      &X
+
+### Fixed-Point Load Instructions
+
+LBZ             100010 ..... ..... ................     @PLS_D
+LBZU            100011 ..... ..... ................     @PLS_D
+LBZX            011111 ..... ..... ..... 0001010111 -   @X
+LBZUX           011111 ..... ..... ..... 0001110111 -   @X
+
+LHZ             101000 ..... ..... ................     @PLS_D
+LHZU            101001 ..... ..... ................     @PLS_D
+LHZX            011111 ..... ..... ..... 0100010111 -   @X
+LHZUX           011111 ..... ..... ..... 0100110111 -   @X
+
+LHA             101010 ..... ..... ................     @PLS_D
+LHAU            101011 ..... ..... ................     @PLS_D
+LHAX            011111 ..... ..... ..... 0101010111 -   @X
+LHAXU           011111 ..... ..... ..... 0101110111 -   @X
+
+LWZ             100000 ..... ..... ................     @PLS_D
+LWZU            100001 ..... ..... ................     @PLS_D
+LWZX            011111 ..... ..... ..... 0000010111 -   @X
+LWZUX           011111 ..... ..... ..... 0000110111 -   @X
+
+LWA             111010 ..... ..... ..............10     @PLS_DS
+LWAX            011111 ..... ..... ..... 0101010101 -   @X
+LWAUX           011111 ..... ..... ..... 0101110101 -   @X
+
+LD              111010 ..... ..... ..............00     @PLS_DS
+LDU             111010 ..... ..... ..............01     @PLS_DS
+LDX             011111 ..... ..... ..... 0000010101 -   @X
+LDUX            011111 ..... ..... ..... 0000110101 -   @X
+
 ### Fixed-Point Arithmetic Instructions
 
 ADDI            001110 ..... ..... ................     @PLS_D
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 5a8a3c39c3..1fdb501ee9 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -2487,54 +2487,6 @@ GEN_QEMU_STORE_64(st64, DEF_MEMOP(MO_Q))
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
@@ -2553,21 +2505,6 @@ static void glue(gen_, name##x)(DisasContext *ctx)                            \
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
@@ -2588,47 +2525,12 @@ GEN_LDEPX(ld, DEF_MEMOP(MO_Q), 0x1D, 0x00)
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
@@ -6849,6 +6751,14 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
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
@@ -6875,6 +6785,21 @@ static inline void set_avr64(int regno, TCGv_i64 src, bool high)
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
@@ -7059,7 +6984,6 @@ GEN_HANDLER2_E(extswsli1, "extswsli", 0x1F, 0x1B, 0x1B, 0x00000000,
                PPC_NONE, PPC2_ISA300),
 #endif
 #if defined(TARGET_PPC64)
-GEN_HANDLER(ld, 0x3A, 0xFF, 0xFF, 0x00000000, PPC_64B),
 GEN_HANDLER(lq, 0x38, 0xFF, 0xFF, 0x00000000, PPC_64BX),
 GEN_HANDLER(std, 0x3E, 0xFF, 0xFF, 0x00000000, PPC_64B),
 #endif
@@ -7425,34 +7349,11 @@ GEN_PPC64_R2(rldcr, 0x1E, 0x09),
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
 
-GEN_LDS(lbz, ld8u, 0x02, PPC_INTEGER)
-GEN_LDS(lha, ld16s, 0x0A, PPC_INTEGER)
-GEN_LDS(lhz, ld16u, 0x08, PPC_INTEGER)
-GEN_LDS(lwz, ld32u, 0x00, PPC_INTEGER)
 #if defined(TARGET_PPC64)
-GEN_LDUX(lwa, ld32s, 0x15, 0x0B, PPC_64B)
-GEN_LDX(lwa, ld32s, 0x15, 0x0A, PPC_64B)
-GEN_LDUX(ld, ld64_i64, 0x15, 0x01, PPC_64B)
-GEN_LDX(ld, ld64_i64, 0x15, 0x00, PPC_64B)
 GEN_LDX_E(ldbr, ld64ur_i64, 0x14, 0x10, PPC_NONE, PPC2_DBRX, CHK_NONE)
 
 /* HV/P7 and later only */
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index 96b8c38f60..cb3219c996 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -33,6 +33,120 @@ static bool resolve_PLS_D(DisasContext *ctx, arg_PLS_D *a)
     return true;
 }
 
+/*
+ * Fixed-Point Load/Store Instructions
+ */
+
+static bool do_ldst_PLS_D(DisasContext *ctx, arg_PLS_D *a, bool update,
+                          bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (!resolve_PLS_D(ctx, a)) {
+        return true;
+    }
+    if (update && (a->ra == 0 || (!store && a->ra == a->rt))) {
+        gen_invalid(ctx);
+        return true;
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
+static bool do_ldst_X(DisasContext *ctx, arg_X *a, bool update,
+                      bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (update && (a->ra == 0 || (!store && a->ra == a->rt))) {
+        gen_invalid(ctx);
+        return true;
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
+/* Load Byte and Zero */
+TRANS(LBZ, do_ldst_PLS_D, false, false, MO_UB)
+TRANS(LBZX, do_ldst_X, false, false, MO_UB)
+TRANS(LBZU, do_ldst_PLS_D, true, false, MO_UB)
+TRANS(LBZUX, do_ldst_X, true, false, MO_UB)
+
+/* Load Halfword and Zero */
+TRANS(LHZ, do_ldst_PLS_D, false, false, MO_UW)
+TRANS(LHZX, do_ldst_X, false, false, MO_UW)
+TRANS(LHZU, do_ldst_PLS_D, true, false, MO_UW)
+TRANS(LHZUX, do_ldst_X, true, false, MO_UW)
+
+/* Load Halfword Algebraic */
+TRANS(LHA, do_ldst_PLS_D, false, false, MO_SW)
+TRANS(LHAX, do_ldst_X, false, false, MO_SW)
+TRANS(LHAU, do_ldst_PLS_D, true, false, MO_SW)
+TRANS(LHAXU, do_ldst_X, true, false, MO_SW)
+
+/* Load Word and Zero */
+TRANS(LWZ, do_ldst_PLS_D, false, false, MO_UL)
+TRANS(LWZX, do_ldst_X, false, false, MO_UL)
+TRANS(LWZU, do_ldst_PLS_D, true, false, MO_UL)
+TRANS(LWZUX, do_ldst_X, true, false, MO_UL)
+
+/* Load Word Algebraic */
+TRANS64(LWA, do_ldst_PLS_D, false, false, MO_SL)
+TRANS64(LWAX, do_ldst_X, false, false, MO_SL)
+TRANS64(LWAUX, do_ldst_X, true, false, MO_SL)
+
+/* Load Doubleword */
+TRANS64(LD, do_ldst_PLS_D, false, false, MO_Q)
+TRANS64(LDX, do_ldst_X, false, false, MO_Q)
+TRANS64(LDU, do_ldst_PLS_D, true, false, MO_Q)
+TRANS64(LDUX, do_ldst_X, true, false, MO_Q)
+
+/*
+ * Fixed-Point Arithmetic Instructions
+ */
+
 static bool trans_ADDI(DisasContext *ctx, arg_PLS_D *a)
 {
     if (resolve_PLS_D(ctx, a)) {
-- 
2.25.1


