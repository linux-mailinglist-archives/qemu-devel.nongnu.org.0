Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987766407E4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p16LP-000356-6U; Fri, 02 Dec 2022 08:44:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1p16LM-00034V-CX
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:44:44 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1p16LK-0008RX-Mo
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669988682; x=1701524682;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=skS3MR2BvQKKKmac1ZclTHHuTXnPM7lSX4PdHSON5iM=;
 b=C7PUexjy9MYPjYzVqb1buwz0KA07O1qAkb7An0AIldlMpmFwYzWVBp9L
 2W3Yhu2GpnnhDWCFaPaZGEJ5rs+bTc3zN07exUe6n5pJlRQDGrLbAurBx
 kEATaLp53TmWiDqxwY+KwwwUgfWXBIDJLu7cFtMqldnB26b80ntnEHeeu
 66dAdO17Tet1S0YdqZ1OkmFHRWdkzEXGdQYyVJmfyYXGKYw5J4kQxVHgw
 gWbahbc7s11W2HqbDyRjL3iRTVo2U0eoaOgF5uSVEDw3CjFBzaiMH7q7A
 XLDVkap4SPl520uxemtW5aytbujBA28x/Ug8sNpTyTPWVzfInagYtWl90 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317102457"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="317102457"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 05:44:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="622704069"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="622704069"
Received: from valeriya-mobl2.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.251.211.234])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 05:44:23 -0800
Received: by box.shutemov.name (Postfix, from userid 1000)
 id EC5D610975F; Fri,  2 Dec 2022 16:44:19 +0300 (+03)
Date: Fri, 2 Dec 2022 16:44:19 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Vlastimil Babka <vbabka@suse.cz>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 tabba@google.com, Michael Roth <michael.roth@amd.com>,
 mhocko@suse.com, Muchun Song <songmuchun@bytedance.com>,
 wei.w.wang@intel.com
Subject: Re: [PATCH v9 1/8] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221202134419.vjhqzuz5alv3v2ak@box.shutemov.name>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-2-chao.p.peng@linux.intel.com>
 <CAGtprH9Qu==pohH9ZSTzX9rZWSO0QWJ9rGK6NRGaiDetWAPLYg@mail.gmail.com>
 <20221202064909.GA1070297@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202064909.GA1070297@chaop.bj.intel.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 02, 2022 at 02:49:09PM +0800, Chao Peng wrote:
> On Thu, Dec 01, 2022 at 06:16:46PM -0800, Vishal Annapurve wrote:
> > On Tue, Oct 25, 2022 at 8:18 AM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> ...
> > > +}
> > > +
> > > +SYSCALL_DEFINE1(memfd_restricted, unsigned int, flags)
> > > +{
> > 
> > Looking at the underlying shmem implementation, there seems to be no
> > way to enable transparent huge pages specifically for restricted memfd
> > files.
> > 
> > Michael discussed earlier about tweaking
> > /sys/kernel/mm/transparent_hugepage/shmem_enabled setting to allow
> > hugepages to be used while backing restricted memfd. Such a change
> > will affect the rest of the shmem usecases as well. Even setting the
> > shmem_enabled policy to "advise" wouldn't help unless file based
> > advise for hugepage allocation is implemented.
> 
> Had a look at fadvise() and looks it does not support HUGEPAGE for any
> filesystem yet.

Yes, I think fadvise() is the right direction here. The problem is similar
to NUMA policy where existing APIs are focused around virtual memory
addresses. We need to extend ABI to take fd+offset as input instead.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

