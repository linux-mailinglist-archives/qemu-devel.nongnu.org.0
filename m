Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7DE3A8E33
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:18:47 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKCc-0007ET-AE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6U-0005YP-1j
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:26 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6N-0008R2-LT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:25 -0400
Received: by mail-pf1-x430.google.com with SMTP id p13so887563pfw.0
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k8sLhy8Tk3/Nh9HPVnNqGAmDJY+BNsPgHKn8Ir5zPqA=;
 b=JTSRT/y++EdE06ADyMXo2HKU5arSf2ZhwAvCoVsYp0OuYb3WQ7My3gLumUuGb5SvW/
 ToHhzhE6cXG8cQHaCoIqthGa01fDUeUAEKiedg6h05rUllYecWrrBkUnicmRxwqde5RL
 L3zq47jkpeHBLtD1NaJMOgR1cM6RC5hwga+SP865c7jaGGKIGde+JPe8PaNUmGRhcjg1
 lJKANw0wxIn8AS1HNimjsTkOvn3M+cHJWg4/8cYSvj1ZuXMiuBAlkLwPZxypfXSRECbW
 EQ8AOjJJzza1hagt3D6AFdp6acPG4PgpiJuzBgOkQeGP26PSjYsIzX2+bQG0Tp9Kmc8Y
 tifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k8sLhy8Tk3/Nh9HPVnNqGAmDJY+BNsPgHKn8Ir5zPqA=;
 b=G2qx978XRNvdkajgdHKVioP1JLRydhtSbtMZp4pES1ypjyVafbb7aiEKxiCz/vkvfn
 CEOxPplHvVHsS4Mr+EjotCDEJSDLoNRR5D1SaHpCH47sXL+gSCd6CKX2dtlyqxS4tk4R
 4b/w9tsyYUHTKk+TGktabLhdWb5bY8P44zQVb9nkIwlp93mMb/MjfTlG/eNLVjUw/bMp
 lpGuW2eq/AVh4i4HqCxPY7sbbbFn+3eC45SmQ6NTXOeNhVMK6/2oevbxY2s9a+S4ZAwW
 dR8d1EgplYX115CoRrmZ2RgyOingSfW3yb4ll/6+f5zfL0X5XSyR8A+TipVeFP/CQzPf
 41vw==
X-Gm-Message-State: AOAM530q7PxZ/Sbk5pOOXC/4ogsuUwDNqBxNLVbLuxy0sqIHpQ/sgdTv
 sCYygm2oQs3+JF+79GsPTnfU4UWMqt7AXg==
X-Google-Smtp-Source: ABdhPJySORscet0neFRLwqNmhz5e3YIfdJRSqoxg236iu7JGoLT7NnujgPlvbW67jdxrlKEQcQIN1Q==
X-Received: by 2002:aa7:9ecd:0:b029:2fc:779:b187 with SMTP id
 r13-20020aa79ecd0000b02902fc0779b187mr5214378pfq.28.1623805938372; 
 Tue, 15 Jun 2021 18:12:18 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/21] linux-user/mips: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:00 -0700
Message-Id: <20210616011209.1446045-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mips/target_signal.h   |  1 +
 linux-user/mips64/target_signal.h |  2 ++
 linux-user/mips/signal.c          | 39 ++++++++++++++++++++-----------
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
index d521765f6b..780a4ddf29 100644
--- a/linux-user/mips/target_signal.h
+++ b/linux-user/mips/target_signal.h
@@ -73,6 +73,7 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
 
 /* bit-flags */
 #define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
index d857c55e4c..275e9b7f9a 100644
--- a/linux-user/mips64/target_signal.h
+++ b/linux-user/mips64/target_signal.h
@@ -76,4 +76,6 @@ typedef struct target_sigaltstack {
 /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
 #define TARGET_ARCH_HAS_SETUP_FRAME
 #endif
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* MIPS64_TARGET_SIGNAL_H */
diff --git a/linux-user/mips/signal.c b/linux-user/mips/signal.c
index e6be807a81..234f85905b 100644
--- a/linux-user/mips/signal.c
+++ b/linux-user/mips/signal.c
@@ -86,10 +86,8 @@ struct target_rt_sigframe {
 };
 
 /* Install trampoline to jump back from signal handler */
-static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
+static void install_sigtramp(unsigned int *tramp, unsigned int syscall)
 {
-    int err = 0;
-
     /*
      * Set up the return code ...
      *
@@ -99,7 +97,6 @@ static inline int install_sigtramp(unsigned int *tramp,   unsigned int syscall)
 
     __put_user(0x24020000 + syscall, tramp + 0);
     __put_user(0x0000000c          , tramp + 1);
-    return err;
 }
 
 static inline void setup_sigcontext(CPUMIPSState *regs,
@@ -211,8 +208,6 @@ void setup_frame(int sig, struct target_sigaction * ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->sf_code, TARGET_NR_sigreturn);
-
     setup_sigcontext(regs, &frame->sf_sc);
 
     for(i = 0; i < TARGET_NSIG_WORDS; i++) {
@@ -233,7 +228,7 @@ void setup_frame(int sig, struct target_sigaction * ka,
     regs->active_tc.gpr[ 5] = 0;
     regs->active_tc.gpr[ 6] = frame_addr + offsetof(struct sigframe, sf_sc);
     regs->active_tc.gpr[29] = frame_addr;
-    regs->active_tc.gpr[31] = frame_addr + offsetof(struct sigframe, sf_code);
+    regs->active_tc.gpr[31] = default_sigreturn;
     /* The original kernel code sets CP0_EPC to the handler
     * since it returns to userland using eret
     * we cannot do this here, and we must set PC directly */
@@ -307,8 +302,6 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         goto give_sigsegv;
     }
 
-    install_sigtramp(frame->rs_code, TARGET_NR_rt_sigreturn);
-
     tswap_siginfo(&frame->rs_info, info);
 
     __put_user(0, &frame->rs_uc.tuc_flags);
@@ -337,11 +330,13 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->active_tc.gpr[ 6] = frame_addr
                              + offsetof(struct target_rt_sigframe, rs_uc);
     env->active_tc.gpr[29] = frame_addr;
-    env->active_tc.gpr[31] = frame_addr
-                             + offsetof(struct target_rt_sigframe, rs_code);
-    /* The original kernel code sets CP0_EPC to the handler
-    * since it returns to userland using eret
-    * we cannot do this here, and we must set PC directly */
+    env->active_tc.gpr[31] = default_rt_sigreturn;
+
+    /*
+     * The original kernel code sets CP0_EPC to the handler
+     * since it returns to userland using eret
+     * we cannot do this here, and we must set PC directly
+     */
     env->active_tc.PC = env->active_tc.gpr[25] = ka->_sa_handler;
     mips_set_hflags_isa_mode_from_pc(env);
     unlock_user_struct(frame, frame_addr, 1);
@@ -381,3 +376,19 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+#ifdef TARGET_ARCH_HAS_SETUP_FRAME
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+#endif
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
-- 
2.25.1


