Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0A3AD303
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 21:40:16 +0200 (CEST)
Received: from localhost ([::1]:58108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luKLf-0005Ex-LQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 15:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBw-0001j4-KF
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:16 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:34446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luKBq-0001aR-Hm
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 15:30:12 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso7650131pjx.1
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 12:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1aOR56lJG8Y7fzXfcIBZhWpAZ7tMlA6NQMa73cEU+c=;
 b=KyNN2hn0k/oADtZ0Dg6venc869M7WJ253Wrdjs4oCRqYIkOfTAAn+imn4oQcpcKicq
 FvHVSWdj2ZXwFk0UxoCiq3+/X3axylJdBf7+Lq6lmAAilI1a2jl2aWPZHv6LgIX1oojx
 xuGiFsHt2LnsfJj/2XAowfNoVc3LDoz7786sSbviedJsEFv5Wf6SJKXdjUuFHRNH1j39
 gZZfY22OnrftUN91wjuj1IZSZKkVywxSx4EtJuwZbLm6ElHKrgtfNHMgNAtzrPblTq2t
 XLltc/tgXPnuz6PuDbVI6R6Tyfhd8Ybf1dMFq0t/s1nckyYx4uQHJUKPuAFz8u+wMq5X
 tARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1aOR56lJG8Y7fzXfcIBZhWpAZ7tMlA6NQMa73cEU+c=;
 b=rJ1t3pRtAtyUcPC9ROZg1z3vY8gEwLjkOH42C7O7NQrrhpf7LCLttRZtGHSg/D49Bt
 5lArllWGjmi/VRsISzIHoWrdAoC8nuWCBnSJyF9d4OzCAgf7eyUGKFc7uh/q4zJ5Eje1
 nKA8BfgGz/pbEUsFdAVmRDuVOrH/00qZeYNYzFJT+QdORGiA1IbZdzkfLytK8aeSopp7
 jkjVDzgsury9AmDz+cgN6JA9k2VtHRfZWq21rJtr7jPCazOM6GYwF+q0crOt7VDyvG3Y
 xzSIkoFY8k6902wPpUyPdUoN5fNLY58u1svD2M4R2A5+MeSf9rOlIoV20CLRDglnQBMP
 Yt9A==
X-Gm-Message-State: AOAM532BlGze669zOe8+UKy+X3/1KlJFaj/lmvvnPtslfceAipK2zN7D
 ba28zclJrjoIDczlSbRAVRpUV9l7Bx2WcA==
X-Google-Smtp-Source: ABdhPJyaRT0PNC4bKtbAWy2F5dKj8mQ9+DIktm49dvcD7du5cHxLhmdgIsGLZvtM3QhtOuI+Yg7CZQ==
X-Received: by 2002:a17:90b:3253:: with SMTP id
 jy19mr21824466pjb.196.1624044605273; 
 Fri, 18 Jun 2021 12:30:05 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 92sm11938234pjv.29.2021.06.18.12.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:30:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] linux-user/xtensa: Implement setup_sigtramp
Date: Fri, 18 Jun 2021 12:29:50 -0700
Message-Id: <20210618192951.125651-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618192951.125651-1-richard.henderson@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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


