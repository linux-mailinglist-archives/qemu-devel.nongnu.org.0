Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE57D69896A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 01:42:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSSLG-0004xD-Vn; Wed, 15 Feb 2023 19:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vnvtYwsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com>)
 id 1pSSLC-0004v9-8D
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:38 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vnvtYwsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com>)
 id 1pSSLA-0006ST-9K
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 19:41:37 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 e9-20020a62ee09000000b0058db55a8d7aso306091pfi.21
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 16:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xFJSOOgmL/+0yEbfXc6ryYjQyU1/3hcKBEe5blgULG8=;
 b=cINlnclit+qIhReE+Kd7SxHPyCpYVP+gHpr/lFZIYMsvtqPRMGMguGhZ+AmtA8dFRc
 Djw+CXsM0iFzwsMurICuBsTP1scpM+tCEPKY9d7bDxdD5YrTS/xTPWBYVcL8YG0s8lEx
 aufd0oD+1ETay2cKPepbBkhK2DjZdGGh9+sIqO+Vcbz+DiP+awtJagXFXVVgNQbNgyf4
 dLNAd50vYgR4BhTu4f/JtATvZK4wp3PfCPiwj0DiDlPx+B7yfpqr/PRhgYcbi/fNtz/R
 06dsNug5WVXeH5PztldqJP7IVZaS+IwS51Y4HyfEGNLXO726iXRISqbDJTUc9PcT6yga
 oL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xFJSOOgmL/+0yEbfXc6ryYjQyU1/3hcKBEe5blgULG8=;
 b=wEcCLtWHr15ixaX66e1VWDMbEZupKDy8CCcJKVIwzomLVnrsol8qWRS73+oArdpJCs
 64O9X2Ce4Kf/jLRwoREVLpNFb9FEtLtrXs2iABQ0oMauEBIhG/kMZwEZ31kN+WcRn+pK
 uapKBgnKWp9NYF6t0XjRGpF5av5iHbGZK7lIgqpWSGhS0jAYtaVvbj6zPcUUST8ArGIV
 WTzXalu2OQnJ1JpEX/xxCTHwdYPdiSUWyWY+U8DO/1SZgpObxYjraF9L4PUJ0VLZgAQ5
 Dq6h9ImjOOIU6qcpdvlPz4GvBM9lO0C7ePGK4dJ2AXTFnX7HAk13DfkObsUHCfadYK8/
 Q76g==
X-Gm-Message-State: AO0yUKWrCRUMTdIZIqDs1U7Y/SYvXzlq3yGRbZei63ZQWfmBJWRpRMIm
 lP/AztvzEDfHAoEiZDPdSTQ3cjRbK2wt+41rew==
X-Google-Smtp-Source: AK7set92BIhFB8ochMzD8hkP3RpOuPg2nKV+W2zZrkSmVY9pLWldFkNDjP8CHQ6b9e/hAQ6o5kRRc8iwgxT607mX7Q==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a63:33ce:0:b0:4e7:79c5:d682 with SMTP
 id z197-20020a6333ce000000b004e779c5d682mr625417pgz.9.1676508094293; Wed, 15
 Feb 2023 16:41:34 -0800 (PST)
Date: Thu, 16 Feb 2023 00:41:16 +0000
In-Reply-To: <cover.1676507663.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1676507663.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.39.1.637.g21b0678d19-goog
Message-ID: <176081a4817e492965a864a8bc8bacb7d2c05078.1676507663.git.ackerleytng@google.com>
Subject: [RFC PATCH 1/2] mm: restrictedmem: Allow userspace to specify
 mount_path for memfd_restricted
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, qemu-devel@nongnu.org
Cc: chao.p.peng@linux.intel.com, aarcange@redhat.com, ak@linux.intel.com, 
 akpm@linux-foundation.org, arnd@arndb.de, bfields@fieldses.org, bp@alien8.de, 
 corbet@lwn.net, dave.hansen@intel.com, david@redhat.com, ddutile@redhat.com, 
 dhildenb@redhat.com, hpa@zytor.com, hughd@google.com, jlayton@kernel.org, 
 jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com, 
 kirill.shutemov@linux.intel.com, linmiaohe@huawei.com, luto@kernel.org, 
 mail@maciej.szmigiero.name, mhocko@suse.com, michael.roth@amd.com, 
 mingo@redhat.com, naoya.horiguchi@nec.com, pbonzini@redhat.com, 
 qperret@google.com, rppt@kernel.org, seanjc@google.com, shuah@kernel.org, 
 steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
 vannapurve@google.com, vbabka@suse.cz, vkuznets@redhat.com, 
 wanpengli@tencent.com, wei.w.wang@intel.com, x86@kernel.org, 
 yu.c.zhang@linux.intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3vnvtYwsKCpEvx5zC6zJE8119916z.x97Bz7F-yzGz689818F.9C1@flex--ackerleytng.bounces.google.com;
 helo=mail-pf1-x44a.google.com
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

With this patch, an optional tmpfs mount can be specified, which will
be used as the mountpoint for backing the shmem file associated with a
restrictedmem fd.

This change is modeled after how sys_open() can create an unnamed
temporary file in a given directory with O_TMPFILE.

This will help restrictedmem fds inherit the properties of the
provided tmpfs mounts, for example, hugepage allocation hints, NUMA
binding hints, etc.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 include/linux/syscalls.h           |  2 +-
 include/uapi/linux/restrictedmem.h |  8 ++++
 mm/restrictedmem.c                 | 63 +++++++++++++++++++++++++++---
 3 files changed, 66 insertions(+), 7 deletions(-)
 create mode 100644 include/uapi/linux/restrictedmem.h

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index f9e9e0c820c5..4b8efe9a8680 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1056,7 +1056,7 @@ asmlinkage long sys_memfd_secret(unsigned int flags);
 asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long len,
 					    unsigned long home_node,
 					    unsigned long flags);
-asmlinkage long sys_memfd_restricted(unsigned int flags);
+asmlinkage long sys_memfd_restricted(unsigned int flags, const char __user *mount_path);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/linux/restrictedmem.h b/include/uapi/linux/restrictedmem.h
new file mode 100644
index 000000000000..9f108dd1ac4c
--- /dev/null
+++ b/include/uapi/linux/restrictedmem.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_LINUX_RESTRICTEDMEM_H
+#define _UAPI_LINUX_RESTRICTEDMEM_H
+
+/* flags for memfd_restricted */
+#define RMFD_TMPFILE		0x0001U
+
+#endif /* _UAPI_LINUX_RESTRICTEDMEM_H */
diff --git a/mm/restrictedmem.c b/mm/restrictedmem.c
index c5d869d8c2d8..97f3e2159e8b 100644
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
@@ -223,6 +225,55 @@ SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
 	return err;
 }
 
+static bool is_shmem_mount(struct vfsmount *mnt)
+{
+	return mnt->mnt_sb->s_magic == TMPFS_MAGIC;
+}
+
+static int restrictedmem_create_from_path(const char __user *mount_path)
+{
+	int ret;
+	struct path path;
+
+	ret = user_path_at(AT_FDCWD, mount_path,
+			   LOOKUP_FOLLOW | LOOKUP_MOUNTPOINT,
+			   &path);
+	if (ret)
+		return ret;
+
+	if (!is_shmem_mount(path.mnt)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = mnt_want_write(path.mnt);
+	if (unlikely(ret))
+		goto out;
+
+	ret = restrictedmem_create(path.mnt);
+
+	mnt_drop_write(path.mnt);
+out:
+	path_put(&path);
+
+	return ret;
+}
+
+SYSCALL_DEFINE2(memfd_restricted, unsigned int, flags, const char __user *, mount_path)
+{
+	if (flags & ~RMFD_TMPFILE)
+		return -EINVAL;
+
+	if (flags == RMFD_TMPFILE) {
+		if (!mount_path)
+			return -EINVAL;
+
+		return restrictedmem_create_from_path(mount_path);
+	} else {
+		return restrictedmem_create(NULL);
+	}
+}
+
 int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
 		       struct restrictedmem_notifier *notifier, bool exclusive)
 {
-- 
2.39.1.637.g21b0678d19-goog


