Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B4347B479
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:41:39 +0100 (CET)
Received: from localhost ([::1]:43678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPTW-0001L0-GC
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:41:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDj-0001jQ-Bt
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:19 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40505
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-00070Q-JQ
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:19 -0500
Received: by mail-pf1-x42f.google.com with SMTP id z6so9709385pfe.7
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gfvc6aI7WjYFeF9ly3kUangvwL6n6u92O4HwLhkZ27I=;
 b=hrLNstsHeyDDusEe6C0qhRAaQCWvuURAR9TXeB6E1cUeXobRDme5bUjk/pTWT9x1uz
 mzuuv4z32C4mXNRTZCao0RVwtIiRAVw3lWtZKtWvoNpcLpzeTdeC2HLZI045xDz72EPi
 GBWz0J8WQXtLCBiXxM4UaCQIBxKYPgjlvaI7Gs+3lhYq1OQbm5b3/LB3HySDl1JKblJI
 iPsXac9wPyj/OmGaiU4gRryBJ+a8qCHGqkMedhB6b+Ad495emKO0h1up3WkUqv0YrKTW
 LZ0xNupjyMDT4VGeDuAC3QhEDCXbA1tJ9S/jIN3a7qhpKdrRRwLLCnbdvEAKv+3cN0X6
 VelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfvc6aI7WjYFeF9ly3kUangvwL6n6u92O4HwLhkZ27I=;
 b=An4cWasUhgBc2GDCTSx+6KBm/Qse/Ks4RnhzD4frmkKKGqEfsn32WJ9T6man3awQ0i
 9dUfpcxM11k8bYy+JQzfUrYEA3a+JkfGoQeGWdJqZpLvHRoreTop+75W6CyZ15bum0ka
 dNC1t6qwYnTbM7co32gR1cyH5mcxdVyJKwktoOpLcl6YZ6crF0YVKeceqzzZ2EvU6mUd
 Hg2eiGD2Kekv3RE7nDaLZCypx8G379QTvfq0COF9NWswbwBcRdZqzJ6lzH5g5wBHmb20
 SaQ29nYZDHSFKUysXnPDWuJFApxy2x5FF6AgAx3lk33etgGOVmD3DpB/Q4yS3GW5rY+x
 wlog==
X-Gm-Message-State: AOAM533LQFKntgf6L+CYuDHhViHYIBABBZOs+VnGrw/7fgecyZtSMOE2
 t+ndXCqTZkYgknqmmZWf/2i1RysbL+wy6Q==
X-Google-Smtp-Source: ABdhPJzzUgcHPFYfuTDSAjsO05P5/13GrtC1q4lkSnnuDyPEBENPUmumxUpexrSRaJJc/MNTmKEGCQ==
X-Received: by 2002:a62:88c3:0:b0:4a2:b2d2:7082 with SMTP id
 l186-20020a6288c3000000b004a2b2d27082mr18102822pfd.48.1640031910246; 
 Mon, 20 Dec 2021 12:25:10 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] linux-user: Create special-errno.h
Date: Mon, 20 Dec 2021 12:24:54 -0800
Message-Id: <20211220202500.111897-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the two internal errno used by qemu internally into their own
header file.  This includes the one define required by safe-syscall.S.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


