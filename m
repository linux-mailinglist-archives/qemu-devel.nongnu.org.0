Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903668AB3B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:35:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLTy-00054M-KA; Sat, 04 Feb 2023 11:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTp-00051j-UV
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTn-0002Wm-5x
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:32 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 f15-20020a17090ac28f00b00230a32f0c9eso93584pjt.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LLPIf7qXwEodLjL1V+df+mpIrgJgFYuNvN+PgAflmco=;
 b=qLnU6Ty9IGw7gdwCdJAQdzsXX/mtmF05TO1BGq4wxkUap815IxtGz1s14hfUzP+c8U
 ADvQrHaQHMrotPGoCwsqR5bmQXA2rj9dAJpHw2qdi9BLO24YMDU+49X6ZOyk2wqMzW/U
 rm5S6iaFL9knKqPEnUo9gLREBsiWAeATti8UGblt3MfK2JigswgxOOODpQoyBCYrDTvo
 A8Wjp/wxf8kEODxBSXoGxquf/NVrwzSsRIhzkbqd+UZyldqgap21IKRJvhN0rx1SF48W
 2OwNwfjW+n4xaBSZm/ea3wFUIu9QfeNPRuJ1OkfCfl4mO9/3MaJsS14frowPYiVPXCgJ
 nuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LLPIf7qXwEodLjL1V+df+mpIrgJgFYuNvN+PgAflmco=;
 b=lHECgjhAD/WS0WXgHMXPTgdtFTI/eHxcA30MPUL/s2NA5EVi7fq4xAssLJihUDoxeu
 /iskJtf8iRaYNhiiRqyg8h5baWvZ+Y6obLZrjFy/cYVth7T4ca9flmFyVr2glP9HHWZn
 QhN4FlcDtPbEzkntmofSci08GOjzhRFBXr9s3GxZtgTFEF1ml7jJXxWiM9DL+eHpuLUY
 Xvrhvoin7jcOidof1sGPUCFxF1oOoNAKrZQsfuO2c80/sQeDTlSdeS72r3/GO2VQhqga
 G/S7K6x7+CSL/KbwEzZUXyh5G7fQUg0vkCsHFHJ78w2HdkXUMDUy3J3l463Iq4ztNE+X
 UsIg==
X-Gm-Message-State: AO0yUKV2vRiJ7jDXj5CzLOm6Ad/hBKhpiZvQj/8cN0EksrW7b6gmvTrw
 DspcKuN8DHcyv8vBaHRW6fHZEfYN326UINOR
X-Google-Smtp-Source: AK7set/YgmBKc31uUR0+dc85vShVRbYi5v0U7l5adyGJR3Kt2UOnieKGlNq6ARz4Gmc1sxlQSvzeyw==
X-Received: by 2002:a17:902:e88c:b0:198:dae9:d8f0 with SMTP id
 w12-20020a170902e88c00b00198dae9d8f0mr6391339plg.26.1675528409801; 
 Sat, 04 Feb 2023 08:33:29 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:29 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/40] include/qemu/int128: Use Int128 structure for TCI
Date: Sat,  4 Feb 2023 06:32:40 -1000
Message-Id: <20230204163310.815536-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are about to allow passing Int128 to/from tcg helper functions,
but libffi doesn't support __int128_t, so use the structure.

In order for atomic128.h to continue working, we must provide
a mechanism to frob between real __int128_t and the structure.
Provide a new union, Int128Alias, for this.  We cannot modify
Int128 itself, as any changed alignment would also break libffi.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic128.h | 29 +++++++++++++++++++++------
 include/qemu/int128.h    | 25 +++++++++++++++++++++---
 util/int128.c            | 42 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index adb9a1a260..d0ba0b9c65 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -44,13 +44,23 @@
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return qatomic_cmpxchg__nocheck(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = qatomic_cmpxchg__nocheck((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(CONFIG_CMPXCHG128)
 static inline Int128 atomic16_cmpxchg(Int128 *ptr, Int128 cmp, Int128 new)
 {
-    return __sync_val_compare_and_swap_16(ptr, cmp, new);
+    Int128Alias r, c, n;
+
+    c.s = cmp;
+    n.s = new;
+    r.i = __sync_val_compare_and_swap_16((__int128_t *)ptr, c.i, n.i);
+    return r.s;
 }
 # define HAVE_CMPXCHG128 1
 #elif defined(__aarch64__)
@@ -89,12 +99,18 @@ Int128 QEMU_ERROR("unsupported atomic")
 #if defined(CONFIG_ATOMIC128)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
-    return qatomic_read__nocheck(ptr);
+    Int128Alias r;
+
+    r.i = qatomic_read__nocheck((__int128_t *)ptr);
+    return r.s;
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
 {
-    qatomic_set__nocheck(ptr, val);
+    Int128Alias v;
+
+    v.s = val;
+    qatomic_set__nocheck((__int128_t *)ptr, v.i);
 }
 
 # define HAVE_ATOMIC128 1
@@ -132,7 +148,8 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
 static inline Int128 atomic16_read(Int128 *ptr)
 {
     /* Maybe replace 0 with 0, returning the old value.  */
-    return atomic16_cmpxchg(ptr, 0, 0);
+    Int128 z = int128_make64(0);
+    return atomic16_cmpxchg(ptr, z, z);
 }
 
 static inline void atomic16_set(Int128 *ptr, Int128 val)
@@ -141,7 +158,7 @@ static inline void atomic16_set(Int128 *ptr, Int128 val)
     do {
         cmp = old;
         old = atomic16_cmpxchg(ptr, cmp, val);
-    } while (old != cmp);
+    } while (int128_ne(old, cmp));
 }
 
 # define HAVE_ATOMIC128 1
diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index d2b76ca6ac..f62a46b48c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -3,7 +3,12 @@
 
 #include "qemu/bswap.h"
 
-#ifdef CONFIG_INT128
+/*
+ * With TCI, we need to use libffi for interfacing with TCG helpers.
+ * But libffi does not support __int128_t, and therefore cannot pass
+ * or return values of this type, force use of the Int128 struct.
+ */
+#if defined(CONFIG_INT128) && !defined(CONFIG_TCG_INTERPRETER)
 typedef __int128_t Int128;
 
 static inline Int128 int128_make64(uint64_t a)
@@ -460,8 +465,7 @@ Int128 int128_divu(Int128, Int128);
 Int128 int128_remu(Int128, Int128);
 Int128 int128_divs(Int128, Int128);
 Int128 int128_rems(Int128, Int128);
-
-#endif /* CONFIG_INT128 */
+#endif /* CONFIG_INT128 && !CONFIG_TCG_INTERPRETER */
 
 static inline void bswap128s(Int128 *s)
 {
@@ -472,4 +476,19 @@ static inline void bswap128s(Int128 *s)
 #define INT128_MAX int128_make128(UINT64_MAX, INT64_MAX)
 #define INT128_MIN int128_make128(0, INT64_MIN)
 
+/*
+ * When compiler supports a 128-bit type, define a combination of
+ * a possible structure and the native types.  Ease parameter passing
+ * via use of the transparent union extension.
+ */
+#ifdef CONFIG_INT128
+typedef union {
+    Int128 s;
+    __int128_t i;
+    __uint128_t u;
+} Int128Alias __attribute__((transparent_union));
+#else
+typedef Int128 Int128Alias;
+#endif /* CONFIG_INT128 */
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
index ed8f25fef1..df6c6331bd 100644
--- a/util/int128.c
+++ b/util/int128.c
@@ -144,4 +144,46 @@ Int128 int128_rems(Int128 a, Int128 b)
     return r;
 }
 
+#elif defined(CONFIG_TCG_INTERPRETER)
+
+Int128 int128_divu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u / b.u;
+    return r.s;
+}
+
+Int128 int128_remu(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.u = a.u % b.u;
+    return r.s;
+}
+
+Int128 int128_divs(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i / b.i;
+    return r.s;
+}
+
+Int128 int128_rems(Int128 a_s, Int128 b_s)
+{
+    Int128Alias r, a, b;
+
+    a.s = a_s;
+    b.s = b_s;
+    r.i = a.i % b.i;
+    return r.s;
+}
+
 #endif
-- 
2.34.1


