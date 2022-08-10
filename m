Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C95E58EA0A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 11:50:13 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLiLs-0000Ou-Cs
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 05:50:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLiFw-0005Jc-GS
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:44:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:32150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLiFu-0005da-RZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660124642; x=1691660642;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=+g1tHa8U1L0ibLkauTiBh/SeADRVoqwRkL+l6I4l0TE=;
 b=YTMhG42kBGdwiOGbRRLY1DA4QqWOG6X5I8NPz5bFsSFvfID2Qki2CQNO
 IQXN4oZp/NJnu0TIEJdrd5vMj7jEo6Y2RwXltQE5tKzoRWzz9xV/atXsx
 3gC4SfTFRc8i0zKKG7JlCXbnkoVuwpW2yk6IC4U1TrDR4rle0uSNipIcz
 doV2pLJqs3mMbiWoshXmhRrtPO/1FMUwWiG8vfo/jNGlRhZo39JcFpbuE
 PtX5CiZII3xrR5HFKRzPaBQ1MnQ0Lk+rmfBLJ49Bc7+t3z1VlW6CouCUD
 kti+yv5mzB873aa91/T2dXrSSv1rgMfe9qH36qMpYH7spDG0MSekOQIl9 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="316989884"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="316989884"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:43:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="601757538"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 10 Aug 2022 02:43:45 -0700
Date: Wed, 10 Aug 2022 17:38:59 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
Message-ID: <20220810093859.GF862421@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 05, 2022 at 07:55:38PM +0200, Paolo Bonzini wrote:
> On 7/21/22 11:44, David Hildenbrand wrote:
> > 
> > Also, I*think*  you can place pages via userfaultfd into shmem. Not
> > sure if that would count "auto alloc", but it would certainly bypass
> > fallocate().
> 
> Yeah, userfaultfd_register would probably have to forbid this for
> F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for this,
> adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then userfault_register
> would do something like memfile_node_get_flags(vma->vm_file) and check the
> result.

Then we need change userfault_register uAPI for a new property flag.
Userspace should still the decision-maker for this flag.

> 
> This means moving this patch later, after "mm: Introduce memfile_notifier".

Yes, it makes sense now.

Chao
> 
> Thanks,
> 
> Paolo

