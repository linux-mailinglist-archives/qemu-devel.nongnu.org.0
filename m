Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F3A3A2669
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:18:20 +0200 (CEST)
Received: from localhost ([::1]:51230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFtL-0008Jm-6K
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lrFgy-00064y-AP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:05:32 -0400
Received: from foss.arm.com ([217.140.110.172]:45522)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lrFgu-0000xt-2n
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:05:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BD75D6E;
 Thu, 10 Jun 2021 01:05:26 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62A4E3F719;
 Thu, 10 Jun 2021 01:05:23 -0700 (PDT)
Subject: Re: [PATCH v14 1/8] arm64: mte: Handle race when synchronising tags
To: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
References: <20210607110816.25762-1-steven.price@arm.com>
 <20210607110816.25762-2-steven.price@arm.com> <875yynz5wp.wl-maz@kernel.org>
 <e65943cb-9643-c973-9626-ebf56723ea14@arm.com> <874ke7z3ng.wl-maz@kernel.org>
 <20210609174117.GA18459@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3e0757db-d93d-8554-4167-1c6853f3ae87@arm.com>
Date: Thu, 10 Jun 2021 09:05:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210609174117.GA18459@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=steven.price@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 18:41, Catalin Marinas wrote:
> On Wed, Jun 09, 2021 at 12:19:31PM +0100, Marc Zyngier wrote:
>> On Wed, 09 Jun 2021 11:51:34 +0100,
>> Steven Price <steven.price@arm.com> wrote:
>>> On 09/06/2021 11:30, Marc Zyngier wrote:
>>>> On Mon, 07 Jun 2021 12:08:09 +0100,
>>>> Steven Price <steven.price@arm.com> wrote:
>>>>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>>>>> index 125a10e413e9..a3583a7fd400 100644
>>>>> --- a/arch/arm64/kernel/mte.c
>>>>> +++ b/arch/arm64/kernel/mte.c
>>>>> @@ -25,6 +25,7 @@
>>>>>  u64 gcr_kernel_excl __ro_after_init;
>>>>>  
>>>>>  static bool report_fault_once = true;
>>>>> +static DEFINE_SPINLOCK(tag_sync_lock);
>>>>>  
>>>>>  #ifdef CONFIG_KASAN_HW_TAGS
>>>>>  /* Whether the MTE asynchronous mode is enabled. */
>>>>> @@ -34,13 +35,22 @@ EXPORT_SYMBOL_GPL(mte_async_mode);
>>>>>  
>>>>>  static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
>>>>>  {
>>>>> +	unsigned long flags;
>>>>>  	pte_t old_pte = READ_ONCE(*ptep);
>>>>>  
>>>>> +	spin_lock_irqsave(&tag_sync_lock, flags);
>>>>
>>>> having though a bit more about this after an offline discussion with
>>>> Catalin: why can't this lock be made per mm? We can't really share
>>>> tags across processes anyway, so this is limited to threads from the
>>>> same process.
>>>
>>> Currently there's nothing stopping processes sharing tags (mmap(...,
>>> PROT_MTE, MAP_SHARED)) - I agree making use of this is tricky and it
>>> would have been nice if this had just been prevented from the
>>> beginning.
>>
>> I don't think it should be prevented. I think it should be made clear
>> that it is unreliable and that it will result in tag corruption.
>>
>>> Given the above, clearly the lock can't be per mm and robust.
>>
>> I don't think we need to make it robust. The architecture actively
>> prevents sharing if the tags are also shared, just like we can't
>> really expect the VMM to share tags with the guest.
> 
> The architecture does not prevent MTE tag sharing (if that's what you
> meant). The tags are just an additional metadata stored in physical
> memory. It's not associated with the VA (as in the CHERI-style
> capability tags), only checked against the logical tag in a pointer. If
> the architecture prevented MAP_SHARED, we would have prevented PROT_MTE
> on them (well, it's not too late to do this ;)).
> 
> I went with Steven a few times through this exercise, though I tend to
> forget it quickly after. The use-case we had in mind when deciding to
> allow MTE on shared mappings is something like:
> 
> 	int fd = memfd_create("jitted-code", MFD_ALLOW_SEALING);
> 	ftruncate(fd, size);
> 
> 	void* rw_mapping = mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> 	void* rx_mapping = mmap(NULL, size, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
> 
> 	close(fd);
> 
> The above is within the same mm but you might as well have a fork and
> the rx mapping in a child process. Any of the mappings may have
> PROT_MTE from the start or set later with mprotect(), though it's
> probably the rw one only.
> 
> The race we have is in set_pte_at() and the equivalent KVM setting for
> stage 2 (in any combination of these). To detect a page that was not
> previously tagged (first time mapped, remapped with new attributes), we
> have a test like this via set_pte_at():
> 
> 	if (!test_bit(PG_mte_tagged, &page->flags)) {
> 		mte_clear_page_tags(page);
> 		set_bit(PG_mte_tagged, &page->flags);
> 	}
> 
> Calling the above concurrently on a page may cause some tag loss in the
> absence of any locking. Note that it only matters if one of the mappings
> is writable (to write tags), so this excludes CoW (fork, KSM).
> 
> For stage 1, I think almost all cases that end up in set_pte_at() also
> have the page->lock held and the ptl. The exception is mprotect() which
> doesn't bother to look up each page and lock it, it just takes the ptl
> lock. Within the same mm, mprotect() also takes the mmap_lock as a
> writer, so it's all fine. The race is between two mms, one doing an
> mprotect(PROT_MTE) with the page already mapped in its address space and
> the other taking a fault and mapping the page via set_pte_at(). Two
> faults in two mms again are fine because of the page lock.
> 
> For stage 2, the race between the VMM doing an mprotect() and the VM
> going via user_mem_abort() is fine because the former calls
> mmap_write_lock() while the latter mmap_read_lock(). So, as in stage 1,
> the problem in stage 2 is for a MAP_SHARED region that another process
> (maybe spawned by the VMM) calls mprotect(PROT_MTE).
> 
> There is another case of MAP_SHARED in the VMM that does not involve
> mprotect(). The shared page is mapped on fault in VMM2, initially mapped
> as PROT_MTE while VMM1 handles a user_mem_abort() -> hva_to_pfn(). If in
> VMM1 the page was not mapped with PROT_MTE but the pte is accessible,
> get_user_pages_fast() won't touch the VMM1 pte, so we have the race
> between user_mem_abort() in VMM1 and set_pte_at() in VMM2.
> 
> So, AFAICT, MAP_SHARED between two different mms is the only problem
> (both for stage 1 and stage 2), hence the big lock that Steven
> introduced. I don't like the lock either but we couldn't come up with a
> better solution.
> 
> I'm happy to document that MAP_SHARED may lose tags but we need to be
> more precise than that as people may still want to use MTE with shared
> memory as per my first example (otherwise we can block it upfront easily
> in arch_validate_flags()). Also the exact behaviour in a MAP_SHARED case
> may be quite fragile.
> 
> An alternative is to set PG_mte_tagged before we even end up in a
> set_pte_at() or user_mem_abort() and that's what patch 2 does here for
> stage 1. There are other options like finer grained locking via another
> page flag (well, inventing a new page lock that doesn't sleep), maybe an
> array of locks indexed by a hash of the pfn to mitigate the big lock
> (multiple big locks ;)).
> 
> With patch 2 in this series (and an equivalent one in Peter's
> optimisation series), PG_mte_tagged is set on page allocation in the
> majority of the cases, so we'd very rarely get to the big lock path. We
> could do a similar trick with a new vma flag which is set by kvm when a
> slot is added. Subsequent __alloc_zeroed_user_highpage() just set
> PG_mte_tagged. Note that for MAP_SHARED, we'd still end up on the big
> lock path (both for stage 1 and stage 2) since they don't use
> __alloc_zeroed_user_highpage().
> 
> Another big hammer approach is to scrap PG_mte_tagged altogether. That's
> what I had in some early versions before Steven added swap support. Any
> page is considered tagged, we always zero the tags in clear_page() and
> copy tags in copy_page() (is DC GZVA as fast as DC ZVA? What's the
> overhead of copying tags? I don't have access to hardware to benchmark).
> The page comparison for KSM would also need to compare the tags (I have
> such patch already).
> 
> Other suggestions are welcomed, including banning MAP_SHARED with
> PROT_MTE.

The finer grained locking could also be done using a table of spin_locks
and hashing the struct page pointer to choose a lock. This is what
page_waitqueue() does - but unlike the existing mechanism we need
spinlocks not wait queues.

>>>> I'd also like it to be documented that page sharing can only reliably
>>>> work with tagging if only one of the mappings is using tags.
>>>
>>> I'm not entirely clear whether you mean "can only reliably work" to be
>>> "is practically impossible to coordinate tag values", or whether you are
>>> proposing to (purposefully) introduce the race with a per-mm lock? (and
>>> document it).
>>
>> The latter. You can obviously communicate your tags to another task,
>> but this should come with attached restrictions (mlock?).
> 
> No, it wouldn't, you may confuse them with CHERI tags.
> 
>>> I guess we could have a per-mm lock and handle the race if user space
>>> screws up with the outcome being lost tags (double clear).
>>>
>>> But it feels to me like it could come back to bite in the future since
>>> VM_SHARED|VM_MTE will almost always work and I fear someone will start
>>> using it since it's permitted by the kernel.
>>
>> I'm really worried that performance is going to suck even on a small
>> system, and this global lock will be heavily contended, even without
>> considering KVM.
> 
> I agree, as it currently stands, enabling MTE in the guest will always
> serialise user_mem_abort() through a big lock shared by all VMs.
> 

We only serialise in the case where PG_mte_tagged isn't set. Admittedly
this is likely to be VM startup which I know tends to be an important
use case. One other option there would be to provide a mechanism to the
VMM to proactively clear the tags (e.g. a new VM_MTE_INIT flag which
causes the PG_mte_tagged bit to be set but doesn't affect user space's
PTEs).

The problem I've got is without real hardware to benchmark on it's
impossible to know how big of a performance problem this is and
therefore which of the available options (if any) is appropriate. Some
like the "big hammer" of scrapping PG_mte_tagged could hit the
performance of non-MTE paths - but equally might not have any affect and
would simplify the code.

My belief is that this series is now at the stage where it is
functionally correct and it doesn't impact the performance when MTE
isn't in use, so no impact to existing systems or MTE-enabled systems
where user space/VMs are not using MTE. We also have a number of ideas
to investigate if/when we see performance problems with the MTE use
cases. I'm not sure what else we can do until hardware for benchmarking
is readily available.

Steve

