Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E43F891C
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:37:45 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFZb-0001nG-DM
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-0005nR-Ce
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGC-0004zN-G1
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q14so5042226wrp.3
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7pXSqEbTOZyV/ZOun+vfAXrbcR65ur8jsORWu+DjPSw=;
 b=Jo1TvPzDkaR+O2R9XWgrIK+Ao0ZeNsxki24Z16eyrGFrkQ0D9f4yiBp9NUy6Ljmage
 gOLIbWU0tvsO1XNhMGdnimyWm3OYvfSoITTZS9z0vlna2EiL9TVIPnSCzWlhrwFy8bRW
 btIpbFzEbVFZJKlZLycPRW/raHFTk6uty5IU9rWe7jnHEv6yTcUE4c68+IreJ/8UHMQ6
 dGHK8UdmP6DT+G2MVR/cB04RWu2Be+v/9AJAxV3bjjkQa2soBQYBrhpfe60WjV6gA3DJ
 oedZaaFIIEsCaJCxAAClXqezbTQSjnZzW08it2EFKw8UMY0h5Bq68/+dQN9DkBjwKjYS
 I/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pXSqEbTOZyV/ZOun+vfAXrbcR65ur8jsORWu+DjPSw=;
 b=La53VLQ7jI4DOicxBzWhvAu+Hi6N9/V9U1cdVZHq+hSkym/eypd9D7Oat5qRGilnKr
 5RvyAf9hX4j+PviH5GDsXAqy4Jmx0YUyWiWYDbW5FUp3B5nVJyQmc+F7jp9qClp4Cdpr
 slwlSJoEx7kcHn/M55L3S5N7IPTfmKwobXGsvllJCEVke9cLRr0ssPNAUJCAvwAIcu4C
 Hf3NGWQ7MAeCi6A4fbt8LRrko3TrFZklZJZYij2iObSkpEaYSJk1yOcIdAPVKi8Rt5t7
 sL9YKRqIsptbq0+CnF6YqL2UOcjZDTpcOPHmQnWHOs0bqhfQTTbM0O53/HIRdRVgx3wZ
 0v7g==
X-Gm-Message-State: AOAM5324NXfMuniXFxjO8hQH8TcEKgrdz15Z1gDM0tfJVIffq+TqFhO5
 RpnhVGvfIpo1kMQQTHPIh0FlecoVUTb8rg==
X-Google-Smtp-Source: ABdhPJz0YcehCn/k0FniNowG1yCi/ySlFXU1axTE5clxEeWgC2DYfMyAq6I8fO44884eXmLGvii1UQ==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr3876914wrc.217.1629983853448; 
 Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] target/arm: Implement MVE scalar fp insns
Date: Thu, 26 Aug 2021 14:17:14 +0100
Message-Id: <20210826131725.22449-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Implement the MVE scalar floating point insns VADD, VSUB and VMUL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: add and use DO_2OP_FP_SCALAR_ALL macro; use float* types
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


