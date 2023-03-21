Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352246C3B8E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 21:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peiPK-0004Ih-8q; Tue, 21 Mar 2023 16:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3cBAaZAsKCiE79HBOIBVQKDDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--ackerleytng.bounces.google.com>)
 id 1peiOa-00047F-Lh
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:15:56 -0400
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3cBAaZAsKCiE79HBOIBVQKDDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--ackerleytng.bounces.google.com>)
 id 1peiOY-00023Y-JR
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 16:15:48 -0400
Received: by mail-pf1-x44a.google.com with SMTP id
 i26-20020aa796fa000000b006261da7aeceso6519415pfq.5
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679429744;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SASYwsYhAQSqNIE6HUln5R808O00UDaM+ugmJxC1i6Y=;
 b=nkDLVeFOEtNHIk2/9xYa/CQ5Y+2ViSmqdwKS37RKpN9fN1MXmDMz1OU9puFW4g8bxR
 vii0vfViksMKRckdTjgGuQRIZo78lhmcmIzghCZBBHxvW/ndiQpVU4djvbvM+g/7wUMs
 +h4BMeKpfniUSkYQ2+iXYK1OzQ6Zixd18XxuCFovZYEJjKkL+JZVoFx8wgMxsnNIhhrW
 cwAnxft2O57Rn97HBOHm6iE115uNcFbAUa0j/WlnnPQnSn42zEaUa3fkNCQ6d75oG0jY
 i+hqkZSaarDOufSFczQvwQKpFfhRDRSFIn/93xiAf3T7ZrsK4NycMXJEfB2VVpheLbup
 9TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679429744;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SASYwsYhAQSqNIE6HUln5R808O00UDaM+ugmJxC1i6Y=;
 b=S8Pye4JBft6qt6TxKe5I8f1J6oDCQN9jDTyU061QWvnzJzy20eeD8yd29zmdDT/xBn
 ALBlUow/HQKcMaYRqBXoY9U47IjyAhNGGyPi3CmGjbXsqxE577bdKFRNTgmCnmUMToDt
 ONbAJrGwf7Ld1kGnHxeI48yqFzMOjiqJsYTEAIOh2JcXDilMMpR26n9Xo63pB8x05+Fn
 Cw7Q9Z/NM+7kNVxd06t6cJaO55OsX8KvdawYqTVevsTIfMLHlvzFTBu8dBKNR0RIvP+T
 MQPW8Kj1/CYgL9KUbvMVN0bpPQYfp2v3pT0l+/RHYVKoESkIbetErbU2SK/dBXisripq
 sX/A==
X-Gm-Message-State: AO0yUKUb2P/t2z0OSirNzXwHYkZCb7lzH7TT/RnBlSzHaucGv5q6vVaG
 nouRkNtYRQ5EpS/s+1ux/KmN1HR6cQtj7N7eXQ==
X-Google-Smtp-Source: AK7set/HvJzxMftd1uCLemfdr7EZh/avv/uPbf4VraKazWicqnhqmpj6db9AHljzqSRdUL4ivIO6IsbGNBTLA3WbfA==
X-Received: from ackerleytng-cloudtop.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:b612:b0:1a0:51f7:7f5a with
 SMTP id b18-20020a170902b61200b001a051f77f5amr137446pls.13.1679429744410;
 Tue, 21 Mar 2023 13:15:44 -0700 (PDT)
Date: Tue, 21 Mar 2023 20:15:32 +0000
In-Reply-To: <cover.1679428901.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1679428901.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <6e800e069c7fc400841b75ea49d1227bd101c1cf.1679428901.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 1/2] mm: restrictedmem: Allow userspace to specify
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3cBAaZAsKCiE79HBOIBVQKDDLLDIB.9LJNBJR-ABSBIKLKDKR.LOD@flex--ackerleytng.bounces.google.com;
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

With this patch, an optional tmpfs mount can be specified via an fd,
which will be used as the mountpoint for backing the shmem file
associated with a restrictedmem fd.

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
index c5d869d8c2d8..4d83b949d84e 100644
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
+	return mnt && mnt->mnt_sb && mnt->mnt_sb->s_magic == TMPFS_MAGIC;
+}
+
+static int restrictedmem_create_from_file(int mount_fd)
+{
+	int ret;
+	struct fd f;
+	struct vfsmount *mnt;
+
+	f = fdget_raw(mount_fd);
+	if (!f.file)
+		return -EBADF;
+
+	mnt = f.file->f_path.mnt;
+	if (!is_shmem_mount(mnt)) {
+		ret = -EINVAL;
+		goto out;
+	}
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
+	if (flags & ~RMFD_TMPFILE)
+		return -EINVAL;
+
+	if (flags == RMFD_TMPFILE) {
+		if (mount_fd < 0)
+			return -EINVAL;
+
+		return restrictedmem_create_from_file(mount_fd);
+	} else {
+		return restrictedmem_create(NULL);
+	}
+}
+
 int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
 		       struct restrictedmem_notifier *notifier, bool exclusive)
 {
-- 
2.40.0.rc2.332.ga46443480c-goog


