Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD7538AF8B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:03:39 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljiKw-0000Ut-QE
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljiJu-0007iF-1P
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:02:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1ljiJr-0005WO-Rc
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:02:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 686BB61184;
 Thu, 20 May 2021 13:02:27 +0000 (UTC)
Date: Thu, 20 May 2021 14:02:25 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v12 3/8] arm64: mte: Sync tags for pages where PTE is
 untagged
Message-ID: <20210520130224.GE12251@arm.com>
References: <20210517123239.8025-1-steven.price@arm.com>
 <20210517123239.8025-4-steven.price@arm.com>
 <20210519180610.GE21619@arm.com>
 <3bac3a47-9f96-c7bf-e401-fdef60dcc9d8@arm.com>
 <20210520122550.GD12251@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520122550.GD12251@arm.com>
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

On Thu, May 20, 2021 at 01:25:50PM +0100, Catalin Marinas wrote:
> On Thu, May 20, 2021 at 12:55:21PM +0100, Steven Price wrote:
> > The problem I hit is one of include dependencies:
> > 
> > is_swap_pte() is defined (as a static inline) in
> > include/linux/swapops.h. However the definition depends on
> > pte_none()/pte_present() which are defined in pgtable.h - so there's a
> > circular dependency.
> > 
> > Open coding is_swap_pte() in set_pte_at() works, but it's a bit ugly.
> > Any ideas on how to improve on the below?
> > 
> > 	if (system_supports_mte() && pte_present(pte) &&
> > 	    pte_access_permitted(pte, false) && !pte_special(pte)) {
> > 		pte_t old_pte = READ_ONCE(*ptep);
> > 		/*
> > 		 * We only need to synchronise if the new PTE has tags enabled
> > 		 * or if swapping in (in which case another mapping may have
> > 		 * set tags in the past even if this PTE isn't tagged).
> > 		 * (!pte_none() && !pte_present()) is an open coded version of
> > 		 * is_swap_pte()
> > 		 */
> > 		if (pte_tagged(pte) || (!pte_none(pte) && !pte_present(pte)))
> > 			mte_sync_tags(old_pte, pte);
> > 	}
> 
> That's why I avoided testing my suggestion ;). I think we should just
> add !pte_none() in there with a comment that it may be a swap pte and
> use the is_swap_pte() again on the mte_sync_tags() path. We already have
> the pte_present() check.

Correction - pte_present() checks the new pte only, we need another for
the old pte. So it looks like we'll open-code is_swap_pte().

-- 
Catalin

