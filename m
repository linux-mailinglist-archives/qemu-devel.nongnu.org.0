Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73F34E52F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:14:39 +0200 (CEST)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBOQ-0004KC-Lu
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lRBNF-0003ZH-6X
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:13:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:50812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lRBND-0001lO-0i
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:13:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67A2D61864;
 Tue, 30 Mar 2021 10:13:17 +0000 (UTC)
Date: Tue, 30 Mar 2021 11:13:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v10 1/6] arm64: mte: Sync tags for pages where PTE is
 untagged
Message-ID: <20210330101314.GC18075@arm.com>
References: <20210312151902.17853-1-steven.price@arm.com>
 <20210312151902.17853-2-steven.price@arm.com>
 <20210326185653.GG5126@arm.com>
 <21842e4d-7935-077c-3d6f-fced89b7f2bb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21842e4d-7935-077c-3d6f-fced89b7f2bb@arm.com>
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

On Mon, Mar 29, 2021 at 04:55:29PM +0100, Steven Price wrote:
> On 26/03/2021 18:56, Catalin Marinas wrote:
> > On Fri, Mar 12, 2021 at 03:18:57PM +0000, Steven Price wrote:
> > > A KVM guest could store tags in a page even if the VMM hasn't mapped
> > > the page with PROT_MTE. So when restoring pages from swap we will
> > > need to check to see if there are any saved tags even if !pte_tagged().
> > > 
> > > However don't check pages which are !pte_valid_user() as these will
> > > not have been swapped out.
> > > 
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > > ---
> > >   arch/arm64/include/asm/pgtable.h |  2 +-
> > >   arch/arm64/kernel/mte.c          | 16 ++++++++++++----
> > >   2 files changed, 13 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > > index e17b96d0e4b5..84166625c989 100644
> > > --- a/arch/arm64/include/asm/pgtable.h
> > > +++ b/arch/arm64/include/asm/pgtable.h
> > > @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> > >   		__sync_icache_dcache(pte);
> > >   	if (system_supports_mte() &&
> > > -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
> > > +	    pte_present(pte) && pte_valid_user(pte) && !pte_special(pte))
> > >   		mte_sync_tags(ptep, pte);
> > 
> > With the EPAN patches queued in for-next/epan, pte_valid_user()
> > disappeared as its semantics weren't very clear.
> 
> Thanks for pointing that out.
> 
> > So this relies on the set_pte_at() being done on the VMM address space.
> > I wonder, if the VMM did an mprotect(PROT_NONE), can the VM still access
> > it via stage 2? If yes, the pte_valid_user() test wouldn't work. We need
> > something like pte_present() && addr <= user_addr_max().
> 
> AFAIUI the stage 2 matches the VMM's address space (for the subset that has
> memslots). So mprotect(PROT_NONE) would cause the stage 2 mapping to be
> invalidated and a subsequent fault would exit to the VMM to sort out. This
> sort of thing is done for the lazy migration use case (i.e. pages are
> fetched as the VM tries to access them).

There's also the protected KVM case which IIUC wouldn't provide any
mapping of the guest memory to the host (or maybe the host still thinks
it's there but cannot access it without a Stage 2 fault). At least in
this case it wouldn't swap pages out and it would be the responsibility
of the EL2 code to clear the tags when giving pages to the guest
(user_mem_abort() must not touch the page).

So basically we either have a valid, accessible mapping in the VMM and
we can handle the tags via set_pte_at() or we leave it to whatever is
running at EL2 in the pKVM case.

I don't remember whether we had a clear conclusion in the past: have we
ruled out requiring the VMM to map the guest memory with PROT_MTE
entirely? IIRC a potential problem was the VMM using MTE itself and
having to disable it when accessing the guest memory.

Another potential issue (I haven't got my head around it yet) is a race
in mte_sync_tags() as we now defer the PG_mte_tagged bit setting until
after the tags had been restored. Can we have the same page mapped by
two ptes, each attempting to restore it from swap and one gets it first
and starts modifying it? Given that we set the actual pte after setting
PG_mte_tagged, it's probably alright but I think we miss some barriers.

Also, if a page is not a swap one, we currently clear the tags if mapped
as pte_tagged() (prior to this patch). We'd need something similar when
mapping it in the guest so that we don't leak tags but to avoid any page
ending up with PG_mte_tagged, I think you moved the tag clearing to
user_mem_abort() in the KVM code. I presume set_pte_at() in the VMM
would be called first and then set in Stage 2.

> > BTW, ignoring virtualisation, can we ever bring a page in from swap on a
> > PROT_NONE mapping (say fault-around)? It's not too bad if we keep the
> > metadata around for when the pte becomes accessible but I suspect we
> > remove it if the page is removed from swap.
> 
> There are two stages of bringing data from swap. First is populating the
> swap cache by doing the physical read from swap. The second is actually
> restoring the page table entries.

When is the page metadata removed? I want to make sure we don't drop it
for some pte attributes.

-- 
Catalin

