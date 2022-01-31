Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798024A500A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:19:49 +0100 (CET)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEd9Q-00075g-36
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:19:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcne-0004ui-Ak
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:19 -0500
Received: from [2607:f8b0:4864:20::12d] (port=40854
 helo=mail-il1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fF-7W
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:17 -0500
Received: by mail-il1-x12d.google.com with SMTP id s1so12394934ilj.7
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=NZSrtCOCmwxoQlCIUBH8bIBYl8dEIZEWE1QT6tw2jfpkX+/ZusibsDmWGozj1RDu9f
 YRXz48XvfxFaCID2wunFvfwUsNW1Y5E+h+AFf3S/eg7KZ0zkSI/M3AmyjFE1R2eV3a52
 szIQ7sxq3Wh4flYsutmSBWcfVEuXtrlUjlEvtQDM6pM5TYBA4uHv7Mc3Ojm9O5sqfe39
 ga5W0cKSIJdpMZn0p+Kk1dqsNEeS31xhs6TOFH3NXmr8vxkLCJnenV0jqG7r63m8AkUi
 epcSbhS64Z5cmd9Ty+VCn86OrVkOGuZyh9NEBVC9fAFpNQ/96gyC0rqN7VHNAzv8jTE5
 a6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=D055Z/ztO9cZOaj4GUJW7NMaQxJJ6KM7MQQcOSgJnWOc6SBafEDY7e3J52OZVJombQ
 sVPIPS8yP6xGW5H21RpU6YVnet/6+wSlJUFHP7jRprLcNrv1GWsHuTNpBN8/PFIqk1Qv
 RwF20wL4dBMHaCj53PB9kMosPHE5JhRCAfLv4X+rhphhg73D4NB4BLUyRnnlnhqmq3Xo
 qzvitnpWXOegLnSNX+DmXqhWWMA1cUsEMhgWJWYdcDbAbaIuYv/u+i9O8c1TXQPBSuUp
 PG4vfxrNR0zn1TBHgv0hw1/iatz2NKehj9GhVWiMB800IOaguFfZHENcROPH2Yoga7lm
 R15A==
X-Gm-Message-State: AOAM533l2ZCkdZKSwqEohzjS7RYq68fKsWNeqESR4G3HMRccswEqnDlM
 awqcvAC75R7I2jKH1cIAAzCqCd889T+Wiw==
X-Google-Smtp-Source: ABdhPJwebBVeZq6X5vcZwDBnLTLqvVMi8E19b9DFPJpI9M/COsJRYpJ8SruwPkvcSm6jMELeSCA5wA==
X-Received: by 2002:a05:6e02:1945:: with SMTP id
 x5mr13207737ilu.49.1643659017206; 
 Mon, 31 Jan 2022 11:56:57 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/40] bsd-user/strace.c: print_taken_signal
Date: Mon, 31 Jan 2022 12:56:23 -0700
Message-Id: <20220131195636.31991-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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

print_taken_signal() prints signals when we're tracing signals.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h   | 10 +++++
 bsd-user/strace.c | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 8ed1bfbca89..a7964776fdb 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -204,6 +204,16 @@ print_openbsd_syscall(int num,
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
 
 /* mmap.c */
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


