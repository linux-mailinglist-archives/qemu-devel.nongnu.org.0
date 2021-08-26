Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DF3F8904
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:32:42 +0200 (CEST)
Received: from localhost ([::1]:34762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFUn-0007uG-Ch
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGD-0005lg-5v
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG9-0004xR-RQ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:36 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6872937wmb.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hXJ0uUJGqF6S2O8dTr0+fHt3Q/Gr0XXJWtw5XhCtum4=;
 b=aixF26TUifqN25v1jA3YhNlwzzH3Q6UU+I+78Eird3atpNEWKlvN1+M1CYpJRhCthJ
 rOKOc+v3q38vvoIfpdz7KhVRcJpc5A156VS4/+VOHqmhpTTujnuSgryLXdtaUiRtbTp6
 i8UPxE7vopAi/FxcuZnh+87RJ29dk6PtBn/pA1WliyyrAYIh32bkvIehUCNSpECestne
 2xvGJhvThbULorotzRbfGyzoFZUYRsF553F6KeldYB9dxBxuth2XM5tHV8C5COOh665E
 hXz2dGOBLZYMHttyDKGK8ckwxkKByVORvR63v2VjYQ4FPzav55nPr7hRskIrr7R3QWgE
 CRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hXJ0uUJGqF6S2O8dTr0+fHt3Q/Gr0XXJWtw5XhCtum4=;
 b=N3AQFiyb/SBOM2LjQN6XdXDxrio/okHPW3dubbLx+FL1+njFl33l7nJdnUHBDUHYuP
 3yWtrrSrTUjLOKsxtW428zcmeK0OH7Jvr2YqRa8iwttJVevKFu+aOWh70vTajlvWqOp9
 GqlOdO3Y7DnGKWbhdaWKjwdyoWLapFfGWi8w6tBlu6Jl9rnQ/J0s/3f8XjsdXKNRFI6z
 YOw9vVG14TCHPvsAh+Ny3Gv3+nmW744z4OHxUT1/pfSghTykU80LgN2X2OQk2BHIr2Cj
 1yENsDTOQuruIdKEZn3rXJVXBsI9gJBVU/DiZUEzZ6/GjEskTHddliWEFbl8mj+eyFgy
 ACqg==
X-Gm-Message-State: AOAM530O2Lz+AH1fN0D+rKa/glSZ717WsYlUCjYeP2ues8ABvl7N9wsH
 9Caw4KWyUSNhoYgvylk+EyGsQVXp5xKnAA==
X-Google-Smtp-Source: ABdhPJxL5nfx4FhS0GRbreHHcOjeVJ7Eoj1Yn7K3cJF7CleFMEeOg8b56vmij2LE08BBOFOGguVCjg==
X-Received: by 2002:a05:600c:22d3:: with SMTP id
 19mr3639564wmg.36.1629983851888; 
 Thu, 26 Aug 2021 06:17:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/18] target/arm: Implement MVE VCMUL and VCMLA
Date: Thu, 26 Aug 2021 14:17:12 +0100
Message-Id: <20210826131725.22449-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
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
v1->v2: use float* types, avoid passing in CHS function
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


