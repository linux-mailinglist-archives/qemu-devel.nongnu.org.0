Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B123A6ADB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:47:49 +0200 (CEST)
Received: from localhost ([::1]:54300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsooW-0006Th-DQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEy-000297-1r
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:04 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEe-0000X3-3e
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id d184so12362681wmd.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xAeZs9X3r6LPR0ptUDn0QYjtDmyUwat8UOX4ZD5718w=;
 b=MRzGF8jsRIIMvPB3J4VGVmpHWtzu/928kT7Ga55Ww6B3MxOc0wPK1hcIZYalg+tlSO
 HPZtZ6mfEdPRm2LpLGybvGqmzw1Uto1qEnU20BYrF5L1UfrYWx/eVZ0NPCGbOOnA4Jbh
 XuWDHyGmLd94FY6oH8QR7HoBV7IN54Se6f9xKeYLU8h4cVWNDD7Mm05kTQKeb8NkXSEh
 o6ww681mYqKWY+iFhnFAYuiiSv/EsNPDQ98/8xFXyuuEDyvV8VD/K1EO8UJYJCxQ5Tbe
 sFYL3JJDMYGPDZjoI/NFeMD02WGBpSSfUzNxao5zJI2TNPrdO8QsVb3DoHw68FTFOqZn
 CY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAeZs9X3r6LPR0ptUDn0QYjtDmyUwat8UOX4ZD5718w=;
 b=OOBMr7iDnw3sOcKn9Pxnu6Egu9uDLJl6DfTve3NsjbabzPRfJ0eOPwRGoJmDa7Wj93
 eMRAfq4aN5L1wpvboyyrIo4vV43HVGRmrf8JbjWpImcaOdIcGjJfBBDZGSQFjAW4cOfW
 3lm1eAhWvvhpAE4vPIP5Pwp/T9WZGAseC2368tlju9kyhv1EEujIAjX8TMk1mQoNLGfj
 OOKh4M0fm3EAEpxFUJVaIxhHNy9CWKK8X9sI/seudJSj2fv3gM8Z0bd+ixr1VmIiQx1m
 95Gn30oKAmVgOA0qn8ShLf7M8obFyLJDKyqQOxKRy13egfYknE+q+tA7zlC1Dllh+kUt
 Mgag==
X-Gm-Message-State: AOAM532OGtBgyg9YH7ybqjioPa8I0gAEBmPg8uyVc/1Aj+rnWGtotDHi
 A1EgCxfP45QRZNNmPQ4HvW/cSA==
X-Google-Smtp-Source: ABdhPJyiP3/ACp3DqyoRFt+cHDxJGUr1jq84qWEyD4En4spfZuB1yhy6Po3Mk8/5VjPdM4rYqORaYg==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr33363186wmk.147.1623683442680; 
 Mon, 14 Jun 2021 08:10:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 40/57] target/arm: Implement MVE VQADD and VQSUB
Date: Mon, 14 Jun 2021 16:09:50 +0100
Message-Id: <20210614151007.4545-41-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE VQADD and VQSUB insns, which perform saturating
addition of a scalar to each element.  Note that individual bytes of
each result element are used or discarded according to the predicate
mask, but FPSCR.QC is only set if the predicate mask for the lowest
byte of the element is set.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 ++++++++++
 target/arm/mve.decode      |  5 +++
 target/arm/mve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++
 4 files changed, 87 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1b807e1cf5f..092efdab475 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -173,6 +173,22 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index 6ba1187cec0..f7d564b9e9f 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -505,6 +505,33 @@ DO_2OP_U(vhaddu, do_vhadd_u)
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
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
@@ -520,6 +547,27 @@ DO_2OP_U(vhsubu, do_vhsub_u)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT_SCALAR(OP, ESIZE, TYPE, FN)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            mergemask(&d[H##ESIZE(e)], FN(n[H##ESIZE(e)], m, &sat),     \
+                      mask);                                            \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 /* provide unsigned 2-op scalar helpers for all sizes */
 #define DO_2OP_SCALAR_U(OP, FN)                 \
     DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
@@ -538,6 +586,20 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+DO_2OP_SAT_SCALAR(vqaddu_scalarb, 1, uint8_t, DO_UQADD_B)
+DO_2OP_SAT_SCALAR(vqaddu_scalarh, 2, uint16_t, DO_UQADD_H)
+DO_2OP_SAT_SCALAR(vqaddu_scalarw, 4, uint32_t, DO_UQADD_W)
+DO_2OP_SAT_SCALAR(vqadds_scalarb, 1, int8_t, DO_SQADD_B)
+DO_2OP_SAT_SCALAR(vqadds_scalarh, 2, int16_t, DO_SQADD_H)
+DO_2OP_SAT_SCALAR(vqadds_scalarw, 4, int32_t, DO_SQADD_W)
+
+DO_2OP_SAT_SCALAR(vqsubu_scalarb, 1, uint8_t, DO_UQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubu_scalarh, 2, uint16_t, DO_UQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubu_scalarw, 4, uint32_t, DO_UQSUB_W)
+DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, DO_SQSUB_B)
+DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, DO_SQSUB_H)
+DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, DO_SQSUB_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4dc7400e33e..6bc2d004908 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -446,6 +446,10 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
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


