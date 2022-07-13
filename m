Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DD574058
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 02:07:47 +0200 (CEST)
Received: from localhost ([::1]:38980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBmOQ-0000bt-Ba
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 20:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBmJh-0007S9-Cm
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 20:02:53 -0400
Received: from mga04.intel.com ([192.55.52.120]:57835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBmJf-00060U-K1
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 20:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657756971; x=1689292971;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=26iuG2PU8gROzu7IcUO0TLcA9lykFGbxNWG8zTRrDpg=;
 b=BuSKUe+OG2RoyIHRfoOZdDvEsnOuuQcp41O9EAgr0lt6qz7E86+F9LNN
 t404lcKBBjXJz9aGf9IJmTnwFdyKeYCZyucmiznRQa7MnF2vAl2X5q/gk
 3ati8JI2moVIYQGFALrG2S/2k286Wyk9DICm6PKM0J2PC/FPvHBBDkuoe
 iao9fL3Fr762Prw0PL+izSV7ocxjBInBpzPAIZCgVZ4ZNxsj4YaNbvhlc
 rUNbL/4vuV/ymd+YY4OCwh/wY4z+T1JVlyjb+8akU4QLEu0jxncu/rXL+
 eOjyOI5Le42NOBHF5+d5rINnMSDjdTHb6pySH8G+kUCM/u29nSoxE9glb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="284130338"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="284130338"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 17:02:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593178497"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 13 Jul 2022 17:02:39 -0700
Date: Thu, 14 Jul 2022 07:59:22 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220713235922.GB2881285@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <b1c12a4b-46f7-081b-242f-005a8824aad1@amd.com>
 <20220713075738.GC2831541@chaop.bj.intel.com>
 <13d25d2e-ff79-5762-ddb8-87df56f5cbcf@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d25d2e-ff79-5762-ddb8-87df56f5cbcf@amd.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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

On Wed, Jul 13, 2022 at 12:35:56PM +0200, Gupta, Pankaj wrote:
> 
> > > > This is the v7 of this series which tries to implement the fd-based KVM
> > > > guest private memory. The patches are based on latest kvm/queue branch
> > > > commit:
> > > > 
> > > >     b9b71f43683a (kvm/queue) KVM: x86/mmu: Buffer nested MMU
> > > > split_desc_cache only by default capacity
> > > > 
> > > > Introduction
> > > > ------------
> > > > In general this patch series introduce fd-based memslot which provides
> > > > guest memory through memory file descriptor fd[offset,size] instead of
> > > > hva/size. The fd can be created from a supported memory filesystem
> > > > like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
> > > 
> > > Thinking a bit, As host side fd on tmpfs or shmem will store memory on host
> > > page cache instead of mapping pages into userspace address space. Can we hit
> > > double (un-coordinated) page cache problem with this when guest page cache
> > > is also used?
> > 
> > This is my understanding: in host it will be indeed in page cache (in
> > current shmem implementation) but that's just the way it allocates and
> > provides the physical memory for the guest. In guest, guest OS will not
> > see this fd (absolutely), it only sees guest memory, on top of which it
> > can build its own page cache system for its own file-mapped content but
> > that is unrelated to host page cache.
> 
> yes. If guest fills its page cache with file backed memory, this at host
> side(on shmem fd backend) will also fill the host page cache fast. This can
> have an impact on performance of guest VM's if host goes to memory pressure
> situation sooner. Or else we end up utilizing way less System RAM.

(Currently), the file backed guest private memory is long-term pinned
and not reclaimable, it's in page cache anyway once we allocated it for
guest. This does not depend on how guest use it (e.g. use it for guest
page cache or not). 

Chao
> 
> Thanks,
> Pankaj
> 

