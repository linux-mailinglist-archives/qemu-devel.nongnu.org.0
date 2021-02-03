Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FD430E334
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:25:28 +0100 (CET)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NmJ-0008Sx-AF
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NP0-0007dZ-LG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:22 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001ow-Jg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:22 -0500
Received: by mail-pf1-x435.google.com with SMTP id q20so416341pfu.8
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fCxV49bfxaBtv2xlDg0+NI6CzMz9AR3avdjaaz44F+U=;
 b=U8fptPED9jlxWohXqurZFrvG5APWE7cs6Y28DUfW+HM8yfX4a12H42IgMxWmwWk7cU
 IP/QmAIr/rDV1c47ZRdeevvKyqJB428i37QqfMY8hwY37yT/0DUzkcwag0h7tEysqQ6f
 lDFwHDXl2mFeGBMW7OiEfwpPej1BNqN1uf26XDvpy73TIPLaO0z0MY1EL9RpOEDPerZk
 TA+rV0GosDALoYUGPPSd/eVNMHbSFTERhzFqg0x7QCaohzjbdPjkFWGpNizyeYpWcZl5
 N1XyQG00lWq/VY7ucp0rzPEUPGg6Mv8lvZDfXuRKGR+wV15eSp6YuteVVi3MiFiqJWvW
 9KKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fCxV49bfxaBtv2xlDg0+NI6CzMz9AR3avdjaaz44F+U=;
 b=KUwoM0mYhS/H0lhNdmvx1y7dbg1Tm1SF38w8ky5a5jRgU6915Kxn5MVzzqofwC48sA
 50bxdKoBsXykPLkG72mKoTdDZuLjGD4LrJq3Swr8o72ldOFeSXGYbW3jvxGBFqLqWNT2
 jGFmd+lHVlvsrOe+UDqybnpalABtzTLtRoU2O3098y4jljL2iI6HtEhN5CxNgWf2IaQC
 ELKe/jIEco0b4DhE6gukDP/FLCKKf9ah7o01LWVc9fbo1Kb2eN1myXXidSKRzulWbLJI
 +Ui2l9SxC4Ey7i6Ijuu1F90G5BeQLAbMlMAYv4cLMhN/kTa5G4aAHvhdedUJdl0lujqg
 lJ2g==
X-Gm-Message-State: AOAM533T51fOoTAiXzgHb3vWhXZ/7umHfpyCelNC/0YYh5R+0CS4W8Hg
 el5t8kvtRLWiOt9sLaGvw+KL3G/ZxnrrTweX
X-Google-Smtp-Source: ABdhPJxivtT814RuFJC0nM447/SDQPAY4MVBwGcvIW0BDE31N4WpDG3egR1u7zJJJM1jRJQ5u0rs+A==
X-Received: by 2002:a63:c941:: with SMTP id y1mr5106047pgg.313.1612378863075; 
 Wed, 03 Feb 2021 11:01:03 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/31] linux-user/aarch64: Implement PROT_MTE
Date: Wed,  3 Feb 2021 09:00:03 -1000
Message-Id: <20210203190010.759771-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
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
index 558ad1466b..e3e61ce7ab 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3606,6 +3606,7 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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


