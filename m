Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115041C59B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:28:31 +0200 (CEST)
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZdO-0006IC-8I
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIL-0007U8-4q
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:45 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:40664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZII-0006Oj-9O
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:43 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so2751710otq.7
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=igXJmqn/7DgNq/ZxMZ1fO4x5dU9AoiK2Jj8I6US3bDk/gRN77c3QL6ZJ/lGH6WW37O
 j7Shu1nv092Q7IaTpJ7/MGiia6dgmx2Ob0CkJwIMT2RR29rf5UVVSNoXSWFPoalnOPA+
 lXEshwcx3WhH7fYCaLiFex/eiphc4URWikKUSTrxeqniHsY+SvRrcmlZc1j5cbOebaSC
 /eCnPLEY3+axoL3wHWi8DccbiUT0I8SlO2ZAY9Tv/nJaAEdWGFELAowsFxYD5diIqKRN
 h2+3pj01cdA7NCE2Yf+hxR0SgL97V5OE/iBQCEoTorJWHmTLDOrw4bk4lu3hKvy0OhbR
 woxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=tG0rjXEtD2O5+EMHM2BspwudTOmokuGChJYb8W68WFIMmeimUd+utb2wNQ7KknYjwS
 kF8Y9PstGlp5My9WE7UWXLVV9lon8QCFLpNvVAmK7JdCJEdm35kW6Aj+3InauQNm2MPR
 R8cKjZKYEd2Hd+vPUgwktwfVcQAY0QVc1FUlt/tglyat/U8Laokv1P07oqsKoyZUXPSb
 FVDvz7bTp6Hl049xBxuO1yBRVWWM0C+DgTko3e8HeBUw5TI6w4g7zmEZ6SMOp/ght/e+
 KQ3gzpZQ9+DnP4FTMVw6WTHT8LeGpzKgeT3sRwGVg8+TEUWMZnE5loOKEBYGuGNiAdMR
 jQmQ==
X-Gm-Message-State: AOAM533DkTsGlRr/CppxVZbXyBhVbgirKrVczJKVdzPMi5kLpbVcMB6p
 vHo8+ouVZwnqWka40oQ4IIZlDndVjotp8A==
X-Google-Smtp-Source: ABdhPJybKFeNXaCB6L92PlGBIMMpdBoibEAnnnFZUK75otU4Ycr1OENIAZBwjr/6hHvEpNWQ+TIfLg==
X-Received: by 2002:a05:6830:11c7:: with SMTP id
 v7mr9985289otq.355.1632920801162; 
 Wed, 29 Sep 2021 06:06:41 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/26] linux-user/riscv: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:47 -0400
Message-Id: <20210929130553.121567-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
index f7f33bc90a..a0f9542ce3 100644
--- a/linux-user/riscv/signal.c
+++ b/linux-user/riscv/signal.c
@@ -47,7 +47,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    uint32_t tramp[2]; /* not in kernel, which uses VDSO instead */
     struct target_siginfo info;
     struct target_ucontext uc;
 };
@@ -105,12 +104,6 @@ static void setup_ucontext(struct target_ucontext *uc,
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
@@ -127,14 +120,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
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
 
@@ -203,3 +195,15 @@ badframe:
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


