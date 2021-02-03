Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A5330E352
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:33:41 +0100 (CET)
Received: from localhost ([::1]:60202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NuG-0008W0-Hq
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOz-0007bG-98
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001oh-Hg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: by mail-pj1-x102d.google.com with SMTP id my11so3796325pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=ZtbjJpXpy57+a65uZ9LnPatVYCxemrZm2Ci9dJNIT9Sn+5ZVzgefWAiCfR2UL37szG
 vvPbGDT2lJOv5cfqJ9DjFdljVQ7Q9NraHBS8Werf8IwBMZ4dtNcls+ku5RPtal9AMyDL
 W0OQgnkBzi1IMNa7v6rrBEEdMRbzJcbExy72i5kVVGi0QcMwHIBWy4wR0Ie0KEnyx/2S
 H0KO04s/kqn3WhDQjvipnVZhCXcdokNcGal/IJY8jZ7VW6pynrIJtiO9VyTg/1RHr21m
 5THzf8qr8JGpKstacQQqEBNJCI34CCa46s8UxuWytK7AHVH01eH5I+mlVNHrnX4H6EcF
 XBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=QDUdgXA4sYB+a02gQlJoHaZo2QB0rB4j/ILIOPQoN8FvuOHRAQzDlWpkka/M7KVIxx
 46t9QR2dzqEaMfSdJYIWz4192FcjlS5oDY42q+bjU95onHf7DfeYAHjs4cLFS07wgyOG
 TAmGTTKftSJszrRqYWzV93F6hdyH5UfhAeDlabAKGoLI1rjIHuvijV4E6EUgzxzyvQUC
 YTku1YTzQzJHgL7nomBkhQ3TmB+gBCzEdG1FvWnA/yRtp6ASiawrbOnBTAa3VOtyvcVf
 A9YUNpMBMkvm7Cf8KImctNx3aLoMoUJ4yHyyZIChAYTJSB9gaPIlUKfTj3+PfUFYeosA
 qbeg==
X-Gm-Message-State: AOAM530Xjt3fYrGOse2yJO4aXYGQW+zI97EMZZ3nN7685DCLkypnlHnB
 mwvPBJuJpC/dhdPZXC64ArdwPMcibYDsqST8
X-Google-Smtp-Source: ABdhPJx4HBxjTlu0+UNYbuNcZ31HaXrpmpTrBiMKoLZiuBwL6gO4akxAqFbhXz/rd7cu47S3IUxAzw==
X-Received: by 2002:a17:90a:7143:: with SMTP id
 g3mr4574392pjs.196.1612378861314; 
 Wed, 03 Feb 2021 11:01:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/31] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Wed,  3 Feb 2021 09:00:02 -1000
Message-Id: <20210203190010.759771-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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


