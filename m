Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B11004A5034
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:36:08 +0100 (CET)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdPD-0003oR-Qk
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:36:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnd-0004sy-Mq
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:18 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39851
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002gA-6Q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: by mail-io1-xd2a.google.com with SMTP id c188so18404416iof.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R3pj83Xth48GR9Dv5oQfOEFsuSaIVC2VMfTQGHp+Fyg=;
 b=4EAZTKrOPmE3eG+TXI6Og3EhKBi0+RarjsoWcm73JZue8/sRYZddppvJVPy8toZLc5
 pqZttk4Q63iUVf1dKg/CtWIPoLDhjzzxZf8+Hxq7D4E3yGr56PgNbrfdfgma6q9kY/2J
 BprKUzQ98vHmhEbxoq4fh1tNQGohRlWCljTu2yXjDIR4Hg8FqRuVkr1oCpKc3B3MAjgx
 Cs+9vsSnrZsaNd7dW4RHFPQIWb0R7MzFM+Q1KyjabIgrRrZitSVuV2rj6vpEwFB1CpU4
 S03S4ereR0L8AcV6VRlfWbU29J1ql5aOpePgWoQFZzNA/wlbM7XuyWtov1cx1tDyJ2L9
 a3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R3pj83Xth48GR9Dv5oQfOEFsuSaIVC2VMfTQGHp+Fyg=;
 b=MHtCC1jQ76X/UeBPDRzxPjDsCowYDLddY4vllQhG1OOt6l6cAp9gTyK6G1s5VQ1T4g
 svnyvqHk9Ov9WI7Ps/8B3rnPetBJ6qsk6S4ARHJYjbn+RHzFPkKzfoTeIk9Ka9S1Cx8Y
 NdkrUFBCFPT3rqzhwORMoaxdE1ArBoczBfcZ8NCxuOC8CzQEEg1oyJkMz2TqMjyOCCpv
 re1KLwzwh6VNaGVVfbZY41rCZbgPCX9VijZg4B9dqzUxbQ4M6+DqFtnEhp6Hbs0E381t
 JbP4+44nF4/Ek2qC4YlUMh3N9WpCvNlIyrNgsHt9FtEXyCR+fRXIJwIkx1kYgmCGdQD3
 nXfQ==
X-Gm-Message-State: AOAM530U9/2hi52GmIRpMUekhD7Tf08aYzOnBvA15vP1WwfZk2haLzsl
 W4vbUKSI73scVX3trXX56g4XX+yaUjAK0w==
X-Google-Smtp-Source: ABdhPJy5yCgyiBJ1PDqJwPiIuzhcguMJtbG3MR0dFy3N8lwDsW82jKESItciEFnK6RNhgYPDr8WrTA==
X-Received: by 2002:a02:9687:: with SMTP id w7mr2373858jai.316.1643659026936; 
 Mon, 31 Jan 2022 11:57:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:06 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/40] bsd-user/signal.c: implement do_sigaction
Date: Mon, 31 Jan 2022 12:56:32 -0700
Message-Id: <20220131195636.31991-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h | 22 +++++++++++
 bsd-user/signal.c        | 82 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

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
index 150262a87e5..5c94bd02e38 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -309,6 +309,25 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
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
+     * process_pending_signals(). We depend on the FreeBSD behaivor here where
+     * this will only affect this thread's signal mask. We don't use
+     * pthread_sigmask which might seem more correct because that routine also
+     * does odd things with SIGCANCEL to implement pthread_cancel().
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
@@ -554,6 +573,69 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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
+    if (sig < 1 || sig > TARGET_NSIG) {
+        return -TARGET_EINVAL;
+    }
+
+    if ((sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP) &&
+        act != NULL && act->_sa_handler != TARGET_SIG_DFL) {
+        return -TARGET_EINVAL;
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


