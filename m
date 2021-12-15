Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C1475E6B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:19:18 +0100 (CET)
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXvw-0006Zr-Ej
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:19:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcP-0005Jq-RI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:05 -0500
Received: from 5.mo548.mail-out.ovh.net ([188.165.49.213]:54445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mxXcJ-0003VC-2N
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:59:05 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BECFF20394;
 Wed, 15 Dec 2021 16:58:56 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 15 Dec
 2021 17:58:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00156ea0447-4060-4968-b866-3cf0ed18c6a6,
 DB2000250E14A505ED1736C7348301D5E40ED0AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.76.172.47
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PULL 007/102] target/ppc: Implement Vector Extract Mask
Date: Wed, 15 Dec 2021 17:57:12 +0100
Message-ID: <20211215165847.321042-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215165847.321042-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 935f9b84-c75a-403f-a470-7b120074b43f
X-Ovh-Tracer-Id: 2220274618433637158
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.213; envelope-from=clg@kaod.org;
 helo=5.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
vextractbm: Vector Extract Byte Mask
vextracthm: Vector Extract Halfword Mask
vextractwm: Vector Extract Word Mask
vextractdm: Vector Extract Doubleword Mask
vextractqm: Vector Extract Quadword Mask

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211203194229.746275-3-matheus.ferst@eldorado.org.br>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/insn32.decode            |  6 +++
 target/ppc/translate/vmx-impl.c.inc | 82 +++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 9a28f1d266bb..639ac22bf055 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -419,6 +419,12 @@ VEXPANDWM       000100 ..... 00010 ..... 11001000010    @VX_tb
 VEXPANDDM       000100 ..... 00011 ..... 11001000010    @VX_tb
 VEXPANDQM       000100 ..... 00100 ..... 11001000010    @VX_tb
 
+VEXTRACTBM      000100 ..... 01000 ..... 11001000010    @VX_tb
+VEXTRACTHM      000100 ..... 01001 ..... 11001000010    @VX_tb
+VEXTRACTWM      000100 ..... 01010 ..... 11001000010    @VX_tb
+VEXTRACTDM      000100 ..... 01011 ..... 11001000010    @VX_tb
+VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index ebb048432369..96c97bf6e74c 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1525,6 +1525,88 @@ static bool trans_VEXPANDQM(DisasContext *ctx, arg_VX_tb *a)
     return true;
 }
 
+static bool do_vextractm(DisasContext *ctx, arg_VX_tb *a, unsigned vece)
+{
+    const uint64_t elem_width = 8 << vece, elem_count_half = 8 >> vece,
+                   mask = dup_const(vece, 1 << (elem_width - 1));
+    uint64_t i, j;
+    TCGv_i64 lo, hi, t0, t1;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    hi = tcg_temp_new_i64();
+    lo = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+
+    get_avr64(lo, a->vrb, false);
+    get_avr64(hi, a->vrb, true);
+
+    tcg_gen_andi_i64(lo, lo, mask);
+    tcg_gen_andi_i64(hi, hi, mask);
+
+    /*
+     * Gather the most significant bit of each element in the highest element
+     * element. E.g. for bytes:
+     * aXXXXXXXbXXXXXXXcXXXXXXXdXXXXXXXeXXXXXXXfXXXXXXXgXXXXXXXhXXXXXXX
+     *     & dup(1 << (elem_width - 1))
+     * a0000000b0000000c0000000d0000000e0000000f0000000g0000000h0000000
+     *     << 32 - 4
+     * 0000e0000000f0000000g0000000h00000000000000000000000000000000000
+     *     |
+     * a000e000b000f000c000g000d000h000e0000000f0000000g0000000h0000000
+     *     << 16 - 2
+     * 00c000g000d000h000e0000000f0000000g0000000h000000000000000000000
+     *     |
+     * a0c0e0g0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h0000000
+     *     << 8 - 1
+     * 0b0d0f0h0c0e0g000d0f0h000e0g00000f0h00000g0000000h00000000000000
+     *     |
+     * abcdefghbcdefgh0cdefgh00defgh000efgh0000fgh00000gh000000h0000000
+     */
+    for (i = elem_count_half / 2, j = 32; i > 0; i >>= 1, j >>= 1) {
+        tcg_gen_shli_i64(t0, hi, j - i);
+        tcg_gen_shli_i64(t1, lo, j - i);
+        tcg_gen_or_i64(hi, hi, t0);
+        tcg_gen_or_i64(lo, lo, t1);
+    }
+
+    tcg_gen_shri_i64(hi, hi, 64 - elem_count_half);
+    tcg_gen_extract2_i64(lo, lo, hi, 64 - elem_count_half);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], lo);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    tcg_temp_free_i64(t0);
+    tcg_temp_free_i64(t1);
+
+    return true;
+}
+
+TRANS(VEXTRACTBM, do_vextractm, MO_8)
+TRANS(VEXTRACTHM, do_vextractm, MO_16)
+TRANS(VEXTRACTWM, do_vextractm, MO_32)
+TRANS(VEXTRACTDM, do_vextractm, MO_64)
+
+static bool trans_VEXTRACTQM(DisasContext *ctx, arg_VX_tb *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    tmp = tcg_temp_new_i64();
+
+    get_avr64(tmp, a->vrb, true);
+    tcg_gen_shri_i64(tmp, tmp, 63);
+    tcg_gen_trunc_i64_tl(cpu_gpr[a->vrt], tmp);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.31.1


