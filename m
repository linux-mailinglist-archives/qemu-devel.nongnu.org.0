Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB441A557
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:27:54 +0200 (CEST)
Received: from localhost ([::1]:41210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2qX-00073J-0P
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qc-0004qZ-4Q
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:06 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:34719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QZ-0005uW-MD
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:05 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w8so12509897qvu.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YCijfVDlMthAy6Aqm4CcfWtzvTL1hpUSrm3kzthwro=;
 b=tjRJbzumwq6we86x8zoBLnRHi/79cunacioo1ubW2gDe8OolNEkrrYeVAR6c8SPOL2
 okTtvC3n8cPerX3owhC0kSCRJz1OSafgG4EztxXA+K4YPIuOSDnG+aF7BcF2HEkpdYFy
 ZXX+OpukfJhMynFG82vn74B2vCcB/kX1awrGMow1mhzKsEXMd99/XfYlk4HTzWtA57dw
 uqDvLPb4rnu/ESr1TYvTi42GhR99+YnwHE5bRbQVEWV07SwZ4U3Mf9Op2bmJ+/njUJal
 8xhBQMCsmk6+JgZCtMaXiAS5vFRJPm8X5EZJvzvRVtMiwiMSuOiv4ufq9MJJP0vn4p/P
 /AcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YCijfVDlMthAy6Aqm4CcfWtzvTL1hpUSrm3kzthwro=;
 b=KdqLVr0VMYv+dO+cUDqR/jKjipPIV3+2gl880yagMe6K2/hYe5fAUMvxAd3oLhMcex
 RZ+fjWbjeBn+ZupYXShWjocpxjXI0AHDDaRgDP5kDsXni0z495HwPZn3efN0d3S+pWLe
 iv5aER8V/Kq5iNDJYTI6oGrsCsg5sW/yBgvS8lwcsXxVpUZCSCXl7I8bXIdFJM7VmRzX
 piU08SSKBZ+trm725faVgVPm+atv/wKBbjpmZhdDvvdqJa1snfIXzYtN/Ux60wpqEhVx
 d2+shSj9l7cq/wpXHkwJa0HxT2qCANMi7LG3stve1IYIZBqpyqYvv9P89P4uodLHzjyt
 8vdw==
X-Gm-Message-State: AOAM53199CBJUKMldztjigBSKn+jQFotdHAQuj4Hx8LraRSYvXYi7TyC
 FRc2Jz0zSH11P8jCdJur+F833qvTiVkQHg==
X-Google-Smtp-Source: ABdhPJwXqCaswlbTrIF/8CGzlYieJX4uZYnd3CgkkuhjYF63oeD2dVVtTybPW07g5euzfrbbOmmczQ==
X-Received: by 2002:a0c:e2c4:: with SMTP id t4mr3229449qvl.48.1632794462679;
 Mon, 27 Sep 2021 19:01:02 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:01:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/25] linux-user/xtensa: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:38 -0400
Message-Id: <20210928020039.184412-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, laurent@vivier.eu,
 Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/xtensa/target_signal.h |  2 ++
 linux-user/xtensa/signal.c        | 56 ++++++++++++++++++++-----------
 2 files changed, 38 insertions(+), 20 deletions(-)

diff --git a/linux-user/xtensa/target_signal.h b/linux-user/xtensa/target_signal.h
index c60bf656f6..1c7ee73154 100644
--- a/linux-user/xtensa/target_signal.h
+++ b/linux-user/xtensa/target_signal.h
@@ -20,4 +20,6 @@ typedef struct target_sigaltstack {
 
 #include "../generic/signal.h"
 
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 7a3bfb92ca..81572a5fc7 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -128,6 +128,29 @@ static int setup_sigcontext(struct target_rt_sigframe *frame,
     return 1;
 }
 
+static void install_sigtramp(uint8_t *tramp)
+{
+#ifdef TARGET_WORDS_BIGENDIAN
+    /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
+    __put_user(0x22, &tramp[0]);
+    __put_user(0x0a, &tramp[1]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[2]);
+    /* Generate instruction:  SYSCALL */
+    __put_user(0x00, &tramp[3]);
+    __put_user(0x05, &tramp[4]);
+    __put_user(0x00, &tramp[5]);
+#else
+    /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
+    __put_user(0x22, &tramp[0]);
+    __put_user(0xa0, &tramp[1]);
+    __put_user(TARGET_NR_rt_sigreturn, &tramp[2]);
+    /* Generate instruction:  SYSCALL */
+    __put_user(0x00, &tramp[3]);
+    __put_user(0x50, &tramp[4]);
+    __put_user(0x00, &tramp[5]);
+#endif
+}
+
 void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUXtensaState *env)
@@ -164,26 +187,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         ra = ka->sa_restorer;
     } else {
-        ra = frame_addr + offsetof(struct target_rt_sigframe, retcode);
-#ifdef TARGET_WORDS_BIGENDIAN
-        /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
-        __put_user(0x22, &frame->retcode[0]);
-        __put_user(0x0a, &frame->retcode[1]);
-        __put_user(TARGET_NR_rt_sigreturn, &frame->retcode[2]);
-        /* Generate instruction:  SYSCALL */
-        __put_user(0x00, &frame->retcode[3]);
-        __put_user(0x05, &frame->retcode[4]);
-        __put_user(0x00, &frame->retcode[5]);
-#else
-        /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
-        __put_user(0x22, &frame->retcode[0]);
-        __put_user(0xa0, &frame->retcode[1]);
-        __put_user(TARGET_NR_rt_sigreturn, &frame->retcode[2]);
-        /* Generate instruction:  SYSCALL */
-        __put_user(0x00, &frame->retcode[3]);
-        __put_user(0x50, &frame->retcode[4]);
-        __put_user(0x00, &frame->retcode[5]);
-#endif
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(frame->retcode);
+        ra = default_rt_sigreturn;
     }
     memset(env->regs, 0, sizeof(env->regs));
     env->pc = ka->_sa_handler;
@@ -264,3 +270,13 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint8_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
+    default_rt_sigreturn = sigtramp_page;
+    install_sigtramp(tramp);
+    unlock_user(tramp, sigtramp_page, 6);
+}
-- 
2.25.1


