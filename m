Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F7A3AD31B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:49:26 +0200 (CEST)
Received: from localhost ([::1]:52728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKUX-0004Cf-R4
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKC1-0001jb-Cz
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:19 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBo-0001Z0-9s
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id f10so3071784plg.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MOtcx8UXoEPFGOBT2e/rKGCkRm/dpzMLp9SnX27LvpM=;
 b=mcv4VK8fN8UZJ7lFtjj5B8HbT/akpiVAya9R9vyr5G1Xw0Md17FvMBF8mFcUox2lwc
 jPgun0nlsWZ7FUWhjrvPYrfxkNJ9pUG+1QJUawjHBA9PaGKdV3jfuFgQ1OD2w3w+rDD7
 kSWxi2NgzF+K+ruUv8sItoBBE6KtA8FahQe9uEGEifLNnn9WVf5wRb/u61F8gCy5/gbq
 QhCyGEvXOflGGQ9rvPrcqinhEyrSLtE0+wrkm5AKLeYZNLhUE3EBMuli2ywiVrggZ+xv
 yJrxrl8UqgW5o3yQh+co+DezTeVacWQhwxPRgwE/pk1qxyvYApGrMeRvS0Rd9jbOQ/uK
 s46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MOtcx8UXoEPFGOBT2e/rKGCkRm/dpzMLp9SnX27LvpM=;
 b=TgQPXiQfWHZuUpr84HoBqpJ76P2qRkIDm/W/R/YsptTBB4NPIqLRe3F9m6MVLQp2gY
 oOm7vJghbEIEbhLwpTdu368JvCFEpBSG7IayyAvPWjG/p9WVmlsSK0HTcTT2C7nRj3wH
 a+FBhqlHoHMdDS8YegQHHdGs6btaPTv1HmjMGfeVE37CqaJRMwk46yOeTmifbbB7be+B
 Xogh+lAH3V2xvc8bOAvkvamJLu7BOPVFQrHELaBuPCmkXnpXehCv080jMTOrBluSSFye
 BARjieQ29jp1gCmjWBnjw7MmruAKCW5DVRooiDn8zKh3R10iPhmggEcBEkFn3EZmBiao
 F+Kg==
X-Gm-Message-State: AOAM5317N6kzAU3GTCTScj++lNwluVmrq/4SnrhpUngz2nsxO1/5chj2
 nVxbfylAkE+6QVs2QLs/OQSjVd3g/aBQQQ==
X-Google-Smtp-Source: ABdhPJyEY9DlckdGVjSvpF5ErF9bbGgK+4kwn3d0fUxivLHVptmY5HWIxXEX8AYLhe164nGZ6mZD1Q==
X-Received: by 2002:a17:902:d4c8:b029:102:715b:e3a5 with SMTP id
 o8-20020a170902d4c8b0290102715be3a5mr6103064plg.83.1624044603042; 
 Fri, 18 Jun 2021 12:30:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/23] linux-user/riscv: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:46 -0700
Message-Id: <20210618192951.125651-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

This fixes a bug wrt libgcc fallback unwinding.  It expects
the stack pointer to point to the siginfo_t, whereas we had
inexplicably placed our private signal trampoline at the start
of the signal frame instead of the end.  Now moot because we
have removed it from the stack frame entirely.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/riscv/target_signal.h |  2 ++
 linux-user/riscv/signal.c        | 22 +++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/linux-user/riscv/target_signal.h b/linux-user/riscv/target_signal.h
index f113ba9a55..3e36fddc9d 100644
--- a/linux-user/riscv/target_signal.h
+++ b/linux-user/riscv/target_signal.h
@@ -15,4 +15,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* RISCV_TARGET_SIGNAL_H */
diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
index 9405c7fd9a..4086dfa5d5 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -46,7 +46,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -104,12 +103,6 @@ static void setup_ucontext(struct target_ucontext *uc,
     setup_sigcontext(&uc->uc_mcontext, env);
 }
 
-static inline void install_sigtramp(uint32_t *tramp)
-{
-    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
-    __put_user(0x00000073, tramp + 1);  /* ecall */
-}
-
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPURISCVState *env)
@@ -126,14 +119,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_ucontext(&frame->uc, env, set);
     tswap_siginfo(&frame->info, info);
-    install_sigtramp(frame->tramp);
 
     env->pc = ka->_sa_handler;
     env->gpr[xSP] = frame_addr;
     env->gpr[xA0] = sig;
     env->gpr[xA1] = frame_addr + offsetof(struct target_rt_sigframe, info);
     env->gpr[xA2] = frame_addr + offsetof(struct target_rt_sigframe, uc);
-    env->gpr[xRA] = frame_addr + offsetof(struct target_rt_sigframe, tramp);
+    env->gpr[xRA] = default_rt_sigreturn;
 
     return;
 
@@ -202,3 +194,15 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
+    __put_user(0x00000073, tramp + 1);  /* ecall */
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


