Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72F49A5E0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:14:18 +0100 (CET)
Received: from localhost ([::1]:44428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBLd-0002Po-DU
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:14:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfH-0002Hw-A8
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:34 -0500
Received: from [2607:f8b0:4864:20::133] (port=38787
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfA-0001fu-Rj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:27 -0500
Received: by mail-il1-x133.google.com with SMTP id i1so9530255ils.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8VtaM8f6H1mBedMcMN2t5hogqkVzA4l3N+z2sTiAUQ=;
 b=SjVcDEeEx8uNS25DJkmRY+0UCV8QJUVxzPP7eaz7QEmLkjWd3VWdu3yfqYaWiwsYYf
 UHZgWvBNSbPJWirNgZcU3N2FYEZHtzsEuPaLk+I+lVGMEBjS1mqzT/cfFq/GycRSFnAa
 2iuBwoBnuKxbQ1jeqzlhqLp1VFiNClxAIAPeBMrb8QMpCE4wwqnr2ycFtELmA6nCLV6X
 hhZDraGEMflJfn2eyo56aP9GXpxomyNiBjZz3b+AS2N42XSKh4I84l8zdEGNvzlWaJyn
 Ezsd6apX4RJLB4nbo9FH0smuKWwlxwzU8vu+VW67Pw66fomIvKOq9Wf2QEfUJ8ZtRz7I
 hyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8VtaM8f6H1mBedMcMN2t5hogqkVzA4l3N+z2sTiAUQ=;
 b=WhqKiTEMf55mECLTYs3kh8/lZHUO2R46xuRI0rFZo/ZSghR+dyyf/Z0ZheMENrgLz/
 Hx1eZKLPanJOaLDiKsbbn+N2SMsFZI3H8Yx3Vk82eSfJ07xt3uDz0kylzCGgFqifqwOn
 JqOrv9rlb3KKagWsQn1JBk5O837+e1KSvDPs/JCJbuvz0C5VonPvupK5VIj0dujE662G
 F3ZDA4+pFQbDq4qZfQGLWgquVmZtZHUnpYglhDAeSMSNP/UzL1Pod39783qFf4+t4h61
 bVB8lwK30WEkIjGp4sZj3AWH6l+U1DGETpuPvNDQMHltOc2rlb80gJyIitnaZG8h2mix
 N+8w==
X-Gm-Message-State: AOAM532m8atuujLT9tHELjhETcAlPlRgc3GfIB5tyhkMim65xXosBkPk
 +5ggQfXH/gC7v9AcvM5gBEFT73JEYZAZwQ==
X-Google-Smtp-Source: ABdhPJxAqTWBwSSk56flz6vmAhOVf09CSvWmu6y/6+6jonYmzjvt3mHejrLL4FhipcveMkXIYJmFtQ==
X-Received: by 2002:a05:6e02:20c1:: with SMTP id
 1mr10135214ilq.169.1643074221003; 
 Mon, 24 Jan 2022 17:30:21 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:20 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/40] bsd-user/signal.c: Implement dump_core_and_abort
Date: Mon, 24 Jan 2022 18:29:35 -0700
Message-Id: <20220125012947.14974-29-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

Force delivering a signal and generating a core file. It's a global
function for the moment...

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c       | 76 +++++++++++++++++++++++++++++++++++++++++
 bsd-user/syscall_defs.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 24cf4b1120b..ccda7adbeef 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -172,6 +172,82 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
     tinfo->si_code = deposit32(si_code, 24, 8, si_type);
 }
 
+/* Returns 1 if given signal should dump core if not handled. */
+static int core_dump_signal(int sig)
+{
+    switch (sig) {
+    case TARGET_SIGABRT:
+    case TARGET_SIGFPE:
+    case TARGET_SIGILL:
+    case TARGET_SIGQUIT:
+    case TARGET_SIGSEGV:
+    case TARGET_SIGTRAP:
+    case TARGET_SIGBUS:
+        return 1;
+    default:
+        return 0;
+    }
+}
+
+/* Abort execution with signal. */
+static void QEMU_NORETURN dump_core_and_abort(int target_sig)
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


