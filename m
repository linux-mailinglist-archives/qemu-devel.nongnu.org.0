Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A814A266E
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:08:43 +0100 (CET)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbII-0008WK-Sk
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:08:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qN-SU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=34803
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bL-BP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:04 -0500
Received: by mail-io1-xd2f.google.com with SMTP id i62so9721216ioa.1
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EfXU/bU5UrfXlO2lCXn1UwsX0yCOpSJYrOS4ONrz1/I=;
 b=o3ZPRmjEOhUj3IlO8sVSmIoYaM0lAJqlLz8/yMckhRcbPatoGUBwkgrg4fhj5yG9LY
 ehVoWzlc39OWN64s2KH8hTpbTyR+4eaTv0VvLCLo+eygN3i9WwbURgwqay9+4iSTGchN
 Iwn1mRlcRRP9CysgKn1bCM49okhgQsfYAzCDn7SsSVBFL1esUz1WNCgSRQBaERJ8DA6r
 eYm62nmD+h/oAstyDUzsYXhg24dzxd+p+PIxWVEZ7617EZSH7mbaCWVN7CGjkOm3X1g8
 9zwhPYfPi9jgLICog2vGA45PaAA75ENPBpNC7HAwxF5g4Gx08eAJ5qh4TMoMunlmmx9O
 FonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EfXU/bU5UrfXlO2lCXn1UwsX0yCOpSJYrOS4ONrz1/I=;
 b=4rF4lKwe02eitiyUrU2dG433kbR56N/zL/hrqSpsvO74bKK+sPw65pQo/dU/HZyuov
 BfWiNMAojNVuNo+YMt9OPkenKcUT5Ixo+H8PZTfhqB8ICbDE1CBrDXLqt5hiyasfyevT
 GSIHOpaZCEetViu8sxG6XWkt18rzlS7ExrQncMQR3RAPAFSDw4fouCZntD8DMiixtZwV
 ME9UviyireMiIwMJ6hpuRzL5Ewo8QCKi2Vc2nH4Fh0d7QljT2bBn12DWIAzLqdinQYt5
 UCY1olA4TAhMIRZeBXfr7n7y6xZ9kmmQDKyWJ9psmhspVFCS/7vUbe5Uy7YcOg8sJnYD
 lS0g==
X-Gm-Message-State: AOAM531u1I9fS631+kHJriaCav62YQkC3CdLHd2qw3SXaKkCRuOrtI+Q
 F8wcDkFqAZrpedfUbEK6kYsFuBdSTVAgaA==
X-Google-Smtp-Source: ABdhPJzA9CqAhfs611qcVmGEAsHsXHFs8mK7NvxG0XNN8TzMV3gHAwBAE9JOzVJylyG7+F1Et+IjHQ==
X-Received: by 2002:a05:6638:28f:: with SMTP id
 c15mr6079850jaq.188.1643412521438; 
 Fri, 28 Jan 2022 15:28:41 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:41 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/40] bsd-user/signal.c: implement do_sigreturn
Date: Fri, 28 Jan 2022 16:28:00 -0700
Message-Id: <20220128232805.86191-36-imp@bsdimp.com>
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

Implements the meat of a sigreturn(2) system call via do_sigreturn, and
helper reset_signal_mask. Fix the prototype of do_sigreturn in qemu.h
and remove do_rt_sigreturn since it's linux only.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal-common.h |  2 +-
 bsd-user/signal.c        | 55 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

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
index 4b398745f45..79e1128d4f6 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -627,6 +627,61 @@ static void setup_frame(int sig, int code, struct target_sigaction *ka,
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


