Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3113BA0E9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:07:36 +0200 (CEST)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzItL-00054C-4G
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImO-0007i7-2D
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm8-0007it-Tc
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:23 -0400
Received: by mail-wr1-x429.google.com with SMTP id t6so2468310wrm.9
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TkLNjqHmh4OQgqy9rgowquGjzgNXlQBe9+Q6yuMA1ak=;
 b=VApNvTmzFXBYBb1Fkipw0DDiA4mGIRir0zV1Xyk6SMwLWd4QAUwr9nzRRjMtgoiypA
 LH+Dxg92XYjP+yX0/irQoCQBsuKV0OWTdrtqiKshwrKJGpz7CMQDhfvEC/3OODWFV28J
 18M2yU2IspW1xH/NUATOgbQJ5pB6Pg3pheB1h9H+zfq7XqioYQKPhJwbc3WaUH6eMPE/
 WelpT5HffQvO+/pYIDBuWkSpo7cDetR1X26CC86gBy2St5mqcPP4V8qpPAq/+RfXpLD6
 JEjUqwjG+DFtaoLlCti02jkhUP5+SHDtK14EB7sUvBRqrKc3+WUIF2cbKSEdzicxDifY
 nWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TkLNjqHmh4OQgqy9rgowquGjzgNXlQBe9+Q6yuMA1ak=;
 b=L2DqYGQEA5svaP4Gz70anuZ1RiO7nr3LixszrjKCVPesoihY0Mrs0Y7h88oMNhgdbc
 tGMH25O9j8Q5VHy2mxZQ/MBuariD8ldFnvJVqLuakkwMXJ9lh04NXk1i8IiWJCjRtV3j
 +sA7Dw8gBcEAWfBxHd32WrkW/I3OFWfaOCCOFFG/G7tjAQsbIx0tOQyRzlT9H0lALzJQ
 kztCLt0fOgIYeR1ljhzWFVZE5gp++jD13848x1jVhE7QR558H9YKOgVGfL2mTISiJFj1
 B9tfGYOSrisx7gY/rMteHCm/aGw9kQH7oiaBB2ZDvxGKvdpFnx+ASSUn0frTcadtDJVA
 JqAA==
X-Gm-Message-State: AOAM533Kd091ZbXwmnsFn/GJhfjC8n+Tyjn03NZu1C7KI0QwzcL9n/d0
 BGSKtuheqf4KtRHfo0zVxMZr62jH16pyY0KA
X-Google-Smtp-Source: ABdhPJx2EJCccB56I+mYFh+TEzSHZFgtT2ghvtowuTf09TwvU7w4Hb3RBu8igy8Va5w+b9JiuKmxOA==
X-Received: by 2002:adf:f083:: with SMTP id n3mr5683478wro.197.1625230807611; 
 Fri, 02 Jul 2021 06:00:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/24] target/arm: Implement MVE VSRI, VSLI
Date: Fri,  2 Jul 2021 13:59:46 +0100
Message-Id: <20210702125954.13247-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
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

Implement the MVE VSRI and VSLI insns, which perform a
shift-and-insert operation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-11-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  8 ++++++++
 target/arm/mve.decode      |  9 ++++++++
 target/arm/mve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  3 +++
 4 files changed, 62 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 8af0e7fd8cf..e452d2ef7a0 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -396,3 +396,11 @@ DEF_HELPER_FLAGS_4(mve_vshlltsb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshlltsh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshlltub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vshlltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vsrib, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsrih, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsriw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vslib, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vslih, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vsliw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 6e6032b25a7..c3b5366617a 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -371,3 +371,12 @@ VSHLL_TS          111 0 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_h
 
 VSHLL_TU          111 1 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_b
 VSHLL_TU          111 1 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_h
+
+# Shift-and-insert
+VSRI              111 1 1111 1 . ... ... ... 0 0100 0 1 . 1 ... 0 @2_shr_b
+VSRI              111 1 1111 1 . ... ... ... 0 0100 0 1 . 1 ... 0 @2_shr_h
+VSRI              111 1 1111 1 . ... ... ... 0 0100 0 1 . 1 ... 0 @2_shr_w
+
+VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_b
+VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_h
+VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_w
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 8798e77cba8..24336d1d28a 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1251,6 +1251,48 @@ DO_2SHIFT_SAT_S(vqshlui_s, DO_SUQSHL_OP)
 DO_2SHIFT_U(vrshli_u, DO_VRSHLU)
 DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
 
+/* Shift-and-insert; we always work with 64 bits at a time */
+#define DO_2SHIFT_INSERT(OP, ESIZE, SHIFTFN, MASKFN)                    \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,             \
+                                void *vm, uint32_t shift)               \
+    {                                                                   \
+        uint64_t *d = vd, *m = vm;                                      \
+        uint16_t mask;                                                  \
+        uint64_t shiftmask;                                             \
+        unsigned e;                                                     \
+        if (shift == 0 || shift == ESIZE * 8) {                         \
+            /*                                                          \
+             * Only VSLI can shift by 0; only VSRI can shift by <dt>.   \
+             * The generic logic would give the right answer for 0 but  \
+             * fails for <dt>.                                          \
+             */                                                         \
+            goto done;                                                  \
+        }                                                               \
+        assert(shift < ESIZE * 8);                                      \
+        mask = mve_element_mask(env);                                   \
+        /* ESIZE / 2 gives the MO_* value if ESIZE is in [1,2,4] */     \
+        shiftmask = dup_const(ESIZE / 2, MASKFN(ESIZE * 8, shift));     \
+        for (e = 0; e < 16 / 8; e++, mask >>= 8) {                      \
+            uint64_t r = (SHIFTFN(m[H8(e)], shift) & shiftmask) |       \
+                (d[H8(e)] & ~shiftmask);                                \
+            mergemask(&d[H8(e)], r, mask);                              \
+        }                                                               \
+done:                                                                   \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_SHL(N, SHIFT) ((N) << (SHIFT))
+#define DO_SHR(N, SHIFT) ((N) >> (SHIFT))
+#define SHL_MASK(EBITS, SHIFT) MAKE_64BIT_MASK((SHIFT), (EBITS) - (SHIFT))
+#define SHR_MASK(EBITS, SHIFT) MAKE_64BIT_MASK(0, (EBITS) - (SHIFT))
+
+DO_2SHIFT_INSERT(vsrib, 1, DO_SHR, SHR_MASK)
+DO_2SHIFT_INSERT(vsrih, 2, DO_SHR, SHR_MASK)
+DO_2SHIFT_INSERT(vsriw, 4, DO_SHR, SHR_MASK)
+DO_2SHIFT_INSERT(vslib, 1, DO_SHL, SHL_MASK)
+DO_2SHIFT_INSERT(vslih, 2, DO_SHL, SHL_MASK)
+DO_2SHIFT_INSERT(vsliw, 4, DO_SHL, SHL_MASK)
+
 /*
  * Long shifts taking half-sized inputs from top or bottom of the input
  * vector and producing a double-width result. ESIZE, TYPE are for
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 044462c3752..b031f84966e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -894,6 +894,9 @@ DO_2SHIFT(VSHRI_U, vshli_u, true)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
+DO_2SHIFT(VSRI, vsri, false)
+DO_2SHIFT(VSLI, vsli, false)
+
 #define DO_VSHLL(INSN, FN)                                      \
     static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
     {                                                           \
-- 
2.20.1


