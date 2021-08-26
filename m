Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CDC3F88AB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:21:17 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFJk-0001iJ-C5
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGL-0005nb-3W
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGE-00053k-Uh
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id n5so4964492wro.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xs6B7+cZoPUy7Z4wp0c6zsRI40KRsbDMVrcBCVg/eUo=;
 b=IurItslKxny7se0/kF5lUrK07EraA3//Js1xUB0a66cwRtu5yKJRHQSlBugCZhfJRC
 3yR4WqdNslgltqWLEV+noQZmHsLTOPAu7p04Wero0CNG3HdCPbGR4q3ov+mmPH1GwSLq
 fHQ6PrFj6AQ6xqwwsyfW6yDzqwhRnGNbC9z5hr1ReuEMM2f+qkgA+Msbqw3ofpZbIYuM
 A8Z34uzUd+w++0sN81Zpq0rMKxzrs2uSjeH4LD7B+OBPoVYkapoQxmy2l5ctKr1X7DqX
 8Icc1/RzeNokp9lWg1WPekZ6J+l2ZE8bMfCcJxBpVHE9Df4crwttTw2B2DXRWk3uxWlV
 F8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xs6B7+cZoPUy7Z4wp0c6zsRI40KRsbDMVrcBCVg/eUo=;
 b=J775caOcvke91QWPvZuMB+aiaGV5HaJN9AYIPFnkVR7Tdsvohu3/hBS5kevDzZkrqh
 9Tg5m4AnfX2d9GZlLjV1y/69YXyvUmtPNGqab3DIv0e/xNW78ddCe9ZRm2DdgeWma+UL
 1/dzED3Tru6ZFjdrZTUa0AabKYYavVD6RStgSn1bX+Vbb4ce8vEj4N9QgkOs1sjBK1bl
 +w9xTcgszq7Ee0/7RD5ZFYg4JZ3ySgD7cShxu3YyFsng1xNS5FcAz00T6BupnuT/AT5A
 iXPaIcLPXyUH4Z4pJyV1exVfVdsWnKDR7n1IkLVpgdmCId9gtwJdOzBms1/em6+xdarF
 lXyw==
X-Gm-Message-State: AOAM530ZAyXz14F+JtbFJtd4ErcxceTWk22vQPGJicZ6v8EolcIN94FK
 6Av4Hc8y4Kn8g9ZW4/e0NibNALS9XeT8cg==
X-Google-Smtp-Source: ABdhPJzSGc0ghPpSU+20WMaeLCns5OurNkGI6HBNpygNzapDmRd7XBrNOXNW3z8ZVcZIuF2b2+fUQw==
X-Received: by 2002:a5d:4564:: with SMTP id a4mr3813332wrc.81.1629983857483;
 Thu, 26 Aug 2021 06:17:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 12/18] target/arm: Implement MVE fp scalar comparisons
Date: Thu, 26 Aug 2021 14:17:19 +0100
Message-Id: <20210826131725.22449-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE fp scalar comparisons VCMP and VPT.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: Use float* types
---
 target/arm/helper-mve.h    | 18 +++++++++++
 target/arm/mve.decode      | 61 +++++++++++++++++++++++++++++--------
 target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++--------
 target/arm/translate-mve.c | 14 +++++++++
 4 files changed, 131 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 0c15c531641..9ee841cdf01 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -831,6 +831,24 @@ DEF_HELPER_FLAGS_3(mve_vfcmpgts, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vfcmples, TCG_CALL_NO_WG, void, env, ptr, ptr)
 
+DEF_HELPER_FLAGS_3(mve_vfcmpeq_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmpeq_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpne_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmpne_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpge_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmpge_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vfcmplt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmplt_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vfcmpgt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmpgt_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vfcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vfcmple_scalars, TCG_CALL_NO_WG, void, env, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vfadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfadd_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 7767ecae2ac..aa113279dc5 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -127,6 +127,11 @@
 @vcmp_fp .... .... .... qn:3 . .... .... .... .... &vcmp \
          qm=%qm size=%2op_fp_scalar_size mask=%mask_22_13
 
+# Bit 28 is a 2op_fp_scalar_size bit, but we do not decode it in this
+# format to avoid complicated overlapping-instruction-groups
+@vcmp_fp_scalar .... .... .... qn:3 . .... .... .... rm:4 &vcmp_scalar \
+                mask=%mask_22_13
+
 @vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
 
 @2op_fp .... .... .... .... .... .... .... .... &2op \
@@ -400,8 +405,10 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
   VIWDUP         1110 1110 0 . .. ... 1 ... 0 1111 . 110 ... . @viwdup
 }
 {
-  VDDUP          1110 1110 0 . .. ... 1 ... 1 1111 . 110 111 . @vidup
-  VDWDUP         1110 1110 0 . .. ... 1 ... 1 1111 . 110 ... . @viwdup
+  VCMPGT_fp_scalar 1110 1110 0 . 11 ... 1 ... 1 1111  0110 .... @vcmp_fp_scalar size=2
+  VCMPLE_fp_scalar 1110 1110 0 . 11 ... 1 ... 1 1111  1110 .... @vcmp_fp_scalar size=2
+  VDDUP            1110 1110 0 . .. ... 1 ... 1 1111 . 110 111 . @vidup
+  VDWDUP           1110 1110 0 . .. ... 1 ... 1 1111 . 110 ... . @viwdup
 }
 
 # multiply-add long dual accumulate
@@ -472,8 +479,17 @@ VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 
 # Scalar operations
 
-VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
-VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
+{
+  VCMPEQ_fp_scalar 1110 1110 0 . 11 ... 1 ... 0 1111  0100 .... @vcmp_fp_scalar size=2
+  VCMPNE_fp_scalar 1110 1110 0 . 11 ... 1 ... 0 1111  1100 .... @vcmp_fp_scalar size=2
+  VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
+}
+
+{
+  VCMPLT_fp_scalar 1110 1110 0 . 11 ... 1 ... 1 1111  1100 .... @vcmp_fp_scalar size=2
+  VCMPGE_fp_scalar 1110 1110 0 . 11 ... 1 ... 1 1111  0100 .... @vcmp_fp_scalar size=2
+  VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
+}
 
 {
   VSHL_S_scalar   1110 1110 0 . 11 .. 01 ... 1 1110 0110 .... @shl_scalar
@@ -703,17 +719,38 @@ VSHLC             111 0 1110 1 . 1 imm:5 ... 0 1111 1100 rdm:4 qd=%qd
 }
 
 {
-  VPNOT           1111 1110 0 0 11 000 1 000 0 1111 0100 1101
-  VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
-  VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
+  VPNOT            1111 1110 0 0 11 000 1 000 0 1111 0100 1101
+  VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
+  VCMPEQ_fp_scalar 1111 1110 0 . 11 ... 1 ... 0 1111 0100 .... @vcmp_fp_scalar size=1
+  VCMPEQ_scalar    1111 1110 0 . .. ... 1 ... 0 1111 0100 .... @vcmp_scalar
 }
-VCMPNE_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 0 0 .... @vcmp_scalar
+
+{
+  VCMPNE_fp_scalar 1111 1110 0 . 11 ... 1 ... 0 1111 1100 .... @vcmp_fp_scalar size=1
+  VCMPNE_scalar    1111 1110 0 . .. ... 1 ... 0 1111 1100 .... @vcmp_scalar
+}
+
+{
+  VCMPGT_fp_scalar 1111 1110 0 . 11 ... 1 ... 1 1111 0110 .... @vcmp_fp_scalar size=1
+  VCMPGT_scalar    1111 1110 0 . .. ... 1 ... 1 1111 0110 .... @vcmp_scalar
+}
+
+{
+  VCMPLE_fp_scalar 1111 1110 0 . 11 ... 1 ... 1 1111 1110 .... @vcmp_fp_scalar size=1
+  VCMPLE_scalar    1111 1110 0 . .. ... 1 ... 1 1111 1110 .... @vcmp_scalar
+}
+
+{
+  VCMPGE_fp_scalar 1111 1110 0 . 11 ... 1 ... 1 1111 0100 .... @vcmp_fp_scalar size=1
+  VCMPGE_scalar    1111 1110 0 . .. ... 1 ... 1 1111 0100 .... @vcmp_scalar
+}
+{
+  VCMPLT_fp_scalar 1111 1110 0 . 11 ... 1 ... 1 1111 1100 .... @vcmp_fp_scalar size=1
+  VCMPLT_scalar    1111 1110 0 . .. ... 1 ... 1 1111 1100 .... @vcmp_scalar
+}
+
 VCMPCS_scalar     1111 1110 0 . .. ... 1 ... 0 1111 0 1 1 0 .... @vcmp_scalar
 VCMPHI_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 1 0 .... @vcmp_scalar
-VCMPGE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 0 0 .... @vcmp_scalar
-VCMPLT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 0 0 .... @vcmp_scalar
-VCMPGT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 1 0 .... @vcmp_scalar
-VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
 
 # 2-operand FP
 VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 07a1ab88814..891926c124d 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3191,6 +3191,44 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_VCMP_FP_SCALAR(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,             \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *n = vn;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        bool r;                                                         \
+        for (e = 0; e < 16 / ESIZE; e++, emask <<= ESIZE) {             \
+            if ((mask & emask) == 0) {                                  \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & (1 << (e * ESIZE)))) {                         \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], (TYPE)rm, fpst);                     \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMP_FP_BOTH(VOP, SOP, ESIZE, TYPE, FN)      \
+    DO_VCMP_FP(VOP, ESIZE, TYPE, FN)                    \
+    DO_VCMP_FP_SCALAR(SOP, ESIZE, TYPE, FN)
+
 /*
  * Some care is needed here to get the correct result for the unordered case.
  * Architecturally EQ, GE and GT are defined to be false for unordered, but
@@ -3203,20 +3241,20 @@ DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
 #define DO_GT16(X, Y, S) float16_lt(Y, X, S)
 #define DO_GT32(X, Y, S) float32_lt(Y, X, S)
 
-DO_VCMP_FP(vfcmpeqh, 2, float16, float16_eq)
-DO_VCMP_FP(vfcmpeqs, 4, float32, float32_eq)
+DO_VCMP_FP_BOTH(vfcmpeqh, vfcmpeq_scalarh, 2, float16, float16_eq)
+DO_VCMP_FP_BOTH(vfcmpeqs, vfcmpeq_scalars, 4, float32, float32_eq)
 
-DO_VCMP_FP(vfcmpneh, 2, float16, !float16_eq)
-DO_VCMP_FP(vfcmpnes, 4, float32, !float32_eq)
+DO_VCMP_FP_BOTH(vfcmpneh, vfcmpne_scalarh, 2, float16, !float16_eq)
+DO_VCMP_FP_BOTH(vfcmpnes, vfcmpne_scalars, 4, float32, !float32_eq)
 
-DO_VCMP_FP(vfcmpgeh, 2, float16, DO_GE16)
-DO_VCMP_FP(vfcmpges, 4, float32, DO_GE32)
+DO_VCMP_FP_BOTH(vfcmpgeh, vfcmpge_scalarh, 2, float16, DO_GE16)
+DO_VCMP_FP_BOTH(vfcmpges, vfcmpge_scalars, 4, float32, DO_GE32)
 
-DO_VCMP_FP(vfcmplth, 2, float16, !DO_GE16)
-DO_VCMP_FP(vfcmplts, 4, float32, !DO_GE32)
+DO_VCMP_FP_BOTH(vfcmplth, vfcmplt_scalarh, 2, float16, !DO_GE16)
+DO_VCMP_FP_BOTH(vfcmplts, vfcmplt_scalars, 4, float32, !DO_GE32)
 
-DO_VCMP_FP(vfcmpgth, 2, float16, DO_GT16)
-DO_VCMP_FP(vfcmpgts, 4, float32, DO_GT32)
+DO_VCMP_FP_BOTH(vfcmpgth, vfcmpgt_scalarh, 2, float16, DO_GT16)
+DO_VCMP_FP_BOTH(vfcmpgts, vfcmpgt_scalars, 4, float32, DO_GT32)
 
-DO_VCMP_FP(vfcmpleh, 2, float16, !DO_GT16)
-DO_VCMP_FP(vfcmples, 4, float32, !DO_GT32)
+DO_VCMP_FP_BOTH(vfcmpleh, vfcmple_scalarh, 2, float16, !DO_GT16)
+DO_VCMP_FP_BOTH(vfcmples, vfcmple_scalars, 4, float32, !DO_GT32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index da14a6f790e..e8a3dec6683 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1771,6 +1771,20 @@ DO_VCMP(VCMPLE, vcmple)
             return false;                                       \
         }                                                       \
         return do_vcmp(s, a, fns[a->size]);                     \
+    }                                                           \
+    static bool trans_##INSN##_scalar(DisasContext *s,          \
+                                      arg_vcmp_scalar *a)       \
+    {                                                           \
+        static MVEGenScalarCmpFn * const fns[] = {              \
+            NULL,                                               \
+            gen_helper_mve_##FN##_scalarh,                      \
+            gen_helper_mve_##FN##_scalars,                      \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_vcmp_scalar(s, a, fns[a->size]);              \
     }
 
 DO_VCMP_FP(VCMPEQ_fp, vfcmpeq)
-- 
2.20.1


