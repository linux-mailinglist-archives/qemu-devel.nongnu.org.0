Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2007A3F88CE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:26:17 +0200 (CEST)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFOa-0005BC-4j
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG9-0005ga-MJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG6-0004u5-5B
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:33 -0400
Received: by mail-wm1-x335.google.com with SMTP id m2so1859992wmm.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p1XI+jRVlOTUm8Ez3cTwjjeA2El6WaD6xfoJn4dKlxk=;
 b=HIiXYpfRAQxwLaCFZiy5T3qfkLXsWljTEvA9SBoqEyhTd52D3VOK0DLKI3VA9d5xeb
 7jn1w+fwnLUmcphFRo7ukZ7URFkvT0sa3d3Dx3LsgQZyZ0/0W6f5gDkZDIi+5W2/qqUd
 JjDsv2KoVtzzQtFRGNvfSWgzh/ZpQo1nKW54bt6chyl/7lb7ooElAnnYPuiGqWL3T7cf
 Qkpa4XZu15rJ3k6mfCdrH3sV0ahRWqSRDCU6Oe4DfnZGeEPpFeiGfK757COtmbOK+hEW
 0/n3GCkS7zlg2DeZxFe7mX+0o3uc7g0ZXI68Rq6geqzUDE8anZrtJkIEU/tZiC3/iqeZ
 sm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p1XI+jRVlOTUm8Ez3cTwjjeA2El6WaD6xfoJn4dKlxk=;
 b=W5BSX3XkrytSRjXRpvXhA0AdB67+teLEOFA36lqdY1GQmaqro1J4YNcGa9TF5DIlP8
 ohDHLN/0gRmrXujhNHdY2ZRNNEo1XlswEQzvIbAqS+H1CXAW+Nz9wKi9PWO+D3VvoM+l
 oeMOyuK+XyX67yqd6Kqaxg2hvPDE+waKbIIHQ45w+vmWdlHEEII8zGgz31UBI/nWVRPk
 FyX3aJV+RjP4rcAci5388Ru3pIJcBDx94QfmjlpgLQJSZj9QjhajNcn22H4MloyApbcx
 i3H3Yh5z3BHMjKs+kbOjz3cIljwZr2r6P1q2opQ80gIZQ7Fnw2U0pFjZvciLTqI497dr
 Zi4g==
X-Gm-Message-State: AOAM533MwCYvakwvTV2c4GjosKd1+w3iJ8qfEBYsFe+HLds4E14MQp9f
 TWAFFPLZLQrxm5BNpRkxfj6YMA==
X-Google-Smtp-Source: ABdhPJwklQsEVX5dviUPf7Mx7z7pV+7RweDrC/G81MVorxMRiZRAeJBpVij32WLcbrC/czOhDVJjyw==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr14380404wmi.123.1629983848532; 
 Thu, 26 Aug 2021 06:17:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/18] target/arm: Implement MVE VADD (floating-point)
Date: Thu, 26 Aug 2021 14:17:08 +0100
Message-Id: <20210826131725.22449-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Implement the MVE VADD (floating-point) insn.  Handling of this is
similar to the 2-operand integer insns, except that we must take care
to only update the floating point exception status if the least
significant bit of the predicate mask for each element is active.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use float16/float32 type; add DO_2OP_FP_ALL macro
to invoke DO_2OP_FP for both float16 and float32
---
 target/arm/helper-mve.h     |  3 +++
 target/arm/translate.h      |  6 ++++++
 target/arm/mve.decode       | 10 ++++++++++
 target/arm/mve_helper.c     | 40 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c  | 17 ++++++++++++++++
 target/arm/translate-neon.c |  6 ------
 6 files changed, 76 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 3db9b15f121..32fd2e1f9be 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -410,6 +410,9 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270b, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 241596c5bda..8636c20c3b4 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -181,6 +181,12 @@ static inline int rsub_8(DisasContext *s, int x)
     return 8 - x;
 }
 
+static inline int neon_3same_fp_size(DisasContext *s, int x)
+{
+    /* Convert 0==fp32, 1==fp16 into a MO_* value */
+    return MO_32 - x;
+}
+
 static inline int arm_dc_feature(DisasContext *dc, int feature)
 {
     return (dc->features & (1ULL << feature)) != 0;
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 87446816293..e211cb016c6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,6 +26,10 @@
 # VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
 %size_28 28:1 !function=plus_1
 
+# 2 operand fp insns have size in bit 20: 1 for 16 bit, 0 for 32 bit,
+# like Neon FP insns.
+%2op_fp_size 20:1 !function=neon_3same_fp_size
+
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
 
@@ -118,6 +122,9 @@
 
 @vmaxv .... .... .... size:2 .. rda:4 .... .... .... &vmaxv qm=%qm
 
+@2op_fp .... .... .... .... .... .... .... .... &2op \
+        qd=%qd qn=%qn qm=%qm size=%2op_fp_size
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -615,3 +622,6 @@ VCMPGE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 0 0 .... @vcmp_scalar
 VCMPLT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 0 0 .... @vcmp_scalar
 VCMPGT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 1 0 .... @vcmp_scalar
 VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
+
+# 2-operand FP
+VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c2826eb5f9f..abca7c0b2ab 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -25,6 +25,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
+#include "fpu/softfloat.h"
 
 static uint16_t mve_eci_mask(CPUARMState *env)
 {
@@ -2798,3 +2799,42 @@ DO_VMAXMINA(vmaxaw, 4, int32_t, uint32_t, DO_MAX)
 DO_VMAXMINA(vminab, 1, int8_t, uint8_t, DO_MIN)
 DO_VMAXMINA(vminah, 2, int16_t, uint16_t, DO_MIN)
 DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
+
+/*
+ * 2-operand floating point. Note that if an element is partially
+ * predicated we must do the FP operation to update the non-predicated
+ * bytes, but we must be careful to avoid updating the FP exception
+ * state unless byte 0 of the element was unpredicated.
+ */
+#define DO_2OP_FP(OP, ESIZE, TYPE, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r;                                                         \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], fpst);               \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_2OP_FP_ALL(OP, FN)                  \
+    DO_2OP_FP(OP##h, 2, float16, float16_##FN) \
+    DO_2OP_FP(OP##s, 4, float32, float32_##FN)
+
+DO_2OP_FP_ALL(vfadd, add)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 78229c44c68..d2c40ede564 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -831,6 +831,23 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vsbci);
 }
 
+#define DO_2OP_FP(INSN, FN)                                     \
+    static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
+    {                                                           \
+        static MVEGenTwoOpFn * const fns[] = {                  \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2op(s, a, fns[a->size]);                      \
+    }
+
+DO_2OP_FP(VADD_fp, vfadd)
+
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
 {
diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index c53ab20fa48..dd43de558e4 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -28,12 +28,6 @@
 #include "translate.h"
 #include "translate-a32.h"
 
-static inline int neon_3same_fp_size(DisasContext *s, int x)
-{
-    /* Convert 0==fp32, 1==fp16 into a MO_* value */
-    return MO_32 - x;
-}
-
 /* Include the generated Neon decoder */
 #include "decode-neon-dp.c.inc"
 #include "decode-neon-ls.c.inc"
-- 
2.20.1


