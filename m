Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CA3A1182
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:52:35 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqvp4-0000gH-P1
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.price@arm.com>)
 id 1lqvoE-0008I5-G6
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:51:42 -0400
Received: from foss.arm.com ([217.140.110.172]:48756)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <steven.price@arm.com>) id 1lqvoB-0002DA-OG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:51:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04FCC11B3;
 Wed,  9 Jun 2021 03:51:38 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5727F3F694;
 Wed,  9 Jun 2021 03:51:35 -0700 (PDT)
Subject: Re: [PATCH v14 1/8] arm64: mte: Handle race when synchronising tags
To: Marc Zyngier <maz@kernel.org>
References: <20210607110816.25762-1-steven.price@arm.com>
 <20210607110816.25762-2-steven.price@arm.com> <875yynz5wp.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <e65943cb-9643-c973-9626-ebf56723ea14@arm.com>
Date: Wed, 9 Jun 2021 11:51:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yynz5wp.wl-maz@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/06/2021 11:30, Marc Zyngier wrote:
> On Mon, 07 Jun 2021 12:08:09 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> mte_sync_tags() used test_and_set_bit() to set the PG_mte_tagged flag
>> before restoring/zeroing the MTE tags. However if another thread were to
>> race and attempt to sync the tags on the same page before the first
>> thread had completed restoring/zeroing then it would see the flag is
>> already set and continue without waiting. This would potentially expose
>> the previous contents of the tags to user space, and cause any updates
>> that user space makes before the restoring/zeroing has completed to
>> potentially be lost.
>>
>> Since this code is run from atomic contexts we can't just lock the page
>> during the process. Instead implement a new (global) spinlock to protect
>> the mte_sync_page_tags() function.
>>
>> Fixes: 34bfeea4a9e9 ("arm64: mte: Clear the tags when a page is mapped in user-space with PROT_MTE")
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/arm64/kernel/mte.c | 20 +++++++++++++++++---
>>  1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
>> index 125a10e413e9..a3583a7fd400 100644
>> --- a/arch/arm64/kernel/mte.c
>> +++ b/arch/arm64/kernel/mte.c
>> @@ -25,6 +25,7 @@
>>  u64 gcr_kernel_excl __ro_after_init;
>>  
>>  static bool report_fault_once = true;
>> +static DEFINE_SPINLOCK(tag_sync_lock);
>>  
>>  #ifdef CONFIG_KASAN_HW_TAGS
>>  /* Whether the MTE asynchronous mode is enabled. */
>> @@ -34,13 +35,22 @@ EXPORT_SYMBOL_GPL(mte_async_mode);
>>  
>>  static void mte_sync_page_tags(struct page *page, pte_t *ptep, bool check_swap)
>>  {
>> +	unsigned long flags;
>>  	pte_t old_pte = READ_ONCE(*ptep);
>>  
>> +	spin_lock_irqsave(&tag_sync_lock, flags);
> 
> having though a bit more about this after an offline discussion with
> Catalin: why can't this lock be made per mm? We can't really share
> tags across processes anyway, so this is limited to threads from the
> same process.

Currently there's nothing stopping processes sharing tags (mmap(...,
PROT_MTE, MAP_SHARED)) - I agree making use of this is tricky and it
would have been nice if this had just been prevented from the beginning.

Given the above, clearly the lock can't be per mm and robust.

> I'd also like it to be documented that page sharing can only reliably
> work with tagging if only one of the mappings is using tags.

I'm not entirely clear whether you mean "can only reliably work" to be
"is practically impossible to coordinate tag values", or whether you are
proposing to (purposefully) introduce the race with a per-mm lock? (and
document it).

I guess we could have a per-mm lock and handle the race if user space
screws up with the outcome being lost tags (double clear).

But it feels to me like it could come back to bite in the future since
VM_SHARED|VM_MTE will almost always work and I fear someone will start
using it since it's permitted by the kernel.

Steve

