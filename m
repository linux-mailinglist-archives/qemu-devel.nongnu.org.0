Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C04A2A79
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:14:04 +0100 (CET)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbNT-0000TB-GO
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDag1-0000s6-4E
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:09 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=46958
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bM-QR
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:06 -0500
Received: by mail-io1-xd2e.google.com with SMTP id e79so9638224iof.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rj0hwqiot9yKo/V2+tI2H/WfjhvlejzlOrnB8xJDZDI=;
 b=1Ne4YOWiNqatRAwpRYoWsGuwuRMknECzzGtNjRspXz+5i0BKAY/sbfT4OkzG1pdpZC
 /y8qg9fBeZeoCXAeFqwfs+u4zpwps06X8ttciy3gCWmzgp3nZFmM8ZJUgB37FyJ7BZoJ
 IehI+0W1M+BCHQwLbjEMJDY4fr5taUlsvSBllC4/P2kunb5kDpbLTRS1ZuMArafiEvQ9
 YVCdC4izpm3tQwyY2oq3ktXh4at/GKVHszTyQWzjye27BUyD4+zZEA8nFqw7tl+7hbDv
 lfUZANMxfej12vM7wEmLM8uqXWmjEXhze82ZfIe1fizjS7TzcJleckAvp2OaTpH89BV0
 l9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rj0hwqiot9yKo/V2+tI2H/WfjhvlejzlOrnB8xJDZDI=;
 b=3G4jpCDLXQk6z4ThstL8nZr3VYSedmmX0nvGoKzuKrRFemRk8kOoB3SGLzKDUKvLKi
 tu4IRNCiRbEuvu0Ck0QvpY4TIiKn2c440UMMFCS/lrZ+EcgOluUCKWoWkEVwRbNAZCx1
 jqZSWOMTtHgg3U0OA8hYKzRYTUSKA5u0PgDCqjKP4/UeOggUKnBDf1h9BmietknsaoXd
 cnN3jiUClhgOlJCmZYhvkCfL+ieAzrG/rUXaAxd2OFTtcaM6FLrEWCd23U9Ijt+GqRlA
 JcTJDGImIlC5IE1fAw/Vd1vIW/3+0AU1qBIAbKsD+hpS3mKZSSfN5ifD9gP/y/A/LMzz
 Z3Wg==
X-Gm-Message-State: AOAM5303xVRpir045xS/uygiz3JUxYPqPnUHBD77l2y3zdh1b5ns61Mo
 Jf10KaSbl1K9ZWMTnMbZb/PqpeMUxjDzog==
X-Google-Smtp-Source: ABdhPJwjlkrXeK5E3aTH3D/a/27V5S2o42IIv6uhIf9omDm09fcQx39tl9B9JP4aigssjlxVSm2+Lw==
X-Received: by 2002:a02:2208:: with SMTP id o8mr2379496jao.72.1643412522377;
 Fri, 28 Jan 2022 15:28:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 36/40] bsd-user/signal.c: implement do_sigaction
Date: Fri, 28 Jan 2022 16:28:01 -0700
Message-Id: <20220128232805.86191-37-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
---
 bsd-user/signal-common.h | 22 +++++++++++
 bsd-user/signal.c        | 83 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

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
index 79e1128d4f6..24074d629e2 100644
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
@@ -554,6 +573,70 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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


