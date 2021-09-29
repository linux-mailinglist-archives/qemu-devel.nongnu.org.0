Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CED41C597
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:27:58 +0200 (CEST)
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZcr-0005yu-Gq
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIG-0007JH-RO
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:40 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIB-0006Km-RI
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:40 -0400
Received: by mail-oi1-x235.google.com with SMTP id w206so2798524oiw.4
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=s+cOxUgJhxJSEd+iF3RaesX37YvNz8xAhey40RQsAsSlLGaHowBZzizB8pHC/9d6YA
 jrubxV+GiFuYd/4nXt12fkdxZ4HVhUl8chB8uLfXj7y3Bsqt0ChNudEr3xK+E2plr0Mx
 fjpJv5BdqBwjI/5SaNgmPtal9/i4WSZla54xrep7Qd71yDIV9LVD8HhMfjrkgnoAdwbk
 ONtmY1MPlxRSdVKolFxE5lVrHTJjhJsDVnJ3bXXeWwvceeCdURYTZhRCVVP3YQ1dq0mV
 dEVH5jnhHzTIdG04B2hgsjwkWYFeXkeqEld4+IrxQ+2sIt/P61q9d2V7OlPbuGu7GmnF
 kXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=TDZM+piDN0qwq735TEKqTbK+anL46PeG+NT7Ua3WLlSwMXuaMLCI40rgc6DhC5f/N+
 cNVjql2BKgs4YXs6uDLJ6zFAiN+VsQrghBVV3Hn3mG6u8NNems8R9k1nnC1RK1S6fFmb
 i62OU6qO+TOW6QC9v7weelAcMMbfx+02En4HIBXUIXhy0Bf8XQcCHNXIEnXWPjlPDgiw
 Fsj5SzpnnelnuZwbH0eG8i01O6Yyijpu0DSVy1095aU4Q2XZt3xvXcnZy0BhYjZTSlm9
 oXW/FWT8ucINB4czsCcl9Rf6awt/XaDAeve1sNk6Gl/BYtpvekjhJsxzVh0+kZSiayja
 bSxg==
X-Gm-Message-State: AOAM530AMgPo1xQbxcJeYrsaHxcmqZpQg/L2SFeCsVC3iNvstvbu55eG
 WVf83NTqLU6O1e0c82c8OBW70Soa7pVWOA==
X-Google-Smtp-Source: ABdhPJy/91LdhWaqs67A0qwXrLweiLtiKmd19mdEl5aleLuKH3XX1mrjW3HVeGkhRrJ6DscH2VMnAw==
X-Received: by 2002:aca:de8a:: with SMTP id v132mr8008094oig.61.1632920794631; 
 Wed, 29 Sep 2021 06:06:34 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/26] linux-user/openrisc: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:44 -0400
Message-Id: <20210929130553.121567-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
 linux-user/openrisc/signal.c        | 22 ++++++++++++++--------
 2 files changed, 16 insertions(+), 8 deletions(-)

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
index ca2532bf50..be8b68784a 100644
--- a/linux-user/openrisc/signal.c
+++ b/linux-user/openrisc/signal.c
@@ -38,7 +38,6 @@ typedef struct target_ucontext {
 typedef struct target_rt_sigframe {
     struct target_siginfo info;
     target_ucontext uc;
-    uint32_t retcode[4];  /* trampoline code */
 } target_rt_sigframe;
 
 static void restore_sigcontext(CPUOpenRISCState *env, target_sigcontext *sc)
@@ -116,14 +115,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
@@ -169,3 +162,16 @@ long do_rt_sigreturn(CPUOpenRISCState *env)
     force_sig(TARGET_SIGSEGV);
     return 0;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
+    assert(tramp != NULL);
+
+    /* This is l.ori r11,r0,__NR_sigreturn; l.sys 1 */
+    __put_user(0xa9600000 | TARGET_NR_rt_sigreturn, tramp + 0);
+    __put_user(0x20000001, tramp + 1);
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 8);
+}
-- 
2.25.1


