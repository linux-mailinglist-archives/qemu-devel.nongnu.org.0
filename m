Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A761D546C70
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:34:49 +0200 (CEST)
Received: from localhost ([::1]:46384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjT6-0003XI-PK
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJa-0000iw-B9; Fri, 10 Jun 2022 14:24:58 -0400
Received: from [187.72.171.209] (port=48290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJY-0003eJ-GH; Fri, 10 Jun 2022 14:24:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 56675801399;
 Fri, 10 Jun 2022 15:23:42 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND v2 02/11] target/ppc: Move mffscrn[i] to decodetree
Date: Fri, 10 Jun 2022 15:23:01 -0300
Message-Id: <20220610182310.68715-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:42.0571 (UTC)
 FILETIME=[36CEABB0:01D87CF7]
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
 target/ppc/insn32.decode           |  8 +++
 target/ppc/internal.h              |  3 --
 target/ppc/translate/fp-impl.c.inc | 83 +++++++++++++++---------------
 target/ppc/translate/fp-ops.c.inc  |  4 --
 4 files changed, 50 insertions(+), 48 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 532a478dcb..f4b007fe6a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -124,6 +124,9 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 . l:1 ra:5 rb:5 .......... .        &X_bfl
 
+&X_imm2         rt imm
+@X_imm2         ...... rt:5 ..... ... imm:2 .......... .        &X_imm2
+
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
 @X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
@@ -334,6 +337,11 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Move To/From FPSCR
+
+MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+
 ### Decimal Floating-Point Arithmetic Instructions
 
 DADD            111011 ..... ..... ..... 0000000010 .   @X_rc
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 2add128cd1..467f3046c8 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -159,9 +159,6 @@ EXTRACT_HELPER(FPL, 25, 1);
 EXTRACT_HELPER(FPFLM, 17, 8);
 EXTRACT_HELPER(FPW, 16, 1);
 
-/* mffscrni */
-EXTRACT_HELPER(RM, 11, 2);
-
 /* addpcis */
 EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 #if defined(TARGET_PPC64)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index f9b58b844e..bcb7ec2689 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -685,71 +685,72 @@ static void gen_mffsce(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-static void gen_helper_mffscrn(DisasContext *ctx, TCGv_i64 t1)
+static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i32 mask = tcg_const_i32(0x0001);
+    TCGv_i64 fpscr = tcg_temp_new_i64();
+    TCGv_i64 fpscr_masked = tcg_temp_new_i64();
 
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_ENABLES | FP_RN);
-    set_fpr(rD(ctx->opcode), t0);
+    tcg_gen_extu_tl_i64(fpscr, cpu_fpscr);
+    tcg_gen_andi_i64(fpscr_masked, fpscr, mask);
+    set_fpr(rt, fpscr_masked);
 
-    /* Mask FPSCR value to clear RN.  */
-    tcg_gen_andi_i64(t0, t0, ~FP_RN);
+    tcg_temp_free_i64(fpscr_masked);
 
-    /* Merge RN into FPSCR value.  */
-    tcg_gen_or_i64(t0, t0, t1);
+    return fpscr;
+}
 
-    gen_helper_store_fpscr(cpu_env, t0, mask);
+static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
+                               TCGv_i64 set_mask, uint32_t store_mask)
+{
+    TCGv_i64 fpscr_masked = tcg_temp_new_i64();
+    TCGv_i32 st_mask = tcg_constant_i32(store_mask);
 
-    tcg_temp_free_i32(mask);
-    tcg_temp_free_i64(t0);
+    tcg_gen_andi_i64(fpscr_masked, fpscr, ~clear_mask);
+    tcg_gen_or_i64(fpscr_masked, fpscr_masked, set_mask);
+    gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
+
+    tcg_temp_free_i64(fpscr_masked);
 }
 
-/* mffscrn */
-static void gen_mffscrn(DisasContext *ctx)
+static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
-    TCGv_i64 t1;
+    TCGv_i64 t1, fpscr;
 
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
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
 
     tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
 }
 
-/* mffscrni */
-static void gen_mffscrni(DisasContext *ctx)
+static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
-    TCGv_i64 t1;
-
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
+    TCGv_i64 t1, fpscr;
 
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
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
 
     tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
 }
 
 /* mtfsb0 */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 0538ab2d2d..a27a1be9f5 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -79,10 +79,6 @@ GEN_HANDLER_E_2(mffsce, 0x3F, 0x07, 0x12, 0x01, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
 GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
-GEN_HANDLER_E_2(mffscrn, 0x3F, 0x07, 0x12, 0x16, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
-GEN_HANDLER_E_2(mffscrni, 0x3F, 0x07, 0x12, 0x17, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.25.1


