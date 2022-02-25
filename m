Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D483C4C5120
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:03:39 +0100 (CET)
Received: from localhost ([::1]:54678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNigc-0007ub-Tb
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:03:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhsk-0002K2-UY; Fri, 25 Feb 2022 16:12:07 -0500
Received: from [187.72.171.209] (port=42332 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhsi-0003wL-Mt; Fri, 25 Feb 2022 16:12:06 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5A9F58006BB;
 Fri, 25 Feb 2022 18:09:51 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 16/49] target/ppc: implement vclrrb
Date: Fri, 25 Feb 2022 18:09:03 -0300
Message-Id: <20220225210936.1749575-17-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:51.0742 (UTC)
 FILETIME=[0785B1E0:01D82A8C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 32 +++++++++++++++++++++--------
 2 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 31cdbba86b..b20f1eaa8e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -530,6 +530,7 @@ VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
 VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
 
 VCLRLB          000100 ..... ..... ..... 00110001101    @VX
+VCLRRB          000100 ..... ..... ..... 00111001101    @VX
 
 # VSX Load/Store Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index d43fba00ed..4db5656669 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1940,7 +1940,7 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
 TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
 TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
 
-static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
+static bool do_vclrb(DisasContext *ctx, arg_VX *a, bool right)
 {
     TCGv_i64 rb, mh, ml, tmp,
              ones = tcg_constant_i64(-1),
@@ -1954,15 +1954,28 @@ static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
     tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
     tcg_gen_andi_i64(tmp, rb, 7);
     tcg_gen_shli_i64(tmp, tmp, 3);
-    tcg_gen_shl_i64(tmp, ones, tmp);
+    if (right) {
+        tcg_gen_shr_i64(tmp, ones, tmp);
+    } else {
+        tcg_gen_shl_i64(tmp, ones, tmp);
+    }
     tcg_gen_not_i64(tmp, tmp);
 
-    tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
-                        tmp, ones);
-    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
-                        zero, tmp);
-    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
-                        mh, ones);
+    if (right) {
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                            tmp, ones);
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                            zero, tmp);
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(16),
+                            ml, ones);
+    } else {
+        tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                            tmp, ones);
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                            zero, tmp);
+        tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
+                            mh, ones);
+    }
 
     get_avr64(tmp, a->vra, true);
     tcg_gen_and_i64(tmp, tmp, mh);
@@ -1980,6 +1993,9 @@ static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+TRANS(VCLRLB, do_vclrb, false)
+TRANS(VCLRRB, do_vclrb, true)
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


