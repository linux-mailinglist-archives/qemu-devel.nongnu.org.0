Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04D7403CDC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:51:08 +0200 (CEST)
Received: from localhost ([::1]:38248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzqt-0008Gp-Tj
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkH-0006JB-JI
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkD-0002Na-MU
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:17 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1904846wms.2
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3O4ZP3oo2yeGYuSveV4rxblUZCXVO+HQahT4ZhlslU=;
 b=KsOf3B/dhXf8WiAvaFJGlGc0/WtIa9DM5qXaBJSW4m1ClcKGfNEtGs7R2T69GsL8x/
 XZFiMb8Pe8oyEQ9YRJMDBUc7BDG7S5YHLVkFXb2SzX4xiIr0uhK4Giny3zzVX9tKVbJ0
 Io2PkLCVZXAhBOXkx0nVNMSsA687RnjCA/uKuPV/L+qk6oV2RvT6aIf6YXAeO3LPSv+8
 +u/HF4m0MNcS4SIdeY54NhEMpLnaoinNYFeXqitF4xeTHcYAj2qnvR1SmYYGenVghu36
 hzZZHakVizTjCgCrMfuk1pwMF1NOAL9C3PVnfddBE8Ux5lNNf3Lxg9LMPV6D9/ZnW6UL
 F15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3O4ZP3oo2yeGYuSveV4rxblUZCXVO+HQahT4ZhlslU=;
 b=Pl6HIIOuD382FDEMNa6CZIV6AWuRztXA/3bj93bSq2jPnG37/p0S7s1u2pu2inRNlA
 DKKSo3qy5FIMw1mZC84ltNVAvgMn0FrGAaVHKSmKMhdhDY0qhPDomQnMZTiXiIP5+GPL
 zG6vsw5MLqg8d34OCwKwTHGttpbtELH1xAEn47PiSL0fm4aH64qkByUiCY4And5s+cv2
 Pc05nXDMEnmbESTxuKbacfX2DpmF/aQMsCQaDx5LmEL31ZdJairoXRJS1AtyHu8jV1dK
 dY8W+UqmbYAImfkYosb8BtXfUZUklaRHUHtsMHvCiSlrFWK/ILS2qhYXSpQW9HHgqrBY
 6Kmg==
X-Gm-Message-State: AOAM531ZxjVp0R/RKOuH59IdvZJhbYHsBNTuiWJgC9z3z9xdVVYJC8al
 95/YKuNQo086Sk7RXFZYcUTt/q9QoucWGA==
X-Google-Smtp-Source: ABdhPJzMV+A1ve6Z2JveAjWLI9eK8FdkGct4q9tB34xru6c8gwTb5f1BIWF8JfVF/GsLv9qD/YXswQ==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr4128390wmm.182.1631115852060; 
 Wed, 08 Sep 2021 08:44:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] linux-user: Split safe-syscall macro into its own
 header
Date: Wed,  8 Sep 2021 16:44:02 +0100
Message-Id: <20210908154405.15417-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

Split the safe-syscall macro from qemu.h into a new safe-syscall.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/qemu.h         | 135 ---------------------------------
 linux-user/safe-syscall.h | 154 ++++++++++++++++++++++++++++++++++++++
 linux-user/syscall.c      |   1 +
 3 files changed, 155 insertions(+), 135 deletions(-)
 create mode 100644 linux-user/safe-syscall.h

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 0cb79990579..a82a46236e6 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -240,141 +240,6 @@ void probe_guest_base(const char *image_name,
 
 #include "qemu/log.h"
 
-/* safe_syscall.S */
-
-/**
- * safe_syscall:
- * @int number: number of system call to make
- * ...: arguments to the system call
- *
- * Call a system call if guest signal not pending.
- * This has the same API as the libc syscall() function, except that it
- * may return -1 with errno == TARGET_ERESTARTSYS if a signal was pending.
- *
- * Returns: the system call result, or -1 with an error code in errno
- * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing
- * with any of the host errno values.)
- */
-
-/*
- * A guide to using safe_syscall() to handle interactions between guest
- * syscalls and guest signals:
- *
- * Guest syscalls come in two flavours:
- *
- * (1) Non-interruptible syscalls
- *
- * These are guest syscalls that never get interrupted by signals and
- * so never return EINTR. They can be implemented straightforwardly in
- * QEMU: just make sure that if the implementation code has to make any
- * blocking calls that those calls are retried if they return EINTR.
- * It's also OK to implement these with safe_syscall, though it will be
- * a little less efficient if a signal is delivered at the 'wrong' moment.
- *
- * Some non-interruptible syscalls need to be handled using block_signals()
- * to block signals for the duration of the syscall. This mainly applies
- * to code which needs to modify the data structures used by the
- * host_signal_handler() function and the functions it calls, including
- * all syscalls which change the thread's signal mask.
- *
- * (2) Interruptible syscalls
- *
- * These are guest syscalls that can be interrupted by signals and
- * for which we need to either return EINTR or arrange for the guest
- * syscall to be restarted. This category includes both syscalls which
- * always restart (and in the kernel return -ERESTARTNOINTR), ones
- * which only restart if there is no handler (kernel returns -ERESTARTNOHAND
- * or -ERESTART_RESTARTBLOCK), and the most common kind which restart
- * if the handler was registered with SA_RESTART (kernel returns
- * -ERESTARTSYS). System calls which are only interruptible in some
- * situations (like 'open') also need to be handled this way.
- *
- * Here it is important that the host syscall is made
- * via this safe_syscall() function, and *not* via the host libc.
- * If the host libc is used then the implementation will appear to work
- * most of the time, but there will be a race condition where a
- * signal could arrive just before we make the host syscall inside libc,
- * and then then guest syscall will not correctly be interrupted.
- * Instead the implementation of the guest syscall can use the safe_syscall
- * function but otherwise just return the result or errno in the usual
- * way; the main loop code will take care of restarting the syscall
- * if appropriate.
- *
- * (If the implementation needs to make multiple host syscalls this is
- * OK; any which might really block must be via safe_syscall(); for those
- * which are only technically blocking (ie which we know in practice won't
- * stay in the host kernel indefinitely) it's OK to use libc if necessary.
- * You must be able to cope with backing out correctly if some safe_syscall
- * you make in the implementation returns either -TARGET_ERESTARTSYS or
- * EINTR though.)
- *
- * block_signals() cannot be used for interruptible syscalls.
- *
- *
- * How and why the safe_syscall implementation works:
- *
- * The basic setup is that we make the host syscall via a known
- * section of host native assembly. If a signal occurs, our signal
- * handler checks the interrupted host PC against the addresse of that
- * known section. If the PC is before or at the address of the syscall
- * instruction then we change the PC to point at a "return
- * -TARGET_ERESTARTSYS" code path instead, and then exit the signal handler
- * (causing the safe_syscall() call to immediately return that value).
- * Then in the main.c loop if we see this magic return value we adjust
- * the guest PC to wind it back to before the system call, and invoke
- * the guest signal handler as usual.
- *
- * This winding-back will happen in two cases:
- * (1) signal came in just before we took the host syscall (a race);
- *   in this case we'll take the guest signal and have another go
- *   at the syscall afterwards, and this is indistinguishable for the
- *   guest from the timing having been different such that the guest
- *   signal really did win the race
- * (2) signal came in while the host syscall was blocking, and the
- *   host kernel decided the syscall should be restarted;
- *   in this case we want to restart the guest syscall also, and so
- *   rewinding is the right thing. (Note that "restart" semantics mean
- *   "first call the signal handler, then reattempt the syscall".)
- * The other situation to consider is when a signal came in while the
- * host syscall was blocking, and the host kernel decided that the syscall
- * should not be restarted; in this case QEMU's host signal handler will
- * be invoked with the PC pointing just after the syscall instruction,
- * with registers indicating an EINTR return; the special code in the
- * handler will not kick in, and we will return EINTR to the guest as
- * we should.
- *
- * Notice that we can leave the host kernel to make the decision for
- * us about whether to do a restart of the syscall or not; we do not
- * need to check SA_RESTART flags in QEMU or distinguish the various
- * kinds of restartability.
- */
-#ifdef HAVE_SAFE_SYSCALL
-/* The core part of this function is implemented in assembly */
-extern long safe_syscall_base(int *pending, long number, ...);
-
-#define safe_syscall(...)                                               \
-    ({                                                                  \
-        long ret_;                                                      \
-        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
-        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
-        if (is_error(ret_)) {                                           \
-            errno = -ret_;                                              \
-            ret_ = -1;                                                  \
-        }                                                               \
-        ret_;                                                           \
-    })
-
-#else
-
-/*
- * Fallback for architectures which don't yet provide a safe-syscall assembly
- * fragment; note that this is racy!
- * This should go away when all host architectures have been updated.
- */
-#define safe_syscall syscall
-
-#endif
-
 /* syscall.c */
 int host_to_target_waitstatus(int status);
 
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
new file mode 100644
index 00000000000..6bc03902628
--- /dev/null
+++ b/linux-user/safe-syscall.h
@@ -0,0 +1,154 @@
+/*
+ * safe-syscall.h: prototypes for linux-user signal-race-safe syscalls
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
+#ifndef LINUX_USER_SAFE_SYSCALL_H
+#define LINUX_USER_SAFE_SYSCALL_H
+
+/**
+ * safe_syscall:
+ * @int number: number of system call to make
+ * ...: arguments to the system call
+ *
+ * Call a system call if guest signal not pending.
+ * This has the same API as the libc syscall() function, except that it
+ * may return -1 with errno == TARGET_ERESTARTSYS if a signal was pending.
+ *
+ * Returns: the system call result, or -1 with an error code in errno
+ * (Errnos are host errnos; we rely on TARGET_ERESTARTSYS not clashing
+ * with any of the host errno values.)
+ */
+
+/*
+ * A guide to using safe_syscall() to handle interactions between guest
+ * syscalls and guest signals:
+ *
+ * Guest syscalls come in two flavours:
+ *
+ * (1) Non-interruptible syscalls
+ *
+ * These are guest syscalls that never get interrupted by signals and
+ * so never return EINTR. They can be implemented straightforwardly in
+ * QEMU: just make sure that if the implementation code has to make any
+ * blocking calls that those calls are retried if they return EINTR.
+ * It's also OK to implement these with safe_syscall, though it will be
+ * a little less efficient if a signal is delivered at the 'wrong' moment.
+ *
+ * Some non-interruptible syscalls need to be handled using block_signals()
+ * to block signals for the duration of the syscall. This mainly applies
+ * to code which needs to modify the data structures used by the
+ * host_signal_handler() function and the functions it calls, including
+ * all syscalls which change the thread's signal mask.
+ *
+ * (2) Interruptible syscalls
+ *
+ * These are guest syscalls that can be interrupted by signals and
+ * for which we need to either return EINTR or arrange for the guest
+ * syscall to be restarted. This category includes both syscalls which
+ * always restart (and in the kernel return -ERESTARTNOINTR), ones
+ * which only restart if there is no handler (kernel returns -ERESTARTNOHAND
+ * or -ERESTART_RESTARTBLOCK), and the most common kind which restart
+ * if the handler was registered with SA_RESTART (kernel returns
+ * -ERESTARTSYS). System calls which are only interruptible in some
+ * situations (like 'open') also need to be handled this way.
+ *
+ * Here it is important that the host syscall is made
+ * via this safe_syscall() function, and *not* via the host libc.
+ * If the host libc is used then the implementation will appear to work
+ * most of the time, but there will be a race condition where a
+ * signal could arrive just before we make the host syscall inside libc,
+ * and then then guest syscall will not correctly be interrupted.
+ * Instead the implementation of the guest syscall can use the safe_syscall
+ * function but otherwise just return the result or errno in the usual
+ * way; the main loop code will take care of restarting the syscall
+ * if appropriate.
+ *
+ * (If the implementation needs to make multiple host syscalls this is
+ * OK; any which might really block must be via safe_syscall(); for those
+ * which are only technically blocking (ie which we know in practice won't
+ * stay in the host kernel indefinitely) it's OK to use libc if necessary.
+ * You must be able to cope with backing out correctly if some safe_syscall
+ * you make in the implementation returns either -TARGET_ERESTARTSYS or
+ * EINTR though.)
+ *
+ * block_signals() cannot be used for interruptible syscalls.
+ *
+ *
+ * How and why the safe_syscall implementation works:
+ *
+ * The basic setup is that we make the host syscall via a known
+ * section of host native assembly. If a signal occurs, our signal
+ * handler checks the interrupted host PC against the addresse of that
+ * known section. If the PC is before or at the address of the syscall
+ * instruction then we change the PC to point at a "return
+ * -TARGET_ERESTARTSYS" code path instead, and then exit the signal handler
+ * (causing the safe_syscall() call to immediately return that value).
+ * Then in the main.c loop if we see this magic return value we adjust
+ * the guest PC to wind it back to before the system call, and invoke
+ * the guest signal handler as usual.
+ *
+ * This winding-back will happen in two cases:
+ * (1) signal came in just before we took the host syscall (a race);
+ *   in this case we'll take the guest signal and have another go
+ *   at the syscall afterwards, and this is indistinguishable for the
+ *   guest from the timing having been different such that the guest
+ *   signal really did win the race
+ * (2) signal came in while the host syscall was blocking, and the
+ *   host kernel decided the syscall should be restarted;
+ *   in this case we want to restart the guest syscall also, and so
+ *   rewinding is the right thing. (Note that "restart" semantics mean
+ *   "first call the signal handler, then reattempt the syscall".)
+ * The other situation to consider is when a signal came in while the
+ * host syscall was blocking, and the host kernel decided that the syscall
+ * should not be restarted; in this case QEMU's host signal handler will
+ * be invoked with the PC pointing just after the syscall instruction,
+ * with registers indicating an EINTR return; the special code in the
+ * handler will not kick in, and we will return EINTR to the guest as
+ * we should.
+ *
+ * Notice that we can leave the host kernel to make the decision for
+ * us about whether to do a restart of the syscall or not; we do not
+ * need to check SA_RESTART flags in QEMU or distinguish the various
+ * kinds of restartability.
+ */
+#ifdef HAVE_SAFE_SYSCALL
+/* The core part of this function is implemented in assembly */
+extern long safe_syscall_base(int *pending, long number, ...);
+
+#define safe_syscall(...)                                               \
+    ({                                                                  \
+        long ret_;                                                      \
+        int *psp_ = &((TaskState *)thread_cpu->opaque)->signal_pending; \
+        ret_ = safe_syscall_base(psp_, __VA_ARGS__);                    \
+        if (is_error(ret_)) {                                           \
+            errno = -ret_;                                              \
+            ret_ = -1;                                                  \
+        }                                                               \
+        ret_;                                                           \
+    })
+
+#else
+
+/*
+ * Fallback for architectures which don't yet provide a safe-syscall assembly
+ * fragment; note that this is racy!
+ * This should go away when all host architectures have been updated.
+ */
+#define safe_syscall syscall
+
+#endif
+
+#endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index b6c8406e1dc..9873830b465 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -131,6 +131,7 @@
 #include "signal-common.h"
 #include "loader.h"
 #include "user-mmap.h"
+#include "safe-syscall.h"
 #include "qemu/guest-random.h"
 #include "qemu/selfmap.h"
 #include "user/syscall-trace.h"
-- 
2.20.1


