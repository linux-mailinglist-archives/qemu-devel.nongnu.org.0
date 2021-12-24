Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1B47EB0D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 05:03:06 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0bnO-0007TQ-01
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 23:03:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0bg1-00057m-PK
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:55:29 -0500
Received: from mga17.intel.com ([192.55.52.151]:38579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0bfg-00039l-HZ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 22:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640318108; x=1671854108;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=WZb4+/Ks4LDsAyLJCQPSXmUGHI2zwvNb+vAIAemyck0=;
 b=f/2/4J4D2BydWb9PWWCQ7mRBS0zoNviY24TtBwzoQ5VWrGN2w5/aL0Tm
 h+pTqMxP7+3+agCutwCCis9jk5AEPFXWSFXBwvDVEX7/jZpLWnDmmQ5NX
 aon94csnwQBfqahzjnwvMP2fc6AdaTUqXrgxp45W9fHgO4a0vgkw1L0YX
 pwgpwlMCcPYE4YKcY2sz+64+JgozCxWHW2ExkJ1uvU4ZTyU6pFDcEm03I
 Nacn+LLQhjHDeq9SfTMOW1H+yXIvkympA6mGrh1cCaLOT2dMDQRJaW2Y+
 vA7bPlAru/FUYVh+jveFlGZpYHK0Rtoli8ylyyoMggv1Zvvv4J/bCuHhw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="221597358"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="221597358"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 19:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="607950579"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Dec 2021 19:54:56 -0800
Date: Fri, 24 Dec 2021 11:54:18 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast
 memslot lookup by file offset
Message-ID: <20211224035418.GA43608@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcS5uStTallwRs0G@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 23, 2021 at 06:02:33PM +0000, Sean Christopherson wrote:
> On Thu, Dec 23, 2021, Chao Peng wrote:
> > Similar to hva_tree for hva range, maintain interval tree ofs_tree for
> > offset range of a fd-based memslot so the lookup by offset range can be
> > faster when memslot count is high.
> 
> This won't work.  The hva_tree relies on there being exactly one virtual address
> space, whereas with private memory, userspace can map multiple files into the
> guest at different gfns, but with overlapping offsets.

OK, that's the point.

> 
> I also dislike hijacking __kvm_handle_hva_range() in patch 07.
> 
> KVM also needs to disallow mapping the same file+offset into multiple gfns, which
> I don't see anywhere in this series.

This can be checked against file+offset overlapping with existing slots
when register a new one.

> 
> In other words, there needs to be a 1:1 gfn:file+offset mapping.  Since userspace
> likely wants to allocate a single file for guest private memory and map it into
> multiple discontiguous slots, e.g. to skip the PCI hole, the best idea off the top
> of my head would be to register the notifier on a per-slot basis, not a per-VM
> basis.  It would require a 'struct kvm *' in 'struct kvm_memory_slot', but that's
> not a huge deal.
> 
> That way, KVM's notifier callback already knows the memslot and can compute overlap
> between the memslot and the range by reversing the math done by kvm_memfd_get_pfn().
> Then, armed with the gfn and slot, invalidation is just a matter of constructing
> a struct kvm_gfn_range and invoking kvm_unmap_gfn_range().

KVM is easy but the kernel bits would be difficulty, it has to maintain
fd+offset to memslot mapping because one fd can have multiple memslots,
it need decide which memslot needs to be notified.

Thanks,
Chao

