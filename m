Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A399958EA0F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 11:52:49 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLiOO-0001LJ-FU
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 05:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLiHY-0006EV-3g
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:45:51 -0400
Received: from mga11.intel.com ([192.55.52.93]:1674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oLiHW-00061N-3Z
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 05:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660124742; x=1691660742;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=sBavDjNKIFmd2M6Jg3bF8kVDIymkWHMnSEIr5WIN7a0=;
 b=VtnfMlvENCqCUVPhG79qSyX1jMy4P2ee7kjqPxA2g43k4DAFSLiolif5
 nG7meToaB4bPEs2zo/EjHXuKfrISCNAxuwDeLecv9NqCsK4Vg+dGS9Q1E
 4tRhH7OlUDp7tcGThvCiadMl4gU8Dl510L5WW2y0gFarNupao9D5bCHsh
 ojYP5hE+lvzirnJfhblmvFaG8pw0SwmSQhHGU4rch3Sls6sSk+bspNP5L
 NzVQSacPmBYVrQd1dXVJyxY66qGfmMYfKT/X0OULxYDMw6LhB93N6cm2X
 Z+Kh7I1LxleeAceT+DO1RxaaEsn3aJ/xL87jvtSjLfcLlIAJDXUauyvSh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="288610866"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="288610866"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 02:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; d="scan'208";a="601757857"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 10 Aug 2022 02:45:24 -0700
Date: Wed, 10 Aug 2022 17:40:39 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
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
Message-ID: <20220810094039.GG862421@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-2-chao.p.peng@linux.intel.com>
 <f39c4f63-a511-4beb-b3a4-66589ddb5475@redhat.com>
 <472207cf-ff71-563b-7b66-0c7bea9ea8ad@redhat.com>
 <a2b8fa73-4efd-426f-abcd-7975ff9a7101@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2b8fa73-4efd-426f-abcd-7975ff9a7101@redhat.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
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

On Fri, Aug 05, 2022 at 08:06:03PM +0200, David Hildenbrand wrote:
> On 05.08.22 19:55, Paolo Bonzini wrote:
> > On 7/21/22 11:44, David Hildenbrand wrote:
> >>
> >> Also, I*think*  you can place pages via userfaultfd into shmem. Not
> >> sure if that would count "auto alloc", but it would certainly bypass
> >> fallocate().
> > 
> > Yeah, userfaultfd_register would probably have to forbid this for 
> > F_SEAL_AUTO_ALLOCATE vmas.  Maybe the memfile_node can be reused for 
> > this, adding a new MEMFILE_F_NO_AUTO_ALLOCATE flags?  Then 
> > userfault_register would do something like 
> > memfile_node_get_flags(vma->vm_file) and check the result.
> 
> An alternative is to simply have the shmem allocation fail in a similar
> way. Maybe it does already, I haven't checked (don't think so).

This sounds a better option. We don't need uAPI changes for
userfault_register uAPI but I guess we will still need a KVM uAPI,
either on the memslot or on the whole VM since Roth said this feature
should be optional because some usages may want to disable it for
performance reason. For details please see discussion:
  https://lkml.org/lkml/2022/6/23/1905

Chao
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

