Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E0D41799E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 19:19:55 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTora-0005Ed-Fb
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY9-0002wV-BM
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:49 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:39700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mToY6-00074K-JH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:59:49 -0400
Received: by mail-qt1-x82d.google.com with SMTP id j13so10053148qtq.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z6sdM0HHcKJX3xm0cdq26GIq2QyBnBfucTBir90HJQ8=;
 b=izwHaXTWBfwELcDM9unPhyjA1hL02WdAguVFjIjDGbOEcwEngy+DLf/BHM+mdesGbo
 i5NFVM9DfQoDRdv27arefaurzgH4FtCmCnNkcMit63gUMCZu+Z263VvvgMK5bw2flMQm
 KgZ6OK7+tAar4WIOveArojcEdLDDT/TYZRGUAS8vuwbOQ9CrCfEwCjgTKuwaipNFkMzZ
 IdHqTfJjJwsdmi5quk61HqKZ8vSKlY6O1cisjzVilSNtMHLtwApssFqvLW2Yzm8ZN6h2
 7t6QEV3AFJV1poFEtk3r8wau0o8B6t9N8vWXHpYdhWqyKmswG9Oh6EDAORR6FMtgGQsx
 6QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z6sdM0HHcKJX3xm0cdq26GIq2QyBnBfucTBir90HJQ8=;
 b=kfxTWTnPH8Xt6fw5YVMCF64YqbhGpQHEtwaffnDyajgPgstWq8UY4i1WD38DoYfPiH
 kLJpnrvYh0AIqaLDSiKk8Buz3FuwD7nJEWSq/VYmXpLhXhM2/DkY7xRMgDQTmFs1JFI3
 NBzK5CHGATFKZmLGL7d7xYcW9UuFnpFA5AJ1s+MKoihj1aYIdf53lcu6dLYN7w7BxhUO
 QmArskiy8BcSgwfkS+/OLVe4uOn0106H73vfTCqPGaM4eRyXF5mJ1gCBhmvuR/qgCio1
 KrNVdSD2f9f/mvx2XktwGSSa7wzmc7pvjY6SwIARAsoXoh0Cb6EKtTUk60uShOkrYWj/
 LyvQ==
X-Gm-Message-State: AOAM530hGcUJjqHXhQYJJrpSxIHaGc17gOdbFS91O1fQXZRlQWC8EAd2
 SClH7Xu2afX3NW+JKNReXguOBcK/E3ASfg==
X-Google-Smtp-Source: ABdhPJwLdNjgVrZPNIqskWOlzTo4dAP0GpyX/5aTqMfzocWqO8yv+JBpmE4nSKb2jIrITKNLoR0KaQ==
X-Received: by 2002:ac8:74a:: with SMTP id k10mr1304225qth.17.1632502785658;
 Fri, 24 Sep 2021 09:59:45 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id r13sm7141104qkk.73.2021.09.24.09.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 09:59:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 23/27] linux-user/s390x: Implement setup_sigtramp
Date: Fri, 24 Sep 2021 12:59:22 -0400
Message-Id: <20210924165926.752809-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924165926.752809-1-richard.henderson@linaro.org>
References: <20210924165926.752809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, laurent@vivier.eu,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create and record the two signal trampolines.
Use them when the guest does not use SA_RESTORER.

Cc: qemu-s390x@nongnu.org
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/target_signal.h |  2 ++
 linux-user/s390x/signal.c        | 24 ++++++++++++++++--------
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/linux-user/s390x/target_signal.h b/linux-user/s390x/target_signal.h
index bbfc464d44..64f5f42201 100644
--- a/linux-user/s390x/target_signal.h
+++ b/linux-user/s390x/target_signal.h
@@ -19,4 +19,6 @@ typedef struct target_sigaltstack {
 #include "../generic/signal.h"
 
 #define TARGET_ARCH_HAS_SETUP_FRAME
+#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
+
 #endif /* S390X_TARGET_SIGNAL_H */
diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index 80f34086d7..676b948147 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -68,7 +68,6 @@ typedef struct {
     target_sigregs sregs;
     int signo;
     target_sigregs_ext sregs_ext;
-    uint16_t retcode;
 } sigframe;
 
 #define TARGET_UC_VXRS 2
@@ -85,7 +84,6 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
-    uint16_t retcode;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
@@ -209,9 +207,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(sigframe, retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn,
-                   &frame->retcode);
+        restorer = default_sigreturn;
     }
 
     /* Set up registers for signal handler */
@@ -262,9 +258,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     if (ka->sa_flags & TARGET_SA_RESTORER) {
         restorer = ka->sa_restorer;
     } else {
-        restorer = frame_addr + offsetof(typeof(*frame), retcode);
-        __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
-                   &frame->retcode);
+        restorer = default_rt_sigreturn;
     }
 
     /* Create siginfo on the signal stack. */
@@ -405,3 +399,17 @@ long do_rt_sigreturn(CPUS390XState *env)
     unlock_user_struct(frame, frame_addr, 0);
     return -TARGET_QEMU_ESIGRETURN;
 }
+
+void setup_sigtramp(abi_ulong sigtramp_page)
+{
+    uint16_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 2 + 2, 0);
+    assert(tramp != NULL);
+
+    default_sigreturn = sigtramp_page;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_sigreturn, &tramp[0]);
+
+    default_rt_sigreturn = sigtramp_page + 2;
+    __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn, &tramp[1]);
+
+    unlock_user(tramp, sigtramp_page, 2 + 2);
+}
-- 
2.25.1


