Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C943AB403
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:49:58 +0200 (CEST)
Received: from localhost ([::1]:42494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrT3-0001kt-Gu
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxJ-0002FM-Of
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:56164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx7-0007Cv-F9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id c84so3277918wme.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uw9BmjefCWH7wFd8kwcS0Ujw/qGKgac5TabPp9d3fQ=;
 b=av45oS7iXyWwUXYyNYX8Ey2RLU3lMaIOLvtMy9RtNoQ6B5CLFFbAsb8rjn8O0ZTJGD
 n1yAdAGXrXgw8AzR8j1fQiN7LB3JT22ou250dp9auSRT9EH32QISRJIownsiIDR3Uzkn
 QN/9vMq8E/mzT++XJzsRTU1G7aVAE0E5eF4rEQZFxrRdKXz3nIwUaetATp2aU+Qd9kzu
 SCBfma7/4Oag3XoBRuQIngg7EQFDW9DoMhMnJm/iNni+rVMyS2Ev5BXbNVVqMMF5rVgu
 dnttmTDOkKB46B+u/MzRjs6Lsca+B1iWO91RkJK7CYWCZWlE8b5k26cu3huFpgHWx2OH
 guzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uw9BmjefCWH7wFd8kwcS0Ujw/qGKgac5TabPp9d3fQ=;
 b=EX0vqwyEXfCgLlY3W890LvfL7G7t/K3ZUX9SXVuztJPhIhujBHnqqJK2ZFw/ZV2IDI
 GyZcFxav30dPX4pkGBPS9fHWO/lfmaFbgDNZ30tvNC+n3fBssMZUQiJjw8xx2AFcCdbx
 sp0QiuEixXREQaaymJ6YGTALY1CMxTWsNQq9ckNxJGTOUpMOP8efTJV3hzZCF9mUn+3w
 5NHpqLHFbZSr2+zc4x+eJbINVTL8C0eo5OKOWUWM34ZwKcm1ad+wwREq7ghfsKzlAEOh
 Wm6L2lhRNa0eybzFv/uB4AKFkINt78x1Z8sJDVztXWZQN1cs3L5pTc9Z3JyrIasv+A1D
 pJIw==
X-Gm-Message-State: AOAM531SRkPL9gmRlwHYWVt9Tu9Hi+6V424sJP6+ZABjk90DyY120cm9
 JrMXeR62QtXdh3L1SYQEAa081Q==
X-Google-Smtp-Source: ABdhPJxCGk5bz96gz3A/sIDl1UuQ5vLWNz7pTwzrCQeMr2sYPuHf7DZO2ciWwiCQ6ABSaBKrEcAc7Q==
X-Received: by 2002:a05:600c:4fca:: with SMTP id
 o10mr4738078wmq.91.1623932216176; 
 Thu, 17 Jun 2021 05:16:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 33/44] target/arm: Implement MVE VQRSHL
Date: Thu, 17 Jun 2021 13:16:17 +0100
Message-Id: <20210617121628.20116-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1c5626bb726..42be99ad526 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2c37e265765..e78eab6d659 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
+VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5175684b232..82140ac1e5e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -622,9 +622,15 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
 #define DO_UQSHL_OP(N, M, satp) \
     WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+#define DO_SQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, true, satp)
+#define DO_UQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, true, satp)
 
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+DO_2OP_SAT_S(vqrshls, DO_SQRSHL_OP)
+DO_2OP_SAT_U(vqrshlu, DO_UQRSHL_OP)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 52fef6cd892..bd4c6150cad 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
+DO_2OP(VQRSHL_S, vqrshls)
+DO_2OP(VQRSHL_U, vqrshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


