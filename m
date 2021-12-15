Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148ED475E5C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:16:51 +0100 (CET)
Received: from localhost ([::1]:48552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXta-0000hJ-6X
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcP-0005G3-28
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:05 -0500
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcI-0003US-5o
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:04 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0DBC0212A8;
 Wed, 15 Dec 2021 16:58:56 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:55 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001bb8df5fc-c9ca-49b9-a62c-efe3f9804aa2,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 006/102] target/ppc: Implement Vector Expand Mask
Date: Wed, 15 Dec 2021 17:57:11 +0100
Message-ID: <20211215165847.321042-7-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f7b96167-5563-4eaf-a4ae-526ceb8eb9dc
X-Ovh-Tracer-Id: 2219993144389503782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
vexpandbm: Vector Expand Byte Mask
vexpandhm: Vector Expand Halfword Mask
vexpandwm: Vector Expand Word Mask
vexpanddm: Vector Expand Doubleword Mask
vexpandqm: Vector Expand Quadword Mask

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20211203194229.746275-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            | 11 ++++++++++
 target/ppc/translate/vmx-impl.c.inc | 34 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index e135b8aba417..9a28f1d266bb 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -56,6 +56,9 @@
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
 
+&VX_tb          vrt vrb
+@VX_tb          ...... vrt:5 ..... vrb:5 ...........    &VX_tb
+
 &X              rt ra rb
 @X              ...... rt:5 ra:5 rb:5 .......... .      &X
 
@@ -408,6 +411,14 @@ VINSWVRX        000100 ..... ..... ..... 00110001111    @VX
 VSLDBI          000100 ..... ..... ..... 00 ... 010110  @VN
 VSRDBI          000100 ..... ..... ..... 01 ... 010110  @VN
 
+## Vector Mask Manipulation Instructions
+
+VEXPANDBM       000100 ..... 00000 ..... 11001000010    @VX_tb
+VEXPANDHM       000100 ..... 00001 ..... 11001000010    @VX_tb
+VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
+VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
+VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8eb8d3a06720..ebb048432369 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1491,6 +1491,40 @@ static bool trans_VSRDBI(DisasContext *ctx, arg_VN *a)
     return true;
 }
 
+static bool do_vexpand(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_sari(vece, avr_full_offset(a->vrt), avr_full_offset(a->vrb),
+                      (8 << vece) - 1, 16, 16);
+
+    return true;
+}
+
+TRANS(VEXPANDBM, do_vexpand, MO_8)
+TRANS(VEXPANDHM, do_vexpand, MO_16)
+TRANS(VEXPANDWM, do_vexpand, MO_32)
+TRANS(VEXPANDDM, do_vexpand, MO_64)
+
+static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_sari_i64(tmp, tmp, 63);
+    set_avr64(a->vrt, tmp, false);
+    set_avr64(a->vrt, tmp, true);
+
+    tcg_temp_free_i64(tmp);
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.31.1


