Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B9E41F2C9
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:15:19 +0200 (CEST)
Received: from localhost ([::1]:53646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWM7y-0007pn-55
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4u-0004kb-VE
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:09 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:42565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM4q-0004zU-GX
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:08 -0400
Received: by mail-qt1-x830.google.com with SMTP id f15so9620249qtv.9
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eo69a6qpbSWMyVxfRxEgkjHG9EovPVD2b2o16GmRH3A=;
 b=XRgiJ10Ug34xSTcmUFKiRO3yy79GDGINSCTIYpW+7TMC8e/dIspBS2bX21aHKxy9Ta
 lkXg016F0vBrAWZtc+E+0BAb6TL5an2ESSNFiaoXjrd1w2/dKylGd/aZd1y7MhcRBMuD
 H/OFw9qLL+lch4y3JRGM2UrP4l6MRIlpZ9hPiHSK0pBXPDmIj7X/pPSW5WR4Q1ynydW9
 d+zTbuXcpPLjJUZCeSZEi6yGAub8XLt9FeQ/g04dia35OeOnrPDS5Pod7tOiwsSMn539
 1nhytwrv3LpyGWCt17Q8zNgXSNY6/TBsfqRaY+JJlWlsBvaOjxmis+YGUCwbAOM3zjAx
 xydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eo69a6qpbSWMyVxfRxEgkjHG9EovPVD2b2o16GmRH3A=;
 b=cHgCyfSFvJHhSHtOp6zt2z5bZ/+p1aZTOjas8xTbAN9Ee+X8b6MTOBmWOEZq1XSOTf
 1BUzWT7dYy7xl8imnEzOVeBwLgFCVN4pq2JNB2W4GrbbyN+TiNDG3raJFeYgp9McZFFy
 EE8skfbZXkFfLOKAgo6DY5qDPjvSc7vbhDWcii6XgBjnCFNC19vgq4heE1lF9XpCmSBK
 WUlFixGFU5Z6qzA0YB1T/j2Zry71lsyHbTyoS5AeuQH5sLIzd10puUQRYne0imArx9fy
 SfnXlXGuD1UFbi3sD0vxKui5a/mgs8WgozOnmrH/zEsku0k6tDpe1WE5h+YB0uexjH/R
 SufQ==
X-Gm-Message-State: AOAM531R+JGiO+0/vuvYf3L9xd06NW3p9vlOWR4oA8vKTXfLiBUyekct
 R5pHP8bDZTtbEngBMF14wfiEU5oH2+RVpg==
X-Google-Smtp-Source: ABdhPJyJn5YoLWokhg49Z40gIqfG1YSuS8DOXmYbIw4vE1TiJ8HJUjzedDF7Ski/n0xVW73x5DUtLA==
X-Received: by 2002:ac8:5f13:: with SMTP id x19mr14548782qta.305.1633108319686; 
 Fri, 01 Oct 2021 10:11:59 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:11:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/41] linux-user/host/x86: Populate host_signal.h
Date: Fri,  1 Oct 2021 13:11:17 -0400
Message-Id: <20211001171151.1739472-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
index de4565f13e..b5d06183db 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -29,19 +29,6 @@
 #include "trace/trace-root.h"
 #include "trace/mem.h"
 
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


