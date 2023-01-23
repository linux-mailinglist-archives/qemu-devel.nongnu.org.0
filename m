Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F298F677CBF
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx00-0006AM-8G; Mon, 23 Jan 2023 08:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzg-0005zl-UH
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:21 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwze-0002Mo-LB
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:16 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10640388wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kMExk8W8eDEbzmTmN5tKGDb7IruksybidHcjv8e9z20=;
 b=aMbpEDtpMrHRlm8Z5xI6nRy+3a8A/z0IbOWvVXKuAvu6vbJxt8ZX+Dfjyczq2L4aYt
 YGsDe+/BGgLqw3zNS0Hv7GnXPwjrRDgqGF0+Gqnpc9kiADuRajfJErJj9gTwMIWcas5+
 PHj38PvMpEf46NSacH311Dje/2SV5S5+8r08P28dOyQ2cRw8MejKsnTxStTBA+sGCtxF
 lfUHrrRd0xZBZj7Vku8fKeUgb4zE/bAO4TRYwXsqw40QkSFMWWxzktiNcklJeMdnr0M3
 xRWrxZcbRg1qZSGu87sLssn8WhWvQ6XoyaZb/yWnffJkxIYyPtUohg2gmX8cGkx36k/o
 IuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMExk8W8eDEbzmTmN5tKGDb7IruksybidHcjv8e9z20=;
 b=CVs1aTzRH4UaaPObJMKzsG30+/BbIFcyOEZow+TJf8tOqZElOhs/kxpQ/duhVQWQEZ
 HSDdTVVE/4ykYDnpct5okn5d/04gMDT78n0hfSBRBHDMT3+nZqbGU1paPEy5hwLLmyYd
 Q57SGFTSf/tdcVT7oP+hnfuLOTZWva7hwFP67JMmffvQv3o9DGkMc7wLU00OXI7BuOgp
 MamuVY6rJRBLS+hVvGqG2wk4T89ZryIVsJiw1lksEk1YNY/BXwBZhZfkkGTzMwpBjwZR
 7d8jmZ9McqBuwhOihZ2pU0gKkFKb3IjdfDlf7zTaHX5+j68KonvSxsice7w4an03SwD9
 DCpQ==
X-Gm-Message-State: AFqh2krYUZDo8M7Cepu0JoWWCnRQKMwLoHLk+799gh2uQdeQ9/fSxo/H
 tNJ1DBrNAq2+JhVNL5SUSnqztRn5ll7S1rKv
X-Google-Smtp-Source: AMrXdXtA8k+PrTAr/fVRMPgl891Y78nVgYEoH/MoG+z4kHl2UuJ5ufSZf1l/aD2yW1oV1740/YgG4Q==
X-Received: by 2002:a7b:c4d7:0:b0:3db:2fc6:e124 with SMTP id
 g23-20020a7bc4d7000000b003db2fc6e124mr13158204wmk.7.1674480972023; 
 Mon, 23 Jan 2023 05:36:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/26] target/arm/sme: Rebuild hflags in aarch64_set_svcr()
Date: Mon, 23 Jan 2023 13:35:45 +0000
Message-Id: <20230123133553.2171158-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230112102436.1913-7-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/aarch64/cpu_loop.c | 8 +-------
 linux-user/aarch64/signal.c   | 3 ---
 target/arm/helper.c           | 6 +++++-
 target/arm/sme_helper.c       | 8 --------
 4 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 5e93d27d8f6..2e2f7cf2188 100644
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
index a326a6def5e..b265cfd4706 100644
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
index 564c5d93320..80779678499 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6738,6 +6738,9 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 {
     uint64_t change = (env->svcr ^ new) & mask;
 
+    if (change == 0) {
+        return;
+    }
     env->svcr ^= change;
 
     if (change & R_SVCR_SM_MASK) {
@@ -6755,6 +6758,8 @@ void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
     if (change & new & R_SVCR_ZA_MASK) {
         memset(env->zarray, 0, sizeof(env->zarray));
     }
+
+    arm_rebuild_hflags(env);
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -6763,7 +6768,6 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
     helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
     aarch64_set_svcr(env, value, -1);
-    arm_rebuild_hflags(env);
 }
 
 static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index e146c17ba19..3abe03e4cb3 100644
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
2.34.1


