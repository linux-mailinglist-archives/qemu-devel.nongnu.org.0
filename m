Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005134C50F2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:51:06 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNiUT-0003dP-Lt
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:51:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhqp-0007uC-RL; Fri, 25 Feb 2022 16:10:11 -0500
Received: from [187.72.171.209] (port=39685 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nNhqn-0002Z7-Ai; Fri, 25 Feb 2022 16:10:07 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 25 Feb 2022 18:09:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EFD7E8001D1;
 Fri, 25 Feb 2022 18:09:47 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v5 05/49] target/ppc: Implement vmsumcud instruction
Date: Fri, 25 Feb 2022 18:08:52 -0300
Message-Id: <20220225210936.1749575-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
References: <20220225210936.1749575-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Feb 2022 21:09:48.0350 (UTC)
 FILETIME=[05801DE0:01D82A8C]
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
 target/ppc/insn32.decode            |  4 +++
 target/ppc/translate/vmx-impl.c.inc | 53 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d817e44c71..e85a75db2f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -468,6 +468,10 @@ VMULHSD         000100 ..... ..... ..... 01111001001    @VX
 VMULHUD         000100 ..... ..... ..... 01011001001    @VX
 VMULLD          000100 ..... ..... ..... 00111001001    @VX
 
+## Vector Multiply-Sum Instructions
+
+VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 97a075efd1..4f528dc820 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2081,6 +2081,59 @@ static bool trans_VPEXTD(DisasContext *ctx, arg_VX *a)
     return true;
 }
 
+static bool trans_VMSUMCUD(DisasContext *ctx, arg_VA *a)
+{
+    TCGv_i64 tmp0, tmp1, prod1h, prod1l, prod0h, prod0l, zero;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp0 = tcg_temp_new_i64();
+    tmp1 = tcg_temp_new_i64();
+    prod1h = tcg_temp_new_i64();
+    prod1l = tcg_temp_new_i64();
+    prod0h = tcg_temp_new_i64();
+    prod0l = tcg_temp_new_i64();
+    zero = tcg_constant_i64(0);
+
+    /* prod1 = vsr[vra+32].dw[1] * vsr[vrb+32].dw[1] */
+    get_avr64(tmp0, a->vra, false);
+    get_avr64(tmp1, a->vrb, false);
+    tcg_gen_mulu2_i64(prod1l, prod1h, tmp0, tmp1);
+
+    /* prod0 = vsr[vra+32].dw[0] * vsr[vrb+32].dw[0] */
+    get_avr64(tmp0, a->vra, true);
+    get_avr64(tmp1, a->vrb, true);
+    tcg_gen_mulu2_i64(prod0l, prod0h, tmp0, tmp1);
+
+    /* Sum lower 64-bits elements */
+    get_avr64(tmp1, a->rc, false);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, zero, prod1l, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod0l, zero);
+
+    /*
+     * Discard lower 64-bits, leaving the carry into bit 64.
+     * Then sum the higher 64-bit elements.
+     */
+    get_avr64(tmp1, a->rc, true);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp0, zero, tmp1, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod1h, zero);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp1, tmp0, prod0h, zero);
+
+    /* Discard 64 more bits to complete the CHOP128(temp >> 128) */
+    set_avr64(a->vrt, tmp0, false);
+    set_avr64(a->vrt, zero, true);
+
+    tcg_temp_free_i64(tmp0);
+    tcg_temp_free_i64(tmp1);
+    tcg_temp_free_i64(prod1h);
+    tcg_temp_free_i64(prod1l);
+    tcg_temp_free_i64(prod0h);
+    tcg_temp_free_i64(prod0l);
+
+    return true;
+}
+
 static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
                          void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
-- 
2.25.1


