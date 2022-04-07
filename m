Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259F4F835A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 17:31:40 +0200 (CEST)
Received: from localhost ([::1]:57896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncU6k-0005tE-3p
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 11:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncU5L-0005Ar-Tp
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 11:30:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:24895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1ncU5J-00043M-O8
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 11:30:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649345409; x=1680881409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cfnpcQWmhMA0plThbpwJxg9TGWa8kmP2YOC1iF2CiUM=;
 b=U8DMH9Djygm1TI033nqLXCcWClbjFoGkIGdEzPru6C8uP01aHHCVueza
 CF4tOWP1j1PvJygKG8lN/u0p7yY2LmbIzOycxDk0EbOxEWw2DqzgwvFAL
 KSz+uOO4j8sFoXerOnYPb2jV/T0anToiOrSVE7lJHcWJ3xtEFnV8sCHzJ
 QdsCnq3XmocmrbdMizM7Gq6mzOnUZ7nlk670qhB/x2Key9m7Td6vFZhV9
 O6iqYN6an2FKXseSRecZNxoVGr8YMjDJVDrm8rQHl/zdfkVnenudH8/xC
 a5ITsT1dAstVZlfmYqAuj946kofWurwiMqfw7NhAPW6MehsfR3OM0wa73 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241948017"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="241948017"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="557412636"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 07 Apr 2022 08:29:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1000)
 id 3646D132; Thu,  7 Apr 2022 18:27:34 +0300 (EEST)
Date: Thu, 7 Apr 2022 18:27:34 +0300
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] x86: Implement Linear Address Masking support
Message-ID: <20220407152734.miad3m2aqtbsfin3@black.fi.intel.com>
References: <20220407010107.34734-1-kirill.shutemov@linux.intel.com>
 <79fa875e-0f67-5e21-c22f-9df700716575@linaro.org>
 <20220407131843.ahmoqqoylu6jsmm3@black.fi.intel.com>
 <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c409502-55e3-3c62-eb43-854996c47805@linaro.org>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 07:28:54AM -0700, Richard Henderson wrote:
> On 4/7/22 06:18, Kirill A. Shutemov wrote:
> > > The new hook is incorrect, in that it doesn't apply to addresses along
> > > the tlb fast path.
> > 
> > I'm not sure what you mean by that. tlb_hit() mechanics works. We strip
> > the tag bits before tlb lookup.
> > 
> > Could you elaborate?
> 
> The fast path does not clear the bits, so you enter the slow path before you
> get to clearing the bits.  You've lost most of the advantage of the tlb
> already.

Sorry for my ignorance, but what do you mean by fast path here?

My understanding is that it is the case when tlb_hit() is true and you
don't need to get into tlb_fill(). Are we talking about the same scheme?

For store_helper() I clear the bits before doing TLB look and fill. So TLB
will always deal with clean addresses.

Hm?

> > To be honest I don't fully understand how TBI emulation works.
> 
> In get_phys_addr_lpae:
> 
>         addrsize = 64 - 8 * param.tbi;
> ...
>         target_ulong top_bits = sextract64(address, inputsize,
>                                            addrsize - inputsize);
>         if (-top_bits != param.select) {
>             /* The gap between the two regions is a Translation fault */
>             fault_type = ARMFault_Translation;
>             goto do_fault;
>         }
> 
> which does not include TBI bits in the validation of the sign-extended address.
> 
> > Consider store_helper(). I failed to find where tag bits get stripped
> > before getting there for !CONFIG_USER_ONLY. clean_data_tbi() only covers
> > user-only case.
> > 
> > And if we get there with tags, I don't see how we will ever get to fast
> > path: tlb_hit() should never return true there if any bit in top byte is
> > set as cached tlb_addr has them stripped.
> > 
> > tlb_fill() will get it handled correctly, but it is wasteful to go through
> > pagewalk on every tagged pointer dereference.
> 
> We won't do a pagewalk for every tagged pointer dereference.  It'll be
> pointer dereferences with differing tags past the limit of the victim cache
> (CPU_VTLB_SIZE).  And one tag will get to use the fast path, e.g. on the
> store following a load.
> 
> I've just now had a browse through the Intel docs, and I see that you're not
> performing the required modified canonicality check.

Modified is effectively done by clearing (and sign-extending) the address
before the check.

> While a proper tagged address will have the tag removed in CR2 during a
> page fault, an improper tagged address (with bit 63 != {47,56}) should
> have the original address reported to CR2.

Hm. I don't see it in spec. It rather points to other direction:

	Page faults report the faulting linear address in CR2. Because LAM
	masking (by sign-extension) applies before paging, the faulting
	linear address recorded in CR2 does not contain the masked
	metadata.

Yes, it talks about CR2 in case of page fault, not #GP due to canonicality
checking, but still.

> I could imagine a hook that could aid the victim cache in ignoring the tag,
> so that we need go through tlb_fill fewer times.  But I wouldn't want to
> include that in the base version of this feature, and I'd want take more
> than a moment in the design so that it could be used by ARM and RISC-V as
> well.

But what other options do you see. Clering the bits before TLB look up
matches the architectural spec and makes INVLPG match described behaviour
without special handling.

-- 
 Kirill A. Shutemov

