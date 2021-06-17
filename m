Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F03AB3D6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:41:26 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrKn-0005lN-9O
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxI-00028g-5a
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx5-0007AQ-AT
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:17:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id n7so6556151wri.3
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+IiRg0/uIDtxqfm2zAjCe848g0evJop7egM4ojduX4=;
 b=ccvT4do9tdoTKddmHn761Pnowom7qG/YtHsvh7/wsRja4n7m4Wp2Ai/fLiqrQdimAB
 DK4BeAXZ9qqpIjpqEuo92z7t0TZOQpIHsGAiPcgSlq8F4/vrQPqUsKUxEKNsnAo+CXfk
 bvoxFWDPK468eDMeFpIwSdESzlM9GvjYrLVFsvLlZvi/NSyFO7TzSmfTsrEkAOVxthMO
 cl6UUWDZCaYgVCRY2Va8olFN+2aT2hoyilO9yeX4QNKoT3uJEsZqinJvp5ViAoCwFPVp
 TZxCAS8k+DPK8mAjZ2rmEux7VeIdXQHarb0dTUVAPhKPbRa5m0WPvELooZxNowsYo3pj
 t64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W+IiRg0/uIDtxqfm2zAjCe848g0evJop7egM4ojduX4=;
 b=cAKTgR+/LceZaBx2nNrBSphZROaEaknU87wjMkJoR6NgPqkp6kRURXDy6zbmhTWaJ4
 GCYJYazp4ogEIE/xyl2SIxfzHwLaOXNg6xMm50+wvRvZwrZuyEsVaSA+VdTMPnHN3LR5
 pxV8CfCgAulC0bSxhnJwReMRfYgKXQPT3eF0BmGmBl7j/QRsZk/Ub91CbiVrVlaSKTLO
 AMT67viuAXAKD5AzgWYNFwtJdp9veIRyv1oZtMyRlxIHj/uMlqX2VQGYblbM9ikstA1g
 R6d+1RAkPfg0xSBbcx50MNlp5MaqsSaTdcRJv/uXB5jYUEt1y+bJOoLYOf4a9RxuJbDE
 AtIQ==
X-Gm-Message-State: AOAM532yEdmwrDSol+sTIUqi8uzBLcpv2flDuHzg8iBQd/2i8gf6at3i
 GSPAFJ6E6MwHvGdEMNwtGAHH9w==
X-Google-Smtp-Source: ABdhPJwYWzt7wJ+w1tnxoFzeQj7xSNY4XoMD5dxUXa+yR4LOsJUX3hBmN3f2T/DzYiZd49BLLIQmFw==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr5379420wrm.229.1623932213886; 
 Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 30/44] target/arm: Implement MVE VQDMULH, VQRDMULH (vector)
Date: Thu, 17 Jun 2021 13:16:14 +0100
Message-Id: <20210617121628.20116-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

Implement the vector forms of the MVE VQDMULH and VQRDMULH insns.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  3 +++
 target/arm/mve_helper.c    | 27 +++++++++++++++++++++++++++
 target/arm/translate-mve.c |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 41dd61264e0..c4e766c6511 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,14 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index a71ad7252bf..9860d43f73c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -113,6 +113,9 @@ VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
 VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
 
+VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index c9f506e260c..d17c5e4588b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -385,6 +385,25 @@ DO_1OP(vfnegs, 8, uint64_t, DO_FNEGS)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT(OP, ESIZE, TYPE, FN)                                 \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn, void *vm) \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        bool qc = false;                                                \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            bool sat = false;                                           \
+            TYPE r = FN(n[H##ESIZE(e)], m[H##ESIZE(e)], &sat);          \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+            qc |= sat & mask & 1;                                       \
+        }                                                               \
+        if (qc) {                                                       \
+            env->vfp.qc[0] = qc;                                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
 #define DO_AND(N, M)  ((N) & (M))
 #define DO_BIC(N, M)  ((N) & ~(M))
 #define DO_ORR(N, M)  ((N) | (M))
@@ -551,6 +570,14 @@ static inline int32_t do_sat_bhw(int64_t val, int64_t min, int64_t max, bool *s)
 #define DO_QRDMULH_W(n, m, s) do_sat_bhw(((int64_t)n * m + (1 << 30)) >> 31, \
                                          INT32_MIN, INT32_MAX, s)
 
+DO_2OP_SAT(vqdmulhb, 1, int8_t, DO_QDMULH_B)
+DO_2OP_SAT(vqdmulhh, 2, int16_t, DO_QDMULH_H)
+DO_2OP_SAT(vqdmulhw, 4, int32_t, DO_QDMULH_W)
+
+DO_2OP_SAT(vqrdmulhb, 1, int8_t, DO_QRDMULH_B)
+DO_2OP_SAT(vqrdmulhh, 2, int16_t, DO_QRDMULH_H)
+DO_2OP_SAT(vqrdmulhw, 4, int32_t, DO_QRDMULH_W)
+
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
                                 uint32_t rm)                            \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f73b36cae49..ec9a9852868 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -396,6 +396,8 @@ DO_2OP(VMULL_BS, vmullbs)
 DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
+DO_2OP(VQDMULH, vqdmulh)
+DO_2OP(VQRDMULH, vqrdmulh)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1


