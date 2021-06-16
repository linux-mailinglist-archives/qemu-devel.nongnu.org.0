Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E7A3A8E6D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:34:01 +0200 (CEST)
Received: from localhost ([::1]:43260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKRM-0000Eq-6v
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6h-0005hH-UC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:39 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltK6S-0008VC-EZ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:12:39 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so2573754pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COVeNQV9BBulXNDLKWwOqJGZ7zBHmRTYrf/xguIv+OU=;
 b=qD7/36kFVmvwhUT7pFuHSEzVsphnUjzB8+KlfN7GwYW+PoDmk0NuN+doPjauZa5+2E
 tMbBGqi9duoqV+NsMNdkHMHK/vbNEfSxuT1cl4253++DoAPcg4wHOJxOEgGinqZkXMP8
 fkJK3I06POcVj1xa6UYhluQDsHeETYgOBj3XUHnaobJv6TxoVC4DukQj1l9Z5muKifC0
 dYmT5q8lHXtLi0jIIs/LF4lKkI5o6ZP7MDxgrDy/tsL9vOPkonMTLUwCEp41Zyzkl/kE
 I/GuxJB95HXKjVDux+LKZOtGx64IWc2j2T5ACDm02Ly0vRttWG1i8eqIlYoWSTcgIi0A
 zMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COVeNQV9BBulXNDLKWwOqJGZ7zBHmRTYrf/xguIv+OU=;
 b=cMJjvih0BSJK2mivOMsXW/hmRG/NlBzJxBPqoknvVDfrlgzcjQsvVxWmuMvAhgysip
 j9pmH9Kf9e+99IU40dUvRvxtIKGKxozyGth5Kdo8/iY+Zxo/PO+OC/LrbvCz7NkkfVne
 iF19tGk/qKuHfioTVi5Fv2qUu1YXLhYs4P7RCnyCtzj9TwgyUt3+g0YHVWkX7PodHLDn
 DepXNGyImJqSZ9twz87M7GsTxXa461X6YVT3vKW3ADvxx9869lpHq/RkQxt9jfgM2oB/
 BkeFgVBd74PEOuWBLxMsEjAPi3YI+W4vz0hKjhT2c39grHSq3CBGa8QqF7INkeYrfVW6
 //Ng==
X-Gm-Message-State: AOAM532lsw53Amc9xkbxL7x+Tey592MkEM0UDJcre7OOkXZnMk2G1b3a
 vovYgz9E84270AGfrfAs/bRq/XQmzqBngw==
X-Google-Smtp-Source: ABdhPJy3tfERkljZWHa9H5H0YR6xP3ssvBKJut6sjh7aJ1xooUuyoQp4aNb/9g38hw7KZGiUu+fchA==
X-Received: by 2002:a17:90a:e2d4:: with SMTP id
 fr20mr8036923pjb.92.1623805943265; 
 Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id y18sm305297pgk.53.2021.06.15.18.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:12:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/21] linux-user/xtensa: Implement setup_sigtramp
Date: Tue, 15 Jun 2021 18:12:08 -0700
Message-Id: <20210616011209.1446045-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org>
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

Cc: Max Filippov <jcmvbkbc@gmail.com>
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


