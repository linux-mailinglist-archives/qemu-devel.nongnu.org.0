Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56A4A5016
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:24:55 +0100 (CET)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdEM-0000e9-7q
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:24:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnf-0004xN-Tk
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:20 -0500
Received: from [2607:f8b0:4864:20::d36] (port=43996
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002g6-Gc
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: by mail-io1-xd36.google.com with SMTP id z199so18396154iof.10
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sL+j8/qMLIuHq5OnGr0sHnHdREY1Bcj+mIcecdeQ4BA=;
 b=Le2lBG1imaMOlTuR+qViUyb+VKQjzAdjCxdDgkWQa8t75c7WiDFbBrCO/TqXoGVZOT
 fhiN32RTrIgLWckwhxYRZxSX3uqJYLuPp/YARAtE3jejMYD1pAkEBLAdwSelZMQS7g0M
 yRZLEnQsH7b6i26xCXxEfnEFV1CTEWyhiB+1zE3MFBlu7jNHsgECNaV1Go3CxFuaKbWm
 bFdHF3do1cBiNqFj4EQwd5Jd38PT1m6y5B5Jj600nfVLcgd/VhLXUGSdH/dwV/Ib/fcS
 YTjDAYGdfl1rAA2iNel6M+eS6kYsc3otsBvdAAMQDNapdGipz2Emve2Tpe2vJeXdPMjZ
 y5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sL+j8/qMLIuHq5OnGr0sHnHdREY1Bcj+mIcecdeQ4BA=;
 b=1BQoNC/nBviEnIPIA+kus4Q8TrQ5NWfeFBiUbUYRnsXnnMQfWD1nbPfn+xsUadSHga
 wzsyRF32sXZgRrfiQwBQkjLSqkX85qPSpwx+YGR9xON+eWzlOpJAqvmH17tDLwEez7ro
 UqnlKXNIpizA2C3CtsgR8E91EjQtLRUp/ouFFUaPoCWOgZndJ/vqCzchmkBah0qudDfR
 vG1fole4Vy7TvC8hM58lbjQwYoEnBCgR167MeBwZY5GkDclsKVYAAHpmxqp2bxzneWqz
 4lkh0nqfdgzVW/dWR4m74cJ0t+jjzLWZkQehbC3rkv91rVBLcH1QlI1m5y06Px9kjhNg
 vLKw==
X-Gm-Message-State: AOAM533XFXEh6jacqH18oCgKM3UZz3/sQChYsXVfQOewWNTUXIxqc0yF
 50zKBTqHt9Sht5OG+s2jggztF7ls+vu27g==
X-Google-Smtp-Source: ABdhPJxR1AOshpL+V70GZE6wP8TOEwv1vfhCbgAlbnfuaU6m3XMpaTJNJrbGapB6/ilkA15xlxUKrA==
X-Received: by 2002:a02:6988:: with SMTP id
 e130mr11298152jac.120.1643659026112; 
 Mon, 31 Jan 2022 11:57:06 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 35/40] bsd-user/signal.c: implement do_sigreturn
Date: Mon, 31 Jan 2022 12:56:31 -0700
Message-Id: <20220131195636.31991-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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

Implements the meat of a sigreturn(2) system call via do_sigreturn, and
helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
and remove do_rt_sigreturn since it's linux only.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 4b398745f45..150262a87e5 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -627,6 +627,62 @@ static void setup_frame(int sig, int code, struct target_sigaction *ka,
     unlock_user_struct(frame, frame_addr, 1);
 }
 
+static int reset_signal_mask(target_ucontext_t *ucontext)
+{
+    int i;
+    sigset_t blocked;
+    target_sigset_t target_set;
+    TaskState *ts = (TaskState *)thread_cpu->opaque;
+
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        if (__get_user(target_set.__bits[i],
+                    &ucontext->uc_sigmask.__bits[i])) {
+            return -TARGET_EFAULT;
+        }
+    }
+    target_to_host_sigset_internal(&blocked, &target_set);
+    ts->signal_mask = blocked;
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


