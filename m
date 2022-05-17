Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A852A8A2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:54:51 +0200 (CEST)
Received: from localhost ([::1]:59118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0T2-000339-Q2
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mw-00081k-FC; Tue, 17 May 2022 12:48:22 -0400
Received: from [187.72.171.209] (port=63178 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mu-0006ji-HV; Tue, 17 May 2022 12:48:22 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:48:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id F1F01800C32;
 Tue, 17 May 2022 13:48:00 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND 05/10] target/ppc: Move mffscrn[i] to decodetree
Date: Tue, 17 May 2022 13:47:39 -0300
Message-Id: <20220517164744.58131-6-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:48:01.0279 (UTC)
 FILETIME=[DED108F0:01D86A0D]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/insn32.decode           |  5 ++
 target/ppc/internal.h              |  3 --
 target/ppc/translate/fp-impl.c.inc | 80 ++++++------------------------
 target/ppc/translate/fp-ops.c.inc  |  4 --
 4 files changed, 20 insertions(+), 72 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a8535e5684..682990b7f0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -127,6 +127,9 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 . l:1 ra:5 rb:5 .......... .        &X_bfl
 
+&X_imm2         rt imm
+@X_imm2         ...... rt:5 ..... ... imm:2 .......... .        &X_imm2
+
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
 @X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
@@ -326,6 +329,8 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
+MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
 
 ### Decimal Floating-Point Arithmetic Instructions
 
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 8094e0b033..157cc0de3b 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -157,9 +157,6 @@ EXTRACT_HELPER(FPL, 25, 1);
 EXTRACT_HELPER(FPFLM, 17, 8);
 EXTRACT_HELPER(FPW, 16, 1);
 
-/* mffscrni */
-EXTRACT_HELPER(RM, 11, 2);
-
 /* addpcis */
 EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 #if defined(TARGET_PPC64)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 4520edc439..b294e286fb 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -589,24 +589,6 @@ static void gen_mcrfs(DisasContext *ctx)
     tcg_temp_free_i64(tnew_fpscr);
 }
 
-/* mffs */
-static void gen_mffs(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    set_fpr(rD(ctx->opcode), t0);
-    if (unlikely(Rc(ctx->opcode))) {
-        gen_set_cr1_from_fpscr(ctx);
-    }
-    tcg_temp_free_i64(t0);
-}
-
 static void do_mffsc(int rt, TCGv_i64 t1, uint64_t set_mask,
                      uint64_t clear_mask, uint32_t fpscr_mask)
 {
@@ -662,71 +644,39 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
     return true;
 }
 
-static void gen_helper_mffscrn(DisasContext *ctx, TCGv_i64 t1)
-{
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i32 mask = tcg_const_i32(0x0001);
-
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_ENABLES | FP_RN);
-    set_fpr(rD(ctx->opcode), t0);
-
-    /* Mask FPSCR value to clear RN.  */
-    tcg_gen_andi_i64(t0, t0, ~FP_RN);
-
-    /* Merge RN into FPSCR value.  */
-    tcg_gen_or_i64(t0, t0, t1);
-
-    gen_helper_store_fpscr(cpu_env, t0, mask);
-
-    tcg_temp_free_i32(mask);
-    tcg_temp_free_i64(t0);
-}
-
-/* mffscrn */
-static void gen_mffscrn(DisasContext *ctx)
+static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1;
 
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
-
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
-    get_fpr(t1, rB(ctx->opcode));
-    /* Mask FRB to get just RN.  */
+    get_fpr(t1, a->rb);
     tcg_gen_andi_i64(t1, t1, FP_RN);
 
-    gen_helper_mffscrn(ctx, t1);
+    do_mffsc(a->rt, t1, FP_DRN | FP_ENABLES | FP_NI | FP_RN, ~FP_RN, 0x0001);
 
     tcg_temp_free_i64(t1);
+
+    return true;
 }
 
-/* mffscrni */
-static void gen_mffscrni(DisasContext *ctx)
+static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1;
 
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
-
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
 
-    t1 = tcg_const_i64((uint64_t)RM(ctx->opcode));
+    t1 = tcg_temp_new_i64();
+    tcg_gen_movi_i64(t1, a->imm);
 
-    gen_helper_mffscrn(ctx, t1);
+    do_mffsc(a->rt, t1, FP_DRN | FP_ENABLES | FP_NI | FP_RN, ~FP_RN, 0x0001);
 
     tcg_temp_free_i64(t1);
+
+    return true;
 }
 
 /* mtfsb0 */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 46357a3c4c..81640553e1 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -75,10 +75,6 @@ GEN_HANDLER_E(fcpsgn, 0x3F, 0x08, 0x00, 0x00000000, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
-GEN_HANDLER_E_2(mffscrn, 0x3F, 0x07, 0x12, 0x16, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
-GEN_HANDLER_E_2(mffscrni, 0x3F, 0x07, 0x12, 0x17, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.25.1


