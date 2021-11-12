Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AA144E1B8
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 06:53:26 +0100 (CET)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlPV7-0002jD-JI
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 00:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlPTS-0001uQ-9a
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:51:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:14873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mlPTP-00079c-Ax
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 00:51:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="220289077"
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; d="scan'208";a="220289077"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 21:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; d="scan'208";a="492855072"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 11 Nov 2021 21:51:27 -0800
Date: Fri, 12 Nov 2021 13:50:38 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Mika =?iso-8859-1?Q?Penttil=E4?= <mika.penttila@nextfour.com>
Subject: Re: [RFC PATCH 5/6] kvm: x86: add KVM_EXIT_MEMORY_ERROR exit
Message-ID: <20211112055038.GB27969@chaop.bj.intel.com>
References: <20211111141352.26311-1-chao.p.peng@linux.intel.com>
 <20211111141352.26311-6-chao.p.peng@linux.intel.com>
 <f7155c5b-fc87-c1a6-9ee7-06f08a25bdb4@nextfour.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7155c5b-fc87-c1a6-9ee7-06f08a25bdb4@nextfour.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Wanpeng Li <wanpengli@tencent.com>, luto@kernel.org, kvm@vger.kernel.org,
 david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 jun.nakajima@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Jim Mattson <jmattson@google.com>,
 linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 05:08:47PM +0200, Mika Penttilä wrote:
> 
> 
> On 11.11.2021 16.13, Chao Peng wrote:
> > Currently support to exit to userspace for private/shared memory
> > conversion.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c   | 20 ++++++++++++++++++++
> >   include/uapi/linux/kvm.h | 15 +++++++++++++++
> >   2 files changed, 35 insertions(+)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index af5ecf4ef62a..780868888aa8 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -3950,6 +3950,17 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
> >   	slot = __kvm_vcpu_gfn_to_memslot(vcpu, gfn, private);
> > +	/*
> > +	 * Exit to userspace to map the requested private/shared memory region
> > +	 * if there is no memslot and (a) the access is private or (b) there is
> > +	 * an existing private memslot.  Emulated MMIO must be accessed through
> > +	 * shared GPAs, thus a memslot miss on a private GPA is always handled
> > +	 * as an implicit conversion "request".
> > +	 */
> > +	if (!slot &&
> > +	    (private || __kvm_vcpu_gfn_to_memslot(vcpu, gfn, true)))
> > +		goto out_convert;
> > +
> >   	/* Don't expose aliases for no slot GFNs or private memslots */
> >   	if ((cr2_or_gpa & vcpu_gpa_stolen_mask(vcpu)) &&
> >   	    !kvm_is_visible_memslot(slot)) {
> > @@ -3994,6 +4005,15 @@ static bool try_async_pf(struct kvm_vcpu *vcpu, bool prefault, gfn_t gfn,
> >   	*pfn = __gfn_to_pfn_memslot(slot, gfn, false, NULL,
> >   				    write, writable, hva);
> >   	return false;
> > +
> > +out_convert:
> > +	vcpu->run->exit_reason = KVM_EXIT_MEMORY_ERROR;
> > +	vcpu->run->mem.type = private ? KVM_EXIT_MEM_MAP_PRIVATE
> > +				      : KVM_EXIT_MEM_MAP_SHARE;
> > +	vcpu->run->mem.u.map.gpa = cr2_or_gpa;
> > +	vcpu->run->mem.u.map.size = PAGE_SIZE;
> > +	return true;
> > +
> I think this does just retry, no exit to user space?

Good catch, thanks.
Chao
> 
> 
> 
> 
> > }
> >   static int direct_page_fault(struct kvm_vcpu *vcpu, gpa_t gpa, u32 error_code,
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 8d20caae9180..470c472a9451 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -233,6 +233,18 @@ struct kvm_xen_exit {
> >   	} u;
> >   };
> > +struct kvm_memory_exit {
> > +#define KVM_EXIT_MEM_MAP_SHARE          1
> > +#define KVM_EXIT_MEM_MAP_PRIVATE        2
> > +	__u32 type;
> > +	union {
> > +		struct {
> > +			__u64 gpa;
> > +			__u64 size;
> > +		} map;
> > +	} u;
> > +};
> > +
> >   #define KVM_S390_GET_SKEYS_NONE   1
> >   #define KVM_S390_SKEYS_MAX        1048576
> > @@ -272,6 +284,7 @@ struct kvm_xen_exit {
> >   #define KVM_EXIT_X86_BUS_LOCK     33
> >   #define KVM_EXIT_XEN              34
> >   #define KVM_EXIT_TDVMCALL         35
> > +#define KVM_EXIT_MEMORY_ERROR	  36
> >   /* For KVM_EXIT_INTERNAL_ERROR */
> >   /* Emulate instruction failed. */
> > @@ -455,6 +468,8 @@ struct kvm_run {
> >   			__u64 subfunc;
> >   			__u64 param[4];
> >   		} tdvmcall;
> > +		/* KVM_EXIT_MEMORY_ERROR */
> > +		struct kvm_memory_exit mem;
> >   		/* Fix the size of the union. */
> >   		char padding[256];
> >   	};
> 

