Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95994C5114
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:56:14 +0100 (CET)
Received: from localhost ([::1]:44798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiZR-00010k-Nz
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhsN-0001Or-Vc; Fri, 25 Feb 2022 16:11:44 -0500
Received: from [187.72.171.209] (port=2714 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhsL-0003wK-Qi; Fri, 25 Feb 2022 16:11:43 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:51 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 159E38001D1;
 Fri, 25 Feb 2022 18:09:51 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 15/49] target/ppc: implement vclrlb
Date: Fri, 25 Feb 2022 18:09:02 -0300
Message-Id: <20220225210936.1749575-16-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:51.0430 (UTC)
 FILETIME=[07561660:01D82A8C]
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
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d844d86829..31cdbba86b 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -529,6 +529,8 @@ VSTRIBR         000100 ..... 00001 ..... . 0000001101   @VX_tb_rc
 VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
 VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
 
+VCLRLB          000100 ..... ..... ..... 00110001101    @VX
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 6962929826..d43fba00ed 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1940,6 +1940,46 @@ TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
 TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
 TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
 
+static bool trans_VCLRLB(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 rb, mh, ml, tmp,
+             ones = tcg_constant_i64(-1),
+             zero = tcg_constant_i64(0);
+
+    rb = tcg_temp_new_i64();
+    mh = tcg_temp_new_i64();
+    ml = tcg_temp_new_i64();
+    tmp = tcg_temp_new_i64();
+
+    tcg_gen_extu_tl_i64(rb, cpu_gpr[a->vrb]);
+    tcg_gen_andi_i64(tmp, rb, 7);
+    tcg_gen_shli_i64(tmp, tmp, 3);
+    tcg_gen_shl_i64(tmp, ones, tmp);
+    tcg_gen_not_i64(tmp, tmp);
+
+    tcg_gen_movcond_i64(TCG_COND_LTU, ml, rb, tcg_constant_i64(8),
+                        tmp, ones);
+    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(8),
+                        zero, tmp);
+    tcg_gen_movcond_i64(TCG_COND_LTU, mh, rb, tcg_constant_i64(16),
+                        mh, ones);
+
+    get_avr64(tmp, a->vra, true);
+    tcg_gen_and_i64(tmp, tmp, mh);
+    set_avr64(a->vrt, tmp, true);
+
+    get_avr64(tmp, a->vra, false);
+    tcg_gen_and_i64(tmp, tmp, ml);
+    set_avr64(a->vrt, tmp, false);
+
+    tcg_temp_free_i64(rb);
+    tcg_temp_free_i64(mh);
+    tcg_temp_free_i64(ml);
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


