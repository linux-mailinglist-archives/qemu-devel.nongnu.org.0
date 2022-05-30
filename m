Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16902537CC4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:41:17 +0200 (CEST)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfe0-0001OB-6M
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nvfT2-00061o-Vj
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:30:01 -0400
Received: from mga14.intel.com ([192.55.52.115]:2209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nvfSz-0004Q0-UV
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653917393; x=1685453393;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=I21a6ClKGB+lq1NfhYRQ0tz6+Os23OEzwGczNY+MKwY=;
 b=iCzkhkNXpL5QBtMUAfvrhxfPlTF+Mt7+oyv9b4tMsGfgtVtmPPOwyUm5
 Lal/vqkaVm0WJ0fQDx6EzhvbOKEwjl0c4z9dHjK6FC+gr8GT05zg50qyz
 mZWuHs/IlVQ8MStcelTCICl8AQ9aDyPuA1EujgHblqtQXhrr2BCq4Wwlp
 LE085YzGwS1tcnTyC+c5As+G0i+WoF+Ye4IRWAwYRh9SfP0lCUfG0nGY2
 G5n/DwRQLwwnFfSvEAnbySSbdUTgJyz66m/H8qIQqubBBjb1BxGwkduDt
 txzdxCvuguCT687+cFlbcMChczbOp/afAZFkqRfOus6mKToFKANvBmWvT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="275088842"
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="275088842"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2022 06:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,263,1647327600"; d="scan'208";a="529175229"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga003.jf.intel.com with ESMTP; 30 May 2022 06:29:39 -0700
Date: Mon, 30 May 2022 21:26:13 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, kvm@vger.kernel.org,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220530132613.GA1200843@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
 <20220523132154.GA947536@chaop.bj.intel.com>
 <YoumuHUmgM6TH20S@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoumuHUmgM6TH20S@google.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, May 23, 2022 at 03:22:32PM +0000, Sean Christopherson wrote:
> On Mon, May 23, 2022, Chao Peng wrote:
> > On Fri, May 20, 2022 at 06:31:02PM +0000, Sean Christopherson wrote:
> > > On Fri, May 20, 2022, Andy Lutomirski wrote:
> > > > The alternative would be to have some kind of separate table or bitmap (part
> > > > of the memslot?) that tells KVM whether a GPA should map to the fd.
> > > > 
> > > > What do you all think?
> > > 
> > > My original proposal was to have expolicit shared vs. private memslots, and punch
> > > holes in KVM's memslots on conversion, but due to the way KVM (and userspace)
> > > handle memslot updates, conversions would be painfully slow.  That's how we ended
> > > up with the current propsoal.
> > > 
> > > But a dedicated KVM ioctl() to add/remove shared ranges would be easy to implement
> > > and wouldn't necessarily even need to interact with the memslots.  It could be a
> > > consumer of memslots, e.g. if we wanted to disallow registering regions without an
> > > associated memslot, but I think we'd want to avoid even that because things will
> > > get messy during memslot updates, e.g. if dirty logging is toggled or a shared
> > > memory region is temporarily removed then we wouldn't want to destroy the tracking.
> > 
> > Even we don't tight that to memslots, that info can only be effective
> > for private memslot, right? Setting this ioctl to memory ranges defined
> > in a traditional non-private memslots just makes no sense, I guess we can
> > comment that in the API document.
> 
> Hrm, applying it universally would be funky, e.g. emulated MMIO would need to be
> declared "shared".  But, applying it selectively would arguably be worse, e.g.
> letting userspace map memory into the guest as shared for a region that's registered
> as private...
> 
> On option to that mess would be to make memory shared by default, and so userspace
> must declare regions that are private.  Then there's no weirdness with emulated MMIO
> or "legacy" memslots.
> 
> On page fault, KVM does a lookup to see if the GPA is shared or private.  If the
> GPA is private, but there is no memslot or the memslot doesn't have a private fd,
> KVM exits to userspace.  If there's a memslot with a private fd, the shared/private
> flag is used to resolve the 
> 
> And to handle the ioctl(), KVM can use kvm_zap_gfn_range(), which will bump the
> notifier sequence, i.e. force the page fault to retry if the GPA may have been
> (un)registered between checking the type and acquiring mmu_lock.

Yeah, that makes sense.

> 
> > > I don't think we'd want to use a bitmap, e.g. for a well-behaved guest, XArray
> > > should be far more efficient.
> > 
> > What about the mis-behaved guest? I don't want to design for the worst
> > case, but people may raise concern on the attack from such guest.
> 
> That's why cgroups exist.  E.g. a malicious/broken L1 can similarly abuse nested
> EPT/NPT to generate a large number of shadow page tables.

I havn't seen we had that in KVM. Is there any plan/discussion to add that?

> 
> > > One benefit to explicitly tracking this in KVM is that it might be useful for
> > > software-only protected VMs, e.g. KVM could mark a region in the XArray as "pending"
> > > based on guest hypercalls to share/unshare memory, and then complete the transaction
> > > when userspace invokes the ioctl() to complete the share/unshare.
> > 
> > OK, then this can be another field of states/flags/attributes. Let me
> > dig up certain level of details:
> > 
> > First, introduce below KVM ioctl
> > 
> > KVM_SET_MEMORY_ATTR
> 
> Actually, if the semantics are that userspace declares memory as private, then we
> can reuse KVM_MEMORY_ENCRYPT_REG_REGION and KVM_MEMORY_ENCRYPT_UNREG_REGION.  It'd
> be a little gross because we'd need to slightly redefine the semantics for TDX, SNP,
> and software-protected VM types, e.g. the ioctls() currently require a pre-exisitng
> memslot.  But I think it'd work...

These existing ioctls looks good for TDX and probably SNP as well. For
softrware-protected VM types, it may not be enough. Maybe for the first
step we can reuse this for all hardware based solutions and invent new
interface when software-protected solution gets really supported.

There is semantics difference for fd-based private memory. Current above
two ioctls() use userspace addreess(hva) while for fd-based it should be
fd+offset, and probably it's better to use gpa in this case. Then we
will need change existing semantics and break backward-compatibility.

Chao

> 
> I'll think more on this...

