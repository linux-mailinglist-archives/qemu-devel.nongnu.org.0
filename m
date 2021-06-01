Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8638F2CB
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:16:36 +0200 (CEST)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llF7x-00057q-VG
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:16:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1llF3F-0000as-HN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:11:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:59950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1llF3B-00079q-GQ
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:11:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF8E61403;
 Mon, 24 May 2021 18:11:31 +0000 (UTC)
Date: Mon, 24 May 2021 19:11:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
Message-ID: <20210524181129.GI14645@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-8-steven.price@arm.com>
 <20210520120556.GC12251@arm.com>
 <dd5ab3a0-5a74-b145-2485-d6d871be945b@arm.com>
 <20210520172713.GF12251@arm.com>
 <5eec330f-63c0-2af8-70f8-ba9b643e2558@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eec330f-63c0-2af8-70f8-ba9b643e2558@arm.com>
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

On Fri, May 21, 2021 at 10:42:09AM +0100, Steven Price wrote:
> On 20/05/2021 18:27, Catalin Marinas wrote:
> > On Thu, May 20, 2021 at 04:58:01PM +0100, Steven Price wrote:
> >> On 20/05/2021 13:05, Catalin Marinas wrote:
> >>> On Mon, May 17, 2021 at 01:32:38PM +0100, Steven Price wrote:
> >>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> >>>> index e89a5e275e25..4b6c83beb75d 100644
> >>>> --- a/arch/arm64/kvm/arm.c
> >>>> +++ b/arch/arm64/kvm/arm.c
> >>>> @@ -1309,6 +1309,65 @@ static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
> >>>>  	}
> >>>>  }
> >>>>  
> >>>> +static int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >>>> +				      struct kvm_arm_copy_mte_tags *copy_tags)
> >>>> +{
> >>>> +	gpa_t guest_ipa = copy_tags->guest_ipa;
> >>>> +	size_t length = copy_tags->length;
> >>>> +	void __user *tags = copy_tags->addr;
> >>>> +	gpa_t gfn;
> >>>> +	bool write = !(copy_tags->flags & KVM_ARM_TAGS_FROM_GUEST);
> >>>> +	int ret = 0;
> >>>> +
> >>>> +	if (copy_tags->reserved[0] || copy_tags->reserved[1])
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
> >>>> +		return -EINVAL;
> >>>> +
> >>>> +	gfn = gpa_to_gfn(guest_ipa);
> >>>> +
> >>>> +	mutex_lock(&kvm->slots_lock);
> >>>> +
> >>>> +	while (length > 0) {
> >>>> +		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
> >>>> +		void *maddr;
> >>>> +		unsigned long num_tags = PAGE_SIZE / MTE_GRANULE_SIZE;
> >>>> +
> >>>> +		if (is_error_noslot_pfn(pfn)) {
> >>>> +			ret = -EFAULT;
> >>>> +			goto out;
> >>>> +		}
> >>>> +
> >>>> +		maddr = page_address(pfn_to_page(pfn));
> >>>> +
> >>>> +		if (!write) {
> >>>> +			num_tags = mte_copy_tags_to_user(tags, maddr, num_tags);
> >>>> +			kvm_release_pfn_clean(pfn);
> >>>
> >>> Do we need to check if PG_mte_tagged is set? If the page was not faulted
> >>> into the guest address space but the VMM has the page, does the
> >>> gfn_to_pfn_prot() guarantee that a kvm_set_spte_gfn() was called? If
> >>> not, this may read stale tags.
> >>
> >> Ah, I hadn't thought about that... No I don't believe gfn_to_pfn_prot()
> >> will fault it into the guest.
> > 
> > It doesn't indeed. What it does is a get_user_pages() but it's not of
> > much help since the VMM pte wouldn't be tagged (we would have solved
> > lots of problems if we required PROT_MTE in the VMM...)
> 
> Sadly it solves some problems and creates others :(

I had some (random) thoughts on how to make things simpler, maybe. I
think most of these races would have been solved if we required PROT_MTE
in the VMM but this has an impact on the VMM if it wants to use MTE
itself. If such requirement was in place, all KVM needed to do is check
PG_mte_tagged.

So what we actually need is a set_pte_at() in the VMM to clear the tags
and set PG_mte_tagged. Currently, we only do this if the memory type is
tagged (PROT_MTE) but it's not strictly necessary.

As an optimisation for normal programs, we don't want to do this all the
time but the visible behaviour wouldn't change (well, maybe for ptrace
slightly). However, it doesn't mean we couldn't for a VMM, with an
opt-in via prctl(). This would add a MMCF_MTE_TAG_INIT bit (couldn't
think of a better name) to mm_context_t.flags and set_pte_at() would
behave as if the pte was tagged without actually mapping the memory in
user space as tagged (protection flags not changed). Pages that don't
support tagging are still safe, just some unnecessary ignored tag
writes. This would need to be set before the mmap() for the guest
memory.

If we want finer-grained control we'd have to store this information in
the vma flags, in addition to VM_MTE (e.g. VM_MTE_TAG_INIT) but without
affecting the actual memory type. The easiest would be another pte bit,
though we are short on them. A more intrusive (not too bad) approach is
to introduce a set_pte_at_vma() and read the flags directly in the arch
code. In most places where set_pte_at() is called on a user mm, the vma
is also available.

Anyway, I'm not saying we go this route, just thinking out loud, get
some opinions.

> > Another thing I forgot to ask, what's guaranteeing that the page
> > supports tags? Does this ioctl ensure that it would attempt the tag
> > copying from some device mapping? Do we need some kvm_is_device_pfn()
> > check? I guess ZONE_DEVICE memory we just refuse to map in an earlier
> > patch.
> 
> Hmm, nothing much. While reads are now fine (the memory won't have
> PG_mte_tagged), writes could potentially happen on ZONE_DEVICE memory.

I don't think it's a problem for writes either as the host wouldn't map
such memory as tagged. It's just that it returns zeros and writes are
ignored, so we could instead return an error (I haven't checked your
latest series yet).

> >> 		} else {
> >> 			num_tags = mte_copy_tags_from_user(maddr, tags,
> >> 							MTE_GRANULES_PER_PAGE);
> >> 			kvm_release_pfn_dirty(pfn);
> >> 		}
> >>
> >> 		if (num_tags != MTE_GRANULES_PER_PAGE) {
> >> 			ret = -EFAULT;
> >> 			goto out;
> >> 		}
> >>
> >> 		if (write)
> >> 			test_and_set_bit(PG_mte_tagged, &page->flags);
> > 
> > I think a set_bit() would do, I doubt it's any more efficient. But why
> 
> I'd seen test_and_set_bit() used elsewhere (I forget where now) as a
> slightly more efficient approach. It complies down to a READ_ONCE and a
> conditional atomic, vs a single non-conditional atomic. But I don't have
> any actual data on the performance and this isn't a hot path, so I'll
> switch to the more obvious set_bit().

Yeah, I think I've seen this as well. Anyway, it's probably lost in the
noise of tag writing here.

-- 
Catalin

