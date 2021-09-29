Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422441C5CD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 15:39:05 +0200 (CEST)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVZnb-0007UN-VP
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 09:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIV-0007hw-M8
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:56 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVZIS-0006T1-Sw
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 09:06:55 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so2771225otj.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 06:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=em63mRXCyLKKFcAEyKw3h3vHxVxde+27GcHsVAZyLao=;
 b=CqHXmF4cer/jDGT/G6BeNp6ohx1YjS26WNnexhRj1NQsR2LxUe60F7sZForfRfAKCE
 Z6tgaBgQ6n8hI/utoPZEGxX+zcsEmmB89VDcMLbmRVqLenONeZPX2M3pm8mJYi+vJKcY
 nJPp+WbysYdbTgzPNbf+QNh0WnhGCFtTSPfk++7YXmwBlPwlUk3UcZdb4qIPYkbEr6hB
 ISBgIyZW1fGRsaVGBU7ZrRJZgiEsiG2VdcbbO158cgtWdYDMGVeQXzEiSPbJIwP5E6Wo
 HGq4ZCCi43LvRXmctg2UZqplNrhOflGTQVrptRV0sUJ024XnGpfp8QMD26HdlmXMbnV7
 /pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=em63mRXCyLKKFcAEyKw3h3vHxVxde+27GcHsVAZyLao=;
 b=dR6Ndv+i85/CEEO0hhx20ZDGMyqK/KjYNqucK1fMv5cnIF95teQywj1+Aq1cIPJ2YL
 AFgC0e/ECkGkkcjj4ZKPgL+VagsR2TPh8+tfBsoNP+DRkRwYzrSik0lpYZUma8QCV1sY
 FvlptLA2mqUIQGeQUs1Gvx4kJsoZuxTprnxBwNQRXrJmus+AI///SPzNJe8jzXNVvH3d
 Ytvuhl9WD2gAsEk0fvoLyKf5A9bcaubeqnM2pW1mMbRb/+Rvxyr7nwm1p4gYKGIC5hkZ
 qU1c4TPHW8CYRFD+WlsTwB6llBgSX/NioKAzz2WlFzByUpmLsPU2eQBVlVel/CsnJ4jF
 HxMA==
X-Gm-Message-State: AOAM532qlU1mcWLwCOr1mcdcAl0AIKwleTCvN9Rh3uSHHJUDVowEP3lE
 KSnspfaAkaMH7hWF+CHGUsE6eY/4neRN0g==
X-Google-Smtp-Source: ABdhPJzugkdTgr7BG7T8Mpjgu/l+f8tQ/Pwcv0oz7Ml0F4aoH4Xc41LCrBOVIOJaHNYYgfV9BG7REg==
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr9858821otn.135.1632920808784; 
 Wed, 29 Sep 2021 06:06:48 -0700 (PDT)
Received: from localhost.localdomain ([172.58.171.248])
 by smtp.gmail.com with ESMTPSA id w1sm442823ote.41.2021.09.29.06.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:06:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/26] linux-user/sparc: Implement setup_sigtramp
Date: Wed, 29 Sep 2021 09:05:50 -0400
Message-Id: <20210929130553.121567-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210929130553.121567-1-richard.henderson@linaro.org>
References: <20210929130553.121567-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x331.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 alex.bennee@linaro.org, laurent@vivier.eu,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/target_signal.h |  4 ++++
 linux-user/sparc/signal.c        | 40 +++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
index 34f9a12519..e661ddd6ab 100644
--- a/linux-user/sparc/target_signal.h
+++ b/linux-user/sparc/target_signal.h
@@ -69,6 +69,10 @@ typedef struct target_sigaltstack {
 
 #ifdef TARGET_ABI32
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+#else
+/* For sparc64, use of KA_RESTORER is mandatory. */
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
 #endif
 
 /* bit-flags */
diff --git a/linux-user/sparc/signal.c b/linux-user/sparc/signal.c
index 3bc023d281..23e1e761de 100644
--- a/linux-user/sparc/signal.c
+++ b/linux-user/sparc/signal.c
@@ -242,6 +242,12 @@ static void restore_fpu(struct target_siginfo_fpu *fpu, CPUSPARCState *env)
 }
 
 #ifdef TARGET_ARCH_HAS_SETUP_FRAME
+static void install_sigtramp(uint32_t *tramp, int syscall)
+{
+    __put_user(0x82102000u + syscall, &tramp[0]); /* mov syscall, %g1 */
+    __put_user(0x91d02010u, &tramp[1]);           /* t 0x10 */
+}
+
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUSPARCState *env)
 {
@@ -291,13 +297,9 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] = sf_addr +
-                offsetof(struct target_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_sigreturn, %g1 */
-        __put_user(0x821020d8u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_sigreturn);
+        env->regwptr[WREG_O7] = default_sigreturn;
     }
     unlock_user(sf, sf_addr, sf_size);
 }
@@ -358,13 +360,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->ka_restorer) {
         env->regwptr[WREG_O7] = ka->ka_restorer;
     } else {
-        env->regwptr[WREG_O7] =
-            sf_addr + offsetof(struct target_rt_signal_frame, insns) - 2 * 4;
-
-        /* mov __NR_rt_sigreturn, %g1 */
-        __put_user(0x82102065u, &sf->insns[0]);
-        /* t 0x10 */
-        __put_user(0x91d02010u, &sf->insns[1]);
+        /* Not used, but retain for ABI compatibility. */
+        install_sigtramp(sf->insns, TARGET_NR_rt_sigreturn);
+        env->regwptr[WREG_O7] = default_rt_sigreturn;
     }
 #else
     env->regwptr[WREG_O7] = ka->ka_restorer;
@@ -775,4 +773,18 @@ do_sigsegv:
     unlock_user_struct(ucp, ucp_addr, 1);
     force_sig(TARGET_SIGSEGV);
 }
+#else
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 * 8, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    install_sigtramp(tramp, TARGET_NR_sigreturn);
+
+    default_rt_sigreturn = sigtramp_page + 8;
+    install_sigtramp(tramp + 2, TARGET_NR_rt_sigreturn);
+
+    unlock_user(tramp, sigtramp_page, 2 * 8);
+}
 #endif
-- 
2.25.1


