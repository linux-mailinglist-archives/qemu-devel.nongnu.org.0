Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F1A4A2A86
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:19:34 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbSl-0004pv-KR
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qP-T9
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=35492
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bH-Gv
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:05 -0500
Received: by mail-io1-xd2c.google.com with SMTP id 9so9733612iou.2
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXHWOyKgi1YLQ++jL8z64ESafHKvZ4x5SjsBEBXqU1c=;
 b=svCeWaGnXbKPNzF+Wi0NCD9Zx9HyFO/IfRzN8fAlYFIOwhPqMdjOEbMxo5zZYHQauW
 SimihmSnBTXjCCWG7N4HWEJpeqO4rhDTz2NUcueb+QOpG/VJ7jaNl/Uhg8sv1eCGbjFv
 rUZvIqNJNjtQO7ujGCaOFYUHey20JJ8GAYGfTfF7xdL5tecURLyUDZY+H3vb6W745dhW
 rrS2E/94LSiTG2L7/3TqNUdvxlS/RPGdb69QoNwvxLjLyWxoO+uVawxyKncp1XAeHTNG
 9hDnf7uwpfCWTx5aKJqnqcARlhM4QZEhGpK7NBvZtnQnTWBjdSwSUYB6hcIcg+3wmie3
 3trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXHWOyKgi1YLQ++jL8z64ESafHKvZ4x5SjsBEBXqU1c=;
 b=0u6KuURBMfarhKWmAE52biq6S6e6lc+PfHB7Jf6CO1THXGoAOfb6xybTtfxM2GjRq0
 8pTkXwgXj2R7tTb1rQ7iUrLLNAAUV4mxBlJJV4cuL54rtAODhlVTKv1VFCI2Ss1cv5f1
 d/fB3zoykM0Rl5+HBJ6UOR/3EXcNAwjAK0R/bWr0Fk1wOM1EqX7xCLN4eIL1I93aOs1u
 pLfxg0n5ZbIVAsIDmwlnc8dEHs3WT++VfMO3tSIfy++LSckXBChgxQEX0AqTq/NRs6zQ
 jUxk2Sx637J7otzJg7R8oGaWOMfDzsCPvl4eUV+4fZDAJXj5wXwR8oo9TlTbvHKnOiaQ
 NosA==
X-Gm-Message-State: AOAM532TvHAHYdO7PDW2Ne+IEe2HLnREp/1vdn7iUb5+pZBlqM82LJNC
 yZcT4CyP7JYikdJvl2uBultHJSmWkw4U1Q==
X-Google-Smtp-Source: ABdhPJwAYSuWWkHWdevTCQligG1WL8pF/wOMJ75H5pQLjKiPZE/au/TJnmVJFAOEaxqHmcH6Fv7a0A==
X-Received: by 2002:a02:cf9d:: with SMTP id w29mr5656496jar.29.1643412518450; 
 Fri, 28 Jan 2022 15:28:38 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:37 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 32/40] bsd-user/signal.c: handle_pending_signal
Date: Fri, 28 Jan 2022 16:27:57 -0700
Message-Id: <20220128232805.86191-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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


