Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32F6482181
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 03:29:11 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n37fK-0002fn-BL
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 21:29:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37df-0001zs-8S
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:27:27 -0500
Received: from mga14.intel.com ([192.55.52.115]:19557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n37dc-0000pS-VX
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640917645; x=1672453645;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=GWTpTesJcb+925QqthMUbTz8/8tLtbXxt+lqNt52Aec=;
 b=VkAXwfuScZXn+Ma9vcSxSAlbcqQRqcXf3qQ30oKDt+fS0od7g/SWN2s1
 uo9ZyFY/Dhu58fnzs/O33J3TeOs9qqWwWpccVJwhdTKtO9/GOPrg7uNRv
 0QhA4Wn1cbOj0bvrcavKXqkHaVl0k/mMmdjyZBD89PgXWav0GQCoTqFuE
 pdHg9Do88S4nt1wPEgCOAtc8xQFRCVsixCDHBckjn3LPGoAUKZeHHvh7i
 oQxjbJIV6934cdQT41rjbzLD16qj8uT63FG64bosunAfLUkuKUOvUt6uI
 QMyA02R1eYDGelFWD3vQc7/mPUXQgA1TVB41arYGV1yvP7Usp4ZCXoS2K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="241970533"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="241970533"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 18:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="666705441"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2021 18:27:12 -0800
Date: Fri, 31 Dec 2021 10:26:36 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast
 memslot lookup by file offset
Message-ID: <20211231022636.GA7025@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
 <20211224035418.GA43608@chaop.bj.intel.com>
 <YcuGGCo5pR31GkZE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcuGGCo5pR31GkZE@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Dec 28, 2021 at 09:48:08PM +0000, Sean Christopherson wrote:
> On Fri, Dec 24, 2021, Chao Peng wrote:
> > On Thu, Dec 23, 2021 at 06:02:33PM +0000, Sean Christopherson wrote:
> > > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > 
> > > In other words, there needs to be a 1:1 gfn:file+offset mapping.  Since userspace
> > > likely wants to allocate a single file for guest private memory and map it into
> > > multiple discontiguous slots, e.g. to skip the PCI hole, the best idea off the top
> > > of my head would be to register the notifier on a per-slot basis, not a per-VM
> > > basis.  It would require a 'struct kvm *' in 'struct kvm_memory_slot', but that's
> > > not a huge deal.
> > > 
> > > That way, KVM's notifier callback already knows the memslot and can compute overlap
> > > between the memslot and the range by reversing the math done by kvm_memfd_get_pfn().
> > > Then, armed with the gfn and slot, invalidation is just a matter of constructing
> > > a struct kvm_gfn_range and invoking kvm_unmap_gfn_range().
> > 
> > KVM is easy but the kernel bits would be difficulty, it has to maintain
> > fd+offset to memslot mapping because one fd can have multiple memslots,
> > it need decide which memslot needs to be notified.
> 
> No, the kernel side maintains an opaque pointer like it does today,

But the opaque pointer will now become memslot, isn't it? That said,
kernel side should maintain a list of opaque pointer (memslot) instead
of one for each fd (inode) since a fd to memslot mapping is 1:M now.

>KVM handles
> reverse engineering the memslot to get the offset and whatever else it needs.
> notify_fallocate() and other callbacks are unchanged, though they probably can
> drop the inode.
> 
> E.g. likely with bad math and handwaving on the overlap detection:
> 
> int kvm_private_fd_fallocate_range(void *owner, pgoff_t start, pgoff_t end)
> {
> 	struct kvm_memory_slot *slot = owner;
> 	struct kvm_gfn_range gfn_range = {
> 		.slot	   = slot,
> 		.start	   = (start - slot->private_offset) >> PAGE_SHIFT,
> 		.end	   = (end - slot->private_offset) >> PAGE_SHIFT,
> 		.may_block = true,
> 	};
> 
> 	if (!has_overlap(slot, start, end))
> 		return 0;
> 
> 	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> 
> 	kvm_unmap_gfn_range(slot->kvm, &gfn_range);
> 	return 0;
> }

I understand this KVM side handling, but again one fd can have multiple
memslots. How shmem decides to notify which memslot from a list of
memslots when it invokes the notify_fallocate()? Or just notify all
the possible memslots then let KVM to check? 

Thanks,
Chao

