Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83824308162
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:49:37 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5G6a-0003jk-IN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fze-0005jU-JO
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:26 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzR-0008Ba-1V
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:26 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o16so5290280pgg.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1r8pB7pD9EIFwj0J5T7PSXbPTyHStDyxJkV5qjF0ns=;
 b=JSl5oohobKCmwXuxdrPAPGWF3e3/rAKBAqDiFTE+OK1KAjHYd0nsa/eijA6Gx26Wnc
 HM2fhxC5nvlKOFcG8L2mTdz63nZjZ7//llvTL4n0gDbchDyWL0YojKM8yUj/wub9oFss
 cbMmx/kkT+WJ1XSCJAVQAEzvFI7g/xQ+zJ44QNMszkqz2ii2a6UrVhR/2oFOdX0u+QmQ
 BQ63MywNnCZOzhgSMPA0UxU/uM9fxtPYQJXSz6nEmcB8BM02vJx5YK1RqtRQSyTby617
 NHTSGfhD+7AW1mURJEbEauedJ0VsoN80zPeoejNa0l4PwylR/eorNEuTopD59sR3ExAN
 +pOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1r8pB7pD9EIFwj0J5T7PSXbPTyHStDyxJkV5qjF0ns=;
 b=oCBSOIZw6Pokno5/ninueouA+jXn/P4KlW6VvsqQd89ccgssBdUYuXR4QFQ9pSOeRQ
 sJr5y51caJ0POLcutIDr+pZ3poNOy6sun+FP45UilJVKUeQ+rRgRsRqKK9EcnqN7GvY+
 WT3uJC8sk+x0hzsfoQg6s2YVwkWBjWCvYDz+/JckomtBR8nI0REsExDcbjDbzCK+gi1S
 BlZgAlANedFIuzmHTIr6yH4tJ3aCfnBCfwUy+umM7ZvYkmW1L9DdmOeMAXMU55Dv39LF
 2x/kUIWMfqprGGRlwRhvL1ZAuwv57JGpDgpqlIl1sXJ5CQXSWE7ogaep+LvvGH78p4K5
 7NPg==
X-Gm-Message-State: AOAM530pE17eDARvwtESpuOOtyCerK5URGYC2MchGkkDsbKof8bwlY0D
 KYisexeS80Pa5D2QQVHwLZ9dvBrsqhJeL6Xh
X-Google-Smtp-Source: ABdhPJzVBymBvGRDJOydMuHtaUy3ACHZNDdMFaeAAkikvbF3wT2ECNThBagMm2ZUPHFHOesfTiyo7w==
X-Received: by 2002:a62:7f12:0:b029:1bd:d6e7:e2ba with SMTP id
 a18-20020a627f120000b02901bdd6e7e2bamr1605393pfd.65.1611873731204; 
 Thu, 28 Jan 2021 14:42:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/23] linux-user/aarch64: Implement PROT_MTE
Date: Thu, 28 Jan 2021 12:41:34 -1000
Message-Id: <20210128224141.638790-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remember the PROT_MTE bit as PAGE_MTE/PAGE_TARGET_2.
Otherwise this does not yet have effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Do not overlap PAGE_TARGET_2 with PAGE_RESERVED.
---
 include/exec/cpu-all.h    |  1 +
 linux-user/syscall_defs.h |  1 +
 target/arm/cpu.h          |  1 +
 linux-user/mmap.c         | 22 ++++++++++++++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index c52180e8e6..b2a72f70ec 100644
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
index 0db6e65467..7a79dde6f6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3605,6 +3605,7 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  * AArch64 usage of the PAGE_TARGET_* bits for linux-user.
  */
 #define PAGE_BTI  PAGE_TARGET_1
+#define PAGE_MTE  PAGE_TARGET_2
 
 #ifdef TARGET_TAGGED_ADDRESSES
 /**
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 7fb4c628e1..34bd114f97 100644
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


