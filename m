Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F203BE023
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:16:40 +0200 (CEST)
Received: from localhost ([::1]:40556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0vF1-0000qk-1i
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upU-00029A-9b
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:16 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upB-0006iH-KG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:50:16 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a14so59658pls.4
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1aOR56lJG8Y7fzXfcIBZhWpAZ7tMlA6NQMa73cEU+c=;
 b=Or0bIsS8kj820PjX0wSeYufzbRbA7uuM6v+dj0tN2EgCBunPFhLXymaa270HymDIP/
 wgBE/WrGpd2tOTWLfb1TZu7jwEU/YPqBsEWAVR3UCfVInEizhEgg+XTLrEHhAVg2O0S2
 +JaMv+ufC48gZHIbcj7j9dCsyay+nsDqNfUgYlqX+AGDh8ez5jvdn+TzDIsXpWKg0paX
 UhfG6bSnAfhvGimwoiZBxj8UKE/6x7uP6gu+Ekg7lfe0COpsQFF9OeLCQHGYTwbW0CMi
 DSKod1JNnuMbQs3KGeOa05NCZT/D4TdF+b5PCFEmRYa7jAlNnis9FRPKN9q2uEMCgfSe
 hxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1aOR56lJG8Y7fzXfcIBZhWpAZ7tMlA6NQMa73cEU+c=;
 b=Dvaun37S7owDuYO2V7x6xlEBWZ9hnWrADjxr/3XtsFbFotOzczkIWHAi0wrfMwj2fV
 D5yEqYF5lwkSPD1vLkzCGP/cQYdV2NjniCYlNANkBdX6VWTfCvEa6mWQHmBwH2jxoAhX
 mUtCyxLmxVzjfQx1QvkMp19l4BppFA77dLG8EACsjLxMShhMNSnN2qeuh3upZT3U5A25
 ck/YiUJiKszXM2ag7IXUZ8rCOuK79jYlfBrJIrUks8QTib8A7PSIibwbUGHBlyoOMNEt
 GP77x2CWu3HDojfuqnKA8+tPb2y41xRy87xQjaavlb5ir4ZDcShjgWvsKx1z5IhK0omq
 huPg==
X-Gm-Message-State: AOAM531BbTmV5Krzpl4CeKjl3RTBzp8SsKMS38L54nDyKKh0GMTwIFRP
 AeRLLQbB3GYpqylEmpfcrGciu/k/RvCx9Q==
X-Google-Smtp-Source: ABdhPJwte+ts3bxCoop/8V208womIXnjIF2djoqWVfHMHXRHk/Usii4Xh5Ej7vsgy1no716zcFNvHA==
X-Received: by 2002:a17:903:2452:b029:129:33a0:399d with SMTP id
 l18-20020a1709032452b029012933a0399dmr19211293pls.31.1625615396244; 
 Tue, 06 Jul 2021 16:49:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/36] linux-user/xtensa: Implement setup_sigtramp
Date: Tue,  6 Jul 2021 16:49:32 -0700
Message-Id: <20210706234932.356913-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the rt signal trampoline.
Use it when the guest does not use SA_RESTORER.

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/xtensa/target_signal.h |  2 ++
 linux-user/xtensa/signal.c        | 50 ++++++++++++++++++-------------
 2 files changed, 32 insertions(+), 20 deletions(-)

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
index 72771e1294..fd57481bf5 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -163,26 +163,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
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
+        ra = default_rt_sigreturn;
     }
     memset(env->regs, 0, sizeof(env->regs));
     env->pc = ka->_sa_handler;
@@ -263,3 +244,32 @@ badframe:
     force_sig(TARGET_SIGSEGV);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint8_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 6, 0);
+    assert(tramp != NULL);
+
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
+
+    default_rt_sigreturn = sigtramp_page;
+    unlock_user(tramp, sigtramp_page, 6);
+}
-- 
2.25.1


