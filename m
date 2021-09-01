Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67E3FD7F2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:45:40 +0200 (CEST)
Received: from localhost ([::1]:36674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNkR-00045C-VM
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcD-0006xB-Ka
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:09 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc9-0005hK-QI
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:09 -0400
Received: by mail-wr1-x433.google.com with SMTP id u9so3716034wrg.8
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XWsZ0dwwlBs0O41NutAlFgZAHDfWz5UxtIKmvjeuAtQ=;
 b=Es67gE50caPeNr6pRilcZkHar8VNd+DioxcnXFGVZ79XJ7uFWV2FilD4d0t1nbXiuZ
 EKakJ5nhoQnMW6Q8XnqlrtpLcyTt1a0L0pZXwWjgT4Nvn+BFSweCqufYsk7WH4sanPg3
 Mcgr63UXh05fYNeboWPE2xjiTxPGlim8/OOYLgjN3jZ1seSuu01N8KUF1o5bhsT1Zd8f
 0vY3MxvDYso+DATwWwW4KrLcJ0+/YrT5mXkIGMzWLckQ3tJ2JsC/9CJJXCFm0HoEqR1z
 bMOdtvE6o1GVuTOGchz0oE100y5bSUkKZ+4aECnaxWjxpecxOzFEAxrVnfhMDlxdNkVq
 C3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWsZ0dwwlBs0O41NutAlFgZAHDfWz5UxtIKmvjeuAtQ=;
 b=l4Sv0yTgtzRaA4v+yLO5cKZCRgzfA/auck8nmuamvf8SaWvz/hbTfYLHX0YBo+gVwi
 O1/arufLLyCDygmWmm/3jH1RvjosrRizjlSTbJuOxW+tR1oH2s407uiLumBZ5QbV1ZA1
 d/hyy2zFIbXQiq3+qSc9l7SFXv9ErjDfi/Cnmipu1Gnff1qKJQrCVjjAfgRI1yfQRrb+
 QBX5WDnqYT169NfZWSAPrhhaZyT72jGqPhComJLdy3opZVeDGcXfIku57mwWZiaLNqg0
 WdjkMV1LEXMLzOtYPnMa4ZQ8XkMba8NpoJykFaPys3sOjUvi/Fd9MCusceQfZRK1jwWi
 3+Eg==
X-Gm-Message-State: AOAM531SzR5YTNQy+CaM8XVXGdzB/z/++/HPIQqOcDV7bPvrNKkB/UFW
 zYsKt7+uWWwMyYQRNrEYwQiG6+Vq4GitXA==
X-Google-Smtp-Source: ABdhPJwDXPHJZ4agxrvP1ToFRuGJWFm1xjnbNikzq7fa3+nUpDsjKZ3YWlhdAoCgB7pHCsRt5ygqhA==
X-Received: by 2002:adf:d191:: with SMTP id v17mr24157291wrc.345.1630492624449; 
 Wed, 01 Sep 2021 03:37:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/51] target/arm: Implement MVE scalar fp insns
Date: Wed,  1 Sep 2021 11:36:14 +0100
Message-Id: <20210901103653.13435-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Implement the MVE scalar floating point insns VADD, VSUB and VMUL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  9 +++++++++
 target/arm/mve.decode      | 27 +++++++++++++++++++++------
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 20 ++++++++++++++++++++
 4 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 57ab3f7b59f..091ec4b4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -800,3 +800,12 @@ DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfadd_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfsub_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index b0622e1f62c..5ba8b6deeaa 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -31,6 +31,8 @@
 %2op_fp_size 20:1 !function=neon_3same_fp_size
 # VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
 %2op_fp_size_rev 20:1 !function=plus_1
+# FP scalars have size in bit 28, 1 for 16 bit, 0 for 32 bit
+%2op_fp_scalar_size 28:1 !function=neon_3same_fp_size
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -135,6 +137,9 @@
 @vmaxnma  .... .... .... .... .... .... .... .... &2op \
           qd=%qd qn=%qd qm=%qm
 
+@2op_fp_scalar .... .... .... .... .... .... .... rm:4 &2scalar \
+               qd=%qd qn=%qn size=%2op_fp_scalar_size
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -471,10 +476,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VBRSR           1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 }
 
-VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
-VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+{
+  VADD_fp_scalar  111 . 1110 0 . 11 ... 0 ... 0 1111 . 100 .... @2op_fp_scalar
+  VHADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+  VHADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+}
+
+{
+  VSUB_fp_scalar  111 . 1110 0 . 11 ... 0 ... 1 1111 . 100 .... @2op_fp_scalar
+  VHSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+  VHSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+}
 
 {
   VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
@@ -490,8 +502,11 @@ VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
                   size=%size_28
 }
 
-VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
-VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+{
+  VMUL_fp_scalar  111 . 1110 0 . 11 ... 1 ... 0 1110 . 110 .... @2op_fp_scalar
+  VQDMULH_scalar  1110  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+  VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+}
 
 # The U bit (28) is don't-care because it does not affect the result
 VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a6ad894414a..b49975fdc01 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3040,3 +3040,38 @@ DO_VCMLA(vcmla180h, 2, float16, 2, DO_VCMLAH)
 DO_VCMLA(vcmla180s, 4, float32, 2, DO_VCMLAS)
 DO_VCMLA(vcmla270h, 2, float16, 3, DO_VCMLAH)
 DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
+
+#define DO_2OP_FP_SCALAR(OP, ESIZE, TYPE, FN)                           \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, uint32_t rm)        \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE r, m = rm;                                                 \
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
+            r = FN(n[H##ESIZE(e)], m, fpst);                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_2OP_FP_SCALAR_ALL(OP, FN)                    \
+    DO_2OP_FP_SCALAR(OP##h, 2, float16, float16_##FN)   \
+    DO_2OP_FP_SCALAR(OP##s, 4, float32, float32_##FN)
+
+DO_2OP_FP_SCALAR_ALL(vfadd_scalar, add)
+DO_2OP_FP_SCALAR_ALL(vfsub_scalar, sub)
+DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4d702da808d..bc4b3f840a0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -960,6 +960,26 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
     return do_2op_scalar(s, a, fns[a->size]);
 }
 
+
+#define DO_2OP_FP_SCALAR(INSN, FN)                              \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
+DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
+DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
-- 
2.20.1


