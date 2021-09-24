Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F192441799C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:19:52 +0200 (CEST)
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTorY-0005AI-0B
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY7-0002p9-IW
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:47 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:40664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY3-00072D-IJ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:47 -0400
Received: by mail-qk1-x734.google.com with SMTP id 72so28625264qkk.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=TiEHkqLhCxqVrpRpuynLDSiG61R6O8JsvscC0KYwWWQmsnqu3bR4A4c2xfB1jIz8PO
 90jU/0nfyp2AlupK8D8pU7k8QvcSKFks8sed1hFwiKniQOQLZPGd2bRqknXQ8cBHY1lT
 jODWivjgjAZSNobY0iEEvs5XUHlsuubmvzyTshdtduJekVQRwGokoO2V0rW0wx6CnafV
 YWWiq651InGZxuKXaPMh1zJH1NPcRAZuYOyHLKJ5N6wtQjcWBQxkXvx50cOdGqSdhKTZ
 +uKTnUS0HpRS2mWhhPbSilrFFw32n6Gap+jjxo0WoKkflhDd6rIfpcJH4hQmLFWuxcc7
 +sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lOx3X1NullOBxWQQkPTVyDx8zRAFH/X5J8rlFdQM6Qw=;
 b=YEiZpevQ+aDfAz8KwSgLc4EWKUo/KU8vECz1iSe3GE1xNfTwAZKhdYEYEyHgJeX6ky
 obkU7xBgw8PiDAw+c2oYQIHMZfs3FCZ4T1BTjLNjhAGvrARA1kz/ED5gpHhSE+/EMB+r
 Rf7N+tojeJTl+CkjexTtWwqqJUHFk1ZgyzDYvQzL6blcvoBoMghdxbkBZPGuvPnb5Ggk
 h1M+kcIXcUpeVeZFcJmeIkSiSkPq6aWdaEu7vbbnbgT5Usj6tPn0FBZeWyVj55OmHBOJ
 FEIWJE2xLUauHa7VUz39G3dSuLc+dJG9VG+GJb7JdefAkX7t/7sS9mBRIItwqXmTNshP
 m7GA==
X-Gm-Message-State: AOAM5330btFeo0kweTbmHSECnPMOmb+QrBWWrmOAbpsnJao4wzxhKoog
 emLpZhV9e1hC49Nxaf9UdULxOExRL7AkuA==
X-Google-Smtp-Source: ABdhPJztx75T3gpKR2agxEVhYz3dHXgO2we+/Lp2geSy/mdFSsH/ZjSh+Nv+Tof2ofJeD8xHj9Xx1g==
X-Received: by 2002:a37:ae83:: with SMTP id x125mr11855501qke.37.1632502782447; 
 Fri, 24 Sep 2021 09:59:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/27] linux-user/openrisc: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:18 -0400
Message-Id: <20210924165926.752809-20-richard.henderson@linaro.org>
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


