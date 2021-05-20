Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD4A38B52A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:28:14 +0200 (CEST)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmSz-0006PB-D1
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljmSE-0005js-JY
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:27:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:32826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljmSC-0008Pk-B8
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:27:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75DE860240;
 Thu, 20 May 2021 17:27:18 +0000 (UTC)
Date: Thu, 20 May 2021 18:27:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
Message-ID: <20210520172713.GF12251@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-8-steven.price@arm.com>
 <20210520120556.GC12251@arm.com>
 <dd5ab3a0-5a74-b145-2485-d6d871be945b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd5ab3a0-5a74-b145-2485-d6d871be945b@arm.com>
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

On Thu, May 20, 2021 at 04:58:01PM +0100, Steven Price wrote:
> On 20/05/2021 13:05, Catalin Marinas wrote:
> > On Mon, May 17, 2021 at 01:32:38PM +0100, Steven Price wrote:
> >> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> >> index e89a5e275e25..4b6c83beb75d 100644
> >> --- a/arch/arm64/kvm/arm.c
> >> +++ b/arch/arm64/kvm/arm.c
> >> @@ -1309,6 +1309,65 @@ static int kvm_vm_ioctl_set_device_addr(struct kvm *kvm,
> >>  	}
> >>  }
> >>  
> >> +static int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
> >> +				      struct kvm_arm_copy_mte_tags *copy_tags)
> >> +{
> >> +	gpa_t guest_ipa = copy_tags->guest_ipa;
> >> +	size_t length = copy_tags->length;
> >> +	void __user *tags = copy_tags->addr;
> >> +	gpa_t gfn;
> >> +	bool write = !(copy_tags->flags & KVM_ARM_TAGS_FROM_GUEST);
> >> +	int ret = 0;
> >> +
> >> +	if (copy_tags->reserved[0] || copy_tags->reserved[1])
> >> +		return -EINVAL;
> >> +
> >> +	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
> >> +		return -EINVAL;
> >> +
> >> +	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
> >> +		return -EINVAL;
> >> +
> >> +	gfn = gpa_to_gfn(guest_ipa);
> >> +
> >> +	mutex_lock(&kvm->slots_lock);
> >> +
> >> +	while (length > 0) {
> >> +		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
> >> +		void *maddr;
> >> +		unsigned long num_tags = PAGE_SIZE / MTE_GRANULE_SIZE;
> >> +
> >> +		if (is_error_noslot_pfn(pfn)) {
> >> +			ret = -EFAULT;
> >> +			goto out;
> >> +		}
> >> +
> >> +		maddr = page_address(pfn_to_page(pfn));
> >> +
> >> +		if (!write) {
> >> +			num_tags = mte_copy_tags_to_user(tags, maddr, num_tags);
> >> +			kvm_release_pfn_clean(pfn);
> > 
> > Do we need to check if PG_mte_tagged is set? If the page was not faulted
> > into the guest address space but the VMM has the page, does the
> > gfn_to_pfn_prot() guarantee that a kvm_set_spte_gfn() was called? If
> > not, this may read stale tags.
> 
> Ah, I hadn't thought about that... No I don't believe gfn_to_pfn_prot()
> will fault it into the guest.

It doesn't indeed. What it does is a get_user_pages() but it's not of
much help since the VMM pte wouldn't be tagged (we would have solved
lots of problems if we required PROT_MTE in the VMM...)

> >> +		} else {
> >> +			num_tags = mte_copy_tags_from_user(maddr, tags,
> >> +							   num_tags);
> >> +			kvm_release_pfn_dirty(pfn);
> >> +		}
> > 
> > Same question here, if the we can't guarantee the stage 2 pte being set,
> > we'd need to set PG_mte_tagged.
> 
> This is arguably worse as we'll be writing tags into the guest but
> without setting PG_mte_tagged - so they'll be lost when the guest then
> faults the pages in. Which sounds like it should break migration.
> 
> I think the below should be safe, and avoids the overhead of setting the
> flag just for reads.
> 
> Thanks,
> 
> Steve
> 
> ----8<----
> 		page = pfn_to_page(pfn);
> 		maddr = page_address(page);
> 
> 		if (!write) {
> 			if (test_bit(PG_mte_tagged, &page->flags))
> 				num_tags = mte_copy_tags_to_user(tags, maddr,
> 							MTE_GRANULES_PER_PAGE);
> 			else
> 				/* No tags in memory, so write zeros */
> 				num_tags = MTE_GRANULES_PER_PAGE -
> 					clear_user(tag, MTE_GRANULES_PER_PAGE);
> 			kvm_release_pfn_clean(pfn);

For ptrace we return a -EOPNOTSUPP if the address doesn't have VM_MTE
but I don't think it makes sense here, so I'm fine with clearing the
destination and assuming that the tags are zero (as they'd be on
faulting into the guest.

Another thing I forgot to ask, what's guaranteeing that the page
supports tags? Does this ioctl ensure that it would attempt the tag
copying from some device mapping? Do we need some kvm_is_device_pfn()
check? I guess ZONE_DEVICE memory we just refuse to map in an earlier
patch.

> 		} else {
> 			num_tags = mte_copy_tags_from_user(maddr, tags,
> 							MTE_GRANULES_PER_PAGE);
> 			kvm_release_pfn_dirty(pfn);
> 		}
> 
> 		if (num_tags != MTE_GRANULES_PER_PAGE) {
> 			ret = -EFAULT;
> 			goto out;
> 		}
> 
> 		if (write)
> 			test_and_set_bit(PG_mte_tagged, &page->flags);

I think a set_bit() would do, I doubt it's any more efficient. But why
not add it in the 'else' block above where we actually wrote the tags?
The copy function may have failed part-way through. Maybe your logic is
correct though, there are invalid tags in the page. Just add a comment.

-- 
Catalin

