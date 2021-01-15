Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F02F88EE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 23:54:03 +0100 (CET)
Received: from localhost ([::1]:36906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Xyf-0001U9-4e
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 17:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsI-0003jz-4l
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:22 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:47050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsA-0005Gh-Pc
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:21 -0500
Received: by mail-pg1-x532.google.com with SMTP id c22so6905939pgg.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aw5WXq5wBceHp2TEFV1G5r+xP2Xi/95Oor9t7natYrU=;
 b=TRNBEliC4lszDOEMK8EhLcK6PoSmSf2epLNZnh2HMN0KHLfnhTYqIrg5n19LcnHcYO
 X5LWGeai2dFNEa0VW48kdSGco8lprPDs5g05WUS21cj7bkcbTQX5OoWGeT9YmP0sxTbR
 dqsZG/dpbjyGqD5/feVFHNc1x1m0h7q9SxvgcTaFuDh0BGkoJB4Y+n3uhjJgqXP5k6AI
 YkysG9Ymu7WKJDd6g+xNLrabt5lN0jKZurlA0IcO/aJiUGOidwv0cfC+7dVAsZLKvJu6
 z2xqcebGgWceNyEVlk7sgy5OSpozg7kH0XODl8pMqniBCKUwu0pKKyAV4JNtSGRhR+Ta
 OUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aw5WXq5wBceHp2TEFV1G5r+xP2Xi/95Oor9t7natYrU=;
 b=gqweyIDiR7mUqY2LiMs85+EIOwmogMFIIrEl1Ifs66TI3UGnMyShcOtttqJHwAfWTe
 34xKYi0iEKKPTFer3YaPvQHh4SuKip4a8SScpIg5riJigPDxqvZMfjpl0ndLD+V9t9Po
 yRXmZLdloBC3d11TP8YSqzC68qj82aQ2YUsrP0Aod8JglzRaylsSigyehKDTCOIsOCKt
 OLp55xHGhhFltaYLO5f82iUjjdN5rieULthsBjk+VINlwN7RmEsWNKGOmEW+0joj4sJm
 WEZDLAEYhD1sI0j2QOQheehl18y4g4eHl/1xlHXuhZk0ki7fqbSHgm8qlr/BaDYUNmbb
 xeYw==
X-Gm-Message-State: AOAM533KtHRmNJoE9/4eZ4uVyqd3r7YBsKLckIOCjQKfQz84UB4kwg54
 Gnac4oiW96Nq/HyGSPJrk6RPkC9/iB7Lozr5
X-Google-Smtp-Source: ABdhPJydAp/MPXTE4YA67A2AKhGy0uZJVWIbn5b0gsMOddc1djEHISEqIPH4zASAdVty4FpJPVHDNg==
X-Received: by 2002:a65:6152:: with SMTP id o18mr15053560pgv.392.1610750831231; 
 Fri, 15 Jan 2021 14:47:11 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/21] linux-user/aarch64: Implement PROT_MTE
Date: Fri, 15 Jan 2021 12:46:38 -1000
Message-Id: <20210115224645.1196742-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
index a00bfc2647..0d6bb1ff8b 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1311,6 +1311,7 @@ struct target_winsize {
 
 #ifdef TARGET_AARCH64
 #define TARGET_PROT_BTI         0x10
+#define TARGET_PROT_MTE         0x20
 #endif
 
 /* Common */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 6ddfd9ebe6..e14c9a6277 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3559,6 +3559,7 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
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


