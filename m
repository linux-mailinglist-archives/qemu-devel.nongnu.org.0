Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8944C5177
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 23:22:38 +0100 (CET)
Received: from localhost ([::1]:58262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiyz-00054w-GG
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 17:22:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhxP-0000PD-Bt; Fri, 25 Feb 2022 16:16:55 -0500
Received: from [187.72.171.209] (port=58124 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhxM-0004qx-Rc; Fri, 25 Feb 2022 16:16:55 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:58 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 24B928001D1;
 Fri, 25 Feb 2022 18:09:58 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 38/49] target/ppc: Implement xvtlsbb instruction
Date: Fri, 25 Feb 2022 18:09:25 -0300
Message-Id: <20220225210936.1749575-39-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:58.0514 (UTC)
 FILETIME=[0B8F0520:01D82A8C]
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
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
changes for v5:
- unroll for-loop as suggested by Richard Henderson
---
 target/ppc/insn32.decode            |  7 +++++
 target/ppc/translate/vsx-impl.c.inc | 40 +++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c28cc13325..973cda1131 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -155,6 +155,9 @@
 &XX2            xt xb uim:uint8_t
 @XX2            ...... ..... ... uim:2 ..... ......... ..       &XX2 xt=%xx_xt xb=%xx_xb
 
+&XX2_bf_xb      bf xb
+@XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
+
 &XX3            xt xa xb
 @XX3            ...... ..... ..... ..... ........ ...           &XX3 xt=%xx_xt xa=%xx_xa xb=%xx_xb
 
@@ -666,6 +669,10 @@ XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
 
+## VSX Vector Test Least-Significant Bit by Byte Instruction
+
+XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
+
 ### rfebb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 292a14f5aa..4da889531b 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1704,6 +1704,46 @@ static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
     return true;
 }
 
+static bool trans_XVTLSBB(DisasContext *ctx, arg_XX2_bf_xb *a)
+{
+    TCGv_i64 xb, t0, t1, all_true, all_false, mask, zero;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xb = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    all_true = tcg_temp_new_i64();
+    all_false = tcg_temp_new_i64();
+    mask = tcg_constant_i64(dup_const(MO_8, 1));
+    zero = tcg_constant_i64(0);
+
+    get_cpu_vsr(xb, a->xb, true);
+    tcg_gen_and_i64(t0, mask, xb);
+    get_cpu_vsr(xb, a->xb, false);
+    tcg_gen_and_i64(t1, mask, xb);
+
+    tcg_gen_or_i64(all_false, t0, t1);
+    tcg_gen_and_i64(all_true, t0, t1);
+
+    tcg_gen_setcond_i64(TCG_COND_EQ, all_false, all_false, zero);
+    tcg_gen_shli_i64(all_false, all_false, 1);
+    tcg_gen_setcond_i64(TCG_COND_EQ, all_true, all_true, mask);
+    tcg_gen_shli_i64(all_true, all_true, 3);
+
+    tcg_gen_or_i64(t0, all_false, all_true);
+    tcg_gen_extrl_i64_i32(cpu_crf[a->bf], t0);
+
+    tcg_temp_free_i64(xb);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(all_true);
+    tcg_temp_free_i64(all_false);
+
+    return true;
+}
+
 static void gen_xxsldwi(DisasContext *ctx)
 {
     TCGv_i64 xth, xtl;
-- 
2.25.1


