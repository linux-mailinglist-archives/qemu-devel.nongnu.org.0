Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361D49B4E2
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:22:00 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCLll-0007P4-Oa
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:21:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7O-0000la-4B; Tue, 25 Jan 2022 07:40:16 -0500
Received: from [187.72.171.209] (port=20411 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCL7M-0006vl-8p; Tue, 25 Jan 2022 07:40:13 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:35 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 85BC380001E;
 Tue, 25 Jan 2022 09:20:35 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 05/38] target/ppc: Implement vmsumcud instruction
Date: Tue, 25 Jan 2022 09:19:10 -0300
Message-Id: <20220125121943.3269077-6-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:35.0976 (UTC)
 FILETIME=[F4CE1880:01D811E5]
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

Based on [1] by Lijun Pan <ljp@linux.ibm.com>, which was never merged
into master.

[1]: https://lists.gnu.org/archive/html/qemu-ppc/2020-07/msg00419.html

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/insn32.decode            |  4 +++
 target/ppc/translate/vmx-impl.c.inc | 53 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 4774548b3d..0ec64cb4f4 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -440,6 +440,10 @@ VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
 VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
 VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
 
+## Vector Multiply-Sum Instructions
+
+VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index bed8df81c4..694da75448 100644
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
+    tcg_gen_mov_i64(tmp1, tmp0);
+    get_avr64(tmp0, a->rc, true);
+    tcg_gen_add2_i64(tmp1, tmp0, tmp0, zero, prod1h, zero);
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
                          void (*gen_helper) (TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
-- 
2.25.1


