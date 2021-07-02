Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A803BA105
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:14:03 +0200 (CEST)
Received: from localhost ([::1]:58430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIza-0004ah-4B
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImR-0007jY-GA
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImA-0007j2-3v
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so12341315wrs.12
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6MXveRwL6xXTt5MJQ2F5l8Ovwla1Ir5PV2BDPfVvcBQ=;
 b=GyIFsByw1QG4zFfR5CEUk7qVxEnmrhClzrkWUvBDx+ySlfCfIfDHGM2GwlkrQGI3MT
 LZxh6EnI1M44OXShYlPIzaf60umbdu2EgBWzwvE0u16ng52V9QigcDRdmpQ78yZKzvfu
 e5OGS6SsbRmVvUj7w5C0zY0Y7ipzSdIVk8GZQEXHQwLUxlEtbSbq34mWVX6eDwlYkrUG
 6rPLTOBfVOwRJ+lTOI8HxcNJ3EQ1Pe8ULixhdkY2rSHly3JJS4LgbsggCEnWFji3wjqh
 eUOzJ9D4nPVVbaHv+Wc3G/n12JB/LvIkki0400zSJ26fuPuQyXXpDGW1jJZiUL81evfd
 fWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6MXveRwL6xXTt5MJQ2F5l8Ovwla1Ir5PV2BDPfVvcBQ=;
 b=EuLNK8avTDEFGEuMo7YT8xAk3XzWb8q/5y2y7hgyxYIYboGwBsS16/5CamBg8xqJZ4
 z9uk7/HzzNuQ4QZy0ai/E9wPJg8IhXP8TZtwp0sjjqTYjI1sqV4pevVknxHqGrO1Tkbd
 GTcAl7x6Iag2Jltnt9LJvYLyWNjuJIw3Nu9vi8Fl5cM+Ep4/AI9Kfz55k0i8/SwIIXqm
 CL55yMdsmHuy9LXNR5E/fMjHWGNVETv+DyLQqXJazO6hAyBJhyGzc52BhEIHvZ5vyzYz
 TaGih38bhBmR6kmto+5EG7NaYBgtAonWej6bkzqyp8TeAca/bWHd+Zd+ouLMaMoAaEVl
 i6sQ==
X-Gm-Message-State: AOAM531ZttaqFb61Q2K7DswlWXsu6yDvhUN0ym3qM7bPHxcZA7xCXkyK
 HqhjLiw8Ap0w7m7S+w12AO1VRB0+jmEtbpDm
X-Google-Smtp-Source: ABdhPJxFH8TUrUYpr/5Qjc5w1T/7D3LYc8wLGuMAfBKfjfrd6NwViu1++026XqbAjJ6woD7PXGhyzQ==
X-Received: by 2002:a5d:6d81:: with SMTP id l1mr5654099wrs.282.1625230808285; 
 Fri, 02 Jul 2021 06:00:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] target/arm: Implement MVE VSHRN, VRSHRN
Date: Fri,  2 Jul 2021 13:59:47 +0100
Message-Id: <20210702125954.13247-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
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

Implement the MVE shift-right-and-narrow insn VSHRN and VRSHRN.

do_urshr() is borrowed from sve_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-12-peter.maydell@linaro.org
---
 target/arm/helper-mve.h    | 10 ++++++++++
 target/arm/mve.decode      | 11 +++++++++++
 target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 15 ++++++++++++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e452d2ef7a0..323ac07fa35 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -404,3 +404,13 @@ DEF_HELPER_FLAGS_4(mve_vsriw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vslib, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vslih, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vsliw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrshrnbb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrnbh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrntb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrshrnth, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index c3b5366617a..e2c177f56a2 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -380,3 +380,14 @@ VSRI              111 1 1111 1 . ... ... ... 0 0100 0 1 . 1 ... 0 @2_shr_w
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_b
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_h
 VSLI              111 1 1111 1 . ... ... ... 0 0101 0 1 . 1 ... 0 @2_shl_w
+
+# Narrowing shifts (which only support b and h sizes)
+VSHRNB            111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
+VSHRNB            111 0 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
+VSHRNT            111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
+VSHRNT            111 0 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
+
+VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_b
+VRSHRNB           111 1 1110 1 . ... ... ... 0 1111 1 1 . 0 ... 1 @2_shr_h
+VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_b
+VRSHRNT           111 1 1110 1 . ... ... ... 1 1111 1 1 . 0 ... 1 @2_shr_h
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 24336d1d28a..a97942208ba 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1324,3 +1324,43 @@ DO_2SHIFT_INSERT(vsliw, 4, DO_SHL, SHL_MASK)
 
 DO_VSHLL_ALL(vshllb, false)
 DO_VSHLL_ALL(vshllt, true)
+
+/*
+ * Narrowing right shifts, taking a double sized input, shifting it
+ * and putting the result in either the top or bottom half of the output.
+ * ESIZE, TYPE are the output, and LESIZE, LTYPE the input.
+ */
+#define DO_VSHRN(OP, TOP, ESIZE, TYPE, LESIZE, LTYPE, FN)       \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd,     \
+                                void *vm, uint32_t shift)       \
+    {                                                           \
+        LTYPE *m = vm;                                          \
+        TYPE *d = vd;                                           \
+        uint16_t mask = mve_element_mask(env);                  \
+        unsigned le;                                            \
+        for (le = 0; le < 16 / LESIZE; le++, mask >>= LESIZE) { \
+            TYPE r = FN(m[H##LESIZE(le)], shift);               \
+            mergemask(&d[H##ESIZE(le * 2 + TOP)], r, mask);     \
+        }                                                       \
+        mve_advance_vpt(env);                                   \
+    }
+
+#define DO_VSHRN_ALL(OP, FN)                                    \
+    DO_VSHRN(OP##bb, false, 1, uint8_t, 2, uint16_t, FN)        \
+    DO_VSHRN(OP##bh, false, 2, uint16_t, 4, uint32_t, FN)       \
+    DO_VSHRN(OP##tb, true, 1, uint8_t, 2, uint16_t, FN)         \
+    DO_VSHRN(OP##th, true, 2, uint16_t, 4, uint32_t, FN)
+
+static inline uint64_t do_urshr(uint64_t x, unsigned sh)
+{
+    if (likely(sh < 64)) {
+        return (x >> sh) + ((x >> (sh - 1)) & 1);
+    } else if (sh == 64) {
+        return x >> 63;
+    } else {
+        return 0;
+    }
+}
+
+DO_VSHRN_ALL(vshrn, DO_SHR)
+DO_VSHRN_ALL(vrshrn, do_urshr)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index b031f84966e..f1a8f21b772 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -911,3 +911,18 @@ DO_VSHLL(VSHLL_BS, vshllbs)
 DO_VSHLL(VSHLL_BU, vshllbu)
 DO_VSHLL(VSHLL_TS, vshllts)
 DO_VSHLL(VSHLL_TU, vshlltu)
+
+#define DO_2SHIFT_N(INSN, FN)                                   \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
+    {                                                           \
+        static MVEGenTwoOpShiftFn * const fns[] = {             \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+        };                                                      \
+        return do_2shift(s, a, fns[a->size], false);            \
+    }
+
+DO_2SHIFT_N(VSHRNB, vshrnb)
+DO_2SHIFT_N(VSHRNT, vshrnt)
+DO_2SHIFT_N(VRSHRNB, vrshrnb)
+DO_2SHIFT_N(VRSHRNT, vrshrnt)
-- 
2.20.1


