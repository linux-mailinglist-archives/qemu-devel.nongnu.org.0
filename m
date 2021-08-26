Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12183F8910
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:35:25 +0200 (CEST)
Received: from localhost ([::1]:43426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFXQ-0005x6-Pc
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:35:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGI-0005nQ-CV
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGC-00050f-G7
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id h4so5016258wro.7
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IX63UH9elFIfzzmCD48DW45+4bO0eMwENm0AzIDl4+w=;
 b=LGhDpF77kx5RGKyXZlSumTghVTPhmkLL2pbD4DtpafKV7dagF2feoAxzP4blfCHHyD
 AyoN7xIk+zzdbHgsIDD34CD1JkmwV4StBRR8f6sKZWn3LncHPAKYwupORRLs1ytdDPyb
 aeHAsROcxfn88ubllLMT1Oe+QlLf6vTMz2kOYlutf7knrGb5UqkG4cL/cE+2nfa6q0+E
 sgLnZ9u79RDyz5br8tHiuiFvB3W6LEMa87I/QF63E/OMfT5pRa0yT9qJ9VUcKXe2vblg
 WFkTyzOqL2SMNwb8oRyb2b1000aq74nvMACB8YyOAVphUDbU0datem+i4HcZkr2cyANn
 YQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IX63UH9elFIfzzmCD48DW45+4bO0eMwENm0AzIDl4+w=;
 b=fycrHnxuREwMRlfVNspqs7mdNE0AagddGy6goOLQuNtlaHduIl2LvRDZW5QyW6rgM8
 0QFxUEzvf/tmypN9UQx/3F5WgVaYFr3wcw9hwRh+2KfMcf/FDkquJMvLpHEhekdn/pKa
 LR/SLetBjbMovbeNJ9MdWbKnHQxUSjM0D1aQa2MZm/tyaPuRIyeMuFbfB0GJoC/gWC+0
 64tQ2tgyCyPMEQ1md/c2Awyg2VuoZ7SdlZ3uRnhZ2UNBACkTxbFK7RaGVRD5vjpLf822
 XrX9lO3NJIapjOjaifwN0n+VbOoCS89llZbs8/dhExufJHkcGwph5Ro5JkblQlpm+aYC
 cBxQ==
X-Gm-Message-State: AOAM531KZ/7GqDGGbqP0fbpL1+8GDpsGTWoOaNiqOB72gw1BBKoHwUyI
 ClLfnIvSzndZdkvCBQ5ZofxHpCeRs0Au2g==
X-Google-Smtp-Source: ABdhPJxwPWCSyByGdmVB6VkrQIb7Xxbcb5KjvEWcOX5pxeHlup9UmvuepuFfpeWDAV9yXBhq92mL3A==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr3965464wrr.195.1629983854274; 
 Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 08/18] target/arm: Implement MVE fp-with-scalar VFMA, VFMAS
Date: Thu, 26 Aug 2021 14:17:15 +0100
Message-Id: <20210826131725.22449-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Implement the MVE fp-with-scalar VFMA and VFMAS insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: use float* types
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      | 14 +++++++++++---
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 091ec4b4270..cb7b6423239 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -809,3 +809,9 @@ DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfma_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfma_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmas_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmas_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5ba8b6deeaa..d2bd6815bc3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -508,9 +508,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 }
 
-# The U bit (28) is don't-care because it does not affect the result
-VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
-VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+{
+  VFMA_scalar     111 . 1110 0 . 11 ... 1 ... 0 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLA            111 - 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
+}
+
+{
+  VFMAS_scalar    111 . 1110 0 . 11 ... 1 ... 1 1110 . 100 .... @2op_fp_scalar
+  # The U bit (28) is don't-care because it does not affect the result
+  VMLAS           111 - 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
+}
 
 VQRDMLAH         1110 1110 0 . .. ... 0 ... 0 1110 . 100 .... @2scalar
 VQRDMLASH        1110 1110 0 . .. ... 0 ... 1 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b49975fdc01..36f0910b856 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3075,3 +3075,40 @@ DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
 DO_2OP_FP_SCALAR_ALL(vfadd_scalar, add)
 DO_2OP_FP_SCALAR_ALL(vfsub_scalar, sub)
 DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
+
+#define DO_2OP_FP_ACC_SCALAR(OP, ESIZE, TYPE, FN)                       \
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
+            r = FN(n[H##ESIZE(e)], m, d[H##ESIZE(e)], 0, fpst);         \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* VFMAS is vector * vector + scalar, so swap op2 and op3 */
+#define DO_VFMAS_SCALARH(N, M, D, F, S) float16_muladd(N, D, M, F, S)
+#define DO_VFMAS_SCALARS(N, M, D, F, S) float32_muladd(N, D, M, F, S)
+
+/* VFMA is vector * scalar + vector */
+DO_2OP_FP_ACC_SCALAR(vfma_scalarh, 2, float16, float16_muladd)
+DO_2OP_FP_ACC_SCALAR(vfma_scalars, 4, float32, float32_muladd)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalarh, 2, float16, DO_VFMAS_SCALARH)
+DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, float32, DO_VFMAS_SCALARS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index bc4b3f840a0..3627ba227f2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -979,6 +979,8 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
 DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
 DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
 DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+DO_2OP_FP_SCALAR(VFMA_scalar, vfma_scalar)
+DO_2OP_FP_SCALAR(VFMAS_scalar, vfmas_scalar)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
-- 
2.20.1


