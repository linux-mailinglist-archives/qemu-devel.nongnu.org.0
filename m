Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C610B580052
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:02:51 +0200 (CEST)
Received: from localhost ([::1]:60646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyfZ-0005ub-GF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oFyUi-0004Xl-DH
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:51:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:1751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oFyUc-0006LL-Cj
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 09:51:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658757090; x=1690293090;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=oTuDloTSJTh/mR+M/XiSHbTOyhEzShF3fA4W384Cvww=;
 b=P7yPzQZJnfvnxNCytEFzUIkPaMHWxomjS4Fko8Pop/sT8VwnRbKdC5Qa
 p0qxC7FtTYCuY7n8jFFNMUIjI1FppdWQo/l8+tkqHohv4PXBIkBciLidC
 n/j8GqQb/pkOJKL0CIX9olcAMlaGUBQU3bpL91wEqCp8HmRwCd+hRTwZa
 BJVBwd6iQvYlsezh6BuTdPJfBTFAmVmZX7eDpLp1bq03oiyQQe9yt5puD
 Se0fVooOwxu6TYQmq9g6oktFp82kuXAFp96xb8uIlJAWLXUjggceWP8qS
 HkO/34f2tnlJLXjRua+cmbfRcAsSpIfB/f3Pq0Uc041fXhuGAWN6Y53Qg Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="287712146"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="287712146"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 06:51:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627458071"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2022 06:51:16 -0700
Date: Mon, 25 Jul 2022 21:46:28 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
Message-ID: <20220725134628.GC304216@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <39067d09-b32b-23a6-ae0e-00ac2fe0466c@redhat.com>
 <YtlrJR3uP6940tjd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtlrJR3uP6940tjd@google.com>
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

On Thu, Jul 21, 2022 at 03:05:09PM +0000, Sean Christopherson wrote:
> On Thu, Jul 21, 2022, David Hildenbrand wrote:
> > On 21.07.22 11:44, David Hildenbrand wrote:
> > > On 06.07.22 10:20, Chao Peng wrote:
> > >> Normally, a write to unallocated space of a file or the hole of a sparse
> > >> file automatically causes space allocation, for memfd, this equals to
> > >> memory allocation. This new seal prevents such automatically allocating,
> > >> either this is from a direct write() or a write on the previously
> > >> mmap-ed area. The seal does not prevent fallocate() so an explicit
> > >> fallocate() can still cause allocating and can be used to reserve
> > >> memory.
> > >>
> > >> This is used to prevent unintentional allocation from userspace on a
> > >> stray or careless write and any intentional allocation should use an
> > >> explicit fallocate(). One of the main usecases is to avoid memory double
> > >> allocation for confidential computing usage where we use two memfds to
> > >> back guest memory and at a single point only one memfd is alive and we
> > >> want to prevent memory allocation for the other memfd which may have
> > >> been mmap-ed previously. More discussion can be found at:
> > >>
> > >>   https://lkml.org/lkml/2022/6/14/1255
> > >>
> > >> Suggested-by: Sean Christopherson <seanjc@google.com>
> > >> Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > >> ---
> > >>  include/uapi/linux/fcntl.h |  1 +
> > >>  mm/memfd.c                 |  3 ++-
> > >>  mm/shmem.c                 | 16 ++++++++++++++--
> > >>  3 files changed, 17 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> > >> index 2f86b2ad6d7e..98bdabc8e309 100644
> > >> --- a/include/uapi/linux/fcntl.h
> > >> +++ b/include/uapi/linux/fcntl.h
> > >> @@ -43,6 +43,7 @@
> > >>  #define F_SEAL_GROW	0x0004	/* prevent file from growing */
> > >>  #define F_SEAL_WRITE	0x0008	/* prevent writes */
> > >>  #define F_SEAL_FUTURE_WRITE	0x0010  /* prevent future writes while mapped */
> > >> +#define F_SEAL_AUTO_ALLOCATE	0x0020  /* prevent allocation for writes */
> > > 
> > > Why only "on writes" and not "on reads". IIRC, shmem doesn't support the
> > > shared zeropage, so you'll simply allocate a new page via read() or on
> > > read faults.
> > 
> > Correction: on read() we don't allocate a fresh page. But on read faults
> > we would. So this comment here needs clarification.
> 
> Not just the comment, the code too.  The intent of F_SEAL_AUTO_ALLOCATE is very
> much to block _all_ implicit allocations (or maybe just fault-based allocations
> if "implicit" is too broad of a description).

So maybe still your initial suggestion F_SEAL_FAULT_ALLOCATIONS? One
reason I don't like it is the write() ioctl also cause allocation and we
want to prevent it.

Chao

