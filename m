Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B461C39B575
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:03:03 +0200 (CEST)
Received: from localhost ([::1]:51152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5jK-0004vR-HV
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:03:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lp5i3-0003Zj-7R
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lp5ht-0008TN-H3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:01:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EA186140F;
 Fri,  4 Jun 2021 09:01:28 +0000 (UTC)
Date: Fri, 4 Jun 2021 10:01:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v13 4/8] KVM: arm64: Introduce MTE VM feature
Message-ID: <20210604090125.GA23321@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-5-steven.price@arm.com>
 <20210603160031.GE20338@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603160031.GE20338@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 05:00:31PM +0100, Catalin Marinas wrote:
> On Mon, May 24, 2021 at 11:45:09AM +0100, Steven Price wrote:
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index c5d1f3c87dbd..226035cf7d6c 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -822,6 +822,42 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
> >  	return PAGE_SIZE;
> >  }
> >  
> > +static int sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
> > +			     unsigned long size)
> > +{
> > +	if (kvm_has_mte(kvm)) {
> > +		/*
> > +		 * The page will be mapped in stage 2 as Normal Cacheable, so
> > +		 * the VM will be able to see the page's tags and therefore
> > +		 * they must be initialised first. If PG_mte_tagged is set,
> > +		 * tags have already been initialised.
> > +		 * pfn_to_online_page() is used to reject ZONE_DEVICE pages
> > +		 * that may not support tags.
> > +		 */
> > +		unsigned long i, nr_pages = size >> PAGE_SHIFT;
> > +		struct page *page = pfn_to_online_page(pfn);
> > +
> > +		if (!page)
> > +			return -EFAULT;
> > +
> > +		for (i = 0; i < nr_pages; i++, page++) {
> > +			/*
> > +			 * There is a potential (but very unlikely) race
> > +			 * between two VMs which are sharing a physical page
> > +			 * entering this at the same time. However by splitting
> > +			 * the test/set the only risk is tags being overwritten
> > +			 * by the mte_clear_page_tags() call.
> > +			 */
> 
> And I think the real risk here is when the page is writable by at least
> one of the VMs sharing the page. This excludes KSM, so it only leaves
> the MAP_SHARED mappings.
> 
> > +			if (!test_bit(PG_mte_tagged, &page->flags)) {
> > +				mte_clear_page_tags(page_address(page));
> > +				set_bit(PG_mte_tagged, &page->flags);
> > +			}
> > +		}
> 
> If we want to cover this race (I'd say in a separate patch), we can call
> mte_sync_page_tags(page, __pte(0), false, true) directly (hopefully I
> got the arguments right). We can avoid the big lock in most cases if
> kvm_arch_prepare_memory_region() sets a VM_MTE_RESET (tag clear etc.)
> and __alloc_zeroed_user_highpage() clears the tags on allocation (as we
> do for VM_MTE but the new flag would not affect the stage 1 VMM page
> attributes).

Another idea: if VM_SHARED is found for any vma within a region in
kvm_arch_prepare_memory_region(), we either prevent the enabling of MTE
for the guest or reject the memory slot if MTE was already enabled.

An alternative here would be to clear VM_MTE_ALLOWED so that any
subsequent mprotect(PROT_MTE) in the VMM would fail in
arch_validate_flags(). MTE would still be allowed in the guest but in
the VMM for the guest memory regions. We can probably do this
irrespective of VM_SHARED. Of course, the VMM can still mmap() the
memory initially with PROT_MTE but that's not an issue IIRC, only the
concurrent mprotect().

-- 
Catalin

