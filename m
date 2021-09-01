Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 956CF3FD825
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:50:16 +0200 (CEST)
Received: from localhost ([::1]:48644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNot-0003fM-Kl
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcB-0006s7-Gq
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:33788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNc8-0005gK-EQ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:07 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso3536055wmj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h5i+dvsMZeu+jpAZcIFJXNcZxOlG/Is/9TBheeSFdjU=;
 b=vSD1gxsVmLMElTqGvwGoBIi+xd5K2FIA/PPCtYh5S+R6z6gnyzOLeH7MAiBhxEEWbR
 GWPhe2k5v1jU+hfePoUKITahO1KIUl7H7RG4qid+KffiWkXR/IKSIhvtiTFekCM2nKlR
 kH34QyTCKPp4vtEXQDyjDEFi4h4g8v3pFWThilQKmhmMitCDUw68b/KNL2aQvagaWwXB
 MdZX0kdHEWBzcTANhXLKPW8StgPQdA2U2jeZH/7VHIYS857BXeNAfHThvjB3ZSgd2H9d
 pTH9Qq3ex8qqt4OVZ+UzuZHIeIiCXFQEU3G6Sl20UwgeVqOgBTyKmWGiw1mOapAoZAP2
 qqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h5i+dvsMZeu+jpAZcIFJXNcZxOlG/Is/9TBheeSFdjU=;
 b=dj0BHrSDgpnXlXHXGOE9iq6fw39XYsVS8EZ0c6FqPdMmj3yCr14pmw5lnT8zexVxpb
 dzrn2G2m4225EGyz44jCTW5XGVvaeXp/UNjQRwN6k7KCvzbudyWt3cFJz01m8zIqUqEk
 MJ4OxC/Gl5HyYEMckaOtNSwLaM/qBx//DFNu2KvA5KbZm83WtWw+Zrj7q2ugdG18Aw+M
 oFD7IGrTFtC9Slr3MDUFjEzZsuZRnrMvczGW2LNKsUsb0CRuk+dA9o46aBZV3E6ahRUb
 WlL7g8pUqoTg/bSL9oRWmT9Xc3GLoK7JphUINsS0hrLFh6nGMMwS4cil/bmaG7Kv2/+k
 Cilw==
X-Gm-Message-State: AOAM532DFT5t9wAoxCPmvJS5iQebHTforWz3vvZdchvByD2bGF51yMPL
 s8CbfgP6FFpquxoLOtamKSQ3/W+0kHJLbA==
X-Google-Smtp-Source: ABdhPJwe7+zplUVrX789St6VfdGDhyPQEoa3977rjZ0xQ68nmuGm1K1AhdGuEF2ZzjgrX3joihO7RQ==
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr8723812wme.67.1630492622878; 
 Wed, 01 Sep 2021 03:37:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/51] target/arm: Implement MVE VCMUL and VCMLA
Date: Wed,  1 Sep 2021 11:36:12 +0100
Message-Id: <20210901103653.13435-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Implement the MVE VCMUL and VCMLA insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 18 ++++++++
 target/arm/mve.decode      | 35 ++++++++++++----
 target/arm/mve_helper.c    | 86 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  8 ++++
 4 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index c230610d25c..73950403bc3 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -440,6 +440,24 @@ DEF_HELPER_FLAGS_4(mve_vfmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfmsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfmss, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vcmul0h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul0s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul180h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul180s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmul270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vcmla0h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla0s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla180h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla180s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vcmla270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3a2056f6b34..403381eef61 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -286,15 +286,29 @@ VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
 
-VQDMLADH         1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
-VQDMLADHX        1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
-VQRDMLADH        1110 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
-VQRDMLADHX       1110 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+{
+  VCMUL0         111 . 1110 0 . 11 ... 0 ... 0 1110 . 0 . 0 ... 0 @2op_sz28
+  VQDMLADH       1110  1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+  VQDMLSDH       1111  1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
+}
 
-VQDMLSDH         1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 0 @2op
-VQDMLSDHX        1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
-VQRDMLSDH        1111 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
-VQRDMLSDHX       1111 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+{
+  VCMUL180       111 . 1110 0 . 11 ... 0 ... 1 1110 . 0 . 0 ... 0 @2op_sz28
+  VQDMLADHX      111 0 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+  VQDMLSDHX      111 1 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 0 @2op
+}
+
+{
+  VCMUL90        111 . 1110 0 . 11 ... 0 ... 0 1110 . 0 . 0 ... 1 @2op_sz28
+  VQRDMLADH      111 0 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+  VQRDMLSDH      111 1 1110 0 . .. ... 0 ... 0 1110 . 0 . 0 ... 1 @2op
+}
+
+{
+  VCMUL270       111 . 1110 0 . 11 ... 0 ... 1 1110 . 0 . 0 ... 1 @2op_sz28
+  VQRDMLADHX     111 0 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+  VQRDMLSDHX     111 1 1110 0 . .. ... 0 ... 1 1110 . 0 . 0 ... 1 @2op
+}
 
 VQDMULLB         111 . 1110 0 . 11 ... 0 ... 0 1111 . 0 . 0 ... 1 @2op_sz28
 VQDMULLT         111 . 1110 0 . 11 ... 0 ... 1 1111 . 0 . 0 ... 1 @2op_sz28
@@ -642,3 +656,8 @@ VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_
 
 VFMA              1110 1111 0 . 0 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
 VFMS              1110 1111 0 . 1 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
+
+VCMLA0            1111 110 00 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA90           1111 110 01 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA180          1111 110 10 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCMLA270          1111 110 11 . 1 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d7f250a4455..e478408fddd 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2931,3 +2931,89 @@ DO_VFMA(vfmah, 2, float16, false)
 DO_VFMA(vfmas, 4, float32, false)
 DO_VFMA(vfmsh, 2, float16, true)
 DO_VFMA(vfmss, 4, float32, true)
+
+#define DO_VCMLA(OP, ESIZE, TYPE, ROT, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r0, r1, e1, e2, e3, e4;                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst0, *fpst1;                                    \
+        float_status scratch_fpst;                                      \
+        /* We loop through pairs of elements at a time */               \
+        for (e = 0; e < 16 / ESIZE; e += 2, mask >>= ESIZE * 2) {       \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE * 2)) == 0) {          \
+                continue;                                               \
+            }                                                           \
+            fpst0 = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :   \
+                &env->vfp.standard_fp_status;                           \
+            fpst1 = fpst0;                                              \
+            if (!(mask & 1)) {                                          \
+                scratch_fpst = *fpst0;                                  \
+                fpst0 = &scratch_fpst;                                  \
+            }                                                           \
+            if (!(mask & (1 << ESIZE))) {                               \
+                scratch_fpst = *fpst1;                                  \
+                fpst1 = &scratch_fpst;                                  \
+            }                                                           \
+            switch (ROT) {                                              \
+            case 0:                                                     \
+                e1 = m[H##ESIZE(e)];                                    \
+                e2 = n[H##ESIZE(e)];                                    \
+                e3 = m[H##ESIZE(e + 1)];                                \
+                e4 = n[H##ESIZE(e)];                                    \
+                break;                                                  \
+            case 1:                                                     \
+                e1 = TYPE##_chs(m[H##ESIZE(e + 1)]);                    \
+                e2 = n[H##ESIZE(e + 1)];                                \
+                e3 = m[H##ESIZE(e)];                                    \
+                e4 = n[H##ESIZE(e + 1)];                                \
+                break;                                                  \
+            case 2:                                                     \
+                e1 = TYPE##_chs(m[H##ESIZE(e)]);                        \
+                e2 = n[H##ESIZE(e)];                                    \
+                e3 = TYPE##_chs(m[H##ESIZE(e + 1)]);                    \
+                e4 = n[H##ESIZE(e)];                                    \
+                break;                                                  \
+            case 3:                                                     \
+                e1 = m[H##ESIZE(e + 1)];                                \
+                e2 = n[H##ESIZE(e + 1)];                                \
+                e3 = TYPE##_chs(m[H##ESIZE(e)]);                        \
+                e4 = n[H##ESIZE(e + 1)];                                \
+                break;                                                  \
+            default:                                                    \
+                g_assert_not_reached();                                 \
+            }                                                           \
+            r0 = FN(e2, e1, d[H##ESIZE(e)], fpst0);                     \
+            r1 = FN(e4, e3, d[H##ESIZE(e + 1)], fpst1);                 \
+            mergemask(&d[H##ESIZE(e)], r0, mask);                       \
+            mergemask(&d[H##ESIZE(e + 1)], r1, mask >> ESIZE);          \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VCMULH(N, M, D, S) float16_mul(N, M, S)
+#define DO_VCMULS(N, M, D, S) float32_mul(N, M, S)
+
+#define DO_VCMLAH(N, M, D, S) float16_muladd(N, M, D, 0, S)
+#define DO_VCMLAS(N, M, D, S) float32_muladd(N, M, D, 0, S)
+
+DO_VCMLA(vcmul0h, 2, float16, 0, DO_VCMULH)
+DO_VCMLA(vcmul0s, 4, float32, 0, DO_VCMULS)
+DO_VCMLA(vcmul90h, 2, float16, 1, DO_VCMULH)
+DO_VCMLA(vcmul90s, 4, float32, 1, DO_VCMULS)
+DO_VCMLA(vcmul180h, 2, float16, 2, DO_VCMULH)
+DO_VCMLA(vcmul180s, 4, float32, 2, DO_VCMULS)
+DO_VCMLA(vcmul270h, 2, float16, 3, DO_VCMULH)
+DO_VCMLA(vcmul270s, 4, float32, 3, DO_VCMULS)
+
+DO_VCMLA(vcmla0h, 2, float16, 0, DO_VCMLAH)
+DO_VCMLA(vcmla0s, 4, float32, 0, DO_VCMLAS)
+DO_VCMLA(vcmla90h, 2, float16, 1, DO_VCMLAH)
+DO_VCMLA(vcmla90s, 4, float32, 1, DO_VCMLAS)
+DO_VCMLA(vcmla180h, 2, float16, 2, DO_VCMLAH)
+DO_VCMLA(vcmla180s, 4, float32, 2, DO_VCMLAS)
+DO_VCMLA(vcmla270h, 2, float16, 3, DO_VCMLAH)
+DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d61abc6d46f..d62ed1fc295 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -856,6 +856,14 @@ DO_2OP_FP(VCADD90_fp, vfcadd90)
 DO_2OP_FP(VCADD270_fp, vfcadd270)
 DO_2OP_FP(VFMA, vfma)
 DO_2OP_FP(VFMS, vfms)
+DO_2OP_FP(VCMUL0, vcmul0)
+DO_2OP_FP(VCMUL90, vcmul90)
+DO_2OP_FP(VCMUL180, vcmul180)
+DO_2OP_FP(VCMUL270, vcmul270)
+DO_2OP_FP(VCMLA0, vcmla0)
+DO_2OP_FP(VCMLA90, vcmla90)
+DO_2OP_FP(VCMLA180, vcmla180)
+DO_2OP_FP(VCMLA270, vcmla270)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


