Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E54A2A8B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:24:01 +0100 (CET)
Received: from localhost ([::1]:36090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbX6-0008QY-R9
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafy-0000qK-OW
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: from [2607:f8b0:4864:20::d31] (port=41658
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001b4-4i
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:04 -0500
Received: by mail-io1-xd31.google.com with SMTP id q204so9679328iod.8
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=a/Ow4cnhtWLOoclxNpD6jZT+838cyXdkwwrH6rtBVSwbNLO+nz3r26feAVITO/eliD
 pVKjD3QICIrnJkZU/9iV0Ke3jF1+VaXFTv0NDaEGKbC3aEQt/+8KLPKxE1yUtrzMhqgi
 Vsf2pI8IZ35xB63CaY1LGKXDpc7PdhOekm0KI7KWFPlXRnaNQZiI55Ya0D7IcTCppb5k
 dpsepgtprd2uZ5DOC5qHPsViv3HKzTGjDyYVY39+SKrf3D2amAcPOyDv2iVw/4bWTC6C
 VE9iMesl+dfIZ6gD2VFqVnwyAdrvnarXb4LDd3aw+qITRgBf9Q4ETsaPlrJeEPYeIhQJ
 cssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sPl9lqrZjcfTpqegDhQDXRvfLIYwDJ07NuHAvjSC0jE=;
 b=P/7+JBH0IgYQjLt1hBmT6Zsw6tbi6DYzBNz2ymzWA+SwFLo47oafb8F5Wp0k19ovf6
 cOCEzC2Ko4XsMDxEjxxsqw9RlwUFN2P/6W/EmRHYy8AiMe2ESviTEx19ouwID/JXHRSi
 Dw/7edFRt7NkEkLV/gPtPicdryex+rm5BJWQIgz7LjCSuXFh8jU5zbHmTHQWhGhPWaSS
 ucuSinrmSi2ZUXKQxZ+49msUD00/2XUvqlYyGbjDo4XmGIklV954AFypMf/gDQ8v7wBy
 +NCCebqQRmk8kiL33rhpkgr4QMK9pVgOfuDUX75iKYyHNRkWHY7E8xzrVVgCBOIWn+uT
 zFdQ==
X-Gm-Message-State: AOAM530ZyXzstdFwfFx4VaM9n9bKBEmbaMtAWHgPpb9gpUYV1Dd2dlET
 XQ02zBmtwlu05YWeivmGxdujt2r2TiQCJg==
X-Google-Smtp-Source: ABdhPJzPN30O5nxjObgGg8aoB5RZkQi37PkfLoz12rjmCDQcg8n/yUJ8dcp0wbMg4EsRBTyG+H+TBA==
X-Received: by 2002:a5e:8711:: with SMTP id y17mr6289313ioj.175.1643412511871; 
 Fri, 28 Jan 2022 15:28:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/40] bsd-user/strace.c: print_taken_signal
Date: Fri, 28 Jan 2022 16:27:52 -0700
Message-Id: <20220128232805.86191-28-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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


