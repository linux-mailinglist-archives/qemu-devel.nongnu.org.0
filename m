Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA8381ECF
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:38:15 +0200 (CEST)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG2A-0001ZQ-RO
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyf-0007AE-TI
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:37 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:33474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyd-0007eE-Mb
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:37 -0400
Received: by mail-qt1-x82e.google.com with SMTP id 1so3064356qtb.0
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OE2SstHOUvTaOB7/8Q/5yQQrmi158aC82gRKPD2FhoE=;
 b=kPNiJRzhk+sovRDgHbL6uu63EJEDCdMIzQciMV06SxACz+0WGoNLpPUm2G8FHl9hin
 ywolksV6FujM1lUgxlJiP++HpTnsoFm5v3QCURmD4lY4yxi5B2fgzoA8wB79RpdmY8mT
 TqljV15UBIuC9nGnda414ehMgDzNW78HFE0D7os7zPEEKypdLKKT+YaO31/Racv1suGl
 f/H+DjXD0f+tBYhDgMkCRbOwvlpQMyZ9xe2IXqMRmJFU9Q3ANaJw9mVWkbwxKw61Oav6
 D8a/G0rm6IUT3wa5h/wiG16DFayRzWICqNPFw8WmyjG/KMX7u7n2wPDVwcY50M4AwqXd
 UcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OE2SstHOUvTaOB7/8Q/5yQQrmi158aC82gRKPD2FhoE=;
 b=Z5cV728pQ659YHJBeH+fWtN4iQVV8kpbfpsV6PSMv8DGPiFEEV9z+ZulqvPlUq/eXo
 MU1ReUY21knk0sEQbAS5sv75cI4ZenFZnWz3tckhRClPedEFCFALU7s54f0t1luKexZN
 AXTWWp0Pa9ENT9S9dl5rsKlP1DiL5W+zxaHWG6DbvC9uwQwORPaz4oTpldkEJ1wZyOnH
 2C3jYrpUnVcplX6spTnC2f/sH1LALvd1cJ7FUZ03orQfH06Zz7jAcnmlL8ENaXF5TymG
 FyKvxBHZ/FjUGuMXq7y2Jnzk9JvYZk0KYa8mxvpYQKGkZcxMKtTEC/AgvxKNA67eM6bU
 yRIQ==
X-Gm-Message-State: AOAM530JKWBfmvi8s+8t8sjmLQSOj6qp6OkrkZgtqcC1vxqLLIn9jVJQ
 TWFs56AAZ3FpNRZVh+jyPLvJtF1C44FpTtDCyWs=
X-Google-Smtp-Source: ABdhPJzyAELMkBj4UWMKsx4nQ2G2VLdV8R0kOhoTGhrGL/kumm9+dR4rEq3kGaOy/QljDxiX1End2Q==
X-Received: by 2002:ac8:5553:: with SMTP id o19mr5071609qtr.308.1621168474469; 
 Sun, 16 May 2021 05:34:34 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/46] qemu/host-utils: Add wrappers for overflow builtins
Date: Sun, 16 May 2021 07:33:47 -0500
Message-Id: <20210516123431.718318-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builtins came in with gcc 5 and clang 3.8, which are
slightly newer than our supported minimum compiler versions.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 225 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index f1e52851e0..cb95626c7d 100644
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
+ * umul64_overflow - multiplication with overflow indication
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


