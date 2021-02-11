Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91626318C16
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:32:13 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAC4q-00058F-Lk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:32:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZM-0008Ow-0g
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:41 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZB-00005i-8L
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:39 -0500
Received: by mail-wr1-x435.google.com with SMTP id b3so4094182wrj.5
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Td1SZqricVmJobvnC2bV9MTlMvXZFc8dAKhtITA+Nog=;
 b=INIaVQdvx12S40AoN+MoZHO4IHLz+RenMAJAuVBEqNAnAw1jaz1/O2S1kkkuA3AQ50
 4YLaucptuTK02ITnbSMnYYFBH89M2scQnGpxQ9X8GxF9aNkIq2ETEVLx0BA8j4Y0AdAB
 sXm2tLlH3/tMSNSdkNjMEleThLoZqUKjlgEKDYQQEUQtxzR0YWxhtxD3d7rEwrkMFmny
 hQIQR+bzwh85zSoSLLyIZmRFsiTBLNm81NgiGSLvTuOGhbgant2HD8H8XFyuBPMgfN/M
 BJEWU8VCF6tSWBrwQmqZNkFSTQka95uYL+TXXFQosvZdWiO4q34dMAccCViVERUl9bfG
 TiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Td1SZqricVmJobvnC2bV9MTlMvXZFc8dAKhtITA+Nog=;
 b=C3bX9fhhpipQby5Ckc+7H3OEJH//0NcUkf6DBtAX9RMTGzOjiufwVN10nkHrD450BK
 YFxQe7ip3kUIkF4GYPOhtvgDLAKSgUfFKzwXaw0ITPOTmzUctI0GwxSlAdUY+Zw3sU+/
 C/fH5HnysChFVRlOI1INYsq/v0uCljpFDRKYC3rZGDGuGtm4Tn20+NNtohz0a8Tn5O7v
 rGlKHihXbqUtXp3ZbvQfJbDF0ReZGiSv8VlLXmELLJdlLMq1aYXQIREqUXc0ydlqMQm9
 HSi2GlHtvRh8Fxs9cic/jZMe5rgJBJfN5nNudwPdeIkaoWify3+3obSzVMGrtU5eeMRq
 HRMQ==
X-Gm-Message-State: AOAM533OPGqvZQ4WYtKXrrSnQLoWEJnNp9dCypscdvLFhdrdDoFzMjf1
 pbQvD8ZQaHNlG/XKTphPe+Ab9xxiGJjdUQ==
X-Google-Smtp-Source: ABdhPJw3aOzxG97IatOnnQNABcwvj7I075/igALUdmvV5TyLxOCWtuMEinjffaWkwQRHttYYlag4hQ==
X-Received: by 2002:a05:6000:2aa:: with SMTP id
 l10mr5618867wry.368.1613048367499; 
 Thu, 11 Feb 2021 04:59:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/45] linux-user/aarch64: Implement PROT_MTE
Date: Thu, 11 Feb 2021 12:58:48 +0000
Message-Id: <20210211125900.22777-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Remember the PROT_MTE bit as PAGE_MTE/PAGE_TARGET_2.
Otherwise this does not yet have effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-25-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h    |  1 +
 linux-user/syscall_defs.h |  1 +
 target/arm/cpu.h          |  1 +
 linux-user/mmap.c         | 22 ++++++++++++++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d6ad774c015..09b9be845d1 100644
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
index f98c1c1c8de..46a960fccb4 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1311,6 +1311,7 @@ struct target_winsize {
 
 #ifdef TARGET_AARCH64
 #define TARGET_PROT_BTI         0x10
+#define TARGET_PROT_MTE         0x20
 #endif
 
 /* Common */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 72a0819eb8c..efa1618c4d5 100644
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
index 6690384752f..85e218ab1d0 100644
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
2.20.1


