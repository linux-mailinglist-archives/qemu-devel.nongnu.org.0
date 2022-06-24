Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F7A55967F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:27:00 +0200 (CEST)
Received: from localhost ([::1]:36446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fad-0001Bh-Lb
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4f8e-00069D-Q6
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:58:05 -0400
Received: from mga05.intel.com ([192.55.52.43]:1294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o4f8c-0001jf-4r
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656061082; x=1687597082;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=yeQrZJrXMWBUMR9vCpqaTH5T9SUmL0CpG6XsQUx1ILY=;
 b=V+Spld7FVCHt70uSnnaB2ROZzOixty1KTBlqx8X6Cx1tCUeVUr6kcZqN
 3Zbtx9q293U3cfy6NdLUeXKSN/nB24KUwQcRy+XSD82LboxS09koYljHL
 23+QZg7uLxOBOkTj3a08l7sRe5V24MznkdKb+RByYlIUgGeXC7p5OYJY6
 A18n7pT6ShEEWZ0Homv/9rQ2hAmfN992PAtw016u5IbeklttDDy68ec6F
 Ia0EPP1W7psaeKBSiQp4i2regGdl1vbNBMxY8LZ8OMFLCofyKoLE9CgVe
 yjJauBt2Ey91E05dyBg5kNE4gwXVRdxgek4VYBNYo3U+SrbsQeMPWrsMZ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="367278031"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="367278031"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 01:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="586510529"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 24 Jun 2022 01:57:46 -0700
Date: Fri, 24 Jun 2022 16:54:26 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Andy Lutomirski <luto@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 mhocko@suse.com, "Nikunj A. Dadhania" <nikunj@amd.com>
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220624085426.GB2178308@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
 <20220623225949.kkdx6uwjlk2ec4iq@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623225949.kkdx6uwjlk2ec4iq@amd.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
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

On Thu, Jun 23, 2022 at 05:59:49PM -0500, Michael Roth wrote:
> On Fri, May 20, 2022 at 06:31:02PM +0000, Sean Christopherson wrote:
> > On Fri, May 20, 2022, Andy Lutomirski wrote:
> > > The alternative would be to have some kind of separate table or bitmap (part
> > > of the memslot?) that tells KVM whether a GPA should map to the fd.
> > > 
> > > What do you all think?
> > 
> > My original proposal was to have expolicit shared vs. private memslots, and punch
> > holes in KVM's memslots on conversion, but due to the way KVM (and userspace)
> > handle memslot updates, conversions would be painfully slow.  That's how we ended
> > up with the current propsoal.
> > 
> > But a dedicated KVM ioctl() to add/remove shared ranges would be easy to implement
> > and wouldn't necessarily even need to interact with the memslots.  It could be a
> > consumer of memslots, e.g. if we wanted to disallow registering regions without an
> > associated memslot, but I think we'd want to avoid even that because things will
> > get messy during memslot updates, e.g. if dirty logging is toggled or a shared
> > memory region is temporarily removed then we wouldn't want to destroy the tracking.
> > 
> > I don't think we'd want to use a bitmap, e.g. for a well-behaved guest, XArray
> > should be far more efficient.
> > 
> > One benefit to explicitly tracking this in KVM is that it might be useful for
> > software-only protected VMs, e.g. KVM could mark a region in the XArray as "pending"
> > based on guest hypercalls to share/unshare memory, and then complete the transaction
> > when userspace invokes the ioctl() to complete the share/unshare.
> 
> Another upside to implementing a KVM ioctl is basically the reverse of the
> discussion around avoiding double-allocations: *supporting* double-allocations.
> 
> One thing I noticed while testing SNP+UPM support is a fairly dramatic
> slow-down with how it handles OVMF, which does some really nasty stuff
> with DMA where it takes 1 or 2 pages and flips them between
> shared/private on every transaction. Obviously that's not ideal and
> should be fixed directly at some point, but it's something that exists in the
> wild and might not be the only such instance where we need to deal with that
> sort of usage pattern. 
> 
> With the current implementation, one option I had to address this was to
> disable hole-punching in QEMU when doing shared->private conversions:
> 
> Boot time from 1GB guest:
>                                SNP:   32s
>                            SNP+UPM: 1m43s
>   SNP+UPM (disable shared discard): 1m08s
> 
> Of course, we don't have the option of disabling discard/hole-punching
> for private memory to see if we get similar gains there, since that also
> doubles as the interface for doing private->shared conversions.

Private should be the same, minus time consumed for private memory, the
data should be close to SNP case. You can't try that in current version
due to we rely on the existence of the private page to tell a page is
private.

> A separate
> KVM ioctl to decouple these 2 things would allow for that, and allow for a
> way for userspace to implement things like batched/lazy-discard of
> previously-converted pages to deal with cases like these.

The planned ioctl includes two responsibilities:
  - Mark the range as private/shared
  - Zap the existing SLPT mapping for the range

Whether doing the hole-punching or not on the fd is unrelated to this
ioctl, userspace has freedom to do that or not. Since we don't reply on
the fact that private memoy should have been allocated, we can support
lazy faulting and don't need explicit fallocate(). That means, whether
the memory is discarded or not in the memory backing store is not
required by KVM, but be a userspace option.

> 
> Another motivator for these separate ioctl is that, since we're considering
> 'out-of-band' interactions with private memfd where userspace might
> erroneously/inadvertently do things like double allocations, another thing it
> might do is pre-allocating pages in the private memfd prior to associating
> the memfd with a private memslot. Since the notifiers aren't registered until
> that point, any associated callbacks that would normally need to be done as
> part of those fallocate() notification would be missed unless we do something
> like 'replay' all the notifications once the private memslot is registered and
> associating with a memfile notifier. But that seems a bit ugly, and I'm not
> sure how well that would work. This also seems to hint at this additional
> 'conversion' state being something that should be owned and managed directly
> by KVM rather than hooking into the allocations.

Right, once we move the private/shared state into KVM then we don't rely
on those callbacks so the 'replay' thing is unneeded. fallocate()
notification is useless for sure, invalidate() is likely still needed,
just like the invalidate for mmu_notifier to bump the mmu_seq and do the
zap.

> 
> It would also nicely solve the question of how to handle in-place
> encryption, since unlike userspace, KVM is perfectly capable of copying
> data from shared->private prior to conversion / guest start, and
> disallowing such things afterward. Would just need an extra flag basically.

Agree it's possible to do additional copy during the conversion but I'm
not so confident this is urgent and the right API. Currently TDX does
not have this need. Maybe as the first step just add the conversion
itself. Adding additional feature like this can always be possible
whenever we are clear.

Thanks,
Chao

