Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAD0677CBB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx00-0006Aa-Bp; Mon, 23 Jan 2023 08:36:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwze-0005xz-Tr
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzb-0002Rk-GN
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso9123868wmn.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IeF7jJTB/G2ZdwYbP4k411cz0vGAuT9uWrSxSGjM9fc=;
 b=zfCG6HNrHIIzntEHcbjfgW53hdjauA9FhrnSmDQJIxbor6sEzh6oOQM6Xf7YS31mvC
 E0UARUp5PPc0K0YIr6IAlwzHOsRA88hwCphaQrbPWIZ81SXcaf7+erCD6+Dhqlnt/DRB
 M734cdpPf1UmrqFeR6c/DlazLuUSwhD/NjYHmRv+PYvkYeNGsV19hW6Sn8p/wRk4vJoZ
 8BYXXn0xe67KJwWHSOLTZYxyorQ4g+wXf3cm7RA0ateMBJJQN3CXBqtwR2k2lLNuo3ip
 hhBvTwL5s4iLCnjAllJ5hrRpjvcbubRRgojfs5N5gwiCXub0Fkf52BxFxN2o6BPWyqJ1
 7fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IeF7jJTB/G2ZdwYbP4k411cz0vGAuT9uWrSxSGjM9fc=;
 b=JKvxZT8Sa6a4trmYlOvT3l9HlkJY/0nTtR0OjWGZAzdJqJxWwnPDv6z0Uoz1CtPVt0
 E1044bprrH29WYWflGAszp4Nvv7BxsFvhJQ2li+LsKd5UUpeyo/Ktj9hT6phS3NX/qma
 xo/VnxnIqUSV/UTGOyztLQgR4PU9Q5WFAMeViHYVSC/v8vpZVoQXfKCJGDWThYoqpmuG
 qfUYPEYoSzT1xKaVPDtstcKHdQcpYNaorp7L6ByrVIaRBjRbK3JCrU2+xuzkmIYd85jc
 M8/RglCSkInq5Wf2wxgnAMusoDinvVleVpRpgGknPQBzaivrTVcV4Agqh4VnCTvb/wn8
 nGYg==
X-Gm-Message-State: AFqh2koUs1bqds0OlTbDUopT+bg0YxLz48votm2XDMTHtfMjSUOOQTNw
 hruK4FTWjl1kaVuoCCqEsxFxYl9sOrCji07g
X-Google-Smtp-Source: AMrXdXvajyFKujbvjSSuoX6u1RSzarGV+EO/V8TGludsemNFYMboVDS5QsmaPCRRMm+d835v6UcqeA==
X-Received: by 2002:a05:600c:5d1:b0:3d0:761b:f86 with SMTP id
 p17-20020a05600c05d100b003d0761b0f86mr24220974wmd.28.1674480969259; 
 Mon, 23 Jan 2023 05:36:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/26] target/arm/sme: Introduce aarch64_set_svcr()
Date: Mon, 23 Jan 2023 13:35:42 +0000
Message-Id: <20230123133553.2171158-16-peter.maydell@linaro.org>
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
Message-id: 20230112102436.1913-4-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h              | 1 +
 linux-user/aarch64/cpu_loop.c | 2 +-
 linux-user/aarch64/signal.c   | 2 +-
 target/arm/helper.c           | 8 ++++++++
 target/arm/sme_helper.c       | 4 ++--
 5 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 1feb63b4d73..ef61849eb1d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1123,6 +1123,7 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
+void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 9875d609a91..d53742e10bb 100644
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
index 6a2c6e06d28..b6e4dcb494d 100644
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
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 22ea8fbe368..24c069b8acf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6725,11 +6725,19 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
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
index b5aefa3edaf..94dc084135d 100644
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
2.34.1


