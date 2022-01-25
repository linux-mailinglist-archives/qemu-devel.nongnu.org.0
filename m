Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E854249B68B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 15:41:41 +0100 (CET)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCN0t-0008FQ-Hq
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 09:41:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLE7-0002tN-Ud; Tue, 25 Jan 2022 07:47:27 -0500
Received: from [187.72.171.209] (port=52356 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLE5-0008AP-7k; Tue, 25 Jan 2022 07:47:10 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2833780001E;
 Tue, 25 Jan 2022 09:20:44 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 29/38] target/ppc: Implement xvtlsbb instruction
Date: Tue, 25 Jan 2022 09:19:34 -0300
Message-Id: <20220125121943.3269077-30-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:44.0528 (UTC)
 FILETIME=[F9E70700:01D811E5]
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
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  7 ++++++
 target/ppc/translate/vsx-impl.c.inc | 37 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index c16b990a00..c9cf865fdf 100644
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
 
@@ -604,6 +607,10 @@ XSMINJDP        111100 ..... ..... ..... 10011000 ...   @XX3
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
 
+## VSX Vector Test Least-Significant Bit by Byte Instruction
+
+XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
+
 ### rfebb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7764b1e5c2..5a0ec8e828 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1688,6 +1688,43 @@ static bool trans_LXVKQ(DisasContext *ctx, arg_X_uim5 *a)
     return true;
 }
 
+static bool trans_XVTLSBB(DisasContext *ctx, arg_XX2_bf_xb *a)
+{
+    TCGv_i64 xb, tmp, all_true, all_false, mask, zero;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xb = tcg_temp_new_i64();
+    tmp = tcg_temp_new_i64();
+    all_true = tcg_const_i64(0b1000);
+    all_false = tcg_const_i64(0b0010);
+    mask = tcg_constant_i64(dup_const(MO_8, 1));
+    zero = tcg_constant_i64(0);
+
+    for (int dw = 0; dw < 2; dw++) {
+        get_cpu_vsr(xb, a->xb, dw);
+
+        tcg_gen_and_i64(tmp, mask, xb);
+        tcg_gen_movcond_i64(TCG_COND_EQ, all_true, tmp,
+                            mask, all_true, zero);
+
+        tcg_gen_andc_i64(tmp, mask, xb);
+        tcg_gen_movcond_i64(TCG_COND_EQ, all_false, tmp,
+                            mask, all_false, zero);
+    }
+
+    tcg_gen_or_i64(tmp, all_false, all_true);
+    tcg_gen_extrl_i64_i32(cpu_crf[a->bf], tmp);
+
+    tcg_temp_free_i64(xb);
+    tcg_temp_free_i64(tmp);
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


