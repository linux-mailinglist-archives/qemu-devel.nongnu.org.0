Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FD9452FD3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:07:36 +0100 (CET)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwJL-0001An-Et
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:07:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF8-0001wI-2z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:14 -0500
Received: from [2a00:1450:4864:20::331] (port=54961
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmwF4-0004vV-Nr
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:03:13 -0500
Received: by mail-wm1-x331.google.com with SMTP id i12so15685099wmq.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=97TnL/zZTuZneeKyX3ZHf+5FRTGzASpgACrDLgbvpRc=;
 b=rX80InADBbCQhLIF1AybPHOr0kfbZPdeXU8/oCnEI0Rrx/wCUlKV1ZqGClpDPRXg3v
 HYlVQS4wvjXBvXsbIrD6KNkHKPT+yp0fVPRDSWRdCeACuWOjdWJVgYVF2XFUJL9Pb7bf
 lBaCxDLpWLccz6riAhNUbzUNaG5Fg8108iMLhVmSJx8ivHmrPVbXzFIWyS83ttzoVVYL
 Uw0dj/RUNOhpb83Oqfj+8Haenv+w6I5uYnlHPYzwmaNJdn8iX0a2foRIhGnsGc0Ar3vr
 CuJDFM5SaL382N+MMxRtOA0TA/k84NWQyt166Jl+8sfuduK2wKtHQpT5wEJhXUu4GVUy
 kQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=97TnL/zZTuZneeKyX3ZHf+5FRTGzASpgACrDLgbvpRc=;
 b=Pzxc51Bfe7lV4uwZCTo9tUAuln/28dM19Pr5O4v/kyy73jcaNgFR6GDkiMDBmQSu+l
 6HcPK91RO3X2jy4FRPnm1ZxidxBoKA0oyuIWTV1IzAav1cLQrDgW8DF5pPKUMVlVnVLl
 Urcr1Vste1bOlCm7gnyO6Zr3mEXtHO+Y2tmmp2u5mrpHjo4RVi6OszBtXtswBQBUEikP
 Cq5kdvwZ0RRrQlSjMlZxxcsViah3Y1t4/UKq4O/t8tqtRLOq/uJ4NwV+M8sIsRtqfVqM
 lxf8thoswxEIO83TVGpDCv6/hgAs69YSS7dB2u8h5RCunC0ddGVmn4K9uisXSGxCMFlu
 4fig==
X-Gm-Message-State: AOAM530Kt35ECe6p73k9CJAGpKem+E4iz1Rrk4cELbrBmyB4CFFe8Wm9
 pS7wi7+29Lx9sO3VNjJHUgjV9mtQ2AZTcraoQ1o=
X-Google-Smtp-Source: ABdhPJy+xAr+wcpWAWS+YNxMN4kw+0G1CF2YSEIlVMV0LBTPECTJG8VtPMmyD1qY5XwAfZISBt7Fvw==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr68796483wmq.34.1637060589034; 
 Tue, 16 Nov 2021 03:03:09 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id f15sm2639779wmg.30.2021.11.16.03.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:03:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/9] linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
Date: Tue, 16 Nov 2021 12:02:54 +0100
Message-Id: <20211116110256.365484-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116110256.365484-1-richard.henderson@linaro.org>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

All supported hosts now define HAVE_SAFE_SYSCALL, so remove
the ifdefs.  This leaves hostdep.h empty, so remove it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 common-user/host/aarch64/hostdep.h | 18 ------------------
 common-user/host/arm/hostdep.h     | 18 ------------------
 common-user/host/i386/hostdep.h    | 18 ------------------
 common-user/host/mips/hostdep.h    |  2 --
 common-user/host/ppc64/hostdep.h   | 18 ------------------
 common-user/host/riscv/hostdep.h   | 14 --------------
 common-user/host/s390x/hostdep.h   | 18 ------------------
 common-user/host/sparc64/hostdep.h |  2 --
 common-user/host/x86_64/hostdep.h  | 18 ------------------
 linux-user/host/ia64/hostdep.h     | 15 ---------------
 linux-user/host/mips/hostdep.h     | 15 ---------------
 linux-user/host/ppc/hostdep.h      | 15 ---------------
 linux-user/host/s390/hostdep.h     | 15 ---------------
 linux-user/host/sparc/hostdep.h    | 15 ---------------
 linux-user/host/sparc64/hostdep.h  | 15 ---------------
 linux-user/host/x32/hostdep.h      | 15 ---------------
 linux-user/safe-syscall.h          | 12 ------------
 linux-user/user-internals.h        |  1 -
 linux-user/signal.c                |  2 --
 linux-user/safe-syscall.S          |  3 ---
 20 files changed, 249 deletions(-)
 delete mode 100644 common-user/host/aarch64/hostdep.h
 delete mode 100644 common-user/host/arm/hostdep.h
 delete mode 100644 common-user/host/i386/hostdep.h
 delete mode 100644 common-user/host/mips/hostdep.h
 delete mode 100644 common-user/host/ppc64/hostdep.h
 delete mode 100644 common-user/host/riscv/hostdep.h
 delete mode 100644 common-user/host/s390x/hostdep.h
 delete mode 100644 common-user/host/sparc64/hostdep.h
 delete mode 100644 common-user/host/x86_64/hostdep.h
 delete mode 100644 linux-user/host/ia64/hostdep.h
 delete mode 100644 linux-user/host/mips/hostdep.h
 delete mode 100644 linux-user/host/ppc/hostdep.h
 delete mode 100644 linux-user/host/s390/hostdep.h
 delete mode 100644 linux-user/host/sparc/hostdep.h
 delete mode 100644 linux-user/host/sparc64/hostdep.h
 delete mode 100644 linux-user/host/x32/hostdep.h

diff --git a/common-user/host/aarch64/hostdep.h b/common-user/host/aarch64/hostdep.h
deleted file mode 100644
index 39299d798a..0000000000
--- a/common-user/host/aarch64/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef AARCH64_HOSTDEP_H
-#define AARCH64_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/arm/hostdep.h b/common-user/host/arm/hostdep.h
deleted file mode 100644
index 86b137875a..0000000000
--- a/common-user/host/arm/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef ARM_HOSTDEP_H
-#define ARM_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/i386/hostdep.h b/common-user/host/i386/hostdep.h
deleted file mode 100644
index ce7136501f..0000000000
--- a/common-user/host/i386/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef I386_HOSTDEP_H
-#define I386_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/mips/hostdep.h b/common-user/host/mips/hostdep.h
deleted file mode 100644
index b18aca1deb..0000000000
--- a/common-user/host/mips/hostdep.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
diff --git a/common-user/host/ppc64/hostdep.h b/common-user/host/ppc64/hostdep.h
deleted file mode 100644
index 0c290dd904..0000000000
--- a/common-user/host/ppc64/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef PPC64_HOSTDEP_H
-#define PPC64_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/riscv/hostdep.h b/common-user/host/riscv/hostdep.h
deleted file mode 100644
index 7f67c22868..0000000000
--- a/common-user/host/riscv/hostdep.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef RISCV_HOSTDEP_H
-#define RISCV_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/s390x/hostdep.h b/common-user/host/s390x/hostdep.h
deleted file mode 100644
index d801145854..0000000000
--- a/common-user/host/s390x/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef S390X_HOSTDEP_H
-#define S390X_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/common-user/host/sparc64/hostdep.h b/common-user/host/sparc64/hostdep.h
deleted file mode 100644
index b18aca1deb..0000000000
--- a/common-user/host/sparc64/hostdep.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
diff --git a/common-user/host/x86_64/hostdep.h b/common-user/host/x86_64/hostdep.h
deleted file mode 100644
index 9c62bd26bd..0000000000
--- a/common-user/host/x86_64/hostdep.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef X86_64_HOSTDEP_H
-#define X86_64_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
-
-#endif
diff --git a/linux-user/host/ia64/hostdep.h b/linux-user/host/ia64/hostdep.h
deleted file mode 100644
index 263bf7658e..0000000000
--- a/linux-user/host/ia64/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef IA64_HOSTDEP_H
-#define IA64_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/mips/hostdep.h b/linux-user/host/mips/hostdep.h
deleted file mode 100644
index ba111d75c3..0000000000
--- a/linux-user/host/mips/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef MIPS_HOSTDEP_H
-#define MIPS_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/ppc/hostdep.h b/linux-user/host/ppc/hostdep.h
deleted file mode 100644
index 23d8bd9d47..0000000000
--- a/linux-user/host/ppc/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef PPC_HOSTDEP_H
-#define PPC_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/s390/hostdep.h b/linux-user/host/s390/hostdep.h
deleted file mode 100644
index afcba5a16a..0000000000
--- a/linux-user/host/s390/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef S390_HOSTDEP_H
-#define S390_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/sparc/hostdep.h b/linux-user/host/sparc/hostdep.h
deleted file mode 100644
index 391ad923cf..0000000000
--- a/linux-user/host/sparc/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC_HOSTDEP_H
-#define SPARC_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/sparc64/hostdep.h b/linux-user/host/sparc64/hostdep.h
deleted file mode 100644
index ce3968fca0..0000000000
--- a/linux-user/host/sparc64/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef SPARC64_HOSTDEP_H
-#define SPARC64_HOSTDEP_H
-
-#endif
diff --git a/linux-user/host/x32/hostdep.h b/linux-user/host/x32/hostdep.h
deleted file mode 100644
index 2c2d6d37da..0000000000
--- a/linux-user/host/x32/hostdep.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/*
- * hostdep.h : things which are dependent on the host architecture
- *
- *  * Written by Peter Maydell <peter.maydell@linaro.org>
- *
- * Copyright (C) 2016 Linaro Limited
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#ifndef X32_HOSTDEP_H
-#define X32_HOSTDEP_H
-
-#endif
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index ea0e8a8d24..0deb87e51a 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -124,7 +124,6 @@
  * need to check SA_RESTART flags in QEMU or distinguish the various
  * kinds of restartability.
  */
-#ifdef HAVE_SAFE_SYSCALL
 
 /* The core part of this function is implemented in assembly. */
 extern long safe_syscall_base(int *pending, int *errnop, long number, ...);
@@ -137,15 +136,4 @@ extern char safe_syscall_end[];
     safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
                       &errno, __VA_ARGS__)
 
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
 #endif
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index 661612a088..f71f372829 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -18,7 +18,6 @@
 #ifndef LINUX_USER_USER_INTERNALS_H
 #define LINUX_USER_USER_INTERNALS_H
 
-#include "hostdep.h"
 #include "exec/user/thunk.h"
 #include "exec/exec-all.h"
 #include "qemu/log.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 6d5e5b698c..ca8f24b9ec 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -798,7 +798,6 @@ int queue_signal(CPUArchState *env, int sig, int si_type,
 /* Adjust the signal context to rewind out of safe-syscall if we're in it */
 static inline void rewind_if_in_safe_syscall(void *puc)
 {
-#ifdef HAVE_SAFE_SYSCALL
     ucontext_t *uc = (ucontext_t *)puc;
     uintptr_t pcreg = host_signal_pc(uc);
 
@@ -806,7 +805,6 @@ static inline void rewind_if_in_safe_syscall(void *puc)
         && pcreg < (uintptr_t)safe_syscall_end) {
         host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
     }
-#endif
 }
 
 static void host_signal_handler(int host_sig, siginfo_t *info, void *puc)
diff --git a/linux-user/safe-syscall.S b/linux-user/safe-syscall.S
index 42ea7c40ba..7ddc997801 100644
--- a/linux-user/safe-syscall.S
+++ b/linux-user/safe-syscall.S
@@ -10,15 +10,12 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "hostdep.h"
 #include "target_errno_defs.h"
 
 /* We have the correct host directory on our include path
  * so that this will pull in the right fragment for the architecture.
  */
-#ifdef HAVE_SAFE_SYSCALL
 #include "safe-syscall.inc.S"
-#endif
 
 /* We must specifically say that we're happy for the stack to not be
  * executable, otherwise the toolchain will default to assuming our
-- 
2.25.1


