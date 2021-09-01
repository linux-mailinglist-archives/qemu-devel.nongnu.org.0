Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F005F3FD83D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:56:46 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNvB-0006aK-7F
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcE-0006yF-FD
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:10 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcB-0005jH-J3
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:10 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1564125wmi.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L4PKaHtv8gBbsF0q/KRkX5988ST0a4oNQuaOXRtk64c=;
 b=m2YEMVlLUBrDynVj4yho5kd2zIwBDqHg08aen8OB52JI2YqzGP/V+yT8nJh746ooW9
 1FUGnYt0LQQU0vH9G6FAQ60HnKKcPuKusBCMoTIhf/QkLOXuvM4xFLSHTUcnF9dpvLvo
 FnJOMA5W4X2mw2S02QVXrZ9unIo5ZhuNj6wxOjUkooaxX+dttttEmLaLK/i5khpwEqox
 +j0mPuLt9/e3vlBeSVddoaLuy3efd6LD9WN6vcyYJHBsNNt3TyHVJ/cdwosLtRDIbt6h
 +gO0QOmhzuPM/E2aW4VJLKCz5CZfhTVnD8PYq0cEWV9e4+yVJ63hah8cCux7DYuECpVA
 fyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4PKaHtv8gBbsF0q/KRkX5988ST0a4oNQuaOXRtk64c=;
 b=qtN3Gwe46tqLnH+HBU898cND15ymxt/V88qJ5Ao6yBlE1jBZvAsZglMu2JCRcV1bk5
 Go98GOrPip6v97ANwUvWhU/gXbwOhVprXNkCqocCX/MRSpEDtMlyfYmmgLlD1XO3wKbJ
 CYvF3p+XOis0LMKuN+kyReansR3+NFuCYSgSB+uwHlVrWEGVJK3MKeZx06nkX1fE0uPt
 l7/zUJAezUYJS/nHKno0M0f8FzFWah4KZ3rH/+vvqAUhH9cQZTb1NSkfbllyEQeJURcS
 Fm149fFGz4N0igHAvuosc8LAXSSesH5navw+BrjrXsf6U0IJqGERWsmXI1843vUCnlOx
 8HkA==
X-Gm-Message-State: AOAM532Bvg5bKFDxjHSfKgLm195iAULZrH6t4P6BtfjT9XJzzPW1QXWr
 aQqkpBlqq2x0a9/oEmaOLeHa7RmMtIBKDA==
X-Google-Smtp-Source: ABdhPJy45e2CPB7NnHlCR706YM+P9TQbOGRXLjYG5dKKVGOHgQl0H6DSt0vWyqxTWcITwOnIP5L/UQ==
X-Received: by 2002:a1c:3b56:: with SMTP id i83mr8412186wma.115.1630492626172; 
 Wed, 01 Sep 2021 03:37:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/51] target/arm: Implement MVE FP max/min across vector
Date: Wed,  1 Sep 2021 11:36:17 +0100
Message-Id: <20210901103653.13435-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Implement the MVE VMAXNMV, VMINNMV, VMAXNMAV, VMINNMAV insns.  These
calculate the maximum or minimum of floating point elements across a
vector, starting with a value in a general purpose register and
returning the result there.

The pseudocode silences a possible SNaN in the accumulating result
on every iteration (by calling FPConvertNaN), but we do it only
on the input ra, because if none of the inputs to float*_maxnum
or float*_minnum are SNaNs then the result can't be an SNaN.

Note that we can't use the float*_maxnuma() etc functions we defined
earlier for VMAXNMA and VMINNMA, because we mustn't take the absolute
value of the starting general-purpose register value, which could be
negative.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 12 +++++++++++
 target/arm/mve.decode      | 32 +++++++++++++++++++++------
 target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 20 +++++++++++++++++
 4 files changed, 102 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index cb7b6423239..47fd18dddbf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -614,6 +614,18 @@ DEF_HELPER_FLAGS_3(mve_vminavb, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vminavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vminavw, TCG_CALL_NO_WG, i32, env, ptr, i32)
 
+DEF_HELPER_FLAGS_3(mve_vmaxnmvh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxnmvs, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vminnmvh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminnmvs, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vmaxnmavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vmaxnmavs, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vminnmavh, TCG_CALL_NO_WG, i32, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vminnmavs, TCG_CALL_NO_WG, i32, env, ptr, i32)
+
 DEF_HELPER_FLAGS_3(mve_vaddlv_s, TCG_CALL_NO_WG, i64, env, ptr, i64)
 DEF_HELPER_FLAGS_3(mve_vaddlv_u, TCG_CALL_NO_WG, i64, env, ptr, i64)
 
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index d2bd6815bc3..a46372f8c77 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -137,6 +137,10 @@
 @vmaxnma  .... .... .... .... .... .... .... .... &2op \
           qd=%qd qn=%qd qm=%qm
 
+# Here also we don't decode the bit 28 size in the format to avoid
+# awkward nested overlap groups
+@vmaxnmv          .... .... .... .... rda:4 .... .... .... &vmaxv qm=%qm
+
 @2op_fp_scalar .... .... .... .... .... .... .... rm:4 &2scalar \
                qd=%qd qn=%qn size=%2op_fp_scalar_size
 
@@ -440,17 +444,33 @@ VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 
 {
-  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
-  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMAV     1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+    VMAXNMV      1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMV      1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+  ]
+  [
+    VMAXV_S      1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_S      1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+    VMAXAV       1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINAV       1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_S      1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
 
 {
-  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMAV     1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+    VMAXNMV      1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMV      1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+  ]
+  [
+    VMAXV_U      1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_U      1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 36f0910b856..52e5a8f2a8b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3112,3 +3112,47 @@ DO_2OP_FP_ACC_SCALAR(vfma_scalarh, 2, float16, float16_muladd)
 DO_2OP_FP_ACC_SCALAR(vfma_scalars, 4, float32, float32_muladd)
 DO_2OP_FP_ACC_SCALAR(vfmas_scalarh, 2, float16, DO_VFMAS_SCALARH)
 DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, float32, DO_VFMAS_SCALARS)
+
+/* Floating point max/min across vector. */
+#define DO_FP_VMAXMINV(OP, ESIZE, TYPE, ABS, FN)                \
+    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vm, \
+                                    uint32_t ra_in)             \
+    {                                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned e;                                             \
+        TYPE *m = vm;                                           \
+        TYPE ra = (TYPE)ra_in;                                  \
+        float_status *fpst = (ESIZE == 2) ?                     \
+            &env->vfp.standard_fp_status_f16 :                  \
+            &env->vfp.standard_fp_status;                       \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
+            if (mask & 1) {                                     \
+                TYPE v = m[H##ESIZE(e)];                        \
+                if (TYPE##_is_signaling_nan(ra, fpst)) {        \
+                    ra = TYPE##_silence_nan(ra, fpst);          \
+                    float_raise(float_flag_invalid, fpst);      \
+                }                                               \
+                if (TYPE##_is_signaling_nan(v, fpst)) {         \
+                    v = TYPE##_silence_nan(v, fpst);            \
+                    float_raise(float_flag_invalid, fpst);      \
+                }                                               \
+                if (ABS) {                                      \
+                    v = TYPE##_abs(v);                          \
+                }                                               \
+                ra = FN(ra, v, fpst);                           \
+            }                                                   \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+        return ra;                                              \
+    }                                                           \
+
+#define NOP(X) (X)
+
+DO_FP_VMAXMINV(vmaxnmvh, 2, float16, false, float16_maxnum)
+DO_FP_VMAXMINV(vmaxnmvs, 4, float32, false, float32_maxnum)
+DO_FP_VMAXMINV(vminnmvh, 2, float16, false, float16_minnum)
+DO_FP_VMAXMINV(vminnmvs, 4, float32, false, float32_minnum)
+DO_FP_VMAXMINV(vmaxnmavh, 2, float16, true, float16_maxnum)
+DO_FP_VMAXMINV(vmaxnmavs, 4, float32, true, float32_maxnum)
+DO_FP_VMAXMINV(vminnmavh, 2, float16, true, float16_minnum)
+DO_FP_VMAXMINV(vminnmavs, 4, float32, true, float32_minnum)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 3627ba227f2..4e2aa2cae2d 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1806,6 +1806,26 @@ DO_VMAXV(VMINV_S, vminvs)
 DO_VMAXV(VMINV_U, vminvu)
 DO_VMAXV(VMINAV, vminav)
 
+#define DO_VMAXV_FP(INSN, FN)                                   \
+    static bool trans_##INSN(DisasContext *s, arg_vmaxv *a)     \
+    {                                                           \
+        static MVEGenVADDVFn * const fns[] = {                  \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_vmaxv(s, a, fns[a->size]);                    \
+    }
+
+DO_VMAXV_FP(VMAXNMV, vmaxnmv)
+DO_VMAXV_FP(VMINNMV, vminnmv)
+DO_VMAXV_FP(VMAXNMAV, vmaxnmav)
+DO_VMAXV_FP(VMINNMAV, vminnmav)
+
 static bool do_vabav(DisasContext *s, arg_vabav *a, MVEGenVABAVFn *fn)
 {
     /* Absolute difference accumulated across vector */
-- 
2.20.1


