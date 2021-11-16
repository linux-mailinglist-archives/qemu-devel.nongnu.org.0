Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E36452FC9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:05:02 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwGr-00048F-S5
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:05:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEz-0001RD-K7
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:05 -0500
Received: from [2a00:1450:4864:20::432] (port=34427
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwEx-0004uo-GL
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id d5so36755648wrc.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itLhZ0W/RxJYtFiacTtH89yYOTpt74xZSJ/OImafFPs=;
 b=tFvNphddBVCkvQafdJeMpN24ToXCF9JiN5a8kPZhAWZ9TtUqhAmlFp/KTdfeFs7y/v
 4tJWCIBtHW8m16ZyPhwnnRBx3gI80uKH6n0sGM+t8UE4DGADTQqm7THx0kXNDu1fGIEO
 TYJOd7lQ6P4Nib3DfqFg6AmTpzZG23Qkw2wU7Cz0x+mzjGR0z24cHdO24V1Lqa/PpMhz
 uPTMblOy0FIMfP14P+TuabdCelCFC9YXqM7cWPELG3vn+1dc0WCrmrVdh2m9BZSHZuDp
 Wf6I5XD4sy0dEOfSnhcR61MGKjQwdxlmQAJtuOnb/1MOyUAqEmjvPjpZk8OcCL3YvTRi
 xVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itLhZ0W/RxJYtFiacTtH89yYOTpt74xZSJ/OImafFPs=;
 b=r1UIOiBL2QVXa1pBWl6JVbrrNm4xlhA3svSQPvzVBkVBJqLQvQ9PF5/2j+74il8zvc
 iFBNdhJrxw7ZL9hEwtIsdaZyl5Yj+O6xv+gd/OPz3qBnDBk/+8I0ULKxjqoXkVBmk67t
 ILDh+7dKh8L5MTlRpjYBbfkumiH82UYRsxwdTNKRTgFAAD1JU/dcLI0c1ARCYlSEePYL
 EFosNNdOxm5aZIC1cld709tBKI4dzOsoliFvzXt92zEsSok+IIbTTkfmyucnyP92Hcvc
 bBFNR9tCV9hEpkSGMuoYpJsfxTfnqaccgFNuoNo3LJKfd5rkk/foJRFi3aWNwX+c7ved
 /0qA==
X-Gm-Message-State: AOAM532/O11ErU8bGoDfwaOgUEUrkijN8v/2rTKwoJO8/GohHPRVO6Tu
 LlUPWreETnRzuU4qgne4253btHxHbyc3pMF4ZPQ=
X-Google-Smtp-Source: ABdhPJwp+QeRqneOScXm3pE3sB3Y6XafHUvqUfXe3wraJSk5WHmMtGGrtGbg+OLyXk+N5jU/P6DRaw==
X-Received: by 2002:a05:6000:1842:: with SMTP id
 c2mr8329039wri.301.1637060582023; 
 Tue, 16 Nov 2021 03:03:02 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/9] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Tue, 16 Nov 2021 12:02:49 +0100
Message-Id: <20211116110256.365484-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

All instances of rewind_if_in_safe_syscall are the same, differing only
in how the instruction point is fetched from the ucontext and the size
of the registers. Use host_signal_pc and new host_signal_set_pc
interfaces to fetch the pointer to the PC and adjust if needed. Delete
all the old copies of rewind_if_in_safe_syscall.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211113045603.60391-3-imp@bsdimp.com>
[rth: include safe-syscall.h, simplify ifdefs]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/hostdep.h | 20 --------------------
 linux-user/host/arm/hostdep.h     | 20 --------------------
 linux-user/host/i386/hostdep.h    | 20 --------------------
 linux-user/host/ppc64/hostdep.h   | 20 --------------------
 linux-user/host/riscv/hostdep.h   | 20 --------------------
 linux-user/host/s390x/hostdep.h   | 20 --------------------
 linux-user/host/x86_64/hostdep.h  | 20 --------------------
 linux-user/safe-syscall.h         |  3 +++
 linux-user/signal.c               | 15 ++++++++++++---
 9 files changed, 15 insertions(+), 143 deletions(-)

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
index 81c45bfce9..6d5e5b698c 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -31,6 +31,7 @@
 #include "trace.h"
 #include "signal-common.h"
 #include "host-signal.h"
+#include "safe-syscall.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
@@ -793,12 +794,20 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
     return 1; /* indicates that the signal was queued */
 }
 
-#ifndef HAVE_SAFE_SYSCALL
+
+/* Adjust the signal context to rewind out of safe-syscall if we're in it */
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
-    /* Default version: never rewind */
-}
+#ifdef HAVE_SAFE_SYSCALL
+    ucontext_t *uc = (ucontext_t *)puc;
+    uintptr_t pcreg = host_signal_pc(uc);
+
+    if (pcreg > (uintptr_t)safe_syscall_start
+        && pcreg < (uintptr_t)safe_syscall_end) {
+        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
+    }
 #endif
+}
 
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 {
-- 
2.25.1


