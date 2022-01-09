Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C67488AA6
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:45:14 +0100 (CET)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bJh-0001pc-K6
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:45:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avB-0005zo-Ak
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:53 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=35399
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av9-00079Z-NR
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:53 -0500
Received: by mail-io1-xd2d.google.com with SMTP id y70so14419651iof.2
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pThHCeH4xmr6L8Ou79hre21omTxoT/W58GNaYNpkKbs=;
 b=zswI86oSK2kwmLKBxIguyVjaDC85sZmIua0d6EBwzEIMB8EecFUV4yPL4dGh7hSCEP
 cPLfJeRcgXU6ePiOLebM1Van9GDYhLGf8vVeGOvH47OYUQnEHa5f3K9IYQDt7gtFo+Qf
 dDRC2RS2StXkKzjgkieLhID1f9MCcAD65ohbTNFrd92PShTFLPnLoHGKnYLoma/is03V
 2El4aXgpdUkyELqovtMxSPlwft2cl6g0NfnZdkbkr3qY1scVW1W1oJR6TltsMS9zARtn
 6onSje0j8vfkKmNp/qTaA/CYCTW3/Yl/nAWM4Iqkomri/Hcp2XC2EyUVFc5wYkdYoThf
 aEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pThHCeH4xmr6L8Ou79hre21omTxoT/W58GNaYNpkKbs=;
 b=H3lD8aOuxVZ4ojU9Jk9XWodFzUej6bM1UE66Qk6uoIICNm9KuXCVHe1rQH394sbylp
 OR/SAsMbf4L0WhjIiU9pOnhaFouZfQE7fCwxLEAvd3VsaaHeMJDA8WRokeWIR1qcX5qV
 lDSJe0nNR0rUygSLchHXmGuXq8Z3qYn25USSPWYLtgNyKAwYUMJWau7BQAoQm4VrzYPN
 u3k9QME0GiXwGIywZ0cGal/rKCwfx3pB2vLBCQltgpjwLs613H8uMvk3lLJ1/7TjijZ2
 jvgQeexN2W0NhKyYiTgF8V9c3WdouMxHFTa9HZx0wyaVVdIUwFzZaroMgULrjOkd7nbO
 0tXg==
X-Gm-Message-State: AOAM533ykEBo6DjgG8OJLlQGqKcqv0A0EavqlKpV5k8WSCDSq8U6aqR2
 YCAzG1ZHDTLCWmJ3SHgJVjnmrZD91hbQtRs0
X-Google-Smtp-Source: ABdhPJwlvDOXwL2l2VfeBqSih7mELFvrsEYV/zGJEI4fnC1LQHkIcwV0yilG7+LqElowtgPh38Dwbw==
X-Received: by 2002:a02:6d6b:: with SMTP id e43mr1150959jaf.165.1641745190468; 
 Sun, 09 Jan 2022 08:19:50 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:49 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/30] bsd-user/strace.c: print_taken_signal
Date: Sun,  9 Jan 2022 09:19:12 -0700
Message-Id: <20220109161923.85683-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
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

print_taken_signal() prints signals when we're tracing signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h   | 10 +++++
 bsd-user/strace.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e5e97632c82..7c54a933eb8 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -202,6 +202,16 @@ print_openbsd_syscall(int num,
                       abi_long arg1, abi_long arg2, abi_long arg3,
                       abi_long arg4, abi_long arg5, abi_long arg6);
 void print_openbsd_syscall_ret(int num, abi_long ret);
+/**
+ * print_taken_signal:
+ * @target_signum: target signal being taken
+ * @tinfo: target_siginfo_t which will be passed to the guest for the signal
+ *
+ * Print strace output indicating that this signal is being taken by the guest,
+ * in a format similar to:
+ * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
+ */
+void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
 extern int do_strace;
 
 /* signal.c */
diff --git a/bsd-user/strace.c b/bsd-user/strace.c
index be40b8a20cf..a77d10dd6b6 100644
--- a/bsd-user/strace.c
+++ b/bsd-user/strace.c
@@ -31,6 +31,24 @@ int do_strace;
 /*
  * Utility functions
  */
+static const char *
+get_comma(int last)
+{
+    return (last) ? "" : ",";
+}
+
+/*
+ * Prints out raw parameter using given format.  Caller needs
+ * to do byte swapping if needed.
+ */
+static void
+print_raw_param(const char *fmt, abi_long param, int last)
+{
+    char format[64];
+
+    (void)snprintf(format, sizeof(format), "%s%s", fmt, get_comma(last));
+    gemu_log(format, param);
+}
 
 static void print_sysctl(const struct syscallname *name, abi_long arg1,
         abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5,
@@ -239,3 +257,82 @@ void print_openbsd_syscall_ret(int num, abi_long ret)
 
     print_syscall_ret(num, ret, openbsd_scnames, ARRAY_SIZE(openbsd_scnames));
 }
+
+static void
+print_signal(abi_ulong arg, int last)
+{
+    const char *signal_name = NULL;
+    switch (arg) {
+    case TARGET_SIGHUP:
+        signal_name = "SIGHUP";
+        break;
+    case TARGET_SIGINT:
+        signal_name = "SIGINT";
+        break;
+    case TARGET_SIGQUIT:
+        signal_name = "SIGQUIT";
+        break;
+    case TARGET_SIGILL:
+        signal_name = "SIGILL";
+        break;
+    case TARGET_SIGABRT:
+        signal_name = "SIGABRT";
+        break;
+    case TARGET_SIGFPE:
+        signal_name = "SIGFPE";
+        break;
+    case TARGET_SIGKILL:
+        signal_name = "SIGKILL";
+        break;
+    case TARGET_SIGSEGV:
+        signal_name = "SIGSEGV";
+        break;
+    case TARGET_SIGPIPE:
+        signal_name = "SIGPIPE";
+        break;
+    case TARGET_SIGALRM:
+        signal_name = "SIGALRM";
+        break;
+    case TARGET_SIGTERM:
+        signal_name = "SIGTERM";
+        break;
+    case TARGET_SIGUSR1:
+        signal_name = "SIGUSR1";
+        break;
+    case TARGET_SIGUSR2:
+        signal_name = "SIGUSR2";
+        break;
+    case TARGET_SIGCHLD:
+        signal_name = "SIGCHLD";
+        break;
+    case TARGET_SIGCONT:
+        signal_name = "SIGCONT";
+        break;
+    case TARGET_SIGSTOP:
+        signal_name = "SIGSTOP";
+        break;
+    case TARGET_SIGTTIN:
+        signal_name = "SIGTTIN";
+        break;
+    case TARGET_SIGTTOU:
+        signal_name = "SIGTTOU";
+        break;
+    }
+    if (signal_name == NULL) {
+        print_raw_param("%ld", arg, last);
+        return;
+    }
+    gemu_log("%s%s", signal_name, get_comma(last));
+}
+
+void print_taken_signal(int target_signum, const target_siginfo_t *tinfo)
+{
+    /*
+     * Print the strace output for a signal being taken:
+     * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
+     */
+    gemu_log("%d ", getpid());
+    gemu_log("--- ");
+    print_signal(target_signum, 1);
+    gemu_log(" ---\n");
+}
-- 
2.33.1


