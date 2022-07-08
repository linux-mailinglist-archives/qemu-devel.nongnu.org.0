Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B993856BCF6
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:42936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9q1s-0006Hn-L4
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmu-0003Ta-0i
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:21:01 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmr-0003GB-V3
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:20:59 -0400
Received: by mail-pf1-x42b.google.com with SMTP id n12so23847334pfq.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QT+j4xhm70EdfcVhkO7HkP89Z4Z0asvpHZ6p48VqoaU=;
 b=ECNVhHBnuFyy5aiwg2TX0p1hNXUE5EYxY3DbXyf6GdMLR6hp6QTgGBtuVgnqG2lhik
 BxuYZzVOKZTlVqJesjt3yvu11wee2iA6BtFduqcYkXon8iLlxhzFQUT8PKCw5xUq5BNE
 dMgsVayrkX0cAUv5VYK2IUdzn2CCOKBx19aHunQxHg9y2sp4Dfkzl6brkPd6Sm/LSYPK
 x9hhuDPURI+6KTZUcjO/WKgu1zgEAZDG5Z6Zly2Z3/p4Tn4VIEjcIYDWkwV+HpzENOtq
 Ab2WGoG6VN+JAsnElg4KzSxOCNL/IVYMFHl2xQRJOZLIhiVr546jF0Ezpf0sE+r3HqJd
 E6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QT+j4xhm70EdfcVhkO7HkP89Z4Z0asvpHZ6p48VqoaU=;
 b=mpqVX4sWIdOf3UjcMydLTBUPA+LrnmS6voIRmNIxyfFfkMKRDdWfkFR/4Cos9tzck1
 esgggwL2ZR8l6WCCQ3zmdh/AmusBK8/nJSxpAlWlmqh5Nzl0S7MjVUXg1ljlS2JaclHb
 xyYQ1nCLlVi3fh/rf91iI8+w1iXf5T9B9eIWR9k5pVObJCjnQqPXS4z2APcNmcY26Er8
 IEOgscn5VvdEJIM8aW+wI7o0vk/GdVnW1/FJjB3qZUV2+K6UmeMCNpuFLecXKTtVZCSy
 QDOupZLExLy4w+0KL03g5wcVDEAFXLbp9/Be+AHjrwDBQc3FQEKwaILbcoeX9PyTJdzQ
 K63Q==
X-Gm-Message-State: AJIora8lMKqkpeCRNtoA1iyJkHjGdlBemSphvnEzqIa79wWkFNeXCYcj
 GGdxak335/0q8cm6p66DMQs0nGBHe+/IyA2R
X-Google-Smtp-Source: AGRyM1t0ynntIkCgcUySwSFCZc+nOSpuAT6SlMrPRqY+hMm7FhxL/GJ+AmAPZwlmsWWEfw4Axs+55A==
X-Received: by 2002:aa7:88d2:0:b0:525:92bb:cb3c with SMTP id
 k18-20020aa788d2000000b0052592bbcb3cmr4580572pff.2.1657293656425; 
 Fri, 08 Jul 2022 08:20:56 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:20:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Fri,  8 Jul 2022 20:45:37 +0530
Message-Id: <20220708151540.18136-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

These prctl set the Streaming SVE vector length, which may
be completely different from the Normal SVE vector length.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h | 54 +++++++++++++++++++++++++++++++
 linux-user/syscall.c              | 16 +++++++++
 2 files changed, 70 insertions(+)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 40481e6663..907c314146 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -10,6 +10,7 @@ static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
+        /* PSTATE.SM is always unset on syscall entry. */
         return sve_vq(env) * 16;
     }
     return -TARGET_EINVAL;
@@ -27,6 +28,7 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
         && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
         uint32_t vq, old_vq;
 
+        /* PSTATE.SM is always unset on syscall entry. */
         old_vq = sve_vq(env);
 
         /*
@@ -49,6 +51,58 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 }
 #define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
+static abi_long do_prctl_sme_get_vl(CPUArchState *env)
+{
+    ARMCPU *cpu = env_archcpu(env);
+    if (cpu_isar_feature(aa64_sme, cpu)) {
+        return sme_vq(env) * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_get_vl do_prctl_sme_get_vl
+
+static abi_long do_prctl_sme_set_vl(CPUArchState *env, abi_long arg2)
+{
+    /*
+     * We cannot support either PR_SME_SET_VL_ONEXEC or PR_SME_VL_INHERIT.
+     * Note the kernel definition of sve_vl_valid allows for VQ=512,
+     * i.e. VL=8192, even though the architectural maximum is VQ=16.
+     */
+    if (cpu_isar_feature(aa64_sme, env_archcpu(env))
+        && arg2 >= 0 && arg2 <= 512 * 16 && !(arg2 & 15)) {
+        int vq, old_vq;
+
+        old_vq = sme_vq(env);
+
+        /*
+         * Bound the value of vq, so that we know that it fits into
+         * the 4-bit field in SMCR_EL1.  Because PSTATE.SM is cleared
+         * on syscall entry, we are not modifying the current SVE
+         * vector length.
+         */
+        vq = MAX(arg2 / 16, 1);
+        vq = MIN(vq, 16);
+        env->vfp.smcr_el[1] =
+            FIELD_DP64(env->vfp.smcr_el[1], SMCR, LEN, vq - 1);
+
+        /* Delay rebuilding hflags until we know if ZA must change. */
+        vq = sve_vqm1_for_el_sm(env, 0, true) + 1;
+
+        if (vq != old_vq) {
+            /*
+             * PSTATE.ZA state is cleared on any change to SVL.
+             * We need not call arm_rebuild_hflags because PSTATE.SM was
+             * cleared on syscall entry, so this hasn't changed VL.
+             */
+            env->svcr = FIELD_DP64(env->svcr, SVCR, ZA, 0);
+            arm_rebuild_hflags(env);
+        }
+        return vq * 16;
+    }
+    return -TARGET_EINVAL;
+}
+#define do_prctl_sme_set_vl do_prctl_sme_set_vl
+
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
     ARMCPU *cpu = env_archcpu(env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index cbde82c907..991b85e6b4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6343,6 +6343,12 @@ abi_long do_arch_prctl(CPUX86State *env, int code, abi_ulong addr)
 #ifndef PR_SET_SYSCALL_USER_DISPATCH
 # define PR_SET_SYSCALL_USER_DISPATCH 59
 #endif
+#ifndef PR_SME_SET_VL
+# define PR_SME_SET_VL  63
+# define PR_SME_GET_VL  64
+# define PR_SME_VL_LEN_MASK  0xffff
+# define PR_SME_VL_INHERIT   (1 << 17)
+#endif
 
 #include "target_prctl.h"
 
@@ -6383,6 +6389,12 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_unalign
 #define do_prctl_set_unalign do_prctl_inval1
 #endif
+#ifndef do_prctl_sme_get_vl
+#define do_prctl_sme_get_vl do_prctl_inval0
+#endif
+#ifndef do_prctl_sme_set_vl
+#define do_prctl_sme_set_vl do_prctl_inval1
+#endif
 
 static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
                          abi_long arg3, abi_long arg4, abi_long arg5)
@@ -6434,6 +6446,10 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
         return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
         return do_prctl_sve_set_vl(env, arg2);
+    case PR_SME_GET_VL:
+        return do_prctl_sme_get_vl(env);
+    case PR_SME_SET_VL:
+        return do_prctl_sme_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1


