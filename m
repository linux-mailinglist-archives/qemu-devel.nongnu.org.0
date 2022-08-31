Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A605A8026
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 16:27:10 +0200 (CEST)
Received: from localhost ([::1]:59716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTOgP-0001Ck-Ao
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 10:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oTOeH-00088h-7X
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:24:57 -0400
Received: from mga18.intel.com ([134.134.136.126]:59753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oTOeE-0008NZ-20
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 10:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661955894; x=1693491894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XQ6+HYUV9BK9liyIJxXHAL7mePl6YHQqJS6+3Icj6e8=;
 b=lYfLbfxqumqA8F36P+J15QonapFP8YlRWgDykIxqMEZV+J1oRjbgEWBK
 F/UFJIdLYaiFMH339YzvH0ABkIN2JT1mthRZ3FFmxzxzJUi/H8/KOe/6P
 XX4F2X4umiqCl16CCpmf3dBCGmjHT80n6Y4mV+7UrCGas6uuh5rU12txn
 JYJGw2AQSR2svGW4VYYAfif0bGq28Edu7Z6Ag0xs6KGoyMNpCMsaoo3Q5
 gS7GHPr0U8M1MetJWpEqI7NsTnRuIImZdxAQtCAudDZwBvDGBn1m1n+Jz
 dmvaR36FWH/XCFCt1XUIRW2doOy7FymItiUhFKtwbYNa3/+cuXOHD2fIN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278473596"
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="278473596"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 07:24:51 -0700
X-IronPort-AV: E=Sophos;i="5.93,278,1654585200"; d="scan'208";a="673370832"
Received: from javulax-mobl1.gar.corp.intel.com (HELO box.shutemov.name)
 ([10.249.44.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 07:24:41 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 137AD10483B; Wed, 31 Aug 2022 17:24:39 +0300 (+03)
Date: Wed, 31 Aug 2022 17:24:39 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>,
 Elena Reshetova <elena.reshetova@intel.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220831142439.65q2gi4g2d2z4ofh@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c194262b-b634-4baf-abf0-dc727e8f1d7@google.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Aug 20, 2022 at 10:15:32PM -0700, Hugh Dickins wrote:
> > I will try next week to rework it as shim to top of shmem. Does it work
> > for you?
> 
> Yes, please do, thanks.  It's a compromise between us: the initial TDX
> case has no justification to use shmem at all, but doing it that way
> will help you with some of the infrastructure, and will probably be
> easiest for KVM to extend to other more relaxed fd cases later.

Okay, below is my take on the shim approach.

I don't hate how it turned out. It is easier to understand without
callback exchange thing.

The only caveat is I had to introduce external lock to protect against
race between lookup and truncate. Otherwise, looks pretty reasonable to me.

I did very limited testing. And it lacks integration with KVM, but API
changed not substantially, any it should be easy to adopt.

Any comments?

diff --git a/include/linux/memfd.h b/include/linux/memfd.h
index 4f1600413f91..aec04a0f8b7b 100644
--- a/include/linux/memfd.h
+++ b/include/linux/memfd.h
@@ -3,6 +3,7 @@
 #define __LINUX_MEMFD_H
 
 #include <linux/file.h>
+#include <linux/pfn_t.h>
 
 #ifdef CONFIG_MEMFD_CREATE
 extern long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg);
@@ -13,4 +14,27 @@ static inline long memfd_fcntl(struct file *f, unsigned int c, unsigned long a)
 }
 #endif
 
+struct inaccessible_notifier;
+
+struct inaccessible_notifier_ops {
+	void (*invalidate)(struct inaccessible_notifier *notifier,
+			   pgoff_t start, pgoff_t end);
+};
+
+struct inaccessible_notifier {
+	struct list_head list;
+	const struct inaccessible_notifier_ops *ops;
+};
+
+int inaccessible_register_notifier(struct file *file,
+				   struct inaccessible_notifier *notifier);
+void inaccessible_unregister_notifier(struct file *file,
+				      struct inaccessible_notifier *notifier);
+
+int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
+			 int *order);
+void inaccessible_put_pfn(struct file *file, pfn_t pfn);
+
+struct file *memfd_mkinaccessible(struct file *memfd);
+
 #endif /* __LINUX_MEMFD_H */
diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
index 6325d1d0e90f..9d066be3d7e8 100644
--- a/include/uapi/linux/magic.h
+++ b/include/uapi/linux/magic.h
@@ -101,5 +101,6 @@
 #define DMA_BUF_MAGIC		0x444d4142	/* "DMAB" */
 #define DEVMEM_MAGIC		0x454d444d	/* "DMEM" */
 #define SECRETMEM_MAGIC		0x5345434d	/* "SECM" */
+#define INACCESSIBLE_MAGIC	0x494e4143	/* "INAC" */
 
 #endif /* __LINUX_MAGIC_H__ */
diff --git a/include/uapi/linux/memfd.h b/include/uapi/linux/memfd.h
index 7a8a26751c23..48750474b904 100644
--- a/include/uapi/linux/memfd.h
+++ b/include/uapi/linux/memfd.h
@@ -8,6 +8,7 @@
 #define MFD_CLOEXEC		0x0001U
 #define MFD_ALLOW_SEALING	0x0002U
 #define MFD_HUGETLB		0x0004U
+#define MFD_INACCESSIBLE	0x0008U
 
 /*
  * Huge page size encoding when MFD_HUGETLB is specified, and a huge page
diff --git a/mm/Makefile b/mm/Makefile
index 9a564f836403..f82e5d4b4388 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -126,7 +126,7 @@ obj-$(CONFIG_HARDENED_USERCOPY) += usercopy.o
 obj-$(CONFIG_PERCPU_STATS) += percpu-stats.o
 obj-$(CONFIG_ZONE_DEVICE) += memremap.o
 obj-$(CONFIG_HMM_MIRROR) += hmm.o
-obj-$(CONFIG_MEMFD_CREATE) += memfd.o
+obj-$(CONFIG_MEMFD_CREATE) += memfd.o memfd_inaccessible.o
 obj-$(CONFIG_MAPPING_DIRTY_HELPERS) += mapping_dirty_helpers.o
 obj-$(CONFIG_PTDUMP_CORE) += ptdump.o
 obj-$(CONFIG_PAGE_REPORTING) += page_reporting.o
diff --git a/mm/memfd.c b/mm/memfd.c
index 08f5f8304746..1853a90f49ff 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -261,7 +261,8 @@ long memfd_fcntl(struct file *file, unsigned int cmd, unsigned long arg)
 #define MFD_NAME_PREFIX_LEN (sizeof(MFD_NAME_PREFIX) - 1)
 #define MFD_NAME_MAX_LEN (NAME_MAX - MFD_NAME_PREFIX_LEN)
 
-#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB)
+#define MFD_ALL_FLAGS (MFD_CLOEXEC | MFD_ALLOW_SEALING | MFD_HUGETLB | \
+		       MFD_INACCESSIBLE)
 
 SYSCALL_DEFINE2(memfd_create,
 		const char __user *, uname,
@@ -283,6 +284,14 @@ SYSCALL_DEFINE2(memfd_create,
 			return -EINVAL;
 	}
 
+	/* Disallow sealing when MFD_INACCESSIBLE is set. */
+	if ((flags & MFD_INACCESSIBLE) && (flags & MFD_ALLOW_SEALING))
+		return -EINVAL;
+
+	/* TODO: add hugetlb support */
+	if ((flags & MFD_INACCESSIBLE) && (flags & MFD_HUGETLB))
+		return -EINVAL;
+
 	/* length includes terminating zero */
 	len = strnlen_user(uname, MFD_NAME_MAX_LEN + 1);
 	if (len <= 0)
@@ -331,10 +340,24 @@ SYSCALL_DEFINE2(memfd_create,
 		*file_seals &= ~F_SEAL_SEAL;
 	}
 
+	if (flags & MFD_INACCESSIBLE) {
+		struct file *inaccessible_file;
+
+		inaccessible_file = memfd_mkinaccessible(file);
+		if (IS_ERR(inaccessible_file)) {
+			error = PTR_ERR(inaccessible_file);
+			goto err_file;
+		}
+
+		file = inaccessible_file;
+	}
+
 	fd_install(fd, file);
 	kfree(name);
 	return fd;
 
+err_file:
+	fput(file);
 err_fd:
 	put_unused_fd(fd);
 err_name:
diff --git a/mm/memfd_inaccessible.c b/mm/memfd_inaccessible.c
new file mode 100644
index 000000000000..89194438af9c
--- /dev/null
+++ b/mm/memfd_inaccessible.c
@@ -0,0 +1,234 @@
+#include <linux/memfd.h>
+#include <linux/pagemap.h>
+#include <linux/pseudo_fs.h>
+#include <linux/shmem_fs.h>
+#include <uapi/linux/falloc.h>
+#include <uapi/linux/magic.h>
+
+struct inaccessible_data {
+	struct rw_semaphore lock;
+	struct file *memfd;
+	struct list_head notifiers;
+};
+
+static void inaccessible_notifier_invalidate(struct inaccessible_data *data,
+				 pgoff_t start, pgoff_t end)
+{
+	struct inaccessible_notifier *notifier;
+
+	lockdep_assert_held(&data->lock);
+	VM_BUG_ON(!rwsem_is_locked(&data->lock));
+
+	list_for_each_entry(notifier, &data->notifiers, list) {
+		notifier->ops->invalidate(notifier, start, end);
+	}
+}
+
+static int inaccessible_release(struct inode *inode, struct file *file)
+{
+	struct inaccessible_data *data = inode->i_mapping->private_data;
+
+	fput(data->memfd);
+	kfree(data);
+	return 0;
+}
+
+static long inaccessible_fallocate(struct file *file, int mode,
+				   loff_t offset, loff_t len)
+{
+	struct inaccessible_data *data = file->f_mapping->private_data;
+	struct file *memfd = data->memfd;
+	int ret;
+
+	/* The lock prevents parallel inaccessible_get/put_pfn() */
+	down_write(&data->lock);
+	if (mode & FALLOC_FL_PUNCH_HOLE) {
+		if (!PAGE_ALIGNED(offset) || !PAGE_ALIGNED(len)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	ret = memfd->f_op->fallocate(memfd, mode, offset, len);
+	inaccessible_notifier_invalidate(data, offset, offset + len);
+out:
+	up_write(&data->lock);
+	return ret;
+}
+
+static const struct file_operations inaccessible_fops = {
+	.release = inaccessible_release,
+	.fallocate = inaccessible_fallocate,
+};
+
+static int inaccessible_getattr(struct user_namespace *mnt_userns,
+				const struct path *path, struct kstat *stat,
+				u32 request_mask, unsigned int query_flags)
+{
+	struct inode *inode = d_inode(path->dentry);
+	struct inaccessible_data *data = inode->i_mapping->private_data;
+	struct file *memfd = data->memfd;
+
+	return memfd->f_inode->i_op->getattr(mnt_userns, path, stat,
+					     request_mask, query_flags);
+}
+
+static int inaccessible_setattr(struct user_namespace *mnt_userns,
+				struct dentry *dentry, struct iattr *attr)
+{
+	struct inode *inode = d_inode(dentry);
+	struct inaccessible_data *data = inode->i_mapping->private_data;
+	struct file *memfd = data->memfd;
+	int ret;
+
+	if (attr->ia_valid & ATTR_SIZE) {
+		if (memfd->f_inode->i_size) {
+			ret = -EPERM;
+			goto out;
+		}
+
+		if (!PAGE_ALIGNED(attr->ia_size)) {
+			ret = -EINVAL;
+			goto out;
+		}
+	}
+
+	ret = memfd->f_inode->i_op->setattr(mnt_userns,
+					    file_dentry(memfd), attr);
+out:
+	return ret;
+}
+
+static const struct inode_operations inaccessible_iops = {
+	.getattr = inaccessible_getattr,
+	.setattr = inaccessible_setattr,
+};
+
+static int inaccessible_init_fs_context(struct fs_context *fc)
+{
+	if (!init_pseudo(fc, INACCESSIBLE_MAGIC))
+		return -ENOMEM;
+
+	fc->s_iflags |= SB_I_NOEXEC;
+	return 0;
+}
+
+static struct file_system_type inaccessible_fs = {
+	.owner		= THIS_MODULE,
+	.name		= "[inaccessible]",
+	.init_fs_context = inaccessible_init_fs_context,
+	.kill_sb	= kill_anon_super,
+};
+
+static struct vfsmount *inaccessible_mnt;
+
+static __init int inaccessible_init(void)
+{
+	inaccessible_mnt = kern_mount(&inaccessible_fs);
+	if (IS_ERR(inaccessible_mnt))
+		return PTR_ERR(inaccessible_mnt);
+	return 0;
+}
+fs_initcall(inaccessible_init);
+
+struct file *memfd_mkinaccessible(struct file *memfd)
+{
+	struct inaccessible_data *data;
+	struct address_space *mapping;
+	struct inode *inode;
+	struct file *file;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return ERR_PTR(-ENOMEM);
+
+	data->memfd = memfd;
+	init_rwsem(&data->lock);
+	INIT_LIST_HEAD(&data->notifiers);
+
+	inode = alloc_anon_inode(inaccessible_mnt->mnt_sb);
+	if (IS_ERR(inode)) {
+		kfree(data);
+		return ERR_CAST(inode);
+	}
+
+	inode->i_mode |= S_IFREG;
+	inode->i_op = &inaccessible_iops;
+	inode->i_mapping->private_data = data;
+
+	file = alloc_file_pseudo(inode, inaccessible_mnt,
+				 "[memfd:inaccessible]", O_RDWR,
+				 &inaccessible_fops);
+	if (IS_ERR(file)) {
+		iput(inode);
+		kfree(data);
+	}
+
+	mapping = memfd->f_mapping;
+	mapping_set_unevictable(mapping);
+	mapping_set_gfp_mask(mapping,
+			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
+
+	return file;
+}
+
+int inaccessible_register_notifier(struct file *file,
+			      struct inaccessible_notifier *notifier)
+{
+	struct inaccessible_data *data = file->f_mapping->private_data;
+
+	down_write(&data->lock);
+	list_add(&notifier->list, &data->notifiers);
+	up_write(&data->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(inaccessible_register_notifier);
+
+void inaccessible_unregister_notifier(struct file *file,
+				      struct inaccessible_notifier *notifier)
+{
+	struct inaccessible_data *data = file->f_mapping->private_data;
+
+	down_write(&data->lock);
+	list_del_rcu(&notifier->list);
+	up_write(&data->lock);
+}
+EXPORT_SYMBOL_GPL(inaccessible_unregister_notifier);
+
+int inaccessible_get_pfn(struct file *file, pgoff_t offset, pfn_t *pfn,
+			 int *order)
+{
+	struct inaccessible_data *data = file->f_mapping->private_data;
+	struct file *memfd = data->memfd;
+	struct page *page;
+	int ret;
+
+	down_read(&data->lock);
+
+	ret = shmem_getpage(file_inode(memfd), offset, &page, SGP_WRITE);
+	if (ret) {
+		up_read(&data->lock);
+		return ret;
+	}
+
+	*pfn = page_to_pfn_t(page);
+	*order = thp_order(compound_head(page));
+	return 0;
+}
+EXPORT_SYMBOL_GPL(inaccessible_get_pfn);
+
+void inaccessible_put_pfn(struct file *file, pfn_t pfn)
+{
+	struct page *page = pfn_t_to_page(pfn);
+	struct inaccessible_data *data = file->f_mapping->private_data;
+
+	if (WARN_ON_ONCE(!page))
+		return;
+
+	SetPageUptodate(page);
+	unlock_page(page);
+	put_page(page);
+	up_read(&data->lock);
+}
+EXPORT_SYMBOL_GPL(inaccessible_put_pfn);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

