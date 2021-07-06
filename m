Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4173BE00B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:06:42 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v5N-00052c-JU
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upG-0001mI-Tl
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:02 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up7-0006gP-7T
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:02 -0400
Received: by mail-pg1-x533.google.com with SMTP id g22so399135pgl.7
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Vq41DCrZsY8w8sVZQ5+/3oe8dorwqbm8lEFaa2QNhk=;
 b=TFNBtg86qS1CVcMbXGlRXDk0HHqQt2YFPq6a0dc9Yc/kfhPnKBoEaBTy4YoiNxcsbD
 +sSgGerxVuMEAQXacAgwp3kjtdT83XorCB89ogiykghFrjlvIG9u+4sGKIVRNBg1KB7n
 4QocVDldj6vR9Fc7JUd+TUxliPq5OgKqaf6yg3DaTOkbYZGAqhjVk59Y2b1E3cJcCbro
 3fGv8qRRQYmkNbnlTuKiVrPQejDNYHQ/eqrVlM/TqOZ6edxTvsFFwo8Unp1fTK/mKbWQ
 J9HM3MbdQGTYgzSGq0lzcIosSUwmEOAr2aQwFzI9CwV3vby4W+sM4hj8xS9MsTmp5c81
 3wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Vq41DCrZsY8w8sVZQ5+/3oe8dorwqbm8lEFaa2QNhk=;
 b=CI2kJHaw1OjTelvbjDNnqaw+tQoWPsB1N4IkzyypWWSUi5jsq0jdZrCcMzclT/Hpcx
 7k7bw9AsBCyQUexbJcdDNz18TFstzl6sHcRXZpWsnlROw/1ycibYH6CV4V0JAMflxwcK
 EPu63QQ7HF4WHRTxwvdpak+DU+H0ojHnxpYTI1rSOLW6tnXCACH7/PJYo0R6exx1cULm
 su//53ULH3lZttf719PfApl/2obnIhXfgiw60saxz5IxUlT1oU35dziByJ71USSUF2+8
 3p/QVzJbXGbekMC9EY7jpk5yAxRnEwADfBbl9eIQg33Ubj1NoWIPaSjPzp4do3ahzmAr
 KrbQ==
X-Gm-Message-State: AOAM531Nqt6L2aFlMQ+0Tw4end65gVrj4B0jkiuLFWyo4+7wYCWIvLdG
 lKdPxSeVyVhdkHwvAPPNJu5tzXb0XBDW4Q==
X-Google-Smtp-Source: ABdhPJxD26E1qSdtci1LZREMd4KPYlXa/KmZfA2Fk4VyxFSKkHZdO8JrFz2NfGfMUysSSoGU6PdypQ==
X-Received: by 2002:aa7:8d86:0:b029:2ec:82d2:5805 with SMTP id
 i6-20020aa78d860000b02902ec82d25805mr22659605pfr.11.1625615391986; 
 Tue, 06 Jul 2021 16:49:51 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/36] linux-user/openrisc: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:25 -0700
Message-Id: <20210706234932.356913-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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


