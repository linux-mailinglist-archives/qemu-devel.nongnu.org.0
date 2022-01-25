Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9549A25E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:59:31 +0100 (CET)
Received: from localhost ([::1]:43764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCB7L-0007iJ-2V
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Hx-Ao
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::d2f] (port=41738
 helo=mail-io1-xd2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfA-0001f3-Lc
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:27 -0500
Received: by mail-io1-xd2f.google.com with SMTP id q204so7309534iod.8
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=Vj+TSqYIivaAXh2697dkc7JUaCbIPrPykbeAttUFfrcvI29QqgG+KEKY+WQfq1srbF
 ZA1zM2BhevYTcE1lGPCnCVNUbx6phpFBMuKA8W/QMa/PqyNYjxcI+0Cfm3Ac2EJ05Yew
 UkQOjTREmAsmH2n5+KQHaHRXijfJzlGC6cNZhwZ42P/j6JxRVPZv+4kcNdVl9YCOZS8y
 V5WF2q8/QEKXv5jpzxBaPO/nLr0wWM0XCPHvzbk2fLKskQozutSiKcd/AT8fyx9c525W
 IhJYcLysycMfFMlc/iKhD/YvOBdS7dvOoAUNCrN27rhzJ5iIvJriA2mJFb3yjEac58z5
 975w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=sdzPSxAeTIYeie0Rbnf3P+E9cxZ9tvPWAcIJcAiZkC6GJbEaJN/RoOS/W3QIohkNnA
 GTfKO3Vc++NCrmveR/Hq9lkp6AlpGUgxwVep/urA2Rh1SeORdVf3Faif6p08jh7pYy0d
 wu5ZHaS0YF0jh4OAJs7pv5itpzcAyg5+Nb8RXe8QAuBfZ9S5FcjpzbPwhtC3uj98/bp5
 v6ApUYnC0Ly4jOe6RzJy00aO6lcJE2OsNBADzvYHOKRbHLhofamETvAlcyKIfaakRj78
 uef93Ci/Kdvje+5KrtZYR5KRK846xuNrmcfVbihpqwusHS1tM8+ShQ8ovluCsMztr05i
 +jTA==
X-Gm-Message-State: AOAM532TYsBmW+V69ekE/52zW/GXwK2UwyOZu3PgIxqBdBfNVgEFjhs8
 ab+NhBSC7gapXm+TGJEG3o9FOy7lKe+24w==
X-Google-Smtp-Source: ABdhPJwORMzPA4LAFNItsvD9SgY13JPzxmo9Q66iIgqgU8erIVNwN1QcP42D2Dy15sTbtkie/3/+hw==
X-Received: by 2002:a05:6638:149:: with SMTP id
 y9mr4313748jao.316.1643074220011; 
 Mon, 24 Jan 2022 17:30:20 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:19 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/40] bsd-user/strace.c: print_taken_signal
Date: Mon, 24 Jan 2022 18:29:34 -0700
Message-Id: <20220125012947.14974-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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


