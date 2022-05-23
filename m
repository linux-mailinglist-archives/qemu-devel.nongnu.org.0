Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B64B531105
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:27:08 +0200 (CEST)
Received: from localhost ([::1]:36096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt85T-0004i6-IR
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nt848-0003sF-IG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:25:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:44640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nt844-0006xf-QG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653312340; x=1684848340;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EW9q/Cvw2jkobQ73y88ztoczGNs8Sdg5pZ9/RmN9nZs=;
 b=WthvOEG3cfEqWawcU1E6Gd85T62T+efxeDhc1wpm2nLeDxKNveEOtAu9
 O9vUgT5ivhQpurKgSvFlkUox34fxocKfelgGInKWCL6XQKdgpFIBg5B6L
 /Uzbcm1d6gxNc+ZOlZw6nL+nsCLU7dr4V5UVwyFVHpUPjt9F9i0qpO9MK
 oBPjjTcucp9oCMqQxb1AH6YRL4dzU/JxzBFr8cHmq7cpCG+33TqiSXm44
 5/bQ/2GARlvpAZNSn3k+GWNYwJlmMCKaOc4L1T84FZ3oXgh7BJsFNAqcV
 BOeRM/9VYXQr2ASlKIjcIZ5s+yj8I7IqDU8VdbcoWx6kCK5FZYpc91lF5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="298533129"
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="298533129"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2022 06:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,246,1647327600"; d="scan'208";a="608195288"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga001.jf.intel.com with ESMTP; 23 May 2022 06:25:20 -0700
Date: Mon, 23 May 2022 21:21:54 +0800
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
Message-ID: <20220523132154.GA947536@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YofeZps9YXgtP3f1@google.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, May 20, 2022 at 06:31:02PM +0000, Sean Christopherson wrote:
> On Fri, May 20, 2022, Andy Lutomirski wrote:
> > The alternative would be to have some kind of separate table or bitmap (part
> > of the memslot?) that tells KVM whether a GPA should map to the fd.
> > 
> > What do you all think?
> 
> My original proposal was to have expolicit shared vs. private memslots, and punch
> holes in KVM's memslots on conversion, but due to the way KVM (and userspace)
> handle memslot updates, conversions would be painfully slow.  That's how we ended
> up with the current propsoal.
> 
> But a dedicated KVM ioctl() to add/remove shared ranges would be easy to implement
> and wouldn't necessarily even need to interact with the memslots.  It could be a
> consumer of memslots, e.g. if we wanted to disallow registering regions without an
> associated memslot, but I think we'd want to avoid even that because things will
> get messy during memslot updates, e.g. if dirty logging is toggled or a shared
> memory region is temporarily removed then we wouldn't want to destroy the tracking.

Even we don't tight that to memslots, that info can only be effective
for private memslot, right? Setting this ioctl to memory ranges defined
in a traditional non-private memslots just makes no sense, I guess we can
comment that in the API document.

> 
> I don't think we'd want to use a bitmap, e.g. for a well-behaved guest, XArray
> should be far more efficient.

What about the mis-behaved guest? I don't want to design for the worst
case, but people may raise concern on the attack from such guest.

> 
> One benefit to explicitly tracking this in KVM is that it might be useful for
> software-only protected VMs, e.g. KVM could mark a region in the XArray as "pending"
> based on guest hypercalls to share/unshare memory, and then complete the transaction
> when userspace invokes the ioctl() to complete the share/unshare.

OK, then this can be another field of states/flags/attributes. Let me
dig up certain level of details:

First, introduce below KVM ioctl

KVM_SET_MEMORY_ATTR

struct kvm_memory_attr {
	__u64 addr;	/* page aligned */
	__u64 size;	/* page aligned */
#define KVM_MEMORY_ATTR_SHARED		(1 << 0)
#define KVM_MEMORY_ATTR_PRIVATE		(1 << 1)
	__u64 flags;
}

Second, check the KVM maintained guest memory attributes in page fault
handler (instead of checking memory existence in private fd)

Third, the memfile_notifier_ops (populate/invalidate) will be removed
from current code, the old mapping zapping can be directly handled in
this new KVM ioctl().
 
Thought?

Since this info is stored in KVM, which I think is reasonable. But for
other potential memfile_notifier users like VFIO, some KVM-to-VFIO APIs
might be needed depends on the implementaion.

It is also possible to maintain this info purely in userspace. The only
trick bit is implicit conversion support that has to be checked in KVM
page fault handler and is in the fast path.

Thanks,
Chao

