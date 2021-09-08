Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C97403CCB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:48:34 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzoP-0003Kz-HS
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkE-00067g-LC
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:14 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkB-0002Jz-AH
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id u16so3987404wrn.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eCdv5gKuVsFPM/q2fppv2eQKXpziT7UQgUqUL+mqt3I=;
 b=uFfl6Z4Xi2kBqEWUcKsJxqiKthvmxm7SlK3yT8S646divO2WR4apYpC+pm95OT3p8B
 WqcvlSoDVcvqEBn9UAQqD61++S/7TGVYvjFqvz5DASuBo+ovvJ2wBcr6aVPIqILWtLW2
 aujnFbh/YLRnPfifC+bSti82nsJcYIkTzB0CaMWJ75UvAYwZh9jQJHcTahSrNw0x3H+g
 pQvwWAhV3YupRytzB9KzlNCxZVMU7m0qiBi2iBsn81ezvPojoI8MM7anL4YOO18Jwwk/
 gpZrSA4OvOyKOC5cJ2wRv12lIv2N0ZwzJGI8RAA79z26v6uAa9gWeR7e/9BRUVSNbHvW
 PXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eCdv5gKuVsFPM/q2fppv2eQKXpziT7UQgUqUL+mqt3I=;
 b=L3jMdQZgmhjjhkj7ldLX9qYqOdiYA2JuNXmUQwHBvN44qLXXu3wnP/Fj0qr4BL+1E7
 iQyf9JcL5UOr88BoAV6VjY4lB3HAqJGPoZ9NRGL9fS252ng18Tv4atA5e8hVDepxN+b+
 +VH0jZ/I8rylEXEhhxu3aCYmGv29/zf/RO6nVgOtK4ZxIzfDS/ZQmctXSJRvXrZ5LbUM
 YZZx2TgAuhe9THJmAw69FH0dkas9/QKAndW2FSPM5l/mKKNg11qwtDJhx4x1sJsp14xz
 Vov9kpibbW/vNkKNTTmNCPZkp0FnsZVWhtOvsqflUn3CjFEL9t41fV8FwRLgKL0Kkanh
 BPyg==
X-Gm-Message-State: AOAM532WBwmQg2Wa4NLCNddWjYEIt86GTP5PZ+mBVMJuYsEXMQMQ/Opd
 nJWmN/YmCX+vMgtq9wLdMjtKcE5+TK4/7Q==
X-Google-Smtp-Source: ABdhPJzZwF1kG6ZKgrCa9dACXYFOlLAJVOtq1mfJG6U3tOWWl4RoqEvdkzLvBts1Bl5GC89A4pwklw==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr5021777wrz.139.1631115848713; 
 Wed, 08 Sep 2021 08:44:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] linux-user: Split strace prototypes into strace.h
Date: Wed,  8 Sep 2021 16:43:58 +0100
Message-Id: <20210908154405.15417-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions implemented in strace.c are only used in a few files in
linux-user; split them out of qemu.h and into a new strace.h header
which we include in the places that need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/qemu.h    | 18 ------------------
 linux-user/strace.h  | 38 ++++++++++++++++++++++++++++++++++++++
 linux-user/signal.c  |  1 +
 linux-user/strace.c  |  2 ++
 linux-user/syscall.c |  1 +
 5 files changed, 42 insertions(+), 18 deletions(-)
 create mode 100644 linux-user/strace.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 34b975ba502..ad2d49fed9f 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -415,24 +415,6 @@ extern long safe_syscall_base(int *pending, long number, ...);
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
-/* strace.c */
-void print_syscall(void *cpu_env, int num,
-                   abi_long arg1, abi_long arg2, abi_long arg3,
-                   abi_long arg4, abi_long arg5, abi_long arg6);
-void print_syscall_ret(void *cpu_env, int num, abi_long ret,
-                       abi_long arg1, abi_long arg2, abi_long arg3,
-                       abi_long arg4, abi_long arg5, abi_long arg6);
-/**
- * print_taken_signal:
- * @target_signum: target signal being taken
- * @tinfo: target_siginfo_t which will be passed to the guest for the signal
- *
- * Print strace output indicating that this signal is being taken by the guest,
- * in a format similar to:
- * --- SIGSEGV {si_signo=SIGSEGV, si_code=SI_KERNEL, si_addr=0} ---
- */
-void print_taken_signal(int target_signum, const target_siginfo_t *tinfo);
-
 /* signal.c */
 void process_pending_signals(CPUArchState *cpu_env);
 void signal_init(void);
diff --git a/linux-user/strace.h b/linux-user/strace.h
new file mode 100644
index 00000000000..1e232d07fc8
--- /dev/null
+++ b/linux-user/strace.h
@@ -0,0 +1,38 @@
+/*
+ * strace.h: prototypes for linux-user builtin strace handling
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef LINUX_USER_STRACE_H
+#define LINUX_USER_STRACE_H
+
+void print_syscall(void *cpu_env, int num,
+                   abi_long arg1, abi_long arg2, abi_long arg3,
+                   abi_long arg4, abi_long arg5, abi_long arg6);
+void print_syscall_ret(void *cpu_env, int num, abi_long ret,
+                       abi_long arg1, abi_long arg2, abi_long arg3,
+                       abi_long arg4, abi_long arg5, abi_long arg6);
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
+
+#endif /* LINUX_USER_STRACE_H */
diff --git a/linux-user/signal.c b/linux-user/signal.c
index a8faea6f090..ee1934947ac 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -22,6 +22,7 @@
 #include <sys/resource.h>
 
 #include "qemu.h"
+#include "strace.h"
 #include "trace.h"
 #include "signal-common.h"
 
diff --git a/linux-user/strace.c b/linux-user/strace.c
index cce0a5d1e35..ee3429fae82 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -1,4 +1,5 @@
 #include "qemu/osdep.h"
+
 #include <sys/ipc.h>
 #include <sys/msg.h>
 #include <sys/sem.h>
@@ -14,6 +15,7 @@
 #include <linux/netlink.h>
 #include <sched.h>
 #include "qemu.h"
+#include "strace.h"
 
 struct syscallname {
     int nr;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ccd3892b2df..4ac2801e495 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -127,6 +127,7 @@
 #include "uname.h"
 
 #include "qemu.h"
+#include "strace.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


