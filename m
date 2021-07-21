Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E43D1775
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:02:28 +0200 (CEST)
Received: from localhost ([::1]:53436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IQF-0005KE-6B
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INu-0002LO-DV
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6INs-0005Zf-3V
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:02 -0400
Received: by mail-pl1-x62c.google.com with SMTP id d1so1664045plg.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGWi1/p5kH4vSWuQiEwMVtQM3xzILn4TEfNFXETr+/s=;
 b=EK44EOprzAhgmXmsvs9nJ3GKkJS/pI3r7n7/Bxu/VKC81SuFnij7GgLUENICf+tWJV
 kY5PyRktzfJBdLwOaFL0lM3utS+ijZ1uSTtv/GrAJokdzIHd+UFMFEEuR1JfvvxRxcyL
 JWziVCw5xovSTHnnATLiCgaSLqFxK7zqiBgiq2BLVX+IpOwpzIjovKjcRZsFhiGh7Em7
 w9SYIG5rBY6yJrH54OlsvqUt3QuksfTk/GCeHcPOekmKrT18a3KPrcYf16sYrda8mtrS
 0EWa/IQUw/dsqzXPcCPDQo1TFz7TviyuJ0MryzWoYB/eU7SxdTQ5pwLCwz12esHGRvsW
 8w4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGWi1/p5kH4vSWuQiEwMVtQM3xzILn4TEfNFXETr+/s=;
 b=qYpIaYAQbaRO3FinMr8iHJtXVaw7g0XY+rHiwvSU3ke7fgQ+SBP3PcKckQrZNuIKXn
 sa7L9AsSs5Ai/4Lcnr3JHlYh6VqEskPqg6aC9jRJ8rOp7v3KZQZTPyTtA6Rm0RcaiSjZ
 GESSBMQGylQblhVwgULWmQE8irTkJ81KJJC0BNVesXbq2XmlWauRNkksj/yyMrEhO4lS
 s+TbyyAQYTLaa0ELIxUmQzlkS9OlJUfwP+dsuiIWeafYXTE/6wJsplegSRRJVQ0jKDD3
 VtVq37EvGKntINqwAx9vYr1SWnkq5u97Njwtjy7J2B9QpPVi5t9z9oyybghQnqTxjS7f
 YhdA==
X-Gm-Message-State: AOAM533XWFnhbJ/Bjz06G7Leja1conNvHU2AgAOKemCRaUPXaaacO7BS
 3KEy3vOPRIOhPyMHzxwxanPGGJeQLC6Lvw==
X-Google-Smtp-Source: ABdhPJzGcsVy0N3pQ8ysPWz5BKy5TLy3ywwFUsXwEe18dfYGXUQTse5KF6fCe1QiySJYb4ZUGK9F1g==
X-Received: by 2002:a62:dd83:0:b029:2e8:e511:c32f with SMTP id
 w125-20020a62dd830000b02902e8e511c32fmr37914367pff.49.1626897598652; 
 Wed, 21 Jul 2021 12:59:58 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.12.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:59:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/27] qemu/atomic: Use macros for CONFIG_ATOMIC64
Date: Wed, 21 Jul 2021 09:59:28 -1000
Message-Id: <20210721195954.879535-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang warnings about questionable atomic usage get localized
to the inline function in atomic.h.  By using a macro, we get
the full traceback to the original use that caused the warning.

Tested-by: Cole Robinson <crobinso@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/atomic.h | 29 +++++++++--------------------
 1 file changed, 9 insertions(+), 20 deletions(-)

diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
index 3ccf84fd46..a7654d2a33 100644
--- a/include/qemu/atomic.h
+++ b/include/qemu/atomic.h
@@ -457,26 +457,15 @@
 
 /* Abstractions to access atomically (i.e. "once") i64/u64 variables */
 #ifdef CONFIG_ATOMIC64
-static inline int64_t qatomic_read_i64(const int64_t *ptr)
-{
-    /* use __nocheck because sizeof(void *) might be < sizeof(u64) */
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline uint64_t qatomic_read_u64(const uint64_t *ptr)
-{
-    return qatomic_read__nocheck(ptr);
-}
-
-static inline void qatomic_set_i64(int64_t *ptr, int64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
-
-static inline void qatomic_set_u64(uint64_t *ptr, uint64_t val)
-{
-    qatomic_set__nocheck(ptr, val);
-}
+/* Use __nocheck because sizeof(void *) might be < sizeof(u64) */
+#define qatomic_read_i64(P) \
+    _Generic(*(P), int64_t: qatomic_read__nocheck(P))
+#define qatomic_read_u64(P) \
+    _Generic(*(P), uint64_t: qatomic_read__nocheck(P))
+#define qatomic_set_i64(P, V) \
+    _Generic(*(P), int64_t: qatomic_set__nocheck(P, V))
+#define qatomic_set_u64(P, V) \
+    _Generic(*(P), uint64_t: qatomic_set__nocheck(P, V))
 
 static inline void qatomic64_init(void)
 {
-- 
2.25.1


