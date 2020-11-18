Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DA2B82BB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 18:14:03 +0100 (CET)
Received: from localhost ([::1]:38046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfR1u-0001kx-Hz
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 12:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kfQuO-0002Vs-9g
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kfQuL-0008Qm-8i
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 12:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605719168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=znOvFVbpSljE+gP6YbD+IOXgKYlAvuPgXm75WCYUueE=;
 b=gRwiY3v9DwBkmyipKGGiQpmF13+iJjUTirezmAG9AjJPukvbJkrbP1m1CKvww9IUKKdFxb
 v3HKhXOzYs9Tbs1ExK4QgjF2DfBar6WIkqA9GY4Mt/Cxrb7VaYgHSsH2SBIe/snsMUNZae
 mp2GOJJwzDTstFg4mhkTl60MOMS7O+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-m6xE8JiTMIaZwlzsEo4lGg-1; Wed, 18 Nov 2020 12:06:04 -0500
X-MC-Unique: m6xE8JiTMIaZwlzsEo4lGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BAA86D249;
 Wed, 18 Nov 2020 17:06:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E972C6091A;
 Wed, 18 Nov 2020 17:05:55 +0000 (UTC)
Date: Wed, 18 Nov 2020 18:05:52 +0100
From: Andrew Jones <drjones@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v4 2/2] arm64: kvm: Introduce MTE VCPU feature
Message-ID: <20201118170552.cuczyylf34ows5jd@kamzik.brq.redhat.com>
References: <20201026155727.36685-1-steven.price@arm.com>
 <20201026155727.36685-3-steven.price@arm.com>
 <X7P1VLZhBh045tsr@trantor>
 <f34b3d16-8bc7-af9d-c0e0-fb114d2465aa@arm.com>
 <X7VQua7YO4isMFPU@trantor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X7VQua7YO4isMFPU@trantor>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Steven Price <steven.price@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 04:50:01PM +0000, Catalin Marinas wrote:
> On Wed, Nov 18, 2020 at 04:01:20PM +0000, Steven Price wrote:
> > On 17/11/2020 16:07, Catalin Marinas wrote:
> > > On Mon, Oct 26, 2020 at 03:57:27PM +0000, Steven Price wrote:
> > > > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > > > index 19aacc7d64de..38fe25310ca1 100644
> > > > --- a/arch/arm64/kvm/mmu.c
> > > > +++ b/arch/arm64/kvm/mmu.c
> > > > @@ -862,6 +862,26 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> > > >   	if (vma_pagesize == PAGE_SIZE && !force_pte)
> > > >   		vma_pagesize = transparent_hugepage_adjust(memslot, hva,
> > > >   							   &pfn, &fault_ipa);
> > > > +
> > > > +	/*
> > > > +	 * The otherwise redundant test for system_supports_mte() allows the
> > > > +	 * code to be compiled out when CONFIG_ARM64_MTE is not present.
> > > > +	 */
> > > > +	if (system_supports_mte() && kvm->arch.mte_enabled && pfn_valid(pfn)) {
> > > > +		/*
> > > > +		 * VM will be able to see the page's tags, so we must ensure
> > > > +		 * they have been initialised.
> > > > +		 */
> > > > +		struct page *page = pfn_to_page(pfn);
> > > > +		long i, nr_pages = compound_nr(page);
> > > > +
> > > > +		/* if PG_mte_tagged is set, tags have already been initialised */
> > > > +		for (i = 0; i < nr_pages; i++, page++) {
> > > > +			if (!test_and_set_bit(PG_mte_tagged, &page->flags))
> > > > +				mte_clear_page_tags(page_address(page));
> > > > +		}
> > > > +	}
> > > 
> > > If this page was swapped out and mapped back in, where does the
> > > restoring from swap happen?
> > 
> > Restoring from swap happens above this in the call to gfn_to_pfn_prot()
> 
> Looking at the call chain, gfn_to_pfn_prot() ends up with
> get_user_pages() using the current->mm (the VMM) and that does a
> set_pte_at(), presumably restoring the tags. Does this mean that all
> memory mapped by the VMM in user space should have PROT_MTE set?
> Otherwise we don't take the mte_sync_tags() path in set_pte_at() and no
> tags restored from swap (we do save them since when they were mapped,
> PG_mte_tagged was set).
> 
> So I think the code above should be similar to mte_sync_tags(), even
> calling a common function, but I'm not sure where to get the swap pte
> from.
> 
> An alternative is to only enable HCR_EL2.ATA and MTE in guest if the vmm
> mapped the memory with PROT_MTE.

This is a very reasonable alternative. The VMM must be aware of whether
the guest may use MTE anyway. Asking it to map the memory with PROT_MTE
when it wants to offer the guest that option is a reasonable requirement.
If the memory is not mapped as such, then the host kernel shouldn't assume
MTE may be used by the guest, and it should even enforce that it is not
(by not enabling the feature).

Thanks,
drew

> 
> Yet another option is to always call mte_sync_tags() from set_pte_at()
> and defer the pte_tagged() or is_swap_pte() checks to the MTE code.
> 
> -- 
> Catalin
> 


