Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E149A602
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:17:50 +0100 (CET)
Received: from localhost ([::1]:48812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBP4-0005YI-3X
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfK-0002IN-VR
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:37 -0500
Received: from [2607:f8b0:4864:20::d2e] (port=34553
 helo=mail-io1-xd2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfI-0001hR-9V
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: by mail-io1-xd2e.google.com with SMTP id i62so6182624ioa.1
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCYcM3kga127WLQBa8pK54CGRf4Pbm+0uZfMuXdE2Fs=;
 b=jGsEp9Vk+QEL1jUvB+nlAQy1KmXus3PVEqU9JenKjj048qzwPZLFd5YixgQCQtXim8
 e1XJ8fa0+ycloOdPUvx/xKmpwLw6H+IsREzDw9aV3xciEaXWORJM53fhag4U5vM+J5ZN
 ZNXdiLHf6v8sdBmk8mSIu6j1rrIbrSdK2HxnwJHIOB5VCE6a2dSCKXyZ2I+6oqlEdwOh
 vwWA4DyU93l1FLTAWP3UgFB4RxuXcIIf/m5136jJRY7AXhiM3tIxddADulV+S1YJOS+k
 vQT3zqfsEIMJczyvXetG39YPlP3l097xntimD4JY1at1g6+uIpYW+oKniIhW+yIoJIcX
 b3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCYcM3kga127WLQBa8pK54CGRf4Pbm+0uZfMuXdE2Fs=;
 b=FdiuzLIWOCrPoHBY3gMjcKpTmkDLCSXhplTyCBjfmdwGaR2VvhYn+GVUUYvTu0BwQm
 8+Dr6Ho8A+OA1CTpjma27eg0Oij6F9F/w6dl2dmD+wigRho5tyBo9W+3LpzWRifHEgtG
 lqU6KYN0ViLZoNNsjQNU2fWaAeIHU0urcCOjJ4Mp1dC+K8qUrkwE/BdvRSXp8IrhZcRn
 ziDs8aJZMvZ4zkFe899UZBEI2K7aMUEIN3SSkZNzLM1p8Fj8hHRT38ZaW5ST6j9lN6AW
 MWOdlZ9vQm8fm+uR5c+/qSAgWCotTNmhEhLB7UJ60n9U8UaF2VBKSii6ssDc2NlMAHGC
 Xl8g==
X-Gm-Message-State: AOAM531FkG7XnBfb25vlTw6ULFqe7T4M5FZYWGiFnkRSp9mlFNbMz0iG
 fBBUrTiSA4ENsR9Deyv4mCIEuej3808pXw==
X-Google-Smtp-Source: ABdhPJwVJyAIMzG0ZKTV0VQHkhwrnE+Exm0VmgizHfkDo8dvzWyP5l3xB/cgX08KoVQ5D8t8LZ8WvA==
X-Received: by 2002:a05:6638:272c:: with SMTP id
 m44mr8608672jav.320.1643074228896; 
 Mon, 24 Jan 2022 17:30:28 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:28 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/40] bsd-user/signal.c: implement do_sigreturn
Date: Mon, 24 Jan 2022 18:29:42 -0700
Message-Id: <20220125012947.14974-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
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

Implements the meat of a sigreturn(2) system call via do_sigreturn, and
helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
and remove do_rt_sigreturn since it's linux only.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>

PENDING COMMENTS: from 	Peter Maydell <peter.maydell@linaro.org>

do_sigreturn() itself shouldn't be setting the active signal
mask, at least if you follow the linux-user design. It just
sets the thread's signal_mask field in the TaskState by
calling set_sigmask(), and then on our way out in the
main cpu loop we'll call process_pending_signals() which
sets the real thread signal mask to that value. (This, together
with do_sigreturn() calling block_signals() before it starts
work, avoids some race conditions where a host signal is delivered
as soon as we unblock, I think.)
---
 bsd-user/signal-common.h |  2 +-
 bsd-user/signal.c        | 56 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index ee819266f54..786ec592d18 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -11,7 +11,7 @@
 
 long do_rt_sigreturn(CPUArchState *env);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-long do_sigreturn(CPUArchState *env);
+long do_sigreturn(CPUArchState *env, abi_ulong addr);
 void force_sig_fault(int sig, int code, abi_ulong addr);
 int host_to_target_signal(int sig);
 void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 9ec4354d232..05caf812ccb 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -626,6 +626,62 @@ static void setup_frame(int sig, int code, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
+static int reset_signal_mask(target_ucontext_t *ucontext)
+{
+    int i;
+    sigset_t blocked;
+    target_sigset_t target_set;
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++)
+        if (__get_user(target_set.__bits[i],
+                    &ucontext->uc_sigmask.__bits[i])) {
+            return -TARGET_EFAULT;
+        }
+    target_to_host_sigset_internal(&blocked, &target_set);
+    ts->signal_mask = blocked;
+    sigprocmask(SIG_SETMASK, &ts->signal_mask, NULL);
+
+    return 0;
+}
+
+/* See sys/$M/$M/exec_machdep.c sigreturn() */
+long do_sigreturn(CPUArchState *env, abi_ulong addr)
+{
+    long ret;
+    abi_ulong target_ucontext;
+    target_ucontext_t *ucontext = NULL;
+
+    /* Get the target ucontext address from the stack frame */
+    ret = get_ucontext_sigreturn(env, addr, &target_ucontext);
+    if (is_error(ret)) {
+        return ret;
+    }
+    trace_user_do_sigreturn(env, addr);
+    if (!lock_user_struct(VERIFY_READ, ucontext, target_ucontext, 0)) {
+        goto badframe;
+    }
+
+    /* Set the register state back to before the signal. */
+    if (set_mcontext(env, &ucontext->uc_mcontext, 1)) {
+        goto badframe;
+    }
+
+    /* And reset the signal mask. */
+    if (reset_signal_mask(ucontext)) {
+        goto badframe;
+    }
+
+    unlock_user_struct(ucontext, target_ucontext, 0);
+    return -TARGET_EJUSTRETURN;
+
+badframe:
+    if (ucontext != NULL) {
+        unlock_user_struct(ucontext, target_ucontext, 0);
+    }
+    return -TARGET_EFAULT;
+}
+
 void signal_init(void)
 {
     TaskState *ts = (TaskState *)thread_cpu->opaque;
-- 
2.33.1


