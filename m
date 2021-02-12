Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284A31A53C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:22:32 +0100 (CET)
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAe1P-00079r-Hk
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:22:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVd-0001yY-Ri
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:41 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:56115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lAdVW-0007sG-O0
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 13:49:41 -0500
Received: by mail-pj1-x102a.google.com with SMTP id cv23so128735pjb.5
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=QInPpyI56lDEC3keQ2vTLLPCno6DcncV4Pv4C9v9XMN18wZlzbtejQkXaipycQcF1c
 lMF+DQWvlRS4hnc2dajKdZV93hT0/NxnbBAkaIu65mDNC8XJGVAwE8KKn7VGap55upvf
 8SMVLRLNvcI4SOfePvwBuTFk44Had4rh+9yO9zqpYGc6cOuQPWCQ32JLD7sLUmTmuic9
 O9Kv2qLyk8nta8+4LBm5Bmd7vXvJhBuFAoljQYxhM9xenwnf1E170BN3OnM0T7FpO8Qx
 n3PC0Z9LIxELCU42YqaVTp7k/FWGGxEuUa405RESXMS1ngk6MTKMnYSzCvTcnOIGUdEI
 bC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=rGXcpQheP/4KtrUThD+mIRqIe5uytCCv/ePSbRv5+rYeUgcLt5Ez3KsveW3brn9LrQ
 q66a+TRmnjcglokNrgCzl3crZD9QF/k67b5C+hlaXp058014xN+XFBo5B7CMZg87LvNz
 LdfwnGguoXMje9wgV/QRVgJbAu1gDG8mygAjjpT8jrmGFpDuJIwxj08b+TcIl2dDlKsJ
 PiKP1i4SKjSW9rBntIx3GTZm3/CT5PYPM2tnjkAK75Zawfa4VPSeoygEXLePgyWKJSs7
 QOQEjWkUPSDOZJ8QE3xTj8SDVvVU+QuArrLCXdFSOTf/R7wMsVvRIVGhda7QuXI84s0s
 27NQ==
X-Gm-Message-State: AOAM532zepmw3WyoWZhZLaVjMSBXFxBZcogVt/tIL3XAysZ1hXp8rOh2
 FUFPpmXcT7ljY4BnrBBIc2SdrLIlUoiL6A==
X-Google-Smtp-Source: ABdhPJyHoTb2II4aSAPTQA35lzgcTyYmdRwuFKUjxPhlLDNsShRnmW7lBhu9qE1851CImkQBI6B9Zg==
X-Received: by 2002:a17:902:d48b:b029:e1:f87:265d with SMTP id
 c11-20020a170902d48bb02900e10f87265dmr4140227plg.1.1613155773446; 
 Fri, 12 Feb 2021 10:49:33 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id k5sm9427618pfi.31.2021.02.12.10.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 10:49:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/31] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Fri, 12 Feb 2021 10:48:54 -0800
Message-Id: <20210212184902.1251044-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212184902.1251044-1-richard.henderson@linaro.org>
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

These prctl fields are required for the function of MTE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  9 ++++++
 linux-user/syscall.c                | 43 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 820601dfcc..76f6c3391d 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -33,5 +33,14 @@ struct target_pt_regs {
 #define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
 #define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
 # define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+/* MTE tag check fault modes */
+# define TARGET_PR_MTE_TCF_SHIFT       1
+# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
+/* MTE tag inclusion mask */
+# define TARGET_PR_MTE_TAG_SHIFT       3
+# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)
 
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ba4da7f8a6..61bf6148e7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10985,17 +10985,53 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             {
                 abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    valid_mask |= TARGET_PR_MTE_TCF_MASK;
+                    valid_mask |= TARGET_PR_MTE_TAG_MASK;
+                }
 
                 if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
                 }
                 env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    switch (arg2 & TARGET_PR_MTE_TCF_MASK) {
+                    case TARGET_PR_MTE_TCF_NONE:
+                    case TARGET_PR_MTE_TCF_SYNC:
+                    case TARGET_PR_MTE_TCF_ASYNC:
+                        break;
+                    default:
+                        return -EINVAL;
+                    }
+
+                    /*
+                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
+                     * Note that the syscall values are consistent with hw.
+                     */
+                    env->cp15.sctlr_el[1] =
+                        deposit64(env->cp15.sctlr_el[1], 38, 2,
+                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
+
+                    /*
+                     * Write PR_MTE_TAG to GCR_EL1[Exclude].
+                     * Note that the syscall uses an include mask,
+                     * and hardware uses an exclude mask -- invert.
+                     */
+                    env->cp15.gcr_el1 =
+                        deposit64(env->cp15.gcr_el1, 0, 16,
+                                  ~arg2 >> TARGET_PR_MTE_TAG_SHIFT);
+                    arm_rebuild_hflags(env);
+                }
                 return 0;
             }
         case TARGET_PR_GET_TAGGED_ADDR_CTRL:
             {
                 abi_long ret = 0;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
 
                 if (arg2 || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
@@ -11003,6 +11039,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 if (env->tagged_addr_enable) {
                     ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
                 }
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    /* See above. */
+                    ret |= (extract64(env->cp15.sctlr_el[1], 38, 2)
+                            << TARGET_PR_MTE_TCF_SHIFT);
+                    ret = deposit64(ret, TARGET_PR_MTE_TAG_SHIFT, 16,
+                                    ~env->cp15.gcr_el1);
+                }
                 return ret;
             }
 #endif /* AARCH64 */
-- 
2.25.1


