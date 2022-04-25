Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F9350E241
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 15:47:17 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niz3c-0000jg-JG
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 09:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niz0z-0006H9-Bo
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:44:33 -0400
Received: from mga14.intel.com ([192.55.52.115]:27047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1niz0w-0006WP-K2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 09:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650894270; x=1682430270;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=11l8nWOAh8jVYp4pTM08c8ajsmoXROtLceTxJ8NiSMU=;
 b=FWY0/W+iMxrMtmMlKJmPlhtsXMMWIwthQVh05avkgEfvmVCuEgJDTMEC
 d0htyakrZkoQyrCki7qKNJzM5AiY5zWo5Xb9Tqf5T5K3bpOliBMBfUc0w
 nFBG1uJimJZrP9VmO6v16J33hpa0efVkg5AlZuiW9H7mQp8pToTMjcbcd
 lN1P0+qLuKedU9Rq4/Tpf5W7O4phQnW8tIX11G62ofA5UBHaT8M6M7SKa
 UYKRok7suaxBucYAio06dbYW4Ia45O3XkM1dwczqvPvKq/MgBUhzg+BOV
 /gmCZp9fEuVP+iyJOAKFItPymKZeQZkFbha8L3UHemFoavBXwH9FN8jJv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="265414235"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="265414235"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 06:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="704562650"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 25 Apr 2022 06:44:19 -0700
Date: Mon, 25 Apr 2022 21:40:51 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v5 00/13] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220425134051.GA175928@chaop.bj.intel.com>
References: <80aad2f9-9612-4e87-a27a-755d3fa97c92@www.fastmail.com>
 <YkcTTY4YjQs5BRhE@google.com>
 <83fd55f8-cd42-4588-9bf6-199cbce70f33@www.fastmail.com>
 <YksIQYdG41v3KWkr@google.com> <Ykslo2eo2eRXrpFR@google.com>
 <eefc3c74-acca-419c-8947-726ce2458446@www.fastmail.com>
 <Ykwbqv90C7+8K+Ao@google.com> <YkyEaYiL0BrDYcZv@google.com>
 <20220422105612.GB61987@chaop.bj.intel.com>
 <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b99f157-0f30-4b30-8399-dd659250ab8d@www.fastmail.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm list <kvm@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, the arch/x86 maintainers <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, Steven Price <steven.price@arm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jim Mattson <jmattson@google.com>, Quentin Perret <qperret@google.com>,
 Sean Christopherson <seanjc@google.com>, Jeff Layton <jlayton@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux API <linux-api@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Apr 24, 2022 at 09:59:37AM -0700, Andy Lutomirski wrote:
> 
> 
> On Fri, Apr 22, 2022, at 3:56 AM, Chao Peng wrote:
> > On Tue, Apr 05, 2022 at 06:03:21PM +0000, Sean Christopherson wrote:
> >> On Tue, Apr 05, 2022, Quentin Perret wrote:
> >> > On Monday 04 Apr 2022 at 15:04:17 (-0700), Andy Lutomirski wrote:
> >     Only when the register succeeds, the fd is
> >     converted into a private fd, before that, the fd is just a normal (shared)
> >     one. During this conversion, the previous data is preserved so you can put
> >     some initial data in guest pages (whether the architecture allows this is
> >     architecture-specific and out of the scope of this patch).
> 
> I think this can be made to work, but it will be awkward.  On TDX, for example, what exactly are the semantics supposed to be?  An error code if the memory isn't all zero?  An error code if it has ever been written?
> 
> Fundamentally, I think this is because your proposed lifecycle for these memfiles results in a lightweight API but is awkward for the intended use cases.  You're proposing, roughly:
> 
> 1. Create a memfile. 
> 
> Now it's in a shared state with an unknown virt technology.  It can be read and written.  Let's call this state BRAND_NEW.
> 
> 2. Bind to a VM.
> 
> Now it's an a bound state.  For TDX, for example, let's call the new state BOUND_TDX.  In this state, the TDX rules are followed (private memory can't be converted, etc).
> 
> The problem here is that the BOUND_NEW state allows things that are nonsensical in TDX, and the binding step needs to invent some kind of semantics for what happens when binding a nonempty memfile.
> 
> 
> So I would propose a somewhat different order:
> 
> 1. Create a memfile.  It's in the UNBOUND state and no operations whatsoever are allowed except binding or closing.

OK, so we need invent new user API to indicate UNBOUND state. For memfd
based, it can be a new feature-neutral flag at creation time.

> 
> 2. Bind the memfile to a VM (or at least to a VM technology).  Now it's in the initial state appropriate for that VM.
> 
> For TDX, this completely bypasses the cases where the data is prepopulated and TDX can't handle it cleanly.  For SEV, it bypasses a situation in which data might be written to the memory before we find out whether that data will be unreclaimable or unmovable.

This sounds a more strict rule to avoid semantics unclear.

So userspace needs to know what excatly happens for a 'bind' operation.
This is different when binds to different technologies. E.g. for SEV, it
may imply after this call, the memfile can be accessed (through mmap or
what ever) from userspace, while for current TDX this should be not allowed.

And I feel we still need a third flow/operation to indicate the
completion of the initialization on the memfile before the guest's 
first-time launch. SEV needs to check previous mmap-ed areas are munmap-ed
and prevent future userspace access. After this point, then the memfile
becomes truely private fd.

> 
> 
> ----------------------------------------------
> 
> Now I have a question, since I don't think anyone has really answered it: how does this all work with SEV- or pKVM-like technologies in which private and shared pages share the same address space?  I sounds like you're proposing to have a big memfile that contains private and shared pages and to use that same memfile as pages are converted back and forth.  IO and even real physical DMA could be done on that memfile.  Am I understanding correctly?

For TDX case, and probably SEV as well, this memfile contains private memory
only. But this design at least makes it possible for usage cases like
pKVM which wants both private/shared memory in the same memfile and rely
on other ways like mmap/munmap or mprotect to toggle private/shared instead
of fallocate/hole punching.

> 
> If so, I think this makes sense, but I'm wondering if the actual memslot setup should be different.  For TDX, private memory lives in a logically separate memslot space.  For SEV and pKVM, it doesn't.  I assume the API can reflect this straightforwardly.

I believe so. The flow should be similar but we do need pass different
flags during the 'bind' to the backing store for different usages. That
should be some new flags for pKVM but the callbacks (API here) between
memfile_notifile and its consumers can be reused.

> 
> And the corresponding TDX question: is the intent still that shared pages aren't allowed at all in a TDX memfile?  If so, that would be the most direct mapping to what the hardware actually does.

Exactly. TDX will still use fallocate/hole punching to turn on/off the
private page. Once off, the traditional shared page will become
effective in KVM.

Chao
> 
> --Andy

