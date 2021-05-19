Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BEF389504
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:08:04 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljQby-0001Pv-NN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljQaM-0000QT-LH
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:06:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:50584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljQaK-0001NP-1V
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:06:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D76D611BF;
 Wed, 19 May 2021 18:06:13 +0000 (UTC)
Date: Wed, 19 May 2021 19:06:10 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 3/8] arm64: mte: Sync tags for pages where PTE is
 untagged
Message-ID: <20210519180610.GE21619@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-4-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517123239.8025-4-steven.price@arm.com>
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

On Mon, May 17, 2021 at 01:32:34PM +0100, Steven Price wrote:
> A KVM guest could store tags in a page even if the VMM hasn't mapped
> the page with PROT_MTE. So when restoring pages from swap we will
> need to check to see if there are any saved tags even if !pte_tagged().
> 
> However don't check pages for which pte_access_permitted() returns false
> as these will not have been swapped out.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h |  9 +++++++--
>  arch/arm64/kernel/mte.c          | 16 ++++++++++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0b10204e72fc..275178a810c1 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -314,8 +314,13 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
>  	if (pte_present(pte) && pte_user_exec(pte) && !pte_special(pte))
>  		__sync_icache_dcache(pte);
>  
> -	if (system_supports_mte() &&
> -	    pte_present(pte) && pte_tagged(pte) && !pte_special(pte))
> +	/*
> +	 * If the PTE would provide user space access to the tags associated
> +	 * with it then ensure that the MTE tags are synchronised.  Exec-only
> +	 * mappings don't expose tags (instruction fetches don't check tags).
> +	 */
> +	if (system_supports_mte() && pte_present(pte) &&
> +	    pte_access_permitted(pte, false) && !pte_special(pte))
>  		mte_sync_tags(ptep, pte);

Looking at the mte_sync_page_tags() logic, we bail out early if it's the
old pte is not a swap one and the new pte is not tagged. So we only need
to call mte_sync_tags() if it's a tagged new pte or the old one is swap.
What about changing the set_pte_at() test to:

	if (system_supports_mte() && pte_present(pte) && !pte_special(pte) &&
	    (pte_tagged(pte) || is_swap_pte(READ_ONCE(*ptep))))
		mte_sync_tags(ptep, pte);

We can even change mte_sync_tags() to take the old pte directly:

	if (system_supports_mte() && pte_present(pte) && !pte_special(pte)) {
		pte_t old_pte = READ_ONCE(*ptep);
		if (pte_tagged(pte) || is_swap_pte(old_pte))
			mte_sync_tags(old_pte, pte);
	}

It would save a function call in most cases where the page is not
tagged.

-- 
Catalin

