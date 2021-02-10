Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3F315B14
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 01:25:35 +0100 (CET)
Received: from localhost ([::1]:34544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9dJx-0007tD-5d
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 19:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cyT-0003vE-4e
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:17 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:42167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9cy8-000882-Cc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 19:03:16 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s15so200461plr.9
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 16:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/yy0MVTekscTvbExOtLpCwu/aJiFmhlysgQsSM+d6s=;
 b=rw8xjDvJZsv2TuUJ2Pfo7eaH9NntWoNAd6/g1+LeTktnuQ34HgXuVVnmz1ieX4c2BR
 8h2qGGx+PfRGNY8sSDlqIRmJQLfkzAGOKH4ARH1ZJUNAcHeoFo40Asi+05ff052yDPsC
 /D2k+jliuhyArELXG+vHMJRIyNaLHas+VuusUzP4VxgTAfTd3+BkKuMoKtvpT7YWpPIi
 Nh58+4jwbw/Tpj9Qfpv/C5AK9Aa3BiM+8SlU5mi214BpEv48lmef2ZTzol8V8Ij3V9dd
 7OY5rABEZZ87vID4NweUtbXc1K/uVSX6GmACEPdXIkG271p5nygztoFznM25mO4dcdcg
 WPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/yy0MVTekscTvbExOtLpCwu/aJiFmhlysgQsSM+d6s=;
 b=YhLj4qRoyEPnCpS2c2syglzkTcBhLI9gS0j8eRbibl2Ww1ZyUuCVSrdNFKhcW+8J77
 IFg3tOijANAv6R9w7PglgIS8+6d7mAVcJgiTVZ9Wxc9dK6Xf2b1MqB9XyKdd2t3KmDh8
 AH+chm8MRnDXmwpSbD0vDoGP1z/EoGrtDWxCp33OlXbODCExm3BNqmx2/Z/979xZTLZz
 3LIvyItCnAQUoGQs92uyiO89Fk6DCjocWOjbeT46PHjfw08yjwnHx423LKR3+weY764j
 EClKA53MKtsdaQKc50ZhCMskIrvUGXf3nRXO7qT+qcMtPA+HQ3S9tgss35/zJGMktsaP
 0JTA==
X-Gm-Message-State: AOAM532Av/LZPXMHEByUVEzbGGaLk/R/06A8EG22qWXpLWoFjSnSmNjd
 DkHcz5vV2WHamKBPkq4FtLjY//jwU14CCA==
X-Google-Smtp-Source: ABdhPJzPnhAu1uFGfwj6y1l5eDz4awL7mMG6UKoZqlIUJC36u7fUAKo1nrSnLnfVj2OxabO76mV02Q==
X-Received: by 2002:a17:90a:5d87:: with SMTP id
 t7mr352438pji.175.1612915375089; 
 Tue, 09 Feb 2021 16:02:55 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id me3sm164189pjb.32.2021.02.09.16.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 16:02:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 24/31] linux-user/aarch64: Implement PROT_MTE
Date: Tue,  9 Feb 2021 16:02:16 -0800
Message-Id: <20210210000223.884088-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210000223.884088-1-richard.henderson@linaro.org>
References: <20210210000223.884088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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


