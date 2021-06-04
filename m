Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C950C39BA9F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:06:41 +0200 (CEST)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpATA-0006M9-Tx
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lpASS-0005hT-KF
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:05:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lpASN-00017x-Bf
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:05:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 148D4613FF;
 Fri,  4 Jun 2021 14:05:46 +0000 (UTC)
Date: Fri, 4 Jun 2021 15:05:44 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v13 4/8] KVM: arm64: Introduce MTE VM feature
Message-ID: <20210604140544.GF31173@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-5-steven.price@arm.com>
 <20210603160031.GE20338@arm.com>
 <a0810f3b-4f13-e8b5-7057-a9de1201887a@arm.com>
 <20210604113658.GD31173@arm.com>
 <2265cbf6-d643-9122-79a8-90198ea16c64@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2265cbf6-d643-9122-79a8-90198ea16c64@arm.com>
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

On Fri, Jun 04, 2021 at 01:51:38PM +0100, Steven Price wrote:
> On 04/06/2021 12:36, Catalin Marinas wrote:
> > On Fri, Jun 04, 2021 at 11:42:11AM +0100, Steven Price wrote:
> >> On 03/06/2021 17:00, Catalin Marinas wrote:
> >>> On Mon, May 24, 2021 at 11:45:09AM +0100, Steven Price wrote:
> >>>> @@ -971,8 +1007,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >>>>  	if (writable)
> >>>>  		prot |= KVM_PGTABLE_PROT_W;
> >>>>  
> >>>> -	if (fault_status != FSC_PERM && !device)
> >>>> +	if (fault_status != FSC_PERM && !device) {
> >>>> +		ret = sanitise_mte_tags(kvm, pfn, vma_pagesize);
> >>>> +		if (ret)
> >>>> +			goto out_unlock;
> >>>
> >>> Maybe it was discussed in a previous version, why do we need this in
> >>> addition to kvm_set_spte_gfn()?
> >>
> >> kvm_set_spte_gfn() is only used for the MMU notifier path (e.g. if a
> >> memslot is changed by the VMM). For the initial access we will normally
> >> fault the page into stage 2 with user_mem_abort().
> > 
> > Right. Can we move the sanitise_mte_tags() call to
> > kvm_pgtable_stage2_map() instead or we don't have the all the
> > information needed?
> 
> I tried that before: kvm_pgtable_stage2_map() is shared with the
> hypervisor so sadly we can't go poking around in the host as this breaks
> on nVHE. I mentioned it in the v12 cover letter but it was in a wall of
> text:

Ah, I missed this in the cover letter (haven't read it).

So, apart from the nitpick with the early return for less indentation,
feel free to add:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

