Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1C0458A90
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 09:29:31 +0100 (CET)
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp4he-00005s-O6
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 03:29:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4br-0001bw-9l
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:37 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:39403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mp4bn-00038X-4Y
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 03:23:31 -0500
Received: from quad ([82.142.2.234]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MAOa3-1mut5e2LWd-00Bvqw; Mon, 22
 Nov 2021 09:23:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] linux-user: Rewrite do_getdents, do_getdents64
Date: Mon, 22 Nov 2021 09:23:09 +0100
Message-Id: <20211122082310.377809-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122082310.377809-1-laurent@vivier.eu>
References: <20211122082310.377809-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U3chgT1UfwZszQ+kWmHGEleRdvMdH3UgFwxO2XQyVt3l5ff5pbt
 7CPGFva6H8Cd16oohgUdQ2jpRoQBzxJ4tVYNGKxLuJJr2uVPwpe+MMolRWewBETV2bVqz+T
 ArHd5YXqrtlN5bx2IhFZstuyzKDC6TOKQ1V9KoVcCc1+WOVPx0bYiULnG+dxmkvKrCELSNn
 e46YOb0L38sIkyx9cGd8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DBzNlpGLRxU=:Ev1wNTVoMFnk5XYhUFsnjG
 HdLcjqIZClJgJXcw/Fu9nVjRSC8wLlXD7axD6zkwoHxaKpsUL1Iti9FncTBe54WbbUM6WG2uY
 IfOyZLzD6B+rXBKrLQZFpXwBkQCdiY36oE89I2Jc1TyFHohKOfqscKu/sHBMdPth5B8TzVSA1
 QOoDPBu+Yg72i8VBV7QdwmKOUwu3mije3MIWpJYlf+UjpzgXwkJGf5raGSWH5X8bNIgpt7/zW
 B43+0kC9iRhI/tpKuc9BfnIAx7K+ukoguF4ntjympMUB6/Sn+tVkdG4CDATaUmg8bNnwyySPu
 QtyyyRCGna6RNa7sSVvq/ysOTKj0Z4VBGZlGy2e0iRs/pgrEWSbKpMisoZ6FkQAPDf835ZWL8
 8yYVN5kpJLUBfnSDd3cJXhlefpyUgvuCP3SeC1sJ8h1SNcP5cRNo2ghVYiAI8tNsEaB0wGMGT
 ff5mhnu8BE5dzoD0W/j9GtR3VnwVm1zW8n/AxaNNPVb8VWnV0TgYpGh17oIXTmyMqR1tTPeEV
 mu8svibYRGFyYSIQYTf3C/a00uqylhNZWimolEfzeeF9YLQ+izJuozDCwPl/UWQCoSpXhbrmR
 iQeZO+Hb5j2vxZehRNLeug5Isg2Sps+hx6lz7bdb1jXlV6qUy77qdlz+t8N2loF+MZRZBpuIz
 IPRlHYD/jGVONaQKznHo4zjozmYhWI60dCpizLp1ehan2r8DApQz7lb/XEQDOE1xpSTk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Always allocate host storage; this ensures that the struct
is sufficiently aligned for the host.  Merge the three host
implementations of getdents via a few ifdefs.  Utilize the
same method for do_getdents64.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/704
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211114103539.298686-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 261 ++++++++++++++++++++-----------------------
 1 file changed, 122 insertions(+), 139 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 499415ad81b8..f1cfcc810486 100644
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
+
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
+        return -TARGET_ENOMEM;
+    }
 
 #ifdef EMULATE_GETDENTS_WITH_GETDENTS
-# if TARGET_ABI_BITS == 32 && HOST_LONG_BITS == 64
-    struct target_dirent *target_dirp;
-    struct linux_dirent *dirp;
-    abi_long count = arg3;
+    hlen = sys_getdents(dirfd, hdirp, count);
+#else
+    hlen = sys_getdents64(dirfd, hdirp, count);
+#endif
 
-    dirp = g_try_malloc(count);
-    if (!dirp) {
-        return -TARGET_ENOMEM;
+    hlen = get_errno(hlen);
+    if (is_error(hlen)) {
+        return hlen;
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
+
+    for (hoff = toff = 0; hoff < hlen; hoff += hreclen, toff += treclen) {
+#ifdef EMULATE_GETDENTS_WITH_GETDENTS
+        struct linux_dirent *hde = hdirp + hoff;
 #else
-    /* Implement getdents in terms of getdents64 */
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
+        struct linux_dirent64 *hde = hdirp + hoff;
+#endif
+        struct target_dirent *tde = tdirp + toff;
+        int namelen;
+        uint8_t type;
 
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
+        namelen = strlen(hde->d_name);
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent));
 
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
+        if (toff + treclen > count) {
             /*
-             * The target_dirent type is in what was formerly a padding
-             * byte at the end of the structure:
+             * If the host struct is smaller than the target struct, or
+             * requires less alignment and thus packs into less space,
+             * then the host can return more entries than we can pass
+             * on to the guest.
              */
-            *(((char *)tde) + treclen - 1) = type;
-
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            tde = (struct target_dirent *)((char *)tde + treclen);
-            len -= reclen;
-            tlen += treclen;
+            if (toff == 0) {
+                toff = -TARGET_EINVAL; /* result buffer is too small */
+                break;
+            }
+            /*
+             * Return what we have, resetting the file pointer to the
+             * location of the first record not returned.
+             */
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
+
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
+        return -TARGET_ENOMEM;
+    }
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
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
2.31.1


