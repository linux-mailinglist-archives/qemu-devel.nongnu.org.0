Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2CD49B554
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 14:49:41 +0100 (CET)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCMCX-0000UO-P9
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 08:49:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAK-0001MU-O8; Tue, 25 Jan 2022 07:43:16 -0500
Received: from [187.72.171.209] (port=41125 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1nCLAI-0007RA-Ou; Tue, 25 Jan 2022 07:43:16 -0500
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 25 Jan 2022 09:20:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C9A438009AB;
 Tue, 25 Jan 2022 09:20:38 -0300 (-03)
From: matheus.ferst@eldorado.org.br
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 14/38] target/ppc: implement vstri[bh][lr]
Date: Tue, 25 Jan 2022 09:19:19 -0300
Message-Id: <20220125121943.3269077-15-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
References: <20220125121943.3269077-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Jan 2022 12:20:39.0135 (UTC)
 FILETIME=[F6B01EF0:01D811E5]
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
 clg@kaod.org, Matheus Ferst <matheus.ferst@eldorado.org.br>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/helper.h                 |  4 ++++
 target/ppc/insn32.decode            | 10 +++++++++
 target/ppc/int_helper.c             | 32 +++++++++++++++++++++++++++++
 target/ppc/translate/vmx-impl.c.inc | 24 ++++++++++++++++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 8d542f4d8a..2858073772 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -216,6 +216,10 @@ DEF_HELPER_4(VINSBLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSHLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSWLX, void, env, avr, i64, tl)
 DEF_HELPER_4(VINSDLX, void, env, avr, i64, tl)
+DEF_HELPER_4(VSTRIBL, void, env, avr, avr, tl)
+DEF_HELPER_4(VSTRIBR, void, env, avr, avr, tl)
+DEF_HELPER_4(VSTRIHL, void, env, avr, avr, tl)
+DEF_HELPER_4(VSTRIHR, void, env, avr, avr, tl)
 DEF_HELPER_2(vnegw, void, avr, avr)
 DEF_HELPER_2(vnegd, void, avr, avr)
 DEF_HELPER_2(vupkhpx, void, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 605e66872e..ea497ecd80 100644
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
 
@@ -491,6 +494,13 @@ VEXTRACTQM      000100 ..... 01100 ..... 11001000010    @VX_tb
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
index 1c5e6acda1..e98dedcdf5 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1640,6 +1640,38 @@ VEXTRACT(uw, u32)
 VEXTRACT(d, u64)
 #undef VEXTRACT
 
+#define VSTRI(NAME, ELEM, NUM_ELEMS, LEFT) \
+void helper_##NAME(CPUPPCState *env, ppc_avr_t *t, ppc_avr_t *b,    \
+                   target_ulong rc)                                 \
+{                                                                   \
+    bool null_found = false;                                        \
+    int i, idx;                                                     \
+                                                                    \
+    for (i = 0; i < NUM_ELEMS; i++) {                               \
+        idx = LEFT ? i : NUM_ELEMS - i - 1;                         \
+        if (b->Vsr##ELEM(idx)) {                                    \
+            t->Vsr##ELEM(idx) = b->Vsr##ELEM(idx);                  \
+        } else {                                                    \
+            null_found = true;                                      \
+            break;                                                  \
+        }                                                           \
+    }                                                               \
+                                                                    \
+    for (; i < NUM_ELEMS; i++) {                                    \
+        idx = LEFT ? i : NUM_ELEMS - i - 1;                         \
+        t->Vsr##ELEM(idx) = 0;                                      \
+    }                                                               \
+                                                                    \
+    if (rc) {                                                       \
+        env->crf[6] = null_found ? 0b0010 : 0;                      \
+    }                                                               \
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
index 2c13fbeb39..8bcf637ff8 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1932,6 +1932,30 @@ static bool trans_MTVSRBMI(DisasContext *ctx, arg_DX_b *a)
     return true;
 }
 
+static bool do_vstri(DisasContext *ctx, arg_VX_tb_rc *a,
+                     void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv))
+{
+    TCGv_ptr vrt, vrb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vrb = gen_avr_ptr(a->vrb);
+
+    gen_helper(cpu_env, vrt, vrb, tcg_constant_tl(a->rc));
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


