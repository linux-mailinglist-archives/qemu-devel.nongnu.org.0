Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE7831CE38
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:40:55 +0100 (CET)
Received: from localhost ([::1]:57996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3PC-0008O2-An
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC331-00005G-88
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32N-0002Tj-4c
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so9550489wmi.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mtFt4GTnUFYUkbwP0dxAxUN2Lj3X7xcqbst4yTE9EcI=;
 b=I348R5gol5UeZMYGaEcOIeQoDnLiQ9SgpXNY8F54dTSagw32YcIo2aIalXD03S90M6
 lLdCsbJtaELT1fwTbYK7xZygdBDrb6q2++AlxYgLx36DUTiVgd8TGN7S4335moQrJAP0
 lg44Lby+ZIP7LpRUEH59345MzlmHnJraRiLhHgOeGry8q5xiIc+u9sagArnzd16OATWr
 lASL1DqhL0MmPV/D9tP5GaGEXGCWQEfuDPpvScnNLPTyjHWG1QRFF6EH6AiNWurwaNcp
 qtbaLf2CerlhFLDCrUQOtJovZvc7ULyavqq4Uo+vunPFbCN0AWBQYP9EoG+7aJGgfXlo
 ykaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mtFt4GTnUFYUkbwP0dxAxUN2Lj3X7xcqbst4yTE9EcI=;
 b=CEUx6IxSUt5tmYMpd53r+k7MRS1WngDVWLTSrw81vrP0DULFYKh0ix5o69r6lt4Vkk
 WL2yFXX4zxONFpUYgM4f9AHKAbTHZvZ9pfT6izblfj9C8tNcdBIUUiCkcSL4tbiMERwz
 0VdvxWEE4vrhK+bM4PGFduRJ0ILHuEMobiE2LgE3Su0jPUAjzhIxaWEVoKAl6XfIUVxg
 yiIgGmPneTYWpyBMAOKuTwkgKpGi7ezHaykUsKbYdVKc84C664qyF2thI6kHX6PAggAk
 vBOuOP3g5+EozWl7L9b9SjeZcm+updzrU6v4JfPLyvMBkDo5SP7G3m6tqCIgp91PxU3/
 BLBw==
X-Gm-Message-State: AOAM531MyMoXe+2e3fZnZXDk/AS7hQ/sgAz0b3AQI2puxlP16jIb/1kS
 ZXOeyDrHbZX8MtfkBDrUFT12ryDmL7Unvg==
X-Google-Smtp-Source: ABdhPJzc+kL0Rwk8ZvjyQpDHp3NjE989Uxq291ZNCBpiYWbl8Y9SeoYexj9R83yVagsREWW3ENyZvg==
X-Received: by 2002:a05:600c:4c11:: with SMTP id
 d17mr3917521wmp.86.1613492237364; 
 Tue, 16 Feb 2021 08:17:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/40] linux-user/aarch64: Implement PROT_MTE
Date: Tue, 16 Feb 2021 16:16:42 +0000
Message-Id: <20210216161658.29881-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Message-id: 20210212184902.1251044-25-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h    |  1 +
 linux-user/syscall_defs.h |  1 +
 target/arm/cpu.h          |  1 +
 linux-user/mmap.c         | 22 ++++++++++++++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 937becd320a..76443eb11d5 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -276,6 +276,7 @@ extern intptr_t qemu_host_page_mask;
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
index 9fe0c634e24..7e3b2450368 100644
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


