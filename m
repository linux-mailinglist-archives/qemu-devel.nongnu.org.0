Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3166563391F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:55:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxPzx-0001cV-Hk; Tue, 22 Nov 2022 04:55:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oxPzb-0001aL-0W
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:55:05 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oxPzX-0007eS-LT
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:55:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669110899; x=1700646899;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rJIOCd9N5PvCN1hTjd1er2T0b67rVXxGjK1ymZuckrA=;
 b=YYitlHo1mfypVCHMZUGdMb9iGEBfJ0XcNtfP3n8kXmXlwu649LTM4yMs
 pxDBmtHuwW+hstshW4alwZxqwm+SxDeOqD4g0W7DIfqKLvc32J2t13V2x
 j7Vw/jiWkr+DO5m3QAUSNe5vCORfBqZNaBp9E57F4ThF4sIubt+1nWUqB
 LPs1FufvoCfqe9+MQjjrp8HEuPLDvxAvUfymwdXjFuICcTlCRwEJ89d+4
 MGNeMxIXr51qg1kmd0j0zztJyQcAeZqVm844R2e6DpVoI+Imq7krYxZ+r
 eWwFzeB+2DWnhAeXNz5LE+0+dCpGCdxjEln+BX9LzO4meEPT9ogbEnDPh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="375921879"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="375921879"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 01:54:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="635489296"
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; d="scan'208";a="635489296"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 22 Nov 2022 01:54:45 -0800
Date: Tue, 22 Nov 2022 17:50:22 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Alex =?utf-8?B?QmVubu+/vWU=?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
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
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <20221122095022.GA617784@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <87cz9o9mr8.fsf@linaro.org>
 <20221116031441.GA364614@chaop.bj.intel.com>
 <87mt8q90rw.fsf@linaro.org>
 <20221117134520.GD422408@chaop.bj.intel.com>
 <87a64p8vof.fsf@linaro.org>
 <20221118013201.GA456562@chaop.bj.intel.com>
 <87o7t475o7.fsf@linaro.org> <Y3er0M5Rpf1X97W/@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3er0M5Rpf1X97W/@google.com>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 18, 2022 at 03:59:12PM +0000, Sean Christopherson wrote:
> On Fri, Nov 18, 2022, Alex Benn?e wrote:
> > 
> > Chao Peng <chao.p.peng@linux.intel.com> writes:
> > 
> > > On Thu, Nov 17, 2022 at 03:08:17PM +0000, Alex Benn?e wrote:
> > >> >> I think this should be explicit rather than implied by the absence of
> > >> >> another flag. Sean suggested you might want flags for RWX failures so
> > >> >> maybe something like:
> > >> >> 
> > >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_READ	(1 << 0)
> > >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_WRITE	(1 << 1)
> > >> >> 	KVM_MEMORY_EXIT_SHARED_FLAG_EXECUTE	(1 << 2)
> > >> >>         KVM_MEMORY_EXIT_FLAG_PRIVATE            (1 << 3)
> > >> >
> > >> > Yes, but I would not add 'SHARED' to RWX, they are not share memory
> > >> > specific, private memory can also set them once introduced.
> > >> 
> > >> OK so how about:
> > >> 
> > >>  	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
> > >>  	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
> > >>  	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)
> > >>         KVM_MEMORY_EXIT_FLAG_SHARED     (1 << 3)
> > >>         KVM_MEMORY_EXIT_FLAG_PRIVATE    (1 << 4)
> > >
> > > We don't actually need a new bit, the opposite side of private is
> > > shared, i.e. flags with KVM_MEMORY_EXIT_FLAG_PRIVATE cleared expresses
> > > 'shared'.
> > 
> > If that is always true and we never expect a 3rd type of memory that is
> > fine. But given we are leaving room for expansion having an explicit bit
> > allows for that as well as making cases of forgetting to set the flags
> > more obvious.
> 
> Hrm, I'm on the fence.
> 
> A dedicated flag isn't strictly needed, e.g. even if we end up with 3+ types in
> this category, the baseline could always be "private".

The baseline for the current code is actually "shared".

> 
> I do like being explicit, and adding a PRIVATE flag costs KVM practically nothing
> to implement and maintain, but evetually we'll up with flags that are paired with
> an implicit state, e.g. see the many #PF error codes in x86.  In other words,
> inevitably KVM will need to define the default/base state of the access, at which
> point the base state for SHARED vs. PRIVATE is "undefined".  

Current memory conversion for confidential usage is bi-directional so we
already need both private and shared states and if we use one bit for
both "shared" and "private" then we will have to define the default
state, e.g, currently the default state is "shared" when we define

	KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)

> 
> The RWX bits are in the same boat, e.g. the READ flag isn't strictly necessary.
> I was thinking more of the KVM_SET_MEMORY_ATTRIBUTES ioctl(), which does need
> the full RWX gamut, when I typed out that response.

For KVM_SET_MEMORY_ATTRIBUTES it's reasonable to add RWX bits and match
that to the permission bits definition in EPT entry.

> 
> So I would say if we add an explicit READ flag, then we might as well add an explicit
> PRIVATE flag too.  But if we omit PRIVATE, then we should omit READ too.

Since we assume the default state is shared, so we actually only need a
PRIVATE flag, e.g. there is no SHARED flag and will ignore the RWX for now.

Chao

