Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB54C44F14E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 06:00:16 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mll9E-0004qo-0u
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 00:00:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5x-00074Q-NC
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:53 -0500
Received: from [2607:f8b0:4864:20::d33] (port=39677
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5v-0003M8-R8
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:53 -0500
Received: by mail-io1-xd33.google.com with SMTP id c3so13847612iob.6
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bH8XlQNlVgldgvvPm+sZMzPHlugap+34WnaEJEfYxSY=;
 b=LNRHWtHvU2nuJdT/04F+aEjQprm5hv1j9RA3i8FRmGOm/gTMEbUnyaQeMqeH9xZT3R
 VZ7TRpP2hmieiM/xWNuYWdxRaJDOB0UrawWZgJvuX7aJrKfWJ2XOsmfBDxQoP9StogWe
 y/y2KKl+sUgl3yykTmOVCWOPtxEUQD6W/bWclGT99zn5gDpQgWmsPcXGAZuZSnOVIgnr
 JLdVcSjZqoCutFCBRlLL4mSpMb+Jty9ZtdIUJdBKT+1GeovpwWd6Z+54XoxuYYkxqFZk
 KUMRA33g0WH/UZY8eTD2OI61FJUllq23LoGVPDV59mh7N4LpDSkBUrGeT44/hqxtBkpr
 I0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bH8XlQNlVgldgvvPm+sZMzPHlugap+34WnaEJEfYxSY=;
 b=2TjMeKIQt9aJ6o0YOQ+PeOcadGs+ph6pTcnxOF4FUM5yUCa+CVAK6jjZvixJCweH8t
 mLrZZW2hd5tNC1KnctKvXJjGYRKFoaD1M1+KHERRUKTFyVC8p/Rvgv+cF11qsMLcwkNR
 WqZnCtRVRPvGmxdCxYsHlmtlWoov5zMyZCn48xlz8UgvClGUBtRh9dAsny0bDHnzrYub
 kn3/MyQ/skQrAcjAjh4G4QB6fBBYsWe+vsoKI4Q2SjU12fHiqLa6Y5UqF5z1rb5jxNSR
 sSaw8sCn5myY3EdA3wV+XCks+gdoLC7YkuC0mAkl7ZJ/Qlu1xPRodXULXgRGgNiwEuQ4
 Y9Tw==
X-Gm-Message-State: AOAM531o3UL0GB27/UyLc5XalLr2TVoZ4L9Tpd+bHFgDfF6M8my/Kg7r
 4C1JQGMhKqN0cfhdVo5HCY7RU8kxIE5ncA==
X-Google-Smtp-Source: ABdhPJysNrnxzM0ArcY6CwA6ZL8MTa9t/4e+ML+JiiRe+W25YWax6D/cNtJO9+3wb7uUcEZis3ogvg==
X-Received: by 2002:a05:6602:2e90:: with SMTP id
 m16mr14069223iow.92.1636779410446; 
 Fri, 12 Nov 2021 20:56:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 2/5] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Fri, 12 Nov 2021 21:56:00 -0700
Message-Id: <20211113045603.60391-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211113045603.60391-1-imp@bsdimp.com>
References: <20211113045603.60391-1-imp@bsdimp.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
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


