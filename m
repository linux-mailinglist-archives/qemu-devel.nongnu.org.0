Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AFC34E57F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:32:50 +0200 (CEST)
Received: from localhost ([::1]:60022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBg1-0004m9-6N
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lRBdl-0003re-9U
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:55314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lRBdf-00049p-11
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:30:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F15E76195C;
 Tue, 30 Mar 2021 10:30:17 +0000 (UTC)
Date: Tue, 30 Mar 2021 11:30:15 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v10 2/6] arm64: kvm: Introduce MTE VM feature
Message-ID: <20210330103013.GD18075@arm.com>
References: <20210312151902.17853-1-steven.price@arm.com>
 <20210312151902.17853-3-steven.price@arm.com>
 <20210327152324.GA28167@arm.com> <20210328122131.GB17535@arm.com>
 <e0b88560-34e1-dcc4-aaa7-9a7a5b771824@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0b88560-34e1-dcc4-aaa7-9a7a5b771824@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Mon, Mar 29, 2021 at 05:06:51PM +0100, Steven Price wrote:
> On 28/03/2021 13:21, Catalin Marinas wrote:
> > On Sat, Mar 27, 2021 at 03:23:24PM +0000, Catalin Marinas wrote:
> > > On Fri, Mar 12, 2021 at 03:18:58PM +0000, Steven Price wrote:
> > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > index 77cb2d28f2a4..b31b7a821f90 100644
> > > > --- a/arch/arm64/kvm/mmu.c
> > > > +++ b/arch/arm64/kvm/mmu.c
> > > > @@ -879,6 +879,22 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > >   	if (vma_pagesize == PAGE_SIZE && !force_pte)
> > > >   		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
> > > >   							   &pfn, &fault_ipa);
> > > > +
> > > > +	if (fault_status != FSC_PERM && kvm_has_mte(kvm) && pfn_valid(pfn)) {
> > > > +		/*
> > > > +		 * VM will be able to see the page's tags, so we must ensure
> > > > +		 * they have been initialised. if PG_mte_tagged is set, tags
> > > > +		 * have already been initialised.
> > > > +		 */
> > > > +		struct page *page = pfn_to_page(pfn);
> > > > +		unsigned long i, nr_pages = vma_pagesize >> PAGE_SHIFT;
> > > > +
> > > > +		for (i = 0; i < nr_pages; i++, page++) {
> > > > +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> > > > +				mte_clear_page_tags(page_address(page));
> > > > +		}
> > > > +	}
> > > 
> > > This pfn_valid() check may be problematic. Following commit eeb0753ba27b
> > > ("arm64/mm: Fix pfn_valid() for ZONE_DEVICE based memory"), it returns
> > > true for ZONE_DEVICE memory but such memory is allowed not to support
> > > MTE.
> > 
> > Some more thinking, this should be safe as any ZONE_DEVICE would be
> > mapped as untagged memory in the kernel linear map. It could be slightly
> > inefficient if it unnecessarily tries to clear tags in ZONE_DEVICE,
> > untagged memory. Another overhead is pfn_valid() which will likely end
> > up calling memblock_is_map_memory().
> > 
> > However, the bigger issue is that Stage 2 cannot disable tagging for
> > Stage 1 unless the memory is Non-cacheable or Device at S2. Is there a
> > way to detect what gets mapped in the guest as Normal Cacheable memory
> > and make sure it's only early memory or hotplug but no ZONE_DEVICE (or
> > something else like on-chip memory)?  If we can't guarantee that all
> > Cacheable memory given to a guest supports tags, we should disable the
> > feature altogether.
> 
> In stage 2 I believe we only have two types of mapping - 'normal' or
> DEVICE_nGnRE (see stage2_map_set_prot_attr()). Filtering out the latter is a
> case of checking the 'device' variable, and makes sense to avoid the
> overhead you describe.
> 
> This should also guarantee that all stage-2 cacheable memory supports tags,
> as kvm_is_device_pfn() is simply !pfn_valid(), and pfn_valid() should only
> be true for memory that Linux considers "normal".

That's the problem. With Anshuman's commit I mentioned above,
pfn_valid() returns true for ZONE_DEVICE mappings (e.g. persistent
memory, not talking about some I/O mapping that requires Device_nGnRE).
So kvm_is_device_pfn() is false for such memory and it may be mapped as
Normal but it is not guaranteed to support tagging.

For user MTE, we get away with this as the MAP_ANONYMOUS requirement
would filter it out while arch_add_memory() will ensure it's mapped as
untagged in the linear map. See another recent fix for hotplugged
memory: d15dfd31384b ("arm64: mte: Map hotplugged memory as Normal
Tagged"). We needed to ensure that ZONE_DEVICE doesn't end up as tagged,
only hoplugged memory. Both handled via arch_add_memory() in the arch
code with ZONE_DEVICE starting at devm_memremap_pages().

> > > I now wonder if we can get a MAP_ANONYMOUS mapping of ZONE_DEVICE pfn
> > > even without virtualisation.
> > 
> > I haven't checked all the code paths but I don't think we can get a
> > MAP_ANONYMOUS mapping of ZONE_DEVICE memory as we normally need a file
> > descriptor.
> 
> I certainly hope this is the case - it's the weird corner cases of device
> drivers that worry me. E.g. I know i915 has a "hidden" mmap behind an ioctl
> (see i915_gem_mmap_ioctl(), although this case is fine - it's MAP_SHARED).
> Mali's kbase did something similar in the past.

I think this should be fine since it's not a MAP_ANONYMOUS (we do allow
MAP_SHARED to be tagged).

-- 
Catalin

