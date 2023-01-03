Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EA865B905
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 02:46:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCWLp-0007Yo-8K; Mon, 02 Jan 2023 20:44:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pCWLm-0007Yg-8X
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 20:44:22 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pCWLj-0000e0-Hg
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 20:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672710259; x=1704246259;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kIuNdU/0BTpRBUyYlNa5j3GUvL63FAbv1n39zRBT40o=;
 b=IJmJjtlkE72ANPZmEG8LlXBZHkBLY7QUFcD/5E6LITGBF/XzRfDGc3cV
 FzWhJYx4Ej/cxCLOy+kshLq1F7Kgtr+/7e/zgw3dtG1sPj5kHTjWPdeBj
 KT26P+hgOVWmnt2ZmxHK0GeK9RP5UyADmgdea64TvCJjXAvRanMl82D1Y
 iJrWg77vwGXUE02m8ITqMMP35Y6cTlR3eWZHgSgT+8uMHsdZtpgW4PvLL
 tW9qnP47slbnazH6tva8bhFJvG/E+q95PmYSKsOe79QKj8dTJfEvFNr30
 IRg7gj09q80h1DzgI9NJJK/elhjDLZAWcE13GcB6enWatxah9GhJuBWa+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="407822387"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="407822387"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2023 17:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10578"; a="828701041"
X-IronPort-AV: E=Sophos;i="5.96,295,1665471600"; d="scan'208";a="828701041"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga005.jf.intel.com with ESMTP; 02 Jan 2023 17:44:01 -0800
Date: Tue, 3 Jan 2023 09:39:48 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Chenyi Qiang <chenyi.qiang@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <20230103013948.GA2178318@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <1c9bbaa5-eea3-351e-d6a0-cfbc32115c82@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c9bbaa5-eea3-351e-d6a0-cfbc32115c82@intel.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
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

On Wed, Dec 28, 2022 at 04:28:01PM +0800, Chenyi Qiang wrote:
...
> > +static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> > +					   struct kvm_memory_attributes *attrs)
> > +{
> > +	gfn_t start, end;
> > +	unsigned long i;
> > +	void *entry;
> > +	u64 supported_attrs = kvm_supported_mem_attributes(kvm);
> > +
> > +	/* flags is currently not used. */
> > +	if (attrs->flags)
> > +		return -EINVAL;
> > +	if (attrs->attributes & ~supported_attrs)
> > +		return -EINVAL;
> > +	if (attrs->size == 0 || attrs->address + attrs->size < attrs->address)
> > +		return -EINVAL;
> > +	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
> > +		return -EINVAL;
> > +
> > +	start = attrs->address >> PAGE_SHIFT;
> > +	end = (attrs->address + attrs->size - 1 + PAGE_SIZE) >> PAGE_SHIFT;
> > +
> > +	entry = attrs->attributes ? xa_mk_value(attrs->attributes) : NULL;
> > +
> 
> Because guest memory defaults to private, and now this patch stores the
> attributes with KVM_MEMORY_ATTRIBUTE_PRIVATE instead of _SHARED, it
> would bring more KVM_EXIT_MEMORY_FAULT exits at the beginning of boot
> time. Maybe it can be optimized somehow in other places? e.g. set mem
> attr in advance.

KVM defaults to 'shared' because this ioctl can also be potentially used
by normal VMs and 'shared' sounds a value meaningful for both normal VMs
and confidential VMs. As for more KVM_EXIT_MEMORY_FAULT exits during the
booting time, yes, setting all memory to 'private' for confidential VMs
through this ioctl in userspace before guest launch is an approach for
KVM userspace to 'override' the KVM default and reduce the number of
implicit conversions.

Thanks,
Chao
> 
> > +	mutex_lock(&kvm->lock);
> > +	for (i = start; i < end; i++)
> > +		if (xa_err(xa_store(&kvm->mem_attr_array, i, entry,
> > +				    GFP_KERNEL_ACCOUNT)))
> > +			break;
> > +	mutex_unlock(&kvm->lock);
> > +
> > +	attrs->address = i << PAGE_SHIFT;
> > +	attrs->size = (end - i) << PAGE_SHIFT;
> > +
> > +	return 0;
> > +}
> > +#endif /* CONFIG_HAVE_KVM_MEMORY_ATTRIBUTES */
> > +
> >  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
> >  {
> >  	return __gfn_to_memslot(kvm_memslots(kvm), gfn);

