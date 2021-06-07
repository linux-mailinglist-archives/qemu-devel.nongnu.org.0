Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C9D39E59D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 19:38:16 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqJCZ-0006Cn-2s
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 13:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIb0-0007pp-2p
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:26 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaW-000846-Vi
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id f17so106688wmf.2
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=anbdlQ0MeG9A8VNndTUQIgTacTr2CcYrD7NBwwj0pVc=;
 b=F6kk+G8nCkPGnZWPcvhrtySV8it7V5gdd1EnpmqfJIH8dVWWOYXSLdjcJg/ljhYoXW
 eNuaJoY29WM7HbulJccPd6WpAkJg5oJLavkYcr8AT/xkXiRIEMHe0ruYAkTU3xoUFtR+
 cUntiSb4tIYjwkbn6UvouBuSO4AKc1c7H4UBA0U0vmtGRzRCGx8jpLRM5Qx9GfJghchY
 cZRXHRVPY2wbfi5f3GzRTVwUFWOO2Vk2NldCxpD7XgsBbc6uwB2G6Du2ygW56x8o1rGw
 t/TVrgcyVMQ66SHeT85ZNfDjip85GJJ4ynK4sdTbPae+IliQARM/b5Vzk95hRBS++bFf
 V5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=anbdlQ0MeG9A8VNndTUQIgTacTr2CcYrD7NBwwj0pVc=;
 b=Z0gL7BNpJ/P/pbva0/HOaO2kM1AhejORGqBG1QQB8IMmVVls4Hn0FlK4QmO1xfnZB/
 vnH+eArTVSn3wHeBLS2bCg4hqo8huELsaZJ0LPCzqGk85o43MojcPx1Q/7CH5eM9OxQl
 7m52X3VA7AgxSXfugbstT4vQKGQHXnsErgLGT2Yo4FCwI8GIJ30x7u3MVAnpFHZ+xXf1
 pqBjqxsT2loJ5crK5xtNpCqD8ZSw7Ut+vN/smdRdaBCWIRxYUsROdONyH+n1Q8idsojn
 ePeh2ayJwufbZsH7W1CKS+mk8we+mnlxUeYSMNptHh9pLH3ySKu12dxvJJHwJ8GOCRBz
 hbvA==
X-Gm-Message-State: AOAM533bX4YyfPdPrzrDdiitUFV1O7IBaQnkrEPZBQ7o6QEMpy/fysSa
 KnrzqvXc8ZxrXYWS+O+EewiPMgIw3/fp6ZFS
X-Google-Smtp-Source: ABdhPJw4jZ4yvkFgWcmhfJ59nxJClVSMFS3tyYOKMAIt2s16ePTCudiThcnLzMXvEEg0VQH4pmMTyg==
X-Received: by 2002:a7b:c2e8:: with SMTP id e8mr13194594wmk.41.1623085135212; 
 Mon, 07 Jun 2021 09:58:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 40/55] target/arm: Implement MVE VQDMULL scalar
Date: Mon,  7 Jun 2021 17:58:06 +0100
Message-Id: <20210607165821.9892-41-peter.maydell@linaro.org>
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

Implement the MVE VQDMULL scalar insn. This multiplies the top or
bottom half of each element by the scalar, doubles and saturates
to a double-width result.

Note that this encoding overlaps with VQADD and VQSUB; it uses
what in VQADD and VQSUB would be the 'size=0b11' encoding.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++
 target/arm/mve.decode      | 23 +++++++++++---
 target/arm/mve_helper.c    | 65 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 30 ++++++++++++++++++
 4 files changed, 119 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 9bab04305a7..55c4e41deff 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -203,6 +203,11 @@ DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullb_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vqdmullt_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 47ce6ebb83b..a71ad7252bf 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -23,6 +23,9 @@
 %qm 5:1 1:3
 %qn 7:1 17:3
 
+# VQDMULL has size in bit 28: 0 for 16 bit, 1 for 32 bit
+%size_28 28:1 !function=plus_1
+
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
@@ -38,6 +41,7 @@
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
 @2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+@2scalar_nosz .... .... .... .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
 
 # Vector loads and stores
 
@@ -168,15 +172,26 @@ VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 
-VQADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
-VQSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
-VQSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+{
+  VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
+  VQDMULLB_scalar 111 . 1110 0 . 11 ... 0 ... 0 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
+{
+  VQSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 110 .... @2scalar
+  VQDMULLT_scalar 111 . 1110 0 . 11 ... 0 ... 1 1111 . 110 .... @2scalar_nosz \
+                  size=%size_28
+}
+
 VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 
 VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
 
+
 # Predicate operations
 %mask_22_13      22:1 13:3
 VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 6e2da6ac8bc..97529531ed0 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -600,6 +600,71 @@ DO_2OP_SAT_SCALAR(vqrdmulh_scalarb, 1, int8_t, H1, DO_QRDMULH_B)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarh, 2, int16_t, H2, DO_QRDMULH_H)
 DO_2OP_SAT_SCALAR(vqrdmulh_scalarw, 4, int32_t, H4, DO_QRDMULH_W)
 
+/*
+ * Long saturating scalar ops. As with DO_2OP_L, TYPE and H are for the
+ * input (smaller) type and LESIZE, LTYPE, LH for the output (long) type.
+ * SATMASK specifies which bits of the predicate mask matter for determining
+ * whether to propagate a saturation indication into FPSCR.QC -- for
+ * the 16x16->32 case we must check only the bit corresponding to the T or B
+ * half that we used, but for the 32x32->64 case we propagate if the mask
+ * bit is set for either half.
+ */
+#define DO_2OP_SAT_SCALAR_L(OP, TOP, TYPE, H, LESIZE, LTYPE, LH, FN, SATMASK) \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *n = vn;                                                   \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            bool sat = false;                                           \
+            LTYPE r = FN((LTYPE)n[H(le * 2 + TOP)], m, &sat);           \
+            uint64_t bytemask = mask_to_bytemask##LESIZE(mask);         \
+            d[LH(le)] &= ~bytemask;                                     \
+            d[LH(le)] |= (r & bytemask);                                \
+            if (sat && (mask & SATMASK)) {                              \
+                env->vfp.qc[0] = 1;                                     \
+            }                                                           \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+static inline int32_t do_qdmullh(int16_t n, int16_t m, bool *sat)
+{
+    int64_t r = ((int64_t)n * m) * 2;
+    return do_sat_bhw(r, INT32_MIN, INT32_MAX, sat);
+}
+
+static inline int64_t do_qdmullw(int32_t n, int32_t m, bool *sat)
+{
+    /* The multiply can't overflow, but the doubling might */
+    int64_t r = (int64_t)n * m;
+    if (r > INT64_MAX / 2) {
+        *sat = true;
+        return INT64_MAX;
+    } else if (r < INT64_MIN / 2) {
+        *sat = true;
+        return INT64_MIN;
+    } else {
+        return r * 2;
+    }
+}
+
+#define SATMASK16B 1
+#define SATMASK16T (1 << 2)
+#define SATMASK32 ((1 << 4) | 1)
+
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarh, 0, int16_t, H2, 4, int32_t, H4, \
+                    do_qdmullh, SATMASK16B)
+DO_2OP_SAT_SCALAR_L(vqdmullb_scalarw, 0, int32_t, H4, 8, int64_t, , \
+                    do_qdmullw, SATMASK32)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarh, 1, int16_t, H2, 4, int32_t, H4, \
+                    do_qdmullh, SATMASK16T)
+DO_2OP_SAT_SCALAR_L(vqdmullt_scalarw, 1, int32_t, H4, 8, int64_t, , \
+                    do_qdmullw, SATMASK32)
+
 static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
 {
     m &= 0xff;
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4d08067c1e2..2bb7482e6af 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -477,6 +477,36 @@ DO_2OP_SCALAR(VQDMULH_scalar, vqdmulh_scalar)
 DO_2OP_SCALAR(VQRDMULH_scalar, vqrdmulh_scalar)
 DO_2OP_SCALAR(VBRSR, vbrsr)
 
+static bool trans_VQDMULLB_scalar(DisasContext *s, arg_2scalar *a)
+{
+    MVEGenTwoOpScalarFn *fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullb_scalarh,
+        gen_helper_mve_vqdmullb_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
+static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
+{
+    MVEGenTwoOpScalarFn *fns[] = {
+        NULL,
+        gen_helper_mve_vqdmullt_scalarh,
+        gen_helper_mve_vqdmullt_scalarw,
+        NULL,
+    };
+    if (a->qd == a->qn && a->size == MO_32) {
+        /* UNPREDICTABLE; we choose to undef */
+        return false;
+    }
+    return do_2op_scalar(s, a, fns[a->size]);
+}
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1


