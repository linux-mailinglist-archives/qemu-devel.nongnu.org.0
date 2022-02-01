Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CB94A5B48
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:36:15 +0100 (CET)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErSI-00017o-6Q
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7v-0005E0-Qd
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:12 -0500
Received: from [2607:f8b0:4864:20::134] (port=34791
 helo=mail-il1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7u-0003dc-4J
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: by mail-il1-x134.google.com with SMTP id y17so13987629ilm.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gevMLy4NFMvF294+DOz37UAVJBPe4QgKMEGU4fhIos=;
 b=bVVnzVSPXknbrnr5UmP6qPGaRTPzlBLfz5mPSItqwluJKsB9pPHyAja0KLLNwUREoJ
 gdWH1QODQBVS+yp53Hh95glJnstQ3gyKXIZ/XDNjjTj5u9XfEF2MvABl/vmXTSKTP5u1
 55fzBZNudtwJKbCdJQFg3S6hXbTIIEibwsoU0XbbZjfYsStiJrBbYyWGOs+PBRg/rPHj
 zFG7Zb/hpxlfDcE/5yVkpWzjoIXeknmZbh1KJitKh5QnrlwAp3Yowyds+2bqre2Bk8J9
 17FVUd0yu6J8GaWCtgNGLge+nV5V2cG0582wx6I6Wso+lkD/aSLHMAHfUtPgYKMFvk6g
 ixtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2gevMLy4NFMvF294+DOz37UAVJBPe4QgKMEGU4fhIos=;
 b=DgGCaino7oB5LhACqDLb08eS5V3PtwsqJB8vFEKzga/dKGieqCUjTUPvPTvZnaBVKv
 33PA+2kLgvu5S+anFaxseKwZ4CFt0ZJVu8ZtaLSzObI/jJEaxr0gdEQAacn82bK3Hima
 Av6D2KcllSXutne8brOZdMVUxSLC5X3SI9rg5ifb5A2Tw28sdBh4EBKfaSrra6VNDvlG
 TmeKAFLDF9tYo0HkatqW0rBxRWAPVgxnzVMYHF6yAT3AksEBcXPQNM8p9RtN1YZiSb7l
 ZOiDnW4x/QJvpliq+WvdUOOKotNFzrXyRU17zwUCeVvNdTZvRnGXKMfxRyq4QYZwKNhs
 PFNw==
X-Gm-Message-State: AOAM533a1xxF5GL5UWwkYSVurvFC8b6cc9zT7JlUe3SD5b0eAvXL9BuO
 3DFGQEVFg0eaPectp4dvjXGNHwWSpFaI7w==
X-Google-Smtp-Source: ABdhPJyABF+J1Mo/Na+X6jePiCi5GjM3gWySfN7YLb4uY1F3IqMrwu2CGSTUONznieh2j++iTAOHPA==
X-Received: by 2002:a05:6e02:1586:: with SMTP id
 m6mr15626013ilu.233.1643714108889; 
 Tue, 01 Feb 2022 03:15:08 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:08 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] bsd-user/bsd-file.h: Add implementations for read, pread,
 readv and preadv
Date: Tue,  1 Feb 2022 04:14:53 -0700
Message-Id: <20220201111455.52511-21-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::134
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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

Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system
call table.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 79 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 24 +++++++++++
 2 files changed, 103 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 2f743db38e1..5934cbd5612 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -36,4 +36,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
 extern void unlock_iovec(struct iovec *vec, abi_ulong target_addr, int count,
         int copy);
 
+ssize_t safe_read(int fd, void *buf, size_t nbytes);
+ssize_t safe_pread(int fd, void *buf, size_t nbytes, off_t offset);
+ssize_t safe_readv(int fd, const struct iovec *iov, int iovcnt);
+ssize_t safe_preadv(int fd, const struct iovec *iov, int iovcnt, off_t offset);
+
+/* read(2) */
+static inline abi_long do_bsd_read(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(safe_read(arg1, p, arg3));
+    unlock_user(p, arg2, ret);
+
+    return ret;
+}
+
+/* pread(2) */
+static inline abi_long do_bsd_pread(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    void *p;
+
+    p = lock_user(VERIFY_WRITE, arg2, arg3, 0);
+    if (p == NULL) {
+        return -TARGET_EFAULT;
+    }
+    if (regpairs_aligned(cpu_env) != 0) {
+        arg4 = arg5;
+        arg5 = arg6;
+    }
+    ret = get_errno(safe_pread(arg1, p, arg3, target_arg64(arg4, arg5)));
+    unlock_user(p, arg2, ret);
+
+    return ret;
+}
+
+/* readv(2) */
+static inline abi_long do_bsd_readv(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 0);
+
+    if (vec != NULL) {
+        ret = get_errno(safe_readv(arg1, vec, arg3));
+        unlock_iovec(vec, arg2, arg3, 1);
+    } else {
+        ret = -host_to_target_errno(errno);
+    }
+
+    return ret;
+}
+
+/* preadv(2) */
+static inline abi_long do_bsd_preadv(void *cpu_env, abi_long arg1,
+    abi_long arg2, abi_long arg3, abi_long arg4, abi_long arg5, abi_long arg6)
+{
+    abi_long ret;
+    struct iovec *vec = lock_iovec(VERIFY_WRITE, arg2, arg3, 1);
+
+    if (vec != NULL) {
+        if (regpairs_aligned(cpu_env) != 0) {
+            arg4 = arg5;
+            arg5 = arg6;
+        }
+        ret = get_errno(safe_preadv(arg1, vec, arg3, target_arg64(arg4, arg5)));
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
index fcfa6221182..dda79af53de 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -42,6 +42,14 @@
 
 #include "bsd-file.h"
 
+/* I/O */
+safe_syscall3(ssize_t, read, int, fd, void *, buf, size_t, nbytes);
+safe_syscall4(ssize_t, pread, int, fd, void *, buf, size_t, nbytes, off_t,
+    offset);
+safe_syscall3(ssize_t, readv, int, fd, const struct iovec *, iov, int, iovcnt);
+safe_syscall4(ssize_t, preadv, int, fd, const struct iovec *, iov, int, iovcnt,
+    off_t, offset);
+
 void target_set_brk(abi_ulong new_brk)
 {
 }
@@ -212,6 +220,22 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     }
 
     switch (num) {
+
+        /*
+         * File system calls.
+         */
+    case TARGET_FREEBSD_NR_read: /* read(2) */
+        ret = do_bsd_read(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_pread: /* pread(2) */
+        ret = do_bsd_pread(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
+        break;
+
+    case TARGET_FREEBSD_NR_readv: /* readv(2) */
+        ret = do_bsd_readv(arg1, arg2, arg3);
+        break;
+
     default:
         gemu_log("qemu: unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


