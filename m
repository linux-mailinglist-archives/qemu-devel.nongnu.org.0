Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057856DCAB3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:23:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8z-0002ku-2C; Mon, 10 Apr 2023 14:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8l-0002fx-9s
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:20 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8j-0000iD-KI
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:19 -0400
Received: by mail-il1-x134.google.com with SMTP id a4so2738587ilj.10
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7NzCz/sF8P038tTGJ2ITOmZzOTs2PdrJIGIXZvdsTJ8=;
 b=ecAPfMBzq417wv/NZczxAcrMdjbGFD3io1X0BxUrqs0RI5QdVQ74Xy95FnMxjDNX7q
 mhV7K7vpzA4S1dxx4lmJhNJe8alIBCqAkSK+kcmwRARK568f8DRf0ur4IsZBog6sFTKf
 tFK0oYcsQgTUDAVn0GQ2vdxqooGKtE3sMUlvmxZUOl9IcAokrnJulumlvSjacYI3aZn8
 W9vGzhcDI8SW6+l6PpWby/VZoWmYqljdlLaN6/ASLP84aLNOTnMAGZMJtcOwP5ZbbLMK
 JKXUpCJ/M8nXX5ACeSZ11rwyIcPexWGpgeBSI2z9HIi1P54o2fz9FZw03hQ0M/9d6gBz
 jNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7NzCz/sF8P038tTGJ2ITOmZzOTs2PdrJIGIXZvdsTJ8=;
 b=g0dfXaxYy+Sq/qqLE6burTmzFL4nZw9RpZO6QDeiJMp34droBz/u1g0vOpmsUoy5v+
 +yrOwe3l/5cahHxnQO02+/gI0IfFsx4fjaZCC+veYDUmxBeWT6jnoEfm+sj125BBkxMk
 CCukIBDcxG5ip669OZyVJAWgwvLgucRQxpxfQd5y/2nZ+SwTF8gOVJsF79iHC/R2dWM/
 M+JJDcP6+Ui5BgZPU+wkm+F4aKGNMN1jQDeIH25L0zZ7fZBg3cETV2MA5O3wJJKArPo+
 nyGQ7IOvIK9nQA0MmjZZ1t4GGtnpkyix3SfFzJevND3F7qMXc1gbVvRRboAQ0cXz8Vfl
 MJiw==
X-Gm-Message-State: AAQBX9f1DlRKjgjrIz7XA17Ki7uve6CYDXEFrdTSI/L0o0ZrjesQJBXH
 O09VSbteCJbsJxsnRE4Rg5opyVKVd/hd0o60ewE=
X-Google-Smtp-Source: AKy350bfaVZkOBdfBxxRuTm7ncic+uK3tIU23MpJTORJoRgz8LLeh9vt6INQYboijhA6Hp5YSTe06Q==
X-Received: by 2002:a92:c642:0:b0:31f:9b6e:2f4d with SMTP id
 2-20020a92c642000000b0031f9b6e2f4dmr6665159ill.0.1681150876262; 
 Mon, 10 Apr 2023 11:21:16 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 12/19] bsd-user: Implement do_sysctl_kern_proc_vmmap
Date: Mon, 10 Apr 2023 12:20:49 -0600
Message-Id: <20230410182056.320-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


