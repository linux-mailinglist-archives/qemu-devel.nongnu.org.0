Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5CE488A8F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:31:29 +0100 (CET)
Received: from localhost ([::1]:52200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b6O-0000G2-Sx
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:31:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avJ-0006AV-My
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:02 -0500
Received: from [2607:f8b0:4864:20::12f] (port=45602
 helo=mail-il1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avH-0007BI-W5
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:01 -0500
Received: by mail-il1-x12f.google.com with SMTP id h5so971121ilq.12
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c6borLsFCV/9M2I8djvoBUxpRCi7Ch9JmdF3mHscVAw=;
 b=BuOTztHmPCAopAalk0n6uAVAauYXfnPkr50Ds9769GLM0jDG3Glgc2P2x1rd7YLauu
 z6CJDdqtwNU02EFCMIndFeIXUJJX+0Bu03Xx6Yd0ARWclHwoZUmMCs/TGm8IM3LtAuJT
 BCxZTao6IyDRzukVJUKL6GB8AAABdP1L7Z3Kz1qpK3yTj2qKqLxkiqvyOxPrjMDoKy9S
 hjcObj9pZ+V84x5XsnrED1t0eyvwPtnkZtw08N2cMAre5r5ExqAiRy6rJtMrf22UoDcP
 ZmqJMvjav4eVlVNpGIBHqFEDeC7zWgKF4owcMRWcAFHJR5JfrF2qGks0ulwg4VvYr4bu
 Vlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c6borLsFCV/9M2I8djvoBUxpRCi7Ch9JmdF3mHscVAw=;
 b=PDU5q51hkgnrECqVBO4VVjWMKT3xTkhNVq6T+/lm4Nk5fLMI0ppt1JJCQDHxZSCH4A
 C9xPSQfUjgY7EumV3TlcBFCtXSEEFaoFqOSKs+khYgYmODPXaVNZlAKUhHWdS70etm+/
 HZpACxdzLcYy+MkTLKIMwXvd9pgp84c98BsdgovCXt97Uk5rtfLwTG74f0ITcHlPCy3t
 uruxsUNJFAT96VdIMILglBc0o/VgriLqHCBslb/t00v85OacRarsZCW7MlHzV4lxu/HM
 XXI3dz6WRvwPxLyZzhvDSJL5mODJtFLNTRTZJXSEkvYN/ytreUs06LUPeTtGIOhq/pzH
 kfCQ==
X-Gm-Message-State: AOAM53231rX1vCeHaR6zsi66P7RLwD6v8n0zf9GW+hqo86PtJn9QGZ/S
 xUXlKzmid9h5wDBNEOSazqOFTX8D3OU84fzd
X-Google-Smtp-Source: ABdhPJzlLY5OsYrWB+d+0uwVeawSuEcK8hVY6BYhGNnzPIzL5W+dAtOmQTktZ8ZingIxWTZzJVyXuw==
X-Received: by 2002:a05:6e02:2189:: with SMTP id
 j9mr34162505ila.264.1641745198800; 
 Sun, 09 Jan 2022 08:19:58 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:58 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 29/30] bsd-user/signal.c: implement do_sigaction
Date: Sun,  9 Jan 2022 09:19:22 -0700
Message-Id: <20220109161923.85683-30-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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

Implement the meat of the sigaction(2) system call with do_sigaction and
helper routiner block_signals (which is also used to implemement signal
masking so it's global).

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   | 21 +++++++++++++
 bsd-user/signal.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index b8c64ca0e5b..c643d6ba246 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -226,8 +226,29 @@ int host_to_target_signal(int sig);
 void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
 void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
 long do_sigreturn(CPUArchState *regs, abi_ulong addr);
+int do_sigaction(int sig, const struct target_sigaction *act,
+                struct target_sigaction *oact);
 void QEMU_NORETURN force_sig(int target_sig);
 int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *right);
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
 
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index d11f5eddd7e..f055d1db407 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -231,6 +231,22 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
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
@@ -534,6 +550,66 @@ static int fatal_signal(int sig)
     }
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
+    if (sig < 1 || sig > TARGET_NSIG || TARGET_SIGKILL == sig ||
+            TARGET_SIGSTOP == sig) {
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
         CPUArchState *regs, size_t frame_size)
 {
-- 
2.33.1


