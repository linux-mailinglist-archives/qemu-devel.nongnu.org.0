Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82A531571
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 20:11:44 +0200 (CEST)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntCWt-00048l-Du
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 14:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntCKB-0005xJ-C7; Mon, 23 May 2022 13:58:35 -0400
Received: from [187.72.171.209] (port=53435 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1ntCK9-0003ei-R4; Mon, 23 May 2022 13:58:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 23 May 2022 14:58:16 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7A78E801399;
 Mon, 23 May 2022 14:58:16 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH v2 05/11] target/ppc: Move mffs[.] to decodetree
Date: Mon, 23 May 2022 14:58:01 -0300
Message-Id: <20220523175807.59333-6-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523175807.59333-1-victor.colombo@eldorado.org.br>
References: <20220523175807.59333-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 23 May 2022 17:58:16.0944 (UTC)
 FILETIME=[AE06F700:01D86ECE]
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
 target/ppc/translate/fp-impl.c.inc | 35 +++++++++++++++---------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 68ea34d608..76bd9e4f57 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -97,6 +97,9 @@
 &X_tb           rt rb
 @X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
 
+&X_t_rc         rt rc:bool
+@X_t_rc         ...... rt:5 ..... ..... .......... rc:1         &X_t_rc
+
 &X_tb_rc        rt rb rc:bool
 @X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
 
@@ -323,6 +326,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
 ### Move To/From FPSCR
 
+MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index e602cbf0a5..24adf0ad15 100644
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
 static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
     TCGv_i64 fpscr = tcg_temp_new_i64();
@@ -634,6 +616,23 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
     tcg_temp_free_i64(fpscr_masked);
 }
 
+static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
+{
+    TCGv_i64 fpscr;
+
+    REQUIRE_FPU(ctx);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, UINT64_MAX);
+    if (a->rc) {
+        gen_set_cr1_from_fpscr(ctx);
+    }
+
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index f7ca1cc8b8..81640553e1 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -75,7 +75,6 @@ GEN_HANDLER_E(fcpsgn, 0x3F, 0x08, 0x00, 0x00000000, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
-GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.25.1


