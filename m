Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE78257C7F2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:45:18 +0200 (CEST)
Received: from localhost ([::1]:40740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oESk9-0002Zw-Ia
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oEShH-0000Vc-U3
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:42:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:19243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oEShF-00012b-70
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658396537; x=1689932537;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6iF6C2k7uRS+q7Yo8OaJrnqIl0kJvizDvEKWhi3avTo=;
 b=n4BCtiM43lsJiemGip1fzP7ikw+o/KVhhfjLie2+GksE3MrAWda925cu
 nYb1biZZX2m3k4CBTIq1RAMEnPIXe7A7jejiT1IX/8zsVbmiZu1s8zRp7
 JhlCbVGNg8fBrsH7FAYjDW8kGzXXPVFdo8UMhnuJVrg/CorAXFgFevKma
 6LUAszuThZ7QWQ3clZqF+/O9jTtemAGtShxWxVkp3dz+2URSeNuPUaqqo
 BnnpMXNR2MJo/k8PvAqnHJP2/CuzyQtfdJhyJIyBIfKSv6ajCdoA2Dxv1
 fCNZnlETwObaeCC0/OL+NQpzA80ww5Y4MVH9fLlqLO/ch4eauvGeIYcDS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="270032067"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="270032067"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 02:42:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="656669811"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2022 02:42:05 -0700
Date: Thu, 21 Jul 2022 17:37:15 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <20220721093715.GB153288@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
 <Ytgw8HAsKTmZaubv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ytgw8HAsKTmZaubv@google.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 04:44:32PM +0000, Sean Christopherson wrote:
> On Wed, Jul 06, 2022, Chao Peng wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 230c8ff9659c..bb714c2a4b06 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -914,6 +914,35 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >  
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >  
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +#define KVM_MEM_ATTR_PRIVATE	0x0001
> > +static int kvm_vm_ioctl_set_encrypted_region(struct kvm *kvm, unsigned int ioctl,
> > +					     struct kvm_enc_region *region)
> > +{
> > +	unsigned long start, end;
> 
> As alluded to in a different reply, because this will track GPAs instead of HVAs,
> the type needs to be "gpa_t", not "unsigned long".  Oh, actually, they need to
> be gfn_t, since those are what gets shoved into the xarray.

It's gfn_t actually. My original purpose for this is 32bit architectures
(if any) can also work with it since index of xarrary is 32bit on those
architectures.  But kvm_enc_region is u64 so itr's even not possible.

> 
> > +	void *entry;
> > +	int r;
> > +
> > +	if (region->size == 0 || region->addr + region->size < region->addr)
> > +		return -EINVAL;
> > +	if (region->addr & (PAGE_SIZE - 1) || region->size & (PAGE_SIZE - 1))
> > +		return -EINVAL;
> > +
> > +	start = region->addr >> PAGE_SHIFT;
> > +	end = (region->addr + region->size - 1) >> PAGE_SHIFT;
> > +
> > +	entry = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION ?
> > +				xa_mk_value(KVM_MEM_ATTR_PRIVATE) : NULL;
> > +
> > +	r = xa_err(xa_store_range(&kvm->mem_attr_array, start, end,
> > +					entry, GFP_KERNEL_ACCOUNT));
> 
> IIUC, this series treats memory as shared by default.  I think we should invert
> that and have KVM's ABI be that all guest memory as private by default, i.e.
> require the guest to opt into sharing memory instead of opt out of sharing memory.
> 
> And then the xarray would track which regions are shared.

Maybe I missed some information discussed elsewhere? I followed
https://lkml.org/lkml/2022/5/23/772. KVM is shared by default but
userspace should set all guest memory to private before the guest
launch, guest then sees all memory as private.  While default it to
private sounds also good, if we only talk about the private/shared in
private memory context (I think so), then there is no ambiguity.

> 
> Regarding mem_attr_array, it probably makes sense to explicitly include what it's
> tracking in the name, i.e. name it {private,shared}_mem_array depending on whether
> it's used to track private vs. shared memory.  If we ever need to track metadata
> beyond shared/private then we can tweak the name as needed, e.g. if hardware ever
> supports secondary non-ephemeral encryption keys.

As I think that there may be other state beyond that. Fine with me to
just take consideration of private/shared, and it also sounds
reasonable for people who want to support that to change.

Chao

