Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF3142E7A0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:18:47 +0200 (CEST)
Received: from localhost ([::1]:43958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEgA-0004Nu-Df
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYj-0006nY-Da
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:05 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEYe-00007j-Sq
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:05 -0400
Received: by mail-pg1-x529.google.com with SMTP id 66so7427845pgc.9
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9mkVrBs8KkxTXk1PYgQKfRHS5p1nm/1r22NtGvkuhs=;
 b=LzliRjNYDdOsxA/c9NGwIFQJfFDE7aO7DwVsTbt7JLT5VYBSA6+0JY3pFdQPcAHQEu
 Wd5QuK6KwWQ5IbUnM9rf9xynkwpWrcX3gXg8uO2mrWfBQ8vgP0eSJwHs1uYnvy9dMht4
 Ed6/ZGj+pK4NVmDMZ7rMEZ8FzPpEuO2Hqzoo851XjWX2wckvIxUXG6YuyUuuJ9gZ47YW
 tjvmp6s50QgV3tdib0WH7vums1uD4kC3J4N5fZTD2rZMtmzb9Ez6FudvOFUEDXW9/kzO
 rz86vaGdR2llfxh7lJ7/zAHWYX77jgYZgLVyDD/gg89e8h2vQrLYRExIPTyz4P2ujkcG
 8HRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9mkVrBs8KkxTXk1PYgQKfRHS5p1nm/1r22NtGvkuhs=;
 b=y3VKEt4kD3WR9sVlUDJyKbBcbjR76GoLdUGrPIUYey6elwQTcpaAPobiUe9wrSqfmP
 92h6A7VKFZ9GPNkF3OpRcnW1ZhKL3rZJWqrUEzXIsIegN5pshHxbOFPl53hKu+LP87m7
 7oT7SYGnvvx+aXkueWihTNnlsGPChGJ/DmuZ2F6qwB2Na0vKLeo/E3r/hFdZ70ilkgBr
 w+vJCKIjiebr94yZjIC/CNAX7WYhF+jA/tazMjg/2VUDX5qnQauiSO/dTnrDpL1dazPj
 VwCWKVayj3BTUzxRYPPo7rbShuEWA+6otwQtexpw7wxiR0QMr5pD4vVSeCLlqOpr9xfe
 Ct3A==
X-Gm-Message-State: AOAM532TGNpswZ9iW0eB2b1k9iqai6AedfueVOC3QAJBxSjSMNJHjxU/
 YNkr/KduwulwJmC99cRDVfmYCf8jrqD8BA==
X-Google-Smtp-Source: ABdhPJwpBNlgmvuWD6b2+nBYMHHVs/Gc1UYiXG0oDcBW3Y6my31yQXuYQAqXr3TPSAKHJ7k11hD+8A==
X-Received: by 2002:a05:6a00:22d1:b0:44c:f752:a216 with SMTP id
 f17-20020a056a0022d100b0044cf752a216mr9108375pfj.45.1634271059437; 
 Thu, 14 Oct 2021 21:10:59 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:10:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/67] linux-user: Reorg handling for SIGSEGV
Date: Thu, 14 Oct 2021 21:09:52 -0700
Message-Id: <20211015041053.2769193-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add stub host-signal.h for all linux-user hosts.
Add new code replacing cpu_signal_handler.
Full migration will happen one host at a time.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/host-signal.h |   1 +
 linux-user/host/arm/host-signal.h     |   1 +
 linux-user/host/i386/host-signal.h    |   1 +
 linux-user/host/mips/host-signal.h    |   1 +
 linux-user/host/ppc/host-signal.h     |   1 +
 linux-user/host/ppc64/host-signal.h   |   1 +
 linux-user/host/riscv/host-signal.h   |   1 +
 linux-user/host/s390/host-signal.h    |   1 +
 linux-user/host/s390x/host-signal.h   |   1 +
 linux-user/host/sparc/host-signal.h   |   1 +
 linux-user/host/sparc64/host-signal.h |   1 +
 linux-user/host/x32/host-signal.h     |   1 +
 linux-user/host/x86_64/host-signal.h  |   1 +
 linux-user/signal.c                   | 109 ++++++++++++++++++++++----
 14 files changed, 106 insertions(+), 16 deletions(-)
 create mode 100644 linux-user/host/aarch64/host-signal.h
 create mode 100644 linux-user/host/arm/host-signal.h
 create mode 100644 linux-user/host/i386/host-signal.h
 create mode 100644 linux-user/host/mips/host-signal.h
 create mode 100644 linux-user/host/ppc/host-signal.h
 create mode 100644 linux-user/host/ppc64/host-signal.h
 create mode 100644 linux-user/host/riscv/host-signal.h
 create mode 100644 linux-user/host/s390/host-signal.h
 create mode 100644 linux-user/host/s390x/host-signal.h
 create mode 100644 linux-user/host/sparc/host-signal.h
 create mode 100644 linux-user/host/sparc64/host-signal.h
 create mode 100644 linux-user/host/x32/host-signal.h
 create mode 100644 linux-user/host/x86_64/host-signal.h

diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch64/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/aarch64/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/arm/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/i386/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/mips/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/ppc/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/ppc64/host-signal.h b/linux-user/host/ppc64/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/ppc64/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/riscv/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/s390/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/s390x/host-signal.h b/linux-user/host/s390x/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/s390x/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/sparc/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/sparc64/host-signal.h b/linux-user/host/sparc64/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/sparc64/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/x32/host-signal.h b/linux-user/host/x32/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/x32/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/host-signal.h
new file mode 100644
index 0000000000..f4b4d65031
--- /dev/null
+++ b/linux-user/host/x86_64/host-signal.h
@@ -0,0 +1 @@
+#define HOST_SIGNAL_PLACEHOLDER
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 14d8fdfde1..6900acb122 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
 #include "exec/gdbstub.h"
+#include "hw/core/tcg-cpu-ops.h"
 
 #include <sys/ucontext.h>
 #include <sys/resource.h>
@@ -29,6 +30,7 @@
 #include "loader.h"
 #include "trace.h"
 #include "signal-common.h"
+#include "host-signal.h"
 
 static struct target_sigaction sigact_table[TARGET_NSIG];
 
@@ -769,41 +771,116 @@ static inline void rewind_if_in_safe_syscall(void *puc)
 }
 #endif
 
-static void host_signal_handler(int host_signum, siginfo_t *info,
-                                void *puc)
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
 {
     CPUArchState *env = thread_cpu->env_ptr;
     CPUState *cpu = env_cpu(env);
     TaskState *ts = cpu->opaque;
-
-    int sig;
     target_siginfo_t tinfo;
     ucontext_t *uc = puc;
     struct emulated_sigtable *k;
+    int guest_sig;
 
+#ifdef HOST_SIGNAL_PLACEHOLDER
     /* the CPU emulator uses some host signals to detect exceptions,
        we forward to it some signals */
-    if ((host_signum == SIGSEGV || host_signum == SIGBUS)
+    if ((host_sig == SIGSEGV || host_sig == SIGBUS)
         && info->si_code > 0) {
-        if (cpu_signal_handler(host_signum, info, puc))
+        if (cpu_signal_handler(host_sig, info, puc)) {
             return;
+        }
     }
+#else
+    uintptr_t pc = 0;
+    bool sync_sig = false;
+
+    /*
+     * Non-spoofed SIGSEGV and SIGBUS are synchronous, and need special
+     * handling wrt signal blocking and unwinding.
+     */
+    if ((host_sig == SIGSEGV || host_sig == SIGBUS) && info->si_code > 0) {
+        MMUAccessType access_type;
+        uintptr_t host_addr;
+        abi_ptr guest_addr;
+        bool is_write;
+
+        host_addr = (uintptr_t)info->si_addr;
+
+        /*
+         * Convert forcefully to guest address space: addresses outside
+         * reserved_va are still valid to report via SEGV_MAPERR.
+         */
+        guest_addr = h2g_nocheck(host_addr);
+
+        pc = host_signal_pc(uc);
+        is_write = host_signal_write(info, uc);
+        access_type = adjust_signal_pc(&pc, is_write);
+
+        if (host_sig == SIGSEGV) {
+            const struct TCGCPUOps *tcg_ops;
+
+            if (info->si_code == SEGV_ACCERR && h2g_valid(host_addr)) {
+                /* If this was a write to a TB protected page, restart. */
+                if (is_write &&
+                    handle_sigsegv_accerr_write(cpu, &uc->uc_sigmask,
+                                                pc, guest_addr)) {
+                    return;
+                }
+
+                /*
+                 * With reserved_va, the whole address space is PROT_NONE,
+                 * which means that we may get ACCERR when we want MAPERR.
+                 */
+                if (page_get_flags(guest_addr) & PAGE_VALID) {
+                    /* maperr = false; */
+                } else {
+                    info->si_code = SEGV_MAPERR;
+                }
+            }
+
+            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+
+            tcg_ops = CPU_GET_CLASS(cpu)->tcg_ops;
+            tcg_ops->tlb_fill(cpu, guest_addr, 0, access_type,
+                              MMU_USER_IDX, false, pc);
+            g_assert_not_reached();
+        } else {
+            sigprocmask(SIG_SETMASK, &uc->uc_sigmask, NULL);
+        }
+
+        sync_sig = true;
+    }
+#endif
 
     /* get target signal number */
-    sig = host_to_target_signal(host_signum);
-    if (sig < 1 || sig > TARGET_NSIG)
+    guest_sig = host_to_target_signal(host_sig);
+    if (guest_sig < 1 || guest_sig > TARGET_NSIG) {
         return;
-    trace_user_host_signal(env, host_signum, sig);
+    }
+    trace_user_host_signal(env, host_sig, guest_sig);
+
+    host_to_target_siginfo_noswap(&tinfo, info);
+    k = &ts->sigtab[guest_sig - 1];
+    k->info = tinfo;
+    k->pending = guest_sig;
+    ts->signal_pending = 1;
+
+#ifndef HOST_SIGNAL_PLACEHOLDER
+    /*
+     * For synchronous signals, unwind the cpu state to the faulting
+     * insn and then exit back to the main loop so that the signal
+     * is delivered immediately.
+     */
+    if (sync_sig) {
+        cpu->exception_index = EXCP_INTERRUPT;
+        cpu_loop_exit_restore(cpu, pc);
+    }
+#endif
 
     rewind_if_in_safe_syscall(puc);
 
-    host_to_target_siginfo_noswap(&tinfo, info);
-    k = &ts->sigtab[sig - 1];
-    k->info = tinfo;
-    k->pending = sig;
-    ts->signal_pending = 1;
-
-    /* Block host signals until target signal handler entered. We
+    /*
+     * Block host signals until target signal handler entered. We
      * can't block SIGSEGV or SIGBUS while we're executing guest
      * code in case the guest code provokes one in the window between
      * now and it getting out to the main loop. Signals will be
-- 
2.25.1


