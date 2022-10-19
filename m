Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0B66047AF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:43:59 +0200 (CEST)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9MU-0001dH-Sc
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ol9ES-0003lc-C3
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:35:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:52246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ol9EG-0001uJ-Af
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666186528; x=1697722528;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=4xcGc4T12PBypY/VcZfHNkEly5yZ/s7CT5KUy36zg78=;
 b=jf40zTRqizhCo9fLaRAZCxhDXEMP8J7/OxD/e5o3YN/ijP7yJ+cjGTwS
 RVH5bh7OSeZ6+Q/heRGZ0X1do2KeC3RGaRMFsko7vF40rFw7+2khktlVS
 5Euah44oPvreuAM4ac/93kCtn1uYDEZ+O9sKQV0gCuwoxMtSS7LKotrzy
 HW4DnSo7vyDDVoIp8B/PVD6ojEFWKfRgmr7L49My+u4Hfg08mtFrep1WU
 Ba5c7TsWEmFoKIdqlb9sHZVzrGn1/CS5XNyjXYpTONcaiNCmVaeUTi0j8
 n2fXAscKvTfhqlVxhRjN71Tzpbdp+SGs/qs5tzlLBvuss5BOdhHGLNd1+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="332968522"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="332968522"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 06:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624137726"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="624137726"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 19 Oct 2022 06:35:14 -0700
Date: Wed, 19 Oct 2022 21:30:43 +0800
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
Message-ID: <20221019133043.GB3496045@chaop.bj.intel.com>
References: <Yyi+l3+p9lbBAC4M@google.com>
 <CA+EHjTzy4iOxLF=5UX=s5v6HSB3Nb1LkwmGqoKhp_PAnFeVPSQ@mail.gmail.com>
 <20220926142330.GC2658254@chaop.bj.intel.com>
 <CA+EHjTz5yGhsxUug+wqa9hrBO60Be0dzWeWzX00YtNxin2eYHg@mail.gmail.com>
 <YzN9gYn1uwHopthW@google.com>
 <CA+EHjTw3din891hMUeRW-cn46ktyMWSdoB31pL+zWpXo_=3UVg@mail.gmail.com>
 <20221013133457.GA3263142@chaop.bj.intel.com>
 <CA+EHjTzZ2zsm7Ru_OKCZg9FCYESgZsmB=7ScKRh6ZN4=4OZ3gw@mail.gmail.com>
 <20221017145856.GB3417432@chaop.bj.intel.com>
 <CA+EHjTyiU230am0cuWc7xBBirGocPWGmyqCskhTytA10xpigYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyiU230am0cuWc7xBBirGocPWGmyqCskhTytA10xpigYQ@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 08:05:10PM +0100, Fuad Tabba wrote:
> Hi,
> 
> > > > Using both private_fd and userspace_addr is only needed in TDX and other
> > > > confidential computing scenarios, pKVM may only use private_fd if the fd
> > > > can also be mmaped as a whole to userspace as Sean suggested.
> > >
> > > That does work in practice, for now at least, and is what I do in my
> > > current port. However, the naming and how the API is defined as
> > > implied by the name and the documentation. By calling the field
> > > private_fd, it does imply that it should not be mapped, which is also
> > > what api.rst says in PATCH v8 5/8. My worry is that in that case pKVM
> > > would be mis/ab-using this interface, and that future changes could
> > > cause unforeseen issues for pKVM.
> >
> > That is fairly enough. We can change the naming and the documents.
> >
> > >
> > > Maybe renaming this to something like "guest_fp", and specifying in
> > > the documentation that it can be restricted, e.g., instead of "the
> > > content of the private memory is invisible to userspace" something
> > > along the lines of  "the content of the guest memory may be restricted
> > > to userspace".
> >
> > Some other candidates in my mind:
> > - restricted_fd: to pair with the mm side restricted_memfd
> > - protected_fd: as Sean suggested before
> > - fd: how it's explained relies on the memslot.flag.
> 
> All these sound good, since they all capture the potential use cases.
> Restricted might be the most logical choice if that's going to also
> become the name for the mem_fd.

Thanks, I will use 'restricted' for them. e.g.:
- memfd_restricted() syscall
- restricted_fd
- restricted_offset

The memslot flags will still be KVM_MEM_PRIVATE, since I think pKVM will
create its own one?

Chao
> 
> Thanks,
> /fuad
> 
> > Thanks,
> > Chao
> > >
> > > What do you think?
> > >
> > > Cheers,
> > > /fuad
> > >
> > > >
> > > > Thanks,
> > > > Chao
> > > > >
> > > > > Cheers,
> > > > > /fuad

