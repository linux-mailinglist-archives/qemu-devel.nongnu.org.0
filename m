Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2780547B46D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 21:37:10 +0100 (CET)
Received: from localhost ([::1]:36088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzPP9-0004Lk-Pt
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:37:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDi-0001he-Aw
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:18 -0500
Received: from [2607:f8b0:4864:20::42a] (port=38485
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzPDe-000700-DX
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:25:16 -0500
Received: by mail-pf1-x42a.google.com with SMTP id b22so4940891pfb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxRUdWmNOzFbW06/oXjlpc/Ha36TYqwiBWfJ/9yrr1M=;
 b=xJiwb3W2a0J0zV2ty+7j8Ja8XIaqhrte8haNAs2urr1Lf9LleRMc8Xjw+f6h/SbgTq
 GL6px9OefaARi8aVxwcnX5bo2ZDCRGeeuO2U9QtWURQf0vU7m7T5USqW5Wumi8dmZzmc
 iDTzFSjosQpGAh/iSzpFTyakXGodabxRrASnofH6pzdwOqiWfRQWYZau5GbP0AmIMuFB
 J7gfwMpyW4olK6ViBlEe+41UdKc5nVHhQ/exYZxdgUSsWhGEkHwQW/2aIuFrB47KUQUb
 l44CrEvUOeJ2AegcVEA6szGPCAJ1T33Tu10J/mmeALLxicdf+S5uYEr8N1Rew5QD2qGd
 qJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxRUdWmNOzFbW06/oXjlpc/Ha36TYqwiBWfJ/9yrr1M=;
 b=67niUufNuGlXZiYfOr5DiVGIUGus+r1EN8GLwxHekeczgcW50wnsWdURk4caUdT7xJ
 JnkiuXZBqfhcA9fyE7QZjsAvN7JZA7qDfgZkxuCyUk6UjevC1V99Zn2wt+Wlaae//itw
 ivUNpyfpEzpfa79Ze+ESg3/7Njnj/vybF5oI6ICPzJ2XU92MM5DOv3BMJlO4PmzTtFi9
 VVu96bQWmj88nqOd/AdYmp5Z1yImumIIOENxo6vJkHBJbx/InfJGpDQGV3R4RChUnw0C
 iahH/tnRy9uPZ1lP8HhQBHc4WXfYnF5SZTr/vXXM4cDnQ4qh6pl0jbmX2CmAZhLeE1Fr
 ru2A==
X-Gm-Message-State: AOAM5334Q6IjcSaO9StuKJm0ET2Cbozovhiblgg764cao3Ai8HRBiw8z
 7POeYG84Rq1wT9Rd5gUfyTLHtRAqbseMrg==
X-Google-Smtp-Source: ABdhPJyu7qNru0HygBJKCmDYX5Gpebfme5mJ9uw94DmQQmA7YOXf7wm15oCuKMT71TzKp4BN/T9I5g==
X-Received: by 2002:aa7:9114:0:b0:4b0:7c1:cf97 with SMTP id
 20-20020aa79114000000b004b007c1cf97mr18085380pfh.50.1640031906852; 
 Mon, 20 Dec 2021 12:25:06 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id q19sm233118pjd.21.2021.12.20.12.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:25:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
Date: Mon, 20 Dec 2021 12:24:50 -0800
Message-Id: <20211220202500.111897-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220202500.111897-1-richard.henderson@linaro.org>
References: <20211220202500.111897-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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

All supported hosts now define HAVE_SAFE_SYSCALL, so remove
the ifdefs.  This leaves hostdep.h empty, so remove it.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/host/aarch64/hostdep.h | 18 ------------------
 linux-user/host/arm/hostdep.h     | 18 ------------------
 linux-user/host/i386/hostdep.h    | 18 ------------------
 linux-user/host/ia64/hostdep.h    | 15 ---------------
 linux-user/host/mips/hostdep.h    | 18 ------------------
 linux-user/host/ppc/hostdep.h     | 15 ---------------
 linux-user/host/ppc64/hostdep.h   | 18 ------------------
 linux-user/host/riscv/hostdep.h   | 14 --------------
 linux-user/host/s390/hostdep.h    | 15 ---------------
 linux-user/host/s390x/hostdep.h   | 18 ------------------
 linux-user/host/sparc/hostdep.h   | 15 ---------------
 linux-user/host/sparc64/hostdep.h | 18 ------------------
 linux-user/host/x32/hostdep.h     | 15 ---------------
 linux-user/host/x86_64/hostdep.h  | 18 ------------------
 linux-user/safe-syscall.h         | 13 +------------
 linux-user/user-internals.h       |  1 -
 linux-user/safe-syscall-error.c   |  3 ---
 linux-user/signal.c               |  2 --
 linux-user/safe-syscall.S         |  3 ---
 19 files changed, 1 insertion(+), 254 deletions(-)
 delete mode 100644 linux-user/host/aarch64/hostdep.h
 delete mode 100644 linux-user/host/arm/hostdep.h
 delete mode 100644 linux-user/host/i386/hostdep.h
 delete mode 100644 linux-user/host/ia64/hostdep.h
 delete mode 100644 linux-user/host/mips/hostdep.h
 delete mode 100644 linux-user/host/ppc/hostdep.h
 delete mode 100644 linux-user/host/ppc64/hostdep.h
 delete mode 100644 linux-user/host/riscv/hostdep.h
 delete mode 100644 linux-user/host/s390/hostdep.h
 delete mode 100644 linux-user/host/s390x/hostdep.h
 delete mode 100644 linux-user/host/sparc/hostdep.h
 delete mode 100644 linux-user/host/sparc64/hostdep.h
 delete mode 100644 linux-user/host/x32/hostdep.h
 delete mode 100644 linux-user/host/x86_64/hostdep.h

diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
deleted file mode 100644
index 39299d798a..0000000000
--- a/linux-user/host/aarch64/hostdep.h
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
diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.h
deleted file mode 100644
index 86b137875a..0000000000
--- a/linux-user/host/arm/hostdep.h
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
diff --git a/linux-user/host/i386/hostdep.h b/linux-user/host/i386/hostdep.h
deleted file mode 100644
index ce7136501f..0000000000
--- a/linux-user/host/i386/hostdep.h
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
index d9e90a096b..0000000000
--- a/linux-user/host/mips/hostdep.h
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
-#ifndef MIPS_HOSTDEP_H
-#define MIPS_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
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
diff --git a/linux-user/host/ppc64/hostdep.h b/linux-user/host/ppc64/hostdep.h
deleted file mode 100644
index 0c290dd904..0000000000
--- a/linux-user/host/ppc64/hostdep.h
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
diff --git a/linux-user/host/riscv/hostdep.h b/linux-user/host/riscv/hostdep.h
deleted file mode 100644
index 7f67c22868..0000000000
--- a/linux-user/host/riscv/hostdep.h
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
diff --git a/linux-user/host/s390x/hostdep.h b/linux-user/host/s390x/hostdep.h
deleted file mode 100644
index d801145854..0000000000
--- a/linux-user/host/s390x/hostdep.h
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
index d832868cb1..0000000000
--- a/linux-user/host/sparc64/hostdep.h
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
-#ifndef SPARC64_HOSTDEP_H
-#define SPARC64_HOSTDEP_H
-
-/* We have a safe-syscall.inc.S */
-#define HAVE_SAFE_SYSCALL
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
diff --git a/linux-user/host/x86_64/hostdep.h b/linux-user/host/x86_64/hostdep.h
deleted file mode 100644
index 9c62bd26bd..0000000000
--- a/linux-user/host/x86_64/hostdep.h
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
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
index 97837faddb..f43267a8fc 100644
--- a/linux-user/safe-syscall.h
+++ b/linux-user/safe-syscall.h
@@ -124,7 +124,7 @@
  * need to check SA_RESTART flags in QEMU or distinguish the various
  * kinds of restartability.
  */
-#ifdef HAVE_SAFE_SYSCALL
+
 /* The core part of this function is implemented in assembly */
 extern long safe_syscall_base(int *pending, long number, ...);
 extern long safe_syscall_set_errno_tail(int value);
@@ -137,15 +137,4 @@ extern char safe_syscall_end[];
     safe_syscall_base(&((TaskState *)thread_cpu->opaque)->signal_pending, \
                       __VA_ARGS__)
 
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
diff --git a/linux-user/safe-syscall-error.c b/linux-user/safe-syscall-error.c
index d7e2700f81..55d95ac39a 100644
--- a/linux-user/safe-syscall-error.c
+++ b/linux-user/safe-syscall-error.c
@@ -10,10 +10,8 @@
  */
 
 #include "qemu/osdep.h"
-#include "hostdep.h"
 #include "safe-syscall.h"
 
-#ifdef HAVE_SAFE_SYSCALL
 /*
  * This is intended to be invoked via tail-call on the error path
  * from the assembly in host/arch/safe-syscall.inc.S.  This takes
@@ -25,4 +23,3 @@ long safe_syscall_set_errno_tail(int value)
     errno = value;
     return -1;
 }
-#endif
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


