Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A264030D1
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:17:30 +0200 (CEST)
Received: from localhost ([::1]:35784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjPF-0000ez-8y
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2i-0006G5-Qa
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:12 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:41829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2e-000144-G9
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:12 -0400
Received: by mail-il1-x141.google.com with SMTP id l10so157724ilh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ApDGbRaCrCkDANlTmPExz0UBKFsSKhdbhfclyYQH1BQ=;
 b=DqZrTnSU9QHY+PtWL60dXNN5YnJYu+YOQTh+wf9J73TI8/ew4yIM6IFWUnJz6ilPHX
 IsjnNRJKxRHAMu7+Q4AwzVtQdcgwzAGmjnLju1dh/8gG44HabEWhfCAXfWcRpWeST7xv
 +FQfUx3czxZfTWozhfctFKBYlFrFVMYxsdtmWgfT0ZcQIY0Vhjkauq2bMOK0VvTB/eE9
 bYBaTbGO1FrJy0jM8zrKWWjTQfP/jCGtK2VGQHvEmlOcUox2nj431y9Dcyxfaj+bevI+
 WIiR6rb+lBpwBT/55cEBO8JVHfQN/DJoWTp6LktoPmiLjPe1EjP10fq4QtYJ3c+oK/Ar
 ChFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ApDGbRaCrCkDANlTmPExz0UBKFsSKhdbhfclyYQH1BQ=;
 b=sip2G/ZunNJ2RUBPlETlsGAAmBI4S2KpsoDg2Gl/9LJhb7K3e1/69I8ivkH2GuQK81
 lvy5sU52MS9sI1enbHnXeXEMJHpVMaCLd/f/XW7N47s7Q24i+tASQhX0SKv5iEnFvvBO
 +9bPLiKwcSLayjcyejSeuYCfC5FV99jglbudlgMyjGejSLyuGk05U70Ax/eAwuT6uY4G
 NTVCMcPzt6W1lxwrBMtleOkCHHLfj658NwJ/t28WBGvi9ikplYIMZtgpciVQjQuGFqUY
 MBW13I531og/vnvdG2Wk1fBLDMHGTMSpAD6xwBWj1cK1wok4CsVEDjQV1qsloMg4v0Bh
 1yVw==
X-Gm-Message-State: AOAM5305gZVzFERXv3U3n0sHAvohVkPFIoducPIgmzadNKP6t9MnQovM
 J05Q0OL9GvfxBBuT8C6F3KjSp1Jrc0m7L8csbEw=
X-Google-Smtp-Source: ABdhPJwPIzRCegLeqY4ueMiwu69LaHdObMtgUj/zu9mjPNQDwWpyHXkqDnwAs9fVhNrftd5nx94ouw==
X-Received: by 2002:a92:d60f:: with SMTP id w15mr285681ilm.209.1631051647054; 
 Tue, 07 Sep 2021 14:54:07 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:54:06 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 32/42] bsd-user: Rewrite target system call definintion glue
Date: Tue,  7 Sep 2021 15:53:22 -0600
Message-Id: <20210907215332.30737-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::141;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x141.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Rewrite target definnitions to interface with the FreeBSD system calls.
This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
rusage, rwusage) and basic defines (mmap, rusage). Also included are
FreeBSD version-specific variations.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/bsd-mman.h     | 121 --------------------
 bsd-user/mmap.c         |   2 -
 bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--------------
 3 files changed, 162 insertions(+), 208 deletions(-)
 delete mode 100644 bsd-user/bsd-mman.h

diff --git a/bsd-user/bsd-mman.h b/bsd-user/bsd-mman.h
deleted file mode 100644
index 910e8c1921..0000000000
--- a/bsd-user/bsd-mman.h
+++ /dev/null
@@ -1,121 +0,0 @@
-/*-
- * Copyright (c) 1982, 1986, 1993
- *      The Regents of the University of California.  All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 4. Neither the name of the University nor the names of its contributors
- *    may be used to endorse or promote products derived from this software
- *    without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
- *
- *      @(#)mman.h      8.2 (Berkeley) 1/9/95
- * $FreeBSD: src/sys/sys/mman.h,v 1.42 2008/03/28 04:29:27 ps Exp $
- */
-
-#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimplemented MAP_INHERIT */
-#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplemented MAP_NOEXTEND */
-#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, like a stack */
-#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not sync underlying file */
-
-#define TARGET_FREEBSD_MAP_FLAGMASK     0x1ff7
-
-/*      $NetBSD: mman.h,v 1.42 2008/11/18 22:13:49 ad Exp $     */
-
-/*-
- * Copyright (c) 1982, 1986, 1993
- *      The Regents of the University of California.  All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the name of the University nor the names of its contributors
- *    may be used to endorse or promote products derived from this software
- *    without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
- *
- *      @(#)mman.h      8.2 (Berkeley) 1/9/95
- */
-#define TARGET_NETBSD_MAP_INHERIT       0x0080  /* region is retained after exec */
-#define TARGET_NETBSD_MAP_TRYFIXED      0x0400 /* attempt hint address, even within break */
-#define TARGET_NETBSD_MAP_WIRED         0x0800  /* mlock() mapping when it is established */
-
-#define TARGET_NETBSD_MAP_STACK         0x2000  /* allocated from memory, swap space (stack) */
-
-#define TARGET_NETBSD_MAP_FLAGMASK      0x3ff7
-
-/*      $OpenBSD: mman.h,v 1.18 2003/07/21 22:52:19 tedu Exp $  */
-/*      $NetBSD: mman.h,v 1.11 1995/03/26 20:24:23 jtc Exp $    */
-
-/*-
- * Copyright (c) 1982, 1986, 1993
- *      The Regents of the University of California.  All rights reserved.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the name of the University nor the names of its contributors
- *    may be used to endorse or promote products derived from this software
- *    without specific prior written permission.
- *
- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
- *
- *      @(#)mman.h      8.1 (Berkeley) 6/2/93
- */
-
-#define TARGET_OPENBSD_MAP_INHERIT      0x0080  /* region is retained after exec */
-#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100  /* for MAP_FILE, don't change file size */
-#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400  /* attempt hint address, even within heap */
-
-#define TARGET_OPENBSD_MAP_FLAGMASK     0x17f7
-
-// XXX
-#define TARGET_BSD_MAP_FLAGMASK         0x3ff7
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 0ac1b92706..03119b1f20 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -20,8 +20,6 @@
 
 #include "qemu.h"
 #include "qemu-common.h"
-#include "bsd-mman.h"
-#include "exec/exec-all.h"
 
 //#define DEBUG_MMAP
 
diff --git a/bsd-user/syscall_defs.h b/bsd-user/syscall_defs.h
index eb7d1da9b0..04a1a886d7 100644
--- a/bsd-user/syscall_defs.h
+++ b/bsd-user/syscall_defs.h
@@ -1,95 +1,26 @@
-/*      $OpenBSD: signal.h,v 1.19 2006/01/08 14:20:16 millert Exp $     */
-/*      $NetBSD: signal.h,v 1.21 1996/02/09 18:25:32 christos Exp $     */
-
 /*
- * Copyright (c) 1982, 1986, 1989, 1991, 1993
- *      The Regents of the University of California.  All rights reserved.
- * (c) UNIX System Laboratories, Inc.
- * All or some portions of this file are derived from material licensed
- * to the University of California by American Telephone and Telegraph
- * Co. or Unix System Laboratories, Inc. and are reproduced herein with
- * the permission of UNIX System Laboratories, Inc.
+ *  System call related declarations
  *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions
- * are met:
- * 1. Redistributions of source code must retain the above copyright
- *    notice, this list of conditions and the following disclaimer.
- * 2. Redistributions in binary form must reproduce the above copyright
- *    notice, this list of conditions and the following disclaimer in the
- *    documentation and/or other materials provided with the distribution.
- * 3. Neither the name of the University nor the names of its contributors
- *    may be used to endorse or promote products derived from this software
- *    without specific prior written permission.
+ *  Copyright (c) 2013-15 Stacey D. Son (sson at FreeBSD)
  *
- * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
- * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
- * SUCH DAMAGE.
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
  *
- *      @(#)signal.h    8.2 (Berkeley) 1/21/94
- */
-
-#define TARGET_SIGHUP  1       /* hangup */
-#define TARGET_SIGINT  2       /* interrupt */
-#define TARGET_SIGQUIT 3       /* quit */
-#define TARGET_SIGILL  4       /* illegal instruction (not reset when caught) */
-#define TARGET_SIGTRAP 5       /* trace trap (not reset when caught) */
-#define TARGET_SIGABRT 6       /* abort() */
-#define TARGET_SIGIOT  SIGABRT /* compatibility */
-#define TARGET_SIGEMT  7       /* EMT instruction */
-#define TARGET_SIGFPE  8       /* floating point exception */
-#define TARGET_SIGKILL 9       /* kill (cannot be caught or ignored) */
-#define TARGET_SIGBUS  10      /* bus error */
-#define TARGET_SIGSEGV 11      /* segmentation violation */
-#define TARGET_SIGSYS  12      /* bad argument to system call */
-#define TARGET_SIGPIPE 13      /* write on a pipe with no one to read it */
-#define TARGET_SIGALRM 14      /* alarm clock */
-#define TARGET_SIGTERM 15      /* software termination signal from kill */
-#define TARGET_SIGURG  16      /* urgent condition on IO channel */
-#define TARGET_SIGSTOP 17      /* sendable stop signal not from tty */
-#define TARGET_SIGTSTP 18      /* stop signal from tty */
-#define TARGET_SIGCONT 19      /* continue a stopped process */
-#define TARGET_SIGCHLD 20      /* to parent on child stop or exit */
-#define TARGET_SIGTTIN 21      /* to readers pgrp upon background tty read */
-#define TARGET_SIGTTOU 22      /* like TTIN for output if (tp->t_local&LTOSTOP) */
-#define TARGET_SIGIO   23      /* input/output possible signal */
-#define TARGET_SIGXCPU 24      /* exceeded CPU time limit */
-#define TARGET_SIGXFSZ 25      /* exceeded file size limit */
-#define TARGET_SIGVTALRM 26    /* virtual time alarm */
-#define TARGET_SIGPROF 27      /* profiling time alarm */
-#define TARGET_SIGWINCH 28      /* window size changes */
-#define TARGET_SIGINFO  29      /* information request */
-#define TARGET_SIGUSR1 30       /* user defined signal 1 */
-#define TARGET_SIGUSR2 31       /* user defined signal 2 */
-
-#define TARGET_SA_ONSTACK       0x0001  /* take signal on signal stack */
-#define TARGET_SA_RESTART       0x0002  /* restart system on signal return */
-#define TARGET_SA_RESETHAND     0x0004  /* reset to SIG_DFL when taking signal */
-#define TARGET_SA_NODEFER       0x0010  /* don't mask the signal we're delivering */
-#define TARGET_SA_NOCLDWAIT     0x0020  /* don't create zombies (assign to pid 1) */
-#define TARGET_SA_USERTRAMP    0x0100  /* do not bounce off kernel's sigtramp */
-#define TARGET_SA_NOCLDSTOP     0x0008  /* do not generate SIGCHLD on child stop */
-#define TARGET_SA_SIGINFO       0x0040  /* generate siginfo_t */
-
-/*
- * Flags for sigprocmask:
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#define TARGET_SIG_BLOCK       1       /* block specified signal set */
-#define TARGET_SIG_UNBLOCK     2       /* unblock specified signal set */
-#define TARGET_SIG_SETMASK     3       /* set specified signal set */
 
-#define TARGET_BADSIG          SIG_ERR
+#ifndef _SYSCALL_DEFS_H_
+#define _SYSCALL_DEFS_H_
 
-#define TARGET_SS_ONSTACK       0x0001  /* take signals on alternate stack */
-#define TARGET_SS_DISABLE       0x0004  /* disable taking signals on alternate stack */
+#include <sys/syscall.h>
 
 #include "errno_defs.h"
 
@@ -97,8 +28,154 @@
 #include "netbsd/syscall_nr.h"
 #include "openbsd/syscall_nr.h"
 
+/*
+ * machine/_types.h
+ * or x86/_types.h
+ */
+
+/*
+ * time_t seems to be very inconsistly defined for the different *BSD's...
+ *
+ * FreeBSD uses a 64bits time_t except on i386
+ * so we have to add a special case here.
+ *
+ * On NetBSD time_t is always defined as an int64_t.  On OpenBSD time_t
+ * is always defined as an int.
+ *
+ */
+#if (!defined(TARGET_I386))
+typedef int64_t target_freebsd_time_t;
+#else
+typedef int32_t target_freebsd_time_t;
+#endif
+
 struct target_iovec {
     abi_long iov_base;   /* Starting address */
     abi_long iov_len;   /* Number of bytes */
 };
 
+/*
+ *  sys/mman.h
+ */
+#define TARGET_FREEBSD_MAP_RESERVED0080 0x0080  /* previously misimplemented */
+                                                /* MAP_INHERIT */
+#define TARGET_FREEBSD_MAP_RESERVED0100 0x0100  /* previously unimplemented */
+                                                /* MAP_NOEXTEND */
+#define TARGET_FREEBSD_MAP_STACK        0x0400  /* region grows down, like a */
+                                                /* stack */
+#define TARGET_FREEBSD_MAP_NOSYNC       0x0800  /* page to but do not sync */
+                                                /* underlying file */
+
+#define TARGET_FREEBSD_MAP_FLAGMASK     0x1ff7
+
+#define TARGET_NETBSD_MAP_INHERIT       0x0080  /* region is retained after */
+                                                /* exec */
+#define TARGET_NETBSD_MAP_TRYFIXED      0x0400  /* attempt hint address, even */
+                                                /* within break */
+#define TARGET_NETBSD_MAP_WIRED         0x0800  /* mlock() mapping when it is */
+                                                /* established */
+
+#define TARGET_NETBSD_MAP_STACK         0x2000  /* allocated from memory, */
+                                                /* swap space (stack) */
+
+#define TARGET_NETBSD_MAP_FLAGMASK      0x3ff7
+
+#define TARGET_OPENBSD_MAP_INHERIT      0x0080  /* region is retained after */
+                                                /* exec */
+#define TARGET_OPENBSD_MAP_NOEXTEND     0x0100  /* for MAP_FILE, don't change */
+                                                /* file size */
+#define TARGET_OPENBSD_MAP_TRYFIXED     0x0400  /* attempt hint address, */
+                                                /* even within heap */
+
+#define TARGET_OPENBSD_MAP_FLAGMASK     0x17f7
+
+/* XXX */
+#define TARGET_BSD_MAP_FLAGMASK         0x3ff7
+
+/*
+ * sys/time.h
+ * sys/timex.h
+ */
+
+typedef abi_long target_freebsd_suseconds_t;
+
+/* compare to sys/timespec.h */
+struct target_freebsd_timespec {
+    target_freebsd_time_t   tv_sec;     /* seconds */
+    abi_long                tv_nsec;    /* and nanoseconds */
+#if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
+    abi_long _pad;
+#endif
+};
+
+#define TARGET_CPUCLOCK_WHICH_PID   0
+#define TARGET_CPUCLOCK_WHICH_TID   1
+
+/* sys/umtx.h */
+struct target_freebsd__umtx_time {
+    struct target_freebsd_timespec  _timeout;
+    uint32_t    _flags;
+    uint32_t    _clockid;
+};
+
+struct target_freebsd_timeval {
+    target_freebsd_time_t       tv_sec; /* seconds */
+    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
+#if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
+    abi_long _pad;
+#endif
+};
+
+/*
+ *  sys/resource.h
+ */
+#if defined(__FreeBSD__)
+#define TARGET_RLIM_INFINITY    RLIM_INFINITY
+#else
+#define TARGET_RLIM_INFINITY    ((abi_ulong)-1)
+#endif
+
+#define TARGET_RLIMIT_CPU       0
+#define TARGET_RLIMIT_FSIZE     1
+#define TARGET_RLIMIT_DATA      2
+#define TARGET_RLIMIT_STACK     3
+#define TARGET_RLIMIT_CORE      4
+#define TARGET_RLIMIT_RSS       5
+#define TARGET_RLIMIT_MEMLOCK   6
+#define TARGET_RLIMIT_NPROC     7
+#define TARGET_RLIMIT_NOFILE    8
+#define TARGET_RLIMIT_SBSIZE    9
+#define TARGET_RLIMIT_AS        10
+#define TARGET_RLIMIT_NPTS      11
+#define TARGET_RLIMIT_SWAP      12
+
+struct target_rlimit {
+    uint64_t rlim_cur;
+    uint64_t rlim_max;
+};
+
+struct target_freebsd_rusage {
+    struct target_freebsd_timeval ru_utime; /* user time used */
+    struct target_freebsd_timeval ru_stime; /* system time used */
+    abi_long    ru_maxrss;      /* maximum resident set size */
+    abi_long    ru_ixrss;       /* integral shared memory size */
+    abi_long    ru_idrss;       /* integral unshared data size */
+    abi_long    ru_isrss;       /* integral unshared stack size */
+    abi_long    ru_minflt;      /* page reclaims */
+    abi_long    ru_majflt;      /* page faults */
+    abi_long    ru_nswap;       /* swaps */
+    abi_long    ru_inblock;     /* block input operations */
+    abi_long    ru_oublock;     /* block output operations */
+    abi_long    ru_msgsnd;      /* messages sent */
+    abi_long    ru_msgrcv;      /* messages received */
+    abi_long    ru_nsignals;    /* signals received */
+    abi_long    ru_nvcsw;       /* voluntary context switches */
+    abi_long    ru_nivcsw;      /* involuntary context switches */
+};
+
+struct target_freebsd__wrusage {
+    struct target_freebsd_rusage wru_self;
+    struct target_freebsd_rusage wru_children;
+};
+
+#endif /* ! _SYSCALL_DEFS_H_ */
-- 
2.32.0


