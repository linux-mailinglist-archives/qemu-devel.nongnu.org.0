Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED37459EA2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 09:53:45 +0100 (CET)
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpRYe-0007j8-K6
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 03:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRVf-0002Lx-9d
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:50:39 -0500
Received: from [2a00:1450:4864:20::32a] (port=50765
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mpRVd-00038z-Dd
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 03:50:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 133so18017868wme.0
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TegKkzXrFvH9IWxA6z3Z0Oh/lWQGtwfq10HmF8kapGI=;
 b=EiAur3mu6oQua79JSwuLUA/omis+x9CoWYQI9kbTqBJtd1xS3D7x9uP7m6S2/y5TUX
 zVOaPek8HwvjerLwTmSaAeFHVtTb2E9P1zc9gQfR9ZFbnwbRp+ePOHFYTV8b0Xur5Tyx
 pO0f/w/qfTYKYKyunmYcypEY8hTikn90WRvRSo8IvlXqJgqfVbEhhfi7+w/QMvMrpe0a
 Msn6fSQIzEMNX1LeqZKtI5JZUaHkBt7vOUIdbC5G8ettKUQVwEpcPfgkP1UYlnWBT79V
 +J2k2xHDDUh/z8qB7L9O+y5D24SUo66WMiMrF4yDuiBVSBHlccI1WSQ+Ns4Lox/33yRf
 y5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TegKkzXrFvH9IWxA6z3Z0Oh/lWQGtwfq10HmF8kapGI=;
 b=gseCood7A9ilCvP51VdUoA5GUam4lAVgCewuMJk7Y+CFAlAb4BV2uCsF5u1YIAMqDd
 yUAeFkttj0ADw/3wRJ9ZWz+TQOJ8rtvwhygXyzfS550di1q6DPhb5mNKoSxc4zYPzu0D
 uPBXTosna16zzMeUxHg0LK3/Tr+RVHEkPAb/baGu1u+fRiBV7NWcwSZAd9vYeJSQ0IoB
 w1+DVOk+dnuYfVnqvxqY5uTArkGr423nksKWs4zRg8DyT1qyx9Eg5FynJviNKYQsczQb
 olGHHD/Xo82TgPu4PsB88GX0YtOfuPWVOy68eOg638MfuWqeDWWcPGGcsz82+oj08MPp
 tOMA==
X-Gm-Message-State: AOAM533fjRdONhHDzcYUlKeECyYBiC93t1N/korwxpWzPu3pZtPqwxmh
 oIZpyaXqYytLq4B5jqRXN139KH5/TbQAqiSopgo=
X-Google-Smtp-Source: ABdhPJy/BIXkLLiEb5nt5QUQManbWdCX2HL+VQASGYw0hY7LRxrKhwOSBUQpQ2DzDFfm5G5jjfdTvg==
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr951931wmq.180.1637657436001; 
 Tue, 23 Nov 2021 00:50:36 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id 9sm14366078wry.0.2021.11.23.00.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 00:50:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Tue, 23 Nov 2021 09:50:30 +0100
Message-Id: <20211123085030.465072-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123085030.465072-1-richard.henderson@linaro.org>
References: <20211123085030.465072-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

All instances of rewind_if_in_safe_syscall are the same, differing only
in how the instruction point is fetched from the ucontext and the size
of the registers. Use host_signal_pc and new host_signal_set_pc
interfaces to fetch the pointer to the PC and adjust if needed. Delete
all the old copies of rewind_if_in_safe_syscall.

Acked-by: Laurent Vivier <laurent@vivier.eu>
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


