Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96374472E4
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 13:52:14 +0100 (CET)
Received: from localhost ([::1]:48656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjhef-0007yX-U6
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 07:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbO-00033w-QF
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:50 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mjhbL-000269-MJ
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 07:48:50 -0500
Received: by mail-qk1-x735.google.com with SMTP id p17so12033661qkj.0
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 04:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5YdY/iarwR1o7rlm4TvNfomS0+BmE8A5jrB21UT6FG8=;
 b=RfJ8ccCyNmw8lJnH0EywAbBWxThMm6HvmuJu+oiPEoYw09piV3cE3AC6X8oRHbe9WC
 CvJqK2GVW0uxgJSj1j5k5tLiIsigrX9ygFbPhN2qZBSdVlLIZPu1SaatRzTZUy9dHVHg
 u1NY86+Ptm8/05oGvqPwFFL/I/0hIUkS6KaRYwl9NmbeLFEECjytIsC1Qg1q5mt0E7Ia
 0bACijXSGRg9XQoqP9TPer5oADkqy4Zv10pLc+Scq1H0bhp6CwftYxlBs3K0wdutit78
 Bj6C8XdZQ1FO+pB/W7g0NVqP8nSifw6lCKIFi42/M5KkVFGxOqBxQN53DjepvU7OPkyb
 v58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5YdY/iarwR1o7rlm4TvNfomS0+BmE8A5jrB21UT6FG8=;
 b=LtXHnpBZtUy9Yk7ckkar7H8gHodJl4eUCd8MaxiPma3GhAzwWm5jqBG8lkkMqFlP6U
 YkIMyIZP5f64Q5k6tbaougpzllpsz5I9JTe6KjqQZeRWTfWpxiwAEidhS+QheR8njfYN
 D9y2nXdPwGKFrV2kXInObqCGM+6nwaqhtYhw950LAP3j1UCi850HDfyS82OTPQXoqDsj
 ZxRNWuKup6v71oF8Kg/C77QvW3OvyixFK4oOf0Smyn6Mz8UUGy/ytwmUFFWeDAMMK0jV
 w/7ofPh6rcAyuqoXkZqN0PGgJ81JY1eGgimRgel7k0TbkCm4kX7goVAT+FaddbJxmzwo
 0tmQ==
X-Gm-Message-State: AOAM530Vug2cMPPVRvc5m8QdahfPhuZtd82RAE6eSrK2AeJTTFcQBryz
 WSp3X2tNvx/A2MTpKJa9dl/sPscHpuJZYg==
X-Google-Smtp-Source: ABdhPJyflayOKUKW92DF/ZoIausR8RHsaScXxf5S0Qn+sJ54nU5hjhdX5fiZEVYa3WqDS05mIc606Q==
X-Received: by 2002:a05:620a:b4c:: with SMTP id
 x12mr50762665qkg.324.1636289326717; 
 Sun, 07 Nov 2021 04:48:46 -0800 (PST)
Received: from localhost.localdomain ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id w19sm6917qkw.49.2021.11.07.04.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 04:48:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] linux-user: Split out do_getdents, do_getdents64
Date: Sun,  7 Nov 2021 07:48:42 -0500
Message-Id: <20211107124845.1174791-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107124845.1174791-1-richard.henderson@linaro.org>
References: <20211107124845.1174791-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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

Retain all 3 implementations of getdents for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 325 +++++++++++++++++++++++--------------------
 1 file changed, 172 insertions(+), 153 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662f..a2f605dec4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8137,6 +8137,176 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
     return 0;
 }
 
+#ifdef TARGET_NR_getdents
+static int do_getdents(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    int ret;
+
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+# if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
+    struct target_dirent *target_dirp;
+    struct linux_dirent *dirp;
+    abi_long count = arg3;
+
+    dirp = g_try_malloc(count);
+    if (!dirp) {
+        return -TARGET_ENOMEM;
+    }
+
+    ret = get_errno(sys_getdents(arg1, dirp, count));
+    if (!is_error(ret)) {
+        struct linux_dirent *de;
+        struct target_dirent *tde;
+        int len = ret;
+        int reclen, treclen;
+        int count1, tnamelen;
+
+        count1 = 0;
+        de = dirp;
+        target_dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+        if (!target_dirp) {
+            return -TARGET_EFAULT;
+        }
+        tde = target_dirp;
+        while (len > 0) {
+            reclen = de->d_reclen;
+            tnamelen = reclen - offsetof(struct linux_dirent, d_name);
+            assert(tnamelen >= 0);
+            treclen = tnamelen + offsetof(struct target_dirent, d_name);
+            assert(count1 + treclen <= count);
+            tde->d_reclen = tswap16(treclen);
+            tde->d_ino = tswapal(de->d_ino);
+            tde->d_off = tswapal(de->d_off);
+            memcpy(tde->d_name, de->d_name, tnamelen);
+            de = (struct linux_dirent *)((char *)de + reclen);
+            len -= reclen;
+            tde = (struct target_dirent *)((char *)tde + treclen);
+            count1 += treclen;
+        }
+        ret = count1;
+        unlock_user(target_dirp, arg2, ret);
+    }
+    g_free(dirp);
+# else
+    struct linux_dirent *dirp;
+    abi_long count = arg3;
+
+    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+    if (!dirp) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(sys_getdents(arg1, dirp, count));
+    if (!is_error(ret)) {
+        struct linux_dirent *de;
+        int len = ret;
+        int reclen;
+        de = dirp;
+        while (len > 0) {
+            reclen = de->d_reclen;
+            if (reclen > len) {
+                break;
+            }
+            de->d_reclen = tswap16(reclen);
+            tswapls(&de->d_ino);
+            tswapls(&de->d_off);
+            de = (struct linux_dirent *)((char *)de + reclen);
+            len -= reclen;
+        }
+    }
+    unlock_user(dirp, arg2, ret);
+# endif
+#else
+    /* Implement getdents in terms of getdents64 */
+    struct linux_dirent64 *dirp;
+    abi_long count = arg3;
+
+    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+    if (!dirp) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(sys_getdents64(arg1, dirp, count));
+    if (!is_error(ret)) {
+        /*
+         * Convert the dirent64 structs to target dirent.  We do this
+         * in-place, since we can guarantee that a target_dirent is no
+         * larger than a dirent64; however this means we have to be
+         * careful to read everything before writing in the new format.
+         */
+        struct linux_dirent64 *de;
+        struct target_dirent *tde;
+        int len = ret;
+        int tlen = 0;
+
+        de = dirp;
+        tde = (struct target_dirent *)dirp;
+        while (len > 0) {
+            int namelen, treclen;
+            int reclen = de->d_reclen;
+            uint64_t ino = de->d_ino;
+            int64_t off = de->d_off;
+            uint8_t type = de->d_type;
+
+            namelen = strlen(de->d_name);
+            treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
+            treclen = QEMU_ALIGN_UP(treclen, sizeof(abi_long));
+
+            memmove(tde->d_name, de->d_name, namelen + 1);
+            tde->d_ino = tswapal(ino);
+            tde->d_off = tswapal(off);
+            tde->d_reclen = tswap16(treclen);
+            /*
+             * The target_dirent type is in what was formerly a padding
+             * byte at the end of the structure:
+             */
+            *(((char *)tde) + treclen - 1) = type;
+
+            de = (struct linux_dirent64 *)((char *)de + reclen);
+            tde = (struct target_dirent *)((char *)tde + treclen);
+            len -= reclen;
+            tlen += treclen;
+        }
+        ret = tlen;
+    }
+    unlock_user(dirp, arg2, ret);
+#endif
+    return ret;
+}
+#endif /* TARGET_NR_getdents */
+
+#if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
+static int do_getdents64(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    struct linux_dirent64 *dirp;
+    abi_long count = arg3;
+    int ret;
+
+    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
+    if (!dirp) {
+        return -TARGET_EFAULT;
+    }
+    ret = get_errno(sys_getdents64(arg1, dirp, count));
+    if (!is_error(ret)) {
+        struct linux_dirent64 *de;
+        int len = ret;
+        int reclen;
+        de = dirp;
+        while (len > 0) {
+            reclen = de->d_reclen;
+            if (reclen > len) {
+                break;
+            }
+            de->d_reclen = tswap16(reclen);
+            tswap64s((uint64_t *)&de->d_ino);
+            tswap64s((uint64_t *)&de->d_off);
+            de = (struct linux_dirent64 *)((char *)de + reclen);
+            len -= reclen;
+        }
+    }
+    unlock_user(dirp, arg2, ret);
+    return ret;
+}
+#endif /* TARGET_NR_getdents64 */
+
 #if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
 _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
 #endif
@@ -10227,162 +10397,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #endif
 #ifdef TARGET_NR_getdents
     case TARGET_NR_getdents:
-#ifdef EMULATE_GETDENTS_WITH_GETDENTS
-#if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
-        {
-            struct target_dirent *target_dirp;
-            struct linux_dirent *dirp;
-            abi_long count = arg3;
-
-            dirp = g_try_malloc(count);
-            if (!dirp) {
-                return -TARGET_ENOMEM;
-            }
-
-            ret = get_errno(sys_getdents(arg1, dirp, count));
-            if (!is_error(ret)) {
-                struct linux_dirent *de;
-		struct target_dirent *tde;
-                int len = ret;
-                int reclen, treclen;
-		int count1, tnamelen;
-
-		count1 = 0;
-                de = dirp;
-                if (!(target_dirp = lock_user(VERIFY_WRITE, arg2, count, 0)))
-                    return -TARGET_EFAULT;
-		tde = target_dirp;
-                while (len > 0) {
-                    reclen = de->d_reclen;
-                    tnamelen = reclen - offsetof(struct linux_dirent, d_name);
-                    assert(tnamelen >= 0);
-                    treclen = tnamelen + offsetof(struct target_dirent, d_name);
-                    assert(count1 + treclen <= count);
-                    tde->d_reclen = tswap16(treclen);
-                    tde->d_ino = tswapal(de->d_ino);
-                    tde->d_off = tswapal(de->d_off);
-                    memcpy(tde->d_name, de->d_name, tnamelen);
-                    de = (struct linux_dirent *)((char *)de + reclen);
-                    len -= reclen;
-                    tde = (struct target_dirent *)((char *)tde + treclen);
-		    count1 += treclen;
-                }
-		ret = count1;
-                unlock_user(target_dirp, arg2, ret);
-            }
-            g_free(dirp);
-        }
-#else
-        {
-            struct linux_dirent *dirp;
-            abi_long count = arg3;
-
-            if (!(dirp = lock_user(VERIFY_WRITE, arg2, count, 0)))
-                return -TARGET_EFAULT;
-            ret = get_errno(sys_getdents(arg1, dirp, count));
-            if (!is_error(ret)) {
-                struct linux_dirent *de;
-                int len = ret;
-                int reclen;
-                de = dirp;
-                while (len > 0) {
-                    reclen = de->d_reclen;
-                    if (reclen > len)
-                        break;
-                    de->d_reclen = tswap16(reclen);
-                    tswapls(&de->d_ino);
-                    tswapls(&de->d_off);
-                    de = (struct linux_dirent *)((char *)de + reclen);
-                    len -= reclen;
-                }
-            }
-            unlock_user(dirp, arg2, ret);
-        }
-#endif
-#else
-        /* Implement getdents in terms of getdents64 */
-        {
-            struct linux_dirent64 *dirp;
-            abi_long count = arg3;
-
-            dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-            if (!dirp) {
-                return -TARGET_EFAULT;
-            }
-            ret = get_errno(sys_getdents64(arg1, dirp, count));
-            if (!is_error(ret)) {
-                /* Convert the dirent64 structs to target dirent.  We do this
-                 * in-place, since we can guarantee that a target_dirent is no
-                 * larger than a dirent64; however this means we have to be
-                 * careful to read everything before writing in the new format.
-                 */
-                struct linux_dirent64 *de;
-                struct target_dirent *tde;
-                int len = ret;
-                int tlen = 0;
-
-                de = dirp;
-                tde = (struct target_dirent *)dirp;
-                while (len > 0) {
-                    int namelen, treclen;
-                    int reclen = de->d_reclen;
-                    uint64_t ino = de->d_ino;
-                    int64_t off = de->d_off;
-                    uint8_t type = de->d_type;
-
-                    namelen = strlen(de->d_name);
-                    treclen = offsetof(struct target_dirent, d_name)
-                        + namelen + 2;
-                    treclen = QEMU_ALIGN_UP(treclen, sizeof(abi_long));
-
-                    memmove(tde->d_name, de->d_name, namelen + 1);
-                    tde->d_ino = tswapal(ino);
-                    tde->d_off = tswapal(off);
-                    tde->d_reclen = tswap16(treclen);
-                    /* The target_dirent type is in what was formerly a padding
-                     * byte at the end of the structure:
-                     */
-                    *(((char *)tde) + treclen - 1) = type;
-
-                    de = (struct linux_dirent64 *)((char *)de + reclen);
-                    tde = (struct target_dirent *)((char *)tde + treclen);
-                    len -= reclen;
-                    tlen += treclen;
-                }
-                ret = tlen;
-            }
-            unlock_user(dirp, arg2, ret);
-        }
-#endif
-        return ret;
+        return do_getdents(arg1, arg2, arg3);
 #endif /* TARGET_NR_getdents */
 #if defined(TARGET_NR_getdents64) && defined(__NR_getdents64)
     case TARGET_NR_getdents64:
-        {
-            struct linux_dirent64 *dirp;
-            abi_long count = arg3;
-            if (!(dirp = lock_user(VERIFY_WRITE, arg2, count, 0)))
-                return -TARGET_EFAULT;
-            ret = get_errno(sys_getdents64(arg1, dirp, count));
-            if (!is_error(ret)) {
-                struct linux_dirent64 *de;
-                int len = ret;
-                int reclen;
-                de = dirp;
-                while (len > 0) {
-                    reclen = de->d_reclen;
-                    if (reclen > len)
-                        break;
-                    de->d_reclen = tswap16(reclen);
-                    tswap64s((uint64_t *)&de->d_ino);
-                    tswap64s((uint64_t *)&de->d_off);
-                    de = (struct linux_dirent64 *)((char *)de + reclen);
-                    len -= reclen;
-                }
-            }
-            unlock_user(dirp, arg2, ret);
-        }
-        return ret;
+        return do_getdents64(arg1, arg2, arg3);
 #endif /* TARGET_NR_getdents64 */
 #if defined(TARGET_NR__newselect)
     case TARGET_NR__newselect:
-- 
2.25.1


