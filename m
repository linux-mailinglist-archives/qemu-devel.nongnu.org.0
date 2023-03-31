Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9C56D2BD2
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 01:52:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piOWT-0007VX-DM; Fri, 31 Mar 2023 19:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32HEnZAsKCoEfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1piOWK-0007Uw-KM
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:51:00 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32HEnZAsKCoEfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com>)
 id 1piOWB-0000Wh-5p
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 19:50:53 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 qa18-20020a17090b4fd200b002400d8a8d1dso11489714pjb.7
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 16:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680306648;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=67aN/B+WtOaSUEhiQW5ieKe9kdphJ9yXXZLhFTmAYCY=;
 b=aqbsmcr2pK1zJc/QddLocmFe7u0eN9wv3vYw/b6U0d43YucmpKQusaaQyAaVSa0brL
 LpSKYapJtGiMflg5mvZkz3d5j4vniDYYeKTW9Q4ay1SgV2A+IZ22Cf6Rxm/yGJKvgMN8
 SMKUd9my6zvqI6T79WbKu7yBu6efMqRgxeGWTlGD4T7pNs+f8J8J0byx5Zn/rGxIBacK
 RO2pdC/oG+kndVLe0/EN60h+Ufhb6JX9aJrTNcBTxw5DYOj8yvfJ2FTBeGdPqfrf3kJN
 vw3lhr7RqWCr8GoHdH9B4JRBqn6YLWfmu0XgDDbuD1vuUAihW3PD1pSNBYYD+O6dlOsv
 bwXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680306648;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67aN/B+WtOaSUEhiQW5ieKe9kdphJ9yXXZLhFTmAYCY=;
 b=Jb8G47s69PKfvQEvHHYSxEXMc9340cI8mfwOSw6e/3YmNVFZRNFOf9zNNVSKQi09ta
 gw8w7O9eGxRd7rq0c4jXXGAhal6z/TXXYGlrKyE5rU6vhLpn6ejsBhwqxe0hSIhcnWOH
 8UkuFfDDSCpbUFiItdY3J7Yq2s3xlUFbPDNZTjWeS0EH4gDLtoRcnp44nKRrTKKNjR/w
 33KEfRlvNlAMuJfVxcldRL+8JBrQJtamG7e0eJAS48Ujrpihm3Dk2TXXqQyrQ7AogL4W
 7OkfkJw0tvvEStKpdTMORmbKVAPt5DjBfoGOdxf+DSzWeA10lTDsMDL3kAf8L4hPQSRK
 WdIQ==
X-Gm-Message-State: AAQBX9evt2GrrvONkYYk5By8HlxbbkbjuGOvayZBgTLEIFpEjuDmbqh2
 5UroC+E2IR6OTRcUtlLi4/ScOMvJwjZbh55Lgw==
X-Google-Smtp-Source: AKy350Y16oanl4juVqg+eyN21vJExuVR4y0XGk1EcBSjqL6yTWS/45m6tpDkpZOf1psTO3M9dHBN9cOBWfihqWNDiA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:90a:ba0a:b0:23f:6eff:9430 with
 SMTP id s10-20020a17090aba0a00b0023f6eff9430mr9066957pjr.3.1680306648452;
 Fri, 31 Mar 2023 16:50:48 -0700 (PDT)
Date: Fri, 31 Mar 2023 23:50:39 +0000
In-Reply-To: <cover.1680306489.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1680306489.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <592ebd9e33a906ba026d56dc68f42d691706f865.1680306489.git.ackerleytng@google.com>
Subject: [RFC PATCH v3 1/2] mm: restrictedmem: Allow userspace to specify
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=32HEnZAsKCoEfhpjwqj3ysllttlqj.htrvjrz-ij0jqstslsz.twl@flex--ackerleytng.bounces.google.com;
 helo=mail-pj1-x1049.google.com
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
provided tmpfs mounts, for example, hugepage allocation hints, NUMA
binding hints, etc.

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
 mm/restrictedmem.c                 | 74 +++++++++++++++++++++++++++---
 3 files changed, 77 insertions(+), 7 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index f9e9e0c820c5..a23c4c385cd3 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1056,7 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
 asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
 					    unsigned long home_node,
 					    unsigned long flags);
-asmlinkage long sys_memfd_restricted(unsigned int flags);
+asmlinkage long sys_memfd_restricted(unsigned int flags, int mount_fd);

 /*
  * Architecture-specific system calls
diff --git a/include/uapi/linux/restrictedmem.h b/include/uapi/linux/restrictedmem.h
new file mode 100644
index 000000000000..22d6f2285f6d
--- /dev/null
+++ b/include/uapi/linux/restrictedmem.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_RESTRICTEDMEM_H
+#define _UAPI_LINUX_RESTRICTEDMEM_H
+
+/* flags for memfd_restricted */
+#define RMFD_USERMNT		0x0001U
+
+#endif /* _UAPI_LINUX_RESTRICTEDMEM_H */
diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
index c5d869d8c2d8..f7b62364a31a 100644
--- a/mm/restrictedmem.c
+++ b/mm/restrictedmem.c
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
-#include "linux/sbitmap.h"
+#include <linux/namei.h>
 #include <linux/pagemap.h>
 #include <linux/pseudo_fs.h>
 #include <linux/shmem_fs.h>
 #include <linux/syscalls.h>
 #include <uapi/linux/falloc.h>
 #include <uapi/linux/magic.h>
+#include <uapi/linux/restrictedmem.h>
 #include <linux/restrictedmem.h>

 struct restrictedmem {
@@ -189,19 +190,20 @@ static struct file *restrictedmem_file_create(struct file *memfd)
 	return file;
 }

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
@@ -223,6 +225,66 @@ SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
 	return err;
 }

+static bool is_shmem_mount(struct vfsmount *mnt)
+{
+	return mnt && mnt->mnt_sb && mnt->mnt_sb->s_magic == TMPFS_MAGIC;
+}
+
+static bool is_mount_root(struct file *file)
+{
+	return file->f_path.dentry == file->f_path.mnt->mnt_root;
+}
+
+static int restrictedmem_create_on_user_mount(int mount_fd)
+{
+	int ret;
+	struct fd f;
+	struct vfsmount *mnt;
+
+	f = fdget_raw(mount_fd);
+	if (!f.file)
+		return -EBADF;
+
+	ret = -EINVAL;
+	if (!is_mount_root(f.file))
+		goto out;
+
+	mnt = f.file->f_path.mnt;
+	if (!is_shmem_mount(mnt))
+		goto out;
+
+	ret = file_permission(f.file, MAY_WRITE | MAY_EXEC);
+	if (ret)
+		goto out;
+
+	ret = mnt_want_write(mnt);
+	if (unlikely(ret))
+		goto out;
+
+	ret = restrictedmem_create(mnt);
+
+	mnt_drop_write(mnt);
+out:
+	fdput(f);
+
+	return ret;
+}
+
+SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, int, mount_fd)
+{
+	if (flags & ~RMFD_USERMNT)
+		return -EINVAL;
+
+	if (flags == RMFD_USERMNT) {
+		if (mount_fd < 0)
+			return -EINVAL;
+
+		return restrictedmem_create_on_user_mount(mount_fd);
+	} else {
+		return restrictedmem_create(NULL);
+	}
+}
+
 int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
 		       struct restrictedmem_notifier *notifier, bool exclusive)
 {
--
2.40.0.348.gf938b09366-goog

