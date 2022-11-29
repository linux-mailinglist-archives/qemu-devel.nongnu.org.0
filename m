Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A6C63C1C2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 15:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p01DM-0002Is-5b; Tue, 29 Nov 2022 09:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p01DA-0002Hs-Et
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:03:49 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p01D8-0002aB-7u
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 09:03:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669730626; x=1701266626;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=RRv6X9kxxmg0r2Bt/bN85+Xzhbzh0Sz0OFcppuwQCsk=;
 b=HqvsAaJu6i2ajlLndVSBN3k5kJMTNO6LbxAq/UL7AtNaIFOJr+ahI3Sg
 I5hs+RCuTM+b1s/NSAISmaWbOrKWtjalMQVC8U5OV+BYRTUfd3726vHzw
 ON//xxwCjc4jElJMOsV7IvgrJvMAtiZ4FoqvMT82Mf2yk+MEPdExb/9V4
 h39K9mqwDU8lD6poc0ycpypte07Q3GyQOwyHiyX4V50x7It3QMB5avEfx
 Sl4VylcB20/uD3VAobmVILD1LfvwanKu1zBMSvNZs/AgF1Qa6pYg226u7
 RcDqGyVVQx7u/ZGQ21zcXxBxDVKZ5I9nqiC9LTV7SvGMsPAxCkqLxAwuE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="316948101"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="316948101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 06:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="707221475"
X-IronPort-AV: E=Sophos;i="5.96,203,1665471600"; d="scan'208";a="707221475"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 29 Nov 2022 06:03:05 -0800
Date: Tue, 29 Nov 2022 21:58:44 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Michael Roth <michael.roth@amd.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 wei.w.wang@intel.com
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221129135844.GA902164@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <20221129000632.sz6pobh6p7teouiu@amd.com>
 <20221129112139.usp6dqhbih47qpjl@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129112139.usp6dqhbih47qpjl@box.shutemov.name>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 02:21:39PM +0300, Kirill A. Shutemov wrote:
> On Mon, Nov 28, 2022 at 06:06:32PM -0600, Michael Roth wrote:
> > On Tue, Oct 25, 2022 at 11:13:37PM +0800, Chao Peng wrote:
> > > From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> > > 
> > 
> > <snip>
> > 
> > > +static struct file *restrictedmem_file_create(struct file *memfd)
> > > +{
> > > +	struct restrictedmem_data *data;
> > > +	struct address_space *mapping;
> > > +	struct inode *inode;
> > > +	struct file *file;
> > > +
> > > +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> > > +	if (!data)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	data->memfd = memfd;
> > > +	mutex_init(&data->lock);
> > > +	INIT_LIST_HEAD(&data->notifiers);
> > > +
> > > +	inode = alloc_anon_inode(restrictedmem_mnt->mnt_sb);
> > > +	if (IS_ERR(inode)) {
> > > +		kfree(data);
> > > +		return ERR_CAST(inode);
> > > +	}
> > > +
> > > +	inode->i_mode |= S_IFREG;
> > > +	inode->i_op = &restrictedmem_iops;
> > > +	inode->i_mapping->private_data = data;
> > > +
> > > +	file = alloc_file_pseudo(inode, restrictedmem_mnt,
> > > +				 "restrictedmem", O_RDWR,
> > > +				 &restrictedmem_fops);
> > > +	if (IS_ERR(file)) {
> > > +		iput(inode);
> > > +		kfree(data);
> > > +		return ERR_CAST(file);
> > > +	}
> > > +
> > > +	file->f_flags |= O_LARGEFILE;
> > > +
> > > +	mapping = memfd->f_mapping;
> > > +	mapping_set_unevictable(mapping);
> > > +	mapping_set_gfp_mask(mapping,
> > > +			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> > 
> > Is this supposed to prevent migration of pages being used for
> > restrictedmem/shmem backend?
> 
> Yes, my bad. I expected it to prevent migration, but it is not true.
> 
> Looks like we need to bump refcount in restrictedmem_get_page() and reduce
> it back when KVM is no longer use it.

The restrictedmem_get_page() has taken a reference, but later KVM
put_page() after populating the secondary page table entry through
kvm_release_pfn_clean(). One option would let the user feature(e.g.
TDX/SEV) to get_page/put_page() during populating the secondary page
table entry, AFAICS, this requirement also comes from these features.

Chao
> 
> Chao, could you adjust it?
> 
> -- 
>   Kiryl Shutsemau / Kirill A. Shutemov

