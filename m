Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47574BFB80
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 16:01:10 +0100 (CET)
Received: from localhost ([::1]:44516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWf6-0001FR-Gb
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 10:01:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLg-0007Qq-8v; Tue, 22 Feb 2022 09:41:05 -0500
Received: from [187.72.171.209] (port=44457 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLe-0005jA-DP; Tue, 22 Feb 2022 09:41:03 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 86E868000A7;
 Tue, 22 Feb 2022 11:37:43 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 22/47] target/ppc: implement vsraq
Date: Tue, 22 Feb 2022 11:36:20 -0300
Message-Id: <20220222143646.1268606-23-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:43.0978 (UTC)
 FILETIME=[C0A490A0:01D827F9]
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 -  New in v4.
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 96ee730242..7a9fc1dffa 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -485,6 +485,7 @@ VSRAB           000100 ..... ..... ..... 01100000100    @VX
 VSRAH           000100 ..... ..... ..... 01101000100    @VX
 VSRAW           000100 ..... ..... ..... 01110000100    @VX
 VSRAD           000100 ..... ..... ..... 01111000100    @VX
+VSRAQ           000100 ..... ..... ..... 01100000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ec2b47b4aa..2eee187499 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -834,7 +834,8 @@ TRANS_FLAGS(ALTIVEC, VSRAH, do_vector_gvec3_VX, MO_16, tcg_gen_gvec_sarv);
 TRANS_FLAGS(ALTIVEC, VSRAW, do_vector_gvec3_VX, MO_32, tcg_gen_gvec_sarv);
 TRANS_FLAGS2(ALTIVEC_207, VSRAD, do_vector_gvec3_VX, MO_64, tcg_gen_gvec_sarv);
 
-static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
+static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right,
+                                 bool alg)
 {
     TCGv_i64 hi, lo, tmp, n, sf = tcg_constant_i64(64);
 
@@ -853,6 +854,9 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
 
     if (right) {
         tcg_gen_movcond_i64(TCG_COND_GE, lo, n, sf, hi, lo);
+        if (alg) {
+            tcg_gen_sari_i64(tmp, lo, 63);
+        }
         tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, tmp, hi);
     } else {
         tcg_gen_movcond_i64(TCG_COND_GE, hi, n, sf, lo, hi);
@@ -861,7 +865,11 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
     tcg_gen_andi_i64(n, n, ~64ULL);
 
     if (right) {
-        tcg_gen_shr_i64(tmp, hi, n);
+        if (alg) {
+            tcg_gen_sar_i64(tmp, hi, n);
+        } else {
+            tcg_gen_shr_i64(tmp, hi, n);
+        }
     } else {
         tcg_gen_shl_i64(tmp, lo, n);
     }
@@ -891,8 +899,9 @@ static bool do_vector_shift_quad(DisasContext *ctx, arg_VX *a, bool right)
     return true;
 }
 
-TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false);
-TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true);
+TRANS_FLAGS2(ISA310, VSLQ, do_vector_shift_quad, false, false);
+TRANS_FLAGS2(ISA310, VSRQ, do_vector_shift_quad, true, false);
+TRANS_FLAGS2(ISA310, VSRAQ, do_vector_shift_quad, true, true);
 
 #define GEN_VXFORM_SAT(NAME, VECE, NORM, SAT, OPC2, OPC3)               \
 static void glue(glue(gen_, NAME), _vec)(unsigned vece, TCGv_vec t,     \
-- 
2.25.1


