Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9F73E3755
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 00:05:15 +0200 (CEST)
Received: from localhost ([::1]:41178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCURO-0001wq-QM
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 18:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6K-00088j-Q1
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:28 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:42661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6H-00059E-6g
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:28 -0400
Received: by mail-io1-xd44.google.com with SMTP id h1so19882143iol.9
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDlcdg5awHQz79CK7uZjKMsm1Syxtxzx6hnXAmY0Fqk=;
 b=xCyC1s1aZifOXDKwWSbE9WUtEf6F2bKudH7JEn9Ja9VNWLyzC+iEfSCU4DtEGwRP32
 pdGN6SUueJ5ASnvD9L3PZzpKOua4qLKGsedZsjhg6LWYZsY/2UTBhIrPBOW4UfFv4RFh
 5Ib9IIiXyB3HmRgb9XiUdAyc0Xe1hpFdC/qp6kSg9RuaCZ15uVVkspshaB12y6Xuk/Xs
 +YJjjMdlekYCLafdkUh8E8emYKOlnJOU9F/4cE/VRPxzBlE0K9FII4VwIZ4BledLFvwP
 gNxHtZas1aABTkK5jk50Q18x6Ho7IhaHYR/CGpuY6GnzxYVvn1YJAhuShZ0R7OpQB1xZ
 rI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDlcdg5awHQz79CK7uZjKMsm1Syxtxzx6hnXAmY0Fqk=;
 b=eBqB9kGsIO2Lk1EWlRPY7TktuMp2MLeZ5ROAz4gvAhoW0ZxZsETpXiXd4e8njuR9Wz
 iACo1/g6f4NdABM5du63GddCrzesp4JpYjqpGe4xtm/8tPUISiWwRmL0u6atFv6GrjDO
 EJMpPRxnibQbZfco5OPC/+NnCjUiSq8n5ChjtI9c6klb4lz9Hs0tpp5SmL2S9O6vXpgb
 WU5dCN03q2JMYkRoaIHKKJsN8L9cF0cVHYxZMf7qNKxaxaDmnnkoS3FdaARki/kdqdd4
 350H93lO36mnzu/4B+5U1M+bmjakFKZ6RTnw0gwa2S3aj4Y3SIE4Ynx5j8e2Z2hy+VUc
 2/og==
X-Gm-Message-State: AOAM5301mltqoRLKYS19aUJmYPcJ2d9YEHKag+22nNYExM2H0mQhjjzu
 FK8a6c7/yZXMdy+afOQA8kJ3CRyZ6aATRxlA
X-Google-Smtp-Source: ABdhPJwfHLwP5grFMUpsge5x4h1IhlszLaBEhUhvKsMy6S1/D/lIFQidoQgp1Hu++8FmRwTJ2GfdfQ==
X-Received: by 2002:a92:d60a:: with SMTP id w10mr260156ilm.22.1628372603844;
 Sat, 07 Aug 2021 14:43:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 32/49] bsd-user: *BSD specific siginfo defintions
Date: Sat,  7 Aug 2021 15:42:25 -0600
Message-Id: <20210807214242.82385-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d44;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd44.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add FreeBSD, NetBSD and OpenBSD values for the various signal info types
and defines to decode different signals to discover more information
about the specific signal types.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/target_os_siginfo.h | 145 +++++++++++++++++++++++++++
 bsd-user/freebsd/target_os_signal.h  |  78 ++++++++++++++
 bsd-user/i386/target_arch_signal.h   |  94 +++++++++++++++++
 bsd-user/netbsd/target_os_siginfo.h  |  82 +++++++++++++++
 bsd-user/netbsd/target_os_signal.h   |  70 +++++++++++++
 bsd-user/openbsd/target_os_siginfo.h |  82 +++++++++++++++
 bsd-user/openbsd/target_os_signal.h  |  70 +++++++++++++
 bsd-user/qemu.h                      |   3 +-
 bsd-user/syscall_defs.h              |  10 --
 bsd-user/x86_64/target_arch_signal.h |  94 +++++++++++++++++
 10 files changed, 716 insertions(+), 12 deletions(-)
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
index 0000000000..d12b2e213e
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
+        /* The kernel (and thus QEMU) never looks at these;
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
+#define TARGET_SEGV_ACCERR  (2) /* invalid permissions for mapped
+                                           object */
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
+#define TARGET_FPE_INTOVF	(1)	/* Integer overflow.			*/
+#define TARGET_FPE_INTDIV	(2)	/* Integer divide by zero.		*/
+#define TARGET_FPE_FLTDIV	(3)	/* Floating point divide by zero.	*/
+#define TARGET_FPE_FLTOVF	(4)	/* Floating point overflow.		*/
+#define TARGET_FPE_FLTUND	(5)	/* Floating point underflow.		*/
+#define TARGET_FPE_FLTRES	(6)	/* Floating point inexact result.	*/
+#define TARGET_FPE_FLTINV	(7)	/* Invalid floating point operation.	*/
+#define TARGET_FPE_FLTSUB	(8)	/* Subscript out of range.		*/
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
index 0000000000..e2387b2863
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
+/* #define TARGET_SZSIGCODE    (0) */      /* XXX to be added. */
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
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
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
index 0000000000..d39a26f6e6
--- /dev/null
+++ b/bsd-user/netbsd/target_os_signal.h
@@ -0,0 +1,70 @@
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
+#define TARGET_SIGTTOU 22      /* like TTIN for output if
+                                  (tp->t_local&LTOSTOP) */
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
index 0000000000..d39a26f6e6
--- /dev/null
+++ b/bsd-user/openbsd/target_os_signal.h
@@ -0,0 +1,70 @@
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
+#define TARGET_SIGTTOU 22      /* like TTIN for output if
+                                  (tp->t_local&LTOSTOP) */
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
index b47312b1e2..a22fc19cd6 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -45,8 +45,7 @@ extern enum BSDType bsd_type;
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "target_os_vmparam.h"
-//#include "target_os_signal.h"
-//#include "hostdep.h"
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
index 0000000000..1998570e9d
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
+/* #define TARGET_SZSIGCODE    (0) */   /* XXX to be added */
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
+    /* XXX */
+    return -TARGET_EOPNOTSUPP;
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


