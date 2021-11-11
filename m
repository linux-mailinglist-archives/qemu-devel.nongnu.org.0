Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA144D586
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:07:44 +0100 (CET)
Received: from localhost ([::1]:54402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml7vj-0004T2-Fh
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:07:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tN-0002UE-KD
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:17 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:47505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ml7tL-0001NC-Aw
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:05:17 -0500
Received: from quad ([82.142.28.210]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MwwuJ-1mWK4B2K6d-00ySVn; Thu, 11
 Nov 2021 12:05:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] linux-user: Rewrite do_getdents, do_getdents64
Date: Thu, 11 Nov 2021 12:05:04 +0100
Message-Id: <20211111110504.1574242-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111110504.1574242-1-laurent@vivier.eu>
References: <20211111110504.1574242-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TrBN8cvwb47goh6sHFTlUqiwrGspctKFmIUoUl1kuFEYWshXjzN
 PeSHNpUu1tjArmbbrxb7xcAQrWuhxcp5JR4vUmNw/r4xSqe9JreosX84Sf8MHbs20RKF+3W
 VrfO1rCiYMD0csxQVCgyyVugndDpDBHbS/CHe9Nr3Yzsznx2yfkLXUWEF+e0R9jCZQW84vs
 Idhe/OslXAz2z1aw6k5RA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KSW34BrYp7U=:YYPwYIYcoD4oOXjaN3PA+u
 7tFFKxRYqU8zDo5sWQXLWWL5iMY9AFRKxVTyDCCKPWQpShgoJfyoR5MLNspsA2td86UcrFovH
 lCV3IFer0EnfTJQzmfJMBRW1KHgA347e0VmciiI8S/dVm6qj51JhCba8AxNbI7DyFrAfg+SES
 hK7kOKr0DEM/z29zZhPP1Zssu53Veb2ozw8hHjzx/OcOoGnims1TMPXLsQOMnAE9grvdVRF38
 FdFV1OMTn13YAk6aBn1qFwWqb3yrGgq8KVoGpr2P3rHqFUxpapfqgpZDip6TmLaafRNA1UpCU
 vpwdtnVusnpCh5VPJ7/ggTyZThCjnaGUrX4XL4oPVnavRg6VHMRKv9P4IhGOD5ov4tAnip1Gf
 1HbTxWPSUA4O0X03rb//v+F6KeCglqEal6EPBBEE7CC1+7SmLvhSfI0vcZ4Qus3FdvE+t3SLr
 RIeCAfIoMYd2AKXto+MACtH2BVwr9HpGd+ymSkCUX8mfpuiDFFCOQ8IPauJuyiQ+I+y8DAC8/
 OyLmtmvIRMFhUqH+ViNfHHk1cdplDxDOWRAndrEPUuNd9J7zi2+WhUjJ+lLvYLflyBweC7fcX
 Hl69xFf3ZV/MQoonJb0w8bjmTXcDhwrHf2hxtsyI4R5zDU9WQe88nGnsONoyIWMny4iWvYQU9
 PS/6G73yoBDqPiOLydm+uRuNKrgz+2ivOja8bQhyQ+yEwBhe9tVhDPnhYkwchXUYnPjE=
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
Message-Id: <20211107124845.1174791-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 243 ++++++++++++++++++-------------------------
 1 file changed, 101 insertions(+), 142 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 499415ad81b8..01efd5773b9a 100644
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
+    hlen = sys_getdents(arg1, hdirp, count);
+#else
+    hlen = sys_getdents64(arg1, hdirp, count);
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
         /*
-         * Convert the dirent64 structs to target dirent.  We do this
-         * in-place, since we can guarantee that a target_dirent is no
-         * larger than a dirent64; however this means we have to be
-         * careful to read everything before writing in the new format.
+         * If somehow the host dirent is smaller than the target dirent,
+         * then the host could return more dirent in the buffer than we
+         * can pass on to the host.  This could be fixed by returning
+         * fewer dirent to the guest and lseek on the dirfd to reset the
+         * file pointer to the final hde->d_off.
          */
-        struct linux_dirent64 *de;
-        struct target_dirent *tde;
-        int len = ret;
-        int tlen = 0;
+        QEMU_BUILD_BUG_ON(sizeof(*hde) < sizeof(*tde));
 
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
+        namelen = strlen(hde->d_name);
+        hreclen = hde->d_reclen;
+        treclen = offsetof(struct target_dirent, d_name) + namelen + 2;
+        treclen = QEMU_ALIGN_UP(treclen, __alignof(struct target_dirent));
 
-            de = (struct linux_dirent64 *)((char *)de + reclen);
-            tde = (struct target_dirent *)((char *)tde + treclen);
-            len -= reclen;
-            tlen += treclen;
-        }
-        ret = tlen;
-    }
-    unlock_user(dirp, arg2, ret);
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
+static int do_getdents64(abi_long arg1, abi_long arg2, abi_long count)
 {
-    struct linux_dirent64 *dirp;
-    abi_long count = arg3;
-    int ret;
+    g_autofree void *hdirp = NULL;
+    void *tdirp;
+    int hlen, hoff, toff;
+    int hreclen, treclen;
+
+    hdirp = g_try_malloc(count);
+    if (!hdirp) {
+        return -TARGET_ENOMEM;
+    }
+
+    hlen = get_errno(sys_getdents64(arg1, hdirp, count));
+    if (is_error(hlen)) {
+        return hlen;
+    }
 
-    dirp = lock_user(VERIFY_WRITE, arg2, count, 0);
-    if (!dirp) {
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
2.31.1


