Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E2035870E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 16:21:38 +0200 (CEST)
Received: from localhost ([::1]:38338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUVXN-000099-KN
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 10:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lUVUx-0007L0-Vi
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:19:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lUVUt-0006UB-Al
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 10:19:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B87866024A;
 Thu,  8 Apr 2021 14:18:57 +0000 (UTC)
Date: Thu, 8 Apr 2021 15:18:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v10 2/6] arm64: kvm: Introduce MTE VM feature
Message-ID: <20210408141853.GA7676@arm.com>
References: <e0b88560-34e1-dcc4-aaa7-9a7a5b771824@arm.com>
 <20210330103013.GD18075@arm.com>
 <8977120b-841d-4882-2472-6e403bc9c797@redhat.com>
 <20210331092109.GA21921@arm.com>
 <d545a051-a02a-4c3a-0afe-66612839ba32@redhat.com>
 <86a968c8-7a0e-44a4-28c3-bac62c2b7d65@arm.com>
 <20210331184311.GA10737@arm.com>
 <e2612bd8-b356-a9cd-cfdf-26f4aa813578@arm.com>
 <20210407151458.GC21451@arm.com>
 <5e5bf772-1e4d-ca59-a9d8-058a72dfad4f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e5bf772-1e4d-ca59-a9d8-058a72dfad4f@arm.com>
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Haibo Xu <Haibo.Xu@arm.com>, David Hildenbrand <david@redhat.com>,
 Marc Zyngier <maz@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 Thomas Gleixner <tglx@linutronix.de>,
 Julien Thierry <julien.thierry.kdev@gmail.com>, Will Deacon <will@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, linux-kernel@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 07, 2021 at 04:52:54PM +0100, Steven Price wrote:
> On 07/04/2021 16:14, Catalin Marinas wrote:
> > On Wed, Apr 07, 2021 at 11:20:18AM +0100, Steven Price wrote:
> > > On 31/03/2021 19:43, Catalin Marinas wrote:
> > > > When a slot is added by the VMM, if it asked for MTE in guest (I guess
> > > > that's an opt-in by the VMM, haven't checked the other patches), can we
> > > > reject it if it's is going to be mapped as Normal Cacheable but it is a
> > > > ZONE_DEVICE (i.e. !kvm_is_device_pfn() + one of David's suggestions to
> > > > check for ZONE_DEVICE)? This way we don't need to do more expensive
> > > > checks in set_pte_at().
> > > 
> > > The problem is that KVM allows the VMM to change the memory backing a slot
> > > while the guest is running. This is obviously useful for the likes of
> > > migration, but ultimately means that even if you were to do checks at the
> > > time of slot creation, you would need to repeat the checks at set_pte_at()
> > > time to ensure a mischievous VMM didn't swap the page for a problematic one.
> > 
> > Does changing the slot require some KVM API call? Can we intercept it
> > and do the checks there?
> 
> As David has already replied - KVM uses MMU notifiers, so there's not really
> a good place to intercept this before the fault.
> 
> > Maybe a better alternative for the time being is to add a new
> > kvm_is_zone_device_pfn() and force KVM_PGTABLE_PROT_DEVICE if it returns
> > true _and_ the VMM asked for MTE in guest. We can then only set
> > PG_mte_tagged if !device.
> 
> KVM already has a kvm_is_device_pfn(), and yes I agree restricting the MTE
> checks to only !kvm_is_device_pfn() makes sense (I have the fix in my branch
> locally).

Indeed, you can skip it if kvm_is_device_pfn(). In addition, with MTE,
I'd also mark a pfn as 'device' in user_mem_abort() if
pfn_to_online_page() is NULL as we don't want to map it as Cacheable in
Stage 2. It's unlikely that we'll trip over this path but just in case.

(can we have a ZONE_DEVICE _online_ pfn or by definition they are
considered offline?)

> > BTW, after a page is restored from swap, how long do we keep the
> > metadata around? I think we can delete it as soon as it was restored and
> > PG_mte_tagged was set. Currently it looks like we only do this when the
> > actual page was freed or swapoff. I haven't convinced myself that it's
> > safe to do this for swapoff unless it guarantees that all the ptes
> > sharing a page have been restored.
> 
> My initial thought was to free the metadata immediately. However it turns
> out that the following sequence can happen:
> 
>  1. Swap out a page
>  2. Swap the page in *read only*
>  3. Discard the page
>  4. Swap the page in again
> 
> So there's no writing of the swap data again before (3). This works nicely
> with a swap device because after writing a page it stays there forever, so
> if you know it hasn't been modified it's pointless rewriting it. Sadly it's
> not quite so ideal with the MTE tags which are currently kept in RAM.

I missed this scenario. So we need to keep it around as long as the
corresponding swap storage is still valid.

-- 
Catalin

