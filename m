Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE214381ED6
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 14:43:13 +0200 (CEST)
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liG6x-0004Vi-Qy
	for lists+qemu-devel@lfdr.de; Sun, 16 May 2021 08:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFyg-0007AV-9S
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:38 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1liFye-0007ek-7L
 for qemu-devel@nongnu.org; Sun, 16 May 2021 08:34:38 -0400
Received: by mail-qt1-x82b.google.com with SMTP id m13so2984626qtk.13
 for <qemu-devel@nongnu.org>; Sun, 16 May 2021 05:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkUZA1QUxVx6D7Ez3r9MoCYNO26DmbAtxbxbzUkDVlw=;
 b=hGbSRJ4crDBrGo4NCYcjMQiD1/31bqIEEXSbIidbCwupwSKzlzOOhrkFRFkccAYvfs
 RCbns5KcpwCFYRekEQxJqsAU6NTZ8EartV33lRhigdVI6pqimsP7CgKXgkbZ7WEQKaJF
 860vV1QkgVZD0KDqF9Pm8L/CGJc5ATTcp3xF4MV/9xUk8eFg31Y6OHO3PBiaHIKBYb3r
 8ChkafloMVdp1pU0CG0tOs+/1dlBvYRFDSO1a3RtPHLVvM3/LpMr1CxWBSn/7X3sC2/5
 euw6/e9usJajCdY63j+V8iPHPPDctSkOug2Vzq/Y51buc0yWRrmhbKc4rKucIjZqWnqA
 M7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkUZA1QUxVx6D7Ez3r9MoCYNO26DmbAtxbxbzUkDVlw=;
 b=uETi8TUu3U+pONe1saRdmbYn8qLpBxl7ZdunfXFqHaZEB9mJNU7I7IE3jKbJn5MLoa
 B2UqEnEGKl0QD8PUS/zMNod39CZbouMs9ppGuzRkqK0Vgi4yPYYXnXa2p+cT497ypDDh
 TbKyOePhjqLcjcx0novOR1XRIic/JxaIyNWSC+W5TYEg/gziiKvto/aggUxstdiaiLzK
 mLH8vfXHqodVxJBlJwrLd4EsvlTarN3lHH/76NH0Yo2bGV/5Ffm4ONipnU2MK8PM0L6O
 d2Hb17xPnb8cDafbWxBsvwnPkdPqw9oMt75hmnIyqg/Sv53UgnZ4C1UOQMA0G+zRZ4+r
 r8Tw==
X-Gm-Message-State: AOAM531JPx3ziOjzAvsWYI9XGngF0SaT5JkzMkRqbJ5MixCiBHKHK4R9
 EBF0NrECgKv5Phr8pEusuGyCWgackTfLTBtlnPU=
X-Google-Smtp-Source: ABdhPJysmZO5q+IWy8ZGqNG3RZ0tWYNX4uwZRrOC62t41Ez6pSCv6vRV4wIiwXJBT9fHm2VFrxQUTA==
X-Received: by 2002:ac8:450c:: with SMTP id q12mr9538723qtn.327.1621168475296; 
 Sun, 16 May 2021 05:34:35 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id s5sm8500553qkg.88.2021.05.16.05.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 05:34:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/46] qemu/host-utils: Add wrappers for carry builtins
Date: Sun, 16 May 2021 07:33:48 -0500
Message-Id: <20210516123431.718318-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516123431.718318-1-richard.henderson@linaro.org>
References: <20210516123431.718318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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

These builtins came in clang 3.8, but are not present in gcc through
version 11.  Even in clang the optimization is only ideal on x86_64,
but never worse than the hand-coding that we currently do.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/host-utils.h | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index cb95626c7d..711b221704 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -26,6 +26,7 @@
 #ifndef HOST_UTILS_H
 #define HOST_UTILS_H
 
+#include "qemu/compiler.h"
 #include "qemu/bswap.h"
 
 #ifdef CONFIG_INT128
@@ -581,6 +582,55 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
 #endif
 }
 
+/**
+ * uadd64_carry - addition with carry-in and carry-out
+ * @x, @y: addends
+ * @pcarry: in-out carry value
+ *
+ * Computes @x + @y + *@pcarry, placing the carry-out back
+ * into *@pcarry and returning the 64-bit sum.
+ */
+static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcarry)
+{
+#if __has_builtin(__builtin_addcll)
+    unsigned long long c = *pcarry;
+    x = __builtin_addcll(x, y, c, &c);
+    *pcarry = c & 1;
+    return x;
+#else
+    bool c = *pcarry;
+    /* This is clang's internal expansion of __builtin_addc. */
+    c = uadd64_overflow(x, c, &x);
+    c |= uadd64_overflow(x, y, &x);
+    *pcarry = c;
+    return x;
+#endif
+}
+
+/**
+ * usub64_borrow - subtraction with borrow-in and borrow-out
+ * @x, @y: addends
+ * @pborrow: in-out borrow value
+ *
+ * Computes @x - @y - *@pborrow, placing the borrow-out back
+ * into *@pborrow and returning the 64-bit sum.
+ */
+static inline uint64_t usub64_borrow(uint64_t x, uint64_t y, bool *pborrow)
+{
+#if __has_builtin(__builtin_subcll)
+    unsigned long long b = *pborrow;
+    x = __builtin_subcll(x, y, b, &b);
+    *pborrow = b & 1;
+    return x;
+#else
+    bool b = *pborrow;
+    b = usub64_overflow(x, b, &x);
+    b |= usub64_overflow(x, y, &x);
+    *pborrow = b;
+    return x;
+#endif
+}
+
 /* Host type specific sizes of these routines.  */
 
 #if ULONG_MAX == UINT32_MAX
-- 
2.25.1


