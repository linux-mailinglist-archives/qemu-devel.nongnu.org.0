Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AA9598408
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:26:29 +0200 (CEST)
Received: from localhost ([::1]:59356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOfXX-0004lc-Re
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:26:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oOfVo-0003P6-OV
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:24:40 -0400
Received: from mga09.intel.com ([134.134.136.24]:39211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oOfVm-0002mo-4x
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660829078; x=1692365078;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5TUL0pMN1Ch62fh0N5bHXldv3b4lhkGVjVf4Q20K7N8=;
 b=PQhQUz4eTNM3EuBBb1vwfDhlRdUtLQSHtznV3X/CzwZEPf2idsMfyzHG
 /qrYmmIGd3eyor7jfoTYl+czUftQwJcw+OMC8g2B/QvScdxjRIAoZThQ9
 qtKrPHhxpwsBFchKtiYUhhVw8rLWQrI/VCRaSQlA5IZ6NppK6FQjwyEXU
 6hBt9EVKk5nv0R4NYrSwVUKXgnIGf6ecdCTEuHlp/V1Cm67I2JAcJrkTN
 Ifdk3lUsDGYoCJ4agg82cVkzj3grELO2/vgTrzEyuXE+sARgPp93Axwfd
 Ii8Df7lUTPKKUbIX8IC0se56uniHvMPRBTRQT6p1cc3EftFaM8ZWLBwct Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="293545882"
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="293545882"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 06:24:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,246,1654585200"; d="scan'208";a="604253471"
Received: from geigerri-mobl1.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.251.215.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 06:24:24 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 68132104AA0; Thu, 18 Aug 2022 16:24:21 +0300 (+03)
Date: Thu, 18 Aug 2022 16:24:21 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Hugh Dickins <hughd@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
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
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220818132421.6xmjqduempmxnnu2@box>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
> On Wed, 6 Jul 2022, Chao Peng wrote:
> > This is the v7 of this series which tries to implement the fd-based KVM
> > guest private memory.
> 
> Here at last are my reluctant thoughts on this patchset.
> 
> fd-based approach for supporting KVM guest private memory: fine.
> 
> Use or abuse of memfd and shmem.c: mistaken.
> 
> memfd_create() was an excellent way to put together the initial prototype.
> 
> But since then, TDX in particular has forced an effort into preventing
> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
> 
> Are any of the shmem.c mods useful to existing users of shmem.c? No.
> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
> 
> What use do you have for a filesystem here?  Almost none.
> IIUC, what you want is an fd through which QEMU can allocate kernel
> memory, selectively free that memory, and communicate fd+offset+length
> to KVM.  And perhaps an interface to initialize a little of that memory
> from a template (presumably copied from a real file on disk somewhere).
> 
> You don't need shmem.c or a filesystem for that!
> 
> If your memory could be swapped, that would be enough of a good reason
> to make use of shmem.c: but it cannot be swapped; and although there
> are some references in the mailthreads to it perhaps being swappable
> in future, I get the impression that will not happen soon if ever.
> 
> If your memory could be migrated, that would be some reason to use
> filesystem page cache (because page migration happens to understand
> that type of memory): but it cannot be migrated.

Migration support is in pipeline. It is part of TDX 1.5 [1]. And swapping
theoretically possible, but I'm not aware of any plans as of now.

[1] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html

> Some of these impressions may come from earlier iterations of the
> patchset (v7 looks better in several ways than v5).  I am probably
> underestimating the extent to which you have taken on board other
> usages beyond TDX and SEV private memory, and rightly want to serve
> them all with similar interfaces: perhaps there is enough justification
> for shmem there, but I don't see it.  There was mention of userfaultfd
> in one link: does that provide the justification for using shmem?
> 
> I'm afraid of the special demands you may make of memory allocation
> later on - surprised that huge pages are not mentioned already;
> gigantic contiguous extents? secretmem removed from direct map?

The design allows for extension to hugetlbfs if needed. Combination of
MFD_INACCESSIBLE | MFD_HUGETLB should route this way. There should be zero
implications for shmem. It is going to be separate struct memfile_backing_store.

I'm not sure secretmem is a fit here as we want to extend MFD_INACCESSIBLE
to be movable if platform supports it and secretmem is not migratable by
design (without direct mapping fragmentations).

> Here's what I would prefer, and imagine much easier for you to maintain;
> but I'm no system designer, and may be misunderstanding throughout.
> 
> QEMU gets fd from opening /dev/kvm_something, uses ioctls (or perhaps
> the fallocate syscall interface itself) to allocate and free the memory,
> ioctl for initializing some of it too.  KVM in control of whether that
> fd can be read or written or mmap'ed or whatever, no need to prevent it
> in shmem.c, no need for flags, seals, notifications to and fro because
> KVM is already in control and knows the history.  If shmem actually has
> value, call into it underneath - somewhat like SysV SHM, and /dev/zero
> mmap, and i915/gem make use of it underneath.  If shmem has nothing to
> add, just allocate and free kernel memory directly, recorded in your
> own xarray.

I guess shim layer on top of shmem *can* work. I don't see immediately why
it would not. But I'm not sure it is right direction. We risk creating yet
another parallel VM with own rules/locking/accounting that opaque to
core-mm.

Note that on machines that run TDX guests such memory would likely be the
bulk of memory use. Treating it as a fringe case may bite us one day.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

