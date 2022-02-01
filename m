Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F64A5C09
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:16:41 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEs5Q-00060E-L9
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7x-0005IK-7c
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:13 -0500
Received: from [2607:f8b0:4864:20::d31] (port=43873
 helo=mail-io1-xd31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7v-0003iP-D7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:12 -0500
Received: by mail-io1-xd31.google.com with SMTP id z199so20681715iof.10
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZKC0QaOKwxbEUnfj7dWcrcxfW+qKzGj8MUewXGWUGU=;
 b=WT893l4lDfXwBaIRRgEUFN1gjhD0kkTpC+nrw1ma6oHI0iS3tNuHHpmVS8znKNbchi
 p8AX6c4V3UBKn+nKNPic9ixDJlO2bBo/4P4//qHVbq6H9ppFt2m4HoIxJDF1dGC1Mxpf
 30cchC2D6IcJzExJDesXIun0ee36YVp8/4kg4jCO9F2am6lQP/GMScWwHad4aBW0Cm45
 4EaGHjK5msFjAcee7a5nZ4LfFJpqW4aztRQDzVhRHi49TdxiIoy0VPOclt2o/lHlvKKA
 odKN35gr4BDYtrCzgsmHA+qw2bbyudqp+ITTz+pWrtfLAx8KiBt+flUUFoBaoqEfM828
 9k/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZKC0QaOKwxbEUnfj7dWcrcxfW+qKzGj8MUewXGWUGU=;
 b=p/QZW7IkYcyq/bwkc3KjZ5fsLo6TkFTRbau137XoO2xFXcdMUTmrVjW04djeS37LYs
 7cR5wwwTy/P4FB0dgep5rTY0wg8A5aopyrbmOJLkQTqNQgtGxGEdtapBKii2rdUWlFbo
 IFT+BHVfyzsBkEcf5bZajNLF32cgXFpvGqF4Tram92dba/YyyG9YSOGUrJpka+K3L8VZ
 7irvUFlxS3xCQyVmxMwyE3h0jVn97fVsA18c49j86aBKWQAGet4vQn0Be/gmTd7K+DJ3
 qlq/ukW8SU6CVS2aEE9kGcqynA6ssq1NrvtseEEi1o5CSHQgE34HSB2jwD0JMKCsWVDm
 OTZA==
X-Gm-Message-State: AOAM530nDyI0NlYWSKXeTwUWwDMhGlbAmgY5oa/hDkUlboqdwWnbYR91
 yzxu8bjSJIh4PkBNWp4+fa9rACty/Ch54g==
X-Google-Smtp-Source: ABdhPJxc92OFaR2C3AUQQuJJb8SiRjKLi+cc98cWVsFLBu02yVblff2YhrnOnexNU7sItvOUYgUcPA==
X-Received: by 2002:a05:6638:13d1:: with SMTP id
 i17mr6193658jaj.182.1643714109820; 
 Tue, 01 Feb 2022 03:15:09 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:09 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/22] bsd-user/bsd-file.h: Meat of the write system calls
Date: Tue,  1 Feb 2022 04:14:54 -0700
Message-Id: <20220201111455.52511-22-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d31
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement write, writev, pwrite and pwritev and connect them to the
system call dispatch routine.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 85 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 23 ++++++++++
 2 files changed, 108 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 5934cbd5612..2047256a555 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -41,6 +41,11 @@ ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
 ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
 ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);
 
+ssize_t safe_write(int fd, void *buf, size_t nbytes);
+ssize_t safe_pwrite(int fd, void *buf, size_t nbytes, off_t offset);
+ssize_t safe_writev(int fd, const struct iovec *iov, int iovcnt);
+ssize_t safe_pwritev(int fd, const struct iovec *iov, int iovcnt, off_t offset);
+
 /* read(2) */
 static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)
 {
@@ -115,4 +120,84 @@ static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
     return ret;
 }
 
+/* write(2) */
+static inline abi_long do_bsd_write(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long nbytes, ret;
+    void *p;
+
+    /* nbytes < 0 implies that it was larger than SIZE_MAX. */
+    nbytes = arg3;
+    if (nbytes < 0) {
+        return -TARGET_EINVAL;
+    }
+    p = lock_user(VERIFY_READ, arg2, nbytes, 1);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(safe_write(arg1, p, arg3));
+    unlock_user(p, arg2, 0);
+
+    return ret;
+}
+
+/* pwrite(2) */
+static inline abi_long do_bsd_pwrite(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_READ, arg2, arg3, 1);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg4 = arg5;
+        arg5 = arg6;
+    }
+    ret = get_errno(safe_pwrite(arg1, p, arg3, target_arg64(arg4, arg5)));
+    unlock_user(p, arg2, 0);
+
+    return ret;
+}
+
+/* writev(2) */
+static inline abi_long do_bsd_writev(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        ret = get_errno(safe_writev(arg1, vec, arg3));
+        unlock_iovec(vec, arg2, arg3, 0);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
+/* pwritev(2) */
+static inline abi_long do_bsd_pwritev(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_READ, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        if (regpairs_aligned(cpu_env) != 0) {
+            arg4 = arg5;
+            arg5 = arg6;
+        }
+        ret = get_errno(safe_pwritev(arg1, vec, arg3, target_arg64(arg4, arg5)));
+        unlock_iovec(vec, arg2, arg3, 0);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
 #endif /* !BSD_FILE_H_ */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index dda79af53de..f52c9e3c306 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -50,6 +50,13 @@ safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int, iovcnt);
 safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int, iovcnt,
     off_t, offset);
 
+safe_syscall3(ssize_t, write, int, fd, void *, buf, size_t, nbytes);
+safe_syscall4(ssize_t, pwrite, int, fd, void *, buf, size_t, nbytes, off_t,
+    offset);
+safe_syscall3(ssize_t, writev, int, fd, const struct iovec *, iov, int, iovcnt);
+safe_syscall4(ssize_t, pwritev, int, fd, const struct iovec *, iov, int, iovcnt,
+    off_t, offset);
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
@@ -236,6 +243,22 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_readv(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_write: /* write(2) */
+        ret = do_bsd_write(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pwrite: /* pwrite(2) */
+        ret = do_bsd_pwrite(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
+    case TARGET_FREEBSD_NR_writev: /* writev(2) */
+        ret = do_bsd_writev(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pwritev: /* pwritev(2) */
+        ret = do_bsd_pwritev(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
     default:
         gemu_log("qemu: unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


