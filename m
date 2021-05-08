Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A18A376E1E
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 03:51:02 +0200 (CEST)
Received: from localhost ([::1]:47220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfC7R-0006jZ-6i
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 21:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4e-0003v6-RF
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:08 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lfC4c-0003VN-Qn
 for qemu-devel@nongnu.org; Fri, 07 May 2021 21:48:08 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k19so9143710pfu.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 18:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4FUAz053Q8O4lxDctUgjdKConowhJ6wTho8iZJwG5rg=;
 b=DDoqlPhHgArnH3rPWW4cCfpZrOdA2CiVAMB3GupObKqU1w3vMVy3mbtHuvpDTdEfgQ
 oWIxgrEpNRC4AJYTNgkAypi6ETHhQgmnPh4bWEKCxISca/iFl0AVKuWhCKSswpESmz5D
 aQUXK1MGFn6ZUKOO1o5Ks5k8PoLLseYzRVOa3X2SYmtfSyhW6p0455SGBAR30Ux0Oz4Y
 hhkwDOjgHcLHMJrUr7Ua+nnDUgb/Be8zF7YecHpCAmtF+QVXVG01i41PlfO9acGQimqi
 xlxp0wAtx+eiZh09XI7yZwpqq6PkgyHgrCDDKbfqILa5jUwejfFUaKXu9/Uv4k1qWwUY
 gehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4FUAz053Q8O4lxDctUgjdKConowhJ6wTho8iZJwG5rg=;
 b=KBs/OfvjzdIs1PoWFF9/pcVPT8ciqfSXoerLHah3MnK3covrvr6qhVL9ubAEI8vb16
 4tqvsz/g/wYbc7r1r6rybX0ZFaXD/SLTFlSZ3F0q91Q+WemTmZ1bQSHuqiFpRLUaEx2q
 kpCaHkjYqAb8i1h2RwnXZgjAAywrhM9vCncqaLMgtFy02dXpC9Nz2YFUBp3n5jNKzSv+
 GU2XywRVbJEUabyTNhYL1UUrLuYhuqDW7lE/NN1s30NVOf8WBv0gowHKR7ioRRqrrSCa
 x84JQ7aW3QS6Jx5zEaPMZRuyUlXJO9TOUVhILHjqCY+opn4HBk9AOUEkIhxG+wI3wcpL
 0UKA==
X-Gm-Message-State: AOAM531rVQYKR7mIm7b/nwP7oiNCAgwd/40zEHAtJUOhvgDuu9gXOBqS
 +34kJMNBccQHTQN9NC1kEVMmsx6+AdEA+Q==
X-Google-Smtp-Source: ABdhPJzaILy2tAEtUTkfrzjsUeG4u0ZvW5tQCK/gmP5n2eo+s+udMd/fhax0zlf44nMqCGes4zchoA==
X-Received: by 2002:aa7:848f:0:b029:28f:916b:a220 with SMTP id
 u15-20020aa7848f0000b029028f916ba220mr13722173pfn.10.1620438485411; 
 Fri, 07 May 2021 18:48:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t4sm5819681pfq.165.2021.05.07.18.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 18:48:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/72] qemu/host-utils: Add wrappers for overflow builtins
Date: Fri,  7 May 2021 18:46:52 -0700
Message-Id: <20210508014802.892561-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210508014802.892561-1-richard.henderson@linaro.org>
References: <20210508014802.892561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builtins came in with gcc 5 and clang 3.8, which are
slightly newer than our supported minimum compiler versions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 225 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index f1e52851e0..fd76f0cbd3 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -356,6 +356,231 @@ static inline uint64_t revbit64(uint64_t x)
 #endif
 }
 
+/**
+ * sadd32_overflow - addition with overflow indication
+ * @x, @y: addends
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x + @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool sadd32_overflow(int32_t x, int32_t y, int32_t *ret)
+{
+#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
+    return __builtin_add_overflow(x, y, ret);
+#else
+    *ret = x + y;
+    return ((*ret ^ x) & ~(x ^ y)) < 0;
+#endif
+}
+
+/**
+ * sadd64_overflow - addition with overflow indication
+ * @x, @y: addends
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x + @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool sadd64_overflow(int64_t x, int64_t y, int64_t *ret)
+{
+#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
+    return __builtin_add_overflow(x, y, ret);
+#else
+    *ret = x + y;
+    return ((*ret ^ x) & ~(x ^ y)) < 0;
+#endif
+}
+
+/**
+ * uadd32_overflow - addition with overflow indication
+ * @x, @y: addends
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x + @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool uadd32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
+{
+#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
+    return __builtin_add_overflow(x, y, ret);
+#else
+    *ret = x + y;
+    return *ret < x;
+#endif
+}
+
+/**
+ * uadd64_overflow - addition with overflow indication
+ * @x, @y: addends
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x + @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool uadd64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
+{
+#if __has_builtin(__builtin_add_overflow) || __GNUC__ >= 5
+    return __builtin_add_overflow(x, y, ret);
+#else
+    *ret = x + y;
+    return *ret < x;
+#endif
+}
+
+/**
+ * ssub32_overflow - subtraction with overflow indication
+ * @x: Minuend
+ * @y: Subtrahend
+ * @ret: Output for difference
+ *
+ * Computes *@ret = @x - @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool ssub32_overflow(int32_t x, int32_t y, int32_t *ret)
+{
+#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
+    return __builtin_sub_overflow(x, y, ret);
+#else
+    *ret = x - y;
+    return ((*ret ^ x) & (x ^ y)) < 0;
+#endif
+}
+
+/**
+ * ssub64_overflow - subtraction with overflow indication
+ * @x: Minuend
+ * @y: Subtrahend
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x - @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool ssub64_overflow(int64_t x, int64_t y, int64_t *ret)
+{
+#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
+    return __builtin_sub_overflow(x, y, ret);
+#else
+    *ret = x - y;
+    return ((*ret ^ x) & (x ^ y)) < 0;
+#endif
+}
+
+/**
+ * usub32_overflow - subtraction with overflow indication
+ * @x: Minuend
+ * @y: Subtrahend
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x - @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool usub32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
+{
+#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
+    return __builtin_sub_overflow(x, y, ret);
+#else
+    *ret = x - y;
+    return x < y;
+#endif
+}
+
+/**
+ * usub64_overflow - subtraction with overflow indication
+ * @x: Minuend
+ * @y: Subtrahend
+ * @ret: Output for sum
+ *
+ * Computes *@ret = @x - @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool usub64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
+{
+#if __has_builtin(__builtin_sub_overflow) || __GNUC__ >= 5
+    return __builtin_sub_overflow(x, y, ret);
+#else
+    *ret = x - y;
+    return x < y;
+#endif
+}
+
+/**
+ * smul32_overflow - multiplication with overflow indication
+ * @x, @y: Input multipliers
+ * @ret: Output for product
+ *
+ * Computes *@ret = @x * @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool smul32_overflow(int32_t x, int32_t y, int32_t *ret)
+{
+#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
+    return __builtin_mul_overflow(x, y, ret);
+#else
+    int64_t z = (int64_t)x * y;
+    *ret = z;
+    return *ret != z;
+#endif
+}
+
+/**
+ * smul64_overflow - multiplication with overflow indication
+ * @x, @y: Input multipliers
+ * @ret: Output for product
+ *
+ * Computes *@ret = @x * @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool smul64_overflow(int64_t x, int64_t y, int64_t *ret)
+{
+#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
+    return __builtin_mul_overflow(x, y, ret);
+#else
+    uint64_t hi, lo;
+    muls64(&lo, &hi, x, y);
+    *ret = lo;
+    return hi != ((int64_t)lo >> 63);
+#endif
+}
+
+/**
+ * umul32_overflow - multiplication with overflow indication
+ * @x, @y: Input multipliers
+ * @ret: Output for product
+ *
+ * Computes *@ret = @x * @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool umul32_overflow(uint32_t x, uint32_t y, uint32_t *ret)
+{
+#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
+    return __builtin_mul_overflow(x, y, ret);
+#else
+    uint64_t z = (uint64_t)x * y;
+    *ret = z;
+    return z > UINT32_MAX;
+#endif
+}
+
+/**
+ * smul64_overflow - multiplication with overflow indication
+ * @x, @y: Input multipliers
+ * @ret: Output for product
+ *
+ * Computes *@ret = @x * @y, and returns true if and only if that
+ * value has been truncated.
+ */
+static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
+{
+#if __has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5
+    return __builtin_mul_overflow(x, y, ret);
+#else
+    uint64_t hi;
+    mulu64(ret, &hi, x, y);
+    return hi != 0;
+#endif
+}
+
 /* Host type specific sizes of these routines.  */
 
 #if ULONG_MAX == UINT32_MAX
-- 
2.25.1


