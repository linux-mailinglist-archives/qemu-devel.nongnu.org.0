Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17C4A50A7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:56:25 +0100 (CET)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdiq-0002Xg-5V
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcni-00051b-1R
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: from [2607:f8b0:4864:20::d31] (port=37493
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eI-LJ
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: by mail-io1-xd31.google.com with SMTP id n17so18417372iod.4
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8RA7yWCAX4kkKStNQOwlFxMIKNeQ5iUFxaPSVvYcxY=;
 b=dYTVc5bb0z4Qi38hRHKARf6sogNj33CQ0uB9UvgSHjdu+Exx4Zbc1pXwpv0mo1DTM3
 nUp2qruW80Rugsj39VEJNA3jFZ8upSFH5RIL/Y25XM27UQWajTCMLlThm5G/ASDysNO7
 y5NCwX1M/DM7k46FQRANickKc0b1bGHimqLTSlVMjMvoY2LjLZGerzLeqq7iT8HspQce
 4gevp767V8/QDOmESp8OlFMVoDhQ7rtqjti4vCrIfdWbAaMAcZZLJRtdEpJYZ5gtUnLj
 EYIuOlc+1SQ+d6cA98tMJAC1Q92hXO0y7YWvirs3Cg01JWBa5QqBIEbAjspPInyqR/dC
 vdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8RA7yWCAX4kkKStNQOwlFxMIKNeQ5iUFxaPSVvYcxY=;
 b=nDBqmnmENdrpBwORlyMCKB7KXGHtypAHxgMrElI+Ur1CZiINHJsNMKF5W6QKFmpa+J
 YP7pglSrEzslBpdYaiu+QWDMufAB98/QUviulMV+hr7nbsaQ8Vkt10XBqaCtn/8IYXHD
 2J6siqVP1Cg3k74obByhy53PXZablNB3k34h+bZVKMLDlsU4OClzxij1P4jCHLYZ/LUD
 Xij+YSkAknpv45Db/3rzNF766Z9/1jfvdY2ujLmlIxKVoiV0KhwqCPLvwcHWExpKYdY2
 uARo9U5NQUgNOycAMRpUgMwlPD31azDYQZRzjxkZQFVw6yRV9TphjGxq5e+9uxSPfZUi
 A3Iw==
X-Gm-Message-State: AOAM533iVKfKenb32aQp5WN5/WBeN5zCbtMC0csrVnsc3N8NgVp2fZBh
 MWDPrWL4YjuiEeYcbs5VIZ8fuR2rjQucZg==
X-Google-Smtp-Source: ABdhPJw3hxC+QI6ndFmtGUL892ozEA7+6TxgompY221NkHZbGpYCts1VFhq8RNdya5mzIPis/JuhEA==
X-Received: by 2002:a02:69c6:: with SMTP id
 e189mr11188458jac.137.1643659007290; 
 Mon, 31 Jan 2022 11:56:47 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/40] bsd-user/signal.c: Implement signal_init()
Date: Mon, 31 Jan 2022 12:56:13 -0700
Message-Id: <20220131195636.31991-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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

Initialize the signal state for the emulator. Setup a set of sane
default signal handlers, mirroring the host's signals. For fatal signals
(those that exit by default), establish our own set of signal
handlers. Stub out the actual signal handler we use for the moment.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org> XXX SIGPROF PENDING
---
 bsd-user/qemu.h   |  7 +++++
 bsd-user/signal.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 99c37fc9942..49f01932a53 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -94,6 +94,13 @@ typedef struct TaskState {
      * from multiple threads.)
      */
     int signal_pending;
+    /*
+     * This thread's signal mask, as requested by the guest program.
+     * The actual signal mask of this thread may differ:
+     *  + we don't let SIGSEGV and SIGBUS be blocked while running guest code
+     *  + sometimes we block all signals to avoid races
+     */
+    sigset_t signal_mask;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 1313baec96a..3ef7cf5e23c 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -28,6 +28,9 @@
  * fork.
  */
 
+static struct target_sigaction sigact_table[TARGET_NSIG];
+static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
+
 /*
  * The BSD ABIs use the same singal numbers across all the CPU architectures, so
  * (unlike Linux) these functions are just the identity mapping. This might not
@@ -52,6 +55,28 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info)
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
@@ -69,8 +94,50 @@ void force_sig_fault(int sig, int code, abi_ulong addr)
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
+    sigfillset(&act.sa_mask);
+    act.sa_sigaction = host_signal_handler;
+    act.sa_flags = SA_SIGINFO;
+
+    for (i = 1; i <= TARGET_NSIG; i++) {
+#ifdef CONFIG_GPROF
+        if (i == TARGET_SIGPROF) {
+            continue;
+        }
+#endif
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


