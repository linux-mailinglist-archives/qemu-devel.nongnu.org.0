Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC976DCF50
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:30:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2pM-0005fs-Kj; Mon, 10 Apr 2023 21:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Arg0ZAsKCm0LNVPcWPjeYRRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--ackerleytng.bounces.google.com>)
 id 1pm2pK-0005eK-7g
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:29:42 -0400
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Arg0ZAsKCm0LNVPcWPjeYRRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--ackerleytng.bounces.google.com>)
 id 1pm2pI-0006kB-BJ
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:29:42 -0400
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-24677634ef3so226080a91.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1681176578;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=jBCdWjTPDV7u7tywdkOEhqA30FFTo51cVFS76tLVdIk=;
 b=XXnjZgXzwtwzC9wPP7936MOH1Bh6PiD2hqfXsgLbzkeGH7jGOqDvWazEmiyAzxPEXN
 HOXn2bdQRnFFlnJUMCqgw4px9COwSYMyn3YVtfmzMWvKtYBIfUSMShHDLtLIFs/2YTUR
 ZIlb/4bJS9MEL7swsNJzi4YAZKTAsbO10KC0Ds2cNLC22Pg9HmCMPpjEwtsK0gp8xNc3
 mZO89Ov6XW97TbXx3Qad8uCoGve6ai+6KRHCABfhvY1sO8p+sNfAEeAPFhpBXQq5q71+
 Ao9iCqyyDHst/xqAqkZjIbwaUW4f94Yk0iTSASX0LtcD2fSwJLyo8HMt+YM3EG3m5HrO
 XxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681176578;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jBCdWjTPDV7u7tywdkOEhqA30FFTo51cVFS76tLVdIk=;
 b=BP/GUnbRA9NvuyFfOatNkCxGmHwUfwrH1P5h8jR3+ykxN1KlIaRBmXxty2XhfI38yb
 XD9uy4qGdXaNeeGkRYE8ETkQKbndqoAAKAFaRU6/oR2wz08OrcTUeA9/+k9CDb8+drjD
 1cl6F0tachkcCmP/gZFEKAR4ArLTx698GG1uLQSr5LJKpSGNa3cmPKBJBS0mileTn4bQ
 kU94q2GWT448AzQQx2o3QT4G3lFkATOVWmFKGkJqTQv1eFtGEE2GtMb/pT/TEuJe34IB
 lp6DqyFoKokcsbd6+L8GydZbqxH7rIT5lAhdr4q/M0rxuIhBBlOU6FLhFNLs3NqAGgzg
 J9sw==
X-Gm-Message-State: AAQBX9fxzqoB7gvIBMhmL12XV8ouxkEXcOFSfwKKtyJ+2y3PLdxRFPcx
 +EfFQL9M+mU9LkE2Ar0yfp1Bx0sSWVodiKxGvg==
X-Google-Smtp-Source: AKy350aUc53Va1zkms/tZeMPTaKwPOXFpbnBKZFuGedztjHPQD03PotiB50/sPjZNhzfTmekJxf45Wmqylq6+Y7Cgw==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a05:6a00:a1b:b0:62d:dade:825 with SMTP
 id p27-20020a056a000a1b00b0062ddade0825mr6152408pfh.3.1681176578151; Mon, 10
 Apr 2023 18:29:38 -0700 (PDT)
Date: Tue, 11 Apr 2023 01:29:32 +0000
In-Reply-To: <cover.1681176340.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1681176340.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <ef48935e5e6f947f6f0c6d748232b14ef5d5ad70.1681176340.git.ackerleytng@google.com>
Subject: [RFC PATCH v4 1/2] mm: restrictedmem: Allow userspace to specify
 mount for memfd_restricted
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org, 
 arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com, 
 david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com, hpa@zytor.com, 
 hughd@google.com, jlayton@kernel.org, jmattson@google.com, joro@8bytes.org, 
 jun.nakajima@intel.com, kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, 
 luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com, 
 michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com, 
 pbonzini@redhat.com, qperret@google.com, rppt@kernel.org, seanjc@google.com, 
 shuah@kernel.org, steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3Arg0ZAsKCm0LNVPcWPjeYRRZZRWP.NZXbPXf-OPgPWYZYRYf.ZcR@flex--ackerleytng.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

By default, the backing shmem file for a restrictedmem fd is created
on shmem's kernel space mount.

With this patch, an optional tmpfs mount can be specified via an fd,
which will be used as the mountpoint for backing the shmem file
associated with a restrictedmem fd.

This will help restrictedmem fds inherit the properties of the
provided tmpfs mounts, for example, hugepage (THP) allocation hints,
NUMA binding hints, etc.

Permissions for the fd passed to memfd_restricted() is modeled after
the openat() syscall, since both of these allow creation of a file
upon a mount/directory.

Permission to reference the mount the fd represents is checked upon fd
creation by other syscalls (e.g. fsmount(), open(), or open_tree(),
etc) and any process that can present memfd_restricted() with a valid
fd is expected to have obtained permission to use the mount
represented by the fd. This behavior is intended to parallel that of
the openat() syscall.

memfd_restricted() will check that the tmpfs superblock is
writable, and that the mount is also writable, before attempting to
create a restrictedmem file on the mount.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/syscalls.h           |  2 +-
 include/uapi/linux/restrictedmem.h |  8 ++++
 mm/restrictedmem.c                 | 73 ++++++++++++++++++++++++++++--
 3 files changed, 77 insertions(+), 6 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 660be0bf89d5..90c73b9e14e5 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1058,7 +1058,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
 asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
 					    unsigned long home_node,
 					    unsigned long flags);
-asmlinkage long sys_memfd_restricted(unsigned int flags);
+asmlinkage long sys_memfd_restricted(unsigned int flags, int mount_fd);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/linux/restrictedmem.h b/include/uapi/linux/restrictedmem.h
new file mode 100644
index 000000000000..73e31bce73dc
--- /dev/null
+++ b/include/uapi/linux/restrictedmem.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_RESTRICTEDMEM_H
+#define _UAPI_LINUX_RESTRICTEDMEM_H
+
+/* flags for memfd_restricted */
+#define MEMFD_RSTD_USERMNT		0x0001U
+
+#endif /* _UAPI_LINUX_RESTRICTEDMEM_H */
diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
index 55e99e6c09a1..032ad1f15138 100644
--- a/mm/restrictedmem.c
+++ b/mm/restrictedmem.c
@@ -6,6 +6,7 @@
 #include <linux/syscalls.h>
 #include <uapi/linux/falloc.h>
 #include <uapi/linux/magic.h>
+#include <uapi/linux/restrictedmem.h>
 #include <linux/restrictedmem.h>
 
 struct restrictedmem {
@@ -250,19 +251,20 @@ static struct address_space_operations restricted_aops = {
 #endif
 };
 
-SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
+static int restrictedmem_create(struct vfsmount *mount)
 {
 	struct file *file, *restricted_file;
 	int fd, err;
 
-	if (flags)
-		return -EINVAL;
-
 	fd = get_unused_fd_flags(0);
 	if (fd < 0)
 		return fd;
 
-	file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
+	if (mount)
+		file = shmem_file_setup_with_mnt(mount, "memfd:restrictedmem", 0, VM_NORESERVE);
+	else
+		file = shmem_file_setup("memfd:restrictedmem", 0, VM_NORESERVE);
+
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
 		goto err_fd;
@@ -286,6 +288,67 @@ SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
 	return err;
 }
 
+static struct vfsmount *restrictedmem_get_user_mount(struct file *file)
+{
+	int ret;
+	struct vfsmount *mnt;
+	struct path *path;
+
+	path = &file->f_path;
+	if (path->dentry != path->mnt->mnt_root)
+		return ERR_PTR(-EINVAL);
+
+	/*
+	 * Disallow bind-mounts that aren't bind-mounts of the whole
+	 * filesystem
+	 */
+	mnt = path->mnt;
+	if (mnt->mnt_root != mnt->mnt_sb->s_root)
+		return ERR_PTR(-EINVAL);
+
+	if (mnt->mnt_sb->s_magic != TMPFS_MAGIC)
+		return ERR_PTR(-EINVAL);
+
+	ret = mnt_want_write(mnt);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mnt;
+}
+
+SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, int, mount_fd)
+{
+	int ret;
+	struct fd f = {};
+	struct vfsmount *mnt = NULL;
+
+	if (flags & ~MEMFD_RSTD_USERMNT)
+		return -EINVAL;
+
+	if (flags & MEMFD_RSTD_USERMNT) {
+		f = fdget_raw(mount_fd);
+		if (!f.file)
+			return -EBADF;
+
+		mnt = restrictedmem_get_user_mount(f.file);
+		if (IS_ERR(mnt)) {
+			ret = PTR_ERR(mnt);
+			goto out;
+		}
+	}
+
+	ret = restrictedmem_create(mnt);
+
+	if (mnt)
+		mnt_drop_write(mnt);
+
+out:
+	if (f.file)
+		fdput(f);
+
+	return ret;
+}
+
 int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
 		       struct restrictedmem_notifier *notifier, bool exclusive)
 {
-- 
2.40.0.577.gac1e443424-goog


