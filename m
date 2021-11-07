Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A564472E3
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:50:49 +0100 (CET)
Received: from localhost ([::1]:44216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjhdI-0004sS-GM
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbQ-000347-Jq
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:53 -0500
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:43957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbN-00026X-Gq
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:52 -0500
Received: by mail-qv1-xf30.google.com with SMTP id j9so10249976qvm.10
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 04:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAg3JSFvjX0uMfpuVPcBgi6f8K/h/oAtcH5TT2VrIrU=;
 b=R6GTb44wDyRiODByJbIFpoSS8/ko/9PV/EUI6VGRSnkvWVk2TlKgzyZcO9FOkKHBEk
 Hi+t0FGeCrBhGvc43vkjU8n1/G8AB+CaL1XABHNTTqZx48HtUrk3tRy2v0y/UF7qzeG+
 s11gP8QelrY88JwZbaOXA37KXkHZeT6hUV1TprVegmSpB7g8gJUvjg60nZOOe8zY1oFz
 aknjPvUAFZsfidJgQJ2BOEvdvNwPMKuCfQu8LYV3ZjiKaDCAZQlQ7KlLcO8wmN4P646K
 9HWQeXMwsE7PLXldvgJKNSTZIG7nd9s7d0YHBk0gusctLWBluM2qahEfzW7SBUypXmuz
 MZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lAg3JSFvjX0uMfpuVPcBgi6f8K/h/oAtcH5TT2VrIrU=;
 b=yG0RxnCCUuUmDO+nAxeVYZMIHSTjV94zzUGpT/GgpzAT8Q/4EQT4d8ByUy0K1I1e2x
 Y8/tDGCQpqeddiw9J9wbNCe5gbw7F1tcmqifBwX094SO/waoiZTFeKI5lNSLmPSLVDja
 /O7RncVovySjf0JIYp3XE+J3ZkAz9Ls8tXm350Adcpj3w6W+szNtLvwZwhqHVQ/TkWDG
 aaK6F2I2C91GfTKak8I7W/3n4p+jm/Ljt+EjUhWYLhsidAdMVtw59TUGbAvnSFIAfPBR
 JPhzCSbGuj8NS6Y0q6XN8zBj0ZUTLZ7Fe0a/pMSmNRFx/3cSyhPFNbaLi4zp/Jijsqin
 A6HA==
X-Gm-Message-State: AOAM5312Rd+axNDNCkNztR+MOCGsKZXMRDfjF7OicnT4r1vxUytvVhwV
 PCC10kx2//65HqSvu2nU1rn1MF9vFdtnAA==
X-Google-Smtp-Source: ABdhPJwbwq6oEW3mmGZitYMywZv8yhD+dgPLB34Bz+Wfw+sb6vyz/ry5VkPuacUQd4N14BbSjWlknw==
X-Received: by 2002:a05:6214:2307:: with SMTP id
 gc7mr11435100qvb.34.1636289328658; 
 Sun, 07 Nov 2021 04:48:48 -0800 (PST)
Received: from localhost.localdomain ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w19sm6917qkw.49.2021.11.07.04.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 04:48:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] linux-user: Rewrite do_getdents, do_getdents64
Date: Sun,  7 Nov 2021 07:48:45 -0500
Message-Id: <20211107124845.1174791-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: f4bug@amsat.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Always allocate host storage; this ensures that the struct
is sufficiently aligned for the host.  Merge the three host
implementations of getdents via a few ifdefs.  Utilize the
same method for do_getdents64.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/704
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 251 ++++++++++++++++++-------------------------
 1 file changed, 105 insertions(+), 146 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 499415ad81..01efd5773b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8140,172 +8140,131 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
 }
 
 #ifdef TARGET_NR_getdents
-static int do_getdents(abi_long arg1, abi_long arg2, abi_long arg3)
+static int do_getdents(abi_long arg1, abi_long arg2, abi_long count)
 {
-    int ret;
+    g_autofree void *hdirp = NULL;
+    void *tdirp;
+    int hlen, hoff, toff;
+    int hreclen, treclen;
 
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
-
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
-    }
-    g_free(dirp);
-# else
-    struct linux_dirent *dirp;
-    abi_long count = arg3;
-
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
-        return -TARGET_EFAULT;
-    }
-    ret = get_errno(sys_getdents(arg1, dirp, count));
-    if (!is_error(ret)) {
-        struct linux_dirent *de;
-        int len = ret;
-        int reclen;
-        de = dirp;
-        while (len > 0) {
-            reclen = de->d_reclen;
-            if (reclen > len) {
-                break;
-            }
-            de->d_reclen = tswap16(reclen);
-            tswapls(&de->d_ino);
-            tswapls(&de->d_off);
-            de = (struct linux_dirent *)((char *)de + reclen);
-            len -= reclen;
-        }
-    }
-    unlock_user(dirp, arg2, ret);
-# endif
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+    hlen = sys_getdents(arg1, hdirp, count);
 #else
-    /* Implement getdents in terms of getdents64 */
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
+    hlen = sys_getdents64(arg1, hdirp, count);
+#endif
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
+    hlen = get_errno(hlen);
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
-            /*
-             * The target_dirent type is in what was formerly a padding
-             * byte at the end of the structure:
-             */
-            *(((char *)tde) + treclen - 1) = type;
-
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            tde = (struct target_dirent *)((char *)tde + treclen);
-            len -= reclen;
-            tlen += treclen;
-        }
-        ret = tlen;
-    }
-    unlock_user(dirp, arg2, ret);
+    for (hoff = toff = 0; hoff < hlen; hoff += hreclen, toff += treclen) {
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+        struct linux_dirent *hde = hdirp + hoff;
+#else
+        struct linux_dirent64 *hde = hdirp + hoff;
 #endif
-    return ret;
+        struct target_dirent *tde = tdirp + toff;
+        int namelen;
+        uint8_t type;
+
+        /*
+         * If somehow the host dirent is smaller than the target dirent,
+         * then the host could return more dirent in the buffer than we
+         * can pass on to the host.  This could be fixed by returning
+         * fewer dirent to the guest and lseek on the dirfd to reset the
+         * file pointer to the final hde->d_off.
+         */
+        QEMU_BUILD_BUG_ON(sizeof(*hde) < sizeof(*tde));
+
+        namelen = strlen(hde->d_name);
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent));
+
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
+#endif
+        *((uint8_t *)tde + treclen - 1) = type;
+    }
+
+    unlock_user(tdirp, arg2, toff);
+    return toff;
 }
 #endif /* TARGET_NR_getdents */
 
 #if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
-static int do_getdents64(abi_long arg1, abi_long arg2, abi_long arg3)
+static int do_getdents64(abi_long arg1, abi_long arg2, abi_long count)
 {
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
-    int ret;
+    g_autofree void *hdirp = NULL;
+    void *tdirp;
+    int hlen, hoff, toff;
+    int hreclen, treclen;
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
+        return -TARGET_ENOMEM;
+    }
+
+    hlen = get_errno(sys_getdents64(arg1, hdirp, count));
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
-                break;
-            }
-            de->d_reclen = tswap16(reclen);
-            tswap64s((uint64_t *)&de->d_ino);
-            tswap64s((uint64_t *)&de->d_off);
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            len -= reclen;
-        }
+
+    for (hoff = toff = 0; hoff < hlen; hoff += hreclen, toff += treclen) {
+        struct linux_dirent64 *hde = hdirp + hoff;
+        struct target_dirent64 *tde = tdirp + toff;
+        int namelen;
+
+        /*
+         * If somehow the host dirent is smaller than the target dirent,
+         * then the host could return more dirent in the buffer than we
+         * can pass on to the host.  This could be fixed by returning
+         * fewer dirent to the guest and lseek on the dirfd to reset the
+         * file pointer to the final hde->d_off.
+         */
+        QEMU_BUILD_BUG_ON(sizeof(*hde) < sizeof(*tde));
+
+        namelen = strlen(hde->d_name) + 1;
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent64, d_name) + namelen;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent64));
+
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


