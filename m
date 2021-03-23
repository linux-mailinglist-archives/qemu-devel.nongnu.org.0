Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9034660E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:13:20 +0100 (CET)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkal-0006Ye-1S
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHV-00079c-J8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:43956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHQ-0002sN-J1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:24 -0400
Received: by mail-ej1-x634.google.com with SMTP id l4so28230808ejc.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v3+N3f7Vb5LczvXguqdRK6CVvsl+Jz1NumKys/F46gk=;
 b=IHvjoOh0qOQbXkZhanMx3eINjR1OcDBjlMqs52j2DqXXlQLqbyzqMo6uceSgBf06tj
 viicKdo+lMIAa4wcFS413/6jl30fQXFb+4ImLshxwtXTBc7TFsOVQj5WdrZ5idQSE11H
 qfSkIVcuKHGnjst8zDJiUqh4ldhKd/txPHrGQ4u7GH3HAiRQ+dbtpBMeM53MMgb9bd8X
 gpNNAJRfO9J8essj/K1VWuztfvKBZIteoGk9GQg0mDFnbmE/n0PWXQ5VY0ljN13eLM+Z
 oqCpbqCsl3MCemw5Dpj051VVGgWMwC+0xYKRv2NTE+hmJ5UvRKZwdcQfs8Gd+zJe5vKp
 BzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v3+N3f7Vb5LczvXguqdRK6CVvsl+Jz1NumKys/F46gk=;
 b=HkXs7LVK4MJWkW3Iq+pgy7JY8Hpt8LsIfZpfgL/dBpLzSV+3g1fNPrJ5zNDpwnpjt6
 Fjaim5Hd1UdUZHF0b7jIoFcj17bVFoG2VEnTr/mBe4VXueUu62fy+Uq+Q9bHpT/m6lyY
 OAj71srHK/ghrsYoYvpQB3nx8bR98jYkJurzlXeYX4kVf6ZimZd+Y7NDkus0IKbz78Qq
 /s3BXszribiCzKRZ/DpZnQvbxNiq3+3+hf1FKmK7KmMuKCc/wmMh+WpiY3tvHddyoepk
 uFbgK+6ceDKNs1JzT1+QeL1VF2j4Gl/eTubXf0LWgwiGUmjuBJyRoe3EKbtjuauTOxuZ
 hB/g==
X-Gm-Message-State: AOAM531Tgjrl8q7ye+x4RuboBxZ7K1SkDGXZgzcGYXIgsABH16gBXc2O
 nGWYzS53TxnLve1TIrZ4RKOKr8/yRXeD5BpD
X-Google-Smtp-Source: ABdhPJwK+k8G+jY7R+BHpJRUUr0XHviyLwJgo/ObjvEm+uNwKhdRoWhdR5TK73FfIpEATcGJKM1iiQ==
X-Received: by 2002:a17:907:20f5:: with SMTP id
 rh21mr5993495ejb.27.1616518399242; 
 Tue, 23 Mar 2021 09:53:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm11282391ejx.60.2021.03.23.09.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B67711FF92;
 Tue, 23 Mar 2021 16:53:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/22] semihosting/arm-compat-semi: unify GET/SET_ARG
 helpers
Date: Tue, 23 Mar 2021 16:52:52 +0000
Message-Id: <20210323165308.15244-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>From the semihosting point of view what we want to know is the current
mode of the processor. Unify this into a single helper and allow us to
use the same GET/SET_ARG helpers for the rest of the code. Having the
helper will also be useful later.

Note: we aren't currently testing riscv32 due to missing toolchain for
check-tcg tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210312102029.17017-3-alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-7-alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 56 ++++++++++++-----------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 94950b6c56..0f0e129a7c 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -767,15 +767,28 @@ static const GuestFDFunctions guestfd_fns[] = {
     },
 };
 
-/* Read the input value from the argument block; fail the semihosting
- * call if the memory read fails.
+/*
+ * Read the input value from the argument block; fail the semihosting
+ * call if the memory read fails. Eventually we could use a generic
+ * CPUState helper function here.
  */
-#ifdef TARGET_ARM
+static inline bool is_64bit_semihosting(CPUArchState *env)
+{
+#if defined(TARGET_ARM)
+    return is_a64(env);
+#elif defined(TARGET_RISCV)
+    return !riscv_cpu_is_32bit(env);
+#else
+#error un-handled architecture
+#endif
+}
+
+
 #define GET_ARG(n) do {                                 \
-    if (is_a64(env)) {                                  \
+    if (is_64bit_semihosting(env)) {                    \
         if (get_user_u64(arg ## n, args + (n) * 8)) {   \
             errno = EFAULT;                             \
-            return set_swi_errno(cs, -1);              \
+            return set_swi_errno(cs, -1);               \
         }                                               \
     } else {                                            \
         if (get_user_u32(arg ## n, args + (n) * 4)) {   \
@@ -786,41 +799,10 @@ static const GuestFDFunctions guestfd_fns[] = {
 } while (0)
 
 #define SET_ARG(n, val)                                 \
-    (is_a64(env) ?                                      \
+    (is_64bit_semihosting(env) ?                        \
      put_user_u64(val, args + (n) * 8) :                \
      put_user_u32(val, args + (n) * 4))
-#endif
 
-#ifdef TARGET_RISCV
-
-/*
- * get_user_ual is defined as get_user_u32 in softmmu-semi.h,
- * we need a macro that fetches a target_ulong
- */
-#define get_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     get_user_u64(arg, p) :                     \
-     get_user_u32(arg, p))
-
-/*
- * put_user_ual is defined as put_user_u32 in softmmu-semi.h,
- * we need a macro that stores a target_ulong
- */
-#define put_user_utl(arg, p)                    \
-    ((sizeof(target_ulong) == 8) ?              \
-     put_user_u64(arg, p) :                     \
-     put_user_u32(arg, p))
-
-#define GET_ARG(n) do {                                                 \
-        if (get_user_utl(arg ## n, args + (n) * sizeof(target_ulong))) { \
-            errno = EFAULT;                                             \
-            return set_swi_errno(cs, -1);                              \
-        }                                                               \
-    } while (0)
-
-#define SET_ARG(n, val)                                 \
-    put_user_utl(val, args + (n) * sizeof(target_ulong))
-#endif
 
 /*
  * Do a semihosting call.
-- 
2.20.1


