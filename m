Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F65A488AA7
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:47:27 +0100 (CET)
Received: from localhost ([::1]:52076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bLq-0004NJ-7q
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:47:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avG-00067M-9G
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:58 -0500
Received: from [2607:f8b0:4864:20::d30] (port=37675
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avE-0007Ae-R7
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:58 -0500
Received: by mail-io1-xd30.google.com with SMTP id 19so14371352ioz.4
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IgeZV4dDM0VUWpp2I79PpeH7DAHq3pnTFE5wkPhwXEM=;
 b=BLy3SW1QPED7JYXdDROsFQjJdV3a6ogI3epJPSmhIp/S/WXwqxJ7QPXwzOxKF4woUp
 u3NqO1nR8FUNupNgmhbM+5Y8GQu6//gAJK3tvl7XMYqOd+QcZJl+vgo+uELrx7P5MKJ0
 V3Icv5mMtd0cv3XAY3I74dUxdu8WcPlvCfm9jBZtJSSyBsbH5YpkxByuE6ic29rddcsh
 25VpgvtbkBGGJniYHQ3h6/XKNxHK0hlKh3iIod6tNH4DdaxAG+DB3BbTq+FhQvflsLIr
 nGQSUMcuDBlyLrvH+FVgcJHCEm+/s2HMx62mG60Zy5RpUw59EXu95Zj2FHmqg07PG2Kl
 HVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IgeZV4dDM0VUWpp2I79PpeH7DAHq3pnTFE5wkPhwXEM=;
 b=bvDS3yziktWEjvy6J074wfB5ZA1xcGzIPtMwgRcFw53bOcwkcjEplS2LUi+gEf60Lr
 UQMl9SqcheKclwfee26ZbM6ZtY7Qg5lcrH1yFlOWAxVwfGq/WWoYDH5oPuft39jIay7S
 05f/6fBCElj0tyo2yu0O9SyA/gTKUrAa5SpOWsCF9At/NgZ7tVPuZB5pJDzvpmc0DLhM
 MXRuL5tsJCea2ReX2t2Moy5KJyqnOb+MohHAOqdrs7C7gQGTwsSeMEX+OraZJBRqvaIX
 OTXEBUTdCqkszh+dBD45V1j3b5WRP4y/5UYtRk0CIYy7KlTPUH4dvq8yj/8800boy2VI
 jiHA==
X-Gm-Message-State: AOAM532ppchKCXCTuWh9nXtaqZt2m8u9zVSTPE7iJOTz3yoPzRJGCNRn
 Qywi6FN3r8ruowQPptfZSRL+848ecpupGDLX
X-Google-Smtp-Source: ABdhPJwE8Bo00S5CiQoTS7BpmwEM7wSwlMROZ+6pC+PGJs9LBwTFtfbbE6ljtpXvOZTBQ7roL8a4Kg==
X-Received: by 2002:a02:a517:: with SMTP id e23mr32516509jam.35.1641745195616; 
 Sun, 09 Jan 2022 08:19:55 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:55 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/30] bsd-user/signal.c: handle_pending_signal
Date: Sun,  9 Jan 2022 09:19:18 -0700
Message-Id: <20220109161923.85683-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

Handle a queued signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   |  2 +
 bsd-user/signal.c | 96 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e8c417c7c33..011fdfebbaa 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -97,7 +97,9 @@ typedef struct TaskState {
     struct qemu_sigqueue sigqueue_table[MAX_SIGQUEUE_SIZE]; /* siginfo queue */
     struct qemu_sigqueue *first_free; /* first free siginfo queue entry */
     int signal_pending; /* non zero if a signal may be pending */
+    bool in_sigsuspend;
     sigset_t signal_mask;
+    sigset_t sigsuspend_mask;
 
     uint8_t stack[];
 } __attribute__((aligned(16))) TaskState;
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 8e1427553da..934528d5fb0 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -649,6 +649,102 @@ void signal_init(void)
     }
 }
 
+static void handle_pending_signal(CPUArchState *cpu_env, int sig,
+                                  struct emulated_sigtable *k)
+{
+    CPUState *cpu = env_cpu(cpu_env);
+    TaskState *ts = cpu->opaque;
+    struct qemu_sigqueue *q;
+    struct target_sigaction *sa;
+    int code;
+    sigset_t set;
+    abi_ulong handler;
+    target_siginfo_t tinfo;
+    target_sigset_t target_old_set;
+
+    trace_user_handle_signal(cpu_env, sig);
+
+    /* Dequeue signal. */
+    q = k->first;
+    k->first = q->next;
+    if (!k->first) {
+        k->pending = 0;
+    }
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
+        print_taken_signal(sig, &q->info);
+    }
+
+    if (handler == TARGET_SIG_DFL) {
+        /*
+         * default handler : ignore some signal. The other are job
+         * control or fatal.
+         */
+        if (TARGET_SIGTSTP == sig || TARGET_SIGTTIN == sig ||
+                TARGET_SIGTTOU == sig) {
+            kill(getpid(), SIGSTOP);
+        } else if (TARGET_SIGCHLD != sig && TARGET_SIGURG != sig &&
+            TARGET_SIGINFO != sig &&
+            TARGET_SIGWINCH != sig && TARGET_SIGCONT != sig) {
+            force_sig(sig);
+        }
+    } else if (TARGET_SIG_IGN == handler) {
+        /* ignore sig */
+    } else if (TARGET_SIG_ERR == handler) {
+        force_sig(sig);
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
+        qemu_sigorset(&ts->signal_mask, blocked_set, &set);
+        ts->in_sigsuspend = false;
+        sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
+
+        /* XXX VM86 on x86 ??? */
+
+        code = q->info.si_code;
+        /* prepare the stack frame of the virtual CPU */
+        if (sa->sa_flags & TARGET_SA_SIGINFO) {
+            tswap_siginfo(&tinfo, &q->info);
+            setup_frame(sig, code, sa, &target_old_set, &tinfo, cpu_env);
+        } else {
+            setup_frame(sig, code, sa, &target_old_set, NULL, cpu_env);
+        }
+        if (sa->sa_flags & TARGET_SA_RESETHAND) {
+            sa->_sa_handler = TARGET_SIG_DFL;
+        }
+    }
+    if (q != &k->info) {
+        free_sigqueue(cpu_env, q);
+    }
+}
+
 void process_pending_signals(CPUArchState *cpu_env)
 {
 }
-- 
2.33.1


