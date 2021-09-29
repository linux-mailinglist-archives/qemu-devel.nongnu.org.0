Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB841C5C0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:36:22 +0200 (CEST)
Received: from localhost ([::1]:41108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZkz-0001bt-DP
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIV-0007fn-1z
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:55 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:36577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIS-0006UW-TW
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:54 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so2770154otx.3
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YCijfVDlMthAy6Aqm4CcfWtzvTL1hpUSrm3kzthwro=;
 b=tXs/z8gB1BCxpcGziVvnWW//iMGPcPiqiduh3YwVpijle8vAT2ShIxH5ZESibFBeZe
 o9NASbEK/6zrSxW5g8hVlxTNv2/vQBLEtt78Z6DeF+lH4MYETSamAwFz4mzIqeAQ13TN
 XpnGP6dS+FZyEL9r3s3c8R9/JbgU1fe/0E7Djl6y8b3TYlUJFjJRKHpFtdvQHr3IawHA
 qjb5r0xEjijuzo4sHLTJ7zaEgDgToEVTaUM1Qr4OEGdoD50Afn97ihXl5MkQ1tn3lc/1
 F8imOwTn6oGfvZbkFggqCZwpaCdz+C/x7Bvqr8KWSb+BApW3vrEwb1J20GKtRy5EdRzc
 dKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/YCijfVDlMthAy6Aqm4CcfWtzvTL1hpUSrm3kzthwro=;
 b=1uJ128s/BxgLoHqO1uI1FXvuNcYX5kvTA/e+LiE0rdhJXpYqoe5yIuEP82KV4GvlXK
 n/d0we5nFmG2/H8jQ0FL8O7rkasRytiXTn1Fe2iSlKcnLReb4d5LH76vTHY8L3n1L0NV
 xJP3tqUlMSDt6oT2Ibbv2qeF3t1Sx7uy/4lCwh9evvWLLdKraE0IE+loCCFjXd2tmf5x
 EGsN6kV3MTvbpacsyipheutKf63l+NsbuagXhSe8BKTXtnICET15UQ2RGhnW2NDLar1p
 G6ZgIE/kQ9Sm7oLr8dv5zDqNXDwJzgiZe0Um1YRiMHR5IKB59XG60r0hAaU1cYWIt+y2
 OwVQ==
X-Gm-Message-State: AOAM5328SIYZMF2p/pryj2jbICULujYciGRZi3fyvcmCxkG3liXHQPc2
 Io22gp5QfPZmoIC0s4j0T85kH5dgEwfQZg==
X-Google-Smtp-Source: ABdhPJw9VXGDDqeAwLX3K/0xe/Si/mkM7TNYdRJXLT5y9xHqxA0OHSCor5mYm5rRIAkbt9bpJr5LJQ==
X-Received: by 2002:a9d:1716:: with SMTP id i22mr10110387ota.20.1632920810433; 
 Wed, 29 Sep 2021 06:06:50 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 24/26] linux-user/xtensa: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:51 -0400
Message-Id: <20210929130553.121567-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


