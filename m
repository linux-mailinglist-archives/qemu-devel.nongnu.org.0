Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20691487D49
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 20:48:48 +0100 (CET)
Received: from localhost ([::1]:54106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5vEF-0006lY-61
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 14:48:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uTE-0003zA-Qr; Fri, 07 Jan 2022 14:00:15 -0500
Received: from [201.28.113.2] (port=57882 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1n5uTD-0007kV-6G; Fri, 07 Jan 2022 14:00:12 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 7 Jan 2022 15:57:42 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A71B7800473;
 Fri,  7 Jan 2022 15:57:42 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 23/37] target/ppc: Implement xxpermx instruction
Date: Fri,  7 Jan 2022 15:56:39 -0300
Message-Id: <20220107185653.1609775-24-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
References: <20220107185653.1609775-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jan 2022 18:57:42.0996 (UTC)
 FILETIME=[73615140:01D803F8]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  1 +
 target/ppc/insn64.decode            |  8 ++++++++
 target/ppc/int_helper.c             | 20 ++++++++++++++++++++
 target/ppc/translate/vsx-impl.c.inc | 22 ++++++++++++++++++++++
 4 files changed, 51 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index bedd2896d3..2a4cd89643 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -502,6 +502,7 @@ DEF_HELPER_3(xvrspim, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspip, void, env, vsr, vsr)
 DEF_HELPER_3(xvrspiz, void, env, vsr, vsr)
 DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
+DEF_HELPER_5(XXPERMX, void, vsr, vsr, vsr, vsr, tl)
 DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
 DEF_HELPER_3(xvxsigsp, void, env, vsr, vsr)
 DEF_HELPER_5(XXBLENDVB, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode
index 9e4f531fb9..0963e064b1 100644
--- a/target/ppc/insn64.decode
+++ b/target/ppc/insn64.decode
@@ -54,6 +54,11 @@
                 ...... ..... ..... ..... ..... .. .... \
                 &8RR_XX4 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
 
+&8RR_XX4_uim3   xt xa xb xc uim3
+@8RR_XX4_uim3   ...... .. .... .. ............... uim3:3 \
+                ...... ..... ..... ..... ..... .. ....   \
+                &8RR_XX4_uim3 xt=%8rr_xx_xt xa=%8rr_xx_xa xb=%8rr_xx_xb xc=%8rr_xx_xc
+
 ### Fixed-Point Load Instructions
 
 PLBZ            000001 10 0--.-- .................. \
@@ -194,3 +199,6 @@ XXBLENDVH       000001 01 0000 -- ------------------ \
                 100001 ..... ..... ..... ..... 01 ....  @8RR_XX4
 XXBLENDVB       000001 01 0000 -- ------------------ \
                 100001 ..... ..... ..... ..... 00 ....  @8RR_XX4
+
+XXPERMX         000001 01 0000 -- --------------- ... \
+                100010 ..... ..... ..... ..... 00 ....  @8RR_XX4_uim3
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 3c604a5c09..27739400e4 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1153,6 +1153,26 @@ void helper_VMULHUD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, uint32_t desc)
     mulu64(&discard, &r->u64[1], a->u64[1], b->u64[1]);
 }
 
+void helper_XXPERMX(ppc_vsr_t *t, ppc_vsr_t *s0, ppc_vsr_t *s1, ppc_vsr_t *pcv,
+                    target_ulong uim)
+{
+    int i, idx;
+    ppc_vsr_t tmp = { .u64 = {0, 0} };
+
+    for (i = 0; i < ARRAY_SIZE(t->u8); i++) {
+        if ((pcv->VsrB(i) >> 5) == uim) {
+            idx = pcv->VsrB(i) & 0x1f;
+            if (idx < ARRAY_SIZE(t->u8)) {
+                tmp.VsrB(i) = s0->VsrB(idx);
+            } else {
+                tmp.VsrB(i) = s1->VsrB(idx - ARRAY_SIZE(t->u8));
+            }
+        }
+    }
+
+    *t = tmp;
+}
+
 void helper_VPERM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     ppc_avr_t result;
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 1cb626da2d..4ac4399235 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1232,6 +1232,28 @@ static bool trans_XXPERMDI(DisasContext *ctx, arg_XX3_dm *a)
     return true;
 }
 
+static bool trans_XXPERMX(DisasContext *ctx, arg_8RR_XX4_uim3 *a)
+{
+    TCGv_ptr xt, xa, xb, xc;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt = gen_vsr_ptr(a->xt);
+    xa = gen_vsr_ptr(a->xa);
+    xb = gen_vsr_ptr(a->xb);
+    xc = gen_vsr_ptr(a->xc);
+
+    gen_helper_XXPERMX(xt, xa, xb, xc, tcg_constant_tl(a->uim3));
+
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xa);
+    tcg_temp_free_ptr(xb);
+    tcg_temp_free_ptr(xc);
+
+    return true;
+}
+
 #define GEN_VSX_HELPER_VSX_MADD(name, op1, aop, mop, inval, type)             \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.25.1


