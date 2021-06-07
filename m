Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961439E51C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:17:37 +0200 (CEST)
Received: from localhost ([::1]:57734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIsZ-0006i6-L6
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb3-0007wK-Hc
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-000831-Qv
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p13-20020a05600c358db029019f44afc845so51469wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gAJbwUpQBJlwWgZB9PVIfQPSDW4ziRgxMQ3yiyqe2ao=;
 b=aUmxFFtZQWJo5CTaV9SLT3Wnif6/6MGQ/QMfscFfpC0FK1vqatawqoC/KiELenVhBL
 oBuC/3UAwlXgnuAE/iXF8pH+umTxhCyTAlg36C9S6GQbENj1wsSlhFqv8aw7SpY3ID+N
 DcgOJR0ynyxZ5WXnsqLCrGPoGYvtVHn9yz1pea4dLPKcyHcos6ZYaIuYkdmpQhGcFzkp
 2+RrNxROpSRmWD+8yi6y7cHtRnP0Pp7eHnpmQHYzAD/adx7iF922aSLjafyO7AURZ4tA
 6gkLrG/bMCup0gNUOK2rmM6snrM1WMle63g1XB6tpwigA5m99mU07lNiUdUgtUmPE1H/
 jayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gAJbwUpQBJlwWgZB9PVIfQPSDW4ziRgxMQ3yiyqe2ao=;
 b=XPOw/cGkx1+wLPIKZnxY4BvntAJwDS5MHMcrtVdqGGozmMWvtKZTX9MJaXPYZ5A3Wc
 fYcdQdGyR5gs+pKfV/CkepYgTVSKFY3xypAtOOjdqQ2VATrneSiun4O9KjUlvjsyKjXD
 6k8kOM70SzvA0/dxwWu2jJ8zLv31plIE5QK5u3+hc9oOkJRLWldrbSnJwq/wWJOBg4XT
 CV+pLakMKcNvydcJxm7OoQLnaD2GxOH/maiQDmz2aXcNQY41fedcXOlSmo2JCKy7iMmg
 IH8zxok4hFrJflDZ6pTNK/thqpTrqBM2qKToSrOIXtR6xLTl+9nuk1JuLYJ7f6sIjH2X
 50ng==
X-Gm-Message-State: AOAM531IKNGmldqtzWqIA5ozwFW77wg7AkwN5BrXW4RWaJlJHVRf59sV
 bFZEh1ZFvR1YF25mvXt89Md28JPy4fv14sHI
X-Google-Smtp-Source: ABdhPJxl/+YUo2QUoaZuv/eE1fiSOIEgSZR9nyQI6gZfZRqH6i6rn6+SBitkMYPNWEHxCTn/gHNWeg==
X-Received: by 2002:a7b:cc8f:: with SMTP id p15mr57730wma.111.1623085133706;
 Mon, 07 Jun 2021 09:58:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 38/55] target/arm: Implement MVE VQADD and VQSUB
Date: Mon,  7 Jun 2021 17:58:04 +0100
Message-Id: <20210607165821.9892-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VQADD and VQSUB insns, which perform saturating
addition of a scalar to each element.  Note that individual bytes of
each result element are used or discarded according to the predicate
mask, but FPSCR.QC is only set if the predicate mask for the lowest
byte of the element is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++
 target/arm/mve.decode      |  5 +++
 target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++
 4 files changed, 87 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1f77a661b9b..a1acc44e40e 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -175,6 +175,22 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqadds_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqaddu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubs_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e189e2de648..c85227c675a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -167,6 +167,11 @@ VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+
+VQADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+VQADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
 # Predicate operations
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 25426fae992..41c4f2033f6 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -477,6 +477,33 @@ DO_2OP_U(vhaddu, do_vhadd_u)
 DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
+static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
+{
+    if (val > max) {
+        *s = true;
+        return max;
+    } else if (val < min) {
+        *s = true;
+        return min;
+    }
+    return val;
+}
+
+#define DO_SQADD_B(n, m, s) do_sat_bhw((int64_t)n + m, INT8_MIN, INT8_MAX, s)
+#define DO_SQADD_H(n, m, s) do_sat_bhw((int64_t)n + m, INT16_MIN, INT16_MAX, s)
+#define DO_SQADD_W(n, m, s) do_sat_bhw((int64_t)n + m, INT32_MIN, INT32_MAX, s)
+
+#define DO_UQADD_B(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT8_MAX, s)
+#define DO_UQADD_H(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT16_MAX, s)
+#define DO_UQADD_W(n, m, s) do_sat_bhw((int64_t)n + m, 0, UINT32_MAX, s)
+
+#define DO_SQSUB_B(n, m, s) do_sat_bhw((int64_t)n - m, INT8_MIN, INT8_MAX, s)
+#define DO_SQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, INT16_MIN, INT16_MAX, s)
+#define DO_SQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, INT32_MIN, INT32_MAX, s)
+
+#define DO_UQSUB_B(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT8_MAX, s)
+#define DO_UQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT16_MAX, s)
+#define DO_UQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT32_MAX, s)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
@@ -495,6 +522,27 @@ DO_2OP_U(vhsubu, do_vhsub_u)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT_SCALAR(OP, ESIZE, TYPE, H, FN)                       \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            TYPE r = FN(n[H(e)], m, &sat);                              \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
+            if (sat && (mask & 1)) {                                    \
+                env->vfp.qc[0] = 1;                                     \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, H1, FN)    \
@@ -513,6 +561,20 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+DO_2OP_SAT_SCALAR(vqaddu_scalarb, 1, uint8_t, H1, DO_UQADD_B)
+DO_2OP_SAT_SCALAR(vqaddu_scalarh, 2, uint16_t, H2, DO_UQADD_H)
+DO_2OP_SAT_SCALAR(vqaddu_scalarw, 4, uint32_t, H4, DO_UQADD_W)
+DO_2OP_SAT_SCALAR(vqadds_scalarb, 1, int8_t, H1, DO_SQADD_B)
+DO_2OP_SAT_SCALAR(vqadds_scalarh, 2, int16_t, H2, DO_SQADD_H)
+DO_2OP_SAT_SCALAR(vqadds_scalarw, 4, int32_t, H4, DO_SQADD_W)
+
+DO_2OP_SAT_SCALAR(vqsubu_scalarb, 1, uint8_t, H1, DO_UQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubu_scalarh, 2, uint16_t, H2, DO_UQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubu_scalarw, 4, uint32_t, H4, DO_UQSUB_W)
+DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, H1, DO_SQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, H2, DO_SQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, H4, DO_SQSUB_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 45a71a22853..254ff2a01b2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -469,6 +469,10 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
+DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
+DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
+DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1


