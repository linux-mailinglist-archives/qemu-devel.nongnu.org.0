Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E4454A95
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:09:49 +0100 (CET)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNVN-0000RG-0Y
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:09:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQG-0000Hi-Mt
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:32 -0500
Received: from [2a00:1450:4864:20::432] (port=44696
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQE-000336-Bo
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:32 -0500
Received: by mail-wr1-x432.google.com with SMTP id n29so5629033wra.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AZfgAKkswGw5hwWFtxK4S1taRtK+cQrzozvut2eah7Q=;
 b=ikKi5emqQM8kDm7Q92iixQwd/jEnJnVRPF7Ef6OPhCP+MaYhbYVCfu2k4EyDrTN4sd
 Dhdwe1JHIb5QDOeM7eps0DhyEVQmmTMNNk/pMuBAoKrbaWgqU0+cLiImQp+QL9ZbfHIM
 bT0xbBFUnYjCZjXt4jJ0p7RCLa1caPPaCdSbUncQbvnYl7wyrrZTsWpc4KTSm3NeX4ZR
 +n81Ygus3T8UepvYJjRXPKsA6Vs1LxvqJi2i6wTqk9r02a+l17j8iYNbzptS2IqAgP1B
 Fh2BRDBnlThDeluW49TaIa0Y5wovUIO37jdAhrRayWuXxWsBC5pzuudjqoIIHiLb2lzv
 HnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AZfgAKkswGw5hwWFtxK4S1taRtK+cQrzozvut2eah7Q=;
 b=6QevYfM2R1sl90CDQI37dpICHAAhN3eYbPM060tsACtRq9hGG8Q3PmDZEtCIbbtSLM
 dHNnpGuMrFYJ0hFWjO0JYJHJSlKSn0XJLyNMhzTxYYqrEu/wuawbkofln+dNiYvcjdJg
 LsWOxaDCM7/+PH2f9OEXIRbzwfuULFu3Nq20e03+pf912HenPGqrQtFBPSWgr3Zv6qTs
 3lvrdQ/hX0S6oCx6y+rJMpjkmY3ytlTfSmXg2YvtdiPCimap7XQFEy/7DmKP/tGazxrB
 HmV9bfSotP13c4uGjMkQYtjVG7rcG/0A3ezbKqAdfuIqjbv6uOXWaE4S2y4tIOrI+x50
 UxBg==
X-Gm-Message-State: AOAM532eAT959lWb4wf+WsxLXcscVRz8Lpa7TT8l03SBOkTxIyCC0Fcu
 pffVdEA2mGsGQY8GxU2YV4AMOPmdmwDAlve4SE0=
X-Google-Smtp-Source: ABdhPJxrpdso0HpHYIH7VGC2bsw0PWD3fWSEH9JzsdqwHF1cjsyGeiz9yeR5169+8Fi+zuYkCnC2yg==
X-Received: by 2002:adf:e747:: with SMTP id c7mr21874322wrn.38.1637165068845; 
 Wed, 17 Nov 2021 08:04:28 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/17] linux-user: Remove HAVE_SAFE_SYSCALL and hostdep.h
Date: Wed, 17 Nov 2021 17:04:02 +0100
Message-Id: <20211117160412.71563-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All supported hosts now define HAVE_SAFE_SYSCALL, so remove
the ifdefs.  This leaves hostdep.h empty, so remove it.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


