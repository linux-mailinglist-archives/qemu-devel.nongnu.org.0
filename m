Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE749345551
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:09:30 +0100 (CET)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWU5-00045X-Rb
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWLC-0003Ki-Hj
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:18 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWL9-0006vy-LO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 22:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464815; x=1648000815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TNfZPyDFekoOK3g9jUros8f9G/7SOUpQtng8jnIX0Bk=;
 b=an6wkyUdB1lo6qZRvl8PlaWiJLd8P9ZFsNSTQawhkXaCv4pk2MXuM0Pt
 EI7QCn1cd5zNocWiexSqAf/ZuH/soJEY4zGV5a8EyQkdfY/MeXkz3iZJk
 z3z9lwcwolQ94ictI3aSm1ylDwKVyYPBTJFUMbO8jKwX5SHFPfYEf/8Hf
 XqS1h2njCFSAcTkKXUBVBfc9xCEQWIcu3KXeZxi504J5BULRE2GfagQDa
 UNDI5HAOcuAQPqB/vT4L1bQ3pIwRJwcUBAGsPednHcCW8Pbl1AwQXzyXn
 h4loR307oJKcZML6nQq3+B0v0j/D61M6aBYjcIv40FbM+VvfcURg+/WIG Q==;
IronPort-SDR: Eqf5vAHkl+Z2coKQN7EklffjPQSVsBjsY8lISt3RA/zg19WbzeK4hV3hf5YBxkp1i+adjwimkC
 VS9lBI9fQ5XuPbhKjE408AJSGpO7O4rtH51JFsRZREGqKtKUiG1HuY53APuW7ZImiJujYYNDL8
 TwVGiTcldU7Eeb9unSIaPFqlx5tcbCyd5T006/LBOvGeqWXEcSwGUym1+eluKkeTnyj/0Ijyes
 ewMrXWJedf6EcIZCC9TNWaRGoON1hu3cgybRB6k1Ta/tSNYuWMkjftVwwShcWIXeJ3FlqI7Or9
 GqY=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707651"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:43 +0800
IronPort-SDR: bXp2WMB7n/YrCrJgvRfvmPCqMvckd6wJT5bLmUbEEy0tRLc374JTOQMA8qw7PLk2gJEwVeCQ/D
 lQDjNApzCeYSOksgBOTv6b5KXpbu2xJhLTmfeEV6E2/7aRn/0MiY2+jdAK7FK0eXSGnOUj+c1W
 nzClXSlJBQxmPOCnCpkQAwwebw/7T9C7zuBLNw9xJx0OaoBvSM6Eab+149mmKEbyUVBJoBwwhm
 N32aVc15ZPAhqDRL6ns3Pc/uD6YjfO200oTKIrNH6sFjVWlb1PZHueqkf4w8OiOGpULkNUmjFn
 mdVKF8vLd6BQg1tLqdsVsYt9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:51 -0700
IronPort-SDR: 8SpmuZWcSRmM46oi//b0EiwaCT2jWwaAtmFAnv/heqqecC1FquROhef6zeSQgYg53GM4O3nvfO
 kclDace5veUYE71R1BfsAIkUA7VUa65djKBAsPJ34wMn2Kxg4Pxo4JI9o75U0QAkDEFK8c3eTz
 9GsyD0mfJNQMt9CnqmoxKdYEDeDFFvm58bt0+ksOROfW0hr5NwxT4t+Jhd3q1sJ44skUD9VqAi
 GIRCeWsiSmvzXfNlhNDPPneS9ZftHc0Un2uQvBqjnpqRe5A77xeRXIBsTl2eCxWkzTRU3fPF3c
 7EI=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:43 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 16/16] target/riscv: Prevent lost illegal instruction exceptions
Date: Mon, 22 Mar 2021 21:57:56 -0400
Message-Id: <20210323015756.3168650-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

When decode_insn16() fails, we fall back to decode_RV32_64C() for
further compressed instruction decoding. However, prior to this change,
we did not raise an illegal instruction exception, if decode_RV32_64C()
fails to decode the instruction. This means that we skipped illegal
compressed instructions instead of raising an illegal instruction
exception.

Instead of patching decode_RV32_64C(), we can just remove it,
as it is dead code since f330433b363 anyway.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210322121609.3097928-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 179 +--------------------------------------
 1 file changed, 1 insertion(+), 178 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 0f28b5f41e..2f9f5ccc62 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -67,20 +67,6 @@ typedef struct DisasContext {
     CPUState *cs;
 } DisasContext;
 
-#ifdef TARGET_RISCV64
-/* convert riscv funct3 to qemu memop for load/store */
-static const int tcg_memop_lookup[8] = {
-    [0 ... 7] = -1,
-    [0] = MO_SB,
-    [1] = MO_TESW,
-    [2] = MO_TESL,
-    [3] = MO_TEQ,
-    [4] = MO_UB,
-    [5] = MO_TEUW,
-    [6] = MO_TEUL,
-};
-#endif
-
 #ifdef TARGET_RISCV64
 #define CASE_OP_32_64(X) case X: case glue(X, W)
 #else
@@ -374,48 +360,6 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
-#ifdef TARGET_RISCV64
-static void gen_load_c(DisasContext *ctx, uint32_t opc, int rd, int rs1,
-        target_long imm)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
-
-    if (memop < 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, memop);
-    gen_set_gpr(rd, t1);
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
-static void gen_store_c(DisasContext *ctx, uint32_t opc, int rs1, int rs2,
-        target_long imm)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv dat = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-    gen_get_gpr(dat, rs2);
-    int memop = tcg_memop_lookup[(opc >> 12) & 0x7];
-
-    if (memop < 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    tcg_gen_qemu_st_tl(dat, t0, ctx->mem_idx, memop);
-    tcg_temp_free(t0);
-    tcg_temp_free(dat);
-}
-#endif
-
 #ifndef CONFIG_USER_ONLY
 /* The states of mstatus_fs are:
  * 0 = disabled, 1 = initial, 2 = clean, 3 = dirty
@@ -447,83 +391,6 @@ static void mark_fs_dirty(DisasContext *ctx)
 static inline void mark_fs_dirty(DisasContext *ctx) { }
 #endif
 
-#if !defined(TARGET_RISCV64)
-static void gen_fp_load(DisasContext *ctx, uint32_t opc, int rd,
-        int rs1, target_long imm)
-{
-    TCGv t0;
-
-    if (ctx->mstatus_fs == 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    t0 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-
-    switch (opc) {
-    case OPC_RISC_FLW:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEUL);
-        /* RISC-V requires NaN-boxing of narrower width floating point values */
-        tcg_gen_ori_i64(cpu_fpr[rd], cpu_fpr[rd], 0xffffffff00000000ULL);
-        break;
-    case OPC_RISC_FLD:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_ld_i64(cpu_fpr[rd], t0, ctx->mem_idx, MO_TEQ);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-    tcg_temp_free(t0);
-
-    mark_fs_dirty(ctx);
-}
-
-static void gen_fp_store(DisasContext *ctx, uint32_t opc, int rs1,
-        int rs2, target_long imm)
-{
-    TCGv t0;
-
-    if (ctx->mstatus_fs == 0) {
-        gen_exception_illegal(ctx);
-        return;
-    }
-
-    t0 = tcg_temp_new();
-    gen_get_gpr(t0, rs1);
-    tcg_gen_addi_tl(t0, t0, imm);
-
-    switch (opc) {
-    case OPC_RISC_FSW:
-        if (!has_ext(ctx, RVF)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEUL);
-        break;
-    case OPC_RISC_FSD:
-        if (!has_ext(ctx, RVD)) {
-            goto do_illegal;
-        }
-        tcg_gen_qemu_st_i64(cpu_fpr[rs2], t0, ctx->mem_idx, MO_TEQ);
-        break;
-    do_illegal:
-    default:
-        gen_exception_illegal(ctx);
-        break;
-    }
-
-    tcg_temp_free(t0);
-}
-#endif
-
 static void gen_set_rm(DisasContext *ctx, int rm)
 {
     TCGv_i32 t0;
@@ -537,49 +404,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     tcg_temp_free_i32(t0);
 }
 
-static void decode_RV32_64C0(DisasContext *ctx, uint16_t opcode)
-{
-    uint8_t funct3 = extract16(opcode, 13, 3);
-    uint8_t rd_rs2 = GET_C_RS2S(opcode);
-    uint8_t rs1s = GET_C_RS1S(opcode);
-
-    switch (funct3) {
-    case 3:
-#if defined(TARGET_RISCV64)
-        /* C.LD(RV64/128) -> ld rd', offset[7:3](rs1')*/
-        gen_load_c(ctx, OPC_RISC_LD, rd_rs2, rs1s,
-                 GET_C_LD_IMM(opcode));
-#else
-        /* C.FLW (RV32) -> flw rd', offset[6:2](rs1')*/
-        gen_fp_load(ctx, OPC_RISC_FLW, rd_rs2, rs1s,
-                    GET_C_LW_IMM(opcode));
-#endif
-        break;
-    case 7:
-#if defined(TARGET_RISCV64)
-        /* C.SD (RV64/128) -> sd rs2', offset[7:3](rs1')*/
-        gen_store_c(ctx, OPC_RISC_SD, rs1s, rd_rs2,
-                  GET_C_LD_IMM(opcode));
-#else
-        /* C.FSW (RV32) -> fsw rs2', offset[6:2](rs1')*/
-        gen_fp_store(ctx, OPC_RISC_FSW, rs1s, rd_rs2,
-                     GET_C_LW_IMM(opcode));
-#endif
-        break;
-    }
-}
-
-static void decode_RV32_64C(DisasContext *ctx, uint16_t opcode)
-{
-    uint8_t op = extract16(opcode, 0, 2);
-
-    switch (op) {
-    case 0:
-        decode_RV32_64C0(ctx, opcode);
-        break;
-    }
-}
-
 static int ex_plus_1(DisasContext *ctx, int nf)
 {
     return nf + 1;
@@ -779,8 +603,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
         } else {
             ctx->pc_succ_insn = ctx->base.pc_next + 2;
             if (!decode_insn16(ctx, opcode)) {
-                /* fall back to old decoder */
-                decode_RV32_64C(ctx, opcode);
+                gen_exception_illegal(ctx);
             }
         }
     } else {
-- 
2.30.1


