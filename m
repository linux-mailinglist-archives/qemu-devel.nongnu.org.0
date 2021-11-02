Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F37442C6A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:26 +0100 (CET)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrr3-0001Xr-Eq
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdz-0003jg-Qj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:59 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:46676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrdq-0000ry-OC
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:07:53 -0400
Received: by mail-qv1-xf36.google.com with SMTP id g25so12008974qvf.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSgMMIuxwm2GRlSM3OSJ89oURZNxoJr58EWEVCgv90k=;
 b=dyTIrLB+JjoNSzMd66ccGjk52JUY3AoIoCl90a71D7b59nDQxn9KeA48RfTC53ZEw+
 /cP4+qKSvGRhZCJAzkMNa3turKwpnFH1kscVELkmvzcyHNugr2O+NHWhj2qs4pKIDpF0
 thytWbRpWrTeQsOIdaZ6We7z8ydeI+dHz06ZhNXqyqqDGHU26L7nzzhc27e9/CzupSEH
 GoT8lLbR1eVwppaLZgj4ydJnc8rgfOqow6YGCc4baFqxeX5VganPuuLX3pNOVbHkdunX
 EPHS6MBhdcFWsRxBZ5reFJaC/+hghbrZXCWZQQgBanywF0YgwteqluLz7VydCYnqOxtn
 Rh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSgMMIuxwm2GRlSM3OSJ89oURZNxoJr58EWEVCgv90k=;
 b=Gp+oUqVANi46MFcmTtFqHJJKF4ATmbqqwYU+/J0HYuh1tXnA+BZhLDAMCHtW8L1T8H
 Mjg6tS0MnhuTfzOUAJEhTk/d7RjHHSZ9HtFJ/TTNY1hK/gW2sMKJmmR/1M2C2OqV9hX7
 Sf2eywhjyIcm06xQN+UFyNcXgJ+0kfcpzyRcAKD4wLwCwXKZrNSsSruHaxv+m5rW8UYO
 DQCWAvPavaKG6hLjTXGTB1W7rDEHcmNHb4IJVLyvCWRMZLgZSEXrKdLoUltWm0A0ZYdk
 Jg3RDLDP7nKSyAOxmjsJZ3iYOe1PtdtEgRTGe612lMYmRGjmX6RgigLEsXL0qfl4o8HB
 ONLw==
X-Gm-Message-State: AOAM530RafpdQeFis/8aE+IORq13WEzGvTwwfCv4qwT43fN42AkoJg3O
 mnQzu7dWgCCQguxUe1ntQ0zyxzZB1jHG6g==
X-Google-Smtp-Source: ABdhPJwkSNUbeNdn9KSP2fSOEXDjStqRyOhgz4PrX8vpQZKNyDgbmy4G/NsD0xQSDxW7wyp0Sn4U/w==
X-Received: by 2002:a05:6214:4107:: with SMTP id
 kc7mr14868977qvb.12.1635851265691; 
 Tue, 02 Nov 2021 04:07:45 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm7sm3568612qkb.86.2021.11.02.04.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:07:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/60] linux-user/host/x86: Populate host_signal.h
Date: Tue,  2 Nov 2021 07:06:47 -0400
Message-Id: <20211102110740.215699-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split host_signal_pc and host_signal_write out of user-exec.c.
Drop the *BSD code, to be re-created under bsd-user/ later.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/i386/host-signal.h   |  26 ++++-
 linux-user/host/x32/host-signal.h    |   2 +-
 linux-user/host/x86_64/host-signal.h |  25 ++++-
 accel/tcg/user-exec.c                | 136 +--------------------------
 4 files changed, 51 insertions(+), 138 deletions(-)

diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
index f4b4d65031..4c8eef99ce 100644
--- a/linux-user/host/i386/host-signal.h
+++ b/linux-user/host/i386/host-signal.h
@@ -1 +1,25 @@
-#define HOST_SIGNAL_PLACEHOLDER
+/*
+ * host-signal.h: signal info dependent on the host architecture
+ *
+ * Copyright (c) 2003-2005 Fabrice Bellard
+ * Copyright (c) 2021 Linaro Limited
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
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
index b1183aa4b3..b121e6c2e9 100644
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
@@ -266,123 +253,7 @@ void *probe_access(CPUArchState *env, target_ulong addr, int size,
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
@@ -893,11 +764,6 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
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


