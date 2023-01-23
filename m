Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666D7677CA2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx05-0006JN-9f; Mon, 23 Jan 2023 08:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwze-0005xy-U0
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzb-0002La-QQ
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: by mail-wm1-x335.google.com with SMTP id l8so9024032wms.3
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ClfwKQfwQPNiuEhLu9/OoLk23WFzZiEhdIdZyE3JTl4=;
 b=zMXytAplMMlhHTKcgA8ZrPuZ/KmQC3RGPKA6YBRJ3qGnOWZ81D2qUzR6Ntn0gRpWyk
 cCX71eR71q7rJiZrkw1oR60XpoucJy2D4aO1Z733a+EgrGXyPgbV25e0Q1QQCc4kc5Tm
 QKUKwvuIdUOrITl+mNIhqongisYuAvRlD6MJ+DbTRfqogEoIK533YcPMozuujVw73p3w
 KDAvU+WyQuvQ68DzTNM6H2HxlcPtUuwmkog/nxYYxLmjDIoUuOE9w1RxR0bcqCWtFKyB
 DYYKYr0rTkmdIoiR5XybUhQ9KLfVP4V16QJ/avBABia94Hdyp/dUJH7HC/XB4OTt2Ezy
 kUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ClfwKQfwQPNiuEhLu9/OoLk23WFzZiEhdIdZyE3JTl4=;
 b=6SFzJuToa6HLmG/Oze1cUUyVZYJeJ99TFgxTSXBOvCouhvHqkhZ65SFr5vR+PRWLTN
 7kLNg1cvhRfNywjxdZXHTkvy8KbkmcpIdOYaafDkU08dpSTATGOqJzFS319tz9KHpAIQ
 0gbWhVClqwGYhCt2oAqlak2bnEMiPJFqfnjDrJomAiZPy1O0rM8d/ZeSyDz+GbEPYu1p
 5r6c30/yPFW9bIxFyiFImVN1Rn5CeTTFoMBYLF5Hq7QtumQNKcbDfPTThN7//Ppu7Zqh
 w+3jlTKT9MFdUsQdeJZ6jyHCqT1kRJCrjc765HspF2w6dSMKf+z0fWkpQWyyo87hnaQc
 Lxdg==
X-Gm-Message-State: AFqh2kqmBBPs7fzClySGjEJgCx1nAfmytjoJo6p1zZ1jta8jkC7YBI0w
 i0/m5SlmEzYpQVPTB1xUtlpLGKPo/Qu7IkfX
X-Google-Smtp-Source: AMrXdXvRfFY9nQn2ozVnGZ+974ptMiwYCQuHyTaHes0WzQQtC8kW17TcaHvET6ahS29d88zPXqZahg==
X-Received: by 2002:a05:600c:1e1f:b0:3db:e13:750c with SMTP id
 ay31-20020a05600c1e1f00b003db0e13750cmr22355969wmb.29.1674480970076; 
 Mon, 23 Jan 2023 05:36:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] target/arm/sme: Reset SVE state in aarch64_set_svcr()
Date: Mon, 23 Jan 2023 13:35:43 +0000
Message-Id: <20230123133553.2171158-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

Move arm_reset_sve_state() calls to aarch64_set_svcr().

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230112102436.1913-5-philmd@linaro.org
Message-Id: <20230112004322.161330-1-richard.henderson@linaro.org>
[PMD: Split patch in multiple tiny steps]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h              |  1 -
 linux-user/aarch64/cpu_loop.c |  1 -
 linux-user/aarch64/signal.c   |  8 +-------
 target/arm/helper.c           | 13 +++++++++++++
 target/arm/sme_helper.c       | 10 ----------
 5 files changed, 14 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ef61849eb1d..f3ddc3b7793 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1124,7 +1124,6 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask);
-void arm_reset_sve_state(CPUARMState *env);
 
 /*
  * SVE registers are encoded in KVM's memory in an endianness-invariant format.
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index d53742e10bb..5e93d27d8f6 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -96,7 +96,6 @@ void cpu_loop(CPUARMState *env)
             aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
             if (FIELD_EX64(env->svcr, SVCR, SM)) {
                 arm_rebuild_hflags(env);
-                arm_reset_sve_state(env);
             }
             ret = do_syscall(env,
                              env->xregs[8],
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index b6e4dcb494d..a326a6def5e 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -665,14 +665,8 @@ static void target_setup_frame(int usig, struct target_sigaction *ka,
         env->btype = 2;
     }
 
-    /*
-     * Invoke the signal handler with both SM and ZA disabled.
-     * When clearing SM, ResetSVEState, per SMSTOP.
-     */
+    /* Invoke the signal handler with both SM and ZA disabled. */
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK | R_SVCR_ZA_MASK);
-    if (FIELD_EX64(env->svcr, SVCR, SM)) {
-        arm_reset_sve_state(env);
-    }
     if (env->svcr) {
         arm_rebuild_hflags(env);
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 24c069b8acf..0ac867c4119 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6725,11 +6725,24 @@ static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* ResetSVEState */
+static void arm_reset_sve_state(CPUARMState *env)
+{
+    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
+    /* Recall that FFR is stored as pregs[16]. */
+    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
+    vfp_set_fpcr(env, 0x0800009f);
+}
+
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
 {
     uint64_t change = (env->svcr ^ new) & mask;
 
     env->svcr ^= change;
+
+    if (change & R_SVCR_SM_MASK) {
+        arm_reset_sve_state(env);
+    }
 }
 
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/target/arm/sme_helper.c b/target/arm/sme_helper.c
index 94dc084135d..f73bf4d2853 100644
--- a/target/arm/sme_helper.c
+++ b/target/arm/sme_helper.c
@@ -29,22 +29,12 @@
 #include "vec_internal.h"
 #include "sve_ldst_internal.h"
 
-/* ResetSVEState */
-void arm_reset_sve_state(CPUARMState *env)
-{
-    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
-    /* Recall that FFR is stored as pregs[16]. */
-    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
-    vfp_set_fpcr(env, 0x0800009f);
-}
-
 void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
 {
     if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
         return;
     }
     aarch64_set_svcr(env, 0, R_SVCR_SM_MASK);
-    arm_reset_sve_state(env);
     arm_rebuild_hflags(env);
 }
 
-- 
2.34.1


