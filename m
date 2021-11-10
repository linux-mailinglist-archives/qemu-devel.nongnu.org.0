Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DAB44C52B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:38:22 +0100 (CET)
Received: from localhost ([::1]:44764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqc9-0003Ey-KM
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWh-0007Zl-3e
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:43 -0500
Received: from [2607:f8b0:4864:20::d33] (port=40528
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWc-0005bp-GB
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:42 -0500
Received: by mail-io1-xd33.google.com with SMTP id r8so3488481iog.7
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bH8XlQNlVgldgvvPm+sZMzPHlugap+34WnaEJEfYxSY=;
 b=O3XmAygWpA4wpIhfJM2Mui/7zk5/FckhmwJrL69ZJRVV74rIRMabSlZ3ZvzcB4hC4I
 waw6PI04HOFq5rGOBNQhOuWYuVg1RYQ+ugyq6ip2fbeZlKN6vC+rewEPPSmQ8adwheUJ
 l6bm7b3QodWFud7iFKiweSMxuFs2V1zr2Qhx7aB0uytli+hojwpGjBaqwFeL8szbVRG2
 LF/SiIJbKHx0Dam973AphdUO2jMDooHHhaqzo/klbF9c13Jo5waxNcqhsnB9TtLg9eEM
 FRL3NLuiOCaOWpFRs4kwEuKWLjInOTWra3wxMXhnaSR3XxqrZoAhjfnQP2O05irgxa0F
 rkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bH8XlQNlVgldgvvPm+sZMzPHlugap+34WnaEJEfYxSY=;
 b=w9UV2EI2KTl7WzyBDfZQQ89/mx6ogVtAKnqLyHcGluWg0JKjZ+vL5NrE/mZjaVKQri
 HrUm9xO80vOptSMu9zTc01y/fZpFzISyjtTQ9CH8Dou8OBH74ehitvitiHMwQ1TlgQ6Z
 X9nvz+D6jYWQansMxUvIYzBntYuHveSQKcVhm6ZyKUkK/7G1+Bc9Au0iVkEFkXABp6Dq
 /MIGeCX4EnATSkJDgy3oDQMozVe9K8+YwUStxdHI511SZaj17q7waOzV1FqLkdzTCYkG
 TzSJuiIb19fJGgPqoPYCLabO9qP7mnDKnEsUyuPSCxHQCcVOTdOFfa/zN093Z1QEYb3N
 xntA==
X-Gm-Message-State: AOAM533dLkDok4I4/fkF0ruL2mEW4NfGirFNyoxx0mAoktE0S7TGhkgt
 SXw4Q6DEwOQlD725KP5MZ2MsHYqHIiMXyA==
X-Google-Smtp-Source: ABdhPJz8j9BNCvvz2m4MaDihTx2H1xo2wyvMxO0Q1MVsrDoMtfSq8xP4yHd56V1jKplTGkeLX8J2eA==
X-Received: by 2002:a02:734d:: with SMTP id a13mr84220jae.113.1636561956982;
 Wed, 10 Nov 2021 08:32:36 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:36 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 2/6] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Wed, 10 Nov 2021 09:31:29 -0700
Message-Id: <20211110163133.76357-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211110163133.76357-1-imp@bsdimp.com>
References: <20211110163133.76357-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All instances of rewind_if_in_safe_syscall are the same, differing only
in how the instruction point is fetched from the ucontext and the size
of the registers. Use host_signal_pc and new host_signal_set_pc
interfaces to fetch the pointer to the PC and adjust if needed. Delete
all the old copies of rewind_if_in_safe_syscall.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/host/aarch64/hostdep.h | 20 --------------------
 linux-user/host/arm/hostdep.h     | 20 --------------------
 linux-user/host/i386/hostdep.h    | 20 --------------------
 linux-user/host/ppc64/hostdep.h   | 20 --------------------
 linux-user/host/riscv/hostdep.h   | 20 --------------------
 linux-user/host/s390x/hostdep.h   | 20 --------------------
 linux-user/host/x86_64/hostdep.h  | 20 --------------------
 linux-user/safe-syscall.h         |  3 +++
 linux-user/signal.c               | 14 +++++++++++++-
 9 files changed, 16 insertions(+), 141 deletions(-)

diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
index a8d41a21ad..39299d798a 100644
--- a/linux-user/host/aarch64/hostdep.h
+++ b/linux-user/host/aarch64/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    __u64 *pcreg = &uc->uc_mcontext.pc;
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.h
index 9276fe6ceb..86b137875a 100644
--- a/linux-user/host/arm/hostdep.h
+++ b/linux-user/host/arm/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    unsigned long *pcreg = &uc->uc_mcontext.arm_pc;
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/i386/hostdep.h b/linux-user/host/i386/hostdep.h
index 073be74d87..ce7136501f 100644
--- a/linux-user/host/i386/hostdep.h
+++ b/linux-user/host/i386/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    greg_t *pcreg = &uc->uc_mcontext.gregs[REG_EIP];
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/ppc64/hostdep.h b/linux-user/host/ppc64/hostdep.h
index 98979ad917..0c290dd904 100644
--- a/linux-user/host/ppc64/hostdep.h
+++ b/linux-user/host/ppc64/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    unsigned long *pcreg = &uc->uc_mcontext.gp_regs[PT_NIP];
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/riscv/hostdep.h b/linux-user/host/riscv/hostdep.h
index 2ba07456ae..7f67c22868 100644
--- a/linux-user/host/riscv/hostdep.h
+++ b/linux-user/host/riscv/hostdep.h
@@ -11,24 +11,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    unsigned long *pcreg = &uc->uc_mcontext.__gregs[REG_PC];
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/s390x/hostdep.h b/linux-user/host/s390x/hostdep.h
index 4f0171f36f..d801145854 100644
--- a/linux-user/host/s390x/hostdep.h
+++ b/linux-user/host/s390x/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    unsigned long *pcreg = &uc->uc_mcontext.psw.addr;
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/host/x86_64/hostdep.h b/linux-user/host/x86_64/hostdep.h
index a4fefb5114..9c62bd26bd 100644
--- a/linux-user/host/x86_64/hostdep.h
+++ b/linux-user/host/x86_64/hostdep.h
@@ -15,24 +15,4 @@
 /* We have a safe-syscall.inc.S */
 #define HAVE_SAFE_SYSCALL
 
-#ifndef __ASSEMBLER__
-
-/* These are defined by the safe-syscall.inc.S file */
-extern char safe_syscall_start[];
-extern char safe_syscall_end[];
-
-/* Adjust the signal context to rewind out of safe-syscall if we're in it */
-static inline void rewind_if_in_safe_syscall(void *puc)
-{
-    ucontext_t *uc = puc;
-    greg_t *pcreg = &uc->uc_mcontext.gregs[REG_RIP];
-
-    if (*pcreg > (uintptr_t)safe_syscall_start
-        && *pcreg < (uintptr_t)safe_syscall_end) {
-        *pcreg = (uintptr_t)safe_syscall_start;
-    }
-}
-
-#endif /* __ASSEMBLER__ */
-
 #endif
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index 6bc0390262..aaa9ffc0e2 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -127,6 +127,9 @@
 #ifdef HAVE_SAFE_SYSCALL
 /* The core part of this function is implemented in assembly */
 extern long safe_syscall_base(int *pending, long number, ...);
+/* These are defined by the safe-syscall.inc.S file */
+extern char safe_syscall_start[];
+extern char safe_syscall_end[];
 
 #define safe_syscall(...)                                               \
     ({                                                                  \
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 81c45bfce9..ee038c2399 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -793,7 +793,19 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
     return 1; /* indicates that the signal was queued */
 }
 
-#ifndef HAVE_SAFE_SYSCALL
+#ifdef HAVE_SAFE_SYSCALL
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
+static inline void rewind_if_in_safe_syscall(void *puc)
+{
+    ucontext_t *uc = (ucontext_t *)puc;
+    uintptr_t pcreg = host_signal_pc(uc);
+
+    if (pcreg > (uintptr_t)safe_syscall_start
+        && pcreg < (uintptr_t)safe_syscall_end) {
+        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
+    }
+}
+#else
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
     /* Default version: never rewind */
-- 
2.33.0


