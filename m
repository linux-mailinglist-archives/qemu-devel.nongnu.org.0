Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F2B6D89BA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoI-0005Q0-Gh; Wed, 05 Apr 2023 17:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo4-0005JC-4t
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:41 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo2-0005c3-4w
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:39 -0400
Received: by mail-il1-x132.google.com with SMTP id j2so12494889ila.8
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqUvsNtt8LU1jK0PKJqgb4Y1fta0i6VhS1aSO5xc5ho=;
 b=clDytpwB84ZPBsuzb0HIvYi+hCeLRXX/vOMcYAHOL1dd4GOapBdXVFfKRZUE8dxPnO
 7GZLPNGuc5zkThqU/Cr9kZrSHjdUJnFX0By+v4KcAvn5nm9AtK1BZgG7446VcWYFgbNH
 FTgvQ2C7NGTYEKfgzc12FBWEJ0BOk/BS3PVmReuy6F6nPYyyALB50EO5UEUapZ9LTsie
 3dCvMOSFhl6OB97WPBoK+Zepa2fI6TEhUgNWYL7nqoo5ral/GlYCSL0IUVE52jRyIISU
 G6XKqEbPJEhLsMxGdsZPCjDGTaNDP0y04xQzI26GedvC6ymkadl6J/q/Dq0DXY7k3tsO
 ppfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqUvsNtt8LU1jK0PKJqgb4Y1fta0i6VhS1aSO5xc5ho=;
 b=zDr6P/zcH9tRP5y2PaUuHjnnk8rgCYaFyPep0fAbRHSs/9NFlzCXinPEFnzOeor7l3
 41d4jHCQuzPR8+NfpfZtZKb0+xHJAYP5z1aT9IcIo4bVsZvtLQ0nI6En/QvOr7Rnl6OW
 9SFQM23CCn2nMi+D4xeWgJIULeo850gBP9DqvsAcSqNlFccEt6fy95qnaWlPoiAlfCLb
 QoHQB2fzFuoEH1QbSVG5oHPw0iZ9EgEDk0xd3EW3zmOTgP3cumjwBIDM9/jiL2e3EDK4
 JKP0KUJdY4bNIZW4yrwI4OA4nQO3DmZ/RgB3fSwV2qTCBNInnFQa81WZcJNC7xti7ZZz
 M9Gg==
X-Gm-Message-State: AAQBX9d+GJ2Sog+JnG8jiZpeo80PBwDNqsgfJGoqOKKA64wfJ6nD1q89
 C/Mw4EG5ojaiOI9VPr7HEWQMoRzBXKU4HyPP220=
X-Google-Smtp-Source: AKy350Z84qMxCgKlj+3/PcZCCSvnvcmNvF/GyuZ08rYxTTyqkYXDVt8YU01eWSghhO74QCM/o1vShg==
X-Received: by 2002:a92:d249:0:b0:326:5469:119a with SMTP id
 v9-20020a92d249000000b003265469119amr5422565ilg.28.1680730596167; 
 Wed, 05 Apr 2023 14:36:36 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 11/16] bsd-user: Implement do_sysctl_kern_proc_filedesc
Date: Wed,  5 Apr 2023 15:36:07 -0600
Message-Id: <20230405213612.15942-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

Implement do_sysctl_kern_proc_filedesc. This pulls kern.proc.filedesc
out of the host kernel and converts it to the guest's format.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 193 ++++++++++++++++++++++++++++++++++++++
 bsd-user/qemu.h           |   3 +
 2 files changed, 196 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index d4a6dcc6c2b..00b2dcc9641 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -270,6 +270,199 @@ do_sysctl_kern_getprocs(int op, int arg, size_t olen,
     return ret;
 }
 
+static void
+host_to_target_kinfo_file(struct target_kinfo_file *tkif,
+        struct kinfo_file *hkif)
+{
+    int type = hkif->kf_type;
+
+    __put_user(hkif->kf_structsize, &tkif->kf_structsize);
+    __put_user(hkif->kf_type, &tkif->kf_type);
+    __put_user(hkif->kf_fd, &tkif->kf_fd);
+    __put_user(hkif->kf_ref_count, &tkif->kf_ref_count);
+    __put_user(hkif->kf_flags, &tkif->kf_flags);
+    __put_user(hkif->kf_offset, &tkif->kf_offset);
+    switch (type) {
+    case TARGET_KF_TYPE_FIFO:
+    case TARGET_KF_TYPE_SHM:
+    case TARGET_KF_TYPE_VNODE:
+        __put_user(hkif->kf_un.kf_file.kf_file_type,
+                &tkif->kf_un.kf_file.kf_file_type);
+        __put_user(hkif->kf_un.kf_file.kf_file_fsid,
+                &tkif->kf_un.kf_file.kf_file_fsid);
+        __put_user(hkif->kf_un.kf_file.kf_file_rdev,
+                &tkif->kf_un.kf_file.kf_file_rdev);
+        __put_user(hkif->kf_un.kf_file.kf_file_fileid,
+                &tkif->kf_un.kf_file.kf_file_fileid);
+        __put_user(hkif->kf_un.kf_file.kf_file_size,
+                &tkif->kf_un.kf_file.kf_file_size);
+        __put_user(hkif->kf_un.kf_file.kf_file_fsid_freebsd11,
+                &tkif->kf_un.kf_file.kf_file_fsid_freebsd11);
+        __put_user(hkif->kf_un.kf_file.kf_file_rdev_freebsd11,
+                &tkif->kf_un.kf_file.kf_file_rdev_freebsd11);
+        __put_user(hkif->kf_un.kf_file.kf_file_mode,
+                &tkif->kf_un.kf_file.kf_file_mode);
+        break;
+
+    case TARGET_KF_TYPE_SOCKET:
+        __put_user(hkif->kf_un.kf_sock.kf_sock_domain0,
+                &tkif->kf_un.kf_sock.kf_sock_domain0);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_type0,
+                &tkif->kf_un.kf_sock.kf_sock_type0);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_protocol0,
+                &tkif->kf_un.kf_sock.kf_sock_protocol0);
+/*  XXX - Implement copy function for sockaddr_storage
+        host_to_target_copy_sockaddr_storage(
+                &hkif->kf_un.kf_file.kf_sa_local,
+                &kif->kf_un.kf_file.kf_sa_local);
+        host_to_target_copy_sockaddr_storage(
+                &hkif->kf_un.kf_file.kf_sa_peer,
+                &kif->kf_un.kf_file.kf_sa_peer);
+*/
+        __put_user(hkif->kf_un.kf_sock.kf_sock_pcb,
+                &tkif->kf_un.kf_sock.kf_sock_pcb);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_inpcb,
+                &tkif->kf_un.kf_sock.kf_sock_inpcb);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_unpconn,
+                &tkif->kf_un.kf_sock.kf_sock_unpconn);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_snd_sb_state,
+                &tkif->kf_un.kf_sock.kf_sock_snd_sb_state);
+        __put_user(hkif->kf_un.kf_sock.kf_sock_rcv_sb_state,
+                &tkif->kf_un.kf_sock.kf_sock_rcv_sb_state);
+        break;
+
+    case TARGET_KF_TYPE_PIPE:
+        __put_user(hkif->kf_un.kf_pipe.kf_pipe_addr,
+                &tkif->kf_un.kf_pipe.kf_pipe_addr);
+        __put_user(hkif->kf_un.kf_pipe.kf_pipe_peer,
+                &tkif->kf_un.kf_pipe.kf_pipe_peer);
+        __put_user(hkif->kf_un.kf_pipe.kf_pipe_buffer_cnt,
+                &tkif->kf_un.kf_pipe.kf_pipe_buffer_cnt);
+        break;
+
+    case TARGET_KF_TYPE_SEM:
+        __put_user(hkif->kf_un.kf_sem.kf_sem_value,
+                &tkif->kf_un.kf_sem.kf_sem_value);
+        __put_user(hkif->kf_un.kf_sem.kf_sem_mode,
+                &tkif->kf_un.kf_sem.kf_sem_mode);
+        break;
+
+    case TARGET_KF_TYPE_PTS:
+        __put_user(hkif->kf_un.kf_pts.kf_pts_dev_freebsd11,
+                &tkif->kf_un.kf_pts.kf_pts_dev_freebsd11);
+        __put_user(hkif->kf_un.kf_pts.kf_pts_dev,
+                &tkif->kf_un.kf_pts.kf_pts_dev);
+        break;
+
+    case TARGET_KF_TYPE_PROCDESC:
+        __put_user(hkif->kf_un.kf_proc.kf_pid,
+                &tkif->kf_un.kf_proc.kf_pid);
+        break;
+
+
+    case TARGET_KF_TYPE_CRYPTO:
+    case TARGET_KF_TYPE_KQUEUE:
+    case TARGET_KF_TYPE_MQUEUE:
+    case TARGET_KF_TYPE_NONE:
+    case TARGET_KF_TYPE_UNKNOWN:
+    default:
+        /* Do nothing. */
+        break;
+    }
+    __put_user(hkif->kf_status, &tkif->kf_status);
+    for (int i = 0; i < (CAP_RIGHTS_VERSION + 2); i++)
+        __put_user(hkif->kf_cap_rights.cr_rights[i],
+                &tkif->kf_cap_rights.cr_rights[i]);
+    strncpy(tkif->kf_path, hkif->kf_path, sizeof(tkif->kf_path));
+}
+
+abi_long
+do_sysctl_kern_proc_filedesc(int pid, size_t olen,
+        struct target_kinfo_file *tkif, size_t *tlen)
+{
+    abi_long ret;
+    int mib[4], sz;
+    size_t len;
+    char *buf, *bp, *eb, *tp;
+    struct kinfo_file *kf, kif;
+    struct target_kinfo_file target_kif;
+
+    if (tlen == NULL) {
+        return -TARGET_EINVAL;
+    }
+
+    len = 0;
+    mib[0] = CTL_KERN;
+    mib[1] = KERN_PROC;
+    mib[2] = KERN_PROC_FILEDESC;
+    mib[3] = pid;
+
+    ret = get_errno(sysctl(mib, 4, NULL, &len, NULL, 0));
+    if (is_error(ret)) {
+        return ret;
+    }
+    if (tkif == NULL) {
+        *tlen = len;
+        return ret;
+    }
+    len = len * 4 / 3;
+    buf = g_malloc(len);
+    if (buf == NULL) {
+        return -TARGET_ENOMEM;
+    }
+
+    /*
+     * Count the number of records.
+     *
+     * Given that the kinfo_file information returned by
+     * the kernel may be different sizes per record we have
+     * to read it in and count the variable length records
+     * by walking them.
+     */
+    ret = get_errno(sysctl(mib, 4, buf, &len, NULL, 0));
+    if (is_error(ret)) {
+        g_free(buf);
+        return ret;
+    }
+    *tlen = len;
+    bp = buf;
+    eb = buf + len;
+    while (bp < eb) {
+        kf = (struct kinfo_file *)(uintptr_t)bp;
+        bp += kf->kf_structsize;
+    }
+    if (olen < *tlen) {
+        g_free(buf);
+        return -TARGET_EINVAL;
+    }
+
+    /*
+     * Unpack the records from the kernel into full length records
+     * and byte swap, if needed.
+     */
+    bp = buf;
+    eb = buf + len;
+    tp = (char *)tkif;
+    while (bp < eb) {
+        kf = (struct kinfo_file *)(uintptr_t)bp;
+        sz = kf->kf_structsize;
+        /* Copy/expand into a zeroed buffer */
+        memset(&kif, 0, sizeof(kif));
+        memcpy(&kif, kf, sz);
+        /* Byte swap and copy into a target buffer. */
+        host_to_target_kinfo_file(&target_kif, &kif);
+        /* Copy target buffer to user buffer and pack */
+        memcpy(tp, &target_kif, sz);
+        /* Advance to next packed record. */
+        bp += sz;
+        /* Advance to next packed, target record. */
+        tp += sz;
+    }
+
+    g_free(buf);
+    return ret;
+}
+
 /*
  * This uses the undocumented oidfmt interface to find the kind of a requested
  * sysctl, see /sys/kern/kern_sysctl.c:sysctl_sysctl_oidfmt() (compare to
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index fcaf794ad6e..5926bdcc101 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -259,8 +259,11 @@ int host_to_target_errno(int err);
 
 /* os-sys.c */
 struct target_kinfo_proc;
+struct target_kinfo_file;
 abi_long do_sysctl_kern_getprocs(int op, int arg, size_t olen,
         struct target_kinfo_proc *tki, size_t *tlen);
+abi_long do_sysctl_kern_proc_filedesc(int pid, size_t olen,
+        struct target_kinfo_file *tkif, size_t *tlen);
 abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
         abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
 abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
-- 
2.40.0


