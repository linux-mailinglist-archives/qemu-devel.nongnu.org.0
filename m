Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFD83AB3C6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:38:57 +0200 (CEST)
Received: from localhost ([::1]:58974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrIO-00007X-Vy
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxF-00021H-2I
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:06 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx3-00079L-JJ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:04 -0400
Received: by mail-wr1-x433.google.com with SMTP id f2so6507281wri.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAWm/4A1788jgxb0yoY2f2vrprIsgixbiONeVZYAy5I=;
 b=qRI2fTxk6QgTC5ZJfmitQGVGXhMJ/eqfIZUX8BVqkDVh5dAL+oizqw7bzLUIs4+vXp
 fcsbAZJv8zrRjb+7suYgN3PeM5ZGITMazdd341bYEZl0Kt6Mr6emuqNVVvtuuDvWlir1
 KldUdfB0UYEhnFKHziRKhGjPYxE4/tveLiGfSQjvZDP0vWnvZvHj/xpqefia8bMj0swJ
 yOK0E2dNRkTQmgqxdrRUh6R7VsRm7fHQAEDx67b2p3fqETE2Om4dIAIWYeLsiK3YTzCD
 KUCr5+4y+YW+WRgOtWVc9RQETwFHutQLuVATDWg0a/R/0NmaG3uhq8pk930VvYiA4+Q8
 kwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAWm/4A1788jgxb0yoY2f2vrprIsgixbiONeVZYAy5I=;
 b=XND9uD3Afq1GTVXk4mekkSiqRjWW+2Q5ohha1Zit4xM9WOSpTZtUa2BlBTWQqjLYLN
 RErlt1mY2+ct1zijhZ/hoYeb2RlWbmQaRlpNpVse64FGUcbbi8St7yZhC1KBvoDDz3/I
 ltPiuUp0AkaNm3+8388xuwYF3CjjsTaHHR7qfU+qk6IJnn4moN/ABZw7xZjGWepsw1p9
 7Iuivp4ihCMwtdjGAU9ZAbUl0scpBkZYGnHiSypm2O+fU2I+8CI2dgTOKAyLXue2w51g
 rMbM0ZJF9cikpQxE/6DJ0G0chvkJu+aYpl1qiDkKyjcoagLITCdei+weaXQk+e54yUSe
 Qy1g==
X-Gm-Message-State: AOAM530+bPOnPaqjsRr9hl6UkOzY7+A6GHmCWBG4cASFy3pJNinsgHr2
 nRuiJfqAfR1/zPsSLpPJ2gQycQ==
X-Google-Smtp-Source: ABdhPJwMt9jxhm+xBZEvVvPukqeWepyWS5bq6XNCWuRnjoKydMTdjoNYPwgV0Uaz1cyTl5hwuZQnSA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5320405wrr.35.1623932212191; 
 Thu, 17 Jun 2021 05:16:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 28/44] target/arm: Implement MVE VQDMULH and VQRDMULH
 (scalar)
Date: Thu, 17 Jun 2021 13:16:12 +0100
Message-Id: <20210617121628.20116-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
elements by the scalar, double, possibly round, take the high half
and saturate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 092efdab475..a0a01d0cc3b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -189,6 +189,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vqsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmulh_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmulh_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c85227c675a..47ce6ebb83b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -174,6 +174,9 @@ VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
+VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 0ae2aeadbb2..0e168ab47f2 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -533,6 +533,24 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_UQSUB_H(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT16_MAX, s)
 #define DO_UQSUB_W(n, m, s) do_sat_bhw((int64_t)n - m, 0, UINT32_MAX, s)
 
+/*
+ * For QDMULH and QRDMULH we simplify "double and shift by esize" into
+ * "shift by esize-1", adjusting the QRDMULH rounding constant to match.
+ */
+#define DO_QDMULH_B(n, m, s) do_sat_bhw(((int64_t)n * m) >> 7, \
+                                        INT8_MIN, INT8_MAX, s)
+#define DO_QDMULH_H(n, m, s) do_sat_bhw(((int64_t)n * m) >> 15, \
+                                        INT16_MIN, INT16_MAX, s)
+#define DO_QDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m) >> 31, \
+                                        INT32_MIN, INT32_MAX, s)
+
+#define DO_QRDMULH_B(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 6)) >> 7, \
+                                         INT8_MIN, INT8_MAX, s)
+#define DO_QRDMULH_H(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 14)) >> 15, \
+                                         INT16_MIN, INT16_MAX, s)
+#define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
+                                         INT32_MIN, INT32_MAX, s)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
@@ -600,6 +618,13 @@ DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, DO_SQSUB_B)
 DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, DO_SQSUB_H)
 DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, DO_SQSUB_W)
 
+DO_2OP_SAT_SCALAR(vqdmulh_scalarb, 1, int8_t, DO_QDMULH_B)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarh, 2, int16_t, DO_QDMULH_H)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarw, 4, int32_t, DO_QDMULH_W)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 27c69d9c7dd..84a7320cf80 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -450,6 +450,8 @@ DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
 DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
 DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
 DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
+DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
+DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1


