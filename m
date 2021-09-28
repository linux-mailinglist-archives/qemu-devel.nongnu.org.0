Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DACC41A537
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:20:02 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2iv-00051L-MT
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QY-0004gM-IK
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:02 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:36363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QT-0005pB-E4
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:02 -0400
Received: by mail-qk1-x72d.google.com with SMTP id p4so39281954qki.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=Uo7Pa7379w9kxNJdhXZMHwr475yY6pDoJSIDMh93P/pFctZZpm9TRvpAcNghFJ2KWG
 JxDGcWyw0trOJ4hHuqSjsqH8986r+nCCbtjW0eXXaMiheDiyWDuvCOloB85dDECKrLeY
 wIQZdM9XS1/XSo02Hw1Zof4u8p2oKtj27NdEBywK2OLZ+SM1qCnHX6lsgSIjVmkWcc+/
 xpkK1FfOwXVCo/W6AsmcKzz+BgJZ2ASxfmSQ7qlHTSN59VQi8Kq3Ss4aWJGb8hvIoJMQ
 /poP5twSDrm43nnIf9x21GnQqiJhcW4L4MeqCfPVFkcnphmxwA6XIHb+H1rm+P3+g+Cy
 rmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=h2XUFJmnBwEMHKBENEnC7rA0SbyHPflqZJESDNJSeqp2QkJAGswGHMQeo2+jw/YKjX
 Y+0fPv1FyJVZSxEaX+vrsMolbNQjOB4rUzkNikq5cYyBc7SlQ2tAm4tLscmCBhzXF9nj
 nYewR5iWG9B+si4SnlPYd6Wse3DDVM43GSQ477GA0jKzVdzqhI6mUeB7QTJpzVegtT7L
 6Dtl5hojAi/z6oV+tIgnJ2X8rw/efX52TiCJFjDCBbt+Ynb6DLivAOdaUJbT4dVSm8p4
 52cUEzwX790CO/J97yJK3KCX+cMEZHfnijdvZJjjGrOoYv57cXIOnzR5vpDMiVGbD29b
 9Jew==
X-Gm-Message-State: AOAM530Dc0sdagJcW3hTAPnqQ+8gaPhJ4vlXoy6YIkXYbyDXjM2GBG+1
 8UHTsrlbXNvoyoC5POp5XPARS3bGdfzJCA==
X-Google-Smtp-Source: ABdhPJwnz5IKAqgDp23AdSSjMY1zm/67w0uyWwLkxW2cXOU2yoRL6CgxTVRYBZWmPqj/jFG/1jg2QA==
X-Received: by 2002:a37:e14:: with SMTP id 20mr3244194qko.250.1632794456364;
 Mon, 27 Sep 2021 19:00:56 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:00:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 17/25] linux-user/openrisc: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:31 -0400
Message-Id: <20210928020039.184412-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: peter.maydell@linaro.org, Stafford Horne <shorne@gmail.com>,
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


