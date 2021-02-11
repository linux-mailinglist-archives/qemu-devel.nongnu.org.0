Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB9318C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 14:40:53 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lACDE-0007Ft-UI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 08:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZJ-0008O8-LJ
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:37 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lABZA-00005c-9l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:59:37 -0500
Received: by mail-wr1-x42f.google.com with SMTP id n6so4073286wrv.8
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=T4551kNNJ3EgbP/hZlRobuhumCTtrfNVFzhtY4opKq8=;
 b=ozsbo/EXSbZs3jt0vrfFdAj2DoaaoN6TMfT0vhbcWad7gIbnVjVmwjpS6DWAdxSVRv
 UmN/R/4OWQ4+UU3EWwtoCunp/QS9Dbjcm0Iq97efHLiRrOsAAu6oFCrp43Zzwd4Bg+yE
 PZLytWvxzI9KGc3BQ/+3WRKQF9E80D2NGjqSjchoFGiJOL81RKd5HSTzjHMLAH3nXkvm
 s6UbTd1trZG/o28k1mAocluTn3bSRrm1YnLuyMsK9KwxPKFDb4cRp9egXiMz2we0MmHh
 o3tw+HJMO53ERzvJVkgMl7dRTe6reXWzVPoYpFAk7fDy6Cuo25LGs19eZ1P2X5G9US/V
 aK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T4551kNNJ3EgbP/hZlRobuhumCTtrfNVFzhtY4opKq8=;
 b=pZGFgBTMYZetEpSO6Ga1TJLi0ke+NH16L2fcT4tYPvPN5Qs99QS/HGuyV/nka4hFXe
 wG9D+vNOY4tHJeEskKn6ACyDdi/H49/9rE230pIHU9BGTH7nvDvC2SqMTGKs+VvDVuM/
 IkIc9QFJJJ5HuU1HPA/4EbYnPg/TvDe9/fJG/axkuKDCigD8PknsVDeJINb+3EJujTbm
 gRLrNYsoWoXfS+7PmjfiqM8OoZChOPUAUSu9SrkytOR9xu5JBmQVNjMQN1RJOAkc7pjR
 CvbpCvoGmIJ+6tPZr/LFgaR9yOE/0siEyp64XR0lttwxu9U0snMa/GO2K8Tj95LBmLX4
 04dA==
X-Gm-Message-State: AOAM530TROPwt/vLPve/Mg/2Q1K4nHm1lAeqS4qWtZmnsEhDcsKDe9C+
 uVAd1m3TK0etLY4dNv4m5ObzDRuzjqDPAQ==
X-Google-Smtp-Source: ABdhPJzF/HDn9+b93CGZ5cN6Te2lCzCdv3euRCe25i4few/hm3Ck/UfqF9iqMENvt54VmVEOULhQXw==
X-Received: by 2002:adf:808c:: with SMTP id 12mr5640005wrl.139.1613048366800; 
 Thu, 11 Feb 2021 04:59:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g15sm4955716wrx.1.2021.02.11.04.59.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:59:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/45] linux-user/aarch64: Implement PR_MTE_TCF and PR_MTE_TAG
Date: Thu, 11 Feb 2021 12:58:47 +0000
Message-Id: <20210211125900.22777-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211125900.22777-1-peter.maydell@linaro.org>
References: <20210211125900.22777-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

These prctl fields are required for the function of MTE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210210000223.884088-24-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  9 ++++++
 linux-user/syscall.c                | 43 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 820601dfcc8..76f6c3391d3 100644
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
index ba4da7f8a67..61bf6148e7f 100644
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
2.20.1


