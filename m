Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC249B578
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:58:21 +0100 (CET)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMKy-0006bg-V8
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:58:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAz-0001gJ-N7; Tue, 25 Jan 2022 07:43:57 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAw-0007RA-9I; Tue, 25 Jan 2022 07:43:56 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9CD458009AB;
 Tue, 25 Jan 2022 09:20:41 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 22/38] target/ppc: Move xxpermdi to decodetree
Date: Tue, 25 Jan 2022 09:19:27 -0300
Message-Id: <20220125121943.3269077-23-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:41.0981 (UTC)
 FILETIME=[F86262D0:01D811E5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  4 ++
 target/ppc/translate/vsx-impl.c.inc | 71 +++++++++++++----------------
 target/ppc/translate/vsx-ops.c.inc  |  2 -
 3 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39fdcb943c..8f0627c529 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -155,6 +155,9 @@
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
+&XX3_dm         xt xa xb dm
+@XX3_dm         ...... ..... ..... ..... . dm:2 ..... ...       &XX3_dm xt=%xx_xt xa=%xx_xa xb=%xx_xb
+
 &XX4            xt xa xb xc
 @XX4            ...... ..... ..... ..... ..... .. ....          &XX4 xt=%xx_xt xa=%xx_xa xb=%xx_xb xc=%xx_xc
 
@@ -546,6 +549,7 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
 
 XXPERM          111100 ..... ..... ..... 00011010 ...   @XX3
 XXPERMR         111100 ..... ..... ..... 00111010 ...   @XX3
+XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
 
 XXSEL           111100 ..... ..... ..... ..... 11 ....  @XX4
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 43e52ee3f8..fcee930024 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -665,45 +665,6 @@ static void gen_mtvsrws(DisasContext *ctx)
 
 #endif
 
-static void gen_xxpermdi(DisasContext *ctx)
-{
-    TCGv_i64 xh, xl;
-
-    if (unlikely(!ctx->vsx_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VSXU);
-        return;
-    }
-
-    xh = tcg_temp_new_i64();
-    xl = tcg_temp_new_i64();
-
-    if (unlikely((xT(ctx->opcode) == xA(ctx->opcode)) ||
-                 (xT(ctx->opcode) == xB(ctx->opcode)))) {
-        get_cpu_vsr(xh, xA(ctx->opcode), (DM(ctx->opcode) & 2) == 0);
-        get_cpu_vsr(xl, xB(ctx->opcode), (DM(ctx->opcode) & 1) == 0);
-
-        set_cpu_vsr(xT(ctx->opcode), xh, true);
-        set_cpu_vsr(xT(ctx->opcode), xl, false);
-    } else {
-        if ((DM(ctx->opcode) & 2) == 0) {
-            get_cpu_vsr(xh, xA(ctx->opcode), true);
-            set_cpu_vsr(xT(ctx->opcode), xh, true);
-        } else {
-            get_cpu_vsr(xh, xA(ctx->opcode), false);
-            set_cpu_vsr(xT(ctx->opcode), xh, true);
-        }
-        if ((DM(ctx->opcode) & 1) == 0) {
-            get_cpu_vsr(xl, xB(ctx->opcode), true);
-            set_cpu_vsr(xT(ctx->opcode), xl, false);
-        } else {
-            get_cpu_vsr(xl, xB(ctx->opcode), false);
-            set_cpu_vsr(xT(ctx->opcode), xl, false);
-        }
-    }
-    tcg_temp_free_i64(xh);
-    tcg_temp_free_i64(xl);
-}
-
 #define OP_ABS 1
 #define OP_NABS 2
 #define OP_NEG 3
@@ -1239,6 +1200,38 @@ static bool trans_XXPERMR(DisasContext *ctx, arg_XX3 *a)
     return true;
 }
 
+static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
+{
+    TCGv_i64 t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
+
+    t0 = tcg_temp_new_i64();
+
+    if (unlikely(a->xt == a->xa || a->xt == a->xb)) {
+        t1 = tcg_temp_new_i64();
+
+        get_cpu_vsr(t0, a->xa, (a->dm & 2) == 0);
+        get_cpu_vsr(t1, a->xb, (a->dm & 1) == 0);
+
+        set_cpu_vsr(a->xt, t0, true);
+        set_cpu_vsr(a->xt, t1, false);
+
+        tcg_temp_free_i64(t1);
+    } else {
+        get_cpu_vsr(t0, a->xa, (a->dm & 2) == 0);
+        set_cpu_vsr(a->xt, t0, true);
+
+        get_cpu_vsr(t0, a->xb, (a->dm & 1) == 0);
+        set_cpu_vsr(a->xt, t0, false);
+    }
+
+    tcg_temp_free_i64(t0);
+
+    return true;
+}
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 86ed1a996a..0a6b2b31ac 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -344,5 +344,3 @@ GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
 GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
 GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
-
-GEN_XX3FORM_DM(xxpermdi, 0x08, 0x01),
-- 
2.25.1


