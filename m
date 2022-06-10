Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63B546C9F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 20:41:42 +0200 (CEST)
Received: from localhost ([::1]:53978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzjZk-0000e7-CI
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 14:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJl-00011c-D4; Fri, 10 Jun 2022 14:25:14 -0400
Received: from [187.72.171.209] (port=48290 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nzjJj-0003eJ-SK; Fri, 10 Jun 2022 14:25:09 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 10 Jun 2022 15:23:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B3CCD800058;
 Fri, 10 Jun 2022 15:23:42 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org,
 victor.colombo@eldorado.org.br
Subject: [PATCH RESEND v2 06/11] target/ppc: Implement mffscdrn[i] instructions
Date: Fri, 10 Jun 2022 15:23:05 -0300
Message-Id: <20220610182310.68715-7-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
References: <20220610182310.68715-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Jun 2022 18:23:42.0962 (UTC)
 FILETIME=[370A5520:01D87CF7]
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
 target/ppc/insn32.decode           |  5 ++++
 target/ppc/translate/fp-impl.c.inc | 41 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 8954a13d6b..da507758b8 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -133,6 +133,9 @@
 &X_imm2         rt imm
 @X_imm2         ...... rt:5 ..... ... imm:2 .......... .        &X_imm2
 
+&X_imm3         rt imm
+@X_imm3         ...... rt:5 ..... .. imm:3 .......... .         &X_imm3
+
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
 @X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
@@ -348,7 +351,9 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
 MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 
 ### Decimal Floating-Point Arithmetic Instructions
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index d6231358f8..319513d001 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -696,6 +696,27 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
     return true;
 }
 
+static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
+{
+    TCGv_i64 t1, fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    t1 = tcg_temp_new_i64();
+    get_fpr(t1, a->rb);
+    tcg_gen_andi_i64(t1, t1, FP_DRN);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1, fpscr;
@@ -716,6 +737,26 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
     return true;
 }
 
+static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
+{
+    TCGv_i64 t1, fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    t1 = tcg_temp_new_i64();
+    tcg_gen_movi_i64(t1, (uint64_t)a->imm << FPSCR_DRN0);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_DRN, t1, 0x0100);
+
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
-- 
2.25.1


