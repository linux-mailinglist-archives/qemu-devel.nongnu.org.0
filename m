Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11354487E1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jun 2019 17:51:53 +0200 (CEST)
Received: from localhost ([::1]:48718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hctvE-0002cV-7F
	for lists+qemu-devel@lfdr.de; Mon, 17 Jun 2019 11:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47229)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjk-0004qO-4F
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:36:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hcsjf-0000ZQ-Hk
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:55 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:35530)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hcsjf-0000YB-3X
 for qemu-devel@nongnu.org; Mon, 17 Jun 2019 10:35:51 -0400
Received: from wormulon.uni-paderborn.de ([131.234.189.22]
 helo=localhost.localdomain)
 by mail.uni-paderborn.de with esmtp (Exim 4.89 telepax)
 id 1hcsjd-00040X-5w; Mon, 17 Jun 2019 16:35:50 +0200
Received: from mail.uni-paderborn.de by wormulon with queue id 3370045-5;
 Mon, 17 Jun 2019 14:35:47 GMT
X-Envelope-From: <kbastian@mail.uni-paderborn.de>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: qemu-devel@nongnu.org
Date: Mon, 17 Jun 2019 16:35:32 +0200
Message-Id: <20190617143533.15013-3-kbastian@mail.uni-paderborn.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
References: <20190617143533.15013-1-kbastian@mail.uni-paderborn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.17.142717, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.4.5630002
X-IMT-Spam-Score: 0.0 ()
X-IMT-Authenticated-Sender: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.14
Subject: [Qemu-devel] [PATCH 2/3] target-tricore: Make env a member of
 DisasContext
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
Cc: kbastian@mail.uni-paderborn.de, david.brenken@efs-auto.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

otherwise we have to pass env down through all functions which blocks
the usage of translator_loop.

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
---
 target/tricore/translate.c | 340 ++++++++++++++++++-------------------
 1 file changed, 168 insertions(+), 172 deletions(-)

diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index a66a10c376..b4e332777a 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -66,6 +66,7 @@ static const char *regnames_d[] = {
 
 typedef struct DisasContext {
     DisasContextBase base;
+    CPUTriCoreState *env;
     target_ulong pc_succ_insn;
     uint32_t opcode;
     /* Routine used to access memory */
@@ -369,13 +370,13 @@ static void gen_swapmsk(DisasContext *ctx, int reg, TCGv ea)
    These makros also specify in which ISA version the csfr was introduced. */
 #define R(ADDRESS, REG, FEATURE)                                         \
     case ADDRESS:                                                        \
-        if (tricore_feature(env, FEATURE)) {                             \
+        if (tricore_feature(ctx->env, FEATURE)) {                        \
             tcg_gen_ld_tl(ret, cpu_env, offsetof(CPUTriCoreState, REG)); \
         }                                                                \
         break;
 #define A(ADDRESS, REG, FEATURE) R(ADDRESS, REG, FEATURE)
 #define E(ADDRESS, REG, FEATURE) R(ADDRESS, REG, FEATURE)
-static inline void gen_mfcr(CPUTriCoreState *env, TCGv ret, int32_t offset)
+static inline void gen_mfcr(DisasContext *ctx, TCGv ret, int32_t offset)
 {
     /* since we're caching PSW make this a special case */
     if (offset == 0xfe04) {
@@ -394,7 +395,7 @@ static inline void gen_mfcr(CPUTriCoreState *env, TCGv ret, int32_t offset)
                                     since no execption occurs */
 #define A(ADDRESS, REG, FEATURE) R(ADDRESS, REG, FEATURE)                \
     case ADDRESS:                                                        \
-        if (tricore_feature(env, FEATURE)) {                             \
+        if (tricore_feature(ctx->env, FEATURE)) {                        \
             tcg_gen_st_tl(r1, cpu_env, offsetof(CPUTriCoreState, REG));  \
         }                                                                \
         break;
@@ -403,7 +404,7 @@ static inline void gen_mfcr(CPUTriCoreState *env, TCGv ret, int32_t offset)
          watchdog device, we handle endinit protected registers like
          all-access registers for now. */
 #define E(ADDRESS, REG, FEATURE) A(ADDRESS, REG, FEATURE)
-static inline void gen_mtcr(CPUTriCoreState *env, DisasContext *ctx, TCGv r1,
+static inline void gen_mtcr(DisasContext *ctx, TCGv r1,
                             int32_t offset)
 {
     if ((ctx->hflags & TRICORE_HFLAG_KUU) == TRICORE_HFLAG_SM) {
@@ -1093,7 +1094,7 @@ gen_maddrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 
 static inline void
 gen_madd32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
-             uint32_t up_shift, CPUTriCoreState *env)
+             uint32_t up_shift)
 {
     TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
@@ -1254,7 +1255,7 @@ gen_m16adds64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
 static inline void
 gen_madd64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
-             TCGv arg3, uint32_t n, CPUTriCoreState *env)
+             TCGv arg3, uint32_t n)
 {
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -1952,7 +1953,7 @@ gen_msubrs_q(TCGv ret, TCGv r1, TCGv r2, TCGv r3, uint32_t n)
 
 static inline void
 gen_msub32_q(TCGv ret, TCGv arg1, TCGv arg2, TCGv arg3, uint32_t n,
-             uint32_t up_shift, CPUTriCoreState *env)
+             uint32_t up_shift)
 {
     TCGv temp = tcg_temp_new();
     TCGv temp2 = tcg_temp_new();
@@ -2107,7 +2108,7 @@ gen_m16subs64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
 
 static inline void
 gen_msub64_q(TCGv rl, TCGv rh, TCGv arg1_low, TCGv arg1_high, TCGv arg2,
-             TCGv arg3, uint32_t n, CPUTriCoreState *env)
+             TCGv arg3, uint32_t n)
 {
     TCGv_i64 t1 = tcg_temp_new_i64();
     TCGv_i64 t2 = tcg_temp_new_i64();
@@ -3153,11 +3154,11 @@ static inline void gen_unpack(TCGv rl, TCGv rh, TCGv r1)
 }
 
 static inline void
-gen_dvinit_b(CPUTriCoreState *env, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
+gen_dvinit_b(DisasContext *ctx, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
 {
     TCGv_i64 ret = tcg_temp_new_i64();
 
-    if (!tricore_feature(env, TRICORE_FEATURE_131)) {
+    if (!tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
         gen_helper_dvinit_b_13(ret, cpu_env, r1, r2);
     } else {
         gen_helper_dvinit_b_131(ret, cpu_env, r1, r2);
@@ -3168,11 +3169,11 @@ gen_dvinit_b(CPUTriCoreState *env, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
 }
 
 static inline void
-gen_dvinit_h(CPUTriCoreState *env, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
+gen_dvinit_h(DisasContext *ctx, TCGv rl, TCGv rh, TCGv r1, TCGv r2)
 {
     TCGv_i64 ret = tcg_temp_new_i64();
 
-    if (!tricore_feature(env, TRICORE_FEATURE_131)) {
+    if (!tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
         gen_helper_dvinit_h_13(ret, cpu_env, r1, r2);
     } else {
         gen_helper_dvinit_h_131(ret, cpu_env, r1, r2);
@@ -3584,7 +3585,7 @@ static void gen_compute_branch(DisasContext *ctx, uint32_t opc, int r1,
  * Functions for decoding instructions
  */
 
-static void decode_src_opc(CPUTriCoreState *env, DisasContext *ctx, int op1)
+static void decode_src_opc(DisasContext *ctx, int op1)
 {
     int r1;
     int32_t const4;
@@ -3646,7 +3647,7 @@ static void decode_src_opc(CPUTriCoreState *env, DisasContext *ctx, int op1)
         tcg_gen_movi_tl(cpu_gpr_a[r1], const4);
         break;
     case OPC1_16_SRC_MOV_E:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             tcg_gen_movi_tl(cpu_gpr_d[r1], const4);
             tcg_gen_sari_tl(cpu_gpr_d[r1+1], cpu_gpr_d[r1], 31);
         } else {
@@ -3910,7 +3911,7 @@ static void decode_sro_opc(DisasContext *ctx, int op1)
     }
 }
 
-static void decode_sr_system(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_sr_system(DisasContext *ctx)
 {
     uint32_t op2;
     op2 = MASK_OP_SR_OP2(ctx->opcode);
@@ -3937,7 +3938,7 @@ static void decode_sr_system(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_sr_accu(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_sr_accu(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1;
@@ -3981,7 +3982,7 @@ static void decode_sr_accu(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_16Bit_opc(DisasContext *ctx)
 {
     int op1;
     int r1, r2;
@@ -4012,7 +4013,7 @@ static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     case OPC1_16_SRC_MOV_E:
     case OPC1_16_SRC_SH:
     case OPC1_16_SRC_SHA:
-        decode_src_opc(env, ctx, op1);
+        decode_src_opc(ctx, op1);
         break;
 /* SRR-format */
     case OPC1_16_SRR_ADD:
@@ -4097,7 +4098,7 @@ static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
     case OPC1_16_SBC_JEQ2:
     case OPC1_16_SBC_JNE2:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             address = MASK_OP_SBC_DISP4(ctx->opcode);
             const16 = MASK_OP_SBC_CONST4_SEXT(ctx->opcode);
             gen_compute_branch(ctx, op1, 0, 0, const16, address);
@@ -4115,7 +4116,7 @@ static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
 /* SBR-format */
     case OPC1_16_SBR_JEQ2:
     case OPC1_16_SBR_JNE2:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             r1 = MASK_OP_SBR_S2(ctx->opcode);
             address = MASK_OP_SBR_DISP4(ctx->opcode);
             gen_compute_branch(ctx, op1, r1, 0, 0, address);
@@ -4195,10 +4196,10 @@ static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
 /* SR-format */
     case OPCM_16_SR_SYSTEM:
-        decode_sr_system(env, ctx);
+        decode_sr_system(ctx);
         break;
     case OPCM_16_SR_ACCU:
-        decode_sr_accu(env, ctx);
+        decode_sr_accu(ctx);
         break;
     case OPC1_16_SR_JI:
         r1 = MASK_OP_SR_S1D(ctx->opcode);
@@ -4218,7 +4219,7 @@ static void decode_16Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
  */
 
 /* ABS-format */
-static void decode_abs_ldw(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_ldw(DisasContext *ctx)
 {
     int32_t op2;
     int32_t r1;
@@ -4253,7 +4254,7 @@ static void decode_abs_ldw(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_abs_ldb(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_ldb(DisasContext *ctx)
 {
     int32_t op2;
     int32_t r1;
@@ -4286,7 +4287,7 @@ static void decode_abs_ldb(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_abs_ldst_swap(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_ldst_swap(DisasContext *ctx)
 {
     int32_t op2;
     int32_t r1;
@@ -4313,7 +4314,7 @@ static void decode_abs_ldst_swap(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_abs_ldst_context(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_ldst_context(DisasContext *ctx)
 {
     uint32_t op2;
     int32_t off18;
@@ -4339,7 +4340,7 @@ static void decode_abs_ldst_context(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_abs_store(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_store(DisasContext *ctx)
 {
     int32_t op2;
     int32_t r1;
@@ -4373,7 +4374,7 @@ static void decode_abs_store(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_abs_storeb_h(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_abs_storeb_h(DisasContext *ctx)
 {
     int32_t op2;
     int32_t r1;
@@ -4401,7 +4402,7 @@ static void decode_abs_storeb_h(CPUTriCoreState *env, DisasContext *ctx)
 
 /* Bit-format */
 
-static void decode_bit_andacc(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_andacc(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -4442,7 +4443,7 @@ static void decode_bit_andacc(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_bit_logical_t(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_logical_t(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -4476,7 +4477,7 @@ static void decode_bit_logical_t(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_bit_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -4499,7 +4500,7 @@ static void decode_bit_insert(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_bit_logical_t2(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_logical_t2(DisasContext *ctx)
 {
     uint32_t op2;
 
@@ -4535,7 +4536,7 @@ static void decode_bit_logical_t2(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_bit_orand(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_orand(DisasContext *ctx)
 {
     uint32_t op2;
 
@@ -4576,7 +4577,7 @@ static void decode_bit_orand(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_bit_sh_logic1(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_sh_logic1(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -4617,7 +4618,7 @@ static void decode_bit_sh_logic1(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_bit_sh_logic2(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_bit_sh_logic2(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -4661,8 +4662,7 @@ static void decode_bit_sh_logic2(CPUTriCoreState *env, DisasContext *ctx)
 /* BO-format */
 
 
-static void decode_bo_addrmode_post_pre_base(CPUTriCoreState *env,
-                                             DisasContext *ctx)
+static void decode_bo_addrmode_post_pre_base(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -4696,13 +4696,13 @@ static void decode_bo_addrmode_post_pre_base(CPUTriCoreState *env,
         break;
     case OPC2_32_BO_CACHEI_WI_SHORTOFF:
     case OPC2_32_BO_CACHEI_W_SHORTOFF:
-        if (!tricore_feature(env, TRICORE_FEATURE_131)) {
+        if (!tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC2_32_BO_CACHEI_W_POSTINC:
     case OPC2_32_BO_CACHEI_WI_POSTINC:
-        if (tricore_feature(env, TRICORE_FEATURE_131)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
             tcg_gen_addi_tl(cpu_gpr_a[r2], cpu_gpr_a[r2], off10);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4710,7 +4710,7 @@ static void decode_bo_addrmode_post_pre_base(CPUTriCoreState *env,
         break;
     case OPC2_32_BO_CACHEI_W_PREINC:
     case OPC2_32_BO_CACHEI_WI_PREINC:
-        if (tricore_feature(env, TRICORE_FEATURE_131)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
             tcg_gen_addi_tl(cpu_gpr_a[r2], cpu_gpr_a[r2], off10);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -4821,8 +4821,7 @@ static void decode_bo_addrmode_post_pre_base(CPUTriCoreState *env,
     }
 }
 
-static void decode_bo_addrmode_bitreverse_circular(CPUTriCoreState *env,
-                                                   DisasContext *ctx)
+static void decode_bo_addrmode_bitreverse_circular(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -4932,8 +4931,7 @@ static void decode_bo_addrmode_bitreverse_circular(CPUTriCoreState *env,
     tcg_temp_free(temp3);
 }
 
-static void decode_bo_addrmode_ld_post_pre_base(CPUTriCoreState *env,
-                                                DisasContext *ctx)
+static void decode_bo_addrmode_ld_post_pre_base(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -5067,8 +5065,7 @@ static void decode_bo_addrmode_ld_post_pre_base(CPUTriCoreState *env,
     }
 }
 
-static void decode_bo_addrmode_ld_bitreverse_circular(CPUTriCoreState *env,
-                                                DisasContext *ctx)
+static void decode_bo_addrmode_ld_bitreverse_circular(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -5186,8 +5183,7 @@ static void decode_bo_addrmode_ld_bitreverse_circular(CPUTriCoreState *env,
     tcg_temp_free(temp3);
 }
 
-static void decode_bo_addrmode_stctx_post_pre_base(CPUTriCoreState *env,
-                                                   DisasContext *ctx)
+static void decode_bo_addrmode_stctx_post_pre_base(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -5279,8 +5275,7 @@ static void decode_bo_addrmode_stctx_post_pre_base(CPUTriCoreState *env,
     tcg_temp_free(temp2);
 }
 
-static void decode_bo_addrmode_ldmst_bitreverse_circular(CPUTriCoreState *env,
-                                                         DisasContext *ctx)
+static void decode_bo_addrmode_ldmst_bitreverse_circular(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t off10;
@@ -5342,7 +5337,7 @@ static void decode_bo_addrmode_ldmst_bitreverse_circular(CPUTriCoreState *env,
     tcg_temp_free(temp3);
 }
 
-static void decode_bol_opc(CPUTriCoreState *env, DisasContext *ctx, int32_t op1)
+static void decode_bol_opc(DisasContext *ctx, int32_t op1)
 {
     int r1, r2;
     int32_t address;
@@ -5369,7 +5364,7 @@ static void decode_bol_opc(CPUTriCoreState *env, DisasContext *ctx, int32_t op1)
         tcg_gen_addi_tl(cpu_gpr_a[r1], cpu_gpr_a[r2], address);
         break;
     case OPC1_32_BOL_ST_A_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_st(ctx, cpu_gpr_a[r1], cpu_gpr_a[r2], address, MO_LEUL);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -5379,42 +5374,42 @@ static void decode_bol_opc(CPUTriCoreState *env, DisasContext *ctx, int32_t op1)
         gen_offset_st(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_LEUL);
         break;
     case OPC1_32_BOL_LD_B_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_ld(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_SB);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC1_32_BOL_LD_BU_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_ld(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_UB);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC1_32_BOL_LD_H_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_ld(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_LESW);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC1_32_BOL_LD_HU_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_ld(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_LEUW);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC1_32_BOL_ST_B_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_st(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_SB);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC1_32_BOL_ST_H_LONGOFF:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             gen_offset_st(ctx, cpu_gpr_d[r1], cpu_gpr_a[r2], address, MO_LESW);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -5426,7 +5421,7 @@ static void decode_bol_opc(CPUTriCoreState *env, DisasContext *ctx, int32_t op1)
 }
 
 /* RC format */
-static void decode_rc_logical_shift(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rc_logical_shift(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2;
@@ -5493,7 +5488,7 @@ static void decode_rc_logical_shift(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_rc_accumulator(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rc_accumulator(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2;
@@ -5693,7 +5688,7 @@ static void decode_rc_accumulator(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_rc_serviceroutine(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rc_serviceroutine(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t const9;
@@ -5713,7 +5708,7 @@ static void decode_rc_serviceroutine(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rc_mul(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rc_mul(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2;
@@ -5751,7 +5746,7 @@ static void decode_rc_mul(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RCPW format */
-static void decode_rcpw_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rcpw_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2;
@@ -5790,7 +5785,7 @@ static void decode_rcpw_insert(CPUTriCoreState *env, DisasContext *ctx)
 
 /* RCRW format */
 
-static void decode_rcrw_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rcrw_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r3, r4;
@@ -5835,7 +5830,7 @@ static void decode_rcrw_insert(CPUTriCoreState *env, DisasContext *ctx)
 
 /* RCR format */
 
-static void decode_rcr_cond_select(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rcr_cond_select(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r3, r4;
@@ -5879,7 +5874,7 @@ static void decode_rcr_cond_select(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rcr_madd(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rcr_madd(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r3, r4;
@@ -5934,7 +5929,7 @@ static void decode_rcr_madd(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rcr_msub(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rcr_msub(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r3, r4;
@@ -5991,7 +5986,7 @@ static void decode_rcr_msub(CPUTriCoreState *env, DisasContext *ctx)
 
 /* RLC format */
 
-static void decode_rlc_opc(CPUTriCoreState *env, DisasContext *ctx,
+static void decode_rlc_opc(DisasContext *ctx,
                            uint32_t op1)
 {
     int32_t const16;
@@ -6013,13 +6008,13 @@ static void decode_rlc_opc(CPUTriCoreState *env, DisasContext *ctx,
         break;
     case OPC1_32_RLC_MFCR:
         const16 = MASK_OP_RLC_CONST16(ctx->opcode);
-        gen_mfcr(env, cpu_gpr_d[r2], const16);
+        gen_mfcr(ctx, cpu_gpr_d[r2], const16);
         break;
     case OPC1_32_RLC_MOV:
         tcg_gen_movi_tl(cpu_gpr_d[r2], const16);
         break;
     case OPC1_32_RLC_MOV_64:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             CHECK_REG_PAIR(r2);
             tcg_gen_movi_tl(cpu_gpr_d[r2], const16);
             tcg_gen_movi_tl(cpu_gpr_d[r2+1], const16 >> 15);
@@ -6039,7 +6034,7 @@ static void decode_rlc_opc(CPUTriCoreState *env, DisasContext *ctx,
         break;
     case OPC1_32_RLC_MTCR:
         const16 = MASK_OP_RLC_CONST16(ctx->opcode);
-        gen_mtcr(env, ctx, cpu_gpr_d[r1], const16);
+        gen_mtcr(ctx, cpu_gpr_d[r1], const16);
         break;
     default:
         generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
@@ -6047,7 +6042,7 @@ static void decode_rlc_opc(CPUTriCoreState *env, DisasContext *ctx,
 }
 
 /* RR format */
-static void decode_rr_accumulator(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr_accumulator(DisasContext *ctx)
 {
     uint32_t op2;
     int r3, r2, r1;
@@ -6245,7 +6240,7 @@ static void decode_rr_accumulator(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_mov_tl(cpu_gpr_d[r3], cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_MOV_64:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             temp = tcg_temp_new();
 
             CHECK_REG_PAIR(r3);
@@ -6259,7 +6254,7 @@ static void decode_rr_accumulator(CPUTriCoreState *env, DisasContext *ctx)
         }
         break;
     case OPC2_32_RR_MOVS_64:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             CHECK_REG_PAIR(r3);
             tcg_gen_mov_tl(cpu_gpr_d[r3], cpu_gpr_d[r2]);
             tcg_gen_sari_tl(cpu_gpr_d[r3 + 1], cpu_gpr_d[r2], 31);
@@ -6389,7 +6384,7 @@ static void decode_rr_accumulator(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rr_logical_shift(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr_logical_shift(DisasContext *ctx)
 {
     uint32_t op2;
     int r3, r2, r1;
@@ -6467,7 +6462,7 @@ static void decode_rr_logical_shift(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp);
 }
 
-static void decode_rr_address(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr_address(DisasContext *ctx)
 {
     uint32_t op2, n;
     int r1, r2, r3;
@@ -6535,7 +6530,7 @@ static void decode_rr_address(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rr_idirect(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr_idirect(DisasContext *ctx)
 {
     uint32_t op2;
     int r1;
@@ -6566,7 +6561,7 @@ static void decode_rr_idirect(CPUTriCoreState *env, DisasContext *ctx)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr_divide(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -6588,7 +6583,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         break;
     case OPC2_32_RR_DVINIT_B:
         CHECK_REG_PAIR(r3);
-        gen_dvinit_b(env, cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1],
+        gen_dvinit_b(ctx, cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1],
                      cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_DVINIT_BU:
@@ -6599,7 +6594,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_shri_tl(temp3, cpu_gpr_d[r1], 8);
         /* reset av */
         tcg_gen_movi_tl(cpu_PSW_AV, 0);
-        if (!tricore_feature(env, TRICORE_FEATURE_131)) {
+        if (!tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
             /* overflow = (abs(D[r3+1]) >= abs(D[r2])) */
             tcg_gen_abs_tl(temp, temp3);
             tcg_gen_abs_tl(temp2, cpu_gpr_d[r2]);
@@ -6621,7 +6616,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         break;
     case OPC2_32_RR_DVINIT_H:
         CHECK_REG_PAIR(r3);
-        gen_dvinit_h(env, cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1],
+        gen_dvinit_h(ctx, cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1],
                      cpu_gpr_d[r2]);
         break;
     case OPC2_32_RR_DVINIT_HU:
@@ -6632,7 +6627,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_shri_tl(temp3, cpu_gpr_d[r1], 16);
         /* reset av */
         tcg_gen_movi_tl(cpu_PSW_AV, 0);
-        if (!tricore_feature(env, TRICORE_FEATURE_131)) {
+        if (!tricore_feature(ctx->env, TRICORE_FEATURE_131)) {
             /* overflow = (abs(D[r3+1]) >= abs(D[r2])) */
             tcg_gen_abs_tl(temp, temp3);
             tcg_gen_abs_tl(temp2, cpu_gpr_d[r2]);
@@ -6695,14 +6690,14 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         gen_unpack(cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1]);
         break;
     case OPC2_32_RR_CRC32:
-        if (tricore_feature(env, TRICORE_FEATURE_161)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_161)) {
             gen_helper_crc32(cpu_gpr_d[r3], cpu_gpr_d[r1], cpu_gpr_d[r2]);
         } else {
             generate_trap(ctx, TRAPC_INSN_ERR, TIN2_IOPC);
         }
         break;
     case OPC2_32_RR_DIV:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             GEN_HELPER_RR(divide, cpu_gpr_d[r3], cpu_gpr_d[r3+1], cpu_gpr_d[r1],
                           cpu_gpr_d[r2]);
         } else {
@@ -6710,7 +6705,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
         }
         break;
     case OPC2_32_RR_DIV_U:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             GEN_HELPER_RR(divide_u, cpu_gpr_d[r3], cpu_gpr_d[r3+1],
                           cpu_gpr_d[r1], cpu_gpr_d[r2]);
         } else {
@@ -6744,7 +6739,7 @@ static void decode_rr_divide(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RR1 Format */
-static void decode_rr1_mul(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr1_mul(DisasContext *ctx)
 {
     uint32_t op2;
 
@@ -6858,7 +6853,7 @@ static void decode_rr1_mul(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(n);
 }
 
-static void decode_rr1_mulq(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr1_mulq(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -6930,7 +6925,7 @@ static void decode_rr1_mulq(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RR2 format */
-static void decode_rr2_mul(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rr2_mul(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -6967,7 +6962,7 @@ static void decode_rr2_mul(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRPW format */
-static void decode_rrpw_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrpw_extract_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3;
@@ -7021,7 +7016,7 @@ static void decode_rrpw_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRR format */
-static void decode_rrr_cond_select(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr_cond_select(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3, r4;
@@ -7067,7 +7062,7 @@ static void decode_rrr_cond_select(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rrr_divide(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr_divide(DisasContext *ctx)
 {
     uint32_t op2;
 
@@ -7147,7 +7142,7 @@ static void decode_rrr_divide(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRR2 format */
-static void decode_rrr2_madd(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr2_madd(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4;
@@ -7199,7 +7194,7 @@ static void decode_rrr2_madd(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rrr2_msub(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr2_msub(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4;
@@ -7251,7 +7246,7 @@ static void decode_rrr2_msub(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRR1 format */
-static void decode_rrr1_madd(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_madd(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -7397,7 +7392,7 @@ static void decode_rrr1_madd(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rrr1_maddq_h(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_maddq_h(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -7416,19 +7411,19 @@ static void decode_rrr1_maddq_h(CPUTriCoreState *env, DisasContext *ctx)
     switch (op2) {
     case OPC2_32_RRR1_MADD_Q_32:
         gen_madd32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     cpu_gpr_d[r2], n, 32, env);
+                     cpu_gpr_d[r2], n, 32);
         break;
     case OPC2_32_RRR1_MADD_Q_64:
         CHECK_REG_PAIR(r4);
         CHECK_REG_PAIR(r3);
         gen_madd64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], cpu_gpr_d[r2],
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MADD_Q_32_L:
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r2]);
         gen_madd32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     temp, n, 16, env);
+                     temp, n, 16);
         break;
     case OPC2_32_RRR1_MADD_Q_64_L:
         CHECK_REG_PAIR(r4);
@@ -7436,12 +7431,12 @@ static void decode_rrr1_maddq_h(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r2]);
         gen_madd64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], temp,
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MADD_Q_32_U:
         tcg_gen_sari_tl(temp, cpu_gpr_d[r2], 16);
         gen_madd32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     temp, n, 16, env);
+                     temp, n, 16);
         break;
     case OPC2_32_RRR1_MADD_Q_64_U:
         CHECK_REG_PAIR(r4);
@@ -7449,7 +7444,7 @@ static void decode_rrr1_maddq_h(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_sari_tl(temp, cpu_gpr_d[r2], 16);
         gen_madd64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], temp,
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MADD_Q_32_LL:
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r1]);
@@ -7577,7 +7572,7 @@ static void decode_rrr1_maddq_h(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp2);
 }
 
-static void decode_rrr1_maddsu_h(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_maddsu_h(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -7735,7 +7730,7 @@ static void decode_rrr1_maddsu_h(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rrr1_msub(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_msub(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -7881,7 +7876,7 @@ static void decode_rrr1_msub(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_rrr1_msubq_h(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_msubq_h(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -7900,19 +7895,19 @@ static void decode_rrr1_msubq_h(CPUTriCoreState *env, DisasContext *ctx)
     switch (op2) {
     case OPC2_32_RRR1_MSUB_Q_32:
         gen_msub32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     cpu_gpr_d[r2], n, 32, env);
+                     cpu_gpr_d[r2], n, 32);
         break;
     case OPC2_32_RRR1_MSUB_Q_64:
         CHECK_REG_PAIR(r4);
         CHECK_REG_PAIR(r3);
         gen_msub64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], cpu_gpr_d[r2],
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MSUB_Q_32_L:
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r2]);
         gen_msub32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     temp, n, 16, env);
+                     temp, n, 16);
         break;
     case OPC2_32_RRR1_MSUB_Q_64_L:
         CHECK_REG_PAIR(r4);
@@ -7920,12 +7915,12 @@ static void decode_rrr1_msubq_h(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r2]);
         gen_msub64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], temp,
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MSUB_Q_32_U:
         tcg_gen_sari_tl(temp, cpu_gpr_d[r2], 16);
         gen_msub32_q(cpu_gpr_d[r4], cpu_gpr_d[r3], cpu_gpr_d[r1],
-                     temp, n, 16, env);
+                     temp, n, 16);
         break;
     case OPC2_32_RRR1_MSUB_Q_64_U:
         CHECK_REG_PAIR(r4);
@@ -7933,7 +7928,7 @@ static void decode_rrr1_msubq_h(CPUTriCoreState *env, DisasContext *ctx)
         tcg_gen_sari_tl(temp, cpu_gpr_d[r2], 16);
         gen_msub64_q(cpu_gpr_d[r4], cpu_gpr_d[r4+1], cpu_gpr_d[r3],
                      cpu_gpr_d[r3+1], cpu_gpr_d[r1], temp,
-                     n, env);
+                     n);
         break;
     case OPC2_32_RRR1_MSUB_Q_32_LL:
         tcg_gen_ext16s_tl(temp, cpu_gpr_d[r1]);
@@ -8061,7 +8056,7 @@ static void decode_rrr1_msubq_h(CPUTriCoreState *env, DisasContext *ctx)
     tcg_temp_free(temp2);
 }
 
-static void decode_rrr1_msubad_h(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrr1_msubad_h(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1, r2, r3, r4, n;
@@ -8220,7 +8215,7 @@ static void decode_rrr1_msubad_h(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRRR format */
-static void decode_rrrr_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrrr_extract_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3, r4;
@@ -8277,7 +8272,7 @@ static void decode_rrrr_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* RRRW format */
-static void decode_rrrw_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_rrrw_extract_insert(DisasContext *ctx)
 {
     uint32_t op2;
     int r1, r2, r3, r4;
@@ -8338,7 +8333,7 @@ static void decode_rrrw_extract_insert(CPUTriCoreState *env, DisasContext *ctx)
 }
 
 /* SYS Format*/
-static void decode_sys_interrupts(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_sys_interrupts(DisasContext *ctx)
 {
     uint32_t op2;
     uint32_t r1;
@@ -8399,7 +8394,7 @@ static void decode_sys_interrupts(CPUTriCoreState *env, DisasContext *ctx)
         gen_helper_svlcx(cpu_env);
         break;
     case OPC2_32_SYS_RESTORE:
-        if (tricore_feature(env, TRICORE_FEATURE_16)) {
+        if (tricore_feature(ctx->env, TRICORE_FEATURE_16)) {
             if ((ctx->hflags & TRICORE_HFLAG_KUU) == TRICORE_HFLAG_SM ||
                 (ctx->hflags & TRICORE_HFLAG_KUU) == TRICORE_HFLAG_UM1) {
                 tcg_gen_deposit_tl(cpu_ICR, cpu_ICR, cpu_gpr_d[r1], 8, 1);
@@ -8425,7 +8420,7 @@ static void decode_sys_interrupts(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
+static void decode_32Bit_opc(DisasContext *ctx)
 {
     int op1;
     int32_t r1, r2, r3;
@@ -8444,22 +8439,22 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     switch (op1) {
 /* ABS-format */
     case OPCM_32_ABS_LDW:
-        decode_abs_ldw(env, ctx);
+        decode_abs_ldw(ctx);
         break;
     case OPCM_32_ABS_LDB:
-        decode_abs_ldb(env, ctx);
+        decode_abs_ldb(ctx);
         break;
     case OPCM_32_ABS_LDMST_SWAP:
-        decode_abs_ldst_swap(env, ctx);
+        decode_abs_ldst_swap(ctx);
         break;
     case OPCM_32_ABS_LDST_CONTEXT:
-        decode_abs_ldst_context(env, ctx);
+        decode_abs_ldst_context(ctx);
         break;
     case OPCM_32_ABS_STORE:
-        decode_abs_store(env, ctx);
+        decode_abs_store(ctx);
         break;
     case OPCM_32_ABS_STOREB_H:
-        decode_abs_storeb_h(env, ctx);
+        decode_abs_storeb_h(ctx);
         break;
     case OPC1_32_ABS_STOREQ:
         address = MASK_OP_ABS_OFF18(ctx->opcode);
@@ -8519,44 +8514,44 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
 /* Bit-format */
     case OPCM_32_BIT_ANDACC:
-        decode_bit_andacc(env, ctx);
+        decode_bit_andacc(ctx);
         break;
     case OPCM_32_BIT_LOGICAL_T1:
-        decode_bit_logical_t(env, ctx);
+        decode_bit_logical_t(ctx);
         break;
     case OPCM_32_BIT_INSERT:
-        decode_bit_insert(env, ctx);
+        decode_bit_insert(ctx);
         break;
     case OPCM_32_BIT_LOGICAL_T2:
-        decode_bit_logical_t2(env, ctx);
+        decode_bit_logical_t2(ctx);
         break;
     case OPCM_32_BIT_ORAND:
-        decode_bit_orand(env, ctx);
+        decode_bit_orand(ctx);
         break;
     case OPCM_32_BIT_SH_LOGIC1:
-        decode_bit_sh_logic1(env, ctx);
+        decode_bit_sh_logic1(ctx);
         break;
     case OPCM_32_BIT_SH_LOGIC2:
-        decode_bit_sh_logic2(env, ctx);
+        decode_bit_sh_logic2(ctx);
         break;
     /* BO Format */
     case OPCM_32_BO_ADDRMODE_POST_PRE_BASE:
-        decode_bo_addrmode_post_pre_base(env, ctx);
+        decode_bo_addrmode_post_pre_base(ctx);
         break;
     case OPCM_32_BO_ADDRMODE_BITREVERSE_CIRCULAR:
-        decode_bo_addrmode_bitreverse_circular(env, ctx);
+        decode_bo_addrmode_bitreverse_circular(ctx);
         break;
     case OPCM_32_BO_ADDRMODE_LD_POST_PRE_BASE:
-        decode_bo_addrmode_ld_post_pre_base(env, ctx);
+        decode_bo_addrmode_ld_post_pre_base(ctx);
         break;
     case OPCM_32_BO_ADDRMODE_LD_BITREVERSE_CIRCULAR:
-        decode_bo_addrmode_ld_bitreverse_circular(env, ctx);
+        decode_bo_addrmode_ld_bitreverse_circular(ctx);
         break;
     case OPCM_32_BO_ADDRMODE_STCTX_POST_PRE_BASE:
-        decode_bo_addrmode_stctx_post_pre_base(env, ctx);
+        decode_bo_addrmode_stctx_post_pre_base(ctx);
         break;
     case OPCM_32_BO_ADDRMODE_LDMST_BITREVERSE_CIRCULAR:
-        decode_bo_addrmode_ldmst_bitreverse_circular(env, ctx);
+        decode_bo_addrmode_ldmst_bitreverse_circular(ctx);
         break;
 /* BOL-format */
     case OPC1_32_BOL_LD_A_LONGOFF:
@@ -8570,7 +8565,7 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     case OPC1_32_BOL_LD_HU_LONGOFF:
     case OPC1_32_BOL_ST_B_LONGOFF:
     case OPC1_32_BOL_ST_H_LONGOFF:
-        decode_bol_opc(env, ctx, op1);
+        decode_bol_opc(ctx, op1);
         break;
 /* BRC Format */
     case OPCM_32_BRC_EQ_NEQ:
@@ -8603,20 +8598,20 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
 /* RC Format */
     case OPCM_32_RC_LOGICAL_SHIFT:
-        decode_rc_logical_shift(env, ctx);
+        decode_rc_logical_shift(ctx);
         break;
     case OPCM_32_RC_ACCUMULATOR:
-        decode_rc_accumulator(env, ctx);
+        decode_rc_accumulator(ctx);
         break;
     case OPCM_32_RC_SERVICEROUTINE:
-        decode_rc_serviceroutine(env, ctx);
+        decode_rc_serviceroutine(ctx);
         break;
     case OPCM_32_RC_MUL:
-        decode_rc_mul(env, ctx);
+        decode_rc_mul(ctx);
         break;
 /* RCPW Format */
     case OPCM_32_RCPW_MASK_INSERT:
-        decode_rcpw_insert(env, ctx);
+        decode_rcpw_insert(ctx);
         break;
 /* RCRR Format */
     case OPC1_32_RCRR_INSERT:
@@ -8641,17 +8636,17 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
 /* RCRW Format */
     case OPCM_32_RCRW_MASK_INSERT:
-        decode_rcrw_insert(env, ctx);
+        decode_rcrw_insert(ctx);
         break;
 /* RCR Format */
     case OPCM_32_RCR_COND_SELECT:
-        decode_rcr_cond_select(env, ctx);
+        decode_rcr_cond_select(ctx);
         break;
     case OPCM_32_RCR_MADD:
-        decode_rcr_madd(env, ctx);
+        decode_rcr_madd(ctx);
         break;
     case OPCM_32_RCR_MSUB:
-        decode_rcr_msub(env, ctx);
+        decode_rcr_msub(ctx);
         break;
 /* RLC Format */
     case OPC1_32_RLC_ADDI:
@@ -8664,38 +8659,38 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     case OPC1_32_RLC_MOV_H:
     case OPC1_32_RLC_MOVH_A:
     case OPC1_32_RLC_MTCR:
-        decode_rlc_opc(env, ctx, op1);
+        decode_rlc_opc(ctx, op1);
         break;
 /* RR Format */
     case OPCM_32_RR_ACCUMULATOR:
-        decode_rr_accumulator(env, ctx);
+        decode_rr_accumulator(ctx);
         break;
     case OPCM_32_RR_LOGICAL_SHIFT:
-        decode_rr_logical_shift(env, ctx);
+        decode_rr_logical_shift(ctx);
         break;
     case OPCM_32_RR_ADDRESS:
-        decode_rr_address(env, ctx);
+        decode_rr_address(ctx);
         break;
     case OPCM_32_RR_IDIRECT:
-        decode_rr_idirect(env, ctx);
+        decode_rr_idirect(ctx);
         break;
     case OPCM_32_RR_DIVIDE:
-        decode_rr_divide(env, ctx);
+        decode_rr_divide(ctx);
         break;
 /* RR1 Format */
     case OPCM_32_RR1_MUL:
-        decode_rr1_mul(env, ctx);
+        decode_rr1_mul(ctx);
         break;
     case OPCM_32_RR1_MULQ:
-        decode_rr1_mulq(env, ctx);
+        decode_rr1_mulq(ctx);
         break;
 /* RR2 format */
     case OPCM_32_RR2_MUL:
-        decode_rr2_mul(env, ctx);
+        decode_rr2_mul(ctx);
         break;
 /* RRPW format */
     case OPCM_32_RRPW_EXTRACT_INSERT:
-        decode_rrpw_extract_insert(env, ctx);
+        decode_rrpw_extract_insert(ctx);
         break;
     case OPC1_32_RRPW_DEXTR:
         r1 = MASK_OP_RRPW_S1(ctx->opcode);
@@ -8714,48 +8709,48 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
         break;
 /* RRR Format */
     case OPCM_32_RRR_COND_SELECT:
-        decode_rrr_cond_select(env, ctx);
+        decode_rrr_cond_select(ctx);
         break;
     case OPCM_32_RRR_DIVIDE:
-        decode_rrr_divide(env, ctx);
+        decode_rrr_divide(ctx);
         break;
 /* RRR2 Format */
     case OPCM_32_RRR2_MADD:
-        decode_rrr2_madd(env, ctx);
+        decode_rrr2_madd(ctx);
         break;
     case OPCM_32_RRR2_MSUB:
-        decode_rrr2_msub(env, ctx);
+        decode_rrr2_msub(ctx);
         break;
 /* RRR1 format */
     case OPCM_32_RRR1_MADD:
-        decode_rrr1_madd(env, ctx);
+        decode_rrr1_madd(ctx);
         break;
     case OPCM_32_RRR1_MADDQ_H:
-        decode_rrr1_maddq_h(env, ctx);
+        decode_rrr1_maddq_h(ctx);
         break;
     case OPCM_32_RRR1_MADDSU_H:
-        decode_rrr1_maddsu_h(env, ctx);
+        decode_rrr1_maddsu_h(ctx);
         break;
     case OPCM_32_RRR1_MSUB_H:
-        decode_rrr1_msub(env, ctx);
+        decode_rrr1_msub(ctx);
         break;
     case OPCM_32_RRR1_MSUB_Q:
-        decode_rrr1_msubq_h(env, ctx);
+        decode_rrr1_msubq_h(ctx);
         break;
     case OPCM_32_RRR1_MSUBAD_H:
-        decode_rrr1_msubad_h(env, ctx);
+        decode_rrr1_msubad_h(ctx);
         break;
 /* RRRR format */
     case OPCM_32_RRRR_EXTRACT_INSERT:
-        decode_rrrr_extract_insert(env, ctx);
+        decode_rrrr_extract_insert(ctx);
         break;
 /* RRRW format */
     case OPCM_32_RRRW_EXTRACT_INSERT:
-        decode_rrrw_extract_insert(env, ctx);
+        decode_rrrw_extract_insert(ctx);
         break;
 /* SYS format */
     case OPCM_32_SYS_INTERRUPTS:
-        decode_sys_interrupts(env, ctx);
+        decode_sys_interrupts(ctx);
         break;
     case OPC1_32_SYS_RSTV:
         tcg_gen_movi_tl(cpu_PSW_V, 0);
@@ -8768,16 +8763,16 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     }
 }
 
-static void decode_opc(CPUTriCoreState *env, DisasContext *ctx, int *is_branch)
+static void decode_opc(DisasContext *ctx, int *is_branch)
 {
     /* 16-Bit Instruction */
     if ((ctx->opcode & 0x1) == 0) {
         ctx->pc_succ_insn = ctx->base.pc_next + 2;
-        decode_16Bit_opc(env, ctx);
+        decode_16Bit_opc(ctx);
     /* 32-Bit Instruction */
     } else {
         ctx->pc_succ_insn = ctx->base.pc_next + 4;
-        decode_32Bit_opc(env, ctx);
+        decode_32Bit_opc(ctx);
     }
 }
 
@@ -8794,6 +8789,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     ctx.base.singlestep_enabled = cs->singlestep_enabled;
     ctx.base.is_jmp = DISAS_NEXT;
     ctx.mem_idx = cpu_mmu_index(env, false);
+    ctx.env = env;
 
     tcg_clear_temp_count();
     gen_tb_start(tb);
@@ -8802,7 +8798,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
         num_insns++;
 
         ctx.opcode = cpu_ldl_code(env, ctx.base.pc_next);
-        decode_opc(env, &ctx, 0);
+        decode_opc(&ctx, 0);
 
         if (num_insns >= max_insns || tcg_op_buf_full()) {
             gen_save_pc(ctx.pc_succ_insn);
-- 
2.22.0


