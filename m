Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6440436CA9A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 19:50:21 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbRqm-0001zN-4g
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 13:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRME-0001yn-TC; Tue, 27 Apr 2021 13:18:46 -0400
Received: from [201.28.113.2] (port=48284 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luis.pires@eldorado.org.br>)
 id 1lbRMD-00023I-96; Tue, 27 Apr 2021 13:18:46 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 27 Apr 2021 14:16:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 1302780139F;
 Tue, 27 Apr 2021 14:16:54 -0300 (-03)
From: Luis Pires <luis.pires@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 12/15] target/ppc: Implement prefixed integer load
 instructions
Date: Tue, 27 Apr 2021 14:16:46 -0300
Message-Id: <20210427171649.364699-13-luis.pires@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210427171649.364699-1-luis.pires@eldorado.org.br>
References: <20210427171649.364699-1-luis.pires@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Apr 2021 17:16:54.0293 (UTC)
 FILETIME=[1EBC3C50:01D73B89]
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/insn64.decode                   | 15 ++++++
 target/ppc/translate/fixedpoint-impl.c.inc | 60 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9bef32a845..2e08d89e62 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -26,6 +26,21 @@
                 ...... rt:5 ra:5 ................       \
                 &PLS_D si=%pls_si
 
+### Fixed-Point Load Instructions
+
+PLBZ            000001 10 0--.-- .................. \
+                100010 ..... ..... ................     @PLS_D
+PLHZ            000001 10 0--.-- .................. \
+                101000 ..... ..... ................     @PLS_D
+PLHA            000001 10 0--.-- .................. \
+                101010 ..... ..... ................     @PLS_D
+PLWZ            000001 10 0--.-- .................. \
+                100000 ..... ..... ................     @PLS_D
+PLWA            000001 00 0--.-- .................. \
+                101001 ..... ..... ................     @PLS_D
+PLD             000001 00 0--.-- .................. \
+                111001 ..... ..... ................     @PLS_D
+
 ### Fixed-Point Arithmetic Instructions
 
 PADDI           000001 10 0--.-- ..................     \
diff --git a/target/ppc/translate/fixedpoint-impl.c.inc b/target/ppc/translate/fixedpoint-impl.c.inc
index e15e379931..80f849fc4a 100644
--- a/target/ppc/translate/fixedpoint-impl.c.inc
+++ b/target/ppc/translate/fixedpoint-impl.c.inc
@@ -218,6 +218,66 @@ static bool trans_LDUX(DisasContext *ctx, arg_X *a)
     return do_ldst_X(ctx, a, true, false, MO_Q);
 }
 
+static bool do_ldst_PLS_D(DisasContext *ctx, arg_PLS_D *a,
+                          bool store, MemOp mop)
+{
+    TCGv ea;
+
+    if (!resolve_PLS_D(ctx, a)) {
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
+    tcg_temp_free(ea);
+
+    return true;
+}
+
+static bool trans_PLBZ(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_UB);
+}
+
+static bool trans_PLHZ(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_UW);
+}
+
+static bool trans_PLHA(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_SW);
+}
+
+static bool trans_PLWZ(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_UL);
+}
+
+static bool trans_PLWA(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_SL);
+}
+
+static bool trans_PLD(DisasContext *ctx, arg_PLS_D *a)
+{
+    return do_ldst_PLS_D(ctx, a, false, MO_Q);
+}
+
 static bool trans_ADDI(DisasContext *ctx, arg_D *a)
 {
     if (a->ra) {
-- 
2.25.1


