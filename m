Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1749A5E1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:16:37 +0100 (CET)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBNs-00045O-Ln
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:16:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfI-0002I1-JN
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=43955
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfE-0001gq-I6
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:31 -0500
Received: by mail-io1-xd2d.google.com with SMTP id z199so7383140iof.10
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xNhtUGDKIHI+f2l21MCXghBiVRPXoDubfC9kQtHgX8o=;
 b=PXeRSuGeFP/nwXp9yqAi9Diw0zEc+HVPxgIi++cYeRWkJyyJWqzYeQ1c3Bgy6yRVie
 6gm4sPVkRGhYx7GjO+6sWLh+hoqq42AS+ymqNStKcm415dSVK+VbOKxVDyeetEfDLpd8
 4qGnoKT8urrAlqIdcHUzrrj59HYQ1lFpHCBHXu6HuuQMBrHVFfdGG+3U5BCwA9qNVkF6
 kGfQHnPHB3m5tISZMkss5rrOKzlza7rdsvGoaRhTR5jgs6H5ax2G6mclj18UCco9g03k
 kKwo5kQt/l3UkMaxAAmFUrPC7l9BuhBrJdoAD8FjxX4w2+GLiMnXUcOINlIGDkBwInw9
 sJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xNhtUGDKIHI+f2l21MCXghBiVRPXoDubfC9kQtHgX8o=;
 b=yRRivLN/EeVSXoxVHi24nEGeHW6JxB6HJEiZrrEJ+FZv30NVuEdqRTgaNB+gkPpDJR
 GHqng+csRgKpbYtNoufsWGMO7qFl9MqQorbR5JpPKJwuzAaFy1IUO5w1C+9/3WAmwQSb
 uUnuomqUtO+OUOKVAqNcqRiiM+YjqNDR24MkRxtXAweZF0cZn+nMzoG4+/ZRS2Rcb2ai
 UQTccNT28JJDP9B8OhbA89TrJSpLYCCZTtI8ELNo3CyBMPgQfHu/LDHINbx6VXFf0NAj
 EkwSv3SDOn7A+GkVccjeTzxEHm8dNvjycsZ1UIVolHbR9F3b1I03EYnIiIQU0JlxX5N4
 VVfw==
X-Gm-Message-State: AOAM532ONfWw3oNZTrcnsqH3cAexpIBl5kprcz+bhbB6nsyNi6J3l57W
 Rt/LGiTfIFbZgUHUo4L0zu7hc+olLWqh4A==
X-Google-Smtp-Source: ABdhPJzjrIXUGyQu1XQKayVFL8Au14j1HTuK71iPZmusswR8N7HBcVhcUw3rPMAosSa2vpZkadtdDg==
X-Received: by 2002:a6b:ee16:: with SMTP id i22mr3856840ioh.63.1643074225588; 
 Mon, 24 Jan 2022 17:30:25 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:24 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/40] bsd-user/signal.c: handle_pending_signal
Date: Mon, 24 Jan 2022 18:29:39 -0700
Message-Id: <20220125012947.14974-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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

Handle a queued signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  7 ++++
 bsd-user/signal.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 05be5de3f03..376b3d48eba 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -95,6 +95,8 @@ typedef struct TaskState {
      * from multiple threads.)
      */
     int signal_pending;
+    /* True if we're leaving a sigsuspend and sigsuspend_mask is valid. */
+    bool in_sigsuspend;
     /*
      * This thread's signal mask, as requested by the guest program.
      * The actual signal mask of this thread may differ:
@@ -102,6 +104,11 @@ typedef struct TaskState {
      *  + sometimes we block all signals to avoid races
      */
     sigset_t signal_mask;
+    /*
+     * The signal mask imposed by a guest sigsuspend syscall, if we are
+     * currently in the middle of such a syscall
+     */
+    sigset_t sigsuspend_mask;
 
     /* This thread's sigaltstack, if it has one */
     struct target_sigaltstack sigaltstack_used;
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 79a7083ddb3..d82d916bfbc 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -615,6 +615,93 @@ void signal_init(void)
     }
 }
 
+static void handle_pending_signal(CPUArchState *env, int sig,
+                                  struct emulated_sigtable *k)
+{
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    struct target_sigaction *sa;
+    int code;
+    sigset_t set;
+    abi_ulong handler;
+    target_siginfo_t tinfo;
+    target_sigset_t target_old_set;
+
+    trace_user_handle_signal(env, sig);
+
+    k->pending = 0;
+
+    sig = gdb_handlesig(cpu, sig);
+    if (!sig) {
+        sa = NULL;
+        handler = TARGET_SIG_IGN;
+    } else {
+        sa = &sigact_table[sig - 1];
+        handler = sa->_sa_handler;
+    }
+
+    if (do_strace) {
+        print_taken_signal(sig, &k->info);
+    }
+
+    if (handler == TARGET_SIG_DFL) {
+        /*
+         * default handler : ignore some signal. The other are job
+         * control or fatal.
+         */
+        if (sig == TARGET_SIGTSTP || sig == TARGET_SIGTTIN ||
+            sig == TARGET_SIGTTOU) {
+            kill(getpid(), SIGSTOP);
+        } else if (sig != TARGET_SIGCHLD && sig != TARGET_SIGURG &&
+                   sig != TARGET_SIGINFO && sig != TARGET_SIGWINCH &&
+                   sig != TARGET_SIGCONT) {
+            dump_core_and_abort(sig);
+        }
+    } else if (handler == TARGET_SIG_IGN) {
+        /* ignore sig */
+    } else if (handler == TARGET_SIG_ERR) {
+        dump_core_and_abort(sig);
+    } else {
+        /* compute the blocked signals during the handler execution */
+        sigset_t *blocked_set;
+
+        target_to_host_sigset(&set, &sa->sa_mask);
+        /*
+         * SA_NODEFER indicates that the current signal should not be
+         * blocked during the handler.
+         */
+        if (!(sa->sa_flags & TARGET_SA_NODEFER)) {
+            sigaddset(&set, target_to_host_signal(sig));
+        }
+
+        /*
+         * Save the previous blocked signal state to restore it at the
+         * end of the signal execution (see do_sigreturn).
+         */
+        host_to_target_sigset_internal(&target_old_set, &ts->signal_mask);
+
+        blocked_set = ts->in_sigsuspend ?
+            &ts->sigsuspend_mask : &ts->signal_mask;
+        sigorset(&ts->signal_mask, blocked_set, &set);
+        ts->in_sigsuspend = false;
+        sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
+
+        /* XXX VM86 on x86 ??? */
+
+        code = k->info.si_code; /* From host, so no si_type */
+        /* prepare the stack frame of the virtual CPU */
+        if (sa->sa_flags & TARGET_SA_SIGINFO) {
+            tswap_siginfo(&tinfo, &k->info);
+            setup_frame(sig, code, sa, &target_old_set, &tinfo, env);
+        } else {
+            setup_frame(sig, code, sa, &target_old_set, NULL, env);
+        }
+        if (sa->sa_flags & TARGET_SA_RESETHAND) {
+            sa->_sa_handler = TARGET_SIG_DFL;
+        }
+    }
+}
+
 void process_pending_signals(CPUArchState *cpu_env)
 {
 }
-- 
2.33.1


