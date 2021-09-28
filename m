Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F64C41A58D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 04:31:27 +0200 (CEST)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV2ty-0001sz-Bo
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 22:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2Qe-0004u0-2W
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:08 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31]:36809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mV2QY-0005t6-Iv
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 22:01:07 -0400
Received: by mail-qv1-xf31.google.com with SMTP id jo30so12485261qvb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 19:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dk5wEWFCvQRhrhbVHtFmHpph+eQ4gpvIz8pVx649H1E=;
 b=kJwfZHQJk+cUeQ0XEZe813u8r+jSsXY31RGyzXIgLLHE6KcSdLCWLjfTcDNsZ0qL7H
 5P62zMPEVKpy2eQxfjRMYI8LDFDQQXWXjb7FWyd54wKqISd+ivSbJXhfGD6GnejUEObJ
 s+z/NGs1vd0Vzd5giBUnH6FFncq5D4GFLPN7GRMShB+1c0DKIfSg23RSvxwdVPgRSJEX
 mhmyvLMyJS8Bn0lff9y8vPEqrzFItp676SpLehORG4JPSWoctWyowWJNIvDDyg8lqhYp
 3jmOZ8aFepWW1kpnG3LKQudoRL5EpcCLuGlQCBNHyguXM18OTeCfPxkxgeIqdDec7kG5
 jb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dk5wEWFCvQRhrhbVHtFmHpph+eQ4gpvIz8pVx649H1E=;
 b=DDt5j1O6VPrbk6iIn188LSKaJYSNarz+elUZLOiBwgBriTYoGEG6B/XhHpnHtGGYNu
 fZ9YScExA04hUSaOtMGgRVPrCBTxyaWluQ3cVbWXIUxmVxQBrn2PS0Acql3Mk6/i2srZ
 BquGh4L39qKzqJO1q8ChGkRXANHiS6hTsN+xCy+74PhID6btohzXzS6as5zv2zJ0tR++
 xU52VhFuPL7Q2pf8VSTVkzULWY3KbeV35JEgxMfaQMLR5ArBSS1MXokC8K3e0ZboVr4j
 O8HORWdowZ7wOpeJ5Bf3sfPavdH/y8y2+1AIfARi3bQZiEj4k5Prlhmr+Fv27OPI87eq
 TqUA==
X-Gm-Message-State: AOAM531kqHFkbHQZUDmCt+Lf40VgQsExBjtsegZCK/3h6hBUH5T1+ZAK
 deJfHj4pNg/cJDQZWWwTDZmMZobyQfdtDQ==
X-Google-Smtp-Source: ABdhPJy+rZmz+xM3Z9Mfk16aYbaKjsJbMro4QmPMndLzkbwViccKFEUoFjvpQK/ZIZMVim2Xtroh8A==
X-Received: by 2002:ad4:44f3:: with SMTP id p19mr3052061qvt.33.1632794461619; 
 Mon, 27 Sep 2021 19:01:01 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id g12sm12530370qtm.59.2021.09.27.19.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 19:01:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 23/25] linux-user/sparc: Implement setup_sigtramp
Date: Mon, 27 Sep 2021 22:00:37 -0400
Message-Id: <20210928020039.184412-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210928020039.184412-1-richard.henderson@linaro.org>
References: <20210928020039.184412-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf31.google.com
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
Cc: peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


