Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F13667032
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFum2-0002vp-R0; Thu, 12 Jan 2023 05:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulk-0002tY-FY
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:12 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuli-0000QN-P8
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:25:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11391173wma.1
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8CuYXoXmL7ijt24wyfbq14oA67+HiirVzpTtqD3Youw=;
 b=qXH6pT4WCtj0i/rwINa5zec6fTTDvu8HOhmfPdwZZmq1LxcOE1NWLaZfaGCFFNfr7g
 //d2syim3zV3loqCd2wOolXc0fPzQ1ascdIw/4/b/BcAnS1n7N5G5HB7apFhrtroY5WJ
 JZpIl+ZuVYkrp8O0GG/f3diOieAkrVMOcPusASUeVpQ7gvQ3G4NI9j5FHPJnK/b/Vdz8
 PKT+pAux546BeGtuAoR13tRrr/unaYNY0w9fvvCi+nuH4s+6rPN6Wamhze2p6S9Vm0nX
 KXWiC1d6qXK+V6Qw4gTjoZzNVvJR463CrX95RiQxhZ+aRAy/9JOr3eWhLjo/nfSQryJ0
 HJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CuYXoXmL7ijt24wyfbq14oA67+HiirVzpTtqD3Youw=;
 b=wkhbNnChIP0qRxMIQhEHOapSppc8jUEWkT+JcQgszTGpUywD0blOnBMPPlsLiJf+Td
 5vsByzKX1g4DMroaAofIrFMBLAU6RN8YtLgLAwlQG/dYB9lxS+kyTv0vOptWwcaV3xA3
 e/3zIh41OzzR//h9SPLeI3M/BX7QNKnC+kf+FopdD3ENb5tnlAyn/QGUFP5E7uZgi/1R
 /RwPyyLWlfZoBxZwM6XO5Ee07aHhWFu4RO9ZCAbp7HN4rlI4leosXwLd1/7IZ7WVT5Ym
 mqCvYUrvrmuPTkk0B5x3zkjpyKxQ+tz8uhN/njIJLUMXSnfEwEKxvGCBQJKWcZ/K8r96
 CDCA==
X-Gm-Message-State: AFqh2komMyPZwjVDu9hU8bqXM5QxNcDgUbm8Nrj21R9+3w7uGz0BJxYV
 Fm7ZaVd83oX0zf8FsFTu3Wl9tVROKyNDSZDm
X-Google-Smtp-Source: AMrXdXv0E740Gj4zdeLUgO1PDeboLfRNoq3S1aRClHrMOo1bSJCzY2cw23+UgfwQcHpdOk5fFrVFkA==
X-Received: by 2002:a05:600c:5399:b0:3d9:c6f5:c63d with SMTP id
 hg25-20020a05600c539900b003d9c6f5c63dmr23428536wmb.28.1673519108795; 
 Thu, 12 Jan 2023 02:25:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm5246655wrf.95.2023.01.12.02.25.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:25:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] target/arm/sme: Rebuild hflags in aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:35 +0100
Message-Id: <20230112102436.1913-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 8 +-------
 linux-user/aarch64/signal.c   | 3 ---
 target/arm/helper.c           | 6 +++++-
 target/arm/sme_helper.c       | 8 --------
 4 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5e93d27d8f..2e2f7cf218 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -89,14 +89,8 @@ void cpu_loop(CPUARMState *env)
 
         switch (trapnr) {
         case EXCP_SWI:
-            /*
-             * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
-             * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
-             */
+            /* On syscall, PSTATE.ZA is preserved, PSTATE.SM is cleared. */
             aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-            if (FIELD_EX64(env->svcr, SVCR, SM)) {
-                arm_rebuild_hflags(env);
-            }
             ret = do_syscall(env,
                              env->xregs[8],
                              env->xregs[0],
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index a326a6def5..b265cfd470 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -667,9 +667,6 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
 
     /* Invoke the signal handler with both SM and ZA disabled. */
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
-    if (env->svcr) {
-        arm_rebuild_hflags(env);
-    }
 
     if (info) {
         tswap_siginfo(&frame->info, info);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 26c3bb4cdf..cf77bdd378 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6735,6 +6735,9 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 {
     uint64_t change = (env->svcr ^ new) & mask;
 
+    if (change == 0) {
+        return;
+    }
     env->svcr ^= change;
 
     if (change & R_SVCR_SM_MASK) {
@@ -6752,6 +6755,8 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
     if (change & new & R_SVCR_ZA_MASK) {
         memset(env->zarray, 0, sizeof(env->zarray));
     }
+
+    arm_rebuild_hflags(env);
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6760,7 +6765,6 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
     helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
     aarch64_set_svcr(env, value, -1);
-    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index e146c17ba1..3abe03e4cb 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -31,20 +31,12 @@
 
 void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
 {
-    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
-        return;
-    }
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-    arm_rebuild_hflags(env);
 }
 
 void helper_set_pstate_za(CPUARMState *env, uint32_t i)
 {
-    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
-        return;
-    }
     aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
-    arm_rebuild_hflags(env);
 }
 
 void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
-- 
2.38.1


