Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB13A6A95
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:37:15 +0200 (CEST)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsoeI-0003ZX-Ur
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEz-0002G5-NW
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEk-0000aO-2F
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:11:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso187367wms.1
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lYpfqQIdUGlo3BFpvGTxd+2RUxLF5nVTd3Yu2EOAns=;
 b=yuqfXVHJWGMSiA3Y29bX53qyik5e26pxdT9TNYd7M4dyIgYjZrboBFO1J5c2K3aRpb
 jNeDby8iqROzptqDTz4CkvvqXqhQJDCDiU+neNpAa3axb4DaHY3SgfQRE7Omr/BURbNe
 rDZ7VPGWWFC2+1GY6gzWfeAq9KtuZosN3CnLHwGGHV6VgTEv4hYAQYlQTzrvnjGpNnWQ
 MGq32BVfzAwVGQ2+3BO3JY9/myNXvmfpQznDh+MZyGhNyMZZKBPplzwP2Ec2KUyBCPwx
 FPTZXpT9jZTI47QtVXj+kWXYg6MtyIzk7KdntkRIAyuJcoNKrDQ5TUSzVKu/eesI9EHt
 FkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lYpfqQIdUGlo3BFpvGTxd+2RUxLF5nVTd3Yu2EOAns=;
 b=HygUsz8D35fdUojR/Q8L2Kczg6vH2qnkmtLtN7RD5iXF3EfrTMUzxDMdRRVtugIQZQ
 qyJET0Tjf7i9m4eMOVCmgBnfyPhfLkjg7VErNvHbc+o5qnPx6mW/lsAGDyQpsyGXKrzO
 XX8G2sC5K6aGGjeN4ckI9Edp0PBcUn/U+ayLbSR6IJobBgPFv3scYKg8JiF7+zZzTFu4
 CF/zz5PiFnsiF4g5gpevJyXqLxod0YMkk5Hz5cbMYALNgyhpeySejX4T1w0TcE9mPM4d
 6meQ2M8g0uLxwOcxVcff6666HT1/2lb/T/Zdw1RwOShTtNTwTAE7qnZddFj8HQ7CSIWd
 lJlA==
X-Gm-Message-State: AOAM5320hQ6U5rvfI+u8/SIZwNG5bt77EQZyZFXQrG2fuOkXfTwiWpNq
 T0fCC6QGVjfMcalButNH3GVQCQ==
X-Google-Smtp-Source: ABdhPJyjPNNi5l9KEosqaa/d8SSuPWcyvAqD6l1sv+HFfFqFNyCH3pKjlDsbMQqvA1DmXMFunyaRhw==
X-Received: by 2002:a1c:2cc3:: with SMTP id
 s186mr34232547wms.150.1623683446695; 
 Mon, 14 Jun 2021 08:10:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 45/57] target/arm: Implement MVE VQSHL (vector)
Date: Mon, 14 Jun 2021 16:09:55 +0100
Message-Id: <20210614151007.4545-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Implement the MVE VQSHL insn (encoding T4, which is the
vector-shift-by-vector version).

The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      | 12 ++++++++++++
 target/arm/mve_helper.c    | 34 ++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 56 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 93847fc04ad..1c5626bb726 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -169,6 +169,14 @@ DEF_HELPER_FLAGS_4(mve_vqsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 80fa647c08f..2c37e265765 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -40,6 +40,15 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+# The _rev suffix indicates that Vn and Vm are reversed. This is
+# the case for shifts. In the Arm ARM these insns are documented
+# with the Vm and Vn fields in their usual places, but in the
+# assembly the operands are listed "backwards", ie in the order
+# Qd, Qm, Qn where other insns use Qd, Qn, Qm. For QEMU we choose
+# to consider Vm and Vn as being in different fields in the insn.
+# This gives us consistency with A64 and Neon.
+@2op_rev .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qn qn=%qm
+
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 @2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
@@ -121,6 +130,9 @@ VQADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 1 ... 0 @2op
 VQSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 
+VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index fc7e08d6128..31ee057db2e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -404,6 +404,18 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+/* provide unsigned 2-op helpers for all sizes */
+#define DO_2OP_SAT_U(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, uint8_t, FN)           \
+    DO_2OP_SAT(OP##h, 2, uint16_t, FN)          \
+    DO_2OP_SAT(OP##w, 4, uint32_t, FN)
+
+/* provide signed 2-op helpers for all sizes */
+#define DO_2OP_SAT_S(OP, FN)                    \
+    DO_2OP_SAT(OP##b, 1, int8_t, FN)            \
+    DO_2OP_SAT(OP##h, 2, int16_t, FN)           \
+    DO_2OP_SAT(OP##w, 4, int32_t, FN)
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -592,6 +604,28 @@ DO_2OP_SAT(vqsubsb, 1, int8_t, DO_SQSUB_B)
 DO_2OP_SAT(vqsubsh, 2, int16_t, DO_SQSUB_H)
 DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
 
+/*
+ * This wrapper fixes up the impedance mismatch between do_sqrshl_bhs()
+ * and friends wanting a uint32_t* sat and our needing a bool*.
+ */
+#define WRAP_QRSHL_HELPER(FN, N, M, ROUND, satp)                        \
+    ({                                                                  \
+        uint32_t su32 = 0;                                              \
+        typeof(N) r = FN(N, (int8_t)(M), sizeof(N) * 8, ROUND, &su32);  \
+        if (su32) {                                                     \
+            *satp = true;                                               \
+        }                                                               \
+        r;                                                              \
+    })
+
+#define DO_SQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
+#define DO_UQSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+
+DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
+DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2accc050708..bde62bf2445 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -402,6 +402,8 @@ DO_2OP(VQADD_S, vqadds)
 DO_2OP(VQADD_U, vqaddu)
 DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
+DO_2OP(VQSHL_S, vqshls)
+DO_2OP(VQSHL_U, vqshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


