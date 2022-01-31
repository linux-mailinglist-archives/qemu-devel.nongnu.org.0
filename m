Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F54A5061
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:43:35 +0100 (CET)
Received: from localhost ([::1]:35836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdWQ-0000CM-77
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:43:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcni-00053B-S7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:23 -0500
Received: from [2607:f8b0:4864:20::132] (port=33308
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fo-Nr
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:22 -0500
Received: by mail-il1-x132.google.com with SMTP id o10so12441017ilh.0
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXHWOyKgi1YLQ++jL8z64ESafHKvZ4x5SjsBEBXqU1c=;
 b=e7Z3KDpzHW161AvBJWpv38GelPaY2aMal1gZt1xpi2FxN8UD3A9YOW8uUx2t4geFKa
 RFY3ksO0q82ug9QZ2GJ6U4OhZrHZZSST713BaZikOsjJ4Uh0qx1gYyY4/hjPyfZMSI+D
 g0DQddFBFgoZhIeZ8r2RfUJNGa3oyocF82bBlyN2zwl4ZIMRLyFR+A+Q7DhpSCJmgGQU
 NLox1JQ870qXi5ixxOzcM1IW7qpSVrZjaEwze1lNHsmPjq53ObbIJvAUi9angBqaa/3w
 yDqeKOZpQ+LsYqQz4yC7Lqi3aUI6dffw/a7tvGwXANI9opZxFKP5+S4w7CsaUVlTEHsy
 oTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXHWOyKgi1YLQ++jL8z64ESafHKvZ4x5SjsBEBXqU1c=;
 b=75ATJps1i+ZgRPHtCn8XTeFuNSJlUBgUpd0A3FGNmsytzogxrZrFG4v9EwVnaMU82V
 yxInq1jmgnb0RHCB5zk/8QMClFSNG7T/VpvEL9MfARs288OKsCARAhrB+hXfMecdBEun
 NZia7dWQCTx54/Cr1Pws5a3FWFV/Mrl/bxsREvebY3yebs76ndRTw1r02u2gviCnV/Ni
 g74ww9iOPtH039TTRAsOeUHIlzkznrbuMcfmPdQ+uERnGjbrhE86TjgdyuZ7Pnsz7xrk
 K4GHkSYxDPf4zWD7SpHSrE425OD8Zp42qLoOd2gR9I+iSH/7i+Y24B8ybQjs8mDHyz9/
 +0Og==
X-Gm-Message-State: AOAM530JvFc/Eh2EdvseuhBWfPCXu83Pk0WEDWnHE4Pki682QBWddNYi
 yjHwg9gfo8J4kPaf7/IE2bCb47dQJUyckw==
X-Google-Smtp-Source: ABdhPJwt1u+mDTxnxnJBB8kg88QO3MGQIBRLrM43YZUIv3AECAH3gCozvvZxhB8ZuJNxY316MzuHPQ==
X-Received: by 2002:a05:6e02:20cd:: with SMTP id
 13mr12941422ilq.225.1643659022745; 
 Mon, 31 Jan 2022 11:57:02 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:02 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/40] bsd-user/signal.c: handle_pending_signal
Date: Mon, 31 Jan 2022 12:56:28 -0700
Message-Id: <20220131195636.31991-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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

Handle a queued signal.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   |  7 ++++
 bsd-user/signal.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index de20650a00d..02921ac8b3b 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -99,6 +99,8 @@ typedef struct TaskState {
      * from multiple threads.)
      */
     int signal_pending;
+    /* True if we're leaving a sigsuspend and sigsuspend_mask is valid. */
+    bool in_sigsuspend;
     /*
      * This thread's signal mask, as requested by the guest program.
      * The actual signal mask of this thread may differ:
@@ -106,6 +108,11 @@ typedef struct TaskState {
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
index dbc13736073..366e047cccc 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -616,6 +616,93 @@ void signal_init(void)
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


