Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62E3AD310
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:44:58 +0200 (CEST)
Received: from localhost ([::1]:43810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKQD-0006VO-6U
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBr-0001g3-3s
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:07 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBn-0001Wh-6l
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:06 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so3652236pji.0
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Vq41DCrZsY8w8sVZQ5+/3oe8dorwqbm8lEFaa2QNhk=;
 b=MXBJO8WrC0oYtShlpSZiimCAk3xfBhYK4sfAhbkPuU9rCjqhNCRpcaaBNgPaIksRpP
 4dpAFHlwGl8nDk8JKf/oWoKIeCioB2aebw0p2NHEu4iZK4csDLFUXv/IOa9YJ8B4OIf1
 5WN0Wr3qdM0CXDTeioptOnjP0QlA3Of/ai1f8CN79zvRMVXx30ZKnKXqgpA7/R6yUJAY
 FgX5AZ1WqOn3DIgEwcIO11CGuBU70wC0rGam19cKZxyUmKibK2GfFGR+2bDuMmHt6Wct
 NUyfi+4qyVcNlNQQb9R3F8IgjYWpaonmBotCPeGtAMPDL/DT3soTmIenpGmlu//lCUZN
 nl3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Vq41DCrZsY8w8sVZQ5+/3oe8dorwqbm8lEFaa2QNhk=;
 b=k3YQt1kb2ylsC6CidRGsC8iH5riF7/5vEyL8G9l80fRY+opdaMIoUS898bPeTCUt+A
 U2FaNHeeBhbqW8airPmCVaIEEbcbQUz8rJZIyeZR+9KgXxk/gX3gdqnw5dc9VL9Vs6en
 Y42NQcQIF4qPS8iAqVjKTG0c4htlS5spF9LQvKakrSHMYfueVRJD1RrYGWZ6+1GBJbYu
 rgjRJ0h9YcY+rC6FcIP+9AVKZYDpsSUl2cfi2ynKiJUieK6+3052pSsuAawln8s5fw8k
 0YDGALQOVx9X63N7mCvdFLirjRD2xxtxosrKHYAi19dgbDi5jYThwLwwscxKD0o/FBH+
 4u0w==
X-Gm-Message-State: AOAM532cz14FRluBBuXT2mnTu2IddOPcMu/CzDPMASz6Q9fUWG9cGCpl
 0+rKPoyPYkYOGU83bt9oNLLkRP2ujO4ZAw==
X-Google-Smtp-Source: ABdhPJyoJelGpa0dZtPRe0DOHqkt7zUoeZ3FbHo03ycpEiHpx0uh2crTINJJX1M26mIDV/QOf4kzmA==
X-Received: by 2002:a17:902:7d8a:b029:115:77ae:e1dd with SMTP id
 a10-20020a1709027d8ab029011577aee1ddmr6170543plm.50.1624044601823; 
 Fri, 18 Jun 2021 12:30:01 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] linux-user/openrisc: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:44 -0700
Message-Id: <20210618192951.125651-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.

Reviewed-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/openrisc/target_signal.h |  2 ++
 linux-user/openrisc/signal.c        | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/openrisc/target_signal.h b/linux-user/openrisc/target_signal.h
index 8283eaf544..077ec3d5e8 100644
--- a/linux-user/openrisc/target_signal.h
+++ b/linux-user/openrisc/target_signal.h
@@ -26,4 +26,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* OPENRISC_TARGET_SIGNAL_H */
diff --git a/linux-user/openrisc/signal.c b/linux-user/openrisc/signal.c
index 5c5640a284..b411b01864 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -37,7 +37,6 @@ typedef struct target_ucontext {
 typedef struct target_rt_sigframe {
     struct target_siginfo info;
     target_ucontext uc;
-    uint32_t retcode[4];  /* trampoline code */
 } target_rt_sigframe;
 
 static void restore_sigcontext(CPUOpenRISCState *env, target_sigcontext *sc)
@@ -115,14 +114,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
         __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
     }
 
-    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
-    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, frame->retcode + 0);
-    __put_user(0x20000001, frame->retcode + 1);
-    __put_user(0x15000000, frame->retcode + 2);
-    __put_user(0x15000000, frame->retcode + 3);
-
     /* Set up registers for signal handler */
-    cpu_set_gpr(env, 9, frame_addr + offsetof(target_rt_sigframe, retcode));
+    cpu_set_gpr(env, 9, default_rt_sigreturn);
     cpu_set_gpr(env, 3, sig);
     cpu_set_gpr(env, 4, frame_addr + offsetof(target_rt_sigframe, info));
     cpu_set_gpr(env, 5, frame_addr + offsetof(target_rt_sigframe, uc));
@@ -168,3 +161,18 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 4 * 4, 0);
+    assert(tramp != NULL);
+
+    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1; l.nop; l.nop */
+    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, tramp + 0);
+    __put_user(0x20000001, tramp + 1);
+    __put_user(0x15000000, tramp + 2);
+    __put_user(0x15000000, tramp + 3);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 4 * 4);
+}
-- 
2.25.1


