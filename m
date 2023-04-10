Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD96DC5A7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ploV1-0005Aa-Mi; Mon, 10 Apr 2023 06:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>)
 id 1ploUv-00059J-Ut
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:41 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>) id 1ploUr-00021M-87
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:41 -0400
Received: from localhost.localdomain (unknown [223.72.42.7])
 by APP-05 (Coremail) with SMTP id zQCowAD35xTR4DNkglhzEA--.63784S4;
 Mon, 10 Apr 2023 18:11:29 +0800 (CST)
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
To: qemu-devel@nongnu.org
Cc: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Subject: [PATCH 2/3] linux-user: Add more drm ioctls for mesa
Date: Mon, 10 Apr 2023 18:11:17 +0800
Message-Id: <20230410101118.59564-3-tanxiongchuan@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
References: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD35xTR4DNkglhzEA--.63784S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr4DtFWUKryDuFyxuw1xZrb_yoW3Cr1xpF
 WUKr43JF4rtrZ2g39Fka1UA3WfXw18Kr17Ca1xGw4rA3ZYqrykKF1DCasFyF4rJFy7CFWj
 k3WqyayFkrWUuwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9v14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWUJVWUGwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
 x26xkF7I0E14v26r1Y6r1xM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
 xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
 vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
 r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
 v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
 j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
 W8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU12Nt3UUUUU==
X-Originating-IP: [223.72.42.7]
X-CM-SenderInfo: xwdq5xprqjuxxxdqqxxvufhxpvfd2hldfou0/
Received-SPF: none client-ip=159.226.251.25;
 envelope-from=tanxiongchuan@isrc.iscas.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
---
 linux-user/ioctls.h        | 11 ++++-
 linux-user/syscall.c       | 98 ++++++++++++++++++++++++++++++++++++--
 linux-user/syscall_defs.h  | 34 +++++++++++++
 linux-user/syscall_types.h | 24 ++++++++++
 4 files changed, 163 insertions(+), 4 deletions(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 54b44a29a9..83ccf785b5 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -685,7 +685,16 @@
 #ifdef HAVE_DRM_H
   IOCTL_SPECIAL(DRM_IOCTL_VERSION, IOC_RW, do_ioctl_drm,
                 MK_PTR(MK_STRUCT(STRUCT_drm_version)))
-
+  IOCTL_SPECIAL(DRM_IOCTL_GET_MAGIC, IOC_R, do_ioctl_drm,
+                MK_PTR(MK_STRUCT(STRUCT_drm_auth)))
+  IOCTL_SPECIAL(DRM_IOCTL_GET_CLIENT, IOC_RW, do_ioctl_drm,
+                MK_PTR(MK_STRUCT(STRUCT_drm_client)))
+  IOCTL_SPECIAL(DRM_IOCTL_GEM_CLOSE, IOC_W, do_ioctl_drm,
+                MK_PTR(MK_STRUCT(STRUCT_drm_gem_close)))
+  IOCTL_SPECIAL(DRM_IOCTL_GET_CAP, IOC_RW, do_ioctl_drm,
+                MK_PTR(MK_STRUCT(STRUCT_drm_get_cap)))
+  IOCTL_SPECIAL(DRM_IOCTL_PRIME_HANDLE_TO_FD, IOC_RW, do_ioctl_drm,
+                MK_PTR(MK_STRUCT(STRUCT_drm_prime_handle)))
 #ifdef CONFIG_DRM_AMDGPU
 #else
   IOCTL_SPECIAL(DRM_IOCTL_I915_GETPARAM, IOC_RW, do_ioctl_drm_i915,
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bb0db61990..698b44da03 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5624,15 +5624,48 @@ static inline void host_to_target_drmversion(
     unlock_drm_version(host_ver, target_ver, true);
 }
 
+static abi_long do_ioctl_drm_get_client(const IOCTLEntry *ie,
+                                        struct drm_client *host_client,
+                                        int fd, abi_long arg)
+{
+    abi_long ret;
+    struct target_drm_client *target_client;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_client, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    __get_user(host_client->idx, &target_client->idx);
+    __get_user(host_client->auth, &target_client->auth);
+    __get_user(host_client->pid, &target_client->pid);
+    __get_user(host_client->uid, &target_client->uid);
+    __get_user(host_client->magic, &target_client->magic);
+    __get_user(host_client->iocs, &target_client->iocs);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_client));
+
+    if (!is_error(ret)) {
+        __put_user(host_client->idx, &target_client->idx);
+        __put_user(host_client->auth, &target_client->auth);
+        __put_user(host_client->pid, &target_client->pid);
+        __put_user(host_client->uid, &target_client->uid);
+        __put_user(host_client->magic, &target_client->magic);
+        __put_user(host_client->iocs, &target_client->iocs);
+    }
+
+    unlock_user_struct(target_client, arg, 0);
+    return ret;
+}
+
 static abi_long do_ioctl_drm(const IOCTLEntry *ie, uint8_t *buf_temp,
                              int fd, int cmd, abi_long arg)
 {
-    struct drm_version *ver;
-    struct target_drm_version *target_ver;
     abi_long ret;
 
     switch (ie->host_cmd) {
-    case DRM_IOCTL_VERSION:
+    case DRM_IOCTL_VERSION: {
+        struct drm_version *ver;
+        struct target_drm_version *target_ver;
         if (!lock_user_struct(VERIFY_WRITE, target_ver, arg, 0)) {
             return -TARGET_EFAULT;
         }
@@ -5649,6 +5682,65 @@ static abi_long do_ioctl_drm(const IOCTLEntry *ie, uint8_t *buf_temp,
         unlock_user_struct(target_ver, arg, 0);
         return ret;
     }
+    case DRM_IOCTL_GET_MAGIC: {
+        struct drm_auth *auth;
+        struct target_drm_auth *target_auth;
+        if (!lock_user_struct(VERIFY_READ, target_auth, arg, 0)) {
+            return -TARGET_EFAULT;
+        }
+        auth = (struct drm_auth *)buf_temp;
+        __get_user(auth->magic, &target_auth->magic);
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd, auth));
+        unlock_user_struct(target_auth, arg, 0);
+        return ret;
+    }
+    case DRM_IOCTL_GEM_CLOSE: {
+        struct drm_gem_close *gem_close;
+        struct target_drm_gem_close *target_gem_close;
+        if (!lock_user_struct(VERIFY_WRITE, target_gem_close, arg, 0)) {
+            return -TARGET_EFAULT;
+        }
+        gem_close = (struct drm_gem_close *)buf_temp;
+        __get_user(gem_close->handle, &target_gem_close->handle);
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd, gem_close));
+        __put_user(gem_close->handle, &target_gem_close->handle);
+        unlock_user_struct(target_gem_close, arg, 0);
+        return ret;
+    }
+    case DRM_IOCTL_GET_CAP: {
+        struct drm_get_cap *cap;
+        struct target_drm_get_cap *target_cap;
+        if (!lock_user_struct(VERIFY_WRITE, target_cap, arg, 0)) {
+            return -TARGET_EFAULT;
+        }
+        cap = (struct drm_get_cap *)buf_temp;
+        __get_user(cap->capability, &target_cap->capability);
+        __get_user(cap->value, &target_cap->value);
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd, cap));
+        __put_user(cap->value, &target_cap->value);
+        unlock_user_struct(target_cap, arg, 0);
+        return ret;
+    }
+    case DRM_IOCTL_GET_CLIENT:
+        return do_ioctl_drm_get_client(ie,
+                                       (struct drm_client *)buf_temp,
+                                       fd, arg);
+    case DRM_IOCTL_PRIME_HANDLE_TO_FD: {
+        struct drm_prime_handle *prime_handle;
+        struct target_drm_prime_handle *target_prime_handle;
+        if (!lock_user_struct(VERIFY_WRITE, target_prime_handle, arg, 0)) {
+            return -TARGET_EFAULT;
+        }
+        prime_handle = (struct drm_prime_handle *)buf_temp;
+        __get_user(prime_handle->handle, &target_prime_handle->handle);
+        __get_user(prime_handle->flags, &target_prime_handle->flags);
+        __get_user(prime_handle->fd, &target_prime_handle->fd);
+        ret = get_errno(safe_ioctl(fd, ie->host_cmd, prime_handle));
+        __put_user(prime_handle->fd, &target_prime_handle->fd);
+        unlock_user_struct(target_prime_handle, arg, 0);
+        return ret;
+    }
+    }
     return -TARGET_ENOSYS;
 }
 
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index e435649693..5429834236 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1226,6 +1226,11 @@ struct target_rtc_pll_info {
 
 /* drm ioctls */
 #define TARGET_DRM_IOCTL_VERSION      TARGET_IOWRU('d', 0x00)
+#define TARGET_DRM_IOCTL_GET_MAGIC    TARGET_IORU('d', 0x02)
+#define TARGET_DRM_IOCTL_GET_CLIENT   TARGET_IOWRU('d', 0x05)
+#define TARGET_DRM_IOCTL_GEM_CLOSE    TARGET_IOWU('d', 0x09)
+#define TARGET_DRM_IOCTL_GET_CAP      TARGET_IOWRU('d', 0x0c)
+#define TARGET_DRM_IOCTL_PRIME_HANDLE_TO_FD  TARGET_IOWRU('d', 0x2d)
 
 #ifdef CONFIG_DRM_AMDGPU
 
@@ -2690,6 +2695,35 @@ struct target_drm_version {
     abi_ulong desc;
 };
 
+struct target_drm_auth {
+    int magic;
+};
+
+struct target_drm_client {
+    int idx;
+    int auth;
+    abi_ulong pid;
+    abi_ulong uid;
+    abi_ulong magic;
+    abi_ulong iocs;
+};
+
+struct target_drm_gem_close {
+    int handle;
+    int pad;
+};
+
+struct target_drm_get_cap {
+    abi_ulong capability;
+    abi_ulong value;
+};
+
+struct target_drm_prime_handle {
+    int handle;
+    int flags;
+    int fd;
+};
+
 struct target_drm_i915_getparam {
     int param;
     abi_ulong value;
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index c3b43f8022..2a48b2ec47 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -331,6 +331,30 @@ STRUCT(drm_version,
        TYPE_ULONG, /* desc_len */
        TYPE_PTRVOID) /* desc */
 
+STRUCT(drm_auth,
+       TYPE_INT) /* magic */
+
+STRUCT(drm_client,
+       TYPE_INT, /* idx */
+       TYPE_INT, /* auth */
+       TYPE_ULONG, /* pid */
+       TYPE_ULONG, /* uid */
+       TYPE_ULONG, /* magic */
+       TYPE_ULONG) /* iocs */
+
+STRUCT(drm_gem_close,
+       TYPE_INT, /* handle */
+       TYPE_INT) /* pad */
+
+STRUCT(drm_get_cap,
+       TYPE_ULONGLONG, /* capability */
+       TYPE_ULONGLONG) /* value */
+
+STRUCT(drm_prime_handle,
+       TYPE_INT, /* handle */
+       TYPE_INT, /* flags */
+       TYPE_INT) /* fd */
+
 STRUCT(drm_i915_getparam,
        TYPE_INT, /* param */
        TYPE_PTRVOID) /* value */
-- 
2.40.0


