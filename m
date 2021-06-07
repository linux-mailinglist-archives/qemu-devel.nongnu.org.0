Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A89DA39E564
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:28:46 +0200 (CEST)
Received: from localhost ([::1]:60318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJ3N-0002mG-K3
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIay-0007lf-Al
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:24 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaW-00083C-Uy
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:24 -0400
Received: by mail-wm1-x32b.google.com with SMTP id o127so89799wmo.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zIwanJ3AQdDQdQ1ALSTjRK7X+97mJn2Se8diVqTisuk=;
 b=MrgTTp1t7XftpPzgJSCedOUijNGkGUPIdSOM3QVD86TLoZGFdr5qEFuTm6LB6+ZJhi
 /3p9ScWndW9BBK1lzEbYFYUnVE5+k01d6v4niKA2g7iLqGLoXCLtOhgFOkLBmEAOEF5O
 nWwbptE0ql9kvE8fBqO5FrrIuibsOT0Y6p33TMnT97TBy93bfh5fQmSJZmIbChAFSUs/
 3HyZ5cJN7s0auQit1EOaxjlkOaL2FhO93ldtL0aneBmndlEFjIteALfZsozI8fTVZIGq
 AzJK+rv9tQ93ebZP8h0wpO2C5mRcWLcYFuLiKVJ5SpEXvIdr+UTLHBZspkQT0NmiEXdW
 8C4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zIwanJ3AQdDQdQ1ALSTjRK7X+97mJn2Se8diVqTisuk=;
 b=PzdityQHQvUkqgtOLIO4t3ybQ5SIGPcIS8iRsQeKP11rIv2w9FMixwOVmWHZDCAle4
 nkGHNFMik0mzLr82pJ6po2vhgBbsR9e28ilVqMGeb2zhtHYmlKuvmxitbrb6vYW/kEOj
 XlLGyhr3M/O7klvGCHEm41JVBG1aDzkZuEWLU8m1Dq7HvPj1DqjEGj1wvhLoNKJ72d4e
 aWdq3lhwdNaOpiX9yHaBl61MhdAUcZdZY6yDqOlzEX9/V5TnzLwVoEwcmA1oHiP0tcRx
 anEagbZqFU5Mhi+cPt6aMRtF0NbeZeXSsRAFOi47TrPw3pH5yRVWK6+2uQfQl/XtBIIX
 S1YQ==
X-Gm-Message-State: AOAM53374zURKJpzo0Rlc8b+/68TdKbYvX4SBt7aJUzdVoWzA23LjQ82
 kcEm4xRqFKqOCGfr8aHNqo+2DhqQMtA/DXYi
X-Google-Smtp-Source: ABdhPJzaJvxKKVYsgmQyR6s247Xid6dIQhBQSOBM6B39uTIr97LjiOxZTCSq33LTVlQHiMUQn3GlMQ==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr74397wmg.160.1623085134420;
 Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 39/55] target/arm: Implement MVE VQDMULH and VQRDMULH (scalar)
Date: Mon,  7 Jun 2021 17:58:05 +0100
Message-Id: <20210607165821.9892-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Implement the MVE VQDMULH and VQRDMULH scalar insns, which multiply
elements by the scalar, double, possibly round, take the high half
and saturate.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index a1acc44e40e..9bab04305a7 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -191,6 +191,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
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
index 41c4f2033f6..6e2da6ac8bc 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -505,6 +505,24 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
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
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, H, FN)                           \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
@@ -575,6 +593,13 @@ DO_2OP_SAT_SCALAR(vqsubs_scalarb, 1, int8_t, H1, DO_SQSUB_B)
 DO_2OP_SAT_SCALAR(vqsubs_scalarh, 2, int16_t, H2, DO_SQSUB_H)
 DO_2OP_SAT_SCALAR(vqsubs_scalarw, 4, int32_t, H4, DO_SQSUB_W)
 
+DO_2OP_SAT_SCALAR(vqdmulh_scalarb, 1, int8_t, H1, DO_QDMULH_B)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarh, 2, int16_t, H2, DO_QDMULH_H)
+DO_2OP_SAT_SCALAR(vqdmulh_scalarw, 4, int32_t, H4, DO_QDMULH_W)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, H1, DO_QRDMULH_B)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, H2, DO_QRDMULH_H)
+DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, H4, DO_QRDMULH_W)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 254ff2a01b2..4d08067c1e2 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -473,6 +473,8 @@ DO_2OP_SCALAR(VQADD_S_scalar, vqadds_scalar)
 DO_2OP_SCALAR(VQADD_U_scalar, vqaddu_scalar)
 DO_2OP_SCALAR(VQSUB_S_scalar, vqsubs_scalar)
 DO_2OP_SCALAR(VQSUB_U_scalar, vqsubu_scalar)
+DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
+DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
-- 
2.20.1


