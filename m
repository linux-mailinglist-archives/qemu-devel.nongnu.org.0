Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0126E3F88B5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:23:25 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFLn-00074P-Tc
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGA-0005jD-Mb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG8-0004vu-F9
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:17:34 -0400
Received: by mail-wr1-x436.google.com with SMTP id u16so5038392wrn.5
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ItEzC5PA3uc2UUoeZfT2CHL8fSkv/wfJCEM2696skY0=;
 b=d5rwnW0Jtiiss2d88+P1m6eJeqQflMA6ZAo317ji7ST9S6bdcyRSKYsHkGk/j3oQu3
 k89/KAkQvRT6XZLMpVA7TLFxs3knOoDov9HcvdYdF4uoPoVpyBMckqT6WQj9rnNafX93
 PgH6oguH9xy6lUhjzBiReWQn1/bK6dSjtE4SKff3RXIB1qMMwPQU3bjARvBWBlPQ0ZID
 Or2LQnppD27LgjFfeBShbet8auxknKtiJh7bqTUL4yRn1dFozqglsYUUEzTrVv0BWhud
 MDYVPIsC3PrR+TpwFLX0608oUnXiLtZODui/0JOEcecajNBu+yISxQWTNg4Xy0hMcAut
 xucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItEzC5PA3uc2UUoeZfT2CHL8fSkv/wfJCEM2696skY0=;
 b=k3vy2Vi2YzvblADnVPAKqgtjGOBIAEALYJ8DYDdI2kYTnmlaBeAptpBkpt7TKCalsl
 XpSKQlez9+OuTfSh4W/Sbouz1PB2DVsQZ3TeNmb1HbmapVK4BnDERdGRJ8S/8nN5/txS
 uo2FDnHx0/nMFre82LynRvsB7NaOZUCW+JrJsJuH3ZPT28sJB/iHop+Uj2Zqg92hjPn8
 n5Bp+rDkVJrlr7Vj/utn0YoitvUlf6V5UR5JfR1GvlDcU+TBy69OWijRVPrjN6pzbmoB
 DHSPO+LWvB13mD9nMA29g1Kln8oTKe7mvmkCL11Mxp3Z8QFD6mch7JezjNQ+jPx3WA0V
 PdjA==
X-Gm-Message-State: AOAM533T9qlL9fwEBxOwgMCE46CXUh1vuHE/7qdyGjwR3y5U1xKz2zNY
 lyVY/3aYhjDro1B2cNf4ARQa+A==
X-Google-Smtp-Source: ABdhPJy7d3Yp/j3PoUotITNHVrYYZRnRgkzd2cdEsoyAwS6ETvSx4ITjF4QbU4lDuu8nLLX9XxwRWQ==
X-Received: by 2002:adf:b7c1:: with SMTP id t1mr4006068wre.387.1629983851038; 
 Thu, 26 Aug 2021 06:17:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/18] target/arm: Implement MVE VFMA and VFMS
Date: Thu, 26 Aug 2021 14:17:11 +0100
Message-Id: <20210826131725.22449-5-peter.maydell@linaro.org>
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

Implement the MVE VFMA and VFMS insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use float16/float32 types; pass CHS bool to
DO_VFMA rather than fn macro, as suggested by rth
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 37 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 42eba8ea96d..c230610d25c 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -434,6 +434,12 @@ DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfcadd270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfmah, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmas, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmss, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c728c7089ac..3a2056f6b34 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -639,3 +639,6 @@ VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
 
 VCADD90_fp        1111 1100 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
 VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+
+VFMA              1110 1111 0 . 0 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
+VFMS              1110 1111 0 . 1 . ... 0 ... 0 1100 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 2cc8b3e11b7..d7f250a4455 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2894,3 +2894,40 @@ DO_VCADD_FP(vfcadd90h, 2, float16, float16_sub, float16_add)
 DO_VCADD_FP(vfcadd90s, 4, float32, float32_sub, float32_add)
 DO_VCADD_FP(vfcadd270h, 2, float16, float16_add, float16_sub)
 DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
+
+#define DO_VFMA(OP, ESIZE, TYPE, CHS)                                   \
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
+            r = n[H##ESIZE(e)];                                         \
+            if (CHS) {                                                  \
+                r = TYPE##_chs(r);                                      \
+            }                                                           \
+            r = TYPE##_muladd(r, m[H##ESIZE(e)], d[H##ESIZE(e)],        \
+                              0, fpst);                                 \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VFMA(vfmah, 2, float16, false)
+DO_VFMA(vfmas, 4, float32, false)
+DO_VFMA(vfmsh, 2, float16, true)
+DO_VFMA(vfmss, 4, float32, true)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 6203e3ff916..d61abc6d46f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -854,6 +854,8 @@ DO_2OP_FP(VMAXNM, vmaxnm)
 DO_2OP_FP(VMINNM, vminnm)
 DO_2OP_FP(VCADD90_fp, vfcadd90)
 DO_2OP_FP(VCADD270_fp, vfcadd270)
+DO_2OP_FP(VFMA, vfma)
+DO_2OP_FP(VFMS, vfms)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


