Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240643AF173
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 19:08:39 +0200 (CEST)
Received: from localhost ([::1]:60582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvNPa-0006BP-5n
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 13:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnT-0007a5-Tx
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:16 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMnQ-0007hq-TK
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:29:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j21-20020a05600c1c15b02901dde2accccbso400950wms.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=axufOvIHwp3fa9kiz7O72RDgfHXKZ6dfgM4uleP0H/Q=;
 b=m78gU7Xq9Uu3GVSuKFx27t1HE5yy9BHQ4q6nicsmu+uVMGIc9/qD4kTtUecY8+g1Pl
 nALQ2llJzTmfey9vMm1hS6Bpvw0zafoIlgmDCNQkJRYaSIwErLcGc5zu1slWeCbb1Jie
 8gOy97Co5DL3FM1gIHJiX838iOCdNxCZSRlFnELEIQRVc2KxdK/8CILvpEMagRGDmgFn
 sYMCqpzS04YgYCc1qfgy1RGc+HQe0aK+2WmW10HTy+PuKnvpP83FX9JNwNE/vpREwg4L
 h3L82f3zK77V5PB0oH61GN4pjwNjPmzjhxTABCFxdeGc/fv+m/wanzP575qrf6W4sHQo
 Myxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=axufOvIHwp3fa9kiz7O72RDgfHXKZ6dfgM4uleP0H/Q=;
 b=j+jvRR7IogjQ2z8KoxoQ89thbfowzwX94OdLet+FFjFYgLEc4oJmpeOt4dghyDrvqO
 5I5yp2Yd50fj9wadoTak0YZrc+ObcUCjxk15GfK2WEZpZspEyRM/s82f5g69U0zZb9kI
 uEi2QHtot/Ijq2zyoviEIDR7LfODLylEI4dzyqBc2jIQSxUFmUksRhiv6TLE8w1147L1
 Y+s7orNCUXGKuoEqYxQK8Wng39G7uOHKoiXqQGHouyJKuvTpcuwhdg/I4QuoNZWYuOW3
 9XSEXk/YcHIo6Jsaw7cB3ldivRS0iAJcIuDhRFCcpAJFnXvjcs6/LMT0tcuesfwxPgVj
 mS9Q==
X-Gm-Message-State: AOAM531CjYC6h9LIQ2FWJFXJ2IwwcR6M/li2ngSXBKnDE7miCDftWDuA
 pCaXnVV65NK2GtpeL6M9lV3HBxZ+ixQqAHfl
X-Google-Smtp-Source: ABdhPJwDqkKMNFlCS1GG+eDzXcMpB65IrfXI0SZdNtYrrGDPFYho3/RJduZ2Ql3uLedZzYD8SfVXqA==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr28574248wmj.128.1624292951569; 
 Mon, 21 Jun 2021 09:29:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.29.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:29:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/57] target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
Date: Mon, 21 Jun 2021 17:28:15 +0100
Message-Id: <20210621162833.32535-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
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

Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
elements by the scalar, double, possibly round, take the high half
and saturate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210617121628.20116-29-peter.maydell@linaro.org
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
index 1d97bd2ae84..f85a131c021 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -518,6 +518,24 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
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
@@ -585,6 +603,13 @@ DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, DO_SQSUB_B)
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


