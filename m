Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6E49A226
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:52:53 +0100 (CET)
Received: from localhost ([::1]:52222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB0u-0002wF-7Q
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:52:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfK-0002I2-2G
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: from [2607:f8b0:4864:20::d31] (port=39498
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfG-0001gs-Df
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:33 -0500
Received: by mail-io1-xd31.google.com with SMTP id p20so225536iod.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iFTjAIV7XEYSvKhiK50EBNfAbXI4YsjRaEW1MDHr5eo=;
 b=7nz3YqLsodDr7IMDEWjDlhtT2DjixE1xJCl5nYBMz101sS9xa3BOwllG6gLY6eAWfK
 IfO6wbuEJY53ELXElcbGF0IyPdokMiVYlZSwbA/f2w9qr4/emeMuRyEulYxQ7zR5HKWJ
 USJA3YDy7/VOImBujx0xFg9Gyp7nuYgLi2vYNP6wX62QNnkcW+SpGkq1DhuxQuto9zZq
 71hshBB/3qtDk0VVBxJD0Stbrvv363QKlSdWvls3uWOIg79Lw4A8EY/x9n3o04HZgZP+
 LJEuRyk6eF4DXqhhtiyLIrjbUQhJAX+h/7ALRvLp4naxZGejfY7FELLU65wmX1fITq40
 BNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iFTjAIV7XEYSvKhiK50EBNfAbXI4YsjRaEW1MDHr5eo=;
 b=j+WB60NSkNV8C4TEIYpNaChTVXwU/BzK7sKJz7jjaJ7+GH0vKDKOztNRyc8x/5jiaR
 0QH8Gx1tJRrut9QGwc2L520SKX49cFQ9vWroSQIyBk160DFJOYtTyaEqNd41zJf+NoBM
 R4MbPme8qxGYRErV+pYaGdE+dTj7tkiWA+D4uCckU/GBUVLB5vXts8fRntgxZssFtveh
 nIbPRTRaIFBVRdF6F3HCRQzV+CW/nZaR5AYnjSsx1Y0BuexWWFJvY1zuCAeSitG7i146
 ef+CSE+9hxuHIQ2HwKTFxU1WBPtOSpyfRTZF0xCn9WNIP2/fQBAnZCvM84Eq5XtentxP
 WEFw==
X-Gm-Message-State: AOAM532eoWPdeQY2IqxYakf32W1j5jax+6Ln/ExKJJl+hZwQU+OTADJH
 E5X/rqBk7zaCbkAHkBYEeiyelDk8TSg5mg==
X-Google-Smtp-Source: ABdhPJyNahVIYHe8akwKm4rbMOu6RHdTww6bgwSY5mdAsUOoX/3EGQH5yYLZej1lYrAlnk+AQl6oAA==
X-Received: by 2002:a5d:9b0c:: with SMTP id y12mr9239146ion.190.1643074224356; 
 Mon, 24 Jan 2022 17:30:24 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:23 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 31/40] bsd-user/signal.c: setup_frame
Date: Mon, 24 Jan 2022 18:29:38 -0700
Message-Id: <20220125012947.14974-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
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

setup_frame sets up a signalled stack frame. Associated routines to
extract the pointer to the stack frame and to support alternate stacks.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c   |  5 +++
 bsd-user/qemu.h   |  3 +-
 bsd-user/signal.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 29cf4e15693..f1d58e905e7 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -217,6 +217,11 @@ void qemu_cpu_kick(CPUState *cpu)
 /* Assumes contents are already zeroed.  */
 static void init_task_state(TaskState *ts)
 {
+    ts->sigaltstack_used = (struct target_sigaltstack) {
+        .ss_sp = 0,
+        .ss_size = 0,
+        .ss_flags = TARGET_SS_DISABLE,
+    };
 }
 
 void gemu_log(const char *fmt, ...)
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index fe0aedcdf3f..05be5de3f03 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -103,7 +103,8 @@ typedef struct TaskState {
      */
     sigset_t signal_mask;
 
-    uint8_t stack[];
+    /* This thread's sigaltstack, if it has one */
+    struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
 void stop_all_tasks(void);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 84dafa4e9fe..79a7083ddb3 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -35,6 +35,16 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc);
 static void target_to_host_sigset_internal(sigset_t *d,
         const target_sigset_t *s);
 
+static inline int on_sig_stack(TaskState *ts, unsigned long sp)
+{
+    return sp - ts->sigaltstack_used.ss_sp < ts->sigaltstack_used.ss_size;
+}
+
+static inline int sas_ss_flags(TaskState *ts, unsigned long sp)
+{
+    return ts->sigaltstack_used.ss_size == 0 ? SS_DISABLE :
+        on_sig_stack(ts, sp) ? SS_ONSTACK : 0;
+}
 
 /*
  * The BSD ABIs use the same singal numbers across all the CPU architectures, so
@@ -491,6 +501,78 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
     cpu_exit(thread_cpu);
 }
 
+static inline abi_ulong get_sigframe(struct target_sigaction *ka,
+        CPUArchState *env, size_t frame_size)
+{
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+    abi_ulong sp;
+
+    /* Use default user stack */
+    sp = get_sp_from_cpustate(env);
+
+    if ((ka->sa_flags & TARGET_SA_ONSTACK) && sas_ss_flags(ts, sp) == 0) {
+        sp = ts->sigaltstack_used.ss_sp + ts->sigaltstack_used.ss_size;
+    }
+
+#if defined(TARGET_ARM)
+    return (sp - frame_size) & ~7;
+#elif defined(TARGET_AARCH64)
+    return (sp - frame_size) & ~15;
+#else
+    return sp - frame_size;
+#endif
+}
+
+/* compare to $M/$M/exec_machdep.c sendsig and sys/kern/kern_sig.c sigexit */
+
+static void setup_frame(int sig, int code, struct target_sigaction *ka,
+    target_sigset_t *set, target_siginfo_t *tinfo, CPUArchState *env)
+{
+    struct target_sigframe *frame;
+    abi_ulong frame_addr;
+    int i;
+
+    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    trace_user_setup_frame(env, frame_addr);
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        unlock_user_struct(frame, frame_addr, 1);
+        dump_core_and_abort(TARGET_SIGILL);
+        return;
+    }
+
+    memset(frame, 0, sizeof(*frame));
+    setup_sigframe_arch(env, frame_addr, frame, 0);
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        __put_user(set->__bits[i], &frame->sf_uc.uc_sigmask.__bits[i]);
+    }
+
+    if (tinfo) {
+        frame->sf_si.si_signo = tinfo->si_signo;
+        frame->sf_si.si_errno = tinfo->si_errno;
+        frame->sf_si.si_code = tinfo->si_code;
+        frame->sf_si.si_pid = tinfo->si_pid;
+        frame->sf_si.si_uid = tinfo->si_uid;
+        frame->sf_si.si_status = tinfo->si_status;
+        frame->sf_si.si_addr = tinfo->si_addr;
+        /* see host_to_target_siginfo_noswap() for more details */
+        frame->sf_si.si_value.sival_ptr = tinfo->si_value.sival_ptr;
+        /*
+         * At this point, whatever is in the _reason union is complete
+         * and in target order, so just copy the whole thing over, even
+         * if it's too large for this specific signal.
+         * host_to_target_siginfo_noswap() and tswap_siginfo() have ensured
+         * that's so.
+         */
+        memcpy(&frame->sf_si._reason, &tinfo->_reason,
+               sizeof(tinfo->_reason));
+    }
+
+    set_sigtramp_args(env, sig, frame, frame_addr, ka);
+
+    unlock_user_struct(frame, frame_addr, 1);
+}
+
 void signal_init(void)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
-- 
2.33.1


