Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C649731A558
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:27:04 +0100 (CET)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe5n-00072r-QT
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVb-0001ue-D7
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:39 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVX-0007sR-RE
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:39 -0500
Received: by mail-pg1-x530.google.com with SMTP id t26so257635pgv.3
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gurvZ66hLTix7YQy4oY0/x7F0ARKo0Vv8g7JqIdz5nU=;
 b=Pxyno6aj1ldDTxbkH87G9Z9rmXndd7+1CpyIZa7kGIP5RsfiYWUPQ4FpIoSnmsRM4G
 6s2WBsdvasbgvkfDqLMjIQICPNn5VpOcAORv2FMSc5AI1oln7+Y88BtCA7S7L5wT+d7N
 6wvHm0VT0NMNwy4peFW4gC6oVlscDpNXstGEUMmSbvs+tTaayluElUvyets2/aEAr819
 e+pPDxnHvE5Y/nG696JzllBQmx6m7Ag5T0+C7iVCQ7VzEZTeihbK7O3xImhhIXIAPnHD
 6fZhTKTIdaJxZO0+QBrQfXuIxRS/bm3znWGE6igdVctzRAJtD87zUEJGgHrmN7oyKayU
 uEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gurvZ66hLTix7YQy4oY0/x7F0ARKo0Vv8g7JqIdz5nU=;
 b=VHtq8FNNWLwY4l7mEZolVlx8qi65fJoCIyHc8dW5xIMwGBsEOqKCzxPN/nGc/Yq0ZJ
 KmKZCzY13bbfg6sk1ZXp2kNLQZbGZK1wY6rLx1DUAkYg4ugmMF6QqCalRwlCuzlQ0kgD
 wGlG5CLqTioMLazbGJk3FkwrLYrcuTKlz0tajV+4GC8QUFnkadtdMXDlon2kWRNKl8EC
 MPomZOHSEw3g66VRrhXXA3QOhqvgC4qxJW+rSIGso2/R+/dR1iBJrAyly5tjxhyrRlvn
 d3OyzQ4gGfoR51SAFJ7SA5mZOTJzD045jeytb6pUVyBrwOj0yhmfICfQ0gED2VEwC0ro
 Qrzg==
X-Gm-Message-State: AOAM531PeEr0i8pWGzzTfxNpT0NPsdIASsl8lfeTHsyVhEIbq51M6QXi
 7nP94821RqksAJwyIqKqwxQfzUiuhJfPKg==
X-Google-Smtp-Source: ABdhPJxWFevmrKh8vUjJa4QTdAMZW6nHYumPOdeOuE+msh0eZEEHH3EZ9iDmYBXAfuARNbzzuePj1A==
X-Received: by 2002:a62:4d43:0:b029:1c6:e790:5f8f with SMTP id
 a64-20020a624d430000b02901c6e7905f8fmr4175335pfb.65.1613155774495; 
 Fri, 12 Feb 2021 10:49:34 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 24/31] linux-user/aarch64: Implement PROT_MTE
Date: Fri, 12 Feb 2021 10:48:55 -0800
Message-Id: <20210212184902.1251044-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remember the PROT_MTE bit as PAGE_MTE/PAGE_TARGET_2.
Otherwise this does not yet have effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    |  1 +
 linux-user/syscall_defs.h |  1 +
 target/arm/cpu.h          |  1 +
 linux-user/mmap.c         | 22 ++++++++++++++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d6ad774c01..09b9be845d 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -284,6 +284,7 @@ extern intptr_t qemu_host_page_mask;
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
 #define PAGE_TARGET_1  0x0080
+#define PAGE_TARGET_2  0x0200
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index f98c1c1c8d..46a960fccb 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1311,6 +1311,7 @@ struct target_winsize {
 
 #ifdef TARGET_AARCH64
 #define TARGET_PROT_BTI         0x10
+#define TARGET_PROT_MTE         0x20
 #endif
 
 /* Common */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 72a0819eb8..efa1618c4d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3608,6 +3608,7 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
  */
 #define PAGE_BTI  PAGE_TARGET_1
+#define PAGE_MTE  PAGE_TARGET_2
 
 #ifdef TARGET_TAGGED_ADDRESSES
 /**
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 6690384752..85e218ab1d 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -84,18 +84,24 @@ static int validate_prot_to_pageflags(int *host_prot, int prot)
                | (prot & PROT_EXEC ? PROT_READ : 0);
 
 #ifdef TARGET_AARCH64
-    /*
-     * The PROT_BTI bit is only accepted if the cpu supports the feature.
-     * Since this is the unusual case, don't bother checking unless
-     * the bit has been requested.  If set and valid, record the bit
-     * within QEMU's page_flags.
-     */
-    if (prot & TARGET_PROT_BTI) {
+    {
         ARMCPU *cpu = ARM_CPU(thread_cpu);
-        if (cpu_isar_feature(aa64_bti, cpu)) {
+
+        /*
+         * The PROT_BTI bit is only accepted if the cpu supports the feature.
+         * Since this is the unusual case, don't bother checking unless
+         * the bit has been requested.  If set and valid, record the bit
+         * within QEMU's page_flags.
+         */
+        if ((prot & TARGET_PROT_BTI) && cpu_isar_feature(aa64_bti, cpu)) {
             valid |= TARGET_PROT_BTI;
             page_flags |= PAGE_BTI;
         }
+        /* Similarly for the PROT_MTE bit. */
+        if ((prot & TARGET_PROT_MTE) && cpu_isar_feature(aa64_mte, cpu)) {
+            valid |= TARGET_PROT_MTE;
+            page_flags |= PAGE_MTE;
+        }
     }
 #endif
 
-- 
2.25.1


