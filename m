Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0B3BA0F7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:12:05 +0200 (CEST)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIxg-0008I4-RK
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImQ-0007jN-0B
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:30 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:34365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImB-0007ja-Ik
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:25 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso6598061wmc.1
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0hJjqQpPLVEMCn6XUbSOpCZ5sLV4poKmyaJ2lBTq9eQ=;
 b=rQ9C2UuVMnTWq7v+PixXPXbrrvwpes3jj7PHGkJpCjiKKb8odvYUflxEZXw037iHg6
 I1Qe0CW4GFHIKPX7V1VSjcbr9LPQQsGnKHm2Kyi+fB9+rZ6cpa9+mutVsPDx3RMPG0KH
 KecjZUtMDDvVQx8spfRKnlq1oCEhujZWObDLGAqSJXr0VcAj484PGuGO1NMOeEuGlEp/
 NG9b0AMsnXLuWkV3lji0nvJghxbZKAlPEDyxqDLn4LRHUwzMIVsEkMh+Gy+qM4SSLS3P
 VNb7GOzzm7NHHJBPxkKRSt5oXeGPx5fSSRKwpaQ5mFwedFpv1aoofeEx8Tsayww9EZpV
 k9tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0hJjqQpPLVEMCn6XUbSOpCZ5sLV4poKmyaJ2lBTq9eQ=;
 b=cRChpBNt/McFhKlEk4gTt9KddKQOqpSFeY7SRsR2nh5QQS+EMdMleqdxgWF3DufL43
 5a1qy1fuxu5myXTROKOzQ/8LfvVrN6FmNwTbnZTGMXMrNj7Sjj7tyWRp3nCI46erBzqw
 yZeunwAEqGLFt+SCpzMuPbd5HKjFEqAKQFQJOPvGgf+TLXiKWmO1U9gd5epinq3RSSjh
 DSf1hFSOLSujpPX2Xa9U4YFHTYkIo6vNOypMF2j/V1RisPhQei95E6M1dru6DeLfRDjZ
 zPPSDQXKCAIPzcignDTf4lQoLOjw+g3LMkSqr/gyLEvqdwDgfCFEasbrpJ/Km4KmUD1l
 mqdA==
X-Gm-Message-State: AOAM532wkHgjUD0Znz6KJbXyZErApF9lQbxyQEo9WNYMtrhp2GN66Ca4
 EVnS5cTXTetsla/XFcp7jwjBmbOsSXAD3XkL
X-Google-Smtp-Source: ABdhPJzlb3qcaBqsREuV9vv6fkNBsoM4Pajk6Y4QeKJsCWE6o16dBWSFSQkr02uM4vohYBqMDPQjGA==
X-Received: by 2002:a05:600c:3b8b:: with SMTP id
 n11mr15900569wms.159.1625230809398; 
 Fri, 02 Jul 2021 06:00:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/24] target/arm: Implement MVE saturating narrowing shifts
Date: Fri,  2 Jul 2021 13:59:48 +0100
Message-Id: <20210702125954.13247-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Implement the MVE saturating shift-right-and-narrow insns
VQSHRN, VQSHRUN, VQRSHRN and VQRSHRUN.

do_srshr() is borrowed from sve_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-13-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  30 +++++++++++
 target/arm/mve.decode      |  28 ++++++++++
 target/arm/mve_helper.c    | 104 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  12 +++++
 4 files changed, 174 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 323ac07fa35..96b4c0dfd34 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -414,3 +414,33 @@ DEF_HELPER_FLAGS_4(mve_vrshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrnb_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnb_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrnb_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnb_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrnt_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqshrunbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrunbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_sb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_sh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnb_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrnt_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrshrunbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrunbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshruntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrshrunth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e2c177f56a2..1d11387bc07 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -391,3 +391,31 @@ VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
 VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
 VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
 VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
+
+VQSHRNB_S         111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNB_S         111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNT_S         111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNT_S         111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNB_U         111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNB_U         111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 0 @2_shr_h
+VQSHRNT_U         111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_b
+VQSHRNT_U         111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 0 @2_shr_h
+
+VQSHRUNB          111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_b
+VQSHRUNB          111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_h
+VQSHRUNT          111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
+VQSHRUNT          111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
+
+VQRSHRNB_S        111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNB_S        111 0 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNT_S        111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNT_S        111 0 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNB_U        111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNB_U        111 1 1110 1 . ... ... ... 0 1111 0 1 . 0 ... 1 @2_shr_h
+VQRSHRNT_U        111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_b
+VQRSHRNT_U        111 1 1110 1 . ... ... ... 1 1111 0 1 . 0 ... 1 @2_shr_h
+
+VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_b
+VQRSHRUNB         111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 0 @2_shr_h
+VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_b
+VQRSHRUNT         111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 0 @2_shr_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a97942208ba..3e736e89095 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1362,5 +1362,109 @@ static inline uint64_t do_urshr(uint64_t x, unsigned sh)
     }
 }
 
+static inline int64_t do_srshr(int64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else {
+        /* Rounding the sign bit always produces 0. */
+        return 0;
+    }
+}
+
 DO_VSHRN_ALL(vshrn, DO_SHR)
 DO_VSHRN_ALL(vrshrn, do_urshr)
+
+static inline int32_t do_sat_bhs(int64_t val, int64_t min, int64_t max,
+                                 bool *satp)
+{
+    if (val > max) {
+        *satp = true;
+        return max;
+    } else if (val < min) {
+        *satp = true;
+        return min;
+    } else {
+        return val;
+    }
+}
+
+/* Saturating narrowing right shifts */
+#define DO_VSHRN_SAT(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)   \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        LTYPE *m = vm;                                          \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        bool qc = false;                                        \
+        unsigned le;                                            \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
+            bool sat = false;                                   \
+            TYPE r = FN(m[H##LESIZE(le)], shift, &sat);         \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
+            qc |= sat && (mask & 1 << (TOP * ESIZE));           \
+        }                                                       \
+        if (qc) {                                               \
+            env->vfp.qc[0] = qc;                                \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+#define DO_VSHRN_SAT_UB(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 1, uint8_t, 2, uint16_t, FN)       \
+    DO_VSHRN_SAT(TOP, true, 1, uint8_t, 2, uint16_t, FN)
+
+#define DO_VSHRN_SAT_UH(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 2, uint16_t, 4, uint32_t, FN)      \
+    DO_VSHRN_SAT(TOP, true, 2, uint16_t, 4, uint32_t, FN)
+
+#define DO_VSHRN_SAT_SB(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 1, int8_t, 2, int16_t, FN)         \
+    DO_VSHRN_SAT(TOP, true, 1, int8_t, 2, int16_t, FN)
+
+#define DO_VSHRN_SAT_SH(BOP, TOP, FN)                           \
+    DO_VSHRN_SAT(BOP, false, 2, int16_t, 4, int32_t, FN)        \
+    DO_VSHRN_SAT(TOP, true, 2, int16_t, 4, int32_t, FN)
+
+#define DO_SHRN_SB(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), INT8_MIN, INT8_MAX, SATP)
+#define DO_SHRN_UB(N, M, SATP)                                  \
+    do_sat_bhs((uint64_t)(N) >> (M), 0, UINT8_MAX, SATP)
+#define DO_SHRUN_B(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), 0, UINT8_MAX, SATP)
+
+#define DO_SHRN_SH(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), INT16_MIN, INT16_MAX, SATP)
+#define DO_SHRN_UH(N, M, SATP)                                  \
+    do_sat_bhs((uint64_t)(N) >> (M), 0, UINT16_MAX, SATP)
+#define DO_SHRUN_H(N, M, SATP)                                  \
+    do_sat_bhs((int64_t)(N) >> (M), 0, UINT16_MAX, SATP)
+
+#define DO_RSHRN_SB(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), INT8_MIN, INT8_MAX, SATP)
+#define DO_RSHRN_UB(N, M, SATP)                                 \
+    do_sat_bhs(do_urshr(N, M), 0, UINT8_MAX, SATP)
+#define DO_RSHRUN_B(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), 0, UINT8_MAX, SATP)
+
+#define DO_RSHRN_SH(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), INT16_MIN, INT16_MAX, SATP)
+#define DO_RSHRN_UH(N, M, SATP)                                 \
+    do_sat_bhs(do_urshr(N, M), 0, UINT16_MAX, SATP)
+#define DO_RSHRUN_H(N, M, SATP)                                 \
+    do_sat_bhs(do_srshr(N, M), 0, UINT16_MAX, SATP)
+
+DO_VSHRN_SAT_SB(vqshrnb_sb, vqshrnt_sb, DO_SHRN_SB)
+DO_VSHRN_SAT_SH(vqshrnb_sh, vqshrnt_sh, DO_SHRN_SH)
+DO_VSHRN_SAT_UB(vqshrnb_ub, vqshrnt_ub, DO_SHRN_UB)
+DO_VSHRN_SAT_UH(vqshrnb_uh, vqshrnt_uh, DO_SHRN_UH)
+DO_VSHRN_SAT_SB(vqshrunbb, vqshruntb, DO_SHRUN_B)
+DO_VSHRN_SAT_SH(vqshrunbh, vqshrunth, DO_SHRUN_H)
+
+DO_VSHRN_SAT_SB(vqrshrnb_sb, vqrshrnt_sb, DO_RSHRN_SB)
+DO_VSHRN_SAT_SH(vqrshrnb_sh, vqrshrnt_sh, DO_RSHRN_SH)
+DO_VSHRN_SAT_UB(vqrshrnb_ub, vqrshrnt_ub, DO_RSHRN_UB)
+DO_VSHRN_SAT_UH(vqrshrnb_uh, vqrshrnt_uh, DO_RSHRN_UH)
+DO_VSHRN_SAT_SB(vqrshrunbb, vqrshruntb, DO_RSHRUN_B)
+DO_VSHRN_SAT_SH(vqrshrunbh, vqrshrunth, DO_RSHRUN_H)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f1a8f21b772..eef4f1f6ce3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -926,3 +926,15 @@ DO_2SHIFT_N(VSHRNB, vshrnb)
 DO_2SHIFT_N(VSHRNT, vshrnt)
 DO_2SHIFT_N(VRSHRNB, vrshrnb)
 DO_2SHIFT_N(VRSHRNT, vrshrnt)
+DO_2SHIFT_N(VQSHRNB_S, vqshrnb_s)
+DO_2SHIFT_N(VQSHRNT_S, vqshrnt_s)
+DO_2SHIFT_N(VQSHRNB_U, vqshrnb_u)
+DO_2SHIFT_N(VQSHRNT_U, vqshrnt_u)
+DO_2SHIFT_N(VQSHRUNB, vqshrunb)
+DO_2SHIFT_N(VQSHRUNT, vqshrunt)
+DO_2SHIFT_N(VQRSHRNB_S, vqrshrnb_s)
+DO_2SHIFT_N(VQRSHRNT_S, vqrshrnt_s)
+DO_2SHIFT_N(VQRSHRNB_U, vqrshrnb_u)
+DO_2SHIFT_N(VQRSHRNT_U, vqrshrnt_u)
+DO_2SHIFT_N(VQRSHRUNB, vqrshrunb)
+DO_2SHIFT_N(VQRSHRUNT, vqrshrunt)
-- 
2.20.1


