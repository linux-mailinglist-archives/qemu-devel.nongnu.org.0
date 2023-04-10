Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABD46DC5A8
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 12:12:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ploV2-0005AZ-Fw; Mon, 10 Apr 2023 06:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>)
 id 1ploUw-00059V-Ip
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:45 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tanxiongchuan@isrc.iscas.ac.cn>) id 1ploUr-00021L-LC
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 06:11:42 -0400
Received: from localhost.localdomain (unknown [223.72.42.7])
 by APP-05 (Coremail) with SMTP id zQCowAD35xTR4DNkglhzEA--.63784S5;
 Mon, 10 Apr 2023 18:11:29 +0800 (CST)
From: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
To: qemu-devel@nongnu.org
Cc: Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>
Subject: [PATCH 3/3] linux-user: Add amdgpu specific drm ioctls for mesa
Date: Mon, 10 Apr 2023 18:11:18 +0800
Message-Id: <20230410101118.59564-4-tanxiongchuan@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
References: <20230410101118.59564-1-tanxiongchuan@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD35xTR4DNkglhzEA--.63784S5
X-Coremail-Antispam: 1UD129KBjvAXoW3tF18XF4fWFWUWry7KF1rWFg_yoW8Ar4rXo
 WfWr43Zr18Jw1Fyr90yws7JFsrK34UG398AF4Ikr1UWF1DAry3Zay7GFsxuFy2gFWfJFs5
 G3y2q3Z5Xan3Aa18n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYm7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
 j40_Jr0_Jr4l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r1rM28IrcIa0x
 kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
 jcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
 8EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
 s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
 0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlLvNUUUUU=
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
 linux-user/ioctls.h        |  16 ++
 linux-user/syscall.c       | 312 +++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h  | 100 +++++++++++-
 linux-user/syscall_types.h |  55 +++++++
 4 files changed, 482 insertions(+), 1 deletion(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 83ccf785b5..fa0a583954 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -696,6 +696,22 @@
   IOCTL_SPECIAL(DRM_IOCTL_PRIME_HANDLE_TO_FD, IOC_RW, do_ioctl_drm,
                 MK_PTR(MK_STRUCT(STRUCT_drm_prime_handle)))
 #ifdef CONFIG_DRM_AMDGPU
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_GEM_CREATE, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_gem_create)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_GEM_MMAP, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_gem_mmap)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_CTX, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_ctx)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_CS, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_cs)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_INFO, IOC_W, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_info)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_GEM_METADATA, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_gem_metadata)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_GEM_VA, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_gem_va)))
+  IOCTL_SPECIAL(DRM_IOCTL_AMDGPU_WAIT_CS, IOC_RW, do_ioctl_drm_amdgpu,
+                MK_PTR(MK_STRUCT(STRUCT_drm_amdgpu_wait_cs)))
 #else
   IOCTL_SPECIAL(DRM_IOCTL_I915_GETPARAM, IOC_RW, do_ioctl_drm_i915,
                 MK_PTR(MK_STRUCT(STRUCT_drm_i915_getparam)))
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 698b44da03..c276e4ef02 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5746,6 +5746,318 @@ static abi_long do_ioctl_drm(const IOCTLEntry *ie, uint8_t *buf_temp,
 
 #ifdef CONFIG_DRM_AMDGPU
 
+static abi_long do_ioctl_drm_amdgpu_gem_create(
+                                       const IOCTLEntry *ie,
+                                       union drm_amdgpu_gem_create *host_create,
+                                       int fd, abi_long arg)
+{
+    abi_long ret;
+    union target_drm_amdgpu_gem_create *target_create;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_create, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    __get_user(host_create->in.bo_size, &target_create->in.bo_size);
+    __get_user(host_create->in.alignment, &target_create->in.alignment);
+    __get_user(host_create->in.domains, &target_create->in.domains);
+    __get_user(host_create->in.domain_flags, &target_create->in.domain_flags);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_create));
+
+    if (!is_error(ret)) {
+        __put_user(host_create->out.handle, &target_create->out.handle);
+        __put_user(host_create->out._pad, &target_create->out._pad);
+    }
+
+    unlock_user_struct(target_create, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_gem_mmap(
+                                           const IOCTLEntry *ie,
+                                           union drm_amdgpu_gem_mmap *host_mmap,
+                                           int fd, abi_long arg)
+{
+    abi_long ret;
+    union target_drm_amdgpu_gem_mmap *target_mmap;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_mmap, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    __get_user(host_mmap->in.handle, &target_mmap->in.handle);
+    __get_user(host_mmap->in._pad, &target_mmap->in._pad);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_mmap));
+
+    if (!is_error(ret)) {
+        __put_user(host_mmap->out.addr_ptr, &target_mmap->out.addr_ptr);
+    }
+
+    unlock_user_struct(target_mmap, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_ctx(const IOCTLEntry *ie,
+                                        union drm_amdgpu_ctx *host_ctx,
+                                        int fd, abi_long arg)
+{
+    abi_long ret;
+    struct target_drm_amdgpu_ctx *target_ctx;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_ctx, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    __get_user(host_ctx->in.op, &target_ctx->op);
+    __get_user(host_ctx->in.flags, &target_ctx->flags);
+    __get_user(host_ctx->in.ctx_id, &target_ctx->ctx_id);
+    __get_user(host_ctx->in.priority, &target_ctx->priority);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_ctx));
+
+    if (!is_error(ret)) {
+        memcpy(target_ctx, host_ctx, sizeof(*target_ctx));
+    }
+
+    unlock_user_struct(target_ctx, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_cs(const IOCTLEntry *ie,
+                                       union drm_amdgpu_cs *host_info,
+                                       int fd, abi_long arg)
+{
+    abi_long ret;
+    union target_drm_amdgpu_cs *target_info;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_info, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+
+    __get_user(host_info->in.ctx_id, &target_info->in.ctx_id);
+    __get_user(host_info->in.bo_list_handle, &target_info->in.bo_list_handle);
+    __get_user(host_info->in.num_chunks, &target_info->in.num_chunks);
+    __get_user(host_info->in.flags, &target_info->in.flags);
+
+    host_info->in.chunks = (abi_ullong)lock_user(
+                                  VERIFY_READ,
+                                  target_info->in.chunks,
+                                  target_info->in.num_chunks * sizeof(abi_long),
+                                  1);
+    void *chunks = (void *)host_info->in.chunks;
+    if (!host_info->in.chunks) {
+        unlock_user_struct(target_info, arg, 0);
+        return -EFAULT;
+    }
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_info));
+
+    if (is_error(ret)) {
+        goto fail;
+    }
+
+    __put_user(host_info->out.handle, &target_info->out.handle);
+    unlock_user(chunks, target_info->in.chunks, 0);
+    unlock_user_struct(target_info, arg, 0);
+    return ret;
+
+fail:
+    unlock_user_struct(target_info, arg, 0);
+    return -EFAULT;
+}
+
+static abi_long do_ioctl_drm_amdgpu_info(const IOCTLEntry *ie,
+                                         struct drm_amdgpu_info *host_info,
+                                         int fd, abi_long arg)
+{
+    abi_long ret;
+    struct target_drm_amdgpu_info *target_info;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_info, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_info->return_pointer, &target_info->return_pointer);
+    __get_user(host_info->return_size, &target_info->return_size);
+    __get_user(host_info->query, &target_info->query);
+    __get_user(host_info->read_mmr_reg.dword_offset, &target_info->value[0]);
+    __get_user(host_info->read_mmr_reg.count, &target_info->value[1]);
+    __get_user(host_info->read_mmr_reg.instance, &target_info->value[2]);
+    __get_user(host_info->read_mmr_reg.flags, &target_info->value[3]);
+
+    abi_ullong return_pointer = host_info->return_pointer;
+    host_info->return_pointer = (abi_ullong)lock_user(VERIFY_WRITE,
+                                                      return_pointer,
+                                                      host_info->return_size,
+                                                      1);
+    if (!host_info->return_pointer) {
+        unlock_user_struct(target_info, arg, 0);
+        return -EFAULT;
+    }
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_info));
+
+    if (!is_error(ret)) {
+        unlock_user((void *)host_info->return_pointer,
+                    return_pointer,
+                    host_info->return_size);
+    } else {
+        unlock_user((void *)host_info->return_pointer,
+                    return_pointer, 0);
+    }
+
+    unlock_user_struct(target_info, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_gem_metadata(
+                                  const IOCTLEntry *ie,
+                                  struct drm_amdgpu_gem_metadata *host_metadata,
+                                  int fd, abi_long arg)
+{
+    abi_long ret;
+    struct target_drm_amdgpu_gem_metadata *target_metadata;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_metadata, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_metadata->handle, &target_metadata->handle);
+    __get_user(host_metadata->op, &target_metadata->op);
+    __get_user(host_metadata->data.flags, &target_metadata->flags);
+    __get_user(host_metadata->data.tiling_info, &target_metadata->tiling_info);
+    __get_user(host_metadata->data.data_size_bytes,
+               &target_metadata->data_size_bytes);
+    for (int i = 0; i < 64; i++) {
+        __get_user(host_metadata->data.data[i], &target_metadata->data[i]);
+    }
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_metadata));
+
+    if (!is_error(ret)) {
+        __put_user(host_metadata->handle, &target_metadata->handle);
+        __put_user(host_metadata->op, &target_metadata->op);
+        __put_user(host_metadata->data.flags, &target_metadata->flags);
+        __put_user(host_metadata->data.tiling_info,
+                   &target_metadata->tiling_info);
+        __put_user(host_metadata->data.data_size_bytes,
+                   &target_metadata->data_size_bytes);
+        for (int i = 0; i < 64; i++) {
+            __put_user(host_metadata->data.data[i], &target_metadata->data[i]);
+        }
+    }
+
+    unlock_user_struct(target_metadata, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_gem_va(const IOCTLEntry *ie,
+                                           struct drm_amdgpu_gem_va *host_va,
+                                           int fd, abi_long arg)
+{
+    abi_long ret;
+    struct target_drm_amdgpu_gem_va *target_va;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_va, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_va->handle, &target_va->handle);
+    __get_user(host_va->_pad, &target_va->_pad);
+    __get_user(host_va->operation, &target_va->operation);
+    __get_user(host_va->flags, &target_va->flags);
+    __get_user(host_va->va_address, &target_va->va_address);
+    __get_user(host_va->offset_in_bo, &target_va->offset_in_bo);
+    __get_user(host_va->map_size, &target_va->map_size);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_va));
+
+    if (!is_error(ret)) {
+        __put_user(host_va->handle, &target_va->handle);
+        __put_user(host_va->_pad, &target_va->_pad);
+        __put_user(host_va->operation, &target_va->operation);
+        __put_user(host_va->flags, &target_va->flags);
+        __put_user(host_va->va_address, &target_va->va_address);
+        __put_user(host_va->offset_in_bo, &target_va->offset_in_bo);
+        __put_user(host_va->map_size, &target_va->map_size);
+    }
+
+    unlock_user_struct(target_va, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu_wait_cs(
+                                         const IOCTLEntry *ie,
+                                         union drm_amdgpu_wait_cs *host_wait_cs,
+                                         int fd, abi_long arg)
+{
+    abi_long ret;
+    union target_drm_amdgpu_wait_cs *target_wait_cs;
+
+    if (!lock_user_struct(VERIFY_WRITE, target_wait_cs, arg, 0)) {
+        return -TARGET_EFAULT;
+    }
+    __get_user(host_wait_cs->in.handle, &target_wait_cs->in.handle);
+    __get_user(host_wait_cs->in.timeout, &target_wait_cs->in.timeout);
+    __get_user(host_wait_cs->in.ip_type, &target_wait_cs->in.ip_type);
+    __get_user(host_wait_cs->in.ip_instance, &target_wait_cs->in.ip_instance);
+    __get_user(host_wait_cs->in.ring, &target_wait_cs->in.ring);
+    __get_user(host_wait_cs->in.ctx_id, &target_wait_cs->in.ctx_id);
+
+    ret = get_errno(safe_ioctl(fd, ie->host_cmd, host_wait_cs));
+
+    if (!is_error(ret)) {
+        __put_user(host_wait_cs->out.status, &target_wait_cs->out.status);
+    }
+
+    unlock_user_struct(target_wait_cs, arg, 0);
+    return ret;
+}
+
+static abi_long do_ioctl_drm_amdgpu(const IOCTLEntry *ie, uint8_t *buf_temp,
+                                    int fd, int cmd, abi_long arg)
+{
+    switch (ie->host_cmd) {
+    case DRM_IOCTL_AMDGPU_GEM_CREATE:
+        return do_ioctl_drm_amdgpu_gem_create(
+                                        ie,
+                                        (union drm_amdgpu_gem_create *)buf_temp,
+                                        fd, arg);
+    case DRM_IOCTL_AMDGPU_GEM_MMAP:
+        return do_ioctl_drm_amdgpu_gem_mmap(
+                                          ie,
+                                          (union drm_amdgpu_gem_mmap *)buf_temp,
+                                          fd, arg);
+
+    case DRM_IOCTL_AMDGPU_CTX:
+        return do_ioctl_drm_amdgpu_ctx(ie,
+                                       (union drm_amdgpu_ctx *)buf_temp,
+                                       fd, arg);
+    case DRM_IOCTL_AMDGPU_CS:
+        return do_ioctl_drm_amdgpu_cs(ie,
+                                      (union drm_amdgpu_cs *)buf_temp,
+                                      fd, arg);
+    case DRM_IOCTL_AMDGPU_INFO:
+        return do_ioctl_drm_amdgpu_info(ie,
+                                        (struct drm_amdgpu_info *)buf_temp,
+                                        fd, arg);
+    case DRM_IOCTL_AMDGPU_GEM_METADATA:
+        return do_ioctl_drm_amdgpu_gem_metadata(
+                                     ie,
+                                     (struct drm_amdgpu_gem_metadata *)buf_temp,
+                                     fd, arg);
+    case DRM_IOCTL_AMDGPU_GEM_VA:
+        return do_ioctl_drm_amdgpu_gem_va(ie,
+                                          (struct drm_amdgpu_gem_va *)buf_temp,
+                                          fd, arg);
+    case DRM_IOCTL_AMDGPU_WAIT_CS:
+        return do_ioctl_drm_amdgpu_wait_cs(ie,
+                                           (union drm_amdgpu_wait_cs *)buf_temp,
+                                           fd, arg);
+    default:
+        return -TARGET_ENOSYS;
+    }
+}
+
 #else
 
 static abi_long do_ioctl_drm_i915_getparam(const IOCTLEntry *ie,
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 5429834236..d3d12ab918 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1233,7 +1233,15 @@ struct target_rtc_pll_info {
 #define TARGET_DRM_IOCTL_PRIME_HANDLE_TO_FD  TARGET_IOWRU('d', 0x2d)
 
 #ifdef CONFIG_DRM_AMDGPU
-
+/* drm amdgpu ioctls */
+#define TARGET_DRM_IOCTL_AMDGPU_GEM_CREATE   TARGET_IOWRU('d', 0x40)
+#define TARGET_DRM_IOCTL_AMDGPU_GEM_MMAP     TARGET_IOWRU('d', 0x41)
+#define TARGET_DRM_IOCTL_AMDGPU_CTX   TARGET_IOWRU('d', 0x42)
+#define TARGET_DRM_IOCTL_AMDGPU_CS    TARGET_IOWRU('d', 0x44)
+#define TARGET_DRM_IOCTL_AMDGPU_INFO  TARGET_IOWU('d', 0x45)
+#define TARGET_DRM_IOCTL_AMDGPU_GEM_METADATA TARGET_IOWRU('d', 0x46)
+#define TARGET_DRM_IOCTL_AMDGPU_GEM_VA       TARGET_IOWRU('d', 0x48)
+#define TARGET_DRM_IOCTL_AMDGPU_WAIT_CS      TARGET_IOWRU('d', 0x49)
 #else
 /* drm i915 ioctls */
 #define TARGET_DRM_IOCTL_I915_GETPARAM              TARGET_IOWRU('d', 0x46)
@@ -2724,6 +2732,96 @@ struct target_drm_prime_handle {
     int fd;
 };
 
+/* amdgpu specific */
+union target_drm_amdgpu_gem_create {
+    struct {
+        abi_ullong bo_size;
+        abi_ullong alignment;
+        abi_ulong domains;
+        abi_ulong domain_flags;
+    } in;
+    struct {
+        int handle;
+        int _pad;
+    } out;
+};
+
+union target_drm_amdgpu_gem_mmap {
+    struct {
+        int handle;
+        int _pad;
+    } in;
+    struct {
+        abi_ulong addr_ptr;
+    } out;
+};
+
+struct target_drm_amdgpu_ctx {
+    int op;
+    int flags;
+    int ctx_id;
+    int priority;
+};
+
+struct target_drm_amdgpu_info {
+    abi_ulong return_pointer;
+    int return_size;
+    int query;
+    int value[4];
+};
+
+struct target_drm_amdgpu_gem_metadata {
+    int handle;
+    int op;
+    abi_ulong flags;
+    abi_ulong tiling_info;
+    int data_size_bytes;
+    int data[64];
+};
+
+struct target_drm_amdgpu_gem_va {
+    int handle;
+    int _pad;
+    int operation;
+    int flags;
+    abi_ulong va_address;
+    abi_ulong offset_in_bo;
+    abi_ulong map_size;
+};
+
+struct target_drm_amdgpu_cs_chunk {
+    int chunk_id;
+    int length_dw;
+    abi_ulong chunk_data;
+};
+
+union target_drm_amdgpu_cs {
+    struct {
+        int ctx_id;
+        int bo_list_handle;
+        int num_chunks;
+        int flags;
+        abi_ulong chunks;
+    } in;
+    struct {
+        abi_ulong handle;
+    } out;
+};
+
+union target_drm_amdgpu_wait_cs {
+    struct {
+        abi_ullong handle;
+        abi_ullong timeout;
+        int ip_type;
+        int ip_instance;
+        int ring;
+        int ctx_id;
+    } in;
+    struct {
+        abi_ullong status;
+    } out;
+};
+
 struct target_drm_i915_getparam {
     int param;
     abi_ulong value;
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
index 2a48b2ec47..b90bfdbbfd 100644
--- a/linux-user/syscall_types.h
+++ b/linux-user/syscall_types.h
@@ -355,6 +355,61 @@ STRUCT(drm_prime_handle,
        TYPE_INT, /* flags */
        TYPE_INT) /* fd */
 
+/* amdgpu specific */
+STRUCT(drm_amdgpu_gem_create,
+       TYPE_INT, /* [out] handle */
+       TYPE_INT, /* [out] _pad; [in] bo_size */
+       TYPE_ULONGLONG, /* [in] alignment */
+       TYPE_ULONGLONG, /* [in] domains */
+       TYPE_ULONGLONG) /* [in] domain_flags */
+
+STRUCT(drm_amdgpu_gem_mmap,
+       TYPE_ULONGLONG) /* [out] addr_ptr */
+
+STRUCT(drm_amdgpu_ctx,
+       TYPE_INT, /* [in] op */
+       TYPE_INT, /* [in] flags */
+       TYPE_INT, /* [in] ctx_id */
+       TYPE_INT) /* [in] priority */
+
+STRUCT(drm_amdgpu_cs,
+       TYPE_INT, /* [in] ctx_id */
+       TYPE_INT, /* [in] bo_list_handle */
+       TYPE_INT, /* [in] num_chunks */
+       TYPE_INT, /* [in] flags */
+       TYPE_PTRVOID) /* [in] chunks */
+
+STRUCT(drm_amdgpu_info,
+       TYPE_PTRVOID, /* return pointer */
+       TYPE_INT, /* return size */
+       TYPE_INT, /* query id */
+       MK_ARRAY(TYPE_INT, 4)) /* union */
+
+STRUCT(drm_amdgpu_gem_metadata,
+       TYPE_INT, /* handle */
+       TYPE_INT, /* op */
+       TYPE_ULONGLONG, /* flags */
+       TYPE_ULONGLONG, /* tiling_info */
+       TYPE_INT, /* data_size_bytes */
+       MK_ARRAY(TYPE_INT, 64)) /* data */
+
+STRUCT(drm_amdgpu_gem_va,
+       TYPE_INT, /* handle */
+       TYPE_INT, /* pad */
+       TYPE_INT, /* operation */
+       TYPE_INT, /* flags */
+       TYPE_ULONGLONG, /* va_address */
+       TYPE_ULONGLONG, /* offset_in_bo */
+       TYPE_ULONGLONG) /* map_size */
+
+STRUCT(drm_amdgpu_wait_cs,
+       TYPE_ULONGLONG, /* [in] handle; [out] status */
+       TYPE_ULONGLONG, /* [in] timeout */
+       TYPE_INT, /* [in] ip_type */
+       TYPE_INT, /* [in] ip_instance */
+       TYPE_INT, /* [in] ring */
+       TYPE_INT) /* [in] ctx_id */
+
 STRUCT(drm_i915_getparam,
        TYPE_INT, /* param */
        TYPE_PTRVOID) /* value */
-- 
2.40.0


