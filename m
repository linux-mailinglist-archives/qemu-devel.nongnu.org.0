Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DAB41A550
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:23:42 +0200 (CEST)
Received: from localhost ([::1]:34234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2mU-0002IY-1M
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qa-0004lN-HD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:04 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:36370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QX-0005s8-Bf
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:04 -0400
Received: by mail-qk1-x734.google.com with SMTP id p4so39282051qki.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=fVzrN5sc8Wx4Bzrx4XYYcPgRy2DMNcJeADA7BafK7q1Y9sHQZmCTVoAUzP7ass+CBW
 FL2ALGJbPCli3c6wb8w+BDGV3o4p3ezsuf6R2K2rQyV0W5FaOKI47ImvK0urTzuSFKTD
 bNTMrql7mgneDMFKdshFMu4tCWPWKsfShTZjJcvsm9FR8m3ry3H/Bn5U1TZPbkLJZyj3
 YNcoI0r+jGX4aHzqfbXGVL1r8LbCa8o2ZqJ1xItGEIFJjHZ3QiL2QUjdLCgbOESsKTij
 R6/n7FqYEfTBzfpWsc3bvFy2saP1Guc/10WP1rNJ3sKPqCl5Elsiuly4XX1OTOcjyaFt
 7Yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2KLcqQYFIaqI/6GBRBsTweGpPd52GQDyv8etIxbrli4=;
 b=q1HrOtLjWmuF/i/4/X8QPGTYK9vZYBAjsNPrMmhtVl4pfDNI1TuGVCkChK0abD4OYx
 tNUmYm3v3LnYroLPd+8D/joAVqyw++Fa2bDrISHjVADsBD4LlR/ndpf/kRf42QxqMwH1
 Ov4rcekzFoQ2MAITxA83qBzzNmUbgvbhecX4AyjOS1OVHaF4RNMeWDPgd4ooUimTnmrT
 sys+5oIkSWVOFoCS90/cYpThzdRsFr7a/Osrrv2rM/IAc9QBQJQan1IoYAFbm3uzu5VS
 Mfn7Pc2mRNfkEj64F5P9E/Uor+QsR0meMTV+sPQ4ayKDM+D4k+Ym5YyX/cUqJ7hm5ufP
 +bsA==
X-Gm-Message-State: AOAM530UWBKX1LyLqhdcKAbWOmbkHA19x/eG8JIxXNSsk9M9qs4GNu99
 BODKvzH+8jxL6swBDNbSsa72HJq+mEDvxw==
X-Google-Smtp-Source: ABdhPJy/ERSpiQG6KsIyqKCFKEULTRP2q5OtFo1BGZ/nQuBuzhDLL3saLY5xlvtHRL4kgy5TTlbMjA==
X-Received: by 2002:a37:2e81:: with SMTP id u123mr3200346qkh.156.1632794458932; 
 Mon, 27 Sep 2021 19:00:58 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/25] linux-user/riscv: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:34 -0400
Message-Id: <20210928020039.184412-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


