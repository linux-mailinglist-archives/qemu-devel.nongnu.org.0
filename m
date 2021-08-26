Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731E3F88B6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:23:27 +0200 (CEST)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFLo-00075Z-5m
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGK-0005nY-DU
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:56022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGE-00051q-4u
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id g135so1810463wme.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GqNkD7rCn8BUcvF+3qh6Mr1+B40tHXPMIKKLqa+QiR4=;
 b=xmmrXUypaJnY2HuUr5lSsQ02C8ve+IWbbctUZBV2SEwZXXL5mL5V3WGaxO2X8oBU/e
 XeZgtLrwEMHwj0RqcOjh99KHPPdGU8jJd1wetMPEcN4YAQNKaL6vKmmO8Hy4BUoWLg21
 1x1FXM7iyLjaPdhgqnWzPlQo/CpiRqDDAKkfDNxUb3wN30wVPYHF6uHw9JywRnDmb8sP
 K1ZGceQf0upuW+h6r+fPOknxWNd/Nl2KSfJ87ozfihdvFXmSisCPmme1Zj/xzoe029T4
 EpF8Z9i0DjmMj/uUQvtMbXnRc5sciWkfvEpiM7NUJShAH4juMNvkUXvBSTcbixvpTKKh
 f79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GqNkD7rCn8BUcvF+3qh6Mr1+B40tHXPMIKKLqa+QiR4=;
 b=N52VFr0FXXRB4EalwC8gvE2ixcdjDymm+IABL27adK9hVh1Ufp5kP98NZtgt1zeBEa
 gDk6+cPdp9De/cq1t8cIByJWibIQz8kqr66IUKcJ/T2HyndEhmh6NmCKDJSg7e0aGHQs
 bHGJ2/vzFSg7DA6c6TqKI3nIx35F08x1YDHtvQnwMWh4KLgC3AvM/5HUWR7KPuFCPiay
 hiZNrGRkGeWhweOoNvwzhA+HhO3OZwuPhmAB0iLtBZoNpz0SOq05zK/Ud6cWnweHjHsH
 d7EhWoGZ+hZzK1aj4RO7J7NZktRcnJQyrivzZNU0wJJyMF7nRi/KlejdlF7I2+2WdlCw
 wzCA==
X-Gm-Message-State: AOAM5305HAE3lYbsPdZ4jHjRq0tZh1cRETdXaCMYJn9l55b6gnBCx+m4
 IH9C1vLrC77bBjzqnf0rcNnyS5g39dK1OQ==
X-Google-Smtp-Source: ABdhPJzWUM3gcXmvqZJv4sn8Y1t3qR+KzDYQPHAo04p1PfyVm2MOqkb1l3ydixx8SDKrHp1P7bJmtQ==
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr14133423wmh.99.1629983855776; 
 Thu, 26 Aug 2021 06:17:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/18] target/arm: Implement MVE FP max/min across vector
Date: Thu, 26 Aug 2021 14:17:17 +0100
Message-Id: <20210826131725.22449-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
v1->v2: use float* types only
---
 target/arm/helper-mve.h    | 12 +++++++++++
 target/arm/mve.decode      | 12 +++++++++++
 target/arm/mve_helper.c    | 44 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 20 +++++++++++++++++
 4 files changed, 88 insertions(+)

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
index d2bd6815bc3..1a18c3b8eeb 100644
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
 
@@ -440,6 +444,10 @@ VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 
 {
+  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
   VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
   VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
@@ -449,6 +457,10 @@ VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
 }
 
 {
+  VMAXNMAV       1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+  VMINNMAV       1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+  VMAXNMV        1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+  VMINNMV        1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
   VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
   VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
   VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
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


