Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60216D89BB
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 23:38:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkAoH-0005P2-EI; Wed, 05 Apr 2023 17:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo4-0005JE-4g
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:41 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pkAo2-0005aC-9Y
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 17:36:39 -0400
Received: by mail-il1-x135.google.com with SMTP id r19so8262985ilj.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 14:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680730597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qJNLRgyd/jIgyJneOYfM0Kr8qQRycbIc/fkXEn+sSrU=;
 b=uUO6WxH2kbAWThoR0jrwvaZTmse66nZ4/+t5s4yfRY+BNvIdoK6lv5ojMJbpKm6VlN
 3lTdWPchKqAMf3k+KSPcW9T68uFqtmqp0Nw5twfswNRBT0v+bxOXsAcoZrakgJM0E2Nv
 ckrNtUYOJF44We3CHb/4/xViuSk/WUukqfe1DqlGgtKqVQsHcdK1ZNSxlrAHwf5pw+WH
 7Q1x+p+8C6YTe3GTmqXdVeC0L1jfwNQ3ogzslsUIHIDxnI2+PJoHz+tuqBCRdn391i0J
 74z37vaF1oLbtMlWkkFGwHycmOcLKxb43ncoDuRI05Oukhaiw6B3URPRARrvMYKx0OWS
 V6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680730597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJNLRgyd/jIgyJneOYfM0Kr8qQRycbIc/fkXEn+sSrU=;
 b=nb50pg8lDIGYFzujC7/mglu7gXH3RK7odtkL/xLV9TJvN8rhuHvrN2UmjnThq/6UpX
 RlOhYmhg1TQ2MKaxIOjtOB7f1NUGrWjkbUBMqVZDKhvEU9xG85Z1yre685dM05UD+S2L
 qGgZd3kn843Eyz5LUL7E/tJGEYQGjc1a7A0/lk/3MKrOAEi7JNxyToedWL8Z2KUxAWgQ
 Kdd+xUWfk9gU0nObeMOi5hWKPl9oxHJ/oWqX9b6Zcu0LpCkHEp4dkKAkBoMgGIoc2yEJ
 jVTS3u4Ovfo1kTD0K4tRiq6EG4DQ1EmjbIfg6nMrkVetDfkIVqw/6fB7iNm67kcCl0zV
 0i3w==
X-Gm-Message-State: AAQBX9c5w9jhV4WxJYQumPcgd9YYcOOxEk20WKKIpfPPpfhYdhjTkby0
 xm8pqTA/XQzkGIronLfjR9nELiSeW3wYGuBKuTc=
X-Google-Smtp-Source: AKy350a2qyPhBWvjotUXd7YP52Fb2hWThMhIhOJDIXukyTPkklaobnNFZyTJPRTgZf2f7aTm00vtBg==
X-Received: by 2002:a92:c8c7:0:b0:326:198b:a8eb with SMTP id
 c7-20020a92c8c7000000b00326198ba8ebmr5061924ilq.9.1680730597223; 
 Wed, 05 Apr 2023 14:36:37 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 i18-20020a926d12000000b003261b6acc8asm4110473ilc.79.2023.04.05.14.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 14:36:36 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: reinoud@netbsd.org, riastradh@netbsd.org, ryoon@netbsd.org,
 jrtc27@jrtc27.com, Warner Losh <imp@bsdimp.com>, kevans@freebsd.org,
 Brad Smith <brad@comstyle.com>, Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 12/16] bsd-user: Implement do_sysctl_kern_proc_vmmap
Date: Wed,  5 Apr 2023 15:36:08 -0600
Message-Id: <20230405213612.15942-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405213612.15942-1-imp@bsdimp.com>
References: <20230405213612.15942-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
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

Implement do_sysctl_kern_proc_vmmap. This pulls kern.proc.vmmap out of
the host kernel and converts it to the guest's format.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-sys.c | 115 ++++++++++++++++++++++++++++++++++++++
 bsd-user/qemu.h           |   3 +
 2 files changed, 118 insertions(+)

diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
index 00b2dcc9641..418358adc1e 100644
--- a/bsd-user/freebsd/os-sys.c
+++ b/bsd-user/freebsd/os-sys.c
@@ -463,6 +463,121 @@ do_sysctl_kern_proc_filedesc(int pid, size_t olen,
     return ret;
 }
 
+static void
+host_to_target_kinfo_vmentry(struct target_kinfo_vmentry *tkve,
+        struct kinfo_vmentry *hkve)
+{
+
+    __put_user(hkve->kve_structsize, &tkve->kve_structsize);
+    __put_user(hkve->kve_type, &tkve->kve_type);
+    __put_user(hkve->kve_start, &tkve->kve_start);
+    __put_user(hkve->kve_end, &tkve->kve_end);
+    __put_user(hkve->kve_offset, &tkve->kve_offset);
+    __put_user(hkve->kve_vn_fileid, &tkve->kve_vn_fileid);
+    __put_user(hkve->kve_vn_fsid_freebsd11, &tkve->kve_vn_fsid_freebsd11);
+    __put_user(hkve->kve_vn_fsid, &tkve->kve_vn_fsid);
+    __put_user(hkve->kve_flags, &tkve->kve_flags);
+    __put_user(hkve->kve_resident, &tkve->kve_resident);
+    __put_user(hkve->kve_private_resident, &tkve->kve_private_resident);
+    __put_user(hkve->kve_protection, &tkve->kve_protection);
+    __put_user(hkve->kve_ref_count, &tkve->kve_ref_count);
+    __put_user(hkve->kve_shadow_count, &tkve->kve_shadow_count);
+    __put_user(hkve->kve_vn_type, &tkve->kve_vn_type);
+    __put_user(hkve->kve_vn_size, &tkve->kve_vn_size);
+    __put_user(hkve->kve_vn_rdev_freebsd11, &tkve->kve_vn_rdev_freebsd11);
+    __put_user(hkve->kve_vn_rdev, &tkve->kve_vn_rdev);
+    __put_user(hkve->kve_vn_mode, &tkve->kve_vn_mode);
+    __put_user(hkve->kve_status, &tkve->kve_status);
+    strncpy(tkve->kve_path, hkve->kve_path, sizeof(tkve->kve_path));
+}
+
+abi_long
+do_sysctl_kern_proc_vmmap(int pid, size_t olen,
+        struct target_kinfo_vmentry *tkve, size_t *tlen)
+{
+    abi_long ret;
+    int mib[4], sz;
+    size_t len;
+    char *buf, *bp, *eb, *tp;
+    struct kinfo_vmentry *kve, kvme;
+    struct target_kinfo_vmentry target_kvme;
+
+    if (tlen == NULL) {
+        return -TARGET_EINVAL;
+    }
+
+    len = 0;
+    mib[0] = CTL_KERN;
+    mib[1] = KERN_PROC;
+    mib[2] = KERN_PROC_VMMAP;
+    mib[3] = pid;
+
+    ret = get_errno(sysctl(mib, 4, NULL, &len, NULL, 0));
+    if (is_error(ret)) {
+        return ret;
+    }
+    if (tkve == NULL) {
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
+     * the kernel may be differents sizes per record we have
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
+        kve = (struct kinfo_vmentry *)(uintptr_t)bp;
+        bp += kve->kve_structsize;
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
+    tp = (char *)tkve;
+    while (bp < eb) {
+        kve = (struct kinfo_vmentry *)(uintptr_t)bp;
+        sz = kve->kve_structsize;
+        /* Copy/expand into a zeroed buffer */
+        memset(&kvme, 0, sizeof(kvme));
+        memcpy(&kvme, kve, sz);
+        /* Byte swap and copy into a target aligned buffer. */
+        host_to_target_kinfo_vmentry(&target_kvme, &kvme);
+        /* Copy target buffer to user buffer, packed. */
+        memcpy(tp, &target_kvme, sz);
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
index 5926bdcc101..aed0d481cba 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -260,10 +260,13 @@ int host_to_target_errno(int err);
 /* os-sys.c */
 struct target_kinfo_proc;
 struct target_kinfo_file;
+struct target_kinfo_vmentry;
 abi_long do_sysctl_kern_getprocs(int op, int arg, size_t olen,
         struct target_kinfo_proc *tki, size_t *tlen);
 abi_long do_sysctl_kern_proc_filedesc(int pid, size_t olen,
         struct target_kinfo_file *tkif, size_t *tlen);
+abi_long do_sysctl_kern_proc_vmmap(int pid, size_t olen,
+        struct target_kinfo_vmentry *tkve, size_t *tlen);
 abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t namelen,
         abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong newlen);
 abi_long do_freebsd_sysctlbyname(CPUArchState *env, abi_ulong namep,
-- 
2.40.0


