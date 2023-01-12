Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B573E66700A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:45:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFulY-0002mL-NS; Thu, 12 Jan 2023 05:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulV-0002lN-A7
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:57 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFulT-0000I1-LP
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:24:57 -0500
Received: by mail-wr1-x42b.google.com with SMTP id d17so17598655wrs.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgYSpkPWt3XJSKPRvFourSSz9p544s04F5BpIyvX9KA=;
 b=vPynf7WsrZGoepkqM84RvsX3vqjyfFUib2jQL+Y9NknK83R14sh7RA3hAbntDyXcFQ
 ZPn5ICY277BdgPxcTcma07klwB84ngeOzVjTlurWROOz9sTdiBHEvKnAMFLIZzD7UkBV
 eGsFdLuVxCGgy7FnzTwf2RcumSu/vE/BSIVoQAhBGuZzDCpzzeA750gPrUZpV+usBooo
 4Zc3WyT7S789BcVlBkagATSxrc/Uh4Sz5uMuYJmwSke6ArtME+/WfpU6588kJOB6SQ5R
 D/itwWP3/yedJOiA6NGkSkrrM9jlZd0+O+pHUNRbR9KpgBIBgP08c1NDlKB81c2FwbtH
 rubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgYSpkPWt3XJSKPRvFourSSz9p544s04F5BpIyvX9KA=;
 b=ZEYIl370Re6veKBPNiXTtiz4tuszNuPCec1aAqGWFQoTo/PYuwrx0ZYNy5XYFNoOhy
 KJt6x3TSmFuXZVZqLDGNJQLcwv5c4dEdXuPM2NXgZGe3wqG13vzMBG2NtZliS01+XiFc
 Tk23MfE+Z5+djba+xY5xed6HMSamO4Mae9OvG75E4u2srDZhw63a1sdcBb7P2rApbyYg
 KjAE73DUhlYTaTd5jqqwZw4Rw0T6AgXlAwmsFnDcjrATXtGDzei0lGzqBlNKyPh/aYEn
 D+Lq9K/E7jysT1BICTbY2IALWjezI2mXyBtLCR3TGZ3y4SjsaIikPZy++DKU7AvPZqjn
 102A==
X-Gm-Message-State: AFqh2kp37mhdAx9uC56PriLerGHfvyvxGvtbYg5r3CfLtjMGVQ5tJ8xl
 A5OlWyMhGheMzCY3Rtj2nVNpmmFPqFp+DvTi
X-Google-Smtp-Source: AMrXdXvS1ZKG5ictRWzdSjcsqRpq2YqN87pXb0DBRjNcqckBhzh5T8tIQxF8G++lotW0fwpLkqg+/w==
X-Received: by 2002:a5d:4692:0:b0:2bb:e94c:fcbf with SMTP id
 u18-20020a5d4692000000b002bbe94cfcbfmr10155989wrq.52.1673519093982; 
 Thu, 12 Jan 2023 02:24:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d62cf000000b002bbedd60a9asm10371382wrv.77.2023.01.12.02.24.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 12 Jan 2023 02:24:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/7] target/arm/sme: Introduce aarch64_set_svcr()
Date: Thu, 12 Jan 2023 11:24:32 +0100
Message-Id: <20230112102436.1913-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230112102436.1913-1-philmd@linaro.org>
References: <20230112102436.1913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
 linux-user/aarch64/cpu_loop.c | 2 +-
 linux-user/aarch64/signal.c   | 2 +-
 target/arm/cpu.h              | 1 +
 target/arm/helper.c           | 8 ++++++++
 target/arm/sme_helper.c       | 4 ++--
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 9875d609a9..d53742e10b 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -93,8 +93,8 @@ void cpu_loop(CPUARMState *env)
              * On syscall, PSTATE.ZA is preserved, along with the ZA matrix.
              * PSTATE.SM is cleared, per SMSTOP, which does ResetSVEState.
              */
+            aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
             if (FIELD_EX64(env->svcr, SVCR, SM)) {
-                env->svcr = FIELD_DP64(env->svcr, SVCR, SM, 0);
                 arm_rebuild_hflags(env);
                 arm_reset_sve_state(env);
             }
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 6a2c6e06d2..b6e4dcb494 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -669,11 +669,11 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
      * Invoke the signal handler with both SM and ZA disabled.
      * When clearing SM, ResetSVEState, per SMSTOP.
      */
+    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
     if (FIELD_EX64(env->svcr, SVCR, SM)) {
         arm_reset_sve_state(env);
     }
     if (env->svcr) {
-        env->svcr = 0;
         arm_rebuild_hflags(env);
     }
 
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bf2bce046d..0484da3322 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1123,6 +1123,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index cee3804354..b5626627a1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6722,11 +6722,19 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
+{
+    uint64_t change = (env->svcr ^ new) & mask;
+
+    env->svcr ^= change;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
     helper_set_pstate_sm(env, FIELD_EX64(value, SVCR, SM));
     helper_set_pstate_za(env, FIELD_EX64(value, SVCR, ZA));
+    aarch64_set_svcr(env, value, -1);
     arm_rebuild_hflags(env);
 }
 
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index b5aefa3eda..94dc084135 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -43,7 +43,7 @@ void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
     if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
         return;
     }
-    env->svcr ^= R_SVCR_SM_MASK;
+    aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
     arm_reset_sve_state(env);
     arm_rebuild_hflags(env);
 }
@@ -53,7 +53,7 @@ void helper_set_pstate_za(CPUARMState *env, uint32_t i)
     if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
         return;
     }
-    env->svcr ^= R_SVCR_ZA_MASK;
+    aarch64_set_svcr(env, 0, R_SVCR_ZA_MASK);
 
     /*
      * ResetSMEState.
-- 
2.38.1


