Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA123308188
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 23:54:58 +0100 (CET)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5GBl-0001jF-QQ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 17:54:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fze-0005hy-4e
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:26 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzP-0008BO-OF
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 17:42:25 -0500
Received: by mail-pg1-x52c.google.com with SMTP id b21so5277259pgk.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bvrCnDcElA75br2YmmksQwg8lUlxPa22qY4Fj6h+lg=;
 b=M0SbjigOnaVcix0YSJ9WpeivyMKfPUPSwXYyLXDBI4l6ARdj1qYWsQgn23n8/xgCkl
 EhW/1W58NUhWiKOLTavHBp5kplKDyi6rN+mozKwK3teETJ/andTw5UMaJuQn424lcFBa
 Whyj98QH2XRPMoYRKOscRyvzXK8HZPG/HJTEhgFbZVLhXosP0QhuChjL1Ze2b83CUafa
 HgSNRZn85T9mPtHrFtnsm6zUWDD/00HJQp4Oy7ezq16zihRJkvVO1pjgBpiQKdsBO6S1
 UzUgyaifN74wizJ83ZSX4OQ+SKYCqoaLNdg5J6TSkGyyeXhRWvEQRi38yNfDSjANJ/UT
 wdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bvrCnDcElA75br2YmmksQwg8lUlxPa22qY4Fj6h+lg=;
 b=XDGm9DFmvEQ3wlJd2c6wiC3vQv9JLWD9g2t6z9ReduQmCmbFdeRmJNtdEhMP1d5OYG
 1466qae5BZGjg5pQlvMF078SHUqsbp0n4fMfZ/oK9E7+z7qDY+SakszHYRNl6vVN/OZP
 c//Hr3+8XvbgJrhYhJiykm1R//WsHzAwk4D6WjP/eBToHFIAR++DI5PstCB7emBxhDZ4
 3GZ3BhYB5Z62tN1Ch0AZAqplulYj6QlkywUV+0ifqWJzlkGJo5zgFk8vSEbQwMfTym1N
 jJUIxs4Qw1vKr2MwLljJRZDIBsmlZ8HOb9itZ6MpqswLilYWiLcDHn34k9lWjiMjyXyU
 jhuQ==
X-Gm-Message-State: AOAM53101b+pEN0CKF8ksjkgzKf9kETH4pM3CGTMKGeUZzoFOFcmiZde
 tPmew/EHa5iJVUWrEQK7FiogxaL36Li55NQP
X-Google-Smtp-Source: ABdhPJx4MFmz2+5p+HE7YmUw9COPUHRFMgyvXkUW3yXsxyggLdLhrkbC8SQOQdTElGPdLPwEfR0Gjw==
X-Received: by 2002:a63:c441:: with SMTP id m1mr1512364pgg.353.1611873729575; 
 Thu, 28 Jan 2021 14:42:09 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/23] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Thu, 28 Jan 2021 12:41:33 -1000
Message-Id: <20210128224141.638790-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
index 46526f50b0..d645eb8f44 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10967,17 +10967,53 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
@@ -10985,6 +11021,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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


