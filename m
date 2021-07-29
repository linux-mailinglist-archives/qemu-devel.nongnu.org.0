Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648D53DA274
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:48:43 +0200 (CEST)
Received: from localhost ([::1]:56536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m94Wo-0006MW-Bs
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941C-00014c-Pl
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:02 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:39823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940o-0001Fp-Ct
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:16:02 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 f14-20020a05600c154eb02902519e4abe10so6545801wmg.4
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TU5VLZPJYGx6Qh3NO9t/DQaQygrYYqxLMGPPbmN9qvY=;
 b=wUoMfZQE8zQRSzgfnhWZ7X0dprVFyfuPzzD+AlSplBKPKaEXKHOXIPzkuliYQqlgSy
 wCVTIGvLtpofckeMqpLRsKX187UqfQnDLWcfDjGSzVUxiIdlh0sYMxe+5I9CvRWrKkXN
 4ZkhcE7bYccOSxQZ8rBf1GU7Q6F4Wde0zUMm+zDyE1LUt4DKgWB+D2gJMyiRxEh2HVcI
 m3qC2ggkQOJuo2TSg02bpUruUBc5tADkYOd3qQsIsG+EFcfCRXCFeg7H1q0zn8LX/239
 fQEYA9trvoVI8FsVh9JACB6tjRDMFKY4pFih1eKEmr2WvYbAbXzDWTorPfZjzoo1M0BP
 +vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TU5VLZPJYGx6Qh3NO9t/DQaQygrYYqxLMGPPbmN9qvY=;
 b=mhDtRY95pMTOW5uuZXCFxX0pOrE2cp5QQxtJrt+Ikeidy+TcOORmLroNTRQg30OSCq
 TwZ01xR55VKREBdCLnNmH/cJEOokJGhbgHJnICQOFrQiWecwn0U0My7b4zM0eo5E2bwp
 dHjS/TCWM1MaTnJzW9YywuosnY+VFSqxSULEfpMaLrEUcOazHBV5aqjugnoM8qU+GLf9
 YBZb/NzG/3Mabio/QT7P0Z8Au55HdPt+km1OPuvCyg258DbkOpnO9bzZQFEGDzHZo+OK
 d9qEafmiBGfiQMK7vpIS8E/kbfbJlIESatYmeFYd/wBSCC1XEmiuydvcDcnmSFbT5nEu
 KMpw==
X-Gm-Message-State: AOAM53396kx5h3MKQbw21CkVdySrjdXEQHn1j+Tjx1CtO+fZAxTpIOPe
 +A7lYC21pNSxKASMb3DwS5jK7zBVxp2vKA==
X-Google-Smtp-Source: ABdhPJyVImG7Il3Xclx9112Pno0PcFr5lLC8PO9pFWpO0eP/hRQnw7fh9W7lmjINoAxMTRPaknAagg==
X-Received: by 2002:a1c:4409:: with SMTP id r9mr4240521wma.150.1627557337195; 
 Thu, 29 Jul 2021 04:15:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 27/53] target/arm: Implement MVE saturating doubling
 multiply accumulates
Date: Thu, 29 Jul 2021 12:14:46 +0100
Message-Id: <20210729111512.16541-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Implement the MVE saturating doubling multiply accumulate insns
VQDMLAH, VQRDMLAH, VQDMLASH and VQRDMLASH.  These perform a multiply,
double, add the accumulator shifted by the element size, possibly
round, saturate to twice the element size, then take the high half of
the result.  The *MLAH insns do vector * scalar + vector, and the
*MLASH insns do vector * vector + scalar.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 16 +++++++
 target/arm/mve.decode      |  5 ++
 target/arm/mve_helper.c    | 95 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++
 4 files changed, 120 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 328e31e2665..2f54396b2df 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -375,6 +375,22 @@ DEF_HELPER_FLAGS_4(mve_vmlasb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlash, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vmlasw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmlahb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlahh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlahw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlahb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlahh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlahw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqdmlashb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlashh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmlashw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vqrdmlashb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlashh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqrdmlashw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cd9c806a11c..7a6de3991b6 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -416,6 +416,11 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
 VMLAS            111- 1110 0 . .. ... 1 ... 1 1110 . 100 .... @2scalar
 
+VQRDMLAH         1110 1110 0 . .. ... 0 ... 0 1110 . 100 .... @2scalar
+VQRDMLASH        1110 1110 0 . .. ... 0 ... 1 1110 . 100 .... @2scalar
+VQDMLAH          1110 1110 0 . .. ... 0 ... 0 1110 . 110 .... @2scalar
+VQDMLASH         1110 1110 0 . .. ... 0 ... 1 1110 . 110 .... @2scalar
+
 # Vector add across vector
 {
   VADDV          111 u:1 1110 1111 size:2 01 ... 0 1111 0 0 a:1 0 qm:3 0 rda=%rdalo
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8004b9bb728..a69fcd2243c 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -964,6 +964,28 @@ DO_VQDMLADH_OP(vqrdmlsdhxw, 4, int32_t, 1, 1, do_vqdmlsdh_w)
         mve_advance_vpt(env);                                           \
     }
 
+#define DO_2OP_SAT_ACC_SCALAR(OP, ESIZE, TYPE, FN)                      \
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
+            mergemask(&d[H##ESIZE(e)],                                  \
+                      FN(d[H##ESIZE(e)], n[H##ESIZE(e)], m, &sat),      \
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
@@ -1008,6 +1030,79 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, DO_QRDMULH_W)
 
+static int8_t do_vqdmlah_b(int8_t a, int8_t b, int8_t c, int round, bool *sat)
+{
+    int64_t r = (int64_t)a * b * 2 + ((int64_t)c << 8) + (round << 7);
+    return do_sat_bhw(r, INT16_MIN, INT16_MAX, sat) >> 8;
+}
+
+static int16_t do_vqdmlah_h(int16_t a, int16_t b, int16_t c,
+                           int round, bool *sat)
+{
+    int64_t r = (int64_t)a * b * 2 + ((int64_t)c << 16) + (round << 15);
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat) >> 16;
+}
+
+static int32_t do_vqdmlah_w(int32_t a, int32_t b, int32_t c,
+                            int round, bool *sat)
+{
+    /*
+     * Architecturally we should do the entire add, double, round
+     * and then check for saturation. We do three saturating adds,
+     * but we need to be careful about the order. If the first
+     * m1 + m2 saturates then it's impossible for the *2+rc to
+     * bring it back into the non-saturated range. However, if
+     * m1 + m2 is negative then it's possible that doing the doubling
+     * would take the intermediate result below INT64_MAX and the
+     * addition of the rounding constant then brings it back in range.
+     * So we add half the rounding constant and half the "c << esize"
+     * before doubling rather than adding the rounding constant after
+     * the doubling.
+     */
+    int64_t m1 = (int64_t)a * b;
+    int64_t m2 = (int64_t)c << 31;
+    int64_t r;
+    if (sadd64_overflow(m1, m2, &r) ||
+        sadd64_overflow(r, (round << 30), &r) ||
+        sadd64_overflow(r, r, &r)) {
+        *sat = true;
+        return r < 0 ? INT32_MAX : INT32_MIN;
+    }
+    return r >> 32;
+}
+
+/*
+ * The *MLAH insns are vector * scalar + vector;
+ * the *MLASH insns are vector * vector + scalar
+ */
+#define DO_VQDMLAH_B(D, N, M, S) do_vqdmlah_b(N, M, D, 0, S)
+#define DO_VQDMLAH_H(D, N, M, S) do_vqdmlah_h(N, M, D, 0, S)
+#define DO_VQDMLAH_W(D, N, M, S) do_vqdmlah_w(N, M, D, 0, S)
+#define DO_VQRDMLAH_B(D, N, M, S) do_vqdmlah_b(N, M, D, 1, S)
+#define DO_VQRDMLAH_H(D, N, M, S) do_vqdmlah_h(N, M, D, 1, S)
+#define DO_VQRDMLAH_W(D, N, M, S) do_vqdmlah_w(N, M, D, 1, S)
+
+#define DO_VQDMLASH_B(D, N, M, S) do_vqdmlah_b(N, D, M, 0, S)
+#define DO_VQDMLASH_H(D, N, M, S) do_vqdmlah_h(N, D, M, 0, S)
+#define DO_VQDMLASH_W(D, N, M, S) do_vqdmlah_w(N, D, M, 0, S)
+#define DO_VQRDMLASH_B(D, N, M, S) do_vqdmlah_b(N, D, M, 1, S)
+#define DO_VQRDMLASH_H(D, N, M, S) do_vqdmlah_h(N, D, M, 1, S)
+#define DO_VQRDMLASH_W(D, N, M, S) do_vqdmlah_w(N, D, M, 1, S)
+
+DO_2OP_SAT_ACC_SCALAR(vqdmlahb, 1, int8_t, DO_VQDMLAH_B)
+DO_2OP_SAT_ACC_SCALAR(vqdmlahh, 2, int16_t, DO_VQDMLAH_H)
+DO_2OP_SAT_ACC_SCALAR(vqdmlahw, 4, int32_t, DO_VQDMLAH_W)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahb, 1, int8_t, DO_VQRDMLAH_B)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahh, 2, int16_t, DO_VQRDMLAH_H)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlahw, 4, int32_t, DO_VQRDMLAH_W)
+
+DO_2OP_SAT_ACC_SCALAR(vqdmlashb, 1, int8_t, DO_VQDMLASH_B)
+DO_2OP_SAT_ACC_SCALAR(vqdmlashh, 2, int16_t, DO_VQDMLASH_H)
+DO_2OP_SAT_ACC_SCALAR(vqdmlashw, 4, int32_t, DO_VQDMLASH_W)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashb, 1, int8_t, DO_VQRDMLASH_B)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashh, 2, int16_t, DO_VQRDMLASH_H)
+DO_2OP_SAT_ACC_SCALAR(vqrdmlashw, 4, int32_t, DO_VQRDMLASH_W)
+
 /* Vector by scalar plus vector */
 #define DO_VMLA(D, N, M) ((N) * (M) + (D))
 
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index f8899af352d..e3e115c1aa9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -622,6 +622,10 @@ DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 DO_2OP_SCALAR(VMLA, vmla)
 DO_2OP_SCALAR(VMLAS, vmlas)
+DO_2OP_SCALAR(VQDMLAH, vqdmlah)
+DO_2OP_SCALAR(VQRDMLAH, vqrdmlah)
+DO_2OP_SCALAR(VQDMLASH, vqdmlash)
+DO_2OP_SCALAR(VQRDMLASH, vqrdmlash)
 
 static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
 {
-- 
2.20.1


