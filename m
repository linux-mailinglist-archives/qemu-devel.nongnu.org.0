Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D03AB3EB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:45:41 +0200 (CEST)
Received: from localhost ([::1]:56312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrOu-0000VU-KY
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxE-0001xj-51
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:04 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx2-000788-Us
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:03 -0400
Received: by mail-wr1-x435.google.com with SMTP id e22so2945861wrc.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLRNFGfx3pHD+bNxaIzhEjWQfa2o1cI6nDkO6Q1JwyQ=;
 b=kQK6LyTCYGu2S9N8J3f90DNEdkqyviwVuvBsomhPp00SxMWanIVMvforLWj5wtIA9P
 8ysHOR0WJbwhurcyCt/PtJo92iny+4gl14qAtTow7N7aBnM/7kDCTLTeXT4HcuU1KoL+
 OYDhZQhi2tQsw2cYizaHv/Wd5L1DhjHF4NctUfuwUanrpCUQey8r8tPM0bkHX5/N77h2
 1gRHp32QO4b64M+2Rj4Wb5mq7yzN1wChms8hs2JVr7kESp3BAYG2YKzCJW48YXxbSaeE
 vE2nxUCcoTRBw3rpuziHoB3pw3ZFuTHNiL9YBWqre5VuvEsLw3ySreEIz4TGK5T31anX
 FkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLRNFGfx3pHD+bNxaIzhEjWQfa2o1cI6nDkO6Q1JwyQ=;
 b=nyphqhFQ+TszrQPogxEQdpXKNMj9XQEPDWnyr8mIOrX8zV7eEnmQ6PJn/NpT+LEWy/
 En1R8bzKI0yuicVUa+lV6+U4tY2ILD4Tj4SXJoaxHTPnjf36Ghf6DQX7TGzJ2LsZAKMT
 4sSlqK19/0zFAhsKuzRht66J/fvqPwM2hFkfBZSCP7VoKuQeg3OOkevbnKv0h02mEpd4
 lePqdoLlPFc2b86xywgS8sjO9Fx3Hmii0YsX3m0V9LdlCjZq2Sm5vJ/j9bPFw/zcsuvJ
 CAs9zP95uhBVUE3cgCgwd7ZzDiJYHgB3sjve1bMRJfaU5KE9wUvp7/O5jHRr75WDq8jO
 ZiYg==
X-Gm-Message-State: AOAM533n1+YAZG9q1HUdiW3R4jSGUAJxZpBixR07mneZOnnRTxZYBw6y
 XyClpzF9ZWKKI9zaPSBDanpnRw==
X-Google-Smtp-Source: ABdhPJzWKPgr/hS7JvqWCla3rpHci7nvm34xUIIV7sjQQDu4kCtOSied8J4Jgjx/pvOfNwOQfRdZQA==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr5282757wrd.186.1623932211485; 
 Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 27/44] target/arm: Implement MVE VQADD and VQSUB
Date: Thu, 17 Jun 2021 13:16:11 +0100
Message-Id: <20210617121628.20116-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
index 775c667561e..0ae2aeadbb2 100644
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
index 7c4c06e434c..27c69d9c7dd 100644
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


