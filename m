Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7361449A3F7
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:04:51 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBCU-0004z4-Ic
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfL-0002Io-C6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:43 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=38772
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfI-0001hz-9n
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: by mail-io1-xd2f.google.com with SMTP id w7so21897841ioj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdXJK5vRD+aFmx8B1X94UEIrCjBlqtw2OQzi+bUw0AU=;
 b=Dkr9I2cPXs7Lgl3kR6j/1EM2oiWrz5om0yhmvWhSb38qeEHYuqu/PZn3JBkieSSQPl
 gB7ugETgN++b/oX7cUd+fajGDs8u4wu6IktSXk5d9rDTB96fi+WLXfl9JrVNAtomqzZg
 u3qx3vHJoWODzfFYRJm5Mj3zlbkqBZxQdBO5guYx1T0WJpbJ5RCj6iX21UelRvfDb075
 Ebf9sTa3Om/AiQ/FWzjShUt38L6G8h20kCWciUePlLJEMwLANAVHBoznpQ4siEnBBF8E
 MbcbgB+vWeWINCRig9z9eekliA1pAHW5YHVrvD7fdj/GiRAoeVCoucoCfJGodk1bAzQW
 aOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdXJK5vRD+aFmx8B1X94UEIrCjBlqtw2OQzi+bUw0AU=;
 b=qYzhLBh94r3iemloBn3/8n1MgZTYfrlUiunDFlrTvufbYfuNek2xz9ekQTJkiU+1Lt
 lMwwt8A015GI/Gaqr/xVSNCjZ9URPKzt3U+vihdTz/agEC4praxCdeydFF5gdjvnAFLU
 MQklA3t9eHLZsegwLO4YXsM3XBMTyhiaiDZxcCnEHpMI1QcvZ4ggPCFiZvcyG5iW1vdU
 r5tq42OkVjrwhPCniRZD9DC0xXhLpbjWq3V/EWbb4EPN15PhqUx8pZkvuc5nVrH3FIpM
 8celFIs7KOBQ1mDPKdpHvP1y8umzDnF6Ww93lvZqNFumFsqKqFWKnXn34dEdTa7hkP7Z
 1pnQ==
X-Gm-Message-State: AOAM532LYyaEJA6ZZ8C3JiXyu+c+yn3ktB0a4IOMhO0ljR0juPwHdvMU
 ryWjVeTEgRthpgMB5789RxcSNbyJoi+QbA==
X-Google-Smtp-Source: ABdhPJwWpx3Oz8MIYQngu3708fBMG2QuPuXuZn7LIw3Hz/Io4SexvImyVo7ewOXUu7QMrRoHJTeROg==
X-Received: by 2002:a6b:6211:: with SMTP id f17mr9236724iog.216.1643074229962; 
 Mon, 24 Jan 2022 17:30:29 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:29 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 36/40] bsd-user/signal.c: implement do_sigaction
Date: Mon, 24 Jan 2022 18:29:43 -0700
Message-Id: <20220125012947.14974-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the meat of the sigaction(2) system call with do_sigaction and
helper routiner block_signals (which is also used to implemement signal
masking so it's global).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>

Pending Comments from Peter Maydell <peter.maydell@linaro.org>

(1) in block_signals, sigprocmast
For linux-user we rely on sigprocmask() in a multithreaded
program setting the signal mask for only the calling thread,
which isn't POSIX-mandated. (Arguably we should use
pthread_sigmask() instead, but we don't for basically
historical reasons since linux-user is host-OS-specific anyway.)
Does BSD have the same "this changes this thread's signal mask"
semantics for sigprocmask()?

(2) do_sigaction, first if validating which signals can be sent
Kernel seems to allow SIGKILL and SIGSTOP unless act is
non-NULL and act->sa_handler is SIG_DFL ?
https://github.com/freebsd/freebsd-src/blob/main/sys/kern/kern_sig.c#L747
(Compare linux-user commit ee3500d33a7431, a recent bugfix.)

(3) Noting confusion in do_sigaction between host and target
errnos (they are identical on BSD, but we should still return
the right sort in case it ever does matter).
---
 bsd-user/signal-common.h | 22 ++++++++++++
 bsd-user/signal.c        | 76 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 786ec592d18..7ff8e8f2e40 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -9,7 +9,29 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+/**
+ * block_signals: block all signals while handling this guest syscall
+ *
+ * Block all signals, and arrange that the signal mask is returned to
+ * its correct value for the guest before we resume execution of guest code.
+ * If this function returns non-zero, then the caller should immediately
+ * return -TARGET_ERESTARTSYS to the main loop, which will take the pending
+ * signal and restart execution of the syscall.
+ * If block_signals() returns zero, then the caller can continue with
+ * emulation of the system call knowing that no signals can be taken
+ * (and therefore that no race conditions will result).
+ * This should only be called once, because if it is called a second time
+ * it will always return non-zero. (Think of it like a mutex that can't
+ * be recursively locked.)
+ * Signals will be unblocked again by process_pending_signals().
+ *
+ * Return value: non-zero if there was a pending signal, zero if not.
+ */
+int block_signals(void); /* Returns non zero if signal pending */
+
 long do_rt_sigreturn(CPUArchState *env);
+int do_sigaction(int sig, const struct target_sigaction *act,
+                struct target_sigaction *oact);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 long do_sigreturn(CPUArchState *env, abi_ulong addr);
 void force_sig_fault(int sig, int code, abi_ulong addr);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 05caf812ccb..42021556d65 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -309,6 +309,22 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
     }
 }
 
+int block_signals(void)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    sigset_t set;
+
+    /*
+     * It's OK to block everything including SIGSEGV, because we won't run any
+     * further guest code before unblocking signals in
+     * process_pending_signals().
+     */
+    sigfillset(&set);
+    sigprocmask(SIG_SETMASK, &set, 0);
+
+    return qatomic_xchg(&ts->signal_pending, 1);
+}
+
 /* Returns 1 if given signal should dump core if not handled. */
 static int core_dump_signal(int sig)
 {
@@ -554,6 +570,66 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     cpu_exit(thread_cpu);
 }
 
+/* do_sigaction() return host values and errnos */
+int do_sigaction(int sig, const struct target_sigaction *act,
+        struct target_sigaction *oact)
+{
+    struct target_sigaction *k;
+    struct sigaction act1;
+    int host_sig;
+    int ret = 0;
+
+    if (sig < 1 || sig > TARGET_NSIG || sig == TARGET_SIGKILL ||
+        sig == TARGET_SIGSTOP) {
+        return -EINVAL;
+    }
+
+    if (block_signals()) {
+        return -TARGET_ERESTART;
+    }
+
+    k = &sigact_table[sig - 1];
+    if (oact) {
+        oact->_sa_handler = tswapal(k->_sa_handler);
+        oact->sa_flags = tswap32(k->sa_flags);
+        oact->sa_mask = k->sa_mask;
+    }
+    if (act) {
+        /* XXX: this is most likely not threadsafe. */
+        k->_sa_handler = tswapal(act->_sa_handler);
+        k->sa_flags = tswap32(act->sa_flags);
+        k->sa_mask = act->sa_mask;
+
+        /* Update the host signal state. */
+        host_sig = target_to_host_signal(sig);
+        if (host_sig != SIGSEGV && host_sig != SIGBUS) {
+            memset(&act1, 0, sizeof(struct sigaction));
+            sigfillset(&act1.sa_mask);
+            act1.sa_flags = SA_SIGINFO;
+            if (k->sa_flags & TARGET_SA_RESTART) {
+                act1.sa_flags |= SA_RESTART;
+            }
+            /*
+             *  Note: It is important to update the host kernel signal mask to
+             *  avoid getting unexpected interrupted system calls.
+             */
+            if (k->_sa_handler == TARGET_SIG_IGN) {
+                act1.sa_sigaction = (void *)SIG_IGN;
+            } else if (k->_sa_handler == TARGET_SIG_DFL) {
+                if (fatal_signal(sig)) {
+                    act1.sa_sigaction = host_signal_handler;
+                } else {
+                    act1.sa_sigaction = (void *)SIG_DFL;
+                }
+            } else {
+                act1.sa_sigaction = host_signal_handler;
+            }
+            ret = sigaction(host_sig, &act1, NULL);
+        }
+    }
+    return ret;
+}
+
 static inline abi_ulong get_sigframe(struct target_sigaction *ka,
         CPUArchState *env, size_t frame_size)
 {
-- 
2.33.1


