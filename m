Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01974323AB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:18:50 +0200 (CEST)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVLe-0000Cm-0w
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8z-0007j1-Ht
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:46 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8m-0007zF-1H
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:44 -0400
Received: by mail-io1-xd2c.google.com with SMTP id i189so16939088ioa.1
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ak526YkqxWQ0k6zUzWsBpTYOajinFPk8HM2YsPPgGjk=;
 b=r0bubObGcyzJn/Ft78jwf4++hMYX0ze0wkoowb60204SL1pJ2wVqG9rMhuzx5sOvKx
 9kBAMYWN3BKr0fXZxX45pFAuQRMwTXFA6qZFU5AJlGzcLDgZrp5F+vyZ7yGBzGLIN90B
 uFj8wjnpA0g8zrkZZjRFSMh+7SSR8L6pEmPKa/u1LOy1IjMdkJRMAYPAUoH04iyUhUIh
 iPwHD81roFhX5qSnmx0D7xnWn9deA0luHdSeuSxwtl9FlzI7sBQsibqEFnUdegOo16tr
 eRVdBiPsj+Zno7LII7Bw1b6mRUonOG+hb+MM9gN7fJET8165GEtTsYpdua7L6i8T7VMv
 v+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ak526YkqxWQ0k6zUzWsBpTYOajinFPk8HM2YsPPgGjk=;
 b=iBogPMZcs0LkMuOVEPoqd5ls85VSEuH5vA9oJMeHBZdClvt2tU0qFPxviZDCCwtG25
 +RabQJF8PsclWapq1T3ykdfdbkiL+2GsbY3CnxrSEqaeJ2GEzdGTNw03yEvvFkHRdLvD
 gFg/C7s6+JYZS8DN5OU4R3YK5jgZ+BWPBw7voTIkskDOvP0ElnQG/ipj8kWiWZtGWo1n
 wLpycm6CQ2TczZiAN0J0PtipOMjAEO+VPcCdrj55R1KUQ1TH/UfIwv0l813mZwF22QQ8
 luUdBI6MM/uvKhZdlqzW5NYARQWJ6xjZKegse68+4yRycgAA3JJ4hPBpz03Nkvesc3eZ
 XdCg==
X-Gm-Message-State: AOAM533OHh0aTpcCwNSod25df4QM1nPuOJ0Ej9vevGFy9YNs9Vo5Gd+Z
 tw36MgTvVx7ewe4j282p0AQ/HXxqMPARrQ==
X-Google-Smtp-Source: ABdhPJzitzmzQpPyNcoleagtie3APbRp4DR6GYi12H6EIQ4JVK+0aGWZjNZjl31yXKkzVOfw4WeDxA==
X-Received: by 2002:a02:23c3:: with SMTP id u186mr485072jau.34.1634573125679; 
 Mon, 18 Oct 2021 09:05:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] bsd-user/target_os-user.h: Remove support for FreeBSD
 older than 12.0
Date: Mon, 18 Oct 2021 10:04:46 -0600
Message-Id: <20211018160458.1976-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/freebsd/target_os_user.h | 100 +-----------------------------
 1 file changed, 1 insertion(+), 99 deletions(-)

diff --git a/bsd-user/freebsd/target_os_user.h b/bsd-user/freebsd/target_os_user.h
index 95b1fa9f99..19892c5071 100644
--- a/bsd-user/freebsd/target_os_user.h
+++ b/bsd-user/freebsd/target_os_user.h
@@ -61,15 +61,7 @@ struct target_sockaddr_storage {
 /*
  * from sys/user.h
  */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
 #define TARGET_KI_NSPARE_INT        2
-#elif defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
-#define TARGET_KI_NSPARE_INT        4
-#elif defined(__FreeBSD_version) && __FreeBSD_version >= 1000000
-#define TARGET_KI_NSPARE_INT        7
-#else
-#define TARGET_KI_NSPARE_INT        9
-#endif /* ! __FreeBSD_version >= 1000000 */
 #define TARGET_KI_NSPARE_LONG       12
 #define TARGET_KI_NSPARE_PTR        6
 
@@ -116,11 +108,7 @@ struct target_kinfo_proc {
     int32_t     ki_tsid;            /* Terminal session ID */
     int16_t     ki_jobc;            /* job control counter */
     int16_t     ki_spare_short1;    /* unused (just here for alignment) */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
     int32_t     ki_tdev__freebsd11; /* controlling tty dev */
-#else
-    int32_t     ki_tdev;            /* controlling tty dev */
-#endif
     target_sigset_t ki_siglist;     /* Signals arrived but not delivered */
     target_sigset_t ki_sigmask;     /* Current signal mask */
     target_sigset_t ki_sigignore;   /* Signals being ignored */
@@ -164,45 +152,24 @@ struct target_kinfo_proc {
     int8_t      ki_nice;            /* Process "nice" value */
     char        ki_lock;            /* Process lock (prevent swap) count */
     char        ki_rqindex;         /* Run queue index */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
     u_char      ki_oncpu_old;       /* Which cpu we are on (legacy) */
     u_char      ki_lastcpu_old;     /* Last cpu we were on (legacy) */
-#else
-    u_char      ki_oncpu;           /* Which cpu we are on */
-    u_char      ki_lastcpu;         /* Last cpu we were on */
-#endif /* ! __FreeBSD_version >= 1100000 */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     char        ki_tdname[TARGET_TDNAMLEN + 1];  /* thread name */
-#else
-    char        ki_ocomm[TARGET_TDNAMLEN + 1];   /* thread name */
-#endif /* ! __FreeBSD_version >= 900000 */
     char        ki_wmesg[TARGET_WMESGLEN + 1];   /* wchan message */
     char        ki_login[TARGET_LOGNAMELEN + 1]; /* setlogin name */
     char        ki_lockname[TARGET_LOCKNAMELEN + 1]; /* lock name */
     char        ki_comm[TARGET_COMMLEN + 1];     /* command name */
     char        ki_emul[TARGET_KI_EMULNAMELEN + 1];  /* emulation name */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     char        ki_loginclass[TARGET_LOGINCLASSLEN + 1]; /* login class */
-#endif /* ! __FreeBSD_version >= 900000 */
 
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     char        ki_sparestrings[50];    /* spare string space */
-#else
-    char        ki_sparestrings[68];    /* spare string space */
-#endif /* ! __FreeBSD_version >= 900000 */
     int32_t     ki_spareints[TARGET_KI_NSPARE_INT]; /* spare room for growth */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
- uint64_t ki_tdev;  /* controlling tty dev */
-#endif
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1100000
+    uint64_t ki_tdev;  /* controlling tty dev */
     int32_t     ki_oncpu;           /* Which cpu we are on */
     int32_t     ki_lastcpu;         /* Last cpu we were on */
     int32_t     ki_tracer;          /* Pid of tracing process */
-#endif /* __FreeBSD_version >= 1100000 */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     int32_t     ki_flag2;           /* P2_* flags */
     int32_t     ki_fibnum;          /* Default FIB number */
-#endif /* ! __FreeBSD_version >= 900000 */
     uint32_t    ki_cr_flags;        /* Credential flags */
     int32_t     ki_jid;             /* Process jail ID */
     int32_t     ki_numthreads;      /* XXXKSE number of threads in total */
@@ -234,18 +201,8 @@ struct target_kinfo_file {
     int32_t  kf_flags;  /* Flags. */
     int32_t  kf_pad0;  /* Round to 64 bit alignment. */
     int64_t  kf_offset;  /* Seek location. */
-#if defined(__FreeBSD_version) && __FreeBSD_version < 1200031
-    int32_t  kf_vnode_type;  /* Vnode type. */
-    int32_t  kf_sock_domain;  /* Socket domain. */
-    int32_t  kf_sock_type;  /* Socket type. */
-    int32_t  kf_sock_protocol; /* Socket protocol. */
-    struct target_sockaddr_storage kf_sa_local; /* Socket address. */
-    struct target_sockaddr_storage kf_sa_peer; /* Peer address. */
-#endif
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     union {
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             uint32_t kf_spareint;
             /* Socket domain. */
             int  kf_sock_domain0;
@@ -257,7 +214,6 @@ struct target_kinfo_file {
             struct sockaddr_storage kf_sa_local;
             /* Peer address. */
             struct sockaddr_storage kf_sa_peer;
-#endif
             /* Address of so_pcb. */
             uint64_t kf_sock_pcb;
             /* Address of inp_ppcb. */
@@ -272,7 +228,6 @@ struct target_kinfo_file {
             uint32_t kf_sock_pad0;
         } kf_sock;
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             /* Vnode type. */
             int  kf_file_type;
             /* Space for future use */
@@ -290,16 +245,6 @@ struct target_kinfo_file {
             uint32_t kf_file_fsid_freebsd11;
             /* File device, FreeBSD 11 compat. */
             uint32_t kf_file_rdev_freebsd11;
-#else
-            /* Global file id. */
-            uint64_t kf_file_fileid;
-            /* File size. */
-            uint64_t kf_file_size;
-            /* Vnode filesystem id. */
-            uint32_t kf_file_fsid;
-            /* File device. */
-            uint32_t kf_file_rdev;
-#endif
             /* File mode. */
             uint16_t kf_file_mode;
             /* Round to 64 bit alignment. */
@@ -307,18 +252,14 @@ struct target_kinfo_file {
             uint32_t kf_file_pad1;
         } kf_file;
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             uint32_t kf_spareint[4];
             uint64_t kf_spareint64[32];
-#endif
             uint32_t kf_sem_value;
             uint16_t kf_sem_mode;
         } kf_sem;
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             uint32_t kf_spareint[4];
             uint64_t kf_spareint64[32];
-#endif
             uint64_t kf_pipe_addr;
             uint64_t kf_pipe_peer;
             uint32_t kf_pipe_buffer_cnt;
@@ -326,7 +267,6 @@ struct target_kinfo_file {
             uint32_t kf_pipe_pad0[3];
         } kf_pipe;
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             uint32_t kf_spareint[4];
             uint64_t kf_spareint64[32];
             uint32_t kf_pts_dev_freebsd11;
@@ -334,34 +274,18 @@ struct target_kinfo_file {
             uint64_t kf_pts_dev;
             /* Round to 64 bit alignment. */
             uint32_t kf_pts_pad1[4];
-#else
-            uint32_t kf_pts_dev;
-            /* Round to 64 bit alignment. */
-            uint32_t kf_pts_pad0[7];
-#endif
         } kf_pts;
         struct {
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
             uint32_t kf_spareint[4];
             uint64_t kf_spareint64[32];
-#endif
             int32_t  kf_pid;
         } kf_proc;
     } kf_un;
     uint16_t kf_status;  /* Status flags. */
     uint16_t kf_pad1;  /* Round to 32 bit alignment. */
     int32_t  _kf_ispare0;  /* Space for more stuff. */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1000000
     target_cap_rights_t kf_cap_rights; /* Capability rights. */
     uint64_t _kf_cap_spare; /* Space for future cap_rights_t. */
-#else /* ! __FreeBSD_version >= 1000000 */
-    uint64_t        kf_cap_rights;
-    int  _kf_ispare[4];
-#endif /* ! __FreeBSD_version >= 1000000 */
-
-#else /* ! __FreeBSD_version >= 900000 */
-    int  _kf_ispare[16];
-#endif /* ! __FreeBSD_version >= 900000 */
     /* Truncated before copyout in sysctl */
     char  kf_path[PATH_MAX]; /* Path to file, if any. */
 };
@@ -372,34 +296,19 @@ struct target_kinfo_vmentry {
     uint64_t kve_start;   /* Starting address. */
     uint64_t kve_end;   /* Finishing address. */
     uint64_t kve_offset;   /* Mapping offset in object */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     uint64_t kve_vn_fileid;   /* inode number if vnode */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
     uint32_t kve_vn_fsid_freebsd11;  /* dev_t of vnode location */
-#else
-    uint32_t kve_vn_fsid;   /* dev_t of vnode location */
-#endif
-#else /* !  __FreeBSD_version >= 900000 */
-    uint64_t kve_fileid;   /* inode number if vnode */
-    uint32_t kve_fsid;   /* dev_t of vnode location */
-#endif /* !  __FreeBSD_version >= 900000 */
     int32_t  kve_flags;   /* Flags on map entry. */
     int32_t  kve_resident;   /* Number of resident pages. */
     int32_t  kve_private_resident;  /* Number of private pages. */
     int32_t  kve_protection;  /* Protection bitmask. */
     int32_t  kve_ref_count;   /* VM obj ref count. */
     int32_t  kve_shadow_count;  /* VM obj shadow count. */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 900000
     int32_t  kve_vn_type;   /* Vnode type. */
     uint64_t kve_vn_size;   /* File size. */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
     uint32_t kve_vn_rdev_freebsd11;  /* Device id if device. */
-#else
-    uint32_t kve_vn_rdev;   /* Device id if device. */
-#endif
     uint16_t kve_vn_mode;   /* File mode. */
     uint16_t kve_status;   /* Status flags. */
-#if defined(__FreeBSD_version) && __FreeBSD_version >= 1200031
 #if (__FreeBSD_version >= 1300501 && __FreeBSD_version < 1400000) ||    \
     __FreeBSD_version >= 1400009
     union {
@@ -413,13 +322,6 @@ struct target_kinfo_vmentry {
 #endif
     uint64_t kve_vn_rdev;   /* Device id if device. */
     int  _kve_ispare[8];  /* Space for more stuff. */
-#else
-    int32_t  _kve_ispare[12];  /* Space for more stuff. */
-#endif
-#else /* !  __FreeBSD_version >= 900000 */
-    int  _kve_pad0;
-    int32_t  _kve_ispare[16];  /* Space for more stuff. */
-#endif /* !  __FreeBSD_version >= 900000 */
     /* Truncated before copyout in sysctl */
     char  kve_path[PATH_MAX];  /* Path to VM obj, if any. */
 };
-- 
2.32.0


