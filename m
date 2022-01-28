Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF634A2A78
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:13:01 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbMS-0007Yq-Jf
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000kZ-JT
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=36362
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafg-0001aI-Pq
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:58 -0500
Received: by mail-io1-xd2f.google.com with SMTP id h7so9703578iof.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8RA7yWCAX4kkKStNQOwlFxMIKNeQ5iUFxaPSVvYcxY=;
 b=ASi2uvA7MpDbQn5ObKYtpwcQI9JepGWAtou7fW4JPHzSz+wXTCHCj8S/uLWQahYul9
 i1fbPa7JmhPCvBnZg30R9E6f9VaOTYoUJeO7XZuKhW8YTkX1riateqvv4s2M+nwVcmWX
 CIN6VEfJ6mXHdJHlyvO+YpTABRcwkyFg1SjMHSFOmdvTB/mEQYFCJGvhCZBfFbWiBzat
 dRFKHi83uDaEFRsd4Iu+FUnIw76XQNi6hIlFK9Nnr+dBYf/zG+YVEuhSIW9UCCDd0v7t
 f1mAIOH1Li/l0W1x6xW60TTK3RZXc3marVIJWGoToc1f11MGXNjLSh3Gn/sp2K1Z1WXK
 gmhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l8RA7yWCAX4kkKStNQOwlFxMIKNeQ5iUFxaPSVvYcxY=;
 b=2HQgZ90PijmZPK13SmV2Hh/FA9CxCfFypDbREv2z0esA5C/cTRng5yEtRAuqvka81X
 ybANRKPo27af7H7cbcZAvdDV/9tSrFU5z9LJhpnvWxd6n2Yokh/9nRcAg4pRCyb1sJH4
 jFCJM1UxICaDt8pOAriQYwdLucR2GHiV9a8zJfwxFYkcd9q2oMOkRxcJpafchYpIvHkt
 anBjkWbeQXfrNwHMLj9Vmm+XveY7YPY/YCVrXafqFUAi/o8yO0aHO1zwO8tFXV74varU
 3rSdXAO1Q21KsZecbiTRF1ScqcVAgBV46zlJwRpU4kqdViH5+4Gn6rFq668B/qobQ+hf
 3ZoA==
X-Gm-Message-State: AOAM531JLvP82hEZBB3u9pwRS72vgMcv5uewaCgYLoMhLAZpOJ8rMiTJ
 MV7Ck74zSBhPzsewLrV7maV6W1LIRPrZXQ==
X-Google-Smtp-Source: ABdhPJyMMVEoVKcvHHSYa4iis/VkozVCKkbExtgmOLeofTUqhpW38dn+/WTxd2uL3FVtHeCs/39Aew==
X-Received: by 2002:a05:6638:1913:: with SMTP id
 p19mr5512110jal.181.1643412499834; 
 Fri, 28 Jan 2022 15:28:19 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:19 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/40] bsd-user/signal.c: Implement signal_init()
Date: Fri, 28 Jan 2022 16:27:42 -0700
Message-Id: <20220128232805.86191-18-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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


