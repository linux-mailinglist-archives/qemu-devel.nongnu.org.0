Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660244F76F
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 11:39:16 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmCup-0008Lx-8Z
	for lists+qemu-devel@lfdr.de; Sun, 14 Nov 2021 05:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCri-000499-5j
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:36:02 -0500
Received: from [2a00:1450:4864:20::32c] (port=40831
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmCrf-0000hg-Nw
 for qemu-devel@nongnu.org; Sun, 14 Nov 2021 05:36:01 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so12613351wmb.5
 for <qemu-devel@nongnu.org>; Sun, 14 Nov 2021 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u7NrqkDveBa4hwrZ13pQ52EsKuNUzd3UgVxFiV4cVYA=;
 b=Ntw3qQ6U0qQqTLEFjLdJs9M+lCBWSV899Wc+QJ+B7DY1UVlP2u6wugd2kztg1AaSpc
 zyIPdugHdeq9t4gO+asPe/kmsSvlOBD+LCUypyv7a2JwRXq1gRKeaNX+9LQ280xRM7D8
 aMSU/1HZr9vhYMQv4Z2MSWDlI62wN/T2twRO0ZoEzMnS4tskoqF9DEFUbnR4RNdV7ncm
 dRbCLbx8xY8qExhqmDsYIBoV9ddZsMOb9Pj8rh/3RAVBXdZz2PYbfO0YXYnKvpFq/yIz
 ujyCXR7qfixWFj7pjUj7WJ/bka6z/QxabFUv5VCZ5CkRHjVG/qu5JQPLxwmdwwXm9m1U
 dJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u7NrqkDveBa4hwrZ13pQ52EsKuNUzd3UgVxFiV4cVYA=;
 b=F938HgEmcKX6WmbYam8//MIBEl6yYHbBP0a8JYTh1/5zhx+IFzGr8KF4HRdw9zsGUK
 40r19LRBkSyNQVG2rWiu7ABLiQR49U4g0+K3oRYDBt8IYyW9GJwwPZiHDaimLpci+WKV
 963t7z1zte7+czq9w8FbcaCjhv8H5gSS/GiN495Tm5MFQcFj9n1XA4vF9VJEK9tueZZP
 HOoexibTjabhQ3Xk3CLRKMjrBqpWpm5/SkdNCHD1rGYCSDCldJf867EXK+t1aLU0Pjk5
 OJMcKeDeGT0QW44T0K94q15IN1UDe0YKVUu4tIttLkLImySzZtNjFJ1Ex8sdvXT335SF
 +Ckw==
X-Gm-Message-State: AOAM533VjK7BYxO/sOS2MJQuM/RKRgZTralJqZBzUyIBG8Gsp+OhRkqr
 /W7ZxfhSfKd6AUbK8NWANkjhfoVjjzrJqN89ONw=
X-Google-Smtp-Source: ABdhPJzIDGAOw841v1sz0nQTZXpOjrTCj/Iq4xnkupMU8i6D0JxXQTqhoXzcYzh/xXFFfwif/eKbGA==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr34037745wmi.61.1636886158283; 
 Sun, 14 Nov 2021 02:35:58 -0800 (PST)
Received: from localhost.localdomain (60.red-95-126-179.staticip.rima-tde.net.
 [95.126.179.60])
 by smtp.gmail.com with ESMTPSA id x1sm10638852wmc.22.2021.11.14.02.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 02:35:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] linux-user: Rewrite do_getdents, do_getdents64
Date: Sun, 14 Nov 2021 11:35:39 +0100
Message-Id: <20211114103539.298686-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211114103539.298686-1-richard.henderson@linaro.org>
References: <20211114103539.298686-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always allocate host storage; this ensures that the struct
is sufficiently aligned for the host.  Merge the three host
implementations of getdents via a few ifdefs.  Utilize the
same method for do_getdents64.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/704
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 259 ++++++++++++++++++++-----------------------
 1 file changed, 121 insertions(+), 138 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 499415ad81..f1cfcc8104 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8140,172 +8140,155 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
 }
 
 #ifdef TARGET_NR_getdents
-static int do_getdents(abi_long arg1, abi_long arg2, abi_long arg3)
+static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
 {
-    int ret;
+    g_autofree void *hdirp = NULL;
+    void *tdirp;
+    int hlen, hoff, toff;
+    int hreclen, treclen;
+    off64_t prev_diroff = 0;
 
-#ifdef EMULATE_GETDENTS_WITH_GETDENTS
-# if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
-    struct target_dirent *target_dirp;
-    struct linux_dirent *dirp;
-    abi_long count = arg3;
-
-    dirp = g_try_malloc(count);
-    if (!dirp) {
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
         return -TARGET_ENOMEM;
     }
 
-    ret = get_errno(sys_getdents(arg1, dirp, count));
-    if (!is_error(ret)) {
-        struct linux_dirent *de;
-        struct target_dirent *tde;
-        int len = ret;
-        int reclen, treclen;
-        int count1, tnamelen;
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+    hlen = sys_getdents(dirfd, hdirp, count);
+#else
+    hlen = sys_getdents64(dirfd, hdirp, count);
+#endif
 
-        count1 = 0;
-        de = dirp;
-        target_dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-        if (!target_dirp) {
-            return -TARGET_EFAULT;
-        }
-        tde = target_dirp;
-        while (len > 0) {
-            reclen = de->d_reclen;
-            tnamelen = reclen - offsetof(struct linux_dirent, d_name);
-            assert(tnamelen >= 0);
-            treclen = tnamelen + offsetof(struct target_dirent, d_name);
-            assert(count1 + treclen <= count);
-            tde->d_reclen = tswap16(treclen);
-            tde->d_ino = tswapal(de->d_ino);
-            tde->d_off = tswapal(de->d_off);
-            memcpy(tde->d_name, de->d_name, tnamelen);
-            de = (struct linux_dirent *)((char *)de + reclen);
-            len -= reclen;
-            tde = (struct target_dirent *)((char *)tde + treclen);
-            count1 += treclen;
-        }
-        ret = count1;
-        unlock_user(target_dirp, arg2, ret);
+    hlen = get_errno(hlen);
+    if (is_error(hlen)) {
+        return hlen;
     }
-    g_free(dirp);
-# else
-    struct linux_dirent *dirp;
-    abi_long count = arg3;
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
+    tdirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+    if (!tdirp) {
         return -TARGET_EFAULT;
     }
-    ret = get_errno(sys_getdents(arg1, dirp, count));
-    if (!is_error(ret)) {
-        struct linux_dirent *de;
-        int len = ret;
-        int reclen;
-        de = dirp;
-        while (len > 0) {
-            reclen = de->d_reclen;
-            if (reclen > len) {
+
+    for (hoff = toff = 0; hoff < hlen; hoff += hreclen, toff += treclen) {
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+        struct linux_dirent *hde = hdirp + hoff;
+#else
+        struct linux_dirent64 *hde = hdirp + hoff;
+#endif
+        struct target_dirent *tde = tdirp + toff;
+        int namelen;
+        uint8_t type;
+
+        namelen = strlen(hde->d_name);
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent));
+
+        if (toff + treclen > count) {
+            /*
+             * If the host struct is smaller than the target struct, or
+             * requires less alignment and thus packs into less space,
+             * then the host can return more entries than we can pass
+             * on to the guest.
+             */
+            if (toff == 0) {
+                toff = -TARGET_EINVAL; /* result buffer is too small */
                 break;
             }
-            de->d_reclen = tswap16(reclen);
-            tswapls(&de->d_ino);
-            tswapls(&de->d_off);
-            de = (struct linux_dirent *)((char *)de + reclen);
-            len -= reclen;
-        }
-    }
-    unlock_user(dirp, arg2, ret);
-# endif
-#else
-    /* Implement getdents in terms of getdents64 */
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
-
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
-        return -TARGET_EFAULT;
-    }
-    ret = get_errno(sys_getdents64(arg1, dirp, count));
-    if (!is_error(ret)) {
-        /*
-         * Convert the dirent64 structs to target dirent.  We do this
-         * in-place, since we can guarantee that a target_dirent is no
-         * larger than a dirent64; however this means we have to be
-         * careful to read everything before writing in the new format.
-         */
-        struct linux_dirent64 *de;
-        struct target_dirent *tde;
-        int len = ret;
-        int tlen = 0;
-
-        de = dirp;
-        tde = (struct target_dirent *)dirp;
-        while (len > 0) {
-            int namelen, treclen;
-            int reclen = de->d_reclen;
-            uint64_t ino = de->d_ino;
-            int64_t off = de->d_off;
-            uint8_t type = de->d_type;
-
-            namelen = strlen(de->d_name);
-            treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
-            treclen = QEMU_ALIGN_UP(treclen, sizeof(abi_long));
-
-            memmove(tde->d_name, de->d_name, namelen + 1);
-            tde->d_ino = tswapal(ino);
-            tde->d_off = tswapal(off);
-            tde->d_reclen = tswap16(treclen);
             /*
-             * The target_dirent type is in what was formerly a padding
-             * byte at the end of the structure:
+             * Return what we have, resetting the file pointer to the
+             * location of the first record not returned.
              */
-            *(((char *)tde) + treclen - 1) = type;
-
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            tde = (struct target_dirent *)((char *)tde + treclen);
-            len -= reclen;
-            tlen += treclen;
+            lseek64(dirfd, prev_diroff, SEEK_SET);
+            break;
         }
-        ret = tlen;
-    }
-    unlock_user(dirp, arg2, ret);
+
+        prev_diroff = hde->d_off;
+        tde->d_ino = tswapal(hde->d_ino);
+        tde->d_off = tswapal(hde->d_off);
+        tde->d_reclen = tswap16(treclen);
+        memcpy(tde->d_name, hde->d_name, namelen + 1);
+
+        /*
+         * The getdents type is in what was formerly a padding byte at the
+         * end of the structure.
+         */
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+        type = *((uint8_t *)hde + hreclen - 1);
+#else
+        type = hde->d_type;
 #endif
-    return ret;
+        *((uint8_t *)tde + treclen - 1) = type;
+    }
+
+    unlock_user(tdirp, arg2, toff);
+    return toff;
 }
 #endif /* TARGET_NR_getdents */
 
 #if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
-static int do_getdents64(abi_long arg1, abi_long arg2, abi_long arg3)
+static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
 {
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
-    int ret;
+    g_autofree void *hdirp = NULL;
+    void *tdirp;
+    int hlen, hoff, toff;
+    int hreclen, treclen;
+    off64_t prev_diroff = 0;
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
+        return -TARGET_ENOMEM;
+    }
+
+    hlen = get_errno(sys_getdents64(dirfd, hdirp, count));
+    if (is_error(hlen)) {
+        return hlen;
+    }
+
+    tdirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+    if (!tdirp) {
         return -TARGET_EFAULT;
     }
-    ret = get_errno(sys_getdents64(arg1, dirp, count));
-    if (!is_error(ret)) {
-        struct linux_dirent64 *de;
-        int len = ret;
-        int reclen;
-        de = dirp;
-        while (len > 0) {
-            reclen = de->d_reclen;
-            if (reclen > len) {
+
+    for (hoff = toff = 0; hoff < hlen; hoff += hreclen, toff += treclen) {
+        struct linux_dirent64 *hde = hdirp + hoff;
+        struct target_dirent64 *tde = tdirp + toff;
+        int namelen;
+
+        namelen = strlen(hde->d_name) + 1;
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent64, d_name) + namelen;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent64));
+
+        if (toff + treclen > count) {
+            /*
+             * If the host struct is smaller than the target struct, or
+             * requires less alignment and thus packs into less space,
+             * then the host can return more entries than we can pass
+             * on to the guest.
+             */
+            if (toff == 0) {
+                toff = -TARGET_EINVAL; /* result buffer is too small */
                 break;
             }
-            de->d_reclen = tswap16(reclen);
-            tswap64s((uint64_t *)&de->d_ino);
-            tswap64s((uint64_t *)&de->d_off);
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            len -= reclen;
+            /*
+             * Return what we have, resetting the file pointer to the
+             * location of the first record not returned.
+             */
+            lseek64(dirfd, prev_diroff, SEEK_SET);
+            break;
         }
+
+        prev_diroff = hde->d_off;
+        tde->d_ino = tswap64(hde->d_ino);
+        tde->d_off = tswap64(hde->d_off);
+        tde->d_reclen = tswap16(treclen);
+        tde->d_type = hde->d_type;
+        memcpy(tde->d_name, hde->d_name, namelen);
     }
-    unlock_user(dirp, arg2, ret);
-    return ret;
+
+    unlock_user(tdirp, arg2, toff);
+    return toff;
 }
 #endif /* TARGET_NR_getdents64 */
 
-- 
2.25.1


