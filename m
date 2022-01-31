Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37294A5046
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:39:16 +0100 (CET)
Received: from localhost ([::1]:55540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdSF-0002fy-TN
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnh-0004zr-Dm
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=43006
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fk-Iy
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:21 -0500
Received: by mail-io1-xd2e.google.com with SMTP id r144so18377148iod.9
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C76G+GuQMn9cxisURWPURc1dlhmprPr1u46P1kEgqjQ=;
 b=P9Vl8Qfvy0CCHnPXE6z0mkc0m/nIzLA7BOHVHz9R8QQnEB0TrWwpjU98BGOrPcK9m+
 XV6mtGpixJLUpaOXjH1wiFnDzQ6P1+PprBz1eR7UzVACKbJOWI+xWM8IjyIXVT1LKswV
 2AQ/FeXaeUdmQxwf9UaCnh9Dmhp1lUmWGgZcf3rHrnOJdt5p0EfS8H78k2EGwF9mZMUn
 GY4S45zW+Vj+5Rsucw95DLgiz3UqTITO3p42DtkvZ/nrXOYLzKzVbViGLnydyZqNcvug
 Q4xDdyaA8lMje9ihM4FQsVgJc5avFvJjKJpshHDOaAdfE/jzyUoLR7TjyFtbAFGJc0FZ
 YVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C76G+GuQMn9cxisURWPURc1dlhmprPr1u46P1kEgqjQ=;
 b=4vj66f1f4A2hjPNgY4tjFRQgTPi9jY2v1nB1ff5XkcMM7L1A/IkM+vvj85R8o4NpHH
 5wXCTD2Bch++S8QW9Z74vB6Ua55MZD8etBnaOYKOBaKRLwxcbml93eZOFv0TXsYCl6hq
 hN88jyh/Rzi67UDUdTf7L5YhDzqnC2bMZQU1xMPcBeS6C7hZFjhkn/dfiraBW0v5NwCM
 eVGk54wFWHDSPJzngPPwjOy6uMS5yntZihafOCpvOzXoxbbGJdZv4lvaqKyl35sdGJjU
 /kxIQy66wBu0tz08pAp6Qmsny9vlTNRweoRMveRT5xtuIDD56JR0H3ijEzT2tX0qCag1
 ahOQ==
X-Gm-Message-State: AOAM530JawmGJZzGBs8qlvpLugC3g1Q3tHiVfq6wv+EqV1UxI2NgFmaU
 Fg+Z5PbcosWrH9zbdEybEowQ72F08AwYAg==
X-Google-Smtp-Source: ABdhPJxTfObAae1puZS8tZyqFBljnqNIkMZ1JD4zWGSJCEQQAKl0YBlvDmijJe36T5VCAOqkqqTqNg==
X-Received: by 2002:a05:6602:2d95:: with SMTP id
 k21mr12578268iow.84.1643659021819; 
 Mon, 31 Jan 2022 11:57:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/40] bsd-user/signal.c: setup_frame
Date: Mon, 31 Jan 2022 12:56:27 -0700
Message-Id: <20220131195636.31991-32-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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

setup_frame sets up a signalled stack frame. Associated routines to
extract the pointer to the stack frame and to support alternate stacks.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c   |  5 +++
 bsd-user/qemu.h   |  3 +-
 bsd-user/signal.c | 83 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

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
index 1648a509b9c..de20650a00d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -107,7 +107,8 @@ typedef struct TaskState {
      */
     sigset_t signal_mask;
 
-    uint8_t stack[];
+    /* This thread's sigaltstack, if it has one */
+    struct target_sigaltstack sigaltstack_used;
 } __attribute__((aligned(16))) TaskState;
 
 void stop_all_tasks(void);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 84dafa4e9fe..dbc13736073 100644
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
@@ -491,6 +501,79 @@ static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
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
+/* TODO: make this a target_arch function / define */
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


