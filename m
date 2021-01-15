Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA0D2F8925
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 00:08:03 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0YCI-0004ev-Bz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 18:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsH-0003i9-MQ
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:21 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:38709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs6-0005GS-NP
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 17:47:21 -0500
Received: by mail-pf1-x430.google.com with SMTP id y205so584029pfc.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 14:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHmvo/lrgkE+wi7yTJ56b6ape2S0MwV/XIHtk24Q15o=;
 b=PVQmPkDZuObSBMkVwP5TC2YbQzB6YZQzbNKRTYz3x3rJSlCRRm0EoPoK+HCBeT+qJr
 urbUWkSE4m9Gr4Fq/sWX64x07lVAHJRHqAU/GEXnEDERyNBHqEtxng4fF+kWGLJV8stJ
 /QUkhOlXkY0dwVqvr8yqRy5T6kUj2KzXKPBcmzGrtKOqOz0hq9dvKCD7+372kFaB3OyF
 /Jzq9QAh4+6pz8D7bvPvV7BO+GV/cdoBEKrLGwmZ17KQjOQEmEgBhlPl4yQzpQhWyin0
 TDppDi9gSmVa3mxyPXHEe4hCqFdmweQSGp2s08cMaBJUncCnCGcf5uBdgxrn8WtIGuFf
 oDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHmvo/lrgkE+wi7yTJ56b6ape2S0MwV/XIHtk24Q15o=;
 b=rKASMZn2r/FGW0i7bR86ZgeBUkHJGANhUqxx19TRV4Ax+U4vSjs2Ferv7+yIqQG/Fn
 F8vimgLJBEtoBdZbNfn/9BOrbvOAb3hgKwukCMnmIjhFLPxZE8M3z0alAVO1JdAZ0t8A
 ob4rXVnNm9m+TlLxvKXLnOnBEzN8AseSlIknhmRgVa4eCRzi4EhayydvX59E+uDKp2R/
 25IwAY2aE4TC2Zh/kyqK4OiV2j3QNWcUyKyEuokDyXu5fjUvnfi1RQrnPwvl4Bqckdt9
 K6nb6ts1f7/7a9I9Qm49NsIQrOZYvqpiaexuQBi0rGnbUPFSCHJ9SLlR6Sty0oBv0Von
 GlZA==
X-Gm-Message-State: AOAM531Thk+K+QA35mzWgAAW5Vt1bnIvVOm40w9Whb0Gb+K85TI+S/4D
 b1r6qQZEEijB0a33JToglvDuUe3q7IyI8nOv
X-Google-Smtp-Source: ABdhPJxmkzpa1HqLyKXo1jEv5PkeolzXJStKFycCgTA6yyzP8JJmhDKGRCZYd3He+DjMj8wNPnfT2g==
X-Received: by 2002:a63:d650:: with SMTP id d16mr14809092pgj.277.1610750829482; 
 Fri, 15 Jan 2021 14:47:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/21] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Fri, 15 Jan 2021 12:46:37 -1000
Message-Id: <20210115224645.1196742-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

These prctl fields are required for the function of MTE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  9 ++++++
 linux-user/syscall.c                | 44 +++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

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
index ebb4e2898c..0316497636 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10952,10 +10952,46 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+
                 env->untagged_addr_mask = (arg2 & TARGET_PR_TAGGED_ADDR_ENABLE
                                            ? MAKE_64BIT_MASK(0, 56) : -1);
                 return 0;
@@ -10964,6 +11000,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             {
                 abi_long ret = 0;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
 
                 if (arg2 || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
@@ -10971,6 +11008,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 if (env->untagged_addr_mask != -1) {
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


