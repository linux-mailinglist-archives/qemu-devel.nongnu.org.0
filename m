Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B561D50D5BD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 00:29:57 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nikjs-0006GW-SR
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 18:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTn-0002HO-TR
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:21 -0400
Received: from nowt.default.pbrook.uk0.bigv.io
 ([2001:41c8:51:832:fcff:ff:fe00:46dd]:58848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paul@nowt.org>) id 1nikTl-0002u8-OK
 for qemu-devel@nongnu.org; Sun, 24 Apr 2022 18:13:19 -0400
Received: from cpc91554-seac25-2-0-cust857.7-2.cable.virginm.net
 ([82.27.199.90] helo=wren.home)
 by nowt.default.pbrook.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
 (envelope-from <paul@nowt.org>)
 id 1nikJ8-0001ea-W4; Sun, 24 Apr 2022 23:02:19 +0100
From: Paul Brook <paul@nowt.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 21/42] i386: AVX+AES helpers
Date: Sun, 24 Apr 2022 23:01:43 +0100
Message-Id: <20220424220204.2493824-22-paul@nowt.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220418173904.3746036-1-paul@nowt.org>
References: <20220418173904.3746036-1-paul@nowt.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41c8:51:832:fcff:ff:fe00:46dd;
 envelope-from=paul@nowt.org; helo=nowt.default.pbrook.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Paul Brook <paul@nowt.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the AES vector helpers AVX ready

No functional changes to existing helpers

Signed-off-by: Paul Brook <paul@nowt.org>
---
 target/i386/ops_sse.h        | 63 ++++++++++++++++++++++++++----------
 target/i386/ops_sse_header.h | 55 ++++++++++++++++++++++---------
 2 files changed, 85 insertions(+), 33 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index b7100fdce1..48cec40074 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2929,64 +2929,92 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4*i+0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4*i+1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4*i+2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4*i+3])]);
+        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * i + 0])] ^
+                                    AES_Td1[st.B(AES_ishifts[4 * i + 1])] ^
+                                    AES_Td2[st.B(AES_ishifts[4 * i + 2])] ^
+                                    AES_Td3[st.B(AES_ishifts[4 * i + 3])]);
     }
+#if SHIFT == 2
+    for (i = 0 ; i < 4 ; i++) {
+        d->L(i + 4) = rk.L(i + 4) ^ bswap32(
+                AES_Td0[st.B(AES_ishifts[4 * i + 0] + 16)] ^
+                AES_Td1[st.B(AES_ishifts[4 * i + 1] + 16)] ^
+                AES_Td2[st.B(AES_ishifts[4 * i + 2] + 16)] ^
+                AES_Td3[st.B(AES_ishifts[4 * i + 3] + 16)]);
+    }
+#endif
 }
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
         d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i])]);
     }
+#if SHIFT == 2
+    for (i = 0; i < 16; i++) {
+        d->B(i + 16) = rk.B(i + 16) ^ (AES_isbox[st.B(AES_ishifts[i] + 16)]);
+    }
+#endif
 }
 
 void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4*i+0])] ^
-                                    AES_Te1[st.B(AES_shifts[4*i+1])] ^
-                                    AES_Te2[st.B(AES_shifts[4*i+2])] ^
-                                    AES_Te3[st.B(AES_shifts[4*i+3])]);
+        d->L(i) = rk.L(i) ^ bswap32(AES_Te0[st.B(AES_shifts[4 * i + 0])] ^
+                                    AES_Te1[st.B(AES_shifts[4 * i + 1])] ^
+                                    AES_Te2[st.B(AES_shifts[4 * i + 2])] ^
+                                    AES_Te3[st.B(AES_shifts[4 * i + 3])]);
     }
+#if SHIFT == 2
+    for (i = 0 ; i < 4 ; i++) {
+        d->L(i + 4) = rk.L(i + 4) ^ bswap32(
+                AES_Te0[st.B(AES_shifts[4 * i + 0] + 16)] ^
+                AES_Te1[st.B(AES_shifts[4 * i + 1] + 16)] ^
+                AES_Te2[st.B(AES_shifts[4 * i + 2] + 16)] ^
+                AES_Te3[st.B(AES_shifts[4 * i + 3] + 16)]);
+    }
+#endif
 }
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
-    Reg st = *d;
+    Reg st = *d; // v
     Reg rk = *s;
 
     for (i = 0; i < 16; i++) {
         d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i])]);
     }
-
+#if SHIFT == 2
+    for (i = 0; i < 16; i++) {
+        d->B(i + 16) = rk.B(i + 16) ^ (AES_sbox[st.B(AES_shifts[i] + 16)]);
+    }
+#endif
 }
 
+#if SHIFT == 1
 void glue(helper_aesimc, SUFFIX)(CPUX86State *env, Reg *d, Reg *s)
 {
     int i;
     Reg tmp = *s;
 
     for (i = 0 ; i < 4 ; i++) {
-        d->L(i) = bswap32(AES_imc[tmp.B(4*i+0)][0] ^
-                          AES_imc[tmp.B(4*i+1)][1] ^
-                          AES_imc[tmp.B(4*i+2)][2] ^
-                          AES_imc[tmp.B(4*i+3)][3]);
+        d->L(i) = bswap32(AES_imc[tmp.B(4 * i + 0)][0] ^
+                          AES_imc[tmp.B(4 * i + 1)][1] ^
+                          AES_imc[tmp.B(4 * i + 2)][2] ^
+                          AES_imc[tmp.B(4 * i + 3)][3]);
     }
 }
 
@@ -3004,6 +3032,7 @@ void glue(helper_aeskeygenassist, SUFFIX)(CPUX86State *env, Reg *d, Reg *s,
     d->L(3) = (d->L(2) << 24 | d->L(2) >> 8) ^ ctrl;
 }
 #endif
+#endif
 
 #undef SSE_HELPER_S
 
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index b8b0666f61..203afbb5a1 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -47,7 +47,7 @@ DEF_HELPER_3(glue(pslld, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psrlq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(psllq, SUFFIX), void, env, Reg, Reg)
 
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(psrldq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pslldq, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -105,7 +105,7 @@ SSE_HELPER_L(pcmpeql, FCMPEQ)
 
 SSE_HELPER_W(pmullw, FMULLW)
 #if SHIFT == 0
-SSE_HELPER_W(pmulhrw, FMULHRW)
+DEF_HELPER_3(glue(pmulhrw, SUFFIX), FMULHRW)
 #endif
 SSE_HELPER_W(pmulhuw, FMULHUW)
 SSE_HELPER_W(pmulhw, FMULHW)
@@ -117,7 +117,9 @@ DEF_HELPER_3(glue(pmuludq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaddwd, SUFFIX), void, env, Reg, Reg)
 
 DEF_HELPER_3(glue(psadbw, SUFFIX), void, env, Reg, Reg)
+#if SHIFT < 2
 DEF_HELPER_4(glue(maskmov, SUFFIX), void, env, Reg, Reg, tl)
+#endif
 DEF_HELPER_2(glue(movl_mm_T0, SUFFIX), void, Reg, i32)
 #ifdef TARGET_X86_64
 DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
@@ -126,17 +128,18 @@ DEF_HELPER_2(glue(movq_mm_T0, SUFFIX), void, Reg, i64)
 #if SHIFT == 0
 DEF_HELPER_3(glue(pshufw, SUFFIX), void, Reg, Reg, int)
 #else
-DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
-DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufd, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshuflw, SUFFIX), void, Reg, Reg, int)
 DEF_HELPER_3(glue(pshufhw, SUFFIX), void, Reg, Reg, int)
 #endif
 
-#if SHIFT == 1
+#if SHIFT >= 1
 /* FPU ops */
 /* XXX: not accurate */
 
+DEF_HELPER_3(glue(shufps, SUFFIX), void, Reg, Reg, int)
+DEF_HELPER_3(glue(shufpd, SUFFIX), void, Reg, Reg, int)
+
 #define SSE_HELPER_S(name, F)                            \
     DEF_HELPER_3(glue(name ## ps, SUFFIX), void, env, Reg, Reg)        \
     DEF_HELPER_3(name ## ss, void, env, Reg, Reg)        \
@@ -154,10 +157,18 @@ SSE_HELPER_S(sqrt, FPU_SQRT)
 
 DEF_HELPER_3(glue(cvtps2pd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtpd2ps, SUFFIX), void, env, Reg, Reg)
-DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
-DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtdq2ps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(cvtdq2pd, SUFFIX), void, env, Reg, Reg)
+
+DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
+
+#if SHIFT == 1
+DEF_HELPER_3(cvtss2sd, void, env, Reg, Reg)
+DEF_HELPER_3(cvtsd2ss, void, env, Reg, Reg)
 DEF_HELPER_3(cvtpi2ps, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtpi2pd, void, env, ZMMReg, MMXReg)
 DEF_HELPER_3(cvtsi2ss, void, env, ZMMReg, i32)
@@ -168,8 +179,6 @@ DEF_HELPER_3(cvtsq2ss, void, env, ZMMReg, i64)
 DEF_HELPER_3(cvtsq2sd, void, env, ZMMReg, i64)
 #endif
 
-DEF_HELPER_3(glue(cvtps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(cvtpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvtps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvtpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvtss2si, s32, env, ZMMReg)
@@ -179,8 +188,6 @@ DEF_HELPER_2(cvtss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvtsd2sq, s64, env, ZMMReg)
 #endif
 
-DEF_HELPER_3(glue(cvttps2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(glue(cvttpd2dq, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(cvttps2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_3(cvttpd2pi, void, env, MMXReg, ZMMReg)
 DEF_HELPER_2(cvttss2si, s32, env, ZMMReg)
@@ -189,15 +196,18 @@ DEF_HELPER_2(cvttsd2si, s32, env, ZMMReg)
 DEF_HELPER_2(cvttss2sq, s64, env, ZMMReg)
 DEF_HELPER_2(cvttsd2sq, s64, env, ZMMReg)
 #endif
+#endif
 
 DEF_HELPER_3(glue(rsqrtps, SUFFIX), void, env, ZMMReg, ZMMReg)
-DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(rcpps, SUFFIX), void, env, ZMMReg, ZMMReg)
+#if SHIFT == 1
+DEF_HELPER_3(rsqrtss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(rcpss, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(extrq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(extrq_i, void, env, ZMMReg, int, int)
 DEF_HELPER_3(insertq_r, void, env, ZMMReg, ZMMReg)
 DEF_HELPER_4(insertq_i, void, env, ZMMReg, int, int)
+#endif
 DEF_HELPER_3(glue(haddps, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(haddpd, SUFFIX), void, env, ZMMReg, ZMMReg)
 DEF_HELPER_3(glue(hsubps, SUFFIX), void, env, ZMMReg, ZMMReg)
@@ -220,10 +230,13 @@ SSE_HELPER_CMP(cmpnlt, FPU_CMPNLT)
 SSE_HELPER_CMP(cmpnle, FPU_CMPNLE)
 SSE_HELPER_CMP(cmpord, FPU_CMPORD)
 
+#if SHIFT == 1
 DEF_HELPER_3(ucomiss, void, env, Reg, Reg)
 DEF_HELPER_3(comiss, void, env, Reg, Reg)
 DEF_HELPER_3(ucomisd, void, env, Reg, Reg)
 DEF_HELPER_3(comisd, void, env, Reg, Reg)
+#endif
+
 DEF_HELPER_2(glue(movmskps, SUFFIX), i32, env, Reg)
 DEF_HELPER_2(glue(movmskpd, SUFFIX), i32, env, Reg)
 #endif
@@ -240,7 +253,7 @@ DEF_HELPER_3(glue(packssdw, SUFFIX), void, env, Reg, Reg)
 UNPCK_OP(l, 0)
 UNPCK_OP(h, 1)
 
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(punpcklqdq, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(punpckhqdq, SUFFIX), void, env, Reg, Reg)
 #endif
@@ -287,7 +300,7 @@ DEF_HELPER_3(glue(psignd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(palignr, SUFFIX), void, env, Reg, Reg, s32)
 
 /* SSE4.1 op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(pblendvb, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(blendvps, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(blendvpd, SUFFIX), void, env, Reg, Reg)
@@ -316,22 +329,30 @@ DEF_HELPER_3(glue(pmaxsd, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaxuw, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmaxud, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(pmulld, SUFFIX), void, env, Reg, Reg)
+#if SHIFT == 1
 DEF_HELPER_3(glue(phminposuw, SUFFIX), void, env, Reg, Reg)
+#endif
 DEF_HELPER_4(glue(roundps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundpd, SUFFIX), void, env, Reg, Reg, i32)
+#if SHIFT == 1
 DEF_HELPER_4(glue(roundss, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(roundsd, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(blendps, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(blendpd, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pblendw, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(dpps, SUFFIX), void, env, Reg, Reg, i32)
+#if SHIFT == 1
 DEF_HELPER_4(glue(dppd, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(mpsadbw, SUFFIX), void, env, Reg, Reg, i32)
 #endif
 
 /* SSE4.2 op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(pcmpgtq, SUFFIX), void, env, Reg, Reg)
+#endif
+#if SHIFT == 1
 DEF_HELPER_4(glue(pcmpestri, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpestrm, SUFFIX), void, env, Reg, Reg, i32)
 DEF_HELPER_4(glue(pcmpistri, SUFFIX), void, env, Reg, Reg, i32)
@@ -340,13 +361,15 @@ DEF_HELPER_3(crc32, tl, i32, tl, i32)
 #endif
 
 /* AES-NI op helpers */
-#if SHIFT == 1
+#if SHIFT >= 1
 DEF_HELPER_3(glue(aesdec, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesdeclast, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesenc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_3(glue(aesenclast, SUFFIX), void, env, Reg, Reg)
+#if SHIFT == 1
 DEF_HELPER_3(glue(aesimc, SUFFIX), void, env, Reg, Reg)
 DEF_HELPER_4(glue(aeskeygenassist, SUFFIX), void, env, Reg, Reg, i32)
+#endif
 DEF_HELPER_4(glue(pclmulqdq, SUFFIX), void, env, Reg, Reg, i32)
 #endif
 
-- 
2.36.0


