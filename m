Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4793458A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:27:08 +0100 (CET)
Received: from localhost ([::1]:49200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4fL-00049w-Oi
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bf-0001X1-Nr
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:22 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bd-00035E-9Y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:19 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MSswA-1nDnVp3E9W-00UHW7; Mon, 22
 Nov 2021 09:23:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] linux-user: Split out do_getdents, do_getdents64
Date: Mon, 22 Nov 2021 09:23:06 +0100
Message-Id: <20211122082310.377809-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
References: <20211122082310.377809-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EXbD8RfDaifTz8whB2UETtGdgwPtd+pceXxR4nhay8jKwdPOsNZ
 yP3XOkJkwjK9wr5wElj+1muY8flQoSBZt7w3v3GOr8yoQp7Mv+vzjej4YVcqfPo57sBcaMG
 pOiFDLH7LwF6LCpIiiCYXzXO+91VFDM9wQhJ/Z8c2C6vivcBy5ZPDopVt3ppjAIHk/bLlTG
 HQfIOc9l3flOtJ4xximNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SONwfYRPFhI=:ud79adI9E08AE1AD+z2Gwv
 c25LuXBrbb15DHv9vRgYiVLD2X6Knv74F8A4xk0HquDeX1f07AS02gGGXJv+bubSaXrlM7h/b
 2VelmIicLM0rxFw2nXI9FsAOcHfO5TqLQ/pSkWCyljfVz6UtodT1u3I3JaHLoyD9vWkUXQQvJ
 I79IP9SOYiPRTeawAFj/6gJqopHB4wqzZ077fGA68WmUzrFGpRG9VGKqmeYW5hcq523xIyTCN
 PgBfUin0fRTkrlHH8sqy5BksaWRSAYq0Au43GZUg4iGrEZbr2P+/ZAHCwZz/A8rx60ncX+qY0
 XqSH/nsOIe6xEtiaQsZ9g7AZe683mVjZA71jpGolmBDwadhv3MwmE1yXp7m6KkXI9IewOVBtp
 fe3LUuYNJ5xGue1MBXCTJp9zb/T20TZXNB5QTs+xcyLLJkS0V2F7IVZ7x3wM2telKu/OJKLW/
 OJmQr/6R3peHpeOInm+WEKVcfl9r1h/TFKdRNKF3TdwCVE91DLsFRxTU74iwIoe4wdE3tsOqc
 /5Sy3Bn5zCgX3QynX4nOmSHKU0QwN01TjGjeSdPxBWB91qBizp0hNV54EFCFd60XaZtwo8BDf
 AGoSGevCIqQBCeIh/qg3ko0uQNeMQmgFUiAWjFCVMgPd+05NApoaynJNl1ukkh9zAeGvcn/Jo
 aJt27qhlvAQUUUJojExmz+YSqZ6e+CynU+xPKneluiaxq3boe0vcfDvBypPwhwhqbf14=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Retain all 3 implementations of getdents for now.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211114103539.298686-2-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 325 +++++++++++++++++++++++--------------------
 1 file changed, 172 insertions(+), 153 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 544f5b662ffe..a2f605dec4ca 100644
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
2.31.1


