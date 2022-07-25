Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196558005A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:05:12 +0200 (CEST)
Received: from localhost ([::1]:36890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyhr-0000VE-BY
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oFycC-00048H-Mf
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:59:20 -0400
Received: from mga04.intel.com ([192.55.52.120]:33037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oFycA-0007Sa-Md
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658757558; x=1690293558;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=SebOtSYgmnmuVPxznPkmfUK1/G0u2P5tlySsXcB/PUU=;
 b=GTCKUWo8tUu7OnR0tqR/RJCVcjNpubpotk7J1TEn1IQjygv5xsuPebHb
 BL8zoHVm4YlDF8l3KA7qjzRIPPps4z924TFLiuNRFeTmBBSy4TCeza5N9
 5BQdawnZj9DfGkAjIpDMQiKx+p+4/YRS+sWjDJMcXHiput6Nh++syNsk/
 qyltJ4arBDgFE+xB/xAwoG61aN4aDHKorCWAJpqualb0ao51AF9KlGAlD
 wizPm3nbokq0vTKW5misbyAr2Wfd0o4zKTDORAc2XkGxtCLxplAkmY3F0
 7UOYxNoZI8gb9AMEpQJme9td558i21N39a+PDvOQFr1SWPUAgQummg6PX Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="286461103"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="286461103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 06:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627460234"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2022 06:59:04 -0700
Date: Mon, 25 Jul 2022 21:54:16 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 ak@linux.intel.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 01/14] mm: Add F_SEAL_AUTO_ALLOCATE seal to memfd
Message-ID: <20220725135416.GD304216@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <c59fca89-cd0c-1724-210e-d9b01b375103@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c59fca89-cd0c-1724-210e-d9b01b375103@amd.com>
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

On Thu, Jul 21, 2022 at 12:27:03PM +0200, Gupta, Pankaj wrote:
> 
> > > Normally, a write to unallocated space of a file or the hole of a sparse
> > > file automatically causes space allocation, for memfd, this equals to
> > > memory allocation. This new seal prevents such automatically allocating,
> > > either this is from a direct write() or a write on the previously
> > > mmap-ed area. The seal does not prevent fallocate() so an explicit
> > > fallocate() can still cause allocating and can be used to reserve
> > > memory.
> > > 
> > > This is used to prevent unintentional allocation from userspace on a
> > > stray or careless write and any intentional allocation should use an
> > > explicit fallocate(). One of the main usecases is to avoid memory double
> > > allocation for confidential computing usage where we use two memfds to
> > > back guest memory and at a single point only one memfd is alive and we
> > > want to prevent memory allocation for the other memfd which may have
> > > been mmap-ed previously. More discussion can be found at:
> > > 
> > >    https://lkml.org/lkml/2022/6/14/1255
> > > 
> > > Suggested-by: Sean Christopherson <seanjc@google.com>
> > > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > > ---
> > >   include/uapi/linux/fcntl.h |  1 +
> > >   mm/memfd.c                 |  3 ++-
> > >   mm/shmem.c                 | 16 ++++++++++++++--
> > >   3 files changed, 17 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > > index 2f86b2ad6d7e..98bdabc8e309 100644
> > > --- a/include/uapi/linux/fcntl.h
> > > +++ b/include/uapi/linux/fcntl.h
> > > @@ -43,6 +43,7 @@
> > >   #define F_SEAL_GROW	0x0004	/* prevent file from growing */
> > >   #define F_SEAL_WRITE	0x0008	/* prevent writes */
> > >   #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
> > > +#define F_SEAL_AUTO_ALLOCATE	0x0020  /* prevent allocation for writes */
> > 
> > Why only "on writes" and not "on reads". IIRC, shmem doesn't support the
> > shared zeropage, so you'll simply allocate a new page via read() or on
> > read faults.
> > 
> > 
> > Also, I *think* you can place pages via userfaultfd into shmem. Not sure
> > if that would count "auto alloc", but it would certainly bypass fallocate().
> 
> I was also thinking this at the same time, but for different reason:
> 
> "Want to populate private preboot memory with firmware payload", so was
> thinking userfaulftd could be an option as direct writes are restricted?

If that can be a side effect, I definitely glad to see it, though I'm
still not clear how userfaultfd can be particularly helpful for that.

Chao
> 
> Thanks,
> Pankaj
> 
> 
> 
> 

