Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A01484E44
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 07:19:00 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4zdT-0008MA-I5
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 01:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zZd-0007BI-08
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:15:01 -0500
Received: from mga03.intel.com ([134.134.136.65]:54821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n4zZb-0003JY-BC
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 01:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641363299; x=1672899299;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=PVXfD4lgNSvF8Z6c3fwn5orJ3LA4pnhr3MXcpa5GxpM=;
 b=UKghcWHuAcCU/jcxDrMlhLLypvqgL+sKRODirTvKgAX9vMmtwDayUYWa
 ccrBLJ4dtSatZ6r8sVMDinKXx4//YPcfJQn4VJfcw0qgs44qWBOgzLkde
 wkXE7uNQ/ZC6fEKfBqG5DuEGq79Zd+ruDIsvQWGj1HjH5z0x+Pb+jDsik
 79G5/BN/shuoCH1d5/NveWOf/07cyaAhpCcBORaH8etc93aR5nfwxI1iJ
 WAXfsqmCKllKD5BPZeo0BHEDY/+KUyv4n0O4/fA1fa/xVTdZfjRHYiQDP
 t3dCBuSywfUBSPAGFil2ncwLgULXt16XLO9GKAe6em/2JWy4OtsQ/EYtv w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242335405"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="242335405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 22:14:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="526381831"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 04 Jan 2022 22:14:44 -0800
Date: Wed, 5 Jan 2022 14:14:10 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 11/16] KVM: Add kvm_map_gfn_range
Message-ID: <20220105061410.GA25283@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-12-chao.p.peng@linux.intel.com>
 <YcS6m9CieYaIGA3F@google.com>
 <20211224041351.GB44042@chaop.bj.intel.com>
 <20211231023334.GA7255@chaop.bj.intel.com>
 <YdSEcknuErGe0gQa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdSEcknuErGe0gQa@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 05:31:30PM +0000, Sean Christopherson wrote:
> On Fri, Dec 31, 2021, Chao Peng wrote:
> > On Fri, Dec 24, 2021 at 12:13:51PM +0800, Chao Peng wrote:
> > > On Thu, Dec 23, 2021 at 06:06:19PM +0000, Sean Christopherson wrote:
> > > > On Thu, Dec 23, 2021, Chao Peng wrote:
> > > > > This new function establishes the mapping in KVM page tables for a
> > > > > given gfn range. It can be used in the memory fallocate callback for
> > > > > memfd based memory to establish the mapping for KVM secondary MMU when
> > > > > the pages are allocated in the memory backend.
> > > > 
> > > > NAK, under no circumstance should KVM install SPTEs in response to allocating
> > > > memory in a file.   The correct thing to do is to invalidate the gfn range
> > > > associated with the newly mapped range, i.e. wipe out any shared SPTEs associated
> > > > with the memslot.
> > > 
> > > Right, thanks.
> > 
> > BTW, I think the current fallocate() callback is just useless as long as
> > we don't want to install KVM SPTEs in response to allocating memory in a
> > file. The invalidation of the shared SPTEs should be notified through 
> > mmu_notifier of the shared memory backend, not memfd_notifier of the
> > private memory backend.
> 
> No, because the private fd is the final source of truth as to whether or not a
> GPA is private, e.g. userspace may choose to not unmap the shared backing.
> KVM's rule per Paolo's/this proposoal is that a GPA is private if it has a private
> memslot and is present in the private backing store.  And the other core rule is
> that KVM must never map both the private and shared variants of a GPA into the
> guest.

That's true, but I'm wondering if zapping the shared variant can be
handled at the time when the private one gets mapped in the KVM page
fault. No bothering the backing store to dedicate a callback to tell
KVM.

Chao

