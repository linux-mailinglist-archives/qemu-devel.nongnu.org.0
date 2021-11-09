Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2E444A75A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 08:10:18 +0100 (CET)
Received: from localhost ([::1]:35390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkLGr-00068c-Tw
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 02:10:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5G-0006Ja-6v; Tue, 09 Nov 2021 00:54:14 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mkK5B-0006y0-BZ; Tue, 09 Nov 2021 00:54:13 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HpHDp73cyz4xfV; Tue,  9 Nov 2021 16:52:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1636437131;
 bh=v3fWcZTQpo/CN6AuJvnMWvjIgXtZBd39tqc+piuYJgc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h224dNm/hcb5paXRUFhy7RRYYKmd1iPggPBp1NY3wtQk/eyFhARQgbUmrF92dmP6i
 P7a8Xvv4NHHIWXY2zEK1egbOxLmT++ABFtg0Zbtj8ftxk1i/TT6ahdUdcGOWuGXddj
 x5+2zgokRfHwnhctOXD5MmTeNvnHpJ+EIemVBJps=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org, clg@kaod.org, danielhb413@gmail.com,
 groug@kaod.org
Subject: [PULL 51/54] target/ppc: Implement lxvkq instruction
Date: Tue,  9 Nov 2021 16:52:01 +1100
Message-Id: <20211109055204.230765-52-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109055204.230765-1-david@gibson.dropbear.id.au>
References: <20211109055204.230765-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211104123719.323713-25-matheus.ferst@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vsx-impl.c.inc | 43 +++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fd73946122..e135b8aba4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -100,6 +100,9 @@
 &X_imm8         xt imm:uint8_t
 @X_imm8         ...... ..... .. imm:8 .......... .              &X_imm8 xt=%x_xt
 
+&X_uim5         xt uim:uint8_t
+@X_uim5         ...... ..... ..... uim:5 .......... .           &X_uim5 xt=%x_xt
+
 &X_tb_sp_rc     rt rb sp rc:bool
 @X_tb_sp_rc     ...... rt:5 sp:2 ... rb:5 .......... rc:1       &X_tb_sp_rc
 
@@ -420,3 +423,7 @@ STXVPX          011111 ..... ..... ..... 0111001101 -   @X_TSXP
 
 XXSPLTIB        111100 ..... 00 ........ 0101101000 .   @X_imm8
 XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2
+
+## VSX Vector Load Special Value Instruction
+
+LXVKQ           111100 ..... 11111 ..... 0101101000 .   @X_uim5
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index d1de0da877..c0e38060b4 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1503,6 +1503,49 @@ static bool trans_XXSPLTI32DX(DisasContext *ctx, arg_8RR_D_IX *a)
     return true;
 }
 
+static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
+{
+    static const uint64_t values[32] = {
+        0, /* Unspecified */
+        0x3FFF000000000000llu, /* QP +1.0 */
+        0x4000000000000000llu, /* QP +2.0 */
+        0x4000800000000000llu, /* QP +3.0 */
+        0x4001000000000000llu, /* QP +4.0 */
+        0x4001400000000000llu, /* QP +5.0 */
+        0x4001800000000000llu, /* QP +6.0 */
+        0x4001C00000000000llu, /* QP +7.0 */
+        0x7FFF000000000000llu, /* QP +Inf */
+        0x7FFF800000000000llu, /* QP dQNaN */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0, /* Unspecified */
+        0x8000000000000000llu, /* QP -0.0 */
+        0xBFFF000000000000llu, /* QP -1.0 */
+        0xC000000000000000llu, /* QP -2.0 */
+        0xC000800000000000llu, /* QP -3.0 */
+        0xC001000000000000llu, /* QP -4.0 */
+        0xC001400000000000llu, /* QP -5.0 */
+        0xC001800000000000llu, /* QP -6.0 */
+        0xC001C00000000000llu, /* QP -7.0 */
+        0xFFFF000000000000llu, /* QP -Inf */
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    if (values[a->uim]) {
+        set_cpu_vsr(a->xt, tcg_constant_i64(0x0), false);
+        set_cpu_vsr(a->xt, tcg_constant_i64(values[a->uim]), true);
+    } else {
+        gen_invalid(ctx);
+    }
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.33.1


