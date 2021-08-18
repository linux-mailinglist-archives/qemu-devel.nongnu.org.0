Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3618C3F0C7E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:13:19 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRw6-0005jB-9w
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGRA2-0007zE-9W
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9z-0002sv-Sb
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:38 -0400
Received: by mail-pf1-x42e.google.com with SMTP id 18so3189244pfh.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7LbiD1EGGCl2q8JdU+/Jh17yOyleDItOlBQsQxN3nVw=;
 b=Sfao3FEaEbTPYBna6kDDZCVXFTWRtUZ79FjdOKfAnzDOXMNIqacPDLjgmWy5kr6wHY
 G3Sk2tp1O5aHxhOuKKUEbVz+PE3g/1C7QuANWil2uh0j1zKbZhgfOBkvlADnuRzK1l9B
 jbXljsPWKKZNfP0lt1rrdAPBLYeIgNLG+Y29iwuoIwQ2jy0JQe1TkWtHhEWH46+OCvw+
 C2iO6vHTKEOrEcxT6qaS04TP3ixovTczU3XIdi3nBI4M/IwHdCXjuJEfqM8SKwLC6ePO
 VR1ZGyAfqQcrvF2Z0/xXPdeBzHdl8fj/V4Htf8CdHcV9uKgagUOoxfvUAuOO2WnNJhrM
 AFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LbiD1EGGCl2q8JdU+/Jh17yOyleDItOlBQsQxN3nVw=;
 b=Ynq/epjdPGYMc8Duugab8U86rpQkyVNEdZwOSkObtHpHT+eIaLVOwDxS3TLeUxjSc2
 asIKlRbp2eFOKQeR7Apiipb+wc0003rOOoBZktr0ND7lQKfh2/RP27vBN4PLh10+1t2x
 ieMQ4isJcAbo/EaQi4Vb1yKtQElSK9bUEJehEuKThljkdW2mc2uQtSV4IIyG8MAzWHmb
 67thALzdfXgU/f0YRWm+5BFk01NgdG6NCmy1feGfN69l8ah/1GNoOWrJYl8kkUg0oTy4
 OK/wePwRQXwpj2QOa8SrROACAmOh+SreABw+WBWijZr3uSX0TZietGB8JLtMU+SMrSfJ
 E8og==
X-Gm-Message-State: AOAM5312FrWHC5Ybr5RTTL2WXP7gDG1YOHPQVNyKMHYcPERm19x79y8X
 vNH3k++rq8U8JvkBGPatoWvXdBbcHeI3+w==
X-Google-Smtp-Source: ABdhPJwMHWxC4OG/UOZ9puRmCVifDhGFtJ7EA8sxh2Vw9zSE/JEvpKn6Ipza7av7jOyBESFD/+4k8g==
X-Received: by 2002:a63:5902:: with SMTP id n2mr10140756pgb.305.1629314614520; 
 Wed, 18 Aug 2021 12:23:34 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 59/66] accel/tcg: Handle SIGBUS in handle_cpu_signal
Date: Wed, 18 Aug 2021 09:19:13 -1000
Message-Id: <20210818191920.390759-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've been registering host SIGBUS, but then treating it
exactly like SIGSEGV.

Handle BUS_ADRALN via cpu_unaligned_access, but allow other
SIGBUS si_codes to continue into the host-to-guest signal
coversion code in host_signal_handler.  Unwind the guest
state so that we report the correct guest PC for the fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c  | 188 +++++++++++++++++++++++++++--------------
 linux-user/signal.c    |  36 +++++---
 accel/tcg/trace-events |   3 +-
 3 files changed, 152 insertions(+), 75 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 1c9486c76d..c7ee5accb3 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -57,17 +57,123 @@ static void QEMU_NORETURN cpu_exit_tb_from_sighandler(CPUState *cpu,
     cpu_loop_exit_noexc(cpu);
 }
 
-/* 'pc' is the host PC at which the exception was raised. 'address' is
-   the effective address of the memory exception. 'is_write' is 1 if a
-   write caused the exception and otherwise 0'. 'old_set' is the
-   signal set which should be restored */
-static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
-                                    int is_write, sigset_t *old_set)
+static bool handle_cpu_sigsegv(CPUState *cpu, uintptr_t pc, uintptr_t addr,
+                               int si_code, MMUAccessType access_type,
+                               sigset_t *old_set)
+{
+    trace_sigsegv(pc, addr, access_type, *(unsigned long *)old_set);
+
+    /* XXX: locking issue */
+    /*
+     * Note that it is important that we don't call page_unprotect() unless
+     * this is really a "write to nonwriteable page" fault, because
+     * page_unprotect() assumes that if it is called for an access to
+     * a page that's writeable this means we had two threads racing and
+     * another thread got there first and already made the page writeable;
+     * so we will retry the access. If we were to call page_unprotect()
+     * for some other kind of fault that should really be passed to the
+     * guest, we'd end up in an infinite loop of retrying the faulting
+     * access.
+     */
+    if (access_type == MMU_DATA_STORE
+        && si_code == SEGV_ACCERR
+        && h2g_valid(addr)) {
+        switch (page_unprotect(h2g_nocheck(addr), pc)) {
+        case 0:
+            /*
+             * Fault not caused by a page marked unwritable to protect
+             * cached translations, must be the guest binary's problem.
+             */
+            break;
+        case 1:
+            /*
+             * Fault caused by protection of cached translation; TBs
+             * invalidated, so resume execution.  Retain helper_retaddr
+             * for a possible second fault.
+             */
+            return true;
+        case 2:
+            /*
+             * Fault caused by protection of cached translation, and the
+             * currently executing TB was modified and must be exited
+             * immediately.  Clear helper_retaddr for next execution.
+             */
+            clear_helper_retaddr();
+            cpu_exit_tb_from_sighandler(cpu, old_set);
+            /* NORETURN */
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    /*
+     * Convert forcefully to guest address space, invalid addresses
+     * are still valid segv ones.
+     */
+    addr = h2g_nocheck(addr);
+
+    /*
+     * There is no way the target can handle this other than raising
+     * an exception.  Undo signal and retaddr state prior to longjmp.
+     */
+    sigprocmask(SIG_SETMASK, old_set, NULL);
+    clear_helper_retaddr();
+
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    cc->tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, pc);
+    g_assert_not_reached();
+}
+
+static bool handle_cpu_sigbus(CPUState *cpu, uintptr_t pc, uintptr_t addr,
+                              int si_code, MMUAccessType access_type,
+                              sigset_t *old_set)
+{
+    trace_sigbus(pc, addr, access_type, *(unsigned long *)old_set);
+
+    if (si_code == BUS_ADRALN) {
+        /*
+         * We're expecting host alignment faults to correspond
+         * directly to guest alignment faults, and thus the host
+         * address must correspond to a guest address.
+         */
+        addr = h2g(addr);
+
+        /* Undo signal and retaddr state prior to longjmp. */
+        sigprocmask(SIG_SETMASK, old_set, NULL);
+        clear_helper_retaddr();
+
+        cpu_unaligned_access(cpu, addr, access_type, MMU_USER_IDX, pc);
+    }
+
+    /*
+     * Otherwise this is probably BUS_ADRERR or suchlike, which
+     * can be easily triggered by the guest playing with mmap
+     * and accessing past the end of the file.
+     *
+     * Use PC to unwind to the current guest address and then
+     * return false to pass on the host signal to the guest.
+     */
+    cpu_restore_state(cpu, pc, true);
+    return false;
+}
+
+/**
+ * handle_cpu_signal:
+ * @pc: the host PC at which the exception was raised,
+ * @address: the effective address of the memory exception,
+ * @is_write: true if a write caused the exception,
+ * @old_set: signal set which should be restored.
+ *
+ * Return true if the signal has been handled by the vcpu,
+ * false if the signal should be sent on to the guest.
+ */
+static bool handle_cpu_signal(uintptr_t pc, siginfo_t *info,
+                              bool is_write, sigset_t *old_set)
 {
     CPUState *cpu = current_cpu;
-    CPUClass *cc;
-    unsigned long address = (unsigned long)info->si_addr;
+    uintptr_t addr = (uintptr_t)info->si_addr;
     MMUAccessType access_type = is_write ? MMU_DATA_STORE : MMU_DATA_LOAD;
+    int code;
 
     switch (helper_retaddr) {
     default:
@@ -119,7 +225,8 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
         break;
     }
 
-    /* For synchronous signals we expect to be coming from the vCPU
+    /*
+     * For synchronous signals we expect to be coming from the vCPU
      * thread (so current_cpu should be valid) and either from running
      * code or during translation which can fault as we cross pages.
      *
@@ -132,62 +239,15 @@ static inline int handle_cpu_signal(uintptr_t pc, siginfo_t *info,
         abort();
     }
 
-    trace_sigsegv(pc, address, is_write, *(unsigned long *)old_set);
-
-    /* XXX: locking issue */
-    /* Note that it is important that we don't call page_unprotect() unless
-     * this is really a "write to nonwriteable page" fault, because
-     * page_unprotect() assumes that if it is called for an access to
-     * a page that's writeable this means we had two threads racing and
-     * another thread got there first and already made the page writeable;
-     * so we will retry the access. If we were to call page_unprotect()
-     * for some other kind of fault that should really be passed to the
-     * guest, we'd end up in an infinite loop of retrying the faulting
-     * access.
-     */
-    if (is_write && info->si_signo == SIGSEGV && info->si_code == SEGV_ACCERR &&
-        h2g_valid(address)) {
-        switch (page_unprotect(h2g(address), pc)) {
-        case 0:
-            /* Fault not caused by a page marked unwritable to protect
-             * cached translations, must be the guest binary's problem.
-             */
-            break;
-        case 1:
-            /* Fault caused by protection of cached translation; TBs
-             * invalidated, so resume execution.  Retain helper_retaddr
-             * for a possible second fault.
-             */
-            return 1;
-        case 2:
-            /* Fault caused by protection of cached translation, and the
-             * currently executing TB was modified and must be exited
-             * immediately.  Clear helper_retaddr for next execution.
-             */
-            clear_helper_retaddr();
-            cpu_exit_tb_from_sighandler(cpu, old_set);
-            /* NORETURN */
-
-        default:
-            g_assert_not_reached();
-        }
+    code = info->si_code;
+    switch (info->si_signo) {
+    case SIGSEGV:
+        return handle_cpu_sigsegv(cpu, pc, addr, code, access_type, old_set);
+    case SIGBUS:
+        return handle_cpu_sigbus(cpu, pc, addr, code, access_type, old_set);
+    default:
+        g_assert_not_reached();
     }
-
-    /* Convert forcefully to guest address space, invalid addresses
-       are still valid segv ones */
-    address = h2g_nocheck(address);
-
-    /*
-     * There is no way the target can handle this other than raising
-     * an exception.  Undo signal and retaddr state prior to longjmp.
-     */
-    sigprocmask(SIG_SETMASK, old_set, NULL);
-    clear_helper_retaddr();
-
-    cc = CPU_GET_CLASS(cpu);
-    cc->tcg_ops->tlb_fill(cpu, address, 0, access_type,
-                          MMU_USER_IDX, false, pc);
-    g_assert_not_reached();
 }
 
 static int probe_access_internal(CPUArchState *env, target_ulong addr,
diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f09..99b456a781 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -747,27 +747,37 @@ static inline void rewind_if_in_safe_syscall(void *puc)
 static void host_signal_handler(int host_signum, siginfo_t *info,
                                 void *puc)
 {
-    CPUArchState *env = thread_cpu->env_ptr;
-    CPUState *cpu = env_cpu(env);
+    CPUState *cpu = thread_cpu;
+    CPUArchState *env = cpu->env_ptr;
     TaskState *ts = cpu->opaque;
-
     int sig;
     target_siginfo_t tinfo;
     ucontext_t *uc = puc;
     struct emulated_sigtable *k;
+    bool must_exit = false;
 
-    /* the CPU emulator uses some host signals to detect exceptions,
-       we forward to it some signals */
+    /*
+     * The CPU emulator uses some host signals to detect exceptions,
+     * we forward to it some signals.
+     */
     if ((host_signum == SIGSEGV || host_signum == SIGBUS)
         && info->si_code > 0) {
-        if (cpu_signal_handler(host_signum, info, puc))
+        if (cpu_signal_handler(host_signum, info, puc)) {
             return;
+        }
+        /*
+         * E.g. SIGBUS, without BUS_ADRALN, which we want to pass on.
+         * We have unwound the TB to PC, so must use cpu_loop_exit below.
+         */
+        must_exit = true;
     }
 
     /* get target signal number */
     sig = host_to_target_signal(host_signum);
-    if (sig < 1 || sig > TARGET_NSIG)
+    if (sig < 1 || sig > TARGET_NSIG) {
+        assert(!must_exit);
         return;
+    }
     trace_user_host_signal(env, host_signum, sig);
 
     rewind_if_in_safe_syscall(puc);
@@ -778,7 +788,8 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
     k->pending = sig;
     ts->signal_pending = 1;
 
-    /* Block host signals until target signal handler entered. We
+    /*
+     * Block host signals until target signal handler entered. We
      * can't block SIGSEGV or SIGBUS while we're executing guest
      * code in case the guest code provokes one in the window between
      * now and it getting out to the main loop. Signals will be
@@ -796,8 +807,13 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
     sigdelset(&uc->uc_sigmask, SIGSEGV);
     sigdelset(&uc->uc_sigmask, SIGBUS);
 
-    /* interrupt the virtual CPU as soon as possible */
-    cpu_exit(thread_cpu);
+    /* Interrupt the virtual CPU as soon as possible. */
+    if (must_exit) {
+        cpu->exception_index = EXCP_INTERRUPT;
+        cpu_loop_exit(cpu);
+    } else {
+        cpu_exit(cpu);
+    }
 }
 
 /* do_sigaltstack() returns target values and errnos. */
diff --git a/accel/tcg/trace-events b/accel/tcg/trace-events
index d54416f2ee..009fbdc124 100644
--- a/accel/tcg/trace-events
+++ b/accel/tcg/trace-events
@@ -10,4 +10,5 @@ exec_tb_exit(void *last_tb, unsigned int flags) "tb:%p flags=0x%x"
 translate_block(void *tb, uintptr_t pc, const void *tb_code) "tb:%p, pc:0x%"PRIxPTR", tb_code:%p"
 
 # user-exec.c
-sigsegv(uintptr_t pc, uintptr_t addr, int is_write, unsigned long old_set) "pc:0x%"PRIxPTR", addr:0x%"PRIxPTR", w:%d, oldset:0x%lx"
+sigsegv(uintptr_t pc, uintptr_t addr, int access_type, unsigned long old_set) "pc:0x%"PRIxPTR", addr:0x%"PRIxPTR", at:%d, oldset:0x%lx"
+sigbus(uintptr_t pc, uintptr_t addr, int access_type, unsigned long old_set) "pc:0x%"PRIxPTR", addr:0x%"PRIxPTR", at:%d, oldset:0x%lx"
-- 
2.25.1


