Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7EB50FE39
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 15:03:50 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njKr7-0006KH-Fr
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeV-00041H-GI; Tue, 26 Apr 2022 08:50:47 -0400
Received: from [187.72.171.209] (port=32914 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1njKeT-00005X-J2; Tue, 26 Apr 2022 08:50:46 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 26 Apr 2022 09:50:37 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id B1EB8801008;
 Tue, 26 Apr 2022 09:50:36 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/7] target/ppc: Implement xxm[tf]acc and xxsetaccz
Date: Tue, 26 Apr 2022 09:50:22 -0300
Message-Id: <20220426125028.18844-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
References: <20220426125028.18844-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Apr 2022 12:50:37.0021 (UTC)
 FILETIME=[39E700D0:01D8596C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xxmfacc: VSX Move From Accumulator
xxmtacc: VSX Move To Accumulator
xxsetaccz: VSX Set Accumulator to Zero

The PowerISA 3.1 mentions that for the current version of the
architecture, "the hardware implementation provides the effect of ACC[i]
and VSRs 4*i to 4*i + 3 logically containing the same data" and "The
Accumulators introduce no new logical state at this time" (page 501).
For now it seems unnecessary to create new structures, so this patch
just uses ACC[i] as VSRs 4*i to 4*i+3 and therefore move to and from
accumulators are no-ops.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 target/ppc/insn32.decode            |  9 ++++++++
 target/ppc/translate/vsx-impl.c.inc | 36 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 39372fe673..7a76bedfa6 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -151,6 +151,9 @@
 &X_vrt_frbp     vrt frbp
 @X_vrt_frbp     ...... vrt:5 ..... ....0 .......... .           &X_vrt_frbp frbp=%x_frbp
 
+&X_a            ra
+@X_a            ...... ra:3 .. ..... ..... .......... .         &X_a
+
 %xx_xt          0:1 21:5
 %xx_xb          1:1 11:5
 %xx_xa          2:1 16:5
@@ -710,3 +713,9 @@ XVTLSBB         111100 ... -- 00010 ..... 111011011 . - @XX2_bf_xb
 &XL_s           s:uint8_t
 @XL_s           ......-------------- s:1 .......... -   &XL_s
 RFEBB           010011-------------- .   0010010010 -   @XL_s
+
+## Accumulator Instructions
+
+XXMFACC         011111 ... -- 00000 ----- 0010110001 -   @X_a
+XXMTACC         011111 ... -- 00001 ----- 0010110001 -   @X_a
+XXSETACCZ       011111 ... -- 00011 ----- 0010110001 -   @X_a
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 3692740736..919b889c40 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -2787,6 +2787,42 @@ static bool trans_XVCVBF16SPN(DisasContext *ctx, arg_XX2 *a)
     return true;
 }
 
+    /*
+     *  The PowerISA 3.1 mentions that for the current version of the
+     *  architecture, "the hardware implementation provides the effect of
+     *  ACC[i] and VSRs 4*i to 4*i + 3 logically containing the same data"
+     *  and "The Accumulators introduce no new logical state at this time"
+     *  (page 501). For now it seems unnecessary to create new structures,
+     *  so this patch just uses ACC[i] as VSRs 4*i to 4*i+3 and therefore
+     *  move to and from accumulators are no-ops.
+     */
+static bool trans_XXMFACC(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    return true;
+}
+
+static bool trans_XXMTACC(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    return true;
+}
+
+static bool trans_XXSETACCZ(DisasContext *ctx, arg_X_a *a)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+    int i;
+    TCGv_i64 zero = tcg_constant_i64(0);
+    for (i = 0; i < 4; i++) {
+        set_cpu_vsr(a->ra * 4 + i, zero, false);
+        set_cpu_vsr(a->ra * 4 + i, zero, true);
+    }
+    return true;
+}
+
 #undef GEN_XX2FORM
 #undef GEN_XX3FORM
 #undef GEN_XX2IFORM
-- 
2.31.1


