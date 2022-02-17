Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCCC4BA2CA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:21:11 +0100 (CET)
Received: from localhost ([::1]:48514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKheg-0006sa-0k
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:21:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKh8Y-00042d-O9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:48:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:41950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nKh8T-0003Bu-HW
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 08:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645105673; x=1676641673;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=00jU+EOCM+jaTdG7EhL3AgRMsoum/qW8+F9FVekDncc=;
 b=l7wKjwJ1K3/AYNP9ipUJpFvWggfl2MnhFDzAjsEcQeZ62/B1xlELhU2m
 hMW33bT9qnD5G0F3WU5fytz8bwv7LZ0HqsYyhRZDW2AFeQELUM9PTns2d
 yzOp30/O4M2s32LFZF7PCQNp4SUpjGFSBfsI3YDFI76FRu74TYc0U6xou
 XtzFTyLsC2QUdBM7ZKegOJRqfsh+/5Bxu9wOHuKR9NR73txOQYh9ifEzT
 m5OMLiJ+z99nmVvCwgaqX8FDp5WfwH9nmix9XvGQxVT+wvb3LA3MNcRIj
 fJplgNr0ALh8evuMjopoLlTA4yfZ59p9Va0+tikM+ImOPyuQCGGCDT6IH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="248471389"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="248471389"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 05:47:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="503514098"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga002.jf.intel.com with ESMTP; 17 Feb 2022 05:47:27 -0800
Date: Thu, 17 Feb 2022 21:47:05 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v4 00/12] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220217134705.GB33836@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <YgK3buC2xes9/lLj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgK3buC2xes9/lLj@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, Sean Christopherson <seanjc@google.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 08, 2022 at 08:33:18PM +0200, Mike Rapoport wrote:
> (addded linux-api)
> 
> On Tue, Jan 18, 2022 at 09:21:09PM +0800, Chao Peng wrote:
> > This is the v4 of this series which try to implement the fd-based KVM
> > guest private memory. The patches are based on latest kvm/queue branch
> > commit:
> > 
> >   fea31d169094 KVM: x86/pmu: Fix available_event_types check for
> >                REF_CPU_CYCLES event
> > 
> > Introduction
> > ------------
> > In general this patch series introduce fd-based memslot which provides
> > guest memory through memory file descriptor fd[offset,size] instead of
> > hva/size. The fd can be created from a supported memory filesystem
> > like tmpfs/hugetlbfs etc. which we refer as memory backing store. KVM
> > and the the memory backing store exchange callbacks when such memslot
> > gets created. At runtime KVM will call into callbacks provided by the
> > backing store to get the pfn with the fd+offset. Memory backing store
> > will also call into KVM callbacks when userspace fallocate/punch hole
> > on the fd to notify KVM to map/unmap secondary MMU page tables.
> > 
> > Comparing to existing hva-based memslot, this new type of memslot allows
> > guest memory unmapped from host userspace like QEMU and even the kernel
> > itself, therefore reduce attack surface and prevent bugs.
> > 
> > Based on this fd-based memslot, we can build guest private memory that
> > is going to be used in confidential computing environments such as Intel
> > TDX and AMD SEV. When supported, the memory backing store can provide
> > more enforcement on the fd and KVM can use a single memslot to hold both
> > the private and shared part of the guest memory. 
> > 
> > mm extension
> > ---------------------
> > Introduces new F_SEAL_INACCESSIBLE for shmem and new MFD_INACCESSIBLE
> > flag for memfd_create(), the file created with these flags cannot read(),
> > write() or mmap() etc via normal MMU operations. The file content can
> > only be used with the newly introduced memfile_notifier extension.
> 
> It would be great to see man page draft for new ABI flags

Yes I can provide the man page.

Thanks,
Chao

