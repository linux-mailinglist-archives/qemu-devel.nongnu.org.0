Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADFD488A99
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:36:36 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bBL-0006Ef-Gr
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:36:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avF-00066T-Kt
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:57 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=46971
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avE-0007AU-1h
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:57 -0500
Received: by mail-io1-xd2c.google.com with SMTP id w9so1346715iol.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXKd+4Q2EYN8IsQpSvhQcGeQyVEk0TEwvPd02H3ZhQQ=;
 b=PR1B495tcN4+myT7kgWZ+ex8n+p4nKFq6+vQr75xlYGycdkNAtAxf4+MsAh9gU6SKA
 0lnxbuEqnRENhEgTYa3Po+SAjRAtkFjmIR976gW9doWktgOLkp+c1yLLSXgbkuv5MheL
 2L0TsgM/S98X0UaXDCYLCbtSgrDGHGTMhdhxhRXjdIlUNmgstbnwgewsUIwUdld+We6L
 WXGsYHnmWYatovEV33QNAErMwSFwRuf+fvNLzEb97q1K+DYkvQ7DcvpxYgCA6DklBu4M
 GGiAqgMF86GXimYIw+NuuXzGuDWrJkcedte29v6bIK8Uc8sZvOB7GodPBMhKstlpHjvV
 TQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXKd+4Q2EYN8IsQpSvhQcGeQyVEk0TEwvPd02H3ZhQQ=;
 b=Q0VOxHyoZd8ET/UgCqpoU63djmHImYMpUYakujHs6+GOI3dPKrJeSmaoz8DiH/INr8
 SJIDUmuoskqT4NyNLYmNdFOTaggErg09TZKOpxF0xUGSHYLURuwhX7SDC+SjnakClu1c
 OyttK955ODMlVx4voEnJNuf1xf5GO3n6NjVvqbYifvWMZBB99V35FaG9AqOC7Zskk8vy
 BuugxbQnf5kjDAM3QXO9Yu/jZ+cVVrmAedxD1QA4g0vtNu1NqDXh5Xu3a4HV9PYM2lEk
 mkBF3kUUzb5/eW7yzjfTfKotM4vY3Fze18K6t615H86pxGNmDEnGv7DPEIr4R9Ev4zMK
 LiEQ==
X-Gm-Message-State: AOAM532+tSCE8cY/VnBYn+/6o+UWKdE/v9jv2ooI4pJ4mj6w15C1yr3I
 Hhu1UhVL8Dvc7RTJ27TPEvmz0fMOr7Gj1L15
X-Google-Smtp-Source: ABdhPJwoDJGnQFcf7EYj+7tFQe5I2WEe42Enug77lIkTqUwI+1eGUg9siYMXYtqdNsnjpmzR4T3EgA==
X-Received: by 2002:a02:9308:: with SMTP id d8mr1198215jah.52.1641745194757;
 Sun, 09 Jan 2022 08:19:54 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:54 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/30] bsd-user/signal.c: setup_frame
Date: Sun,  9 Jan 2022 09:19:17 -0700
Message-Id: <20220109161923.85683-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

setup_frame sets up a signalled stack frame. Associated routines to
extract the pointer to the stack frame and to support alternate stacks.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 166 ++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 144 insertions(+), 22 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8dadc9a39a7..8e1427553da 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -30,11 +30,27 @@
  * fork.
  */
 
+static target_stack_t target_sigaltstack_used = {
+    .ss_sp = 0,
+    .ss_size = 0,
+    .ss_flags = TARGET_SS_DISABLE,
+};
+
 static struct target_sigaction sigact_table[TARGET_NSIG];
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
 static void target_to_host_sigset_internal(sigset_t *d,
         const target_sigset_t *s);
 
+static inline int on_sig_stack(unsigned long sp)
+{
+    return sp - target_sigaltstack_used.ss_sp < target_sigaltstack_used.ss_size;
+}
+
+static inline int sas_ss_flags(unsigned long sp)
+{
+    return target_sigaltstack_used.ss_size == 0 ? SS_DISABLE : on_sig_stack(sp)
+        ? SS_ONSTACK : 0;
+}
 
 int host_to_target_signal(int sig)
 {
@@ -336,28 +352,6 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
     return;
 }
 
-static int fatal_signal(int sig)
-{
-
-    switch (sig) {
-    case TARGET_SIGCHLD:
-    case TARGET_SIGURG:
-    case TARGET_SIGWINCH:
-    case TARGET_SIGINFO:
-        /* Ignored by default. */
-        return 0;
-    case TARGET_SIGCONT:
-    case TARGET_SIGSTOP:
-    case TARGET_SIGTSTP:
-    case TARGET_SIGTTIN:
-    case TARGET_SIGTTOU:
-        /* Job control signals.  */
-        return 0;
-    default:
-        return 1;
-    }
-}
-
 /*
  * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
  * 'force' part is handled in process_pending_signals().
@@ -484,6 +478,134 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     cpu_exit(thread_cpu);
 }
 
+static int fatal_signal(int sig)
+{
+
+    switch (sig) {
+    case TARGET_SIGCHLD:
+    case TARGET_SIGURG:
+    case TARGET_SIGWINCH:
+    case TARGET_SIGINFO:
+        /* Ignored by default. */
+        return 0;
+    case TARGET_SIGCONT:
+    case TARGET_SIGSTOP:
+    case TARGET_SIGTSTP:
+    case TARGET_SIGTTIN:
+    case TARGET_SIGTTOU:
+        /* Job control signals.  */
+        return 0;
+    default:
+        return 1;
+    }
+}
+
+static inline abi_ulong get_sigframe(struct target_sigaction *ka,
+        CPUArchState *regs, size_t frame_size)
+{
+    abi_ulong sp;
+
+    /* Use default user stack */
+    sp = get_sp_from_cpustate(regs);
+
+    if ((ka->sa_flags & TARGET_SA_ONSTACK) && (sas_ss_flags(sp) == 0)) {
+        sp = target_sigaltstack_used.ss_sp +
+            target_sigaltstack_used.ss_size;
+    }
+
+#if defined(TARGET_MIPS) || defined(TARGET_ARM)
+    return (sp - frame_size) & ~7;
+#elif defined(TARGET_AARCH64)
+    return (sp - frame_size) & ~15;
+#else
+    return sp - frame_size;
+#endif
+}
+
+/* compare to mips/mips/pm_machdep.c and sparc64/sparc64/machdep.c sendsig() */
+static void setup_frame(int sig, int code, struct target_sigaction *ka,
+    target_sigset_t *set, target_siginfo_t *tinfo, CPUArchState *regs)
+{
+    struct target_sigframe *frame;
+    abi_ulong frame_addr;
+    int i;
+
+    frame_addr = get_sigframe(ka, regs, sizeof(*frame));
+    trace_user_setup_frame(regs, frame_addr);
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        goto give_sigsegv;
+    }
+
+    memset(frame, 0, sizeof(*frame));
+#if defined(TARGET_MIPS)
+    int mflags = on_sig_stack(frame_addr) ? TARGET_MC_ADD_MAGIC :
+        TARGET_MC_SET_ONSTACK | TARGET_MC_ADD_MAGIC;
+#else
+    int mflags = 0;
+#endif
+    if (get_mcontext(regs, &frame->sf_uc.uc_mcontext, mflags)) {
+        goto give_sigsegv;
+    }
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        if (__put_user(set->__bits[i], &frame->sf_uc.uc_sigmask.__bits[i])) {
+            goto give_sigsegv;
+        }
+    }
+
+    if (tinfo) {
+        frame->sf_si.si_signo = tinfo->si_signo;
+        frame->sf_si.si_errno = tinfo->si_errno;
+        frame->sf_si.si_code = tinfo->si_code;
+        frame->sf_si.si_pid = tinfo->si_pid;
+        frame->sf_si.si_uid = tinfo->si_uid;
+        frame->sf_si.si_status = tinfo->si_status;
+        frame->sf_si.si_addr = tinfo->si_addr;
+
+        if (TARGET_SIGILL == sig || TARGET_SIGFPE == sig ||
+                TARGET_SIGSEGV == sig || TARGET_SIGBUS == sig ||
+                TARGET_SIGTRAP == sig) {
+            frame->sf_si._reason._fault._trapno = tinfo->_reason._fault._trapno;
+        }
+
+        /*
+         * If si_code is one of SI_QUEUE, SI_TIMER, SI_ASYNCIO, or
+         * SI_MESGQ, then si_value contains the application-specified
+         * signal value. Otherwise, the contents of si_value are
+         * undefined.
+         */
+        if (SI_QUEUE == code || SI_TIMER == code || SI_ASYNCIO == code ||
+                SI_MESGQ == code) {
+            frame->sf_si.si_value.sival_int = tinfo->si_value.sival_int;
+        }
+
+        if (SI_TIMER == code) {
+            frame->sf_si._reason._timer._timerid =
+                tinfo->_reason._timer._timerid;
+            frame->sf_si._reason._timer._overrun =
+                tinfo->_reason._timer._overrun;
+        }
+
+#ifdef SIGPOLL
+        if (SIGPOLL == sig) {
+            frame->sf_si._reason._band = tinfo->_reason._band;
+        }
+#endif
+
+    }
+
+    if (set_sigtramp_args(regs, sig, frame, frame_addr, ka)) {
+        goto give_sigsegv;
+    }
+
+    unlock_user_struct(frame, frame_addr, 1);
+    return;
+
+give_sigsegv:
+    unlock_user_struct(frame, frame_addr, 1);
+    force_sig(TARGET_SIGSEGV);
+}
+
 void signal_init(void)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
-- 
2.33.1


