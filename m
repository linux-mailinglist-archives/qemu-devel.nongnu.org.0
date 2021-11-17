Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2882454AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:16:41 +0100 (CET)
Received: from localhost ([::1]:39200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNc0-0005FC-RX
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQN-0000Rf-AZ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:39 -0500
Received: from [2a00:1450:4864:20::335] (port=55038
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQL-00034E-Ec
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:39 -0500
Received: by mail-wm1-x335.google.com with SMTP id i12so2689834wmq.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wbb3ncUX0WysUh86/9pbKJFhgP0odAzb0iOBlu9YhRQ=;
 b=Y9ouor3Z+tHq5R/Dzg91eEQM0gojlx/R8p/dMoW7KPoDx9Jelti18DFeZx2d3Z7j00
 DJyQ+Jlzv1MW245qfp04zQzZan/fmto4LTor6xbylQEip9Yw3a06BtJxf3hQK3VLpGIq
 t9vchfxhheTwJzDdF++xf8hz5emGr6iCdrJ9S1oY/zc1OM6uhukqhMKwGpv4jYfrd44G
 pZVnulWWP2FIliqwbwIJe8zTJlkZ8HlJp56LJE46uin3GiHds3+VLKAwCppeT0CRG6Qe
 CYFfG2iIc8+SQDZ+xwrXv5H2mo4RxlcUw3U3TNSImKHA93LvrdreUbtGT0fRIJoG4zR3
 mF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wbb3ncUX0WysUh86/9pbKJFhgP0odAzb0iOBlu9YhRQ=;
 b=f0x5HJZ0Uz9I9jbtuCnARXzuNWB8FclDaIzDGACLdp8bZT4TIlHzoVPD60XdRWyiIz
 p2Rv4RV+lU1L1fjYaXk+GhABQJXgMLZeKMkrm9IFFQiy+JicA+PhorKFYAd7bpgic9pv
 sArRC31gFZzLXYKEZNHU10hIXBUnxESFWPgKOXxoZ0ZrKUli6kl4JP4xSDXsJYCob8sU
 bqCEZB7WINwHFJLEPK98qA3nu3dMlNcg3HpTXWd9fORPhIyOEMwpxsTdHwqowPXv2QCi
 C/SK0DxSfg+zfwsWSl18HQYUcmejSVJu9yHuhltVFhBa+VzJECDoB75jUVzITdN+c7kB
 u2nA==
X-Gm-Message-State: AOAM531yuxVDf0+p0w2WwuGXn5q9JOtHFO3uwxE/TBGK3/CmHbDhKz20
 59gVD6gMaZJqBkwx/5izdqs1FFkfEuhqoQxoDlc=
X-Google-Smtp-Source: ABdhPJwHz/zVe5vK+0j1ZAQCqFKctmHm3Bz7e+jMyZ5h6cDfwba6d3Rh4QHh0AFs7D9Jh0SdvzBUmA==
X-Received: by 2002:a7b:c388:: with SMTP id s8mr891565wmj.170.1637165076084;
 Wed, 17 Nov 2021 08:04:36 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:35 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/17] linux-user: Create special-errno.h
Date: Wed, 17 Nov 2021 17:04:07 +0100
Message-Id: <20211117160412.71563-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the two internal errno used by qemu internally into their own
header file.  This includes the one define required by safe-syscall.S.

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
index 1ef6abb776..33d342157d 100644
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


