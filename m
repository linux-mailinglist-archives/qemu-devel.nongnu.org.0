Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8C75FDC5D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:24:15 +0200 (CEST)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiz8B-00053T-1v
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oiyR8-0000ee-6k
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:39:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:19530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oiyR5-0006p2-Ey
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665668383; x=1697204383;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=86+QJDT/SSLvPd1nKHl/DgfgqghBBXSGaVbxPPteq8A=;
 b=jx1pe1gDGZnbNP35iLHxdS2ReN05Pcg75Z7ruFK1b+I92+nYTlPe9TB+
 NhOmjsJLArOkN++SahYbD92G1k4rxtTpXirxmisjab9eq3iC2KR47sYZt
 27LeWHbtcg1XoADczZNN34yQ2dp9BDE9dgLPIP/8u7jQL40Btx8pjLiUO
 J2XgAk8Brqb8OTFcyIM02MjpazonvCjoVYOgt8R36ATZ0xsQ8PkhBOjPv
 j3A/+JB0gXqWtiOdGF2NNT2gi7mzREMACq82/2mCzPIL6e6e0a4PBUgFI
 vdItN6Ft68DLgDO30A5fC8R/xpEiQqGvX9Lap0brK6CQ/XCHiUUlQOUL7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="305070775"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="305070775"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 06:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="690114910"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="690114910"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2022 06:39:29 -0700
Date: Thu, 13 Oct 2022 21:34:57 +0800
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
Message-ID: <20221013133457.GA3263142@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <d16284f5-3493-2892-38e6-f1fa5c10bdbb@redhat.com>
 <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 30, 2022 at 05:19:00PM +0100, Fuad Tabba wrote:
> Hi,
> 
> On Tue, Sep 27, 2022 at 11:47 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Sep 26, 2022, Fuad Tabba wrote:
> > > Hi,
> > >
> > > On Mon, Sep 26, 2022 at 3:28 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > > >
> > > > On Fri, Sep 23, 2022 at 04:19:46PM +0100, Fuad Tabba wrote:
> > > > > > Then on the KVM side, its mmap_start() + mmap_end() sequence would:
> > > > > >
> > > > > >   1. Not be supported for TDX or SEV-SNP because they don't allow adding non-zero
> > > > > >      memory into the guest (after pre-boot phase).
> > > > > >
> > > > > >   2. Be mutually exclusive with shared<=>private conversions, and is allowed if
> > > > > >      and only if the entire gfn range of the associated memslot is shared.
> > > > >
> > > > > In general I think that this would work with pKVM. However, limiting
> > > > > private<->shared conversions to the granularity of a whole memslot
> > > > > might be difficult to handle in pKVM, since the guest doesn't have the
> > > > > concept of memslots. For example, in pKVM right now, when a guest
> > > > > shares back its restricted DMA pool with the host it does so at the
> > > > > page-level.
> >
> > Y'all are killing me :-)
> 
>  :D
> 
> > Isn't the guest enlightened?  E.g. can't you tell the guest "thou shalt share at
> > granularity X"?  With KVM's newfangled scalable memslots and per-vCPU MRU slot,
> > X doesn't even have to be that high to get reasonable performance, e.g. assuming
> > the DMA pool is at most 2GiB, that's "only" 1024 memslots, which is supposed to
> > work just fine in KVM.
> 
> The guest is potentially enlightened, but the host doesn't necessarily
> know which memslot the guest might want to share back, since it
> doesn't know where the guest might want to place the DMA pool. If I
> understand this correctly, for this to work, all memslots would need
> to be the same size and sharing would always need to happen at that
> granularity.
> 
> Moreover, for something like a small DMA pool this might scale, but
> I'm not sure about potential future workloads (e.g., multimedia
> in-place sharing).
> 
> >
> > > > > pKVM would also need a way to make an fd accessible again
> > > > > when shared back, which I think isn't possible with this patch.
> > > >
> > > > But does pKVM really want to mmap/munmap a new region at the page-level,
> > > > that can cause VMA fragmentation if the conversion is frequent as I see.
> > > > Even with a KVM ioctl for mapping as mentioned below, I think there will
> > > > be the same issue.
> > >
> > > pKVM doesn't really need to unmap the memory. What is really important
> > > is that the memory is not GUP'able.
> >
> > Well, not entirely unguppable, just unguppable without a magic FOLL_* flag,
> > otherwise KVM wouldn't be able to get the PFN to map into guest memory.
> >
> > The problem is that gup() and "mapped" are tied together.  So yes, pKVM doesn't
> > strictly need to unmap memory _in the untrusted host_, but since mapped==guppable,
> > the end result is the same.
> >
> > Emphasis above because pKVM still needs unmap the memory _somehwere_.  IIUC, the
> > current approach is to do that only in the stage-2 page tables, i.e. only in the
> > context of the hypervisor.  Which is also the source of the gup() problems; the
> > untrusted kernel is blissfully unaware that the memory is inaccessible.
> >
> > Any approach that moves some of that information into the untrusted kernel so that
> > the kernel can protect itself will incur fragmentation in the VMAs.  Well, unless
> > all of guest memory becomes unguppable, but that's likely not a viable option.
> 
> Actually, for pKVM, there is no need for the guest memory to be
> GUP'able at all if we use the new inaccessible_get_pfn().

If pKVM can use inaccessible_get_pfn() to get pfn and can avoid GUP (I
think that is the major concern?), do you see any other gap from
existing API? 

> This of
> course goes back to what I'd mentioned before in v7; it seems that
> representing the memslot memory as a file descriptor should be
> orthogonal to whether the memory is shared or private, rather than a
> private_fd for private memory and the userspace_addr for shared
> memory. The host can then map or unmap the shared/private memory using
> the fd, which allows it more freedom in even choosing to unmap shared
> memory when not needed, for example.

Using both private_fd and userspace_addr is only needed in TDX and other
confidential computing scenarios, pKVM may only use private_fd if the fd
can also be mmaped as a whole to userspace as Sean suggested.

Thanks,
Chao
> 
> Cheers,
> /fuad

