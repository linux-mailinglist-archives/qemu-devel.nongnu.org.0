Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0D2484E10
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:14:33 +0100 (CET)
Received: from localhost ([::1]:48664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4zZ9-0006Uj-Nc
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zUo-0004wh-EG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:10:02 -0500
Received: from mga03.intel.com ([134.134.136.65]:54507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zUm-0002XW-Lp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641363000; x=1672899000;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=neMYafxOw6RMBRe+E68I7vpqrbUkO5bFR8JYJ2KBVLo=;
 b=THrx3TOv6tE/Mcm7zYP9VSW0YEKqKVweIHr7MVfkvZc4b/f2e/0FooDr
 Q+Q+h64ChGXocQagOs825gRG1AOJOWQrDJZCxr/n6whIUsMDbZonvvYQu
 6l8H6mkvptkVe3Y8C9HFkWTaaQA9R6YhX6fdZVPVy4Noe0IAcvDZyZfiS
 DQyXhfbDHlpjNgEL9zz/13InPP3b+xUkeiEhy0U9ead7Y8sKY3Knld8VD
 /I3DHrCwXcp9tp7KPGk5Vtt9xYOQma+yfYJWmi7FnnbrHYaax6/mOccyD
 WiYmZnef5uUtP/mg6MncsewPdtBhBzZwEHZJYr9bCbnRr8nMuqbte6eZU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242334872"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="242334872"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 22:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526380386"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 22:09:52 -0800
Date: Wed, 5 Jan 2022 14:09:18 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 05/16] KVM: Maintain ofs_tree for fast
 memslot lookup by file offset
Message-ID: <20220105060918.GB25009@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-6-chao.p.peng@linux.intel.com>
 <YcS5uStTallwRs0G@google.com>
 <20211224035418.GA43608@chaop.bj.intel.com>
 <YcuGGCo5pR31GkZE@google.com>
 <20211231022636.GA7025@chaop.bj.intel.com>
 <YdSHViDXGkjz5t/Q@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdSHViDXGkjz5t/Q@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

On Tue, Jan 04, 2022 at 05:43:50PM +0000, Sean Christopherson wrote:
> On Fri, Dec 31, 2021, Chao Peng wrote:
> > On Tue, Dec 28, 2021 at 09:48:08PM +0000, Sean Christopherson wrote:
> > >KVM handles
> > > reverse engineering the memslot to get the offset and whatever else it needs.
> > > notify_fallocate() and other callbacks are unchanged, though they probably can
> > > drop the inode.
> > > 
> > > E.g. likely with bad math and handwaving on the overlap detection:
> > > 
> > > int kvm_private_fd_fallocate_range(void *owner, pgoff_t start, pgoff_t end)
> > > {
> > > 	struct kvm_memory_slot *slot = owner;
> > > 	struct kvm_gfn_range gfn_range = {
> > > 		.slot	   = slot,
> > > 		.start	   = (start - slot->private_offset) >> PAGE_SHIFT,
> > > 		.end	   = (end - slot->private_offset) >> PAGE_SHIFT,
> > > 		.may_block = true,
> > > 	};
> > > 
> > > 	if (!has_overlap(slot, start, end))
> > > 		return 0;
> > > 
> > > 	gfn_range.end = min(gfn_range.end, slot->base_gfn + slot->npages);
> > > 
> > > 	kvm_unmap_gfn_range(slot->kvm, &gfn_range);
> > > 	return 0;
> > > }
> > 
> > I understand this KVM side handling, but again one fd can have multiple
> > memslots. How shmem decides to notify which memslot from a list of
> > memslots when it invokes the notify_fallocate()? Or just notify all
> > the possible memslots then let KVM to check? 
> 
> Heh, yeah, those are the two choices.  :-)
> 
> Either the backing store needs to support registering callbacks for specific,
> arbitrary ranges, or it needs to invoke all registered callbacks.  Invoking all
> callbacks has my vote; it's much simpler to implement and is unlikely to incur
> meaningful overhead.  _Something_ has to find the overlapping ranges, that cost
> doesn't magically go away if it's pushed into the backing store.
> 
> Note, invoking all notifiers is also aligned with the mmu_notifier behavior.

Sounds a good reason. Then shmem side only needs to maintain a list of
users.

Chao

