Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BB4BFB56
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:58:41 +0100 (CET)
Received: from localhost ([::1]:40498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMWci-0006uF-JG
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLL-0007A6-0O; Tue, 22 Feb 2022 09:40:43 -0500
Received: from [187.72.171.209] (port=46527 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nMWLI-0005jB-5o; Tue, 22 Feb 2022 09:40:42 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 22 Feb 2022 11:37:41 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 350568000A7;
 Tue, 22 Feb 2022 11:37:41 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 14/47] target/ppc: implement vstri[bh][lr]
Date: Tue, 22 Feb 2022 11:36:12 -0300
Message-Id: <20220222143646.1268606-15-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Feb 2022 14:37:41.0584 (UTC)
 FILETIME=[BF374500:01D827F9]
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
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v4:
 - vstri helpers return CR field (rth)
---
 target/ppc/helper.h                 |  4 ++++
 target/ppc/insn32.decode            | 10 ++++++++++
 target/ppc/int_helper.c             | 28 +++++++++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 30 +++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 303a29fb5a..269150b197 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -211,6 +211,10 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
+DEF_HELPER_2(VSTRIBL, i32, avr, avr)
+DEF_HELPER_2(VSTRIBR, i32, avr, avr)
+DEF_HELPER_2(VSTRIHL, i32, avr, avr)
+DEF_HELPER_2(VSTRIHR, i32, avr, avr)
 DEF_HELPER_2(vnegw, void, avr, avr)
 DEF_HELPER_2(vnegd, void, avr, avr)
 DEF_HELPER_2(vupkhpx, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f0cb6602e2..d844d86829 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -63,6 +63,9 @@
 &VX_bf          bf vra vrb
 @VX_bf          ...... bf:3 .. vra:5 vrb:5 ...........          &VX_bf
 
+&VX_tb_rc       vrt vrb rc:bool
+@VX_tb_rc       ...... vrt:5 ..... vrb:5 rc:1 ..........        &VX_tb_rc
+
 &VX_uim4        vrt uim vrb
 @VX_uim4        ...... vrt:5 . uim:4 vrb:5 ...........  &VX_uim4
 
@@ -519,6 +522,13 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
+## Vector String Instructions
+
+VSTRIBL         000100 ..... 00000 ..... . 0000001101   @VX_tb_rc
+VSTRIBR         000100 ..... 00001 ..... . 0000001101   @VX_tb_rc
+VSTRIHL         000100 ..... 00010 ..... . 0000001101   @VX_tb_rc
+VSTRIHR         000100 ..... 00011 ..... . 0000001101   @VX_tb_rc
+
 # VSX Load/Store Instructions
 
 LXV             111101 ..... ..... ............ . 001   @DQ_TSX
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index fce782499f..0a094b535a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1518,6 +1518,34 @@ VEXTRACT(uw, u32)
 VEXTRACT(d, u64)
 #undef VEXTRACT
 
+#define VSTRI(NAME, ELEM, NUM_ELEMS, LEFT) \
+uint32_t helper_##NAME(ppc_avr_t *t, ppc_avr_t *b) \
+{                                                   \
+    int i, idx, crf = 0;                            \
+                                                    \
+    for (i = 0; i < NUM_ELEMS; i++) {               \
+        idx = LEFT ? i : NUM_ELEMS - i - 1;         \
+        if (b->Vsr##ELEM(idx)) {                    \
+            t->Vsr##ELEM(idx) = b->Vsr##ELEM(idx);  \
+        } else {                                    \
+            crf = 0b0010;                           \
+            break;                                  \
+        }                                           \
+    }                                               \
+                                                    \
+    for (; i < NUM_ELEMS; i++) {                    \
+        idx = LEFT ? i : NUM_ELEMS - i - 1;         \
+        t->Vsr##ELEM(idx) = 0;                      \
+    }                                               \
+                                                    \
+    return crf;                                     \
+}
+VSTRI(VSTRIBL, B, 16, true)
+VSTRI(VSTRIBR, B, 16, false)
+VSTRI(VSTRIHL, H, 8, true)
+VSTRI(VSTRIHR, H, 8, false)
+#undef VSTRI
+
 void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
                         ppc_vsr_t *xb, uint32_t index)
 {
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 335bef56ff..1a69931d36 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1910,6 +1910,36 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
     return true;
 }
 
+static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
+                     void (*gen_helper)(TCGv_i32, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr vrt, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vrb = gen_avr_ptr(a->vrb);
+
+    if (a->rc) {
+        gen_helper(cpu_crf[6], vrt, vrb);
+    } else {
+        TCGv_i32 discard = tcg_temp_new_i32();
+        gen_helper(discard, vrt, vrb);
+        tcg_temp_free_i32(discard);
+    }
+
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vrb);
+
+    return true;
+}
+
+TRANS(VSTRIBL, do_vstri, gen_helper_VSTRIBL)
+TRANS(VSTRIBR, do_vstri, gen_helper_VSTRIBR)
+TRANS(VSTRIHL, do_vstri, gen_helper_VSTRIHL)
+TRANS(VSTRIHR, do_vstri, gen_helper_VSTRIHR)
+
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
 static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
     {                                                                   \
-- 
2.25.1


