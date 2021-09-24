Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448B41797E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:12:52 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTokl-0008EO-Bo
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY9-0002xf-Jv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:49 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:36789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY6-000745-LZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:49 -0400
Received: by mail-qk1-x734.google.com with SMTP id p4so28962711qki.3
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=Ofmns6Nb9e8eLHBnOUOL6cJTd3Jelb2Ec+/aJPWv9iev7XxrAnLv7F1oDLJkUj4jdM
 KpWde5gdWj2Zo7rPrmCLkl5i9EHwBUrg7/KXC/CyXLnMPV95rg7oN9jexpr1mWVgRbcI
 7nVnQqy2YB0VJrLW4a7V9iR9WoV2omDtwn4FZqO9WuXWXsPXxFjges9TBL+L6jZrVYsq
 EkTfUmrndcM/HyQ9q/6fwYIIuUeKbs+1NAolQ39H1E1oGh5x845alwC7E/PVHkUda7zp
 5EzXV5gzrUOSw2VMhZj1C0T2zIuajgQZRDpbaif9/QaCy77eabFRVxhYgmYMuh0YFkqS
 lYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=CCahY8wS+eTQ0MvGmersg2vPuEF45dyWoLiAJmROT66oYI+do7GxT5bUnvxThSuPZx
 yh+I86oDgv6RHWzScDVCXB2Pe5mF4gn2z6YmIiXYKZXcCcYR2GEpmkPzjv0XVt62iy6W
 FYigLJEHjrcqC2Cwh7Af2NA+yB44VufhH9U6HpcDuUiDibKwKVmC/UoIjs2+9PNE2al8
 FySu+tgv3U0/Rz4Ljn+k5bOe+FHkGQvLGWL6IIU01UWuM/58a4LDoxM3U+qYNPj3J3AB
 GvL8h1kR3fUBrdBuWoDDjYqea5WTv7w99aePiB9I5kLdhlW0k+p2PsV9qGb7KNrzCCcN
 HZRA==
X-Gm-Message-State: AOAM5310myAJmTMHMEA93vLYWzEgmgUrpP55Flp1Zpkt+uiN4lrZdxOQ
 T0fGJeirC7HLy1O5P+6uUqQoywUXCxHg7A==
X-Google-Smtp-Source: ABdhPJztLkE1D8lfGRJl8AK7GK6UPn/Lfrr/QM7PJH5AyJauQLGcVDq/7e2eoqUFjccDniPOJTmz6Q==
X-Received: by 2002:a37:a54c:: with SMTP id o73mr11744712qke.334.1632502784749; 
 Fri, 24 Sep 2021 09:59:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/27] linux-user/riscv: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:21 -0400
Message-Id: <20210924165926.752809-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: peter.maydell@linaro.org, Alistair Francis <alistair.francis@wdc.com>,
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


