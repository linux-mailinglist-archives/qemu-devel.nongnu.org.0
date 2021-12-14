Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C24739B8
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:45:19 +0100 (CET)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvwU-0007aR-W9
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:45:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveC-0008Ig-6B
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:24 -0500
Received: from [2607:f8b0:4864:20::634] (port=40825
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve4-0005Sa-Ab
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:23 -0500
Received: by mail-pl1-x634.google.com with SMTP id v19so12369707plo.7
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TT19p4RIHqcMgyPqlvdP5DEN83TNSNvFv1GopYPkozA=;
 b=IKHleyWNxJWW7tzS1wPb5hc40MjhQ/vEb6xQ7/7BjmkXBktVpeDXh8Nct5pq9qwG73
 5l1J0gKhP1Z2ZHljN5xTapSuj9ygLeXZrFYja883nNfDWKYG7qKKdIPseiP27Fk6h6Xv
 aUXYIE3lU5wt7g2yBQpwyVB8W8i+mvL2RgS2tVEiWdr647S1moHH46gWBdbP61hn8VFb
 Y/NrwBtkzRD1at1R0dyjs6uA/8bJ1begPzd5/rpc1REe2KQS6FpONNlf61fD8C5db61Q
 /ga8QgNaYihQNT7PvzJOGXgj5TnphKQLm1rdFpV0+xfgqjgICNC8AFFrwPyEXhoKsSq9
 imbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TT19p4RIHqcMgyPqlvdP5DEN83TNSNvFv1GopYPkozA=;
 b=hR6p6tq1WW3yHwU269UpuROCWlnti5bTnUC57mcZbFXkq6RHnE7q1tgp1ndSjZqCb7
 NGfCA0YIf+EkQ9ESgs2IObJQmdxhqeYwRtu5f/yNDDkkAOhCm2bHH5e0Cm7jHIU4aKHP
 GsTyqNnNPaMb0vGzcWTUJyjUX+YHu2zTzW9eXoyPUQ1Pm2Txo5RpY9tQcfVi3/u1ptPL
 2nR2y7lF5jZ3xcHFQc4hIwzv7bTFqoKTckVt2HulWP5sVK4bCyBzrH80FH/g+Xi49tqz
 ySXYXkhbtSk+9jE2h20riFIewR3V6Eu591ZbgZy1dovdFAVvb7m4oCjej+R2tSsyyjDD
 xPBA==
X-Gm-Message-State: AOAM533Xe/e3+QPzwPZEFEwKVr4xIDWIXgx2tsZGFsGP5G2IBT/YDcSC
 OniX9OUbxe71I4/Yj7K2JUu3Gx/OrFmGyA==
X-Google-Smtp-Source: ABdhPJxav8oehN5o+6ptt9wjVsitWQXjE6zVpmEpn/C9dgu+qDt9J25bXpGuk74cpbJOHrjC/fs4dQ==
X-Received: by 2002:a17:90a:3e09:: with SMTP id
 j9mr1761672pjc.24.1639441574978; 
 Mon, 13 Dec 2021 16:26:14 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/15] linux-user: Create special-errno.h
Date: Mon, 13 Dec 2021 16:25:58 -0800
Message-Id: <20211214002604.161983-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the two internal errno used by qemu internally into their own
header file.  This includes the one define required by safe-syscall.S.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/cpu_loop-common.h           |  1 +
 linux-user/generic/target_errno_defs.h | 17 --------------
 linux-user/signal-common.h             |  2 ++
 linux-user/special-errno.h             | 32 ++++++++++++++++++++++++++
 linux-user/syscall.c                   |  1 +
 linux-user/safe-syscall.S              |  2 +-
 6 files changed, 37 insertions(+), 18 deletions(-)
 create mode 100644 linux-user/special-errno.h

diff --git a/linux-user/cpu_loop-common.h b/linux-user/cpu_loop-common.h
index 8828af28a4..dc0042e4de 100644
--- a/linux-user/cpu_loop-common.h
+++ b/linux-user/cpu_loop-common.h
@@ -21,6 +21,7 @@
 #define CPU_LOOP_COMMON_H
 
 #include "exec/log.h"
+#include "special-errno.h"
 
 #define EXCP_DUMP(env, fmt, ...)                                        \
 do {                                                                    \
diff --git a/linux-user/generic/target_errno_defs.h b/linux-user/generic/target_errno_defs.h
index bb37d88be9..c2f9d403e7 100644
--- a/linux-user/generic/target_errno_defs.h
+++ b/linux-user/generic/target_errno_defs.h
@@ -147,21 +147,4 @@
 #define TARGET_ERFKILL         132     /* Operation not possible due to RF-kill */
 #define TARGET_EHWPOISON       133     /* Memory page has hardware error */
 
-/* QEMU internal, not visible to the guest. This is returned when a
- * system call should be restarted, to tell the main loop that it
- * should wind the guest PC backwards so it will re-execute the syscall
- * after handling any pending signals. They match with the ones the guest
- * kernel uses for the same purpose.
- */
-#define QEMU_ERESTARTSYS     512     /* Restart system call (if SA_RESTART) */
-
-/* QEMU internal, not visible to the guest. This is returned by the
- * do_sigreturn() code after a successful sigreturn syscall, to indicate
- * that it has correctly set the guest registers and so the main loop
- * should not touch them. We use the value the guest would use for
- * ERESTART_NOINTR (which is kernel internal) to guarantee that we won't
- * clash with a valid guest errno now or in the future.
- */
-#define QEMU_ESIGRETURN 513     /* Return from signal */
-
 #endif
diff --git a/linux-user/signal-common.h b/linux-user/signal-common.h
index b9f33bb44f..42aa479080 100644
--- a/linux-user/signal-common.h
+++ b/linux-user/signal-common.h
@@ -20,6 +20,8 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+#include "special-errno.h"
+
 /* Fallback addresses into sigtramp page. */
 extern abi_ulong default_sigreturn;
 extern abi_ulong default_rt_sigreturn;
diff --git a/linux-user/special-errno.h b/linux-user/special-errno.h
new file mode 100644
index 0000000000..4120455baa
--- /dev/null
+++ b/linux-user/special-errno.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * QEMU internal errno values for implementing user-only POSIX.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright (c) 2021 Linaro, Ltd.
+ */
+
+#ifndef SPECIAL_ERRNO_H
+#define SPECIAL_ERRNO_H
+
+/*
+ * All of these are QEMU internal, not visible to the guest.
+ * They should be chosen so as to not overlap with any host
+ * or guest errno.
+ */
+
+/*
+ * This is returned when a system call should be restarted, to tell the
+ * main loop that it should wind the guest PC backwards so it will
+ * re-execute the syscall after handling any pending signals.
+ */
+#define QEMU_ERESTARTSYS  512
+
+/*
+ * This is returned after a successful sigreturn syscall, to indicate
+ * that it has correctly set the guest registers and so the main loop
+ * should not touch them.
+ */
+#define QEMU_ESIGRETURN   513
+
+#endif /* SPECIAL_ERRNO_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2867be4cd3..f5bf6d155c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -136,6 +136,7 @@
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
+#include "special-errno.h"
 #include "qapi/error.h"
 #include "fd-trans.h"
 #include "tcg/tcg.h"
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index 7ddc997801..74f7e35694 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -10,7 +10,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "target_errno_defs.h"
+#include "special-errno.h"
 
 /* We have the correct host directory on our include path
  * so that this will pull in the right fragment for the architecture.
-- 
2.25.1


