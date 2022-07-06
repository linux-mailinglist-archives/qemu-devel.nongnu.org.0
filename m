Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BB568491
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 12:05:58 +0200 (CEST)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91uv-0004AY-NU
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 06:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PP-0000gk-03
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:19 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90PN-0001EZ-0e
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:29:18 -0400
Received: by mail-pf1-x436.google.com with SMTP id l124so3362423pfl.8
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5mZq3bLmgR4W3ojlh5flFpHwO5JLZ2jR/5oQWHxRX4=;
 b=aJbtbWGJ4wDrX08kMCxatCLxTWr0AmegWwF37SqXrrt/KJiGraCsoGkQqWJ45aHnR8
 Ji288xnFdQtHKaQj4KT4P4h+Gav3DLu6Fom1GOIzoH1jHvNJwhhKFNbXmRxhAe8S7jWx
 NmWyPUDQfiQDc4zb+flbYzgK5Ko4pJ2ulNS4wNKabNMnmBS92+gqMk8dN/HQHg8PgOZv
 ejo3XJ2zhYtV95lF+SxhVv0wD4jN3RutTh27YTQg8QmlQxNeRNYat3WTgAe3uVK0K1Ph
 yd6jP/jRSbWPv3s0pWzk+/xdPxuVoZ82U0PJq50EsbuGeTid91ng0oVPVfz60scPLoGP
 UAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5mZq3bLmgR4W3ojlh5flFpHwO5JLZ2jR/5oQWHxRX4=;
 b=nmbSzs5Lk6JdCySPqroVve46Ph6HD42637foVAUiaErzhatc38mkI+r2TY6GqukENf
 aQqHJtn8Ku9Yk57n6jg52bZJBsGWa0wIW7Vsibjgl9ZoXrcgzJIlLh2R6mxLPPTuY7aL
 eNcsBbxfQvRA3Lv8nQVqEbEZjAsf0QXBzn5HcbaTz384sAjaZPJ9VWR3xVFyc8P+FA/A
 8YAVS462slniEo9y+P9UlqdzQ1W99UoHxmnJlatkis4fa2n9PvW9loMSHXgCxINrhyML
 /i033ARxBJQBxwh6JZFG+afGz3U18uCyGWwbnp4kdcSDz41f6WFvgqEJ2828Bjuv5JHQ
 PLVg==
X-Gm-Message-State: AJIora/CrorFevQNoKioJNvS7sFFOhdIJszOK6tBAub3PNySWDFz0kIo
 uNK8HvXOJKOeeaF1Rf8GaQZ+Fo6wtFwE5KoK
X-Google-Smtp-Source: AGRyM1tAbTIYhBsIiaakI2aJ6aC01fyuvvbN1MU8CvRsYuRLj/27P/1lqRD11FIEh8sOZskQlsS+OQ==
X-Received: by 2002:a05:6a00:a26:b0:528:9831:d935 with SMTP id
 p38-20020a056a000a2600b005289831d935mr7032819pfh.25.1657096153404; 
 Wed, 06 Jul 2022 01:29:13 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b0016bdf53b303sm6700529plh.205.2022.07.06.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:29:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 42/45] linux-user/aarch64: Implement PR_SME_GET_VL,
 PR_SME_SET_VL
Date: Wed,  6 Jul 2022 13:54:08 +0530
Message-Id: <20220706082411.1664825-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 linux-user/aarch64/target_prctl.h | 48 +++++++++++++++++++++++++++++++
 linux-user/syscall.c              | 16 +++++++++++
 2 files changed, 64 insertions(+)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 40481e6663..f8f8f88992 100644
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
@@ -49,6 +51,52 @@ static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
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
+        vq = sme_vq(env);
+
+        if (old_vq != vq) {
+            /* PSTATE.ZA state is cleared on any change to VQ. */
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


