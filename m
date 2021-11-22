Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE8458F49
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:20:21 +0100 (CET)
Received: from localhost ([::1]:52066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9F6-0001bE-GN
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:20:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp97A-0004dC-BD
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:08 -0500
Received: from [2a00:1450:4864:20::42f] (port=37854
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mp978-0005IZ-DD
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:12:08 -0500
Received: by mail-wr1-x42f.google.com with SMTP id b12so32619575wrh.4
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=itLhZ0W/RxJYtFiacTtH89yYOTpt74xZSJ/OImafFPs=;
 b=AW4G78jYOLBp0p1T9KvP8zX5TXnQteP7u98RESIlN0Ag7XxJncvyWHPugl7MaOwrMC
 QK2DDnWt7K54yiHmMDaugKGIpoWdi19PGl+9GPKbftqHKt50jaD5jxrJHjM934xj8E3S
 fLihQetD3LVB0YdRlKUx8jU4SB3obZiN+1u6XRHjXLfHXSM+HHhFUigbPOOAceZDNA9m
 VzzoyCzcN32wUwz+YZC8B910CSGdryznvrlosgVDhEQczGVz53LqvjV9RtcluSZ/qAbP
 3pE49xNt40PbGpCiDPG1c+2bQOEMUnSX60tS23Jnw9kry84Xgx/US1wyuUn85ojZZuYB
 xqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=itLhZ0W/RxJYtFiacTtH89yYOTpt74xZSJ/OImafFPs=;
 b=hw+PgLiPAOGO2vDCFV0KW69i5p3NrXOD9GMO93+v88Afsk/BU5kBIek45fuUyWxWmo
 Tl1paVS98ItUJZGqwlm3L+hHM3KsUjwnGHXuPSDSk/XshOF9unlTGnocp30edqCGOiPm
 6xLr6zOrS6grjwqqNmjqk4yNVhufxa8whUQy78I9OEHQdNc+9obIQf49quJo8N3Wd7I8
 FVOLRLSeKuYO+ziX5g5YF5rXh6WAIWwNjsRRW0RMahQqOHbtXrZwBVC+dLcVgF7LR4YI
 sNTmSar2utPUY2namxPIZAz+i1lHYwuoyv/zetNJUpcXl8WY5auyKTQ+suQyBSogkYpV
 7Pyg==
X-Gm-Message-State: AOAM533M5f7f8OnQmMLYvqK/AQMjMBtLOGboQYIHGpZjHhkY7oJIfVbF
 UBttew49I/GY9UyvKYvwIbNtmkP1F9BvJ/NqPTw=
X-Google-Smtp-Source: ABdhPJx4jT/Kl2AGsfyWkvfrPti5FLZLdpcRq2zcupMD3+vah3MUQX7LHVk+I9ceJk+/lSBvJKbjkg==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr34681147wrs.273.1637586725041; 
 Mon, 22 Nov 2021 05:12:05 -0800 (PST)
Received: from cloudburst.home (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id q84sm25364820wme.3.2021.11.22.05.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:12:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/2] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
Date: Mon, 22 Nov 2021 14:12:00 +0100
Message-Id: <20211122131200.229286-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122131200.229286-1-richard.henderson@linaro.org>
References: <20211122131200.229286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 raj.khem@gmail.com, Warner Losh <imp@bsdimp.com>, laurent@vivier.eu
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


