Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F43D03F0
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:39:40 +0200 (CEST)
Received: from localhost ([::1]:51768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xSl-0008V9-PU
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQh-0005wN-Cw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:31 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5xQf-00008h-DM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:37:31 -0400
Received: by mail-pg1-x532.google.com with SMTP id u14so23738984pga.11
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGWi1/p5kH4vSWuQiEwMVtQM3xzILn4TEfNFXETr+/s=;
 b=qaB6QwjzqMLepaHZF2/z+NjI8S/lZESGDvsFQBUu6KbLLg4SOcC88XNzhNGOAc+XWA
 2tLuWwMtj9r5dG2/sE9gNHYf0VIzS+fDffCvGQygJ36C1mL2MYd7a0RBbtwGsEjuxA+q
 KUNBvd/KFtV3yNVrSz4T4aKo/xaWP3hm+E335qPXCMBEKGDz38whD5eij+yaHQUA5FiY
 1vNmxJZCUbjyx208OiXOaiHVW+nUj6hQtXZ3gjkkEoBBWZ6q/z401wki3gGDR7kxmLAS
 DNfxytXsszPz/gtkM/frTQwszgdvnRwEDdlwp4ZV1wV/yNYoCcU68qqpRlEYlNHvBf2O
 Js0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGWi1/p5kH4vSWuQiEwMVtQM3xzILn4TEfNFXETr+/s=;
 b=pffz3Y9wOnutYW8r9s9XU5lvJ6kUZD/Z3St9vKR1YJUdfnRMFpZeC8LSStguI+SPKt
 4rXSpsIVdDk82fpwB323tGgAt5aiXMO0AmwkWFMOxuq4+cFSCUR1oJQ0FZZHsc0MvgnG
 fiTWMiX2C5R8Kz+ad5nABIeEquPB0EuD15xzzlJuEQdnKAffnNJsn+ojZnO5Ii1zifOm
 6Rq2MkPmX/ciH1dcK4CvN8PrVndvSh26C2TgAEBLavJq9PuHI1qxZF9BayI1rgZGckph
 l3wO69mzfAavDBHkTq/gnRQgMhchF4GemHjOuwg1IuCqJGUBMhbdF8GY6rI1H+hfmKGm
 WXzQ==
X-Gm-Message-State: AOAM533Q1z3a5VjP95w06YzTz/15LpYEPX9njvWuh5q/Z++v7kMRciPa
 sqj7i7fFmeyFc8uaaqQ39MtUnB6MApGTew==
X-Google-Smtp-Source: ABdhPJwN/ajyBeowW7CFdEAvdmD3hgmF14Hht6lK7pkP3JjBTgNW468aDuQtt3P7QUFi0YC61WvDOA==
X-Received: by 2002:a63:d14c:: with SMTP id c12mr32351879pgj.412.1626817048170; 
 Tue, 20 Jul 2021 14:37:28 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id r10sm24376813pff.7.2021.07.20.14.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:37:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/10] qemu/atomic: Use macros for CONFIG_ATOMIC64
Date: Tue, 20 Jul 2021 11:37:14 -1000
Message-Id: <20210720213723.630552-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720213723.630552-1-richard.henderson@linaro.org>
References: <20210720213723.630552-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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


