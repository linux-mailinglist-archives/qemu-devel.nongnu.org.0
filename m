Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E52F3BA0F2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:09:32 +0200 (CEST)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIvD-0002P1-A8
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImM-0007i2-VP
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:24 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm8-0007il-Av
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id t6so2468265wrm.9
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zuqZnTwJY+gKqeF5sUVUmvQv+1ND/8BqzYe79x0iRb8=;
 b=t7GSWqW+Qjpg5kB1uiuX1ppOXQn7USEZYBSqF5W99a+ZW+fsctN/Bu1E3OH6JNbFjS
 JAlu4h2arfldFO4yVGRsfNksht9SKB5O9SRNczKW7re39ChhW4X5Y713v0wko15tbaUf
 aKorSjF+rD3AjUsUQjL4B1aZh8yT2ofxAcexvMhp1p+DfZXKkiHGucmVF9WYo7XkO+9k
 zvS9h4npLzb3ARXiQZAoUzbHmW9dK4nFaqx2dV+7KtFP0fybOJ984iO22i5hG59NvHbi
 1knSqD4jdYgDhttxGbAIv5PBuzh5V8qJ90REcXD9abVRIgP2ayQg3VX7rjmE58ej90II
 vncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zuqZnTwJY+gKqeF5sUVUmvQv+1ND/8BqzYe79x0iRb8=;
 b=buz3Txix4ZpTOMmTgGrVwF5e0fo+wIiIGMCCwwCNXAxi0Q3Sabae9duFGjcLwTrNCj
 XvyUaRfhopQTU0hDXqNW0hdT2fFUUSAbes6/dE8zj3RRIw9GaXSWe9zfmUkqtK+WPcPj
 3YC51p+EaVStwgtOSbwbDpUQoamF1d9Z3o9l4sKU9zdUx2nuZsRMzUZsspTRGtvCKHGB
 ZTx/bdXklOzmbcBbh7OMXibOgEpx6lU7X+1RoLK91Z4GcYgAYqwdjXpKVhcJFjkzbDJ4
 RcTVKhv7VpPhvidYlOyhdqpcd/vTmt51MFrIj1VXk9hf4lqVWSabxSMtEpKFO2WcYEFM
 2lRQ==
X-Gm-Message-State: AOAM53238PXyb5sBTFLnY2N8NWYTxBfkzdUgBNF0BVLnslLgtw7V7Oyn
 8gPhompP/ONdS6RYVJjPxcoiBdgXpJHeo3kO
X-Google-Smtp-Source: ABdhPJxyEaZBmloQw3s2LxnAdkMEj9nJwk3bPu40chgeqW8vPk8PwNLEXqTnNnJeKGZWPWflAOR8aA==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr5642566wrg.167.1625230806951; 
 Fri, 02 Jul 2021 06:00:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/24] target/arm: Implement MVE VSHLL
Date: Fri,  2 Jul 2021 13:59:45 +0100
Message-Id: <20210702125954.13247-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Implement the MVE VHLL (vector shift left long) insn.  This has two
encodings: the T1 encoding is the usual shift-by-immediate format,
and the T2 encoding is a special case where the shift count is always
equal to the element size.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-10-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    |  9 +++++++
 target/arm/mve.decode      | 53 +++++++++++++++++++++++++++++++++++---
 target/arm/mve_helper.c    | 32 +++++++++++++++++++++++
 target/arm/translate-mve.c | 15 +++++++++++
 4 files changed, 105 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 288a8faf4e8..8af0e7fd8cf 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -387,3 +387,12 @@ DEF_HELPER_FLAGS_4(mve_vrshli_sw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshli_ub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshli_uh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vrshli_uw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vshllbsb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshllbsh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshllbub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshllbuh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshlltsb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshlltsh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshlltub, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshlltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 8be04589a6c..6e6032b25a7 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -64,6 +64,14 @@
 @2_shl_h .... .... .. 01  shift:4 .... .... .... .... &2shift qd=%qd qm=%qm size=1
 @2_shl_w .... .... .. 1   shift:5 .... .... .... .... &2shift qd=%qd qm=%qm size=2
 
+@2_shll_b .... .... ... 01 shift:3 .... .... .... .... &2shift qd=%qd qm=%qm size=0
+@2_shll_h .... .... ... 1  shift:4 .... .... .... .... &2shift qd=%qd qm=%qm size=1
+# VSHLL encoding T2 where shift == esize
+@2_shll_esize_b .... .... .... 00 .. .... .... .... .... &2shift \
+                qd=%qd qm=%qm size=0 shift=8
+@2_shll_esize_h .... .... .... 01 .. .... .... .... .... &2shift \
+                qd=%qd qm=%qm size=1 shift=16
+
 # Right shifts are encoded as N - shift, where N is the element size in bits.
 %rshift_i5  16:5 !function=rsub_32
 %rshift_i4  16:4 !function=rsub_16
@@ -122,11 +130,35 @@ VADD             1110 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VSUB             1111 1111 0 . .. ... 0 ... 0 1000 . 1 . 0 ... 0 @2op
 VMUL             1110 1111 0 . .. ... 0 ... 0 1001 . 1 . 1 ... 0 @2op
 
-VMULH_S          111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
-VMULH_U          111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+# The VSHLL T2 encoding is not a @2op pattern, but is here because it
+# overlaps what would be size=0b11 VMULH/VRMULH
+{
+  VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
+  VSHLL_BS       111 0 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
 
-VRMULH_S         111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
-VRMULH_U         111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+  VMULH_S        111 0 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+}
+
+{
+  VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_b
+  VSHLL_BU       111 1 1110 0 . 11 .. 01 ... 0 1110 0 0 . 0 ... 1 @2_shll_esize_h
+
+  VMULH_U        111 1 1110 0 . .. ...1 ... 0 1110 . 0 . 0 ... 1 @2op
+}
+
+{
+  VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
+  VSHLL_TS       111 0 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
+
+  VRMULH_S       111 0 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+}
+
+{
+  VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_b
+  VSHLL_TU       111 1 1110 0 . 11 .. 01 ... 1 1110 0 0 . 0 ... 1 @2_shll_esize_h
+
+  VRMULH_U       111 1 1110 0 . .. ...1 ... 1 1110 . 0 . 0 ... 1 @2op
+}
 
 VMAX_S           111 0 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
 VMAX_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 0 ... 0 @2op
@@ -326,3 +358,16 @@ VRSHRI_S          111 0 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_b
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
+
+# VSHLL T1 encoding; the T2 VSHLL encoding is elsewhere in this file
+VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_b
+VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_h
+
+VSHLL_BU          111 1 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_b
+VSHLL_BU          111 1 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_h
+
+VSHLL_TS          111 0 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_b
+VSHLL_TS          111 0 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_h
+
+VSHLL_TU          111 1 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_b
+VSHLL_TU          111 1 1110 1 . 1 .. ... ... 1 1111 0 1 . 0 ... 0 @2_shll_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index ac720c9ee05..8798e77cba8 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1250,3 +1250,35 @@ DO_2SHIFT_SAT_S(vqshli_s, DO_SQSHL_OP)
 DO_2SHIFT_SAT_S(vqshlui_s, DO_SUQSHL_OP)
 DO_2SHIFT_U(vrshli_u, DO_VRSHLU)
 DO_2SHIFT_S(vrshli_s, DO_VRSHLS)
+
+/*
+ * Long shifts taking half-sized inputs from top or bottom of the input
+ * vector and producing a double-width result. ESIZE, TYPE are for
+ * the input, and LESIZE, LTYPE for the output.
+ * Unlike the normal shift helpers, we do not handle negative shift counts,
+ * because the long shift is strictly left-only.
+ */
+#define DO_VSHLL(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE)                   \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,             \
+                                void *vm, uint32_t shift)               \
+    {                                                                   \
+        LTYPE *d = vd;                                                  \
+        TYPE *m = vm;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned le;                                                    \
+        assert(shift <= 16);                                            \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) {         \
+            LTYPE r = (LTYPE)m[H##ESIZE(le * 2 + TOP)] << shift;        \
+            mergemask(&d[H##LESIZE(le)], r, mask);                      \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_VSHLL_ALL(OP, TOP)                                \
+    DO_VSHLL(OP##sb, TOP, 1, int8_t, 2, int16_t)             \
+    DO_VSHLL(OP##ub, TOP, 1, uint8_t, 2, uint16_t)           \
+    DO_VSHLL(OP##sh, TOP, 2, int16_t, 4, int32_t)            \
+    DO_VSHLL(OP##uh, TOP, 2, uint16_t, 4, uint32_t)          \
+
+DO_VSHLL_ALL(vshllb, false)
+DO_VSHLL_ALL(vshllt, true)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4030ee07f0d..044462c3752 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -893,3 +893,18 @@ DO_2SHIFT(VSHRI_S, vshli_s, true)
 DO_2SHIFT(VSHRI_U, vshli_u, true)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
+
+#define DO_VSHLL(INSN, FN)                                      \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
+    {                                                           \
+        static MVEGenTwoOpShiftFn * const fns[] = {             \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+        };                                                      \
+        return do_2shift(s, a, fns[a->size], false);            \
+    }
+
+DO_VSHLL(VSHLL_BS, vshllbs)
+DO_VSHLL(VSHLL_BU, vshllbu)
+DO_VSHLL(VSHLL_TS, vshllts)
+DO_VSHLL(VSHLL_TU, vshlltu)
-- 
2.20.1


