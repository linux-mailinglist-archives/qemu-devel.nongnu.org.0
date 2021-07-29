Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592AE3DA281
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:52:30 +0200 (CEST)
Received: from localhost ([::1]:41154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94aT-0006rc-D2
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941X-0001LE-Nl
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:51969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9414-0001Rm-V7
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:23 -0400
Received: by mail-wm1-x333.google.com with SMTP id u15so3476307wmj.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p4Wlm2c9JqTkhyqQGttGpGYIq+fmB9R+3lHbXxxx7oo=;
 b=ujwDorne0tBRjj+JI055wiizniSpURE8lzYYgLzw8x5aC06pPa6WZIDKCXmNCFT9uH
 zbV4Xr6lJW7T5viZh3OnXtzki68FMGtytTxKAgTKlsTPVM8g8wbxpn+67x/3TI9ygw+5
 lHkjqv6NIFT+GmiwwzUK7wZWxeyRWRjSPfCywlHsDQZYBdgK0o4PUnTHlKMbSLL3g4Yl
 XjHY7gITekjaYGP9uH5IYyNo3rZszXKi5k7oXjE+CpmUxIM7FgRwT1r2hYGkmBHFg1Z3
 PaFDZdpMqczPFKf2upLyQEOFM93NRdO+nuMUgiu++KHokIJbQgk6k9N0anWilNiAgZCt
 FPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4Wlm2c9JqTkhyqQGttGpGYIq+fmB9R+3lHbXxxx7oo=;
 b=hevqBMQl4aEs8FXEdGQDDY/U/zqub587MTZH4JkjEbSXBzP6pV39gJmNcZa03VFvfd
 jnZ0++0tccRDwzMzqx0Ap2sx8n6xg4c857zTv9gakyTdgCkhZJRqYyfHAlgQmbGgJ49J
 VrjFbD7ptgo9CH3EsxpW3CXBPK8UrK2rNIDMeWpHjo5rXHlds+X843gMZQmVbJ3SG5+y
 8uEIO/ururPi2OkdgQmKA/+ukmVOhNxAXrLSe3QOIdRCQ756lsUEWmTr4lqaTYQwdt8U
 3SIPkXhKzbyZ+OUy6rnVV6O2ktZMxIJPbj//ZXflDOXWoBlk+nA/Nx8cQ3NEDlGUsJ+J
 dggw==
X-Gm-Message-State: AOAM531HBQw1P8zeMbecPAY5B5o5sfLIuJ5SqRz/2MhpL5eDalnC994l
 OKRNSxiQJpSKiEh35+OPlWBH5A==
X-Google-Smtp-Source: ABdhPJzqpj/hoP1fe17g2lo0veTSN0vqD9+iemZO9t0dwAS2PU+GukhkpRVlKzFPn0pKFdo5X/4K1g==
X-Received: by 2002:a1c:a94f:: with SMTP id s76mr11589459wme.17.1627557352390; 
 Thu, 29 Jul 2021 04:15:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 45/53] target/arm: Implement MVE FP max/min across
 vector
Date: Thu, 29 Jul 2021 12:15:04 +0100
Message-Id: <20210729111512.16541-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
index 3b243aaefa2..6a73134c74a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3117,3 +3117,47 @@ DO_2OP_FP_ACC_SCALAR(vfma_scalarh, 2, uint16_t, float16_muladd)
 DO_2OP_FP_ACC_SCALAR(vfma_scalars, 4, uint32_t, float32_muladd)
 DO_2OP_FP_ACC_SCALAR(vfmas_scalarh, 2, uint16_t, DO_VFMAS_SCALARH)
 DO_2OP_FP_ACC_SCALAR(vfmas_scalars, 4, uint32_t, DO_VFMAS_SCALARS)
+
+/* Floating point max/min across vector. */
+#define DO_FP_VMAXMINV(OP, ESIZE, TYPE, FTYPE, ABS, FN)         \
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
+                if (FTYPE##_is_signaling_nan(ra, fpst)) {       \
+                    ra = FTYPE##_silence_nan(ra, fpst);         \
+                    float_raise(float_flag_invalid, fpst);      \
+                }                                               \
+                if (FTYPE##_is_signaling_nan(v, fpst)) {        \
+                    v = FTYPE##_silence_nan(v, fpst);           \
+                    float_raise(float_flag_invalid, fpst);      \
+                }                                               \
+                if (ABS) {                                      \
+                    v = FTYPE##_abs(v);                         \
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
+DO_FP_VMAXMINV(vmaxnmvh, 2, uint16_t, float16, false, float16_maxnum)
+DO_FP_VMAXMINV(vmaxnmvs, 4, uint32_t, float32, false, float32_maxnum)
+DO_FP_VMAXMINV(vminnmvh, 2, uint16_t, float16, false, float16_minnum)
+DO_FP_VMAXMINV(vminnmvs, 4, uint32_t, float32, false, float32_minnum)
+DO_FP_VMAXMINV(vmaxnmavh, 2, uint16_t, float16, true, float16_maxnum)
+DO_FP_VMAXMINV(vmaxnmavs, 4, uint32_t, float32, true, float32_maxnum)
+DO_FP_VMAXMINV(vminnmavh, 2, uint16_t, float16, true, float16_minnum)
+DO_FP_VMAXMINV(vminnmavs, 4, uint32_t, float32, true, float32_minnum)
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


