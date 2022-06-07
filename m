Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B975414A2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:21:51 +0200 (CEST)
Received: from localhost ([::1]:55200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfi2-0006Tf-CP
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb6-00067b-0b
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:40 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:43784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb4-0004Mf-9r
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:39 -0400
Received: by mail-il1-x12f.google.com with SMTP id h7so7488882ila.10
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pQMqF1aMpPYbY9PbXj81qvpIN85mbCQFeDcpWQUX9OA=;
 b=22PpXw7ecOIwcQCuMhEuLcHhytJ6S9MqqfpSXcr1oRbb7koJM6WkKC/2g5zas/MqkE
 PQEst0o7LKkdkb8CBeH486kVxZZWavE7qBsy1pKgSnoWQe0uL9xZ8SHfSniw9Ue20ubN
 GV23XC07WI0BvhlqcCi8yN6WK4uORfznWIqmC0sRFIYYU5KaAFkpMoP8kn54qhMzJxpV
 syu4GEdY83K3MZGM2MlUulamW0wOvld/gxJVBJwNVTpPGI4fNh4whmJaGLNQGlz7t0BI
 U9AyoJh9L4GPHM+plZrNn4/tAeIOlHgmNVFsOq6/J6Ku9B3Wh0rhrt03G1F3HMXyH2bZ
 3H5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pQMqF1aMpPYbY9PbXj81qvpIN85mbCQFeDcpWQUX9OA=;
 b=YVhVXfoVDENGRX3IOhUuyZkI25GIqNWAJQ3jwvMCb7BaA6JCZhNwAgfwG78VlJlyth
 wcwNJwj9KGuhamO/ukf7F1/AEOf7ZViZGzbRJfmmstRTyuWTXtZ/zPrEomp7NIq31hId
 lCuCSZdIKtteka1HmwOiX8DHdW8vXF6LT+i5kswWMv2PkQ+u7vxm8rMVAcF9t/PSBAbA
 +Oj3IXBpd+JCUCm2MgkC9DYRm5tFiPLDPLE05RXhdcNxzDQLqhAMkwNYRRKa7IiBv/Mh
 fOYt2mT1wILZQbl0kvtEWwtuYZUDZSiX6ROtASb3uEnjgbxBAZdjcsuCh8BDHL0RghZ4
 MEXQ==
X-Gm-Message-State: AOAM531CoswsX9c9mk73UXFiwNMcPqPB2ufQQ9vLXWIJS43SN8BgXbZv
 WISCdmS7TSmzR9jmpoHBEbcfGzSMPsWkMw==
X-Google-Smtp-Source: ABdhPJx4YK7EUcQkBoheC0VnSlUPnyWoZ/CDBo48OrwnRVDeBNwr8q1LP4qWCW0ur7J4mM0dqOzrhQ==
X-Received: by 2002:a05:6e02:168f:b0:2d3:c51d:7f69 with SMTP id
 f15-20020a056e02168f00b002d3c51d7f69mr17531284ila.64.1654632877420; 
 Tue, 07 Jun 2022 13:14:37 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:37 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 5/6] bsd-user/bsd-file.h: Meat of the write system calls
Date: Tue,  7 Jun 2022 14:14:39 -0600
Message-Id: <20220607201440.41464-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
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

Implement write, writev, pwrite and pwritev and connect them to the
system call dispatch routine.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 85 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 23 ++++++++++
 2 files changed, 108 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index ed305439e1a..9c3dcb9ef3f 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -32,6 +32,11 @@ ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
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
@@ -106,4 +111,84 @@ static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
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
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 79fb2cb69f8..4c7c32daa56 100644
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
@@ -235,6 +242,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
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


