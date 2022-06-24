Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B286A55A3F0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 23:50:36 +0200 (CEST)
Received: from localhost ([::1]:60570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rCF-0005cT-RK
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 17:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9A-0002dm-Kn
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:24 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:35597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r98-0007Uu-8y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:24 -0400
Received: by mail-io1-xd29.google.com with SMTP id y18so4035469iof.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgwQMyFdeqw2DWHzdfLeOHQc+nkcKWljBJRsPafIN7M=;
 b=s3UhAv4g+srghjS3y4MIrcu9SPG1dV7GiScVTDuqGe07oOHaw4r9nKc4zKq3vadQ11
 ozLyIGg7tDeUT4X/xhi2Q3zNNPoWhBhgpt2VZiXTT1nkKKiQIVdX+ZCWmpp3hFfT/goQ
 N9x2TkYKqhYlyBGbO3AD+Sa0u/g9VXa297CDF1UvXHPUUkgofL8pT0ARiySAZfmNfi2E
 +qJCAP8AVZWhHNnV1dM1jO2KUmmG6/1OsDm/+gRce7lRvvyAopBy2hYYf1lo+yA64pZW
 Ii8yK5RThfjLxWJ09XR3d1obf8KlUgY10s1074ADoCZTKdnGk/5NNA3uWQ0XRhHm2Nrg
 NDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgwQMyFdeqw2DWHzdfLeOHQc+nkcKWljBJRsPafIN7M=;
 b=ZjSYvu/Z1iB+aJbbiShPdx5ZIis8lVH2R/qfgsjgP42AebAm3u50JTFQRaFhtM/AyO
 sa+dsa45wKcYPX0/to9HrCwFd94vw/Pca7uhWioa4svmY2SbPoM+qzFHRkov5qiuv3jc
 eOwt7i801fYcYoCB20cgBHwOSGseCoc+BTXNJEvwnqbQ8NU1WlbZu0b5Bqs9mD/J8F3w
 NHhgBZRFSOuVSLFP3aF+yfeB+FWTUAkWo9VdNLQwAYsPlKMUB3+L+T1aU9gaLNMObUhg
 kwARhxeuWMA8WCzxWyJco7kAztDZbLoVlvart+0kFD5Zx6p742XIeL3iVtkKqk1ZCQ7u
 pUJQ==
X-Gm-Message-State: AJIora9lUUmeTv+6Y7CvgNs4hP2+xKU6F9wvSBXvsoDeylb1R3lrkqDk
 PwCv8bhClp5FmT/lRQyGIRSDWTRRf5MB5Q==
X-Google-Smtp-Source: AGRyM1uWFCSZNEAfDhSJj2DantDnc6+Tzu1XkyXq0FhirL/p64GsV5b2LOm9DR18uNm7dQXf5CZ5eg==
X-Received: by 2002:a05:6602:1410:b0:657:86b8:e641 with SMTP id
 t16-20020a056602141000b0065786b8e641mr562199iov.188.1656107240990; 
 Fri, 24 Jun 2022 14:47:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>, Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PATCH v2 02/11] bsd-user: Implement symlink, symlinkat,
 readlink and readlinkat
Date: Fri, 24 Jun 2022 15:47:33 -0600
Message-Id: <20220624214742.89229-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 74 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++
 2 files changed, 90 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a0f03102639..635ac8d0e62 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -601,4 +601,78 @@ static abi_long do_bsd_nmount(abi_long arg1, abi_long count,
     return ret;
 }
 
+/* symlink(2) */
+static abi_long do_bsd_symlink(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(symlink(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* symlinkat(2) */
+static abi_long do_bsd_symlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg3);
+    ret = get_errno(symlinkat(p1, arg2, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg3);
+
+    return ret;
+}
+
+/* readlink(2) */
+static abi_long do_bsd_readlink(CPUArchState *env, abi_long arg1,
+        abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg1);
+    p2 = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg1);
+        return -TARGET_EFAULT;
+    }
+    if (strcmp(p1, "/proc/curproc/file") == 0) {
+        CPUState *cpu = env_cpu(env);
+        TaskState *ts = (TaskState *)cpu->opaque;
+        strncpy(p2, ts->bprm->fullpath, arg3);
+        ret = MIN((abi_long)strlen(ts->bprm->fullpath), arg3);
+    } else {
+        ret = get_errno(readlink(path(p1), p2, arg3));
+    }
+    unlock_user(p2, arg2, ret);
+    UNLOCK_PATH(p1, arg1);
+
+    return ret;
+}
+
+/* readlinkat(2) */
+static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH(p1, arg2);
+    p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
+    if (p2 == NULL) {
+        UNLOCK_PATH(p1, arg2);
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(readlinkat(arg1, p1, p2, arg4));
+    unlock_user(p2, arg3, ret);
+    UNLOCK_PATH(p1, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index bd4dfa6ddc7..80ec9dd4954 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -386,6 +386,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_nmount(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_symlink: /* symlink(2) */
+        ret = do_bsd_symlink(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_symlinkat: /* symlinkat(2) */
+        ret = do_bsd_symlinkat(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlink: /* readlink(2) */
+        ret = do_bsd_readlink(cpu_env, arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_readlinkat: /* readlinkat(2) */
+        ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


