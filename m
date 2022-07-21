Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2AF57C832
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 11:55:23 +0200 (CEST)
Received: from localhost ([::1]:50858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEStt-0001OO-Tj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 05:55:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oESp9-0005U2-4N
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:50:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:19743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oESp7-0002u6-62
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 05:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658397025; x=1689933025;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Ac+0RLuL49DbuWul8+wP6iRaArHsOfPE0tmeiZTP7OA=;
 b=PqYdHecgawR5VaE2LNu4Waduec+eCrTdfMo0JtDIUD25NFaOebZKufh2
 gNysd8AE1JlwC1DQWREkrUIsHUGHfUI8hdIzARGYCGqjt9Ytk4RCypH8v
 N83sAyI8vaG6Qw7wqwUMuGCI7I154uPM/OnpMtn/hDmWeEYzUmk8QrzCQ
 tC8ItsRB385GDZ2b9ZOeUnX9+bSlGGiAruotVB3oJzY6n2l7mblZpW1af
 8W7v+bYs7dJDOyKkl0Tx5mb2PSXOAQwerAYk+Ig6x0nqWDiN6R6ah8MLy
 59K7JBhrl/vbez/U4jWtNcN6iWUZpOxzovZJRGrgVkMcH2mwkM2ZN40lt w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="270033319"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="270033319"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2022 02:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; d="scan'208";a="626050085"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 21 Jul 2022 02:50:12 -0700
Date: Thu, 21 Jul 2022 17:45:23 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>,
 Michael Roth <michael.roth@amd.com>, "Nikunj A. Dadhania" <nikunj@amd.com>,
 kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, mhocko@suse.com
Subject: Re: [PATCH v6 6/8] KVM: Handle page fault for private memory
Message-ID: <20220721094523.GC153288@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-7-chao.p.peng@linux.intel.com>
 <b3ce0855-0e4b-782a-599c-26590df948dd@amd.com>
 <20220624090246.GA2181919@chaop.bj.intel.com>
 <CAGtprH82H_fjtRbL0KUxOkgOk4pgbaEbAydDYfZ0qxz41JCnAQ@mail.gmail.com>
 <20220630222140.of4md7bufd5jv5bh@amd.com>
 <4fe3b47d-e94a-890a-5b87-6dfb7763bc7e@intel.com>
 <Ysc9JDcVAnlVrGC8@google.com>
 <5d0b9341-78b5-0959-2517-0fb1fe83a205@intel.com>
 <CAGtprH9knCr++C7jgXYCi1zfYcreip1uun-d+eucjEQy9xymNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH9knCr++C7jgXYCi1zfYcreip1uun-d+eucjEQy9xymNg@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Wed, Jul 20, 2022 at 04:08:10PM -0700, Vishal Annapurve wrote:
> > > Hmm, so a new slot->arch.page_attr array shouldn't be necessary, KVM can instead
> > > update slot->arch.lpage_info on shared<->private conversions.  Detecting whether
> > > a given range is partially mapped could get nasty if KVM defers tracking to the
> > > backing store, but if KVM itself does the tracking as was previously suggested[*],
> > > then updating lpage_info should be relatively straightfoward, e.g. use
> > > xa_for_each_range() to see if a given 2mb/1gb range is completely covered (fully
> > > shared) or not covered at all (fully private).
> > >
> > > [*] https://lore.kernel.org/all/YofeZps9YXgtP3f1@google.com
> >
> > Yes, slot->arch.page_attr was introduced to help identify whether a page
> > is completely shared/private at given level. It seems XARRAY can serve
> > the same purpose, though I know nothing about it. Looking forward to
> > seeing the patch of using XARRAY.
> >
> > yes, update slot->arch.lpage_info is good to utilize the existing logic
> > and Isaku has applied it to slot->arch.lpage_info for 2MB support patches.
> 
> Chao, are you planning to implement these changes to ensure proper
> handling of hugepages partially mapped as private/shared in subsequent
> versions of this series?
> Or is this something left to be handled by the architecture specific code?

Ah, the topic gets moved to a different place. I should update here.
There were more discussions under TDX KVM patch series and I actually
just sent out the draft code for this:

https://lkml.org/lkml/2022/7/20/610

That patch is based on UPM v7 here. If I can get more feedbacks there
then I will include an udpated version in UPM v8.

If you have bandwdith, you can also play with that patch, any feedback
is welcome.

Chao
> 
> Regards,
> Vishal

