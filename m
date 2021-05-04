Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E3372D25
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:41:03 +0200 (CEST)
Received: from localhost ([::1]:54618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxAU-0006g9-Id
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ldwze-0004Rh-P2
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:29:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ldwzc-0001vM-NK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:29:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BDA060FDC;
 Tue,  4 May 2021 15:29:42 +0000 (UTC)
Date: Tue, 4 May 2021 16:29:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v11 1/6] arm64: mte: Sync tags for pages where PTE is
 untagged
Message-ID: <20210504152938.GC8078@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-2-steven.price@arm.com>
 <20210427174357.GA17872@arm.com>
 <0ab0017c-1eaf-201e-587f-101e03da6b80@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab0017c-1eaf-201e-587f-101e03da6b80@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Thu, Apr 29, 2021 at 05:06:05PM +0100, Steven Price wrote:
> On 27/04/2021 18:43, Catalin Marinas wrote:
> > On Fri, Apr 16, 2021 at 04:43:04PM +0100, Steven Price wrote:
> > > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > > index e17b96d0e4b5..cf4b52a33b3c 100644
> > > --- a/arch/arm64/include/asm/pgtable.h
> > > +++ b/arch/arm64/include/asm/pgtable.h
> > > @@ -312,7 +312,7 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
> > >   		__sync_icache_dcache(pte);
> > >   	if (system_supports_mte() &&
> > > -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
> > > +	    pte_present(pte) && (pte_val(pte) & PTE_USER) && !pte_special(pte))
> > 
> > I would add a pte_user() macro here or, if we restore the tags only when
> > the page is readable, use pte_access_permitted(pte, false). Also add a
> > comment why we do this.
> 
> pte_access_permitted() looks like it describes what we want (user space can
> access the memory). I'll add the following comment:
> 
>  /*
>   * If the PTE would provide user space will access to the tags

I think drop "will".

>   * associated with it then ensure that the MTE tags are synchronised.
>   * Exec-only mappings don't expose tags (instruction fetches don't
>   * check tags).
>   */

Sounds fine.

> > There's also the pte_user_exec() case which may not have the PTE_USER
> > set (exec-only permission) but I don't think it matters. We don't do tag
> > checking on instruction fetches, so if the user adds a PROT_READ to it,
> > it would go through set_pte_at() again. I'm not sure KVM does anything
> > special with exec-only mappings at stage 2, I suspect they won't be
> > accessible by the guest (but needs checking).
> 
> It comes down to the behaviour of get_user_pages(). AFAICT that will fail if
> the memory is exec-only, so no stage 2 mapping will be created. Which of
> course means the guest can't do anything with that memory. That certainly
> seems like the only sane behaviour even without MTE.

That's my understanding as well. The get_user_pages_fast() path uses
pte_access_permitted() and should return false. The slower
get_user_pages() relies on checking the vma flags and it checks for
VM_READ.

-- 
Catalin

