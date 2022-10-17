Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E58F4601268
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 17:07:31 +0200 (CEST)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okRiE-0000rJ-NN
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 11:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1okRea-0004lB-Kh
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:03:45 -0400
Received: from mga09.intel.com ([134.134.136.24]:9981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1okReX-00025h-C6
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 11:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666019021; x=1697555021;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=PvgBjoYyaoMX/iKVZUi6GVXenC/pYD5E0G2UFDGF3Zw=;
 b=k6W5aNG7MGj3+voIk1a2K1qhDAdu8fjmeRlyWc0VJ1XF6QqY/fsnYogx
 6jPvUyK/0j8jpMN9bi1ZdVys07Pbn0YlfE2gvLANqhR/6TMLKXGQyztMB
 ZTNtpseCEoZR2J86nduTD3gw/UMZW8sdXDGvas0iwpcbOwEgWB/viLwg/
 JntG+vf5Tx3TOGWJpdB18XTgkhRkkCcbM0NOdRotiStDwYNZ0tmnwAZQq
 euJ1eRAxZInB5+czAPFBOKAR6O3ewt3D4puABz39obf73JEOXjrsLrjs3
 DfoYoWbsW6Hv/wLUzp+WaNKyj4U4Q0XR7u8a6A3A0WsQYLmqLm/mtnYGV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="306897488"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="306897488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 08:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="691387974"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="691387974"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 17 Oct 2022 08:03:27 -0700
Date: Mon, 17 Oct 2022 22:58:56 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: Sean Christopherson <seanjc@google.com>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
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
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20221017145856.GB3417432@chaop.bj.intel.com>
References: <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
 <20221013133457.GA3263142@chaop.bj.intel.com>
 <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 11:31:19AM +0100, Fuad Tabba wrote:
> Hi,
> 
> > >
> > > Actually, for pKVM, there is no need for the guest memory to be
> > > GUP'able at all if we use the new inaccessible_get_pfn().
> >
> > If pKVM can use inaccessible_get_pfn() to get pfn and can avoid GUP (I
> > think that is the major concern?), do you see any other gap from
> > existing API?
> 
> Actually for this part no, there aren't any gaps and
> inaccessible_get_pfn() is sufficient.

Thanks for the confirmation.

> 
> > > This of
> > > course goes back to what I'd mentioned before in v7; it seems that
> > > representing the memslot memory as a file descriptor should be
> > > orthogonal to whether the memory is shared or private, rather than a
> > > private_fd for private memory and the userspace_addr for shared
> > > memory. The host can then map or unmap the shared/private memory using
> > > the fd, which allows it more freedom in even choosing to unmap shared
> > > memory when not needed, for example.
> >
> > Using both private_fd and userspace_addr is only needed in TDX and other
> > confidential computing scenarios, pKVM may only use private_fd if the fd
> > can also be mmaped as a whole to userspace as Sean suggested.
> 
> That does work in practice, for now at least, and is what I do in my
> current port. However, the naming and how the API is defined as
> implied by the name and the documentation. By calling the field
> private_fd, it does imply that it should not be mapped, which is also
> what api.rst says in PATCH v8 5/8. My worry is that in that case pKVM
> would be mis/ab-using this interface, and that future changes could
> cause unforeseen issues for pKVM.

That is fairly enough. We can change the naming and the documents.

> 
> Maybe renaming this to something like "guest_fp", and specifying in
> the documentation that it can be restricted, e.g., instead of "the
> content of the private memory is invisible to userspace" something
> along the lines of  "the content of the guest memory may be restricted
> to userspace".

Some other candidates in my mind:
- restricted_fd: to pair with the mm side restricted_memfd
- protected_fd: as Sean suggested before
- fd: how it's explained relies on the memslot.flag.

Thanks,
Chao
> 
> What do you think?
> 
> Cheers,
> /fuad
> 
> >
> > Thanks,
> > Chao
> > >
> > > Cheers,
> > > /fuad

