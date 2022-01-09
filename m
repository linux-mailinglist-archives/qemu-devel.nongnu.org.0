Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AF7488A8E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:29:42 +0100 (CET)
Received: from localhost ([::1]:46430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6b4f-0004pi-4g
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:29:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av2-0005gT-LM
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:44 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=36359
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av1-00076u-3a
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:44 -0500
Received: by mail-io1-xd2f.google.com with SMTP id w22so3879305iov.3
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/pXfXOZAWxFzYm835/ZHZbEkGgV0ubBNuOitacKiu3M=;
 b=jFcAhrunVq/CIXC8FdII9/7CC044uwHPe6AS62BYwGmU678NUYAoRUsjjtOf4ytUjN
 IX9rpfzpQsvtCQ/mIIasEkPYPqwsFr/iClDqO9VsxzzguAY3kIfrN9vLEdG20NT+ENB1
 q3UhrVy7FoaA8RHRpgfF68Mg0asnaLIpxO5VdDV+4n9uoxwNbrS7r4txEzeJPivA1Bqk
 rBoVUCh3CyY97MDKHkAjaPhSKhMzj9VyEap5+q6GekZlF796kiF2VnjHNsV2eIMgUdG0
 GZJIJVFGIbs2zEhfIlNpxOnykKRG/RU73WaoDpBQ1Je7MQ36HI2KklA5c63sUUlJUg22
 r9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pXfXOZAWxFzYm835/ZHZbEkGgV0ubBNuOitacKiu3M=;
 b=zKIsi2e6NePCbn+ycdMyATktEzoLsEgYk+T1Kit2UB8tE37Tx3YP2+hLdLiWQ1kCdR
 RAFqPHlNWz/UUnCGwWNZI4+GBRe4N/6nYwWbj6m1NbE7bIUi2jqCq55oSy4RsiV0Xx/C
 28Wp43k8nacQXw0+lY63BgUAlnxM1BipqOkDv6o9vzAHXxoUg2zvo+IQl69uHoHohNfQ
 DN1BxVI90kmHgkV74KnqxwgRyrY5QLF7V9swJ/+0Q5170WX4LroZDz6S9Rkfu9dvo5VY
 CVzidBPuTffhCFSAVxipaUjAqWbV3zdJgpaI427V8ivENVLtEuKyTsUQvT3drxqs5k/F
 DpzA==
X-Gm-Message-State: AOAM531uNe3ffMIldT+C0pjmNsbPl/EqZpvRUd3Uw8Mx6kq5THxLxwHP
 n0TGEtq/kD7DLfz375aPOHnwkNg4SYqNXQPs
X-Google-Smtp-Source: ABdhPJx5noQP9DaZz3hVf0bXQb9UFzsHG044LoM3A+tuKrysLp7i/NNbIA3upiTN8GekiIa2xTzXbg==
X-Received: by 2002:a02:b707:: with SMTP id g7mr36176701jam.86.1641745180767; 
 Sun, 09 Jan 2022 08:19:40 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:40 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/30] bsd-user/signal.c: Implement signal_init()
Date: Sun,  9 Jan 2022 09:19:03 -0700
Message-Id: <20220109161923.85683-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
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

Initialize the signal state for the emulator. Setup a set of sane
default signal handlers, mirroring the host's signals. For fatal signals
(those that exit by default), establish our own set of signal
handlers. Stub out the actual signal handler we use for the moment.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  1 +
 bsd-user/signal.c | 68 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 334f8b1d715..0e0b8db708b 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -97,6 +97,7 @@ typedef struct TaskState {
     struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
     struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
+    sigset_t signal_mask;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 7ea86149981..b2c91c39379 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -28,6 +28,9 @@
  * fork.
  */
 
+static struct target_sigaction sigact_table[TARGET_NSIG];
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
+
 int host_to_target_signal(int sig)
 {
     return sig;
@@ -47,6 +50,28 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
     qemu_log_mask(LOG_UNIMP, "No signal queueing, dropping signal %d\n", sig);
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
 /*
  * Force a synchronously taken QEMU_SI_FAULT signal. For QEMU the
  * 'force' part is handled in process_pending_signals().
@@ -64,8 +89,51 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
     queue_signal(env, sig, &info);
 }
 
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
+{
+}
+
 void signal_init(void)
 {
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    struct sigaction act;
+    struct sigaction oact;
+    int i;
+    int host_sig;
+
+    /* Set the signal mask from the host mask. */
+    sigprocmask(0, 0, &ts->signal_mask);
+
+    /*
+     * Set all host signal handlers. ALL signals are blocked during the
+     * handlers to serialize them.
+     */
+    memset(sigact_table, 0, sizeof(sigact_table));
+
+    sigfillset(&act.sa_mask);
+    act.sa_sigaction = host_signal_handler;
+    act.sa_flags = SA_SIGINFO;
+
+    for (i = 1; i <= TARGET_NSIG; i++) {
+        host_sig = target_to_host_signal(i);
+        sigaction(host_sig, NULL, &oact);
+        if (oact.sa_sigaction == (void *)SIG_IGN) {
+            sigact_table[i - 1]._sa_handler = TARGET_SIG_IGN;
+        } else if (oact.sa_sigaction == (void *)SIG_DFL) {
+            sigact_table[i - 1]._sa_handler = TARGET_SIG_DFL;
+        }
+        /*
+         * If there's already a handler installed then something has
+         * gone horribly wrong, so don't even try to handle that case.
+         * Install some handlers for our own use.  We need at least
+         * SIGSEGV and SIGBUS, to detect exceptions.  We can not just
+         * trap all signals because it affects syscall interrupt
+         * behavior.  But do trap all default-fatal signals.
+         */
+        if (fatal_signal(i)) {
+            sigaction(host_sig, &act, NULL);
+        }
+    }
 }
 
 void process_pending_signals(CPUArchState *cpu_env)
-- 
2.33.1


