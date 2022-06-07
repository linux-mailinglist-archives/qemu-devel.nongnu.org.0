Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628754149E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 22:21:50 +0200 (CEST)
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyfi1-0006eW-5B
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 16:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb5-00065Q-BX
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:39 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nyfb3-0004NK-PP
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:14:39 -0400
Received: by mail-il1-x133.google.com with SMTP id r3so15082942ilt.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lKoewrYHVDI+U+A6mVZHxcPghd5cIO/uD93HJK3h92s=;
 b=XShwYsSexfwcA11iyKO+PN6IFXNulrbezZYQhzRR7rYD8KVd8L6wtn+WG0MNtfhcSx
 rsPB3b6dimlzRuA0Wu1Kg+8STp/DV4Rfp5kF6c/nNgIhuaDz1e2iS1K3NYpQtHxH4Dab
 uyWbK6hwhw1QqeHZE83G1+SLtVb/kOptKh4FG3m533t2ziWxa3xoa7FeQoo4g0DIexfb
 6Tu3sSEVkU9E7mkqf/T4LOjmpmTtBAIHyTRsMh3kenX4RxIruvz9aqjJX1n12Ln5loxN
 9XqW+paCXL435eAmYpuTdt6HuLhInU02KZyrNk1umthV/wqX4mpYNv19jqyK2BoSu4O/
 axBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKoewrYHVDI+U+A6mVZHxcPghd5cIO/uD93HJK3h92s=;
 b=EvErC6ZR9aH5QlAFaRNvPSJO2yAgBFYg1Y8OPb69W8e0vh9bv8QUIcSJG2GsThiVLR
 Kzmup3voGQRK4+nD9pZPkeQTVeIwxur0KRSAxe8lt7exqZnK8ceQt6mIg5lCerVf1mGU
 cMacxcB0deuqwaXQUs3C3oQuXRbZyqxI1iuwSIEziVS+B3cZQeVvzv9619GPzqTLescM
 IawKCIjYq16Pujlk9C3hriDDGLfDTQJxOWvBprgKXMUAKnzLK/OGX5lEbGNKdAEa+inq
 Al/2hVI5EDaHdtEqWL7Q0uHrDlEkD42rKRo3qnPLQpcX35Imnj8F3fw7Frj3X+2R5BmL
 nhhg==
X-Gm-Message-State: AOAM530BLvvNKF3jpCoEvqGu2P3yV7UME5RbbtVkryBI4ssjN/rWWbqP
 6G7Oam+G/GzvSKx6l5ajLsSTAPsFhKTJ3w==
X-Google-Smtp-Source: ABdhPJwHv75Ye9JbZ3UUf9alf/7X51oMqI39uTzcUuMBAU2X7wTGk28hXExQPwevDjJfrE/O8bxQzQ==
X-Received: by 2002:a05:6e02:1523:b0:2d3:cb16:2d03 with SMTP id
 i3-20020a056e02152300b002d3cb162d03mr17354397ilu.198.1654632876471; 
 Tue, 07 Jun 2022 13:14:36 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 cp5-20020a056638480500b0032ea3ba170dsm7053024jab.86.2022.06.07.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:14:35 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: arrowd@freebsd.org, def@freebsd.org, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/6] bsd-user/bsd-file.h: Add implementations for read, pread,
 readv and preadv
Date: Tue,  7 Jun 2022 14:14:38 -0600
Message-Id: <20220607201440.41464-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220607201440.41464-1-imp@bsdimp.com>
References: <20220607201440.41464-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

Implement do_bsd_{read,pread,readv,preadv}. Connect them to the system
call table.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 79 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 24 +++++++++++
 2 files changed, 103 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index a6bff3b8c26..ed305439e1a 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -27,4 +27,83 @@ extern struct iovec *lock_iovec(int type, abi_ulong target_addr, int count,
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
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 334c573739b..79fb2cb69f8 100644
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
@@ -211,6 +219,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
     abi_long ret;
 
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


