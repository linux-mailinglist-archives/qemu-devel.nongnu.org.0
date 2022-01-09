Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A2488AA5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:44:26 +0100 (CET)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bIv-0000ca-Vu
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:44:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avC-00062c-Qc
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:54 -0500
Received: from [2607:f8b0:4864:20::d30] (port=38773
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avB-0007A1-CH
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:54 -0500
Received: by mail-io1-xd30.google.com with SMTP id u8so14397237iol.5
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gB3attyXcs9o/p6L5UleYu8j20xJN9LVJFH807AOJfw=;
 b=1K5DyfRi5qWoJahHYUhIU3MxPW2Fp9ih8k+TIugcH0mPt8qWuA3XSoH4L/30bVdowG
 tsLP3eLDmbGKEGLxFlOHDHOg4ZWzTLEt72NxUbun59aCSHDeavX4dO3va7dJ4M4gaPTA
 yc187Pm3uTZ/JcadmCPaRF0dnAOO87rq4gB59A86Trh1FWF47/DFWAJdROn/cDKiWesM
 3AjB8ECHZyOej/6glITlK6a/AKws+XozUQaabNwN9HQH/zhUQNZDKPYwZiJ2d3wjrzRu
 NFI92X/ScQSHw7BSDZ/9JyMb9rfBIjZevcbM6PBnEots0Yj7hp0Qt4H43tzU6xcLhLXF
 p2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gB3attyXcs9o/p6L5UleYu8j20xJN9LVJFH807AOJfw=;
 b=3R7A4WMeGPqf3N6KXRY66+/Y/CU8ffWcwrW7ufSMpfn/nPZcDQgCrMeIjILHBKKIg2
 scQtwTYFK97RMIYl/WPjj+JpSN/hILGp/5pl6zgSbjCb6JA5hadg0sWdFnViTtC2u2+4
 i+C9ZNHfCEdcXyfcpnfDdwyOunFbrJoUNHlXc+zKdBGJyPPF56nk7wVOq5TwGqo50hy0
 U/Gpv4Eity8O+2Soga6h1UXepb36d9RVx+jY+elODYo6/HgUOShpIIEGJvW1AJiRuVvV
 kiN2euwa7lNk6uv0n6qQONrXBp00cOF1lKfjM+u+72LC8Tu0nqjRaA8mbuVpHJ52sEhA
 5Uhw==
X-Gm-Message-State: AOAM533RXg5e8j1qbPaflDbAb6llGHRrJIjFBLQypmPdtbHp26JIJP/M
 jebG/mtxzmx1iwovBd9qp5RJLAGL0Auzyc0h
X-Google-Smtp-Source: ABdhPJzv4HYkiUXGnJ7jhcFixy5EPG+OvEg4CQ1H7tuitRWqz0j1TOmjtIjGgElElX71VzvIo0ZSfQ==
X-Received: by 2002:a05:6638:10ea:: with SMTP id
 g10mr35244447jae.117.1641745192180; 
 Sun, 09 Jan 2022 08:19:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/30] bsd-user/signal.c: force_sig
Date: Sun,  9 Jan 2022 09:19:14 -0700
Message-Id: <20220109161923.85683-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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

Force delivering a signal and generating a core file.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h         |  1 +
 bsd-user/signal.c       | 59 +++++++++++++++++++++++++++++++++++++++++
 bsd-user/syscall_defs.h |  1 +
 3 files changed, 61 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 7c54a933eb8..e12617f5d69 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -223,6 +223,7 @@ void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
 int target_to_host_signal(int sig);
 int host_to_target_signal(int sig);
+void QEMU_NORETURN force_sig(int target_sig);
 
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 824535be8b8..97f42f9c45e 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -109,6 +109,65 @@ static int core_dump_signal(int sig)
     }
 }
 
+/* Abort execution with signal. */
+void QEMU_NORETURN force_sig(int target_sig)
+{
+    CPUArchState *env = thread_cpu->env_ptr;
+    CPUState *cpu = env_cpu(env);
+    TaskState *ts = cpu->opaque;
+    int core_dumped = 0;
+    int host_sig;
+    struct sigaction act;
+
+    host_sig = target_to_host_signal(target_sig);
+    gdb_signalled(env, target_sig);
+
+    /* Dump core if supported by target binary format */
+    if (core_dump_signal(target_sig) && (ts->bprm->core_dump != NULL)) {
+        stop_all_tasks();
+        core_dumped =
+            ((*ts->bprm->core_dump)(target_sig, env) == 0);
+    }
+    if (core_dumped) {
+        struct rlimit nodump;
+
+        /*
+         * We already dumped the core of target process, we don't want
+         * a coredump of qemu itself.
+         */
+         getrlimit(RLIMIT_CORE, &nodump);
+         nodump.rlim_cur = 0;
+         setrlimit(RLIMIT_CORE, &nodump);
+         (void) fprintf(stderr, "qemu: uncaught target signal %d (%s) "
+             "- %s\n", target_sig, strsignal(host_sig), "core dumped");
+    }
+
+    /*
+     * The proper exit code for dying from an uncaught signal is
+     * -<signal>.  The kernel doesn't allow exit() or _exit() to pass
+     * a negative value.  To get the proper exit code we need to
+     * actually die from an uncaught signal.  Here the default signal
+     * handler is installed, we send ourself a signal and we wait for
+     * it to arrive.
+     */
+    memset(&act, 0, sizeof(act));
+    sigfillset(&act.sa_mask);
+    act.sa_handler = SIG_DFL;
+    sigaction(host_sig, &act, NULL);
+
+    kill(getpid(), host_sig);
+
+    /*
+     * Make sure the signal isn't masked (just reuse the mask inside
+     * of act).
+     */
+    sigdelset(&act.sa_mask, host_sig);
+    sigsuspend(&act.sa_mask);
+
+    /* unreachable */
+    abort();
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 04a1a886d7b..62b472b990b 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -21,6 +21,7 @@
 #define _SYSCALL_DEFS_H_
 
 #include <sys/syscall.h>
+#include <sys/resource.h>
 
 #include "errno_defs.h"
 
-- 
2.33.1


