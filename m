Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 970594C5185
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:29:18 +0100 (CET)
Received: from localhost ([::1]:37550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNj5Q-0002Jd-8U
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:29:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhuG-0004SW-2h; Fri, 25 Feb 2022 16:13:40 -0500
Received: from [187.72.171.209] (port=41741 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhuA-0004BJ-Op; Fri, 25 Feb 2022 16:13:39 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8B98B8006BB;
 Fri, 25 Feb 2022 18:09:52 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 20/49] target/ppc: implement vslq
Date: Fri, 25 Feb 2022 18:09:07 -0300
Message-Id: <20220225210936.1749575-21-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:52.0964 (UTC)
 FILETIME=[08402840:01D82A8C]
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
 target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 88baebe35e..3799065508 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -473,6 +473,7 @@ VSLB            000100 ..... ..... ..... 00100000100    @VX
 VSLH            000100 ..... ..... ..... 00101000100    @VX
 VSLW            000100 ..... ..... ..... 00110000100    @VX
 VSLD            000100 ..... ..... ..... 10111000100    @VX
+VSLQ            000100 ..... ..... ..... 00100000101    @VX
 
 VSRB            000100 ..... ..... ..... 01000000100    @VX
 VSRH            000100 ..... ..... ..... 01001000100    @VX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 1b05b0b3a3..49c722e862 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,6 +834,46 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
 
+static bool trans_VSLQ(DisasContext *ctx, arg_VX *a)
+{
+    TCGv_i64 hi, lo, t0, n, zero = tcg_constant_i64(0);
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    n = tcg_temp_new_i64();
+    hi = tcg_temp_new_i64();
+    lo = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+
+    get_avr64(lo, a->vra, false);
+    get_avr64(hi, a->vra, true);
+
+    get_avr64(n, a->vrb, true);
+
+    tcg_gen_andi_i64(t0, n, 64);
+    tcg_gen_movcond_i64(TCG_COND_NE, hi, t0, zero, lo, hi);
+    tcg_gen_movcond_i64(TCG_COND_NE, lo, t0, zero, zero, lo);
+    tcg_gen_andi_i64(n, n, 0x3F);
+
+    tcg_gen_shl_i64(t0, lo, n);
+    set_avr64(a->vrt, t0, false);
+
+    tcg_gen_shl_i64(hi, hi, n);
+    tcg_gen_xori_i64(n, n, 63);
+    tcg_gen_shr_i64(lo, lo, n);
+    tcg_gen_shri_i64(lo, lo, 1);
+    tcg_gen_or_i64(hi, hi, lo);
+    set_avr64(a->vrt, hi, true);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(n);
+
+    return true;
+}
+
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
                                          TCGv_vec sat, TCGv_vec a,      \
-- 
2.25.1


