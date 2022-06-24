Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFA559688
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:30:31 +0200 (CEST)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fe2-0005TO-DO
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:30:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4fGe-0007cp-I2
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:06:24 -0400
Received: from mga12.intel.com ([192.55.52.136]:20718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4fGb-00034S-N4
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656061577; x=1687597577;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=pFiQPRhH8oZ/U60WvOqK308IWSu6PiUOr+QWUMTnIwQ=;
 b=m0SnAA6NNeBtHawybtaJUw2CEeubbjMgeQJVMdM7hayKhXFMCmw1Bd9O
 X8JtPz9MTvo/urxXsClTRrEWdkbmeUU4qAPEU5zw5Z6ssoCdzSvw+/Vgv
 WA78wQOAqQ09AbwV1LktDl6Px1TTAK+5Rq0/agxe8YA5oQ/+I9EpM6QBs
 G9s9rbKV2/A242tLXXxthbt2T09OA7EHVpQrGMIrSDVVyuNIOl6oDTWEx
 DERNlLtSj1fTwhXVc6+975Wr+Zn2DxxTtdhuCNO+c5ncV6WskU8GYTCtw
 ho9PS72SsL+EOPRyQWQOTTXpZwZUQBG7tTU5t1Ranp7gYXGXRV8xchIrG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="260776453"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="260776453"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 02:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="656571912"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga004.fm.intel.com with ESMTP; 24 Jun 2022 02:06:06 -0700
Date: Fri, 24 Jun 2022 17:02:46 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Nikunj A. Dadhania" <nikunj@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
Message-ID: <20220624090246.GA2181919@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 24, 2022 at 09:28:23AM +0530, Nikunj A. Dadhania wrote:
> On 5/19/2022 9:07 PM, Chao Peng wrote:
> > A page fault can carry the information of whether the access if private
> > or not for KVM_MEM_PRIVATE memslot, this can be filled by architecture
> > code(like TDX code). To handle page faut for such access, KVM maps the
> > page only when this private property matches host's view on this page
> > which can be decided by checking whether the corresponding page is
> > populated in the private fd or not. A page is considered as private when
> > the page is populated in the private fd, otherwise it's shared.
> > 
> > For a successful match, private pfn is obtained with memfile_notifier
> > callbacks from private fd and shared pfn is obtained with existing
> > get_user_pages.
> > 
> > For a failed match, KVM causes a KVM_EXIT_MEMORY_FAULT exit to
> > userspace. Userspace then can convert memory between private/shared from
> > host's view then retry the access.
> > 
> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  arch/x86/kvm/mmu.h              |  1 +
> >  arch/x86/kvm/mmu/mmu.c          | 70 +++++++++++++++++++++++++++++++--
> >  arch/x86/kvm/mmu/mmu_internal.h | 17 ++++++++
> >  arch/x86/kvm/mmu/mmutrace.h     |  1 +
> >  arch/x86/kvm/mmu/paging_tmpl.h  |  5 ++-
> >  include/linux/kvm_host.h        | 22 +++++++++++
> >  6 files changed, 112 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> > index 7e258cc94152..c84835762249 100644
> > --- a/arch/x86/kvm/mmu.h
> > +++ b/arch/x86/kvm/mmu.h
> > @@ -176,6 +176,7 @@ struct kvm_page_fault {
> >  
> >  	/* Derived from mmu and global state.  */
> >  	const bool is_tdp;
> > +	const bool is_private;
> >  	const bool nx_huge_page_workaround_enabled;
> >  
> >  	/*
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index afe18d70ece7..e18460e0d743 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -2899,6 +2899,9 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm,
> >  	if (max_level == PG_LEVEL_4K)
> >  		return PG_LEVEL_4K;
> >  
> > +	if (kvm_slot_is_private(slot))
> > +		return max_level;
> 
> Can you explain the rationale behind the above change? 
> AFAIU, this overrides the transparent_hugepage=never setting for both 
> shared and private mappings.

As Sean pointed out, this should check against fault->is_private instead
of the slot. For private fault, the level is retrieved and stored to
fault->max_level in kvm_faultin_pfn_private() instead of here.

For shared fault, it will continue to query host_level below. For
private fault, the host level has already been accounted in
kvm_faultin_pfn_private().

Chao
> 
> >  	host_level = host_pfn_mapping_level(kvm, gfn, pfn, slot);
> >  	return min(host_level, max_level);
> >  }
> 
> Regards
> Nikunj

