Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C7E52A8B4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 18:57:48 +0200 (CEST)
Received: from localhost ([::1]:37918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr0Vw-0008Dq-UQ
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 12:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mo-0007bT-Kt; Tue, 17 May 2022 12:48:14 -0400
Received: from [187.72.171.209] (port=63178 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nr0Mm-0006ji-Tb; Tue, 17 May 2022 12:48:14 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 17 May 2022 13:48:01 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C0A6C801008;
 Tue, 17 May 2022 13:48:00 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND 03/10] target/ppc: Move mffsl to decodetree
Date: Tue, 17 May 2022 13:47:37 -0300
Message-Id: <20220517164744.58131-4-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
References: <20220517164744.58131-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 May 2022 16:48:01.0029 (UTC)
 FILETIME=[DEAAE350:01D86A0D]
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
 target/ppc/insn32.decode           |  4 ++++
 target/ppc/translate/fp-impl.c.inc | 27 ++++++++-------------------
 target/ppc/translate/fp-ops.c.inc  |  2 --
 3 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a6e1337c51..2cd5603353 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -94,6 +94,9 @@
 &X_tb           rt rb
 @X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
 
+&X_t            rt
+@X_t            ...... rt:5 ..... ..... .......... .            &X_t
+
 &X_t_rc         rt rc:bool
 @X_t_rc         ...... rt:5 ..... ..... .......... rc:1         &X_t_rc
 
@@ -321,6 +324,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 ### Move To/From FPSCR
 
 MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
+MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 
 ### Decimal Floating-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index e167f7a478..22b0605e24 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -607,7 +607,7 @@ static void gen_mffs(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-static void do_mffsc(int rt)
+static void do_mffsc(int rt, uint64_t set_mask)
 {
     TCGv_i64 fpscr;
 
@@ -615,6 +615,7 @@ static void do_mffsc(int rt)
 
     gen_reset_fpstatus();
     tcg_gen_extu_tl_i64(fpscr, cpu_fpscr);
+    tcg_gen_andi_i64(fpscr, fpscr, set_mask);
     set_fpr(rt, fpscr);
 
     tcg_temp_free_i64(fpscr);
@@ -624,7 +625,7 @@ static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
 {
     REQUIRE_FPU(ctx);
 
-    do_mffsc(a->rt);
+    do_mffsc(a->rt, 0xFFFFFFFFFFFFFFFFULL);
     if (a->rc) {
         gen_set_cr1_from_fpscr(ctx);
     }
@@ -632,26 +633,14 @@ static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
     return true;
 }
 
-/* mffsl */
-static void gen_mffsl(DisasContext *ctx)
+static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
-    TCGv_i64 t0;
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
 
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
+    do_mffsc(a->rt, FP_DRN | FP_STATUS | FP_ENABLES | FP_NI | FP_RN);
 
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    /* Mask everything except mode, status, and enables.  */
-    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_STATUS | FP_ENABLES | FP_RN);
-    set_fpr(rD(ctx->opcode), t0);
-    tcg_temp_free_i64(t0);
+    return true;
 }
 
 /* mffsce */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 7aa4011ef3..fe7dd1d1bb 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -77,8 +77,6 @@ GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
 GEN_HANDLER_E_2(mffsce, 0x3F, 0x07, 0x12, 0x01, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
-GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
-    PPC2_ISA300),
 GEN_HANDLER_E_2(mffscrn, 0x3F, 0x07, 0x12, 0x16, 0x00000000, PPC_FLOAT,
     PPC_NONE),
 GEN_HANDLER_E_2(mffscrni, 0x3F, 0x07, 0x12, 0x17, 0x00000000, PPC_FLOAT,
-- 
2.25.1


