Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 818DB3F73B5
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:52:08 +0200 (CEST)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqVr-0005TH-IJ
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGH-0003wI-BG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGE-0005UF-NE
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:36:01 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so20022044wrr.6
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rmaXRFhzA84467Map0exaJ0g7V5QOi2vgBWwnWDrh20=;
 b=Ya8nvbsIITLHEbGo9C9gVRj3tDDMfQg04E553+jvgGa1uaRGSHWLeQD/ZglyD9vHLg
 8dglgKX1xQJaRpmA+Mb4cJXmHah8HgHmNLhVaBNK+VTCL89WR4Scg3HfQd/HVfenp5Pk
 JB/SoapdrFcm7+Sazg/UYFQFoM1HlfZogZtSyNft0iwUr+lgecQ5NJTWKpMpJ9nqrd58
 7fHp7J4d42tdp9vHsGKpws5yNQjwXPQvaaMuRE7M3PM3Zt/Eml9ixyRAqy2LOi6qDxvA
 SLF+ceqPyViWtSJUxFX1e07qMfJ6wD5cwA856WC38hHoCGI65R3nFf9Esj3KOofOG2at
 lT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmaXRFhzA84467Map0exaJ0g7V5QOi2vgBWwnWDrh20=;
 b=ahjkq18N3tEO2r7o3eeZlYjSugsQ3j2KNlUtfPEAsSyVTCd6M7MERmNHCHSJ4cO/Bd
 u62rjwtjAdY3loWXYnpRqdrjI3q6Dd6Sg/ijTm7GFXzzMpNeCkdQNT98iVB0pTcVTDTm
 VsmximnMSLSKXmJxITSpCx4Nagir/LjiS0qXc6DJBTAdENN1YMZ8L6ZhTI6eDExShA5P
 8T988j4W22f9Um8xdtpUhUv55W9nY5bUzY5GTZ31YkWdO3NNqWLO4duDcXzAy0OQF7Do
 /tFor6StRav3D0XQFTnGLvs66M7/AtUvaMsTpedJHChjLFF/GONf674Bk5MHUDJWXyue
 MXGQ==
X-Gm-Message-State: AOAM532vyVt1rBjfG3eyI7svhWduhkdDHWc1Izk8ukqZZ8vOJJKGUhSR
 354Uwnde+zizox/OAg6RMzQo/7NKnZG6DA==
X-Google-Smtp-Source: ABdhPJxfc9qjP5W9XrTxrQfWuqMJCuowGgo2naZ3Ikpv7RAzlfRuqkRbynlgDHsvFt1JkpAG3aYJ7A==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr19527622wrq.147.1629887757342; 
 Wed, 25 Aug 2021 03:35:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/44] target/arm: Implement MVE narrowing moves
Date: Wed, 25 Aug 2021 11:35:13 +0100
Message-Id: <20210825103534.6936-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE narrowing move insns VMOVN, VQMOVN and VQMOVUN.
These take a double-width input, narrow it (possibly saturating) and
store the result to either the top or bottom half of the output
element.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 20 ++++++++++
 target/arm/mve.decode      | 12 ++++++
 target/arm/mve_helper.c    | 78 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 22 +++++++++++
 4 files changed, 132 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c7e7aab2cbb..17484f74323 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -76,6 +76,26 @@ DEF_HELPER_FLAGS_3(mve_vnegw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfnegs, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vmovnbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vmovnth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovunbb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunbh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovuntb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovunth, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntsh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vqmovnbub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovnbuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntub, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vqmovntuh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vand, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vbic, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vorr, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c8a06edca78..d295a693b18 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -153,6 +153,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNB       111 0 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BS      111 0 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -160,6 +163,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNB         111 1 1110 0 . 11 .. 01 ... 0 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_BU      111 1 1110 0 . 11 .. 11 ... 0 1110 0 0 . 0 ... 1 @1op
+
   VMULH_U        111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -167,6 +173,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VQMOVUNT       111 0 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TS      111 0 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
@@ -174,6 +183,9 @@ VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
   VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
+  VMOVNT         111 1 1110 0 . 11 .. 01 ... 1 1110 1 0 . 0 ... 1 @1op
+  VQMOVN_TU      111 1 1110 0 . 11 .. 11 ... 1 1110 0 0 . 0 ... 1 @1op
+
   VRMULH_U       111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
 }
 
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index fed0f3cd610..72c30f360ac 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1650,6 +1650,84 @@ DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
 DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
 DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
 
+#define DO_VMOVN(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE)                   \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)],                       \
+                      m[H##LESIZE(le)], mask);                          \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VMOVN(vmovnbb, false, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnbh, false, 2, uint16_t, 4, uint32_t)
+DO_VMOVN(vmovntb, true, 1, uint8_t, 2, uint16_t)
+DO_VMOVN(vmovnth, true, 2, uint16_t, 4, uint32_t)
+
+#define DO_VMOVN_SAT(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)           \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        LTYPE *m = vm;                                                  \
+        TYPE *d = vd;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        bool qc = false;                                                \
+        unsigned le;                                                    \
+        mask >>= ESIZE * TOP;                                           \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            TYPE r = FN(m[H##LESIZE(le)], &sat);                        \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);             \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VMOVN_SAT_UB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, uint8_t, 2, uint16_t, FN)       \
+    DO_VMOVN_SAT(TOP, true, 1, uint8_t, 2, uint16_t, FN)
+
+#define DO_VMOVN_SAT_UH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, uint16_t, 4, uint32_t, FN)      \
+    DO_VMOVN_SAT(TOP, true, 2, uint16_t, 4, uint32_t, FN)
+
+#define DO_VMOVN_SAT_SB(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 1, int8_t, 2, int16_t, FN)         \
+    DO_VMOVN_SAT(TOP, true, 1, int8_t, 2, int16_t, FN)
+
+#define DO_VMOVN_SAT_SH(BOP, TOP, FN)                           \
+    DO_VMOVN_SAT(BOP, false, 2, int16_t, 4, int32_t, FN)        \
+    DO_VMOVN_SAT(TOP, true, 2, int16_t, 4, int32_t, FN)
+
+#define DO_VQMOVN_SB(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT8_MIN, INT8_MAX, SATP)
+#define DO_VQMOVN_UB(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT8_MAX, SATP)
+#define DO_VQMOVUN_B(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT8_MAX, SATP)
+
+#define DO_VQMOVN_SH(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), INT16_MIN, INT16_MAX, SATP)
+#define DO_VQMOVN_UH(N, SATP)                           \
+    do_sat_bhs((uint64_t)(N), 0, UINT16_MAX, SATP)
+#define DO_VQMOVUN_H(N, SATP)                           \
+    do_sat_bhs((int64_t)(N), 0, UINT16_MAX, SATP)
+
+DO_VMOVN_SAT_SB(vqmovnbsb, vqmovntsb, DO_VQMOVN_SB)
+DO_VMOVN_SAT_SH(vqmovnbsh, vqmovntsh, DO_VQMOVN_SH)
+DO_VMOVN_SAT_UB(vqmovnbub, vqmovntub, DO_VQMOVN_UB)
+DO_VMOVN_SAT_UH(vqmovnbuh, vqmovntuh, DO_VQMOVN_UH)
+DO_VMOVN_SAT_SB(vqmovunbb, vqmovuntb, DO_VQMOVUN_B)
+DO_VMOVN_SAT_SH(vqmovunbh, vqmovunth, DO_VQMOVUN_H)
+
 uint32_t HELPER(mve_vshlc)(CPUARMState *env, void *vd, uint32_t rdm,
                            uint32_t shift)
 {
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 247f6719e6f..5c3655efc3c 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -275,6 +275,28 @@ DO_1OP(VCLS, vcls)
 DO_1OP(VABS, vabs)
 DO_1OP(VNEG, vneg)
 
+/* Narrowing moves: only size 0 and 1 are valid */
+#define DO_VMOVN(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        static MVEGenOneOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            NULL,                                               \
+            NULL,                                               \
+        };                                                      \
+        return do_1op(s, a, fns[a->size]);                      \
+    }
+
+DO_VMOVN(VMOVNB, vmovnb)
+DO_VMOVN(VMOVNT, vmovnt)
+DO_VMOVN(VQMOVUNB, vqmovunb)
+DO_VMOVN(VQMOVUNT, vqmovunt)
+DO_VMOVN(VQMOVN_BS, vqmovnbs)
+DO_VMOVN(VQMOVN_TS, vqmovnts)
+DO_VMOVN(VQMOVN_BU, vqmovnbu)
+DO_VMOVN(VQMOVN_TU, vqmovntu)
+
 static bool trans_VREV16(DisasContext *s, arg_1op *a)
 {
     static MVEGenOneOpFn * const fns[] = {
-- 
2.20.1


