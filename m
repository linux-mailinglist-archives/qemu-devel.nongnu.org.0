Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B003DA202
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:21:58 +0200 (CEST)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m946v-0003jC-DJ
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:21:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940q-0000XK-2d
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:41 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940b-00014t-R1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:39 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so6433887wrx.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r9xp+d/e9bbwwMEOsVgj3Bb2KxRODXZsL3alV4Ml4i0=;
 b=B+TWFPf/sXmFFYbk8j2XEZ6ppHEBfZECucTLz8puc6LwMFlZQF1Er94LzjWpXetyP5
 66zt4dC8xCD7rb2OGxPrZ1QeC3+1phDJMrBv+ylh7wdDVkP1p+e9eCO18CsQnGhTno+w
 uZZ7wGlQHuUbQHss7av/ERZS/dShbAI7TTL3p5ga4ybFQGFbN0LXIC1eKIkO7hAlowai
 QK/tqOtbFiAyqk+Y6sulmDnSA7tto6Fdkpw1/Cz7XPzDdSnfK+CSOxjYpzSYf/CAZvbE
 Zx5hvMwESid1gxuHQqm3KXBftVHUT9SHHwB3zYhI1TtFUzwjbzPzylpd7gRf0s2oX16W
 S8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r9xp+d/e9bbwwMEOsVgj3Bb2KxRODXZsL3alV4Ml4i0=;
 b=nI+Kjf82DlechWgVlEVX9oK9pqlU5BW52f57h5+ukk0fYFjQtqlxKlCv4WejtrCWl6
 j2aZZXfUe/gKwer/oiIwFiKAz/WB9YfKutSHv60cTXEaR8D98QPc41fVC0IgDLoBTrNR
 0icrMYx6gmHhO6hMrflT3SJekpPbs27hhOoD207T1Qz3LCzo13cm+zoabQql7JgeE9AG
 Cqx3eZU88ZHOqRG+ZEmQ+J4GUgFPNvAwZeXyAFcVoomGRpMVSHYiXNYFKfHsTpE2oBnC
 xls4dkpQ1lk5P/JixTe6ToDyZvABsrezEqMqxBWQnSuPcWF5CPt7+kcsE3wI9WcLczdI
 w2fA==
X-Gm-Message-State: AOAM531cMk98o45pl3CcgZEyf74NJwWKigo9V+bC7gWogYL1VWrlqzTN
 5VjAhgRnzCWNzlKeVx/YRQ1uTtgo6zVtKA==
X-Google-Smtp-Source: ABdhPJw5uzAvFCuXxLAqmFtfRkqwzCbSRj94oOmX0WJGI2IBxi28Y6ENyxrhwzgQh4vnwslRnDdPXg==
X-Received: by 2002:adf:82e6:: with SMTP id 93mr4204432wrc.47.1627557324476;
 Thu, 29 Jul 2021 04:15:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 12/53] target/arm: Implement MVE VMULL (polynomial)
Date: Thu, 29 Jul 2021 12:14:31 +0100
Message-Id: <20210729111512.16541-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

Implement the MVE VMULL (polynomial) insn.  Unlike Neon, this comes
in two flavours: 8x8->16 and a 16x16->32.  Also unlike Neon, the
inputs are in either the low or the high half of each double-width
element.

The assembler for this insn indicates the size with "P8" or "P16",
encoded into bit 28 as size = 0 or 1. We choose to follow the
same encoding as VQDMULL and decode this into a->size as MO_16
or MO_32 indicating the size of the result elements. This then
carries through to the helper function names where it then
matches up with the existing pmull_h() which does an 8x8->16
operation and a new pmull_w() which does the 16x16->32.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  5 +++++
 target/arm/vec_internal.h  | 11 +++++++++++
 target/arm/mve.decode      | 14 ++++++++++----
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c | 28 ++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 14 +++++++++++++-
 6 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 56e40844ad9..84adfb21517 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,11 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vmullpbh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullpth, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullpbw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmullptw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vqdmulhb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulhh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqdmulhw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 865d2139447..2a335582906 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -206,4 +206,15 @@ int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
 int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
 int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 
+/*
+ * 8 x 8 -> 16 vector polynomial multiply where the inputs are
+ * in the low 8 bits of each 16-bit element
+*/
+uint64_t pmull_h(uint64_t op1, uint64_t op2);
+/*
+ * 16 x 16 -> 32 vector polynomial multiply where the inputs are
+ * in the low 16 bits of each 32-bit element
+ */
+uint64_t pmull_w(uint64_t op1, uint64_t op2);
+
 #endif /* TARGET_ARM_VEC_INTERNALS_H */
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index fa9d921f933..de079ec517d 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -173,10 +173,16 @@ VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
 VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
 
-VMULL_BS         111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
-VMULL_BU         111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
-VMULL_TS         111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
-VMULL_TU         111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+{
+  VMULLP_B       111 . 1110 0 . 11 ... 1 ... 0 1110 . 0 . 0 ... 0 @2op_sz28
+  VMULL_BS       111 0 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+  VMULL_BU       111 1 1110 0 . .. ... 1 ... 0 1110 . 0 . 0 ... 0 @2op
+}
+{
+  VMULLP_T       111 . 1110 0 . 11 ... 1 ... 1 1110 . 0 . 0 ... 0 @2op_sz28
+  VMULL_TS       111 0 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+  VMULL_TU       111 1 1110 0 . .. ... 1 ... 1 1110 . 0 . 0 ... 0 @2op
+}
 
 VQDMULH          1110 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
 VQRDMULH         1111 1111 0 . .. ... 0 ... 0 1011 . 1 . 0 ... 0 @2op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index be8b9545317..91fb346d7e5 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -481,6 +481,22 @@ DO_2OP_L(vmulltub, 1, 1, uint8_t, 2, uint16_t, DO_MUL)
 DO_2OP_L(vmulltuh, 1, 2, uint16_t, 4, uint32_t, DO_MUL)
 DO_2OP_L(vmulltuw, 1, 4, uint32_t, 8, uint64_t, DO_MUL)
 
+/*
+ * Polynomial multiply. We can always do this generating 64 bits
+ * of the result at a time, so we don't need to use DO_2OP_L.
+ */
+#define VMULLPH_MASK 0x00ff00ff00ff00ffULL
+#define VMULLPW_MASK 0x0000ffff0000ffffULL
+#define DO_VMULLPBH(N, M) pmull_h((N) & VMULLPH_MASK, (M) & VMULLPH_MASK)
+#define DO_VMULLPTH(N, M) DO_VMULLPBH((N) >> 8, (M) >> 8)
+#define DO_VMULLPBW(N, M) pmull_w((N) & VMULLPW_MASK, (M) & VMULLPW_MASK)
+#define DO_VMULLPTW(N, M) DO_VMULLPBW((N) >> 16, (M) >> 16)
+
+DO_2OP(vmullpbh, 8, uint64_t, DO_VMULLPBH)
+DO_2OP(vmullpth, 8, uint64_t, DO_VMULLPTH)
+DO_2OP(vmullpbw, 8, uint64_t, DO_VMULLPBW)
+DO_2OP(vmullptw, 8, uint64_t, DO_VMULLPTW)
+
 /*
  * Because the computation type is at least twice as large as required,
  * these work for both signed and unsigned source types.
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a2a45036a0b..d318f34b2bc 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -464,6 +464,34 @@ static bool trans_VQDMULLT(DisasContext *s, arg_2op *a)
     return do_2op(s, a, fns[a->size]);
 }
 
+static bool trans_VMULLP_B(DisasContext *s, arg_2op *a)
+{
+    /*
+     * Note that a->size indicates the output size, ie VMULL.P8
+     * is the 8x8->16 operation and a->size is MO_16; VMULL.P16
+     * is the 16x16->32 operation and a->size is MO_32.
+     */
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vmullpbh,
+        gen_helper_mve_vmullpbw,
+        NULL,
+    };
+    return do_2op(s, a, fns[a->size]);
+}
+
+static bool trans_VMULLP_T(DisasContext *s, arg_2op *a)
+{
+    /* a->size is as for trans_VMULLP_B */
+    static MVEGenTwoOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vmullpth,
+        gen_helper_mve_vmullptw,
+        NULL,
+    };
+    return do_2op(s, a, fns[a->size]);
+}
+
 /*
  * VADC and VSBC: these perform an add-with-carry or subtract-with-carry
  * of the 32-bit elements in each lane of the input vectors, where the
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 034f6b84f78..17fb1583622 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2028,11 +2028,23 @@ static uint64_t expand_byte_to_half(uint64_t x)
          | ((x & 0xff000000) << 24);
 }
 
-static uint64_t pmull_h(uint64_t op1, uint64_t op2)
+uint64_t pmull_w(uint64_t op1, uint64_t op2)
 {
     uint64_t result = 0;
     int i;
+    for (i = 0; i < 16; ++i) {
+        uint64_t mask = (op1 & 0x0000000100000001ull) * 0xffffffff;
+        result ^= op2 & mask;
+        op1 >>= 1;
+        op2 <<= 1;
+    }
+    return result;
+}
 
+uint64_t pmull_h(uint64_t op1, uint64_t op2)
+{
+    uint64_t result = 0;
+    int i;
     for (i = 0; i < 8; ++i) {
         uint64_t mask = (op1 & 0x0001000100010001ull) * 0xffff;
         result ^= op2 & mask;
-- 
2.20.1


