Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573B650844
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 08:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7B22-0002Y3-Qr; Mon, 19 Dec 2022 02:57:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B1w-0002XX-4Z
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:57:50 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B1u-0007th-Bk
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 02:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671436666; x=1702972666;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=1plgwk37hmjdXcKtmCG/KoF8dtK3gUMs5OEN6hcYczw=;
 b=i+O9b0f7SpVkI8Wp6pIXm2IktQbB/73N8smPCNTsRtRuomf8/3fsXm4a
 JGhTJx7ShHSyw98J0J4sF2Z5YbzO8OtnDoMv9WprFiMLLpIU43yadgVsI
 CThyFESnYIR5hIxXlBZ5J8PiYaT4Ta3d6Qd64uW1T8RgQSmFZyAuE1W6J
 QHMzVRcfbvQBvV2KCPz6D8uGfGq5WNSg/kEI/9TVUGleqqiOUF9rqk0em
 7K/3pV7gxwRjMITqQBwq0oLp/S/OkGjPHUNV9UZnjK3eX0ePuW4u9QGfL
 2FhRXQ4DrYBdpuLco/SLzmcMZwDB7KtonLRh8a3DGAqwLs64voBxUzFB/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="381520283"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="381520283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 23:57:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="650470073"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="650470073"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga002.jf.intel.com with ESMTP; 18 Dec 2022 23:57:29 -0800
Date: Mon, 19 Dec 2022 15:53:13 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "jmattson@google.com" <jmattson@google.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "tabba@google.com" <tabba@google.com>, "Hocko, Michal" <mhocko@suse.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "vannapurve@google.com" <vannapurve@google.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>, "arnd@arndb.de" <arnd@arndb.de>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "qperret@google.com" <qperret@google.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "hughd@google.com" <hughd@google.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linmiaohe@huawei.com" <linmiaohe@huawei.com>,
 "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221219075313.GB1691829@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
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

On Tue, Dec 13, 2022 at 11:49:13PM +0000, Huang, Kai wrote:
> > 
> > memfd_restricted() itself is implemented as a shim layer on top of real
> > memory file systems (currently tmpfs). Pages in restrictedmem are marked
> > as unmovable and unevictable, this is required for current confidential
> > usage. But in future this might be changed.
> > 
> > 
> I didn't dig full histroy, but I interpret this as we don't support page
> migration and swapping for restricted memfd for now.  IMHO "page marked as
> unmovable" can be confused with PageMovable(), which is a different thing from
> this series.  It's better to just say something like "those pages cannot be
> migrated and swapped".

Yes, if that helps some clarification.

> 
> [...]
> 
> > +
> > +	/*
> > +	 * These pages are currently unmovable so don't place them into movable
> > +	 * pageblocks (e.g. CMA and ZONE_MOVABLE).
> > +	 */
> > +	mapping = memfd->f_mapping;
> > +	mapping_set_unevictable(mapping);
> > +	mapping_set_gfp_mask(mapping,
> > +			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> 
> But, IIUC removing __GFP_MOVABLE flag here only makes page allocation from non-
> movable zones, but doesn't necessarily prevent page from being migrated.  My
> first glance is you need to implement either a_ops->migrate_folio() or just
> get_page() after faulting in the page to prevent.

The current api restrictedmem_get_page() already does this, after the
caller calling it, it holds a reference to the page. The caller then
decides when to call put_page() appropriately.

> 
> So I think the comment also needs improvement -- IMHO we can just call out
> currently those pages cannot be migrated and swapped, which is clearer (and the
> latter justifies mapping_set_unevictable() clearly).

Good to me.

Thanks,
Chao
> 
> 

