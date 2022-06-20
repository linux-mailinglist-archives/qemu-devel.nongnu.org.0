Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D27551D88
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3IHQ-0005ws-4u
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 10:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o3I9W-0004jb-BO
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:13:19 -0400
Received: from mga03.intel.com ([134.134.136.65]:63008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o3I9U-0007wL-67
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 10:13:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655734396; x=1687270396;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Bp9Mlz7Na3xaUAMgzpqbQL8va7PMos3P8wYwM1/XQFY=;
 b=B9QUfAgArrHBDgbxmPNvBFke9sqya0rBHs0ZY+0YU9CeSkN9zJcoo8Ky
 j6gfbIbYXr2WuEO65hsScM6V/TaNP6rIuXSQKt8x3VEJOp/5nh/0rnZey
 GsHg/4tQ/Im47gX8D0IqVN9Jch28NbSr5actulb+UrUBzpH015R7r1icj
 RKvEeYs2lZaEigRwnasseUh6gUg4ks520A2JqcOmaBqQABvUrjgwKXZtU
 QRpO6XePJego3KjoNEQLpaHamX4ILZRBlgkKAeU0WKV/Kx9bwiJKOXQyG
 A52mWqdLyAzO2wV0AR3wHwD/FE06NT2SQO9BXAroeeHd49vuUijSiP69k w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280962220"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="280962220"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 07:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="584912288"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 20 Jun 2022 07:13:02 -0700
Date: Mon, 20 Jun 2022 22:09:41 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220620140941.GB2016793@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <Yqzpf3AEYabFWjnW@google.com> <YqzxvYU7EtHab6U7@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqzxvYU7EtHab6U7@google.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 17, 2022 at 09:27:25PM +0000, Sean Christopherson wrote:
> On Fri, Jun 17, 2022, Sean Christopherson wrote:
> > > @@ -110,6 +133,7 @@ struct kvm_userspace_memory_region {
> > >   */
> > >  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> > >  #define KVM_MEM_READONLY	(1UL << 1)
> > > +#define KVM_MEM_PRIVATE		(1UL << 2)
> > 
> > Hmm, KVM_MEM_PRIVATE is technically wrong now that a "private" memslot maps private
> > and/or shared memory.  Strictly speaking, we don't actually need a new flag.  Valid
> > file descriptors must be >=0, so the logic for specifying a memslot that can be
> > converted between private and shared could be that "(int)private_fd < 0" means
> > "not convertible", i.e. derive the flag from private_fd.
> > 
> > And looking at the two KVM consumers of the flag, via kvm_slot_is_private(), they're
> > both wrong.  Both kvm_faultin_pfn() and kvm_mmu_max_mapping_level() should operate
> > on the _fault_, not the slot.  So it would actually be a positive to not have an easy
> > way to query if a slot supports conversion.
> 
> I take that back, the usage in kvm_faultin_pfn() is correct, but the names ends
> up being confusing because it suggests that it always faults in a private pfn.

Make sense, will change the naming, thanks.

> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index b6d75016e48c..e1008f00609d 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4045,7 +4045,7 @@ static int kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>                         return RET_PF_EMULATE;
>         }
> 
> -       if (fault->is_private) {
> +       if (kvm_slot_can_be_private(slot)) {
>                 r = kvm_faultin_pfn_private(vcpu, fault);
>                 if (r != RET_PF_CONTINUE)
>                         return r == RET_PF_FIXED ? RET_PF_CONTINUE : r;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 31f704c83099..c5126190fb71 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -583,9 +583,9 @@ struct kvm_memory_slot {
>         struct kvm *kvm;
>  };
> 
> -static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> +static inline bool kvm_slot_can_be_private(const struct kvm_memory_slot *slot)
>  {
> -       return slot && (slot->flags & KVM_MEM_PRIVATE);
> +       return slot && !!slot->private_file;
>  }
> 
>  static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)

