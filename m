Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CBB5AD343
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:53:47 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBbm-0004Mf-VL
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVBMq-0004XC-CD; Mon, 05 Sep 2022 08:38:20 -0400
Received: from [200.168.210.66] (port=8387 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1oVBMo-0005xB-Nd; Mon, 05 Sep 2022 08:38:20 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 5 Sep 2022 09:38:04 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BED08800476;
 Mon,  5 Sep 2022 09:38:03 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
Subject: [PATCH 2/3] target/ppc: Move fsqrts to decodetree
Date: Mon,  5 Sep 2022 09:37:45 -0300
Message-Id: <20220905123746.54659-3-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
References: <20220905123746.54659-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Sep 2022 12:38:04.0190 (UTC)
 FILETIME=[57B51BE0:01D8C124]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 target/ppc/insn32.decode           |  1 +
 target/ppc/translate/fp-impl.c.inc | 23 +----------------------
 target/ppc/translate/fp-ops.c.inc  |  1 -
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index b55d1550f3..7eb808a43f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -359,6 +359,7 @@ STFDUX          011111 ..... ...... .... 1011110111 -   @X
 ### Floating-Point Arithmetic Instructions
 
 FSQRT           111111 ..... ----- ..... ----- 10110 .  @A_tb
+FSQRTS          111011 ..... ----- ..... ----- 10110 .  @A_tb
 
 ### Floating-Point Select Instruction
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index e8359af005..7a90c0e350 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -281,28 +281,7 @@ static bool do_helper_fsqrt(DisasContext *ctx, arg_A_tb *a,
 }
 
 TRANS(FSQRT, do_helper_fsqrt, gen_helper_fsqrt);
-
-static void gen_fsqrts(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-    TCGv_i64 t1;
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    t1 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    get_fpr(t0, rB(ctx->opcode));
-    gen_helper_fsqrts(t1, cpu_env, t0);
-    set_fpr(rD(ctx->opcode), t1);
-    gen_compute_fprf_float64(t1);
-    if (unlikely(Rc(ctx->opcode) != 0)) {
-        gen_set_cr1_from_fpscr(ctx);
-    }
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
-}
+TRANS(FSQRTS, do_helper_fsqrt, gen_helper_fsqrts);
 
 /***                     Floating-Point multiply-and-add                   ***/
 /* fmadd - fmadds */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 38759f5939..d4c6c4bed1 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -62,7 +62,6 @@ GEN_HANDLER_E(stfdepx, 0x1F, 0x1F, 0x16, 0x00000001, PPC_NONE, PPC2_BOOKE206),
 GEN_HANDLER_E(stfdpx, 0x1F, 0x17, 0x1C, 0x00200001, PPC_NONE, PPC2_ISA205),
 
 GEN_HANDLER(frsqrtes, 0x3B, 0x1A, 0xFF, 0x001F07C0, PPC_FLOAT_FRSQRTES),
-GEN_HANDLER(fsqrts, 0x3B, 0x16, 0xFF, 0x001F07C0, PPC_FLOAT_FSQRT),
 GEN_HANDLER(fcmpo, 0x3F, 0x00, 0x01, 0x00600001, PPC_FLOAT),
 GEN_HANDLER(fcmpu, 0x3F, 0x00, 0x00, 0x00600001, PPC_FLOAT),
 GEN_HANDLER(fabs, 0x3F, 0x08, 0x08, 0x001F0000, PPC_FLOAT),
-- 
2.25.1


