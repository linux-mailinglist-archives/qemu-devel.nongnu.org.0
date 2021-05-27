Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C00392F8B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 15:25:55 +0200 (CEST)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmG1I-0001O5-G7
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 09:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lmFlA-0001TM-5p
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:09:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:55250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lmFkz-0005Em-1W
 for qemu-devel@nongnu.org; Thu, 27 May 2021 09:09:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 107246128B;
 Thu, 27 May 2021 13:08:50 +0000 (UTC)
Date: Thu, 27 May 2021 14:08:48 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
Message-ID: <20210527130848.GA8661@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-8-steven.price@arm.com>
 <20210520120556.GC12251@arm.com>
 <dd5ab3a0-5a74-b145-2485-d6d871be945b@arm.com>
 <20210520172713.GF12251@arm.com>
 <5eec330f-63c0-2af8-70f8-ba9b643e2558@arm.com>
 <20210524181129.GI14645@arm.com>
 <58345eca-6e5f-0faa-e47d-e9149d73f6c5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58345eca-6e5f-0faa-e47d-e9149d73f6c5@arm.com>
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

On Thu, May 27, 2021 at 08:50:30AM +0100, Steven Price wrote:
> On 24/05/2021 19:11, Catalin Marinas wrote:
> > I had some (random) thoughts on how to make things simpler, maybe. I
> > think most of these races would have been solved if we required PROT_MTE
> > in the VMM but this has an impact on the VMM if it wants to use MTE
> > itself. If such requirement was in place, all KVM needed to do is check
> > PG_mte_tagged.
> > 
> > So what we actually need is a set_pte_at() in the VMM to clear the tags
> > and set PG_mte_tagged. Currently, we only do this if the memory type is
> > tagged (PROT_MTE) but it's not strictly necessary.
> > 
> > As an optimisation for normal programs, we don't want to do this all the
> > time but the visible behaviour wouldn't change (well, maybe for ptrace
> > slightly). However, it doesn't mean we couldn't for a VMM, with an
> > opt-in via prctl(). This would add a MMCF_MTE_TAG_INIT bit (couldn't
> > think of a better name) to mm_context_t.flags and set_pte_at() would
> > behave as if the pte was tagged without actually mapping the memory in
> > user space as tagged (protection flags not changed). Pages that don't
> > support tagging are still safe, just some unnecessary ignored tag
> > writes. This would need to be set before the mmap() for the guest
> > memory.
> > 
> > If we want finer-grained control we'd have to store this information in
> > the vma flags, in addition to VM_MTE (e.g. VM_MTE_TAG_INIT) but without
> > affecting the actual memory type. The easiest would be another pte bit,
> > though we are short on them. A more intrusive (not too bad) approach is
> > to introduce a set_pte_at_vma() and read the flags directly in the arch
> > code. In most places where set_pte_at() is called on a user mm, the vma
> > is also available.
> > 
> > Anyway, I'm not saying we go this route, just thinking out loud, get
> > some opinions.
> 
> Does get_user_pages() actually end up calling set_pte_at() normally?

Not always, at least as how it's called from hva_to_pfn(). My reading of
the get_user_page_fast_only() is that it doesn't touch the pte, just
walks the page tables and pins the page. Of course, it expects a valid
pte to have been set in the VMM already, otherwise it doesn't pin any
page and the caller falls back to the slow path.

The slow path, get_user_pages_unlocked(), passes FOLL_TOUCH and
set_pte_at() will be called either in follow_pfn_pte() if it was valid
or via faultin_page() -> handle_mm_fault().

> If not then on the normal user_mem_abort() route although we can
> easily check VM_MTE_TAG_INIT there's no obvious place to hook in to
> ensure that the pages actually allocated have the PG_mte_tagged flag.

I don't think it helps if we checked such vma flag in user_mem_abort(),
we'd still have the race with set_pte_at() on the page flags. What I was
trying to avoid is touching the page flags in too many places, so
deferring this always to set_pte_at() in the VMM.

> I'm also not sure how well this would work with the MMU notifiers path
> in KVM. With MMU notifiers (i.e. the VMM replacing a page in the
> memslot) there's not even an obvious hook to enforce the VMA flag. So I
> think we'd end up with something like the sanitise_mte_tags() function
> to at least check that the PG_mte_tagged flag is set on the pages
> (assuming that the trigger for the MMU notifier has done the
> corresponding set_pte_at()). Admittedly this might close the current
> race documented there.

If we kept this check to the VMM set_pte_at(), I think we can ignore the
notifiers.

> It also feels wrong to me to tie this to a process with prctl(), it
> seems much more normal to implement this as a new mprotect() flag as
> this is really a memory property not a process property. And I think
> we'll find some scary corner cases if we try to associate everything
> back to a process - although I can't instantly think of anything that
> will actually break.

I agree, tying it to the process looks wrong, only that it's less
intrusive. I don't think it would break anything, only potential
performance regression. A process would still need to pass PROT_MTE to
be able to get tag checking. That's basically what I had in an early MTE
implementation with clear_user_page() always zeroing the tags.

I agree with you that a vma flag would be better but it's more
complicated without an additional pte bit. We could also miss some
updates as mprotect() for example checks for pte_same() before calling
set_pte_at() (it would need to check the updated vma flags).

I'll review the latest series but I'm tempted to move the logic in
santise_mte_tags() to mte.c and take the big lock in there if
PG_mte_tagged is not already set. If we hit performance issues, we can
optimise this later to have the page flag set already on creation (new
PROT flag, prctl etc.).

-- 
Catalin

