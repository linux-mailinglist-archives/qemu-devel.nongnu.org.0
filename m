Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 612BF651BF9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:49:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7XM8-0005T2-8Y; Tue, 20 Dec 2022 02:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7XLu-0005SW-KG
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:47:54 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7XLr-0002pA-98
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671522471; x=1703058471;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=18JY1Rv+JmD8fqHB1Zwfy2CyVc6av0CO+XzWDU5pLU8=;
 b=XgWndg9Bd3Zx05LXWgRZ6TBZzdKI7E68ypZ8reKYg0N2zQA46RFEXBwU
 5Zulh17cmHv/yKKxUZKznrF52IMn7tgHo4YHXABwNsE6NGkVZJbqZTUQH
 73bITyiIosbSDkn2cElf9j9/axqEBWWaSPs4Q0JXeRku9vrPAXBO6LJgT
 cqAG8nCZ7UaDwiZkNIuZXu5M8u+R6FO3gphMSw+c0RvQNixWRVS8k9nO8
 HFBnuZ0acoT/+C6pEaLaO3SEuwwyb5ldsmm3ft/ByqNP9ZLiE/27RdB9D
 O87BFukfwrD49ec1WkS5uZ5Z+zZJqWdv1c4L9vDwIaKIG4Wb32drR3yqn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="317187859"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="317187859"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 23:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="896319288"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="896319288"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2022 23:47:34 -0800
Date: Tue, 20 Dec 2022 15:43:18 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20221220074318.GC1724933@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y6B27MpZO8o1Asfe@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6B27MpZO8o1Asfe@zn.tnic>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 19, 2022 at 03:36:28PM +0100, Borislav Petkov wrote:
> On Fri, Dec 02, 2022 at 02:13:41PM +0800, Chao Peng wrote:
> > In memory encryption usage, guest memory may be encrypted with special
> > key and can be accessed only by the guest itself. We call such memory
> > private memory. It's valueless and sometimes can cause problem to allow
> 
> valueless?
> 
> I can't parse that.

It's unnecessary and ...

> 
> > userspace to access guest private memory. This new KVM memslot extension
> > allows guest private memory being provided through a restrictedmem
> > backed file descriptor(fd) and userspace is restricted to access the
> > bookmarked memory in the fd.
> 
> bookmarked?

userspace is restricted to access the memory content in the fd.

> 
> > This new extension, indicated by the new flag KVM_MEM_PRIVATE, adds two
> > additional KVM memslot fields restricted_fd/restricted_offset to allow
> > userspace to instruct KVM to provide guest memory through restricted_fd.
> > 'guest_phys_addr' is mapped at the restricted_offset of restricted_fd
> > and the size is 'memory_size'.
> > 
> > The extended memslot can still have the userspace_addr(hva). When use, a
> 
> "When un use, ..."

When both userspace_addr and restricted_fd/offset were used, ...

> 
> ...
> 
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index a8e379a3afee..690cb21010e7 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -50,6 +50,8 @@ config KVM
> >  	select INTERVAL_TREE
> >  	select HAVE_KVM_PM_NOTIFIER if PM
> >  	select HAVE_KVM_MEMORY_ATTRIBUTES
> > +	select HAVE_KVM_RESTRICTED_MEM if X86_64
> > +	select RESTRICTEDMEM if HAVE_KVM_RESTRICTED_MEM
> 
> Those deps here look weird.
> 
> RESTRICTEDMEM should be selected by TDX_GUEST as it can't live without
> it.

RESTRICTEDMEM is needed by TDX_HOST, not TDX_GUEST.

> 
> Then you don't have to select HAVE_KVM_RESTRICTED_MEM simply because of
> X86_64 - you need that functionality when the respective guest support
> is enabled in KVM.

Letting the actual feature(e.g. TDX or pKVM) select it or add dependency
sounds a viable and clearer solution. Sean, let me know your opinion.

> 
> Then, looking forward into your patchset, I'm not sure you even
> need HAVE_KVM_RESTRICTED_MEM - you could make it all depend on
> CONFIG_RESTRICTEDMEM. But that's KVM folks call - I'd always aim for
> less Kconfig items because we have waay too many.

The only reason to add another HAVE_KVM_RESTRICTED_MEM is some code only
works for 64bit[*] and CONFIG_RESTRICTEDMEM is not sufficient to enforce
that.

[*] https://lore.kernel.org/all/YkJLFu98hZOvTSrL@google.com/

Thanks,
Chao
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

