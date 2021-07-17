Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E933CC6BC
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:23:03 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4teA-0004C8-Gr
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcM-0001cj-MR
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcK-0000gf-Va
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:10 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so9097962wmf.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueTdIGLbNp6Z/QM8B2gYfbg3TXSSIVPakVhr/L2xIog=;
 b=xK4SCDSj6/TOItttPD9LEVftR8WOAtzQfPoTHfNKisiaclP5Y8f/zN9Ogl0e81yF9I
 YFK94xFIJMWsV5kP47y92haRmMiORRdkAMJVHJmFrjUdwuPKgrr0b9gdI65nSs69b900
 IYbFkTC3zZ/qeQ5zpR0V6m8aM5xjIIs8cE7gF27jxveYp5jT1H3/z1w//fxi28zEfCwy
 0/B5DqLSuf9KxHxK/8kRvvC3uZx5eafOgEkOkfABsS1Gm4yyFwKkySG2S/gDpFwx4iis
 REUxh52wbsdY0JGDhgSyawVSPa/blQ48QSJ+qOxIIV2HuHT0g6L75VOk4uz2Os53vefv
 xQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ueTdIGLbNp6Z/QM8B2gYfbg3TXSSIVPakVhr/L2xIog=;
 b=RrD7YNkNrSJAtmyKLVeecdh8nLfV78RsadHw9ItwGDhbJOt2O4E7LykkO+lOjT+pvc
 2lYxyfUpDoxoTW1cSZDho5naG6cz99VieBqzO3JmuvOJxA1M4oYeGWu4JXWQUOua0E/6
 9f+3UmfL0BLWZdhryM+TqynfLUbgOJP5kqM2RxhL+GzTMm2HOb+arYXjsHO03dh75+dw
 vFsHGZ7Pw4WjxMrpTrUaJCsIkU9garsz5B0jFowm7uXE7ATTyrJziekXAXsBPSW7NxW5
 USw3SZzqNuDTp5V/d981cOIl/xiDdNMss7Isxb7ZjDhnipIaamAZai9D4v5C3tguGfgL
 nCjA==
X-Gm-Message-State: AOAM5325qLo3EoK6Oio1vseA7TES4lXTmvA97LshXUMgNLIxZnH+e3e3
 ut1LGlHmbaUU/zFVJCLP05Hd/mjU742m1w==
X-Google-Smtp-Source: ABdhPJyTWR5osfWUhhP5mKKOJcnqG8aXbMIfki86nVPX5npkrIeG5KXp+rs6RsdsYnTNEBTgjjQIsg==
X-Received: by 2002:a05:600c:6d8:: with SMTP id
 b24mr24701878wmn.111.1626564066764; 
 Sat, 17 Jul 2021 16:21:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 02/10] linux-user: Split strace prototypes into
 strace.h
Date: Sun, 18 Jul 2021 00:20:55 +0100
Message-Id: <20210717232103.18047-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The functions implemented in strace.c are only used in a few files in
linux-user; split them out of qemu.h and into a new strace.h header
which we include in the places that need it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 376629c6891..4932eebd5e5 100644
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


