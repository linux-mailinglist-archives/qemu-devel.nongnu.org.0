Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D314244E4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:41:44 +0200 (CEST)
Received: from localhost ([::1]:49564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAvH-0008Gg-LE
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdg-0007HA-LK
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:32 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:47082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdP-0007yC-TW
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id u7so2930671pfg.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RM4frkJ9oGSurKrq2xHSeeOjGSj4FAezDLf1c2velgE=;
 b=B5SLRiWdiYCWncx0IqmRwY3w/E9gdZeoQ/GMb+BS8dD5LMed0UIdoin0F8wxIHlsnx
 A83V4Ig50D+GPj8wNDkjmxugFR+wlShVzSCfyH9mnRA+hSUsl0bi5yR3+pDpjSzKjbY3
 zYygn3JTTSx6kayhWFjUW2NnMDhOgm0LXzkq7QP/oi1MbQYLz5unWfAP+V0qmWwRcRd0
 JBuBeiZAnlG85CPm294iQZt4CoLPVLwt90iM4ENMsVJHzgANW7RoAqRvbKY1/MBwwSrf
 cnd7JGkrvAZ3LuFtHsjVxwsiKjuwcoPqvR7PAx7vFJ6rtWRg6KwStxmC8TO2FXHzYM4T
 zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RM4frkJ9oGSurKrq2xHSeeOjGSj4FAezDLf1c2velgE=;
 b=dNjAhpxurxmFbdG5d4d1ouXCVEqfkxAbxVWIB85kltIZWRrFnIdyZPWkdaoVQnivyq
 n29mkhHomRYdDJV4IMbM2+gNikyQt4eIrtClN2rHMSnZEK45vzHo/Fm7HVYO2X4cXmy9
 i8rJ/AhL+gxtNqxSI6srAvvbmHUf7lDbegJWeUXNa7ff1MwuW8YHoxUQ8JAFi5J/coWF
 HcnNGOaYZim0DWkNhOVfBre76QbyGuRKVMu8fI8CmCfmTrsx8b8BMiPI9v6PD2h733Rl
 VcKtV39Ngp+dcQhLCYz0SF5VaEORi3asbBKzWBrmO9zHRNcztjZLwLVFLP90lBiwxfnA
 elqQ==
X-Gm-Message-State: AOAM533Ne8RkQhTD/PE20ti77Ep4i8kKWdrt6MahPF7MHuLjd6F46yG7
 iH2SCv2lYjQ/urHq+rM2XP5HETibBD9TXg==
X-Google-Smtp-Source: ABdhPJwlxCnerb2OhzrOv0rgwAGyESZVTdp04EVr7MPax2s19FkWqkKFUYnEgKTQM24bW+5Dcbn7CQ==
X-Received: by 2002:aa7:8e4b:0:b0:44c:77f9:9000 with SMTP id
 d11-20020aa78e4b000000b0044c77f99000mr11981685pfr.7.1633540994530; 
 Wed, 06 Oct 2021 10:23:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/41] linux-user/host/x86: Populate host_signal.h
Date: Wed,  6 Oct 2021 10:22:33 -0700
Message-Id: <20211006172307.780893-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/i386/host-signal.h   |  25 ++++-
 linux-user/host/x32/host-signal.h    |   2 +-
 linux-user/host/x86_64/host-signal.h |  25 ++++-
 accel/tcg/user-exec.c                | 136 +--------------------------
 4 files changed, 50 insertions(+), 138 deletions(-)

diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
index f4b4d65031..ccbbee5082 100644
--- a/linux-user/host/i386/host-signal.h
+++ b/linux-user/host/i386/host-signal.h
@@ -1 +1,24 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef I386_HOST_SIGNAL_H
+#define I386_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_EIP];
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
+        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
+}
+
+#endif
diff --git a/linux-user/host/x32/host-signal.h b/linux-user/host/x32/host-signal.h
index f4b4d65031..26800591d3 100644
--- a/linux-user/host/x32/host-signal.h
+++ b/linux-user/host/x32/host-signal.h
@@ -1 +1 @@
-#define HOST_SIGNAL_PLACEHOLDER
+#include "../x86_64/host-signal.h"
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/host-signal.h
index f4b4d65031..883d2fcf65 100644
--- a/linux-user/host/x86_64/host-signal.h
+++ b/linux-user/host/x86_64/host-signal.h
@@ -1 +1,24 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (C) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef X86_64_HOST_SIGNAL_H
+#define X86_64_HOST_SIGNAL_H
+
+static inline uintptr_t host_signal_pc(ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_RIP];
+}
+
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
+{
+    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
+        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
+}
+
+#endif
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a5ef684b64..06d507b4b0 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -29,19 +29,6 @@
 #include "trace/trace-root.h"
 #include "internal.h"
 
-#undef EAX
-#undef ECX
-#undef EDX
-#undef EBX
-#undef ESP
-#undef EBP
-#undef ESI
-#undef EDI
-#undef EIP
-#ifdef __linux__
-#include <sys/ucontext.h>
-#endif
-
 __thread uintptr_t helper_retaddr;
 
 //#define DEBUG_SIGNAL
@@ -268,123 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
     return size ? g2h(env_cpu(env), addr) : NULL;
 }
 
-#if defined(__i386__)
-
-#if defined(__NetBSD__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
-#define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
-#define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define EIP_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_eip))
-#define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
-#define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#elif defined(__OpenBSD__)
-#include <machine/trap.h>
-#define EIP_sig(context)     ((context)->sc_eip)
-#define TRAP_sig(context)    ((context)->sc_trapno)
-#define ERROR_sig(context)   ((context)->sc_err)
-#define MASK_sig(context)    ((context)->sc_mask)
-#define PAGE_FAULT_TRAP      T_PAGEFLT
-#else
-#define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
-#define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
-#define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
-#define MASK_sig(context)    ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP      0xe
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
-    ucontext_t *uc = puc;
-#elif defined(__OpenBSD__)
-    struct sigcontext *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-    unsigned long pc;
-    int trapno;
-
-#ifndef REG_EIP
-/* for glibc 2.1 */
-#define REG_EIP    EIP
-#define REG_ERR    ERR
-#define REG_TRAPNO TRAPNO
-#endif
-    pc = EIP_sig(uc);
-    trapno = TRAP_sig(uc);
-    return handle_cpu_signal(pc, info,
-                             trapno == PAGE_FAULT_TRAP ?
-                             (ERROR_sig(uc) >> 1) & 1 : 0,
-                             &MASK_sig(uc));
-}
-
-#elif defined(__x86_64__)
-
-#ifdef __NetBSD__
-#include <machine/trap.h>
-#define PC_sig(context)       _UC_MACHINE_PC(context)
-#define TRAP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
-#define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#elif defined(__OpenBSD__)
-#include <machine/trap.h>
-#define PC_sig(context)       ((context)->sc_rip)
-#define TRAP_sig(context)     ((context)->sc_trapno)
-#define ERROR_sig(context)    ((context)->sc_err)
-#define MASK_sig(context)     ((context)->sc_mask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#elif defined(__FreeBSD__) || defined(__DragonFly__)
-#include <ucontext.h>
-#include <machine/trap.h>
-
-#define PC_sig(context)  (*((unsigned long *)&(context)->uc_mcontext.mc_rip))
-#define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
-#define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       T_PAGEFLT
-#else
-#define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
-#define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
-#define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
-#define MASK_sig(context)     ((context)->uc_sigmask)
-#define PAGE_FAULT_TRAP       0xe
-#endif
-
-int cpu_signal_handler(int host_signum, void *pinfo,
-                       void *puc)
-{
-    siginfo_t *info = pinfo;
-    unsigned long pc;
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
-    ucontext_t *uc = puc;
-#elif defined(__OpenBSD__)
-    struct sigcontext *uc = puc;
-#else
-    ucontext_t *uc = puc;
-#endif
-
-    pc = PC_sig(uc);
-    return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
-                             (ERROR_sig(uc) >> 1) & 1 : 0,
-                             &MASK_sig(uc));
-}
-
-#elif defined(_ARCH_PPC)
+#if defined(_ARCH_PPC)
 
 /***********************************************************************
  * signal context platform-specific definitions
@@ -895,11 +766,6 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
 }
-
-#else
-
-#error host CPU specific signal handler needed
-
 #endif
 
 /* The softmmu versions of these helpers are in cputlb.c.  */
-- 
2.25.1


