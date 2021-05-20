Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E890338AD08
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:55:53 +0200 (CEST)
Received: from localhost ([::1]:58746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljhHM-0003w5-Ed
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljhG8-0002m9-N3
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:54:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:53336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljhG6-0006KD-DX
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:54:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAF0161006;
 Thu, 20 May 2021 11:54:29 +0000 (UTC)
Date: Thu, 20 May 2021 12:54:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 4/8] arm64: kvm: Introduce MTE VM feature
Message-ID: <20210520115426.GB12251@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-5-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517123239.8025-5-steven.price@arm.com>
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

On Mon, May 17, 2021 at 01:32:35PM +0100, Steven Price wrote:
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index c5d1f3c87dbd..8660f6a03f51 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -822,6 +822,31 @@ transparent_hugepage_adjust(struct kvm_memory_slot *memslot,
>  	return PAGE_SIZE;
>  }
>  
> +static int sanitise_mte_tags(struct kvm *kvm, unsigned long size,
> +			     kvm_pfn_t pfn)
> +{
> +	if (kvm_has_mte(kvm)) {
> +		/*
> +		 * The page will be mapped in stage 2 as Normal Cacheable, so
> +		 * the VM will be able to see the page's tags and therefore
> +		 * they must be initialised first. If PG_mte_tagged is set,
> +		 * tags have already been initialised.
> +		 */
> +		unsigned long i, nr_pages = size >> PAGE_SHIFT;
> +		struct page *page = pfn_to_online_page(pfn);
> +
> +		if (!page)
> +			return -EFAULT;

IIRC we ended up with pfn_to_online_page() to reject ZONE_DEVICE pages
that may be mapped into a guest and we have no idea whether they support
MTE. It may be worth adding a comment, otherwise, as Marc said, the page
wouldn't disappear.

> +
> +		for (i = 0; i < nr_pages; i++, page++) {
> +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> +				mte_clear_page_tags(page_address(page));

We started the page->flags thread and ended up fixing it for the host
set_pte_at() as per the first patch:

https://lore.kernel.org/r/c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com

Now, can we have a race between the stage 2 kvm_set_spte_gfn() and a
stage 1 set_pte_at()? Only the latter takes a lock. Or between two
kvm_set_spte_gfn() in different VMs? I think in the above thread we
concluded that there's only a problem if the page is shared between
multiple VMMs (MAP_SHARED). How realistic is this and what's the
workaround?

Either way, I think it's worth adding a comment here on the race on
page->flags as it looks strange that here it's just a test_and_set_bit()
while set_pte_at() uses a spinlock.

-- 
Catalin

