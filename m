Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13F5605EE
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:34:42 +0200 (CEST)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aeH-0006b5-Gn
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6aaI-00035C-Sf; Wed, 29 Jun 2022 12:30:35 -0400
Received: from [200.168.210.66] (port=46224 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1o6aaH-0000DA-B3; Wed, 29 Jun 2022 12:30:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 29 Jun 2022 13:29:11 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 72592800502;
 Wed, 29 Jun 2022 13:29:11 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br
Subject: [PATCH v3 05/11] target/ppc: Move mffs[.] to decodetree
Date: Wed, 29 Jun 2022 13:28:58 -0300
Message-Id: <20220629162904.105060-6-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
References: <20220629162904.105060-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Jun 2022 16:29:11.0873 (UTC)
 FILETIME=[5D669B10:01D88BD5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
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
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode           |  4 ++++
 target/ppc/translate/fp-impl.c.inc | 35 +++++++++++++++---------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6d3b98a127..736a7c6f3f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -100,6 +100,9 @@
 &X_tb           rt rb
 @X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
 
+&X_t_rc         rt rc:bool
+@X_t_rc         ...... rt:5 ..... ..... .......... rc:1         &X_t_rc
+
 &X_tb_rc        rt rb rc:bool
 @X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
 
@@ -342,6 +345,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
 ### Move To/From FPSCR
 
+MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 4f4d57c611..d6231358f8 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -615,24 +615,6 @@ static void gen_mcrfs(DisasContext *ctx)
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
@@ -660,6 +642,23 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
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
index f8c35124ae..1b65f5ab73 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -74,7 +74,6 @@ GEN_HANDLER_E(fcpsgn, 0x3F, 0x08, 0x00, 0x00000000, PPC_NONE, PPC2_ISA205),
 GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
-GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.25.1


