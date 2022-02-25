Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F294C50CC
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:38:04 +0100 (CET)
Received: from localhost ([::1]:45088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiHr-0006Rc-0p
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:38:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhs4-0000s0-P6; Fri, 25 Feb 2022 16:11:24 -0500
Received: from [187.72.171.209] (port=2714 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhru-0003wK-1B; Fri, 25 Feb 2022 16:11:15 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 486488006BB;
 Fri, 25 Feb 2022 18:09:48 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 06/49] target/ppc: Implement vmsumudm instruction
Date: Fri, 25 Feb 2022 18:08:53 -0300
Message-Id: <20220225210936.1749575-7-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:48.0662 (UTC)
 FILETIME=[05AFB960:01D82A8C]
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

Based on [1] by Lijun Pan <ljp@linux.ibm.com>, which was never merged
into master.

[1]: https://lists.gnu.org/archive/html/qemu-ppc/2020-07/msg00419.html

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e85a75db2f..732a2bb79e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -471,6 +471,7 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 ## Vector Multiply-Sum Instructions
 
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
+VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
 # VSX Load/Store Instructions
 
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4f528dc820..fcff3418c5 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2081,6 +2081,40 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool trans_VMSUMUDM(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_i64 rl, rh, src1, src2;
+    int dw;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VECTOR(ctx);
+
+    rh = tcg_temp_new_i64();
+    rl = tcg_temp_new_i64();
+    src1 = tcg_temp_new_i64();
+    src2 = tcg_temp_new_i64();
+
+    get_avr64(rl, a->rc, false);
+    get_avr64(rh, a->rc, true);
+
+    for (dw = 0; dw < 2; dw++) {
+        get_avr64(src1, a->vra, dw);
+        get_avr64(src2, a->vrb, dw);
+        tcg_gen_mulu2_i64(src1, src2, src1, src2);
+        tcg_gen_add2_i64(rl, rh, rl, rh, src1, src2);
+    }
+
+    set_avr64(a->vrt, rl, false);
+    set_avr64(a->vrt, rh, true);
+
+    tcg_temp_free_i64(rl);
+    tcg_temp_free_i64(rh);
+    tcg_temp_free_i64(src1);
+    tcg_temp_free_i64(src2);
+
+    return true;
+}
+
 static bool trans_VMSUMCUD(DisasContext *ctx, arg_VA *a)
 {
     TCGv_i64 tmp0, tmp1, prod1h, prod1l, prod0h, prod0l, zero;
-- 
2.25.1


