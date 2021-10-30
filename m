Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AF440AB2
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 19:43:53 +0200 (CEST)
Received: from localhost ([::1]:57166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgsOW-0000Lg-Tu
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryN-0001wN-Dj
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:51 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgryH-000062-Gr
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:16:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x1-20020a17090a530100b001a1efa4ebe6so9058025pjh.0
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9mkVrBs8KkxTXk1PYgQKfRHS5p1nm/1r22NtGvkuhs=;
 b=jJAIlxa9NtETcDg0nognJseQVbKUnHUR+EtritS5mmpggeecsXHrv/jxOTWAbCvs7v
 Zk7KqH6DURCNybSgHk07AKCANL7neveYz5Q8XtnKQFc4I4r93AlNQjkvAw7x00PjOmEG
 D4R2P5jXXyO/F+fX490pOYhU1v55ojcjE6Uijdu6X9usmkie+cMhU3lNAS1EC0lSrANS
 dbsxsyDpwKbaL8lJ22ssK5DvA59hpwSns8XPwdf7Cs1pv9UGx3J6RtxIlkXSg5fG5CgZ
 bLOBgUZofS1Dqd6GtDta72RJT1xxTrrojhghbOyN0QFYI90Mo+3CTP8iOS6chQme99l3
 zVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9mkVrBs8KkxTXk1PYgQKfRHS5p1nm/1r22NtGvkuhs=;
 b=Eu893p7NqcqD4d5u/KSXOYt9K2ZYU1nr7wdjDxRHkGMR41g7bRYEogWoZLyycwMiVi
 RsAw8r5mDWoPXfsesejDteIWMolqohYulsFM4pB5nZYS2vNaeA9yBusLMHnoqWaGOU5T
 b9uH+dE36m+z+UPqVrz+F5a4RrwquKKr3pa+96UDGJXgdHr4XPXBQcqEaTP0J4kHYmmH
 6OYXotPPBiWWilHyQb0P7WQVuT+QCRN9fHHOg3hd6pv4kcekt6cRU8N5G5/H6QQY51c/
 sDnhnsF2Ficq5ds3mEKZrWUQZUv3Gi9hjgAaWo9OLagQLcXtPPON9tvUQQCW8HJfOlYg
 7zKQ==
X-Gm-Message-State: AOAM530l4Qxh4b0jwOUX9IEGYUwP3KqRI+thtvySBeQR84DBHogb3M2J
 8f6jgchGhSUGp2pM/5YZRSuXgxPSpk8+Yg==
X-Google-Smtp-Source: ABdhPJw9xK7xEvWdrX5U/H2xBbeUQ+gBhA3RsnM7buHb9YdidJOraBj5Znh6eB6X9Iv8Ms0BirJ9Mw==
X-Received: by 2002:a17:90a:f182:: with SMTP id
 bv2mr1874678pjb.139.1635614203057; 
 Sat, 30 Oct 2021 10:16:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id nv4sm3111943pjb.17.2021.10.30.10.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:16:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/66] linux-user: Reorg handling for SIGSEGV
Date: Sat, 30 Oct 2021 10:15:35 -0700
Message-Id: <20211030171635.1689530-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
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


