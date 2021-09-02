Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C33FF82F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:59:40 +0200 (CEST)
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwcN-0001uB-Kh
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRN-00077R-6D
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:18 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:33761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRH-00035Y-Mv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:16 -0400
Received: by mail-il1-x12a.google.com with SMTP id z2so3602893iln.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2p/e1htj00qkiwcmr48C3gV7/8UQNz8zbvcvP452XY=;
 b=TU/2pewGnZz+hLCwdxyATfrgBKcx/VyWDD0NbxRAg0r3pSjIoPLyz2aI7zn32EK8Ev
 K8kAQ9JxXtUMl30WNQ7PRcY/B/VHzAmrccZqNBxxLnP1o/wp29RivqgT4awyWHJc51RH
 q+98Dig2JV7p5xbCMdzyuFMaX/Yq/DErPeohP2txhVZDYU8tOK9gqGtP+XCJqQ7srOBM
 asVsBpVj71inIKKrXJO+UNDofwQ5UfXz0eZBn1LlrnTkFlJgtvJoAlvueRiWkKILuSh3
 toa1EL4DwGX52i09w/5XO8QLX2yUm1PYf4kspxHN1AnUZtPNXtsbcgKa89MbShuCS6xc
 GGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2p/e1htj00qkiwcmr48C3gV7/8UQNz8zbvcvP452XY=;
 b=a8PG8Z7V1V2OLeF8AeX5DyVeP2E1mAHzVFrn9i3zPjcBvIyFCOidLX63iQQe7fiAOf
 ZlnN1NvMDROiWMamzAw/G3s5Gx8BQG+fNwQPktwhPE3GWt858SBX18vrS1PoN+/yhUHF
 I39SSLZziZGg3O/ky+IJwPVJXCcJwnZhGKipYB3OcHpOL/lriExZcMeHKmIWLusbB+XY
 VSJFijKArZR5gZfrBl3nq9hErHve6kdQx6cKFAPjX83fR+KsrVCQmuN4QBW0ueNoH7aq
 pXE8yfZQ3h3Bg7+5F2PSHmERCuwaRwglpuVflN3cnjx5cjEpp9xaWEvTg/FKX5hMPu85
 6wbA==
X-Gm-Message-State: AOAM5306E6nGAPIuXfTzPPijLvihPoP3xw36oH+HSzFBmFBGeUKilozu
 mqXh2jjZoXQ68DqJ8CnyCVn71cuaGeBGQw==
X-Google-Smtp-Source: ABdhPJw649MozY507cFFOYcU/0ur/xEOx6KjENUZ1lE3aoIkG3mIduMafx0nQ2RwifoZ8GpodLdcPA==
X-Received: by 2002:a05:6e02:1aa5:: with SMTP id
 l5mr472045ilv.271.1630626488941; 
 Thu, 02 Sep 2021 16:48:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:08 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/43] bsd-user: *BSD specific siginfo defintions
Date: Thu,  2 Sep 2021 17:47:12 -0600
Message-Id: <20210902234729.76141-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add FreeBSD, NetBSD and OpenBSD values for the various signal info types
and defines to decode different signals to discover more information
about the specific signal types.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_siginfo.h | 145 +++++++++++++++++++++++++++
 bsd-user/freebsd/target_os_signal.h  |  78 ++++++++++++++
 bsd-user/i386/target_arch_signal.h   |  94 +++++++++++++++++
 bsd-user/netbsd/target_os_siginfo.h  |  82 +++++++++++++++
 bsd-user/netbsd/target_os_signal.h   |  69 +++++++++++++
 bsd-user/openbsd/target_os_siginfo.h |  82 +++++++++++++++
 bsd-user/openbsd/target_os_signal.h  |  69 +++++++++++++
 bsd-user/qemu.h                      |   1 +
 bsd-user/syscall_defs.h              |  10 --
 bsd-user/x86_64/target_arch_signal.h |  94 +++++++++++++++++
 10 files changed, 714 insertions(+), 10 deletions(-)
 create mode 100644 bsd-user/freebsd/target_os_siginfo.h
 create mode 100644 bsd-user/freebsd/target_os_signal.h
 create mode 100644 bsd-user/i386/target_arch_signal.h
 create mode 100644 bsd-user/netbsd/target_os_siginfo.h
 create mode 100644 bsd-user/netbsd/target_os_signal.h
 create mode 100644 bsd-user/openbsd/target_os_siginfo.h
 create mode 100644 bsd-user/openbsd/target_os_signal.h
 create mode 100644 bsd-user/x86_64/target_arch_signal.h

diff --git a/bsd-user/freebsd/target_os_siginfo.h b/bsd-user/freebsd/target_os_siginfo.h
new file mode 100644
index 0000000000..84944faa4d
--- /dev/null
+++ b/bsd-user/freebsd/target_os_siginfo.h
@@ -0,0 +1,145 @@
+/*
+ *  FreeBSD siginfo related definitions
+ *
+ *  Copyright (c) 2013 Stacey D. Son
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
+#ifndef _TARGET_OS_SIGINFO_H_
+#define _TARGET_OS_SIGINFO_H_
+
+#define TARGET_NSIG         128
+#define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
+#define TARGET_NSIG_WORDS   (TARGET_NSIG / TARGET_NSIG_BPW)
+
+/* this struct defines a stack used during syscall handling */
+typedef struct target_sigaltstack {
+    abi_long    ss_sp;
+    abi_ulong   ss_size;
+    abi_long    ss_flags;
+} target_stack_t;
+
+typedef struct {
+    uint32_t __bits[TARGET_NSIG_WORDS];
+} target_sigset_t;
+
+struct target_sigaction {
+    abi_ulong   _sa_handler;
+    int32_t     sa_flags;
+    target_sigset_t sa_mask;
+};
+
+typedef union target_sigval {
+    int32_t sival_int;
+    abi_ulong sival_ptr;
+    int32_t sigval_int;
+    abi_ulong sigval_ptr;
+} target_sigval_t;
+
+typedef struct target_siginfo {
+    int32_t si_signo;   /* signal number */
+    int32_t si_errno;   /* errno association */
+    int32_t si_code;    /* signal code */
+    int32_t si_pid;     /* sending process */
+    int32_t si_uid;     /* sender's ruid */
+    int32_t si_status;  /* exit value */
+    abi_ulong si_addr;  /* faulting instruction */
+    union target_sigval si_value;   /* signal value */
+    union {
+        struct {
+            int32_t _trapno;    /* machine specific trap code */
+        } _fault;
+
+        /* POSIX.1b timers */
+        struct {
+            int32_t _timerid;
+            int32_t _overrun;
+        } _timer;
+
+        struct {
+            int32_t _mqd;
+        } _mesgp;
+
+        /* SIGPOLL */
+        struct {
+            int _band;  /* POLL_IN, POLL_OUT, POLL_MSG */
+        } _poll;
+
+        struct {
+            abi_long __spare1__;
+            int32_t  __spare2_[7];
+        } __spare__;
+    } _reason;
+} target_siginfo_t;
+
+struct target_sigevent {
+    abi_int sigev_notify;
+    abi_int sigev_signo;
+    target_sigval_t sigev_value;
+    union {
+        abi_int _threadid;
+
+        /*
+         * The kernel (and thus QEMU) never looks at these;
+         * they're only used as part of the ABI between a
+         * userspace program and libc.
+         */
+        struct {
+            abi_ulong _function;
+            abi_ulong _attribute;
+        } _sigev_thread;
+        abi_ushort _kevent_flags;
+        abi_long _pad[8];
+    } _sigev_un;
+};
+
+#define target_si_signo     si_signo
+#define target_si_code      si_code
+#define target_si_errno     si_errno
+#define target_si_addr      si_addr
+
+/* SIGILL si_codes */
+#define TARGET_ILL_ILLOPC   (1) /* Illegal opcode. */
+#define TARGET_ILL_ILLOPN   (2) /* Illegal operand. */
+#define TARGET_ILL_ILLADR   (3) /* Illegal addressing mode. */
+#define TARGET_ILL_ILLTRP   (4) /* Illegal trap. */
+#define TARGET_ILL_PRVOPC   (5) /* Privileged opcode. */
+#define TARGET_ILL_PRVREG   (6) /* Privileged register. */
+#define TARGET_ILL_COPROC   (7) /* Coprocessor error. */
+#define TARGET_ILL_BADSTK   (8) /* Internal stack error. */
+
+/* SIGSEGV si_codes */
+#define TARGET_SEGV_MAPERR  (1) /* address not mapped to object */
+#define TARGET_SEGV_ACCERR  (2) /* invalid permissions for mapped object */
+
+/* SIGTRAP si_codes */
+#define TARGET_TRAP_BRKPT   (1) /* process beakpoint */
+#define TARGET_TRAP_TRACE   (2) /* process trace trap */
+
+/* SIGBUS si_codes */
+#define TARGET_BUS_ADRALN   (1)
+#define TARGET_BUS_ADRERR   (2)
+#define TARGET_BUS_OBJERR   (3)
+
+/* SIGFPE codes */
+#define TARGET_FPE_INTOVF   (1) /* Integer overflow. */
+#define TARGET_FPE_INTDIV   (2) /* Integer divide by zero. */
+#define TARGET_FPE_FLTDIV   (3) /* Floating point divide by zero. */
+#define TARGET_FPE_FLTOVF   (4) /* Floating point overflow. */
+#define TARGET_FPE_FLTUND   (5) /* Floating point underflow. */
+#define TARGET_FPE_FLTRES   (6) /* Floating point inexact result. */
+#define TARGET_FPE_FLTINV   (7) /* Invalid floating point operation. */
+#define TARGET_FPE_FLTSUB   (8) /* Subscript out of range. */
+
+#endif /* !_TARGET_OS_SIGINFO_H_ */
diff --git a/bsd-user/freebsd/target_os_signal.h b/bsd-user/freebsd/target_os_signal.h
new file mode 100644
index 0000000000..3ed454e086
--- /dev/null
+++ b/bsd-user/freebsd/target_os_signal.h
@@ -0,0 +1,78 @@
+#ifndef _TARGET_OS_SIGNAL_H_
+#define _TARGET_OS_SIGNAL_H_
+
+#include "target_os_siginfo.h"
+#include "target_arch_signal.h"
+
+/* Compare to sys/signal.h */
+#define TARGET_SIGHUP  1       /* hangup */
+#define TARGET_SIGINT  2       /* interrupt */
+#define TARGET_SIGQUIT 3       /* quit */
+#define TARGET_SIGILL  4       /* illegal instruction (not reset when caught) */
+#define TARGET_SIGTRAP 5       /* trace trap (not reset when caught) */
+#define TARGET_SIGABRT 6       /* abort() */
+#define TARGET_SIGIOT  SIGABRT /* compatibility */
+#define TARGET_SIGEMT  7       /* EMT instruction */
+#define TARGET_SIGFPE  8       /* floating point exception */
+#define TARGET_SIGKILL 9       /* kill (cannot be caught or ignored) */
+#define TARGET_SIGBUS  10      /* bus error */
+#define TARGET_SIGSEGV 11      /* segmentation violation */
+#define TARGET_SIGSYS  12      /* bad argument to system call */
+#define TARGET_SIGPIPE 13      /* write on a pipe with no one to read it */
+#define TARGET_SIGALRM 14      /* alarm clock */
+#define TARGET_SIGTERM 15      /* software termination signal from kill */
+#define TARGET_SIGURG  16      /* urgent condition on IO channel */
+#define TARGET_SIGSTOP 17      /* sendable stop signal not from tty */
+#define TARGET_SIGTSTP 18      /* stop signal from tty */
+#define TARGET_SIGCONT 19      /* continue a stopped process */
+#define TARGET_SIGCHLD 20      /* to parent on child stop or exit */
+#define TARGET_SIGTTIN 21      /* to readers pgrp upon background tty read */
+#define TARGET_SIGTTOU 22      /* like TTIN for output if(tp->t_local&LTOSTOP)*/
+#define TARGET_SIGIO   23      /* input/output possible signal */
+#define TARGET_SIGXCPU 24      /* exceeded CPU time limit */
+#define TARGET_SIGXFSZ 25      /* exceeded file size limit */
+#define TARGET_SIGVTALRM 26    /* virtual time alarm */
+#define TARGET_SIGPROF 27      /* profiling time alarm */
+#define TARGET_SIGWINCH 28     /* window size changes */
+#define TARGET_SIGINFO  29     /* information request */
+#define TARGET_SIGUSR1 30      /* user defined signal 1 */
+#define TARGET_SIGUSR2 31      /* user defined signal 2 */
+#define TARGET_SIGTHR 32       /* reserved by thread library */
+#define TARGET_SIGLWP SIGTHR   /* compatibility */
+#define TARGET_SIGLIBRT 33     /* reserved by the real-time library */
+#define TARGET_SIGRTMIN 65
+#define TARGET_SIGRTMAX 126
+
+/*
+ * Language spec says we must list exactly one parameter, even though we
+ * actually supply three.  Ugh!
+ */
+#define TARGET_SIG_DFL      ((abi_long)0)   /* default signal handling */
+#define TARGET_SIG_IGN      ((abi_long)1)   /* ignore signal */
+#define TARGET_SIG_ERR      ((abi_long)-1)  /* error return from signal */
+
+#define TARGET_SA_ONSTACK   0x0001  /* take signal on signal stack */
+#define TARGET_SA_RESTART   0x0002  /* restart system on signal return */
+#define TARGET_SA_RESETHAND 0x0004  /* reset to SIG_DFL when taking signal */
+#define TARGET_SA_NODEFER   0x0010  /* don't mask the signal we're delivering */
+#define TARGET_SA_NOCLDWAIT 0x0020  /* don't create zombies (assign to pid 1) */
+#define TARGET_SA_USERTRAMP 0x0100  /* do not bounce off kernel's sigtramp */
+#define TARGET_SA_NOCLDSTOP 0x0008  /* do not generate SIGCHLD on child stop */
+#define TARGET_SA_SIGINFO   0x0040  /* generate siginfo_t */
+
+/*
+ * Flags for sigprocmask:
+ */
+#define TARGET_SIG_BLOCK        1   /* block specified signal set */
+#define TARGET_SIG_UNBLOCK      2   /* unblock specified signal set */
+#define TARGET_SIG_SETMASK      3   /* set specified signal set */
+
+#define TARGET_BADSIG           SIG_ERR
+
+/*
+ * sigaltstack control
+ */
+#define TARGET_SS_ONSTACK 0x0001  /* take signals on alternate stack */
+#define TARGET_SS_DISABLE 0x0004  /* disable taking signals on alternate stack*/
+
+#endif /* !_TARGET_OS_SIGNAL_H_ */
diff --git a/bsd-user/i386/target_arch_signal.h b/bsd-user/i386/target_arch_signal.h
new file mode 100644
index 0000000000..9812c6b034
--- /dev/null
+++ b/bsd-user/i386/target_arch_signal.h
@@ -0,0 +1,94 @@
+/*
+ *  i386 dependent signal definitions
+ *
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
+#ifndef TARGET_ARCH_SIGNAL_H
+#define TARGET_ARCH_SIGNAL_H
+
+#include "cpu.h"
+
+/* Size of the signal trampolin code placed on the stack. */
+#define TARGET_SZSIGCODE    0
+
+/* compare to  x86/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
+#define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
+
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
+struct target_sigcontext {
+    /* to be added */
+};
+
+typedef struct target_mcontext {
+} target_mcontext_t;
+
+typedef struct target_ucontext {
+    target_sigset_t   uc_sigmask;
+    target_mcontext_t uc_mcontext;
+    abi_ulong         uc_link;
+    target_stack_t    uc_stack;
+    int32_t           uc_flags;
+    int32_t         __spare__[4];
+} target_ucontext_t;
+
+struct target_sigframe {
+    abi_ulong   sf_signum;
+    abi_ulong   sf_siginfo;    /* code or pointer to sf_si */
+    abi_ulong   sf_ucontext;   /* points to sf_uc */
+    abi_ulong   sf_addr;       /* undocumented 4th arg */
+    target_ucontext_t   sf_uc; /* = *sf_uncontext */
+    target_siginfo_t    sf_si; /* = *sf_siginfo (SA_SIGINFO case)*/
+    uint32_t    __spare__[2];
+};
+
+/*
+ * Compare to i386/i386/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+static inline abi_long set_sigtramp_args(CPUX86State *regs,
+        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
+        struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to i386/i386/machdep.c get_mcontext() */
+static inline abi_long get_mcontext(CPUX86State *regs,
+        target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to i386/i386/machdep.c set_mcontext() */
+static inline abi_long set_mcontext(CPUX86State *regs,
+        target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
+                        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
+
+#endif /* TARGET_ARCH_SIGNAL_H */
diff --git a/bsd-user/netbsd/target_os_siginfo.h b/bsd-user/netbsd/target_os_siginfo.h
new file mode 100644
index 0000000000..667c19cc7c
--- /dev/null
+++ b/bsd-user/netbsd/target_os_siginfo.h
@@ -0,0 +1,82 @@
+#ifndef _TARGET_OS_SIGINFO_H_
+#define _TARGET_OS_SIGINFO_H_
+
+#define TARGET_NSIG     32  /* counting 0; could be 33 (mask is 1-32) */
+#define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
+#define TARGET_NSIG_WORDS   (TARGET_NSIG / TARGET_NSIG_BPW)
+
+/* this struct defines a stack used during syscall handling */
+typedef struct target_sigaltstack {
+    abi_long    ss_sp;
+    abi_ulong   ss_size;
+    abi_long    ss_flags;
+} target_stack_t;
+
+typedef struct {
+    uint32_t __bits[TARGET_NSIG_WORDS];
+} target_sigset_t
+
+struct target_sigaction {
+    abi_ulong   _sa_handler;
+    int32_t     sa_flags;
+    target_sigset_t sa_mask;
+};
+
+/* Compare to sys/siginfo.h */
+typedef union target_sigval {
+    int         sival_int;
+    abi_ulong   sival_ptr;
+} target_sigval_t;
+
+struct target_ksiginfo {
+    int32_t     _signo;
+    int32_t     _code;
+    int32_t     _errno;
+#if TARGET_ABI_BITS == 64
+    int32_t     _pad;
+#endif
+    union {
+        struct {
+            int32_t             _pid;
+            int32_t             _uid;
+            target_sigval_t    _value;
+        } _rt;
+
+        struct {
+            int32_t             _pid;
+            int32_t             _uid;
+            int32_t             _struct;
+            /* clock_t          _utime; */
+            /* clock_t          _stime; */
+        } _child;
+
+        struct {
+            abi_ulong           _addr;
+            int32_t             _trap;
+        } _fault;
+
+        struct {
+            long                _band;
+            int                 _fd;
+        } _poll;
+    } _reason;
+};
+
+typedef union target_siginfo {
+    int8_t     si_pad[128];
+    struct     target_ksiginfo  _info;
+} target_siginfo_t;
+
+#define target_si_signo     _info._signo
+#define target_si_code      _info._code
+#define target_si_errno     _info._errno
+#define target_si_addr      _info._reason._fault._addr
+
+#define TARGET_SEGV_MAPERR  1
+#define TARGET_SEGV_ACCERR  2
+
+#define TARGET_TRAP_BRKPT   1
+#define TARGET_TRAP_TRACE   2
+
+
+#endif /* ! _TARGET_OS_SIGINFO_H_ */
diff --git a/bsd-user/netbsd/target_os_signal.h b/bsd-user/netbsd/target_os_signal.h
new file mode 100644
index 0000000000..a373922f7e
--- /dev/null
+++ b/bsd-user/netbsd/target_os_signal.h
@@ -0,0 +1,69 @@
+#ifndef _TARGET_OS_SIGNAL_H_
+#define _TARGET_OS_SIGNAL_H_
+
+#include "target_os_siginfo.h"
+#include "target_arch_signal.h"
+
+#define TARGET_SIGHUP  1       /* hangup */
+#define TARGET_SIGINT  2       /* interrupt */
+#define TARGET_SIGQUIT 3       /* quit */
+#define TARGET_SIGILL  4       /* illegal instruction (not reset when caught) */
+#define TARGET_SIGTRAP 5       /* trace trap (not reset when caught) */
+#define TARGET_SIGABRT 6       /* abort() */
+#define TARGET_SIGIOT  SIGABRT /* compatibility */
+#define TARGET_SIGEMT  7       /* EMT instruction */
+#define TARGET_SIGFPE  8       /* floating point exception */
+#define TARGET_SIGKILL 9       /* kill (cannot be caught or ignored) */
+#define TARGET_SIGBUS  10      /* bus error */
+#define TARGET_SIGSEGV 11      /* segmentation violation */
+#define TARGET_SIGSYS  12      /* bad argument to system call */
+#define TARGET_SIGPIPE 13      /* write on a pipe with no one to read it */
+#define TARGET_SIGALRM 14      /* alarm clock */
+#define TARGET_SIGTERM 15      /* software termination signal from kill */
+#define TARGET_SIGURG  16      /* urgent condition on IO channel */
+#define TARGET_SIGSTOP 17      /* sendable stop signal not from tty */
+#define TARGET_SIGTSTP 18      /* stop signal from tty */
+#define TARGET_SIGCONT 19      /* continue a stopped process */
+#define TARGET_SIGCHLD 20      /* to parent on child stop or exit */
+#define TARGET_SIGTTIN 21      /* to readers pgrp upon background tty read */
+#define TARGET_SIGTTOU 22      /* like TTIN for out if (tp->t_local&LTOSTOP) */
+#define TARGET_SIGIO   23      /* input/output possible signal */
+#define TARGET_SIGXCPU 24      /* exceeded CPU time limit */
+#define TARGET_SIGXFSZ 25      /* exceeded file size limit */
+#define TARGET_SIGVTALRM 26    /* virtual time alarm */
+#define TARGET_SIGPROF   27    /* profiling time alarm */
+#define TARGET_SIGWINCH  28    /* window size changes */
+#define TARGET_SIGINFO   29    /* information request */
+#define TARGET_SIGUSR1   30    /* user defined signal 1 */
+#define TARGET_SIGUSR2   31    /* user defined signal 2 */
+
+/*
+ * Language spec says we must list exactly one parameter, even though we
+ * actually supply three.  Ugh!
+ */
+#define TARGET_SIG_DFL         ((void (*)(int))0)
+#define TARGET_SIG_IGN         ((void (*)(int))1)
+#define TARGET_SIG_ERR         ((void (*)(int))-1)
+
+#define TARGET_SA_ONSTACK   0x0001  /* take signal on signal stack */
+#define TARGET_SA_RESTART   0x0002  /* restart system on signal return */
+#define TARGET_SA_RESETHAND 0x0004  /* reset to SIG_DFL when taking signal */
+#define TARGET_SA_NODEFER   0x0010  /* don't mask the signal we're delivering */
+#define TARGET_SA_NOCLDWAIT 0x0020  /* don't create zombies (assign to pid 1) */
+#define TARGET_SA_USERTRAMP 0x0100  /* do not bounce off kernel's sigtramp */
+#define TARGET_SA_NOCLDSTOP 0x0008  /* do not generate SIGCHLD on child stop */
+#define TARGET_SA_SIGINFO   0x0040  /* generate siginfo_t */
+
+/*
+ * Flags for sigprocmask:
+ */
+#define TARGET_SIG_BLOCK       1       /* block specified signal set */
+#define TARGET_SIG_UNBLOCK     2       /* unblock specified signal set */
+#define TARGET_SIG_SETMASK     3       /* set specified signal set */
+
+#define TARGET_BADSIG       SIG_ERR
+
+#define TARGET_SS_ONSTACK 0x0001 /* take signals on alternate stack */
+#define TARGET_SS_DISABLE 0x0004 /* disable taking signals on alternate stack */
+
+#endif /* !_TARGET_OS_SIGNAL_H_ */
diff --git a/bsd-user/openbsd/target_os_siginfo.h b/bsd-user/openbsd/target_os_siginfo.h
new file mode 100644
index 0000000000..baf646a5ab
--- /dev/null
+++ b/bsd-user/openbsd/target_os_siginfo.h
@@ -0,0 +1,82 @@
+#ifndef _TARGET_OS_SIGINFO_H_
+#define _TARGET_OS_SIGINFO_H_
+
+#define TARGET_NSIG     32   /* counting 0; could be 33 (mask is 1-32) */
+#define TARGET_NSIG_BPW     (sizeof(uint32_t) * 8)
+#define TARGET_NSIG_WORDS   (TARGET_NSIG / TARGET_NSIG_BPW)
+
+/* this struct defines a stack used during syscall handling */
+typedef struct target_sigaltstack {
+    abi_long    ss_sp;
+    abi_ulong   ss_size;
+    abi_long    ss_flags;
+} target_stack_t;
+
+typedef struct {
+    uint32_t __bits[TARGET_NSIG_WORDS];
+} target_sigset_t
+
+struct target_sigaction {
+    abi_ulong   _sa_handler;
+    int32_t     sa_flags;
+    target_sigset_t sa_mask;
+};
+
+/* Compare to sys/siginfo.h */
+typedef union target_sigval {
+    int         sival_int;
+    abi_ulong   sival_ptr;
+} target_sigval_t;
+
+struct target_ksiginfo {
+    int32_t     _signo;
+    int32_t     _code;
+    int32_t     _errno;
+#if TARGET_ABI_BITS == 64
+    int32_t     _pad;
+#endif
+    union {
+        struct {
+            int32_t             _pid;
+            int32_t             _uid;
+            target_sigval_t    _value;
+        } _rt;
+
+        struct {
+            int32_t             _pid;
+            int32_t             _uid;
+            int32_t             _struct;
+            /* clock_t          _utime; */
+            /* clock_t          _stime; */
+        } _child;
+
+        struct {
+            abi_ulong           _addr;
+            int32_t             _trap;
+        } _fault;
+
+        struct {
+            long                _band;
+            int                 _fd;
+        } _poll;
+    } _reason;
+};
+
+typedef union target_siginfo {
+    int8_t     si_pad[128];
+    struct     target_ksiginfo  _info;
+} target_siginfo_t;
+
+#define target_si_signo     _info._signo
+#define target_si_code      _info._code
+#define target_si_errno     _info._errno
+#define target_si_addr      _info._reason._fault._addr
+
+#define TARGET_SEGV_MAPERR  1
+#define TARGET_SEGV_ACCERR  2
+
+#define TARGET_TRAP_BRKPT   1
+#define TARGET_TRAP_TRACE   2
+
+
+#endif /* ! _TARGET_OS_SIGINFO_H_ */
diff --git a/bsd-user/openbsd/target_os_signal.h b/bsd-user/openbsd/target_os_signal.h
new file mode 100644
index 0000000000..a373922f7e
--- /dev/null
+++ b/bsd-user/openbsd/target_os_signal.h
@@ -0,0 +1,69 @@
+#ifndef _TARGET_OS_SIGNAL_H_
+#define _TARGET_OS_SIGNAL_H_
+
+#include "target_os_siginfo.h"
+#include "target_arch_signal.h"
+
+#define TARGET_SIGHUP  1       /* hangup */
+#define TARGET_SIGINT  2       /* interrupt */
+#define TARGET_SIGQUIT 3       /* quit */
+#define TARGET_SIGILL  4       /* illegal instruction (not reset when caught) */
+#define TARGET_SIGTRAP 5       /* trace trap (not reset when caught) */
+#define TARGET_SIGABRT 6       /* abort() */
+#define TARGET_SIGIOT  SIGABRT /* compatibility */
+#define TARGET_SIGEMT  7       /* EMT instruction */
+#define TARGET_SIGFPE  8       /* floating point exception */
+#define TARGET_SIGKILL 9       /* kill (cannot be caught or ignored) */
+#define TARGET_SIGBUS  10      /* bus error */
+#define TARGET_SIGSEGV 11      /* segmentation violation */
+#define TARGET_SIGSYS  12      /* bad argument to system call */
+#define TARGET_SIGPIPE 13      /* write on a pipe with no one to read it */
+#define TARGET_SIGALRM 14      /* alarm clock */
+#define TARGET_SIGTERM 15      /* software termination signal from kill */
+#define TARGET_SIGURG  16      /* urgent condition on IO channel */
+#define TARGET_SIGSTOP 17      /* sendable stop signal not from tty */
+#define TARGET_SIGTSTP 18      /* stop signal from tty */
+#define TARGET_SIGCONT 19      /* continue a stopped process */
+#define TARGET_SIGCHLD 20      /* to parent on child stop or exit */
+#define TARGET_SIGTTIN 21      /* to readers pgrp upon background tty read */
+#define TARGET_SIGTTOU 22      /* like TTIN for out if (tp->t_local&LTOSTOP) */
+#define TARGET_SIGIO   23      /* input/output possible signal */
+#define TARGET_SIGXCPU 24      /* exceeded CPU time limit */
+#define TARGET_SIGXFSZ 25      /* exceeded file size limit */
+#define TARGET_SIGVTALRM 26    /* virtual time alarm */
+#define TARGET_SIGPROF   27    /* profiling time alarm */
+#define TARGET_SIGWINCH  28    /* window size changes */
+#define TARGET_SIGINFO   29    /* information request */
+#define TARGET_SIGUSR1   30    /* user defined signal 1 */
+#define TARGET_SIGUSR2   31    /* user defined signal 2 */
+
+/*
+ * Language spec says we must list exactly one parameter, even though we
+ * actually supply three.  Ugh!
+ */
+#define TARGET_SIG_DFL         ((void (*)(int))0)
+#define TARGET_SIG_IGN         ((void (*)(int))1)
+#define TARGET_SIG_ERR         ((void (*)(int))-1)
+
+#define TARGET_SA_ONSTACK   0x0001  /* take signal on signal stack */
+#define TARGET_SA_RESTART   0x0002  /* restart system on signal return */
+#define TARGET_SA_RESETHAND 0x0004  /* reset to SIG_DFL when taking signal */
+#define TARGET_SA_NODEFER   0x0010  /* don't mask the signal we're delivering */
+#define TARGET_SA_NOCLDWAIT 0x0020  /* don't create zombies (assign to pid 1) */
+#define TARGET_SA_USERTRAMP 0x0100  /* do not bounce off kernel's sigtramp */
+#define TARGET_SA_NOCLDSTOP 0x0008  /* do not generate SIGCHLD on child stop */
+#define TARGET_SA_SIGINFO   0x0040  /* generate siginfo_t */
+
+/*
+ * Flags for sigprocmask:
+ */
+#define TARGET_SIG_BLOCK       1       /* block specified signal set */
+#define TARGET_SIG_UNBLOCK     2       /* unblock specified signal set */
+#define TARGET_SIG_SETMASK     3       /* set specified signal set */
+
+#define TARGET_BADSIG       SIG_ERR
+
+#define TARGET_SS_ONSTACK 0x0001 /* take signals on alternate stack */
+#define TARGET_SS_DISABLE 0x0004 /* disable taking signals on alternate stack */
+
+#endif /* !_TARGET_OS_SIGNAL_H_ */
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 21efa7d777..3e3bd96cff 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -42,6 +42,7 @@ extern enum BSDType bsd_type;
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "target_os_vmparam.h"
+#include "target_os_signal.h"
 #include "exec/gdbstub.h"
 
 /*
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index 207ddeecbf..eb7d1da9b0 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -37,8 +37,6 @@
  *      @(#)signal.h    8.2 (Berkeley) 1/21/94
  */
 
-#define TARGET_NSIG     32              /* counting 0; could be 33 (mask is 1-32) */
-
 #define TARGET_SIGHUP  1       /* hangup */
 #define TARGET_SIGINT  2       /* interrupt */
 #define TARGET_SIGQUIT 3       /* quit */
@@ -72,14 +70,6 @@
 #define TARGET_SIGUSR1 30       /* user defined signal 1 */
 #define TARGET_SIGUSR2 31       /* user defined signal 2 */
 
-/*
- * Language spec says we must list exactly one parameter, even though we
- * actually supply three.  Ugh!
- */
-#define TARGET_SIG_DFL         (void (*)(int))0
-#define TARGET_SIG_IGN         (void (*)(int))1
-#define TARGET_SIG_ERR         (void (*)(int))-1
-
 #define TARGET_SA_ONSTACK       0x0001  /* take signal on signal stack */
 #define TARGET_SA_RESTART       0x0002  /* restart system on signal return */
 #define TARGET_SA_RESETHAND     0x0004  /* reset to SIG_DFL when taking signal */
diff --git a/bsd-user/x86_64/target_arch_signal.h b/bsd-user/x86_64/target_arch_signal.h
new file mode 100644
index 0000000000..4c1ff0e5ba
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_signal.h
@@ -0,0 +1,94 @@
+/*
+ *  x86_64 signal definitions
+ *
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
+#ifndef _TARGET_ARCH_SIGNAL_H_
+#define _TARGET_ARCH_SIGNAL_H_
+
+#include "cpu.h"
+
+/* Size of the signal trampolin code placed on the stack. */
+#define TARGET_SZSIGCODE    0
+
+/* compare to  x86/include/_limits.h */
+#define TARGET_MINSIGSTKSZ  (512 * 4)               /* min sig stack size */
+#define TARGET_SIGSTKSZ     (MINSIGSTKSZ + 32768)   /* recommended size */
+
+#define TARGET_MC_GET_CLEAR_RET 0x0001
+
+struct target_sigcontext {
+    /* to be added */
+};
+
+typedef struct target_mcontext {
+} target_mcontext_t;
+
+typedef struct target_ucontext {
+    target_sigset_t   uc_sigmask;
+    target_mcontext_t uc_mcontext;
+    abi_ulong         uc_link;
+    target_stack_t    uc_stack;
+    int32_t           uc_flags;
+    int32_t         __spare__[4];
+} target_ucontext_t;
+
+struct target_sigframe {
+    abi_ulong   sf_signum;
+    abi_ulong   sf_siginfo;    /* code or pointer to sf_si */
+    abi_ulong   sf_ucontext;   /* points to sf_uc */
+    abi_ulong   sf_addr;       /* undocumented 4th arg */
+    target_ucontext_t   sf_uc; /* = *sf_uncontext */
+    target_siginfo_t    sf_si; /* = *sf_siginfo (SA_SIGINFO case)*/
+    uint32_t    __spare__[2];
+};
+
+/*
+ * Compare to amd64/amd64/machdep.c sendsig()
+ * Assumes that target stack frame memory is locked.
+ */
+static inline abi_long set_sigtramp_args(CPUX86State *regs,
+        int sig, struct target_sigframe *frame, abi_ulong frame_addr,
+        struct target_sigaction *ka)
+{
+    /* XXX return -TARGET_EOPNOTSUPP; */
+    return 0;
+}
+
+/* Compare to amd64/amd64/machdep.c get_mcontext() */
+static inline abi_long get_mcontext(CPUX86State *regs,
+                target_mcontext_t *mcp, int flags)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+/* Compare to amd64/amd64/machdep.c set_mcontext() */
+static inline abi_long set_mcontext(CPUX86State *regs,
+        target_mcontext_t *mcp, int srflag)
+{
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
+}
+
+static inline abi_long get_ucontext_sigreturn(CPUX86State *regs,
+        abi_ulong target_sf, abi_ulong *target_uc)
+{
+    /* XXX */
+    *target_uc = 0;
+    return -TARGET_EOPNOTSUPP;
+}
+
+#endif /* !TARGET_ARCH_SIGNAL_H_ */
-- 
2.32.0


