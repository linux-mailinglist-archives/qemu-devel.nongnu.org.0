Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FE56818A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:31:26 +0200 (CEST)
Received: from localhost ([::1]:54088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90RR-0008Uf-GN
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90KH-0005F5-8L
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:63504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o90KE-0000Ga-SM
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657095838; x=1688631838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+/BgOKNb3dxFVxOORdt/5r5R408fOO4X1WIXgnHGmWI=;
 b=Pz3rJT5N/3OwkWSYqjslWhz0sVFi04uTSCm3plBemDf2/swlZQeYxGgK
 cEfFSu1PgC2pxxgeyQOd6RO4FLVVaGXiZ7SZbcO9bYYZMWfxsx3aI7D4r
 6DUdKtdYDg/qawKJl/oHYml/UiC2SULVHTytx6B4MiPiYt3h/hK2fxBPg
 /AHLeGefG/eaZI6xa96dR09cH9lv2ULCem/DY9LYhvK0QZUJuznz2PdTi
 a7X9PgfZN2v22NzUAwzVezaZEvarlzQLF9mghAaESAGItsQEXC1Aq+gTx
 jw98GBhj+Je+8BbE1pn+Jo9QejFi5++Zd7Op2PRyed1I0VP/D3rpN8Npo A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="283705272"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="283705272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 01:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="567967821"
Received: from chaop.bj.intel.com ([10.240.192.101])
 by orsmga006.jf.intel.com with ESMTP; 06 Jul 2022 01:23:46 -0700
From: Chao Peng <chao.p.peng@linux.intel.com>
To: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 Chao Peng <chao.p.peng@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Date: Wed,  6 Jul 2022 16:20:03 +0800
Message-Id: <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Normally, a write to unallocated space of a file or the hole of a sparse
file automatically causes space allocation, for memfd, this equals to
memory allocation. This new seal prevents such automatically allocating,
either this is from a direct write() or a write on the previously
mmap-ed area. The seal does not prevent fallocate() so an explicit
fallocate() can still cause allocating and can be used to reserve
memory.

This is used to prevent unintentional allocation from userspace on a
stray or careless write and any intentional allocation should use an
explicit fallocate(). One of the main usecases is to avoid memory double
allocation for confidential computing usage where we use two memfds to
back guest memory and at a single point only one memfd is alive and we
want to prevent memory allocation for the other memfd which may have
been mmap-ed previously. More discussion can be found at:

  https://lkml.org/lkml/2022/6/14/1255

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
---
 include/uapi/linux/fcntl.h |  1 +
 mm/memfd.c                 |  3 ++-
 mm/shmem.c                 | 16 ++++++++++++++--
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
index 2f86b2ad6d7e..98bdabc8e309 100644
--- a/include/uapi/linux/fcntl.h
+++ b/include/uapi/linux/fcntl.h
@@ -43,6 +43,7 @@
 #define F_SEAL_GROW	0x0004	/* prevent file from growing */
 #define F_SEAL_WRITE	0x0008	/* prevent writes */
 #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
+#define F_SEAL_AUTO_ALLOCATE	0x0020  /* prevent allocation for writes */
 /* (1U << 31) is reserved for signed error codes */
 
 /*
diff --git a/mm/memfd.c b/mm/memfd.c
index 08f5f8304746..2afd898798e4 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -150,7 +150,8 @@ static unsigned int *memfd_file_seals_ptr(struct file *file)
 		     F_SEAL_SHRINK | \
 		     F_SEAL_GROW | \
 		     F_SEAL_WRITE | \
-		     F_SEAL_FUTURE_WRITE)
+		     F_SEAL_FUTURE_WRITE | \
+		     F_SEAL_AUTO_ALLOCATE)
 
 static int memfd_add_seals(struct file *file, unsigned int seals)
 {
diff --git a/mm/shmem.c b/mm/shmem.c
index a6f565308133..6c8aef15a17d 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2051,6 +2051,8 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct inode *inode = file_inode(vma->vm_file);
 	gfp_t gfp = mapping_gfp_mask(inode->i_mapping);
+	struct shmem_inode_info *info = SHMEM_I(inode);
+	enum sgp_type sgp;
 	int err;
 	vm_fault_t ret = VM_FAULT_LOCKED;
 
@@ -2113,7 +2115,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
 		spin_unlock(&inode->i_lock);
 	}
 
-	err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, SGP_CACHE,
+	if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
+		sgp = SGP_NOALLOC;
+	else
+		sgp = SGP_CACHE;
+
+	err = shmem_getpage_gfp(inode, vmf->pgoff, &vmf->page, sgp,
 				  gfp, vma, vmf, &ret);
 	if (err)
 		return vmf_error(err);
@@ -2459,6 +2466,7 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 	struct inode *inode = mapping->host;
 	struct shmem_inode_info *info = SHMEM_I(inode);
 	pgoff_t index = pos >> PAGE_SHIFT;
+	enum sgp_type sgp;
 	int ret = 0;
 
 	/* i_rwsem is held by caller */
@@ -2470,7 +2478,11 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
 			return -EPERM;
 	}
 
-	ret = shmem_getpage(inode, index, pagep, SGP_WRITE);
+	if (unlikely(info->seals & F_SEAL_AUTO_ALLOCATE))
+		sgp = SGP_NOALLOC;
+	else
+		sgp = SGP_WRITE;
+	ret = shmem_getpage(inode, index, pagep, sgp);
 
 	if (ret)
 		return ret;
-- 
2.25.1


