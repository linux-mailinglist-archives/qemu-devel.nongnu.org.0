Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE8537971D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 20:39:38 +0200 (CEST)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgAob-0003lt-CO
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 14:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lgAkc-0002RB-Cf
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:35:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lgAkO-0003GF-5m
 for qemu-devel@nongnu.org; Mon, 10 May 2021 14:35:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06E6C61424;
 Mon, 10 May 2021 18:35:09 +0000 (UTC)
Date: Mon, 10 May 2021 19:35:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v11 2/6] arm64: kvm: Introduce MTE VM feature
Message-ID: <20210510183506.GA10910@arm.com>
References: <20210416154309.22129-1-steven.price@arm.com>
 <20210416154309.22129-3-steven.price@arm.com>
 <20210428170705.GB4022@arm.com>
 <c3293d47-a5f2-ea4a-6730-f5cae26d8a7e@arm.com>
 <YJGHApOCXl811VK3@arm.com>
 <329286e8-a8f3-ea1a-1802-58813255a4a5@arm.com>
 <20210507182538.GF26528@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210507182538.GF26528@arm.com>
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

On Fri, May 07, 2021 at 07:25:39PM +0100, Catalin Marinas wrote:
> On Thu, May 06, 2021 at 05:15:25PM +0100, Steven Price wrote:
> > On 04/05/2021 18:40, Catalin Marinas wrote:
> > > On Thu, Apr 29, 2021 at 05:06:41PM +0100, Steven Price wrote:
> > > > Given the changes to set_pte_at() which means that tags are restored from
> > > > swap even if !PROT_MTE, the only race I can see remaining is the creation of
> > > > new PROT_MTE mappings. As you mention an attempt to change mappings in the
> > > > VMM memory space should involve a mmu notifier call which I think serialises
> > > > this. So the remaining issue is doing this in a separate address space.
> > > > 
> > > > So I guess the potential problem is:
> > > > 
> > > >   * allocate memory MAP_SHARED but !PROT_MTE
> > > >   * fork()
> > > >   * VM causes a fault in parent address space
> > > >   * child does a mprotect(PROT_MTE)
> > > > 
> > > > With the last two potentially racing. Sadly I can't see a good way of
> > > > handling that.
> > > 
> > > Ah, the mmap lock doesn't help as they are different processes
> > > (mprotect() acquires it as a writer).
> > > 
> > > I wonder whether this is racy even in the absence of KVM. If both parent
> > > and child do an mprotect(PROT_MTE), one of them may be reading stale
> > > tags for a brief period.
> > > 
> > > Maybe we should revisit whether shared MTE pages are of any use, though
> > > it's an ABI change (not bad if no-one is relying on this). However...
[...]
> > > Thinking about this, we have a similar problem with the PG_dcache_clean
> > > and two processes doing mprotect(PROT_EXEC). One of them could see the
> > > flag set and skip the I-cache maintenance while the other executes
> > > stale instructions. change_pte_range() could acquire the page lock if
> > > the page is VM_SHARED (my preferred core mm fix). It doesn't immediately
> > > solve the MTE/KVM case but we could at least take the page lock via
> > > user_mem_abort().
[...]
> > This is the real issue I see - the race in PROT_MTE case is either a data
> > leak (syncing after setting the bit) or data loss (syncing before setting
> > the bit).
[...]
> > But without serialising through a spinlock (in mte_sync_tags()) I haven't
> > been able to come up with any way of closing the race. But with the change
> > to set_pte_at() to call mte_sync_tags() even if the PTE isn't PROT_MTE that
> > is likely to seriously hurt performance.
> 
> Yeah. We could add another page flag as a lock though I think it should
> be the core code that prevents the race.
> 
> If we are to do it in the arch code, maybe easier with a custom
> ptep_modify_prot_start/end() where we check if it's VM_SHARED and
> VM_MTE, take a (big) lock.

I think in the general case we don't even need VM_SHARED. For example,
we have two processes mapping a file, read-only. An mprotect() call in
both processes will race on the page->flags via the corresponding
set_pte_at(). I think an mprotect() with a page fault in different
processes can also race.

The PROT_EXEC case can be easily fixed, as you said already. The
PROT_MTE with MAP_PRIVATE I think can be made safe by a similar
approach: test flag, clear tags, set flag. A subsequent write would
trigger a CoW, so different page anyway.

Anyway, I don't think ptep_modify_prot_start/end would buy us much, it
probably makes the code even harder to read.

> In the core code, something like below (well, a partial hack, not tested
> and it doesn't handle huge pages but just to give an idea):
> 
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 94188df1ee55..6ba96ff141a6 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -114,6 +113,10 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>  			}
>  
>  			oldpte = ptep_modify_prot_start(vma, addr, pte);
> +			if (vma->vm_flags & VM_SHARED) {
> +				page = vm_normal_page(vma, addr, oldpte);
> +				lock_page(page);
> +			}
>  			ptent = pte_modify(oldpte, newprot);
>  			if (preserve_write)
>  				ptent = pte_mk_savedwrite(ptent);
> @@ -138,6 +141,8 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>  				ptent = pte_mkwrite(ptent);
>  			}
>  			ptep_modify_prot_commit(vma, addr, pte, oldpte, ptent);
> +			if (page)
> +				unlock_page(page);
>  			pages++;
>  		} else if (is_swap_pte(oldpte)) {
>  			swp_entry_t entry = pte_to_swp_entry(oldpte);

That's bogus: lock_page() might sleep but this whole code sequence is
under the ptl spinlock. There are some lock_page_* variants but that
would involve either a busy loop on this path or some bailing out,
waiting for a release.

Options:

1. Change the mte_sync_tags() code path to set the flag after clearing
   and avoid reading stale tags. We document that mprotect() on
   MAP_SHARED may lead to tag loss. Maybe we can intercept this in the
   arch code and return an error.

2. Figure out some other locking in the core code. However, if
   mprotect() in one process can race with a handle_pte_fault() in
   another, on the same shared mapping, it's not trivial.
   filemap_map_pages() would take the page lock before calling
   do_set_pte(), so mprotect() would need the same page lock.

3. Use another PG_arch_3 bit as a lock to spin on in the arch code (i.e.
   set it around the other PG_arch_* bit setting).

I ran out of ideas.

-- 
Catalin

