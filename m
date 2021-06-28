Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE813B5FB4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:11:26 +0200 (CEST)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxryw-0001Hx-18
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrn3-0003PN-Ty
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxrmk-00065l-T6
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 09:59:09 -0400
Received: by mail-wr1-x429.google.com with SMTP id g7so16805588wri.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 06:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=pPq5eB58a5EWRFVOrfeuahU03Jta2nUnTL0KzfUKX5I=;
 b=Ea9qgGwjOFY0ptg5UfPtQPGGkE0HwqcMepe9W3ALIJtJ8m2CCH6XEo2kivGVLjFedp
 le4jtzonyuEFMsQ4SlGqiF6k1h2JNdFuhHazXjAWNYp3KtMt4ORgV17Yif+4i7zuZQ7I
 rt1wxL9m5cJ5V3VStCR0KRSk/MEOw9jwmrfQcHKwnZcUqurwQeDYYA7A7MQaGSSqFQEn
 GVFQRd24jACRkRCHDgfO1etDdYJTWH0d/UsaI5jHcSk04Vw88OqcX9/Un0+/GEKg+NLh
 0SGzW2yI29zRkfdRK4OWelhwFX8wSGKv6QVbCvEMCgCEncKLrQvjPc3aH5BSqi/yXnrD
 IYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPq5eB58a5EWRFVOrfeuahU03Jta2nUnTL0KzfUKX5I=;
 b=N5s894R3Z2ecvxhXYCnxX5tg9vsxH0J+6GJrK+ONVBGWSCsiGZb95fzSnnpGog7//G
 mA+RGife3/1J1B2QnwzUYeHf+FefBOecF/9N5V0FCepQrtHOF81PyVQxO1PXohOuNB0P
 tD1z7AdSYfcnKW9k1uOXxIsaZRNtWTl4pmzBTJyCl2FmmDvAIq0BEGFkoAOHcGe6af9W
 UjYKurrQo9j8EIZUebzDGxTHJ/MVmEauuBsYuj6meyrZtiTREkhekwAEIi+r8iZaK7g9
 qdM3+kA7ERtblfBQ2eLJpZkEAFI+/kH4vW1hYqhVgIZ7/cXesnHcjCvhYvOevIV5ENga
 jzDg==
X-Gm-Message-State: AOAM532hESIu1ZHudQSSF1xQrmaqLL/BAAE5HO0wy1C1/uMgm/J7BXrT
 iwhbGpMxBxCCf1YJXJywanF4oA==
X-Google-Smtp-Source: ABdhPJxe1odsnqFujgnKv3PyLXMCr8h7DfLL64S/qRx4akmbvwncBJ3FbIxP4R8no3cuyymLOwW8Xw==
X-Received: by 2002:a05:6000:246:: with SMTP id
 m6mr27273567wrz.116.1624888725778; 
 Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d12sm12047627wri.77.2021.06.28.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 06:58:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/18] target/arm: Implement MVE saturating narrowing shifts
Date: Mon, 28 Jun 2021 14:58:29 +0100
Message-Id: <20210628135835.6690-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628135835.6690-1-peter.maydell@linaro.org>
References: <20210628135835.6690-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE saturating shift-right-and-narrow insns
VQSHRN, VQSHRUN, VQRSHRN and VQRSHRUN.

do_srshr() is borrowed from sve_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


