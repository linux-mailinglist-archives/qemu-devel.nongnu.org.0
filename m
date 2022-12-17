Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875D264FB87
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bcF-0007cn-RZ; Sat, 17 Dec 2022 13:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p6bcC-0007cH-Ti
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:08:52 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p6bc9-00018V-U5
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:08:52 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso5367147pjh.1
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=swKitHaTT1JYSVFNzJ0gbjj5gh1im1NOSJ1+uCtEin8=;
 b=lMJqGN71XARvFbV1/SeXwNjEsTzGmQWGYwlKK5wqLnXTrYtciOwk2arsZaM5R4EJzF
 UzPTEYxajMgbCPDVSMG0P01Wm+bwmSMdrSYcN6nUGDUAlTAH7goyTIb3khpngUAwyvFt
 94Vkt8NYkYnM5oV+5ANA/0p8MPE/yYcaI270l8zDj+KuUX5V+YPU1wROIB5sHuOw6iaB
 aHzLvyLvnDMKfNHdV1OiKUbDz4PCYbGw8Verp5TgPVvsOcHfwwR1SlkQyytt9GVeckaL
 2wpW1Migq6zPzjgfnvHt7QdcTd1QSo5wd0SMq5FznUEipXEIGTFHMqwXf3yAXdOfi2zj
 jjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swKitHaTT1JYSVFNzJ0gbjj5gh1im1NOSJ1+uCtEin8=;
 b=dbtoZpsrt4xnRV5zRIDtEP6E4z5VHL3i/eMVe/tx9tcg5OHSJAooI0FBO+2oIFlt5o
 HQh7J17gUXxMRFvWprX0gSHPxdGH3nhCVIhT1fLASEtCWQGcwuF6ganBFIl/OK06c1nK
 Af5HGbkwYZ0STFvayXOJFBjnBuBW5Hr5aWQHd7vkWzcOGqzZasWbMEp5uFH/MkK9cptr
 aESLDu+ZbGGuYwmABu8t7+vJCXmmPJjBNPHpzXP9RISPF/1myCtWKjsfvRqs0IVXZcUG
 5Cxs2r/Ei3dR6tfd/3gJsElg/qcahLyYlofdM0jlRuWR0w7KJzirXUKtXX5toGtPZSnm
 L8NA==
X-Gm-Message-State: ANoB5pk8vbPGBL7HA6VYzVpISqvY7FyGU7+vSYgemurQyOW11oKcomWc
 UgIJshIsxOQefr0c3aJxpr7RKChTGiI=
X-Google-Smtp-Source: AA0mqf5WKoRNRaLYEXoj+oJvCIBhCuYUvRxXicyRgUIMYNOF2UhTSwmpoVBlTXXB6bEzSrGuR+HLUQ==
X-Received: by 2002:a05:6a21:6d9d:b0:a5:6ec:dbc3 with SMTP id
 wl29-20020a056a216d9d00b000a506ecdbc3mr57386992pzb.19.1671300528195; 
 Sat, 17 Dec 2022 10:08:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902784500b0018685257c0dsm3839457pln.58.2022.12.17.10.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 10:08:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related functions and
 macros
Date: Sat, 17 Dec 2022 10:08:44 -0800
Message-Id: <20221217180844.3453267-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221217180844.3453267-1-raj.khem@gmail.com>
References: <20221217180844.3453267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=raj.khem@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
anf macros behave same as their 64 suffixed counterparts. This also
helps in compiling with latest musl C library, where these macros and
functions are no more available under _GNU_SOURCE feature macro

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 153 +++++++++++--------------------------------
 1 file changed, 39 insertions(+), 114 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1f8c10f8ef..30d83ed162 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -795,8 +795,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
  */
 #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
 /* Similarly for fcntl. Note that callers must always:
- *  pass the F_GETLK64 etc constants rather than the unsuffixed F_GETLK
- *  use the flock64 struct rather than unsuffixed flock
+ *  pass the F_GETLK etc constants rather than the unsuffixed F_GETLK
+ *  use the flock struct rather than unsuffixed flock
  * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
  */
 #ifdef __NR_fcntl64
@@ -6797,13 +6797,13 @@ static int target_to_host_fcntl_cmd(int cmd)
         ret = cmd;
         break;
     case TARGET_F_GETLK:
-        ret = F_GETLK64;
+        ret = F_GETLK;
         break;
     case TARGET_F_SETLK:
-        ret = F_SETLK64;
+        ret = F_SETLK;
         break;
     case TARGET_F_SETLKW:
-        ret = F_SETLKW64;
+        ret = F_SETLKW;
         break;
     case TARGET_F_GETOWN:
         ret = F_GETOWN;
@@ -6817,17 +6817,6 @@ static int target_to_host_fcntl_cmd(int cmd)
     case TARGET_F_SETSIG:
         ret = F_SETSIG;
         break;
-#if TARGET_ABI_BITS == 32
-    case TARGET_F_GETLK64:
-        ret = F_GETLK64;
-        break;
-    case TARGET_F_SETLK64:
-        ret = F_SETLK64;
-        break;
-    case TARGET_F_SETLKW64:
-        ret = F_SETLKW64;
-        break;
-#endif
     case TARGET_F_SETLEASE:
         ret = F_SETLEASE;
         break;
@@ -6879,8 +6868,8 @@ static int target_to_host_fcntl_cmd(int cmd)
      * them to 5, 6 and 7 before making the syscall(). Since we make the
      * syscall directly, adjust to what is supported by the kernel.
      */
-    if (ret >= F_GETLK64 && ret <= F_SETLKW64) {
-        ret -= F_GETLK64 - 5;
+    if (ret >= F_GETLK && ret <= F_SETLKW) {
+        ret -= F_GETLK - 5;
     }
 #endif
 
@@ -6913,55 +6902,11 @@ static int host_to_target_flock(int type)
     return type;
 }
 
-static inline abi_long copy_from_user_flock(struct flock64 *fl,
-                                            abi_ulong target_flock_addr)
-{
-    struct target_flock *target_fl;
-    int l_type;
-
-    if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-        return -TARGET_EFAULT;
-    }
-
-    __get_user(l_type, &target_fl->l_type);
-    l_type = target_to_host_flock(l_type);
-    if (l_type < 0) {
-        return l_type;
-    }
-    fl->l_type = l_type;
-    __get_user(fl->l_whence, &target_fl->l_whence);
-    __get_user(fl->l_start, &target_fl->l_start);
-    __get_user(fl->l_len, &target_fl->l_len);
-    __get_user(fl->l_pid, &target_fl->l_pid);
-    unlock_user_struct(target_fl, target_flock_addr, 0);
-    return 0;
-}
-
-static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
-                                          const struct flock64 *fl)
-{
-    struct target_flock *target_fl;
-    short l_type;
-
-    if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-        return -TARGET_EFAULT;
-    }
-
-    l_type = host_to_target_flock(fl->l_type);
-    __put_user(l_type, &target_fl->l_type);
-    __put_user(fl->l_whence, &target_fl->l_whence);
-    __put_user(fl->l_start, &target_fl->l_start);
-    __put_user(fl->l_len, &target_fl->l_len);
-    __put_user(fl->l_pid, &target_fl->l_pid);
-    unlock_user_struct(target_fl, target_flock_addr, 1);
-    return 0;
-}
-
-typedef abi_long from_flock64_fn(struct flock64 *fl, abi_ulong target_addr);
-typedef abi_long to_flock64_fn(abi_ulong target_addr, const struct flock64 *fl);
+typedef abi_long from_flock_fn(struct flock *fl, abi_ulong target_addr);
+typedef abi_long to_flock_fn(abi_ulong target_addr, const struct flock *fl);
 
 #if defined(TARGET_ARM) && TARGET_ABI_BITS == 32
-struct target_oabi_flock64 {
+struct target_oabi_flock {
     abi_short l_type;
     abi_short l_whence;
     abi_llong l_start;
@@ -6969,10 +6914,10 @@ struct target_oabi_flock64 {
     abi_int   l_pid;
 } QEMU_PACKED;
 
-static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+static inline abi_long copy_from_user_oabi_flock(struct flock *fl,
                                                    abi_ulong target_flock_addr)
 {
-    struct target_oabi_flock64 *target_fl;
+    struct target_oabi_flock *target_fl;
     int l_type;
 
     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
@@ -6993,10 +6938,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
     return 0;
 }
 
-static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
-                                                 const struct flock64 *fl)
+static inline abi_long copy_to_user_oabi_flock(abi_ulong target_flock_addr,
+                                                 const struct flock *fl)
 {
-    struct target_oabi_flock64 *target_fl;
+    struct target_oabi_flock *target_fl;
     short l_type;
 
     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
@@ -7014,10 +6959,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
 }
 #endif
 
-static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+static inline abi_long copy_from_user_flock(struct flock *fl,
                                               abi_ulong target_flock_addr)
 {
-    struct target_flock64 *target_fl;
+    struct target_flock *target_fl;
     int l_type;
 
     if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
@@ -7038,10 +6983,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
     return 0;
 }
 
-static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
-                                            const struct flock64 *fl)
+static inline abi_long copy_to_user_flock(abi_ulong target_flock_addr,
+                                            const struct flock *fl)
 {
-    struct target_flock64 *target_fl;
+    struct target_flock *target_fl;
     short l_type;
 
     if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
@@ -7060,7 +7005,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
 
 static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
 {
-    struct flock64 fl64;
+    struct flock fl64;
 #ifdef F_GETOWN_EX
     struct f_owner_ex fox;
     struct target_f_owner_ex *target_fox;
@@ -7073,6 +7018,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
 
     switch(cmd) {
     case TARGET_F_GETLK:
+    case TARGET_F_OFD_GETLK:
         ret = copy_from_user_flock(&fl64, arg);
         if (ret) {
             return ret;
@@ -7082,32 +7028,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
             ret = copy_to_user_flock(arg, &fl64);
         }
         break;
-
     case TARGET_F_SETLK:
     case TARGET_F_SETLKW:
-        ret = copy_from_user_flock(&fl64, arg);
-        if (ret) {
-            return ret;
-        }
-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
-        break;
-
-    case TARGET_F_GETLK64:
-    case TARGET_F_OFD_GETLK:
-        ret = copy_from_user_flock64(&fl64, arg);
-        if (ret) {
-            return ret;
-        }
-        ret = get_errno(safe_fcntl(fd, host_cmd, &fl64));
-        if (ret == 0) {
-            ret = copy_to_user_flock64(arg, &fl64);
-        }
-        break;
-    case TARGET_F_SETLK64:
-    case TARGET_F_SETLKW64:
     case TARGET_F_OFD_SETLK:
     case TARGET_F_OFD_SETLKW:
-        ret = copy_from_user_flock64(&fl64, arg);
+        ret = copy_from_user_flock(&fl64, arg);
         if (ret) {
             return ret;
         }
@@ -7332,7 +7257,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
         arg2 = arg3;
         arg3 = arg4;
     }
-    return get_errno(truncate64(arg1, target_offset64(arg2, arg3)));
+    return get_errno(truncate(arg1, target_offset64(arg2, arg3)));
 }
 #endif
 
@@ -7346,7 +7271,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
         arg2 = arg3;
         arg3 = arg4;
     }
-    return get_errno(ftruncate64(arg1, target_offset64(arg2, arg3)));
+    return get_errno(ftruncate(arg1, target_offset64(arg2, arg3)));
 }
 #endif
 
@@ -8452,7 +8377,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
     void *tdirp;
     int hlen, hoff, toff;
     int hreclen, treclen;
-    off64_t prev_diroff = 0;
+    off_t prev_diroff = 0;
 
     hdirp = g_try_malloc(count);
     if (!hdirp) {
@@ -8505,7 +8430,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
              * Return what we have, resetting the file pointer to the
              * location of the first record not returned.
              */
-            lseek64(dirfd, prev_diroff, SEEK_SET);
+            lseek(dirfd, prev_diroff, SEEK_SET);
             break;
         }
 
@@ -8539,7 +8464,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
     void *tdirp;
     int hlen, hoff, toff;
     int hreclen, treclen;
-    off64_t prev_diroff = 0;
+    off_t prev_diroff = 0;
 
     hdirp = g_try_malloc(count);
     if (!hdirp) {
@@ -8581,7 +8506,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
              * Return what we have, resetting the file pointer to the
              * location of the first record not returned.
              */
-            lseek64(dirfd, prev_diroff, SEEK_SET);
+            lseek(dirfd, prev_diroff, SEEK_SET);
             break;
         }
 
@@ -11114,7 +11039,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 return -TARGET_EFAULT;
             }
         }
-        ret = get_errno(pread64(arg1, p, arg3, target_offset64(arg4, arg5)));
+        ret = get_errno(pread(arg1, p, arg3, target_offset64(arg4, arg5)));
         unlock_user(p, arg2, ret);
         return ret;
     case TARGET_NR_pwrite64:
@@ -11131,7 +11056,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 return -TARGET_EFAULT;
             }
         }
-        ret = get_errno(pwrite64(arg1, p, arg3, target_offset64(arg4, arg5)));
+        ret = get_errno(pwrite(arg1, p, arg3, target_offset64(arg4, arg5)));
         unlock_user(p, arg2, 0);
         return ret;
 #endif
@@ -11954,14 +11879,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_fcntl64:
     {
         int cmd;
-        struct flock64 fl;
-        from_flock64_fn *copyfrom = copy_from_user_flock64;
-        to_flock64_fn *copyto = copy_to_user_flock64;
+        struct flock fl;
+        from_flock_fn *copyfrom = copy_from_user_flock;
+        to_flock_fn *copyto = copy_to_user_flock;
 
 #ifdef TARGET_ARM
         if (!cpu_env->eabi) {
-            copyfrom = copy_from_user_oabi_flock64;
-            copyto = copy_to_user_oabi_flock64;
+            copyfrom = copy_from_user_oabi_flock;
+            copyto = copy_to_user_oabi_flock;
         }
 #endif
 
@@ -11971,7 +11896,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         }
 
         switch(arg2) {
-        case TARGET_F_GETLK64:
+        case TARGET_F_GETLK:
             ret = copyfrom(&fl, arg3);
             if (ret) {
                 break;
@@ -11982,8 +11907,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             }
 	    break;
 
-        case TARGET_F_SETLK64:
-        case TARGET_F_SETLKW64:
+        case TARGET_F_SETLK:
+        case TARGET_F_SETLKW:
             ret = copyfrom(&fl, arg3);
             if (ret) {
                 break;
-- 
2.39.0


