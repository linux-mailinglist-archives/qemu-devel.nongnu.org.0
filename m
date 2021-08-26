Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C6C3F8FDA
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:23:12 +0200 (CEST)
Received: from localhost ([::1]:36040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMq2-0008Ks-8t
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgF-0006ZW-NJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:59 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:35337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMgB-00072S-B4
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:59 -0400
Received: by mail-il1-x141.google.com with SMTP id h29so4750509ila.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y87d1Ky5Z4y4EmY6qjJIGig2DLu0d7jUlTo5L0Pg+g4=;
 b=PcDFaFZWF+beQkPcU9EH6XrAurwcTbFWPkc9cR+Kg9jd8bvUNg/5FQXg5g+WAj5htw
 69yx0/r3ohLwgF84EC6GF9YUljqPqct/FMPBADk+aYC4Zxd1inWinSjsN0X2Qv6CgCYE
 Z9/L4fRfLfMum1LriHEMhbxucCiCAq1VCw9i++5eK+OrmpbszZ3iwSXHk913eYF8A/hr
 K9ScNOnpXnoGezQda2jsdsmoXKkNbKUkDu6CVCct7AUMPmtWA/FpE+gZThJJcDTS7k1S
 5CzY3PUqtauWynjZJR/2dbXCkVR9s12TzEK0qNE/ljY1fUgHo+vt/ZROfQNdZ+sBl3YQ
 RIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y87d1Ky5Z4y4EmY6qjJIGig2DLu0d7jUlTo5L0Pg+g4=;
 b=qIeUrlut64pJq4l/31Z5H94aniCUsksppvBzhhsrM2hdwjq5UteDc98hOV/2jOgLqr
 Et85p/3QUnKcoKzP/R+LcLHt+29Ifj81lPRev7thyNeVD6Jn2b+T1pAuuGTO9cmUpKqs
 AvQEs/Rx5c/FTrvS9tc+q0hj6vJDQREuWe0OMvLzkMlt0wbcUtpmZ1lGFUHWbRiofpew
 xaEod9hCe+sP7GBbaUS23kg32bq2tHFMwcWS23VYq45Vo/5Vodr+TR9SGLa0VIDYHqhB
 XASnB9NnUSb+3FT/DKGYQxkAR68O4jueMtslCL6xx0LFiykfqqXSwJrYm6DQFdF75kgH
 HHSA==
X-Gm-Message-State: AOAM5314hmzTkUjmXkfOfmnlbZos54R5hPJjzqBKfyl0oTPfKdB0gYJT
 8zWXSONn0zH5b7G39+wZ+NqYePm2PeWWta9T
X-Google-Smtp-Source: ABdhPJxjJ4EzljtteIVJ6Co66/gaNUHowsATSogwYGPYEiQSBw1l31d7q3Fwomg9n/pILEof0VJ7EQ==
X-Received: by 2002:a92:c56b:: with SMTP id b11mr3901789ilj.225.1630012373758; 
 Thu, 26 Aug 2021 14:12:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 35/43] bsd-user: Add target_os_user.h to capture the
 user/kernel structures
Date: Thu, 26 Aug 2021 15:11:53 -0600
Message-Id: <20210826211201.98877-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Michal Meloun <mmel@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

This file evolved over the years to capture the user/kernel interfaces,
including those that changed over time.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/target_os_user.h | 429 ++++++++++++++++++++++++++++++
 1 file changed, 429 insertions(+)
 create mode 100644 bsd-user/freebsd/target_os_user.h

diff --git a/bsd-user/freebsd/target_os_user.h b/bsd-user/freebsd/target_os_user.h
new file mode 100644
index 0000000000..235cd35a5c
--- /dev/null
+++ b/bsd-user/freebsd/target_os_user.h
@@ -0,0 +1,429 @@
+/*
+ *  sys/user.h definitions
+ *
+ *  Copyright (c) 2015 Stacey D. Son (sson at FreeBSD)
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
+#ifndef _TARGET_OS_USER_H_
+#define _TARGET_OS_USER_H_
+
+/*
+ * from sys/priority.h
+ */
+struct target_priority {
+    uint8_t     pri_class;      /* Scheduling class. */
+    uint8_t     pri_level;      /* Normal priority level. */
+    uint8_t     pri_native;     /* Priority before propogation. */
+    uint8_t     pri_user;       /* User priority based on p_cpu and p_nice. */
+};
+
+/*
+ * sys/caprights.h
+ */
+#define TARGET_CAP_RIGHTS_VERSION  0
+
+typedef struct target_cap_rights {
+    uint64_t    cr_rights[TARGET_CAP_RIGHTS_VERSION + 2];
+} target_cap_rights_t;
+
+/*
+ * From sys/_socketaddr_storage.h
+ *
+ */
+#define TARGET_SS_MAXSIZE     128U
+#define TARGET_SS_ALIGNSIZE   (sizeof(__int64_t))
+#define TARGET_SS_PAD1SIZE    (TARGET_SS_ALIGNSIZE - sizeof(unsigned char) - \
+        sizeof(uint8_t))
+#define TARGET_SS_PAD2SIZE    (TARGET_SS_MAXSIZE - sizeof(unsigned char) - \
+        sizeof(uint8_t) - TARGET_SS_PAD1SIZE - TARGET_SS_ALIGNSIZE)
+
+struct target_sockaddr_storage {
+    unsigned char   ss_len;         /* address length */
+    uint8_t         ss_family;      /* address family */
+    char            __ss_pad1[TARGET_SS_PAD1SIZE];
+    __int64_t       __ss_align;     /* force desired struct alignment */
+    char            __ss_pad2[TARGET_SS_PAD2SIZE];
+};
+
+/*
+ * from sys/user.h
+ */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+#define TARGET_KI_NSPARE_INT        2
+#elif defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
+#define TARGET_KI_NSPARE_INT        4
+#elif defined(__FreeBSD_version) && __FreeBSD_version >= 1000000
+#define TARGET_KI_NSPARE_INT        7
+#else
+#define TARGET_KI_NSPARE_INT        9
+#endif /* ! __FreeBSD_version >= 1000000 */
+#define TARGET_KI_NSPARE_LONG       12
+#define TARGET_KI_NSPARE_PTR        6
+
+#define TARGET_WMESGLEN             8
+#define TARGET_LOCKNAMELEN          8
+#define TARGET_TDNAMLEN             16
+#define TARGET_COMMLEN              19
+#define TARGET_KI_EMULNAMELEN       16
+#define TARGET_KI_NGROUPS           16
+#define TARGET_LOGNAMELEN           17
+#define TARGET_LOGINCLASSLEN        17
+
+#define TARGET_KF_TYPE_NONE         0
+#define TARGET_KF_TYPE_VNODE        1
+#define TARGET_KF_TYPE_SOCKET       2
+#define TARGET_KF_TYPE_PIPE         3
+#define TARGET_KF_TYPE_FIFO         4
+#define TARGET_KF_TYPE_KQUEUE       5
+#define TARGET_KF_TYPE_CRYPTO       6
+#define TARGET_KF_TYPE_MQUEUE       7
+#define TARGET_KF_TYPE_SHM          8
+#define TARGET_KF_TYPE_SEM          9
+#define TARGET_KF_TYPE_PTS          10
+#define TARGET_KF_TYPE_PROCDESC     11
+#define TARGET_KF_TYPE_DEV          12
+#define TARGET_KF_TYPE_UNKNOWN      255
+
+struct target_kinfo_proc {
+    int32_t     ki_structsize;      /* size of this structure */
+    int32_t     ki_layout;          /* reserved: layout identifier */
+    abi_ulong   ki_args;            /* address of command arguments */
+    abi_ulong   ki_paddr;           /* address of proc */
+    abi_ulong   ki_addr;            /* kernel virtual addr of u-area */
+    abi_ulong   ki_tracep;          /* pointer to trace file */
+    abi_ulong   ki_textvp;          /* pointer to executable file */
+    abi_ulong   ki_fd;              /* pointer to open file info */
+    abi_ulong   ki_vmspace;         /* pointer to kernel vmspace struct */
+    abi_ulong   ki_wchan;           /* sleep address */
+    int32_t     ki_pid;             /* Process identifier */
+    int32_t     ki_ppid;            /* parent process id */
+    int32_t     ki_pgid;            /* process group id */
+    int32_t     ki_tpgid;           /* tty process group id */
+    int32_t     ki_sid;             /* Process session ID */
+    int32_t     ki_tsid;            /* Terminal session ID */
+    int16_t     ki_jobc;            /* job control counter */
+    int16_t     ki_spare_short1;    /* unused (just here for alignment) */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+    int32_t     ki_tdev__freebsd11; /* controlling tty dev */
+#else
+    int32_t     ki_tdev;            /* controlling tty dev */
+#endif
+    target_sigset_t ki_siglist;     /* Signals arrived but not delivered */
+    target_sigset_t ki_sigmask;     /* Current signal mask */
+    target_sigset_t ki_sigignore;   /* Signals being ignored */
+    target_sigset_t ki_sigcatch;    /* Signals being caught by user */
+
+    int32_t     ki_uid;             /* effective user id */
+    int32_t     ki_ruid;            /* Real user id */
+    int32_t     ki_svuid;           /* Saved effective user id */
+    int32_t     ki_rgid;            /* Real group id */
+    int32_t     ki_svgid;           /* Saved effective group id */
+    int16_t     ki_ngroups;         /* number of groups */
+    int16_t     ki_spare_short2;    /* unused (just here for alignment) */
+    int32_t     ki_groups[TARGET_KI_NGROUPS];  /* groups */
+
+    abi_long    ki_size;            /* virtual size */
+
+    abi_long    ki_rssize;          /* current resident set size in pages */
+    abi_long    ki_swrss;           /* resident set size before last swap */
+    abi_long    ki_tsize;           /* text size (pages) XXX */
+    abi_long    ki_dsize;           /* data size (pages) XXX */
+    abi_long    ki_ssize;           /* stack size (pages) */
+
+    uint16_t    ki_xstat;           /* Exit status for wait & stop signal */
+    uint16_t    ki_acflag;          /* Accounting flags */
+
+    uint32_t    ki_pctcpu;          /* %cpu for process during ki_swtime */
+
+    uint32_t    ki_estcpu;          /* Time averaged value of ki_cpticks */
+    uint32_t    ki_slptime;         /* Time since last blocked */
+    uint32_t    ki_swtime;          /* Time swapped in or out */
+    uint32_t    ki_cow;             /* number of copy-on-write faults */
+    uint64_t    ki_runtime;         /* Real time in microsec */
+
+    struct  target_freebsd_timeval ki_start;  /* starting time */
+    struct  target_freebsd_timeval ki_childtime; /* time used by process
+                                                    children */
+
+    abi_long    ki_flag;            /* P_* flags */
+    abi_long    ki_kiflag;          /* KI_* flags (below) */
+    int32_t     ki_traceflag;       /* Kernel trace points */
+    char        ki_stat;            /* S* process status */
+    int8_t      ki_nice;            /* Process "nice" value */
+    char        ki_lock;            /* Process lock (prevent swap) count */
+    char        ki_rqindex;         /* Run queue index */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
+    u_char      ki_oncpu_old;       /* Which cpu we are on (legacy) */
+    u_char      ki_lastcpu_old;     /* Last cpu we were on (legacy) */
+#else
+    u_char      ki_oncpu;           /* Which cpu we are on */
+    u_char      ki_lastcpu;         /* Last cpu we were on */
+#endif /* ! __FreeBSD_version >= 1100000 */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    char        ki_tdname[TARGET_TDNAMLEN+1];  /* thread name */
+#else
+    char        ki_ocomm[TARGET_TDNAMLEN+1];   /* thread name */
+#endif /* ! __FreeBSD_version >= 900000 */
+    char        ki_wmesg[TARGET_WMESGLEN+1];   /* wchan message */
+    char        ki_login[TARGET_LOGNAMELEN+1]; /* setlogin name */
+    char        ki_lockname[TARGET_LOCKNAMELEN+1]; /* lock name */
+    char        ki_comm[TARGET_COMMLEN+1];     /* command name */
+    char        ki_emul[TARGET_KI_EMULNAMELEN+1];  /* emulation name */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    char        ki_loginclass[TARGET_LOGINCLASSLEN+1]; /* login class */
+#endif /* ! __FreeBSD_version >= 900000 */
+
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    char        ki_sparestrings[50];    /* spare string space */
+#else
+    char        ki_sparestrings[68];    /* spare string space */
+#endif /* ! __FreeBSD_version >= 900000 */
+    int32_t     ki_spareints[TARGET_KI_NSPARE_INT]; /* spare room for growth */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+ uint64_t ki_tdev;  /* controlling tty dev */
+#endif
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
+    int32_t     ki_oncpu;           /* Which cpu we are on */
+    int32_t     ki_lastcpu;         /* Last cpu we were on */
+    int32_t     ki_tracer;          /* Pid of tracing process */
+#endif /* __FreeBSD_version >= 1100000 */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    int32_t     ki_flag2;           /* P2_* flags */
+    int32_t     ki_fibnum;          /* Default FIB number */
+#endif /* ! __FreeBSD_version >= 900000 */
+    uint32_t    ki_cr_flags;        /* Credential flags */
+    int32_t     ki_jid;             /* Process jail ID */
+    int32_t     ki_numthreads;      /* XXXKSE number of threads in total */
+
+    int32_t     ki_tid;             /* XXXKSE thread id */
+
+    struct  target_priority ki_pri; /* process priority */
+    struct  target_freebsd_rusage ki_rusage;  /* process rusage statistics */
+        /* XXX - most fields in ki_rusage_ch are not (yet) filled in */
+    struct  target_freebsd_rusage ki_rusage_ch; /* rusage of children
+                                                   processes */
+
+
+    abi_ulong   ki_pcb;             /* kernel virtual addr of pcb */
+    abi_ulong   ki_kstack;          /* kernel virtual addr of stack */
+    abi_ulong   ki_udata;           /* User convenience pointer */
+    abi_ulong   ki_tdaddr;          /* address of thread */
+
+    abi_ulong   ki_spareptrs[TARGET_KI_NSPARE_PTR];  /* spare room for growth */
+    abi_long    ki_sparelongs[TARGET_KI_NSPARE_LONG];/* spare room for growth */
+    abi_long    ki_sflag;           /* PS_* flags */
+    abi_long    ki_tdflags;         /* XXXKSE kthread flag */
+};
+
+struct target_kinfo_file {
+    int32_t  kf_structsize;  /* Variable size of record. */
+    int32_t  kf_type;  /* Descriptor type. */
+    int32_t  kf_fd;   /* Array index. */
+    int32_t  kf_ref_count;  /* Reference count. */
+    int32_t  kf_flags;  /* Flags. */
+    int32_t  kf_pad0;  /* Round to 64 bit alignment. */
+    int64_t  kf_offset;  /* Seek location. */
+#if defined(__FreeBSD_version) && __FreeBSD_version < 1200031
+    int32_t  kf_vnode_type;  /* Vnode type. */
+    int32_t  kf_sock_domain;  /* Socket domain. */
+    int32_t  kf_sock_type;  /* Socket type. */
+    int32_t  kf_sock_protocol; /* Socket protocol. */
+    struct target_sockaddr_storage kf_sa_local; /* Socket address. */
+    struct target_sockaddr_storage kf_sa_peer; /* Peer address. */
+#endif
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    union {
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            uint32_t kf_spareint;
+            /* Socket domain. */
+            int  kf_sock_domain0;
+            /* Socket type. */
+            int  kf_sock_type0;
+            /* Socket protocol. */
+            int  kf_sock_protocol0;
+            /* Socket address. */
+            struct sockaddr_storage kf_sa_local;
+            /* Peer address. */
+            struct sockaddr_storage kf_sa_peer;
+#endif
+            /* Address of so_pcb. */
+            uint64_t kf_sock_pcb;
+            /* Address of inp_ppcb. */
+            uint64_t kf_sock_inpcb;
+            /* Address of unp_conn. */
+            uint64_t kf_sock_unpconn;
+            /* Send buffer state. */
+            uint16_t kf_sock_snd_sb_state;
+            /* Receive buffer state. */
+            uint16_t kf_sock_rcv_sb_state;
+            /* Round to 64 bit alignment. */
+            uint32_t kf_sock_pad0;
+        } kf_sock;
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            /* Vnode type. */
+            int  kf_file_type;
+            /* Space for future use */
+            int  kf_spareint[3];
+            uint64_t kf_spareint64[30];
+            /* Vnode filesystem id. */
+            uint64_t kf_file_fsid;
+            /* File device. */
+            uint64_t kf_file_rdev;
+            /* Global file id. */
+            uint64_t kf_file_fileid;
+            /* File size. */
+            uint64_t kf_file_size;
+            /* Vnode filesystem id, FreeBSD 11 compat. */
+            uint32_t kf_file_fsid_freebsd11;
+            /* File device, FreeBSD 11 compat. */
+            uint32_t kf_file_rdev_freebsd11;
+#else
+            /* Global file id. */
+            uint64_t kf_file_fileid;
+            /* File size. */
+            uint64_t kf_file_size;
+            /* Vnode filesystem id. */
+            uint32_t kf_file_fsid;
+            /* File device. */
+            uint32_t kf_file_rdev;
+#endif
+            /* File mode. */
+            uint16_t kf_file_mode;
+            /* Round to 64 bit alignment. */
+            uint16_t kf_file_pad0;
+            uint32_t kf_file_pad1;
+        } kf_file;
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            uint32_t kf_spareint[4];
+            uint64_t kf_spareint64[32];
+#endif
+            uint32_t kf_sem_value;
+            uint16_t kf_sem_mode;
+        } kf_sem;
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            uint32_t kf_spareint[4];
+            uint64_t kf_spareint64[32];
+#endif
+            uint64_t kf_pipe_addr;
+            uint64_t kf_pipe_peer;
+            uint32_t kf_pipe_buffer_cnt;
+            /* Round to 64 bit alignment. */
+            uint32_t kf_pipe_pad0[3];
+        } kf_pipe;
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            uint32_t kf_spareint[4];
+            uint64_t kf_spareint64[32];
+            uint32_t kf_pts_dev_freebsd11;
+            uint32_t kf_pts_pad0;
+            uint64_t kf_pts_dev;
+            /* Round to 64 bit alignment. */
+            uint32_t kf_pts_pad1[4];
+#else
+            uint32_t kf_pts_dev;
+            /* Round to 64 bit alignment. */
+            uint32_t kf_pts_pad0[7];
+#endif
+        } kf_pts;
+        struct {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+            uint32_t kf_spareint[4];
+            uint64_t kf_spareint64[32];
+#endif
+            int32_t  kf_pid;
+        } kf_proc;
+    } kf_un;
+    uint16_t kf_status;  /* Status flags. */
+    uint16_t kf_pad1;  /* Round to 32 bit alignment. */
+    int32_t  _kf_ispare0;  /* Space for more stuff. */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1000000
+    target_cap_rights_t kf_cap_rights; /* Capability rights. */
+    uint64_t _kf_cap_spare; /* Space for future cap_rights_t. */
+#else /* ! __FreeBSD_version >= 1000000 */
+    uint64_t        kf_cap_rights;
+    int  _kf_ispare[4];
+#endif /* ! __FreeBSD_version >= 1000000 */
+
+#else /* ! __FreeBSD_version >= 900000 */
+    int  _kf_ispare[16];
+#endif /* ! __FreeBSD_version >= 900000 */
+    /* Truncated before copyout in sysctl */
+    char  kf_path[PATH_MAX]; /* Path to file, if any. */
+};
+
+struct target_kinfo_vmentry {
+    int32_t  kve_structsize;  /* Variable size of record. */
+    int32_t  kve_type;   /* Type of map entry. */
+    uint64_t kve_start;   /* Starting address. */
+    uint64_t kve_end;   /* Finishing address. */
+    uint64_t kve_offset;   /* Mapping offset in object */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    uint64_t kve_vn_fileid;   /* inode number if vnode */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+    uint32_t kve_vn_fsid_freebsd11;  /* dev_t of vnode location */
+#else
+    uint32_t kve_vn_fsid;   /* dev_t of vnode location */
+#endif
+#else /* !  __FreeBSD_version >= 900000 */
+    uint64_t kve_fileid;   /* inode number if vnode */
+    uint32_t kve_fsid;   /* dev_t of vnode location */
+#endif /* !  __FreeBSD_version >= 900000 */
+    int32_t  kve_flags;   /* Flags on map entry. */
+    int32_t  kve_resident;   /* Number of resident pages. */
+    int32_t  kve_private_resident;  /* Number of private pages. */
+    int32_t  kve_protection;  /* Protection bitmask. */
+    int32_t  kve_ref_count;   /* VM obj ref count. */
+    int32_t  kve_shadow_count;  /* VM obj shadow count. */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
+    int32_t  kve_vn_type;   /* Vnode type. */
+    uint64_t kve_vn_size;   /* File size. */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+    uint32_t kve_vn_rdev_freebsd11;  /* Device id if device. */
+#else
+    uint32_t kve_vn_rdev;   /* Device id if device. */
+#endif
+    uint16_t kve_vn_mode;   /* File mode. */
+    uint16_t kve_status;   /* Status flags. */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
+#if (__FreeBSD_version >= 1300501 && __FreeBSD_version < 1400000) ||    \
+    __FreeBSD_version >= 1400009
+    union {
+        uint64_t _kve_vn_fsid;  /* dev_t of vnode location */
+        uint64_t _kve_obj;  /* handle of anon obj */
+    } kve_type_spec;
+#define kve_vn_fsid kve_type_spec._kve_vn_fsid
+#define kve_obj  kve_type_spec._kve_obj
+#else
+    uint64_t kve_vn_fsid;   /* dev_t of vnode location */
+#endif
+    uint64_t kve_vn_rdev;   /* Device id if device. */
+    int  _kve_ispare[8];  /* Space for more stuff. */
+#else
+    int32_t  _kve_ispare[12];  /* Space for more stuff. */
+#endif
+#else /* !  __FreeBSD_version >= 900000 */
+    int  _kve_pad0;
+    int32_t  _kve_ispare[16];  /* Space for more stuff. */
+#endif /* !  __FreeBSD_version >= 900000 */
+    /* Truncated before copyout in sysctl */
+    char  kve_path[PATH_MAX];  /* Path to VM obj, if any. */
+};
+
+#endif /* ! _TARGET_OS_USER_H_ */
-- 
2.32.0


