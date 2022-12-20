Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB8651B9E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7X1o-0007Ut-FJ; Tue, 20 Dec 2022 02:27:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7X1k-0007RU-CH
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:27:04 -0500
Received: from mga11.intel.com ([192.55.52.93])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7X1i-0006Rt-6X
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:27:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671521222; x=1703057222;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=c7MFanM5OsQxf4mfVMxJdtJD6xfrjMgUk4/0Zk73muk=;
 b=W3zAPN/J3LNOHtNvOE2Hq+tFvYaqCc20+I7LSFLKm30yIKK+3cAdQdsF
 rBhYinx8TUQTjiXlN9RIFVXRrc9zD0ilIkC0mQnPIiwSPJfe1Ii7xh6Xj
 eS+rVMi4Mjr9CwDleuYsiZE5Ov2RZJaj//njAAsmNB48/IFKqRQzqmxIL
 uvMxgCKfg0SzRNjTcrUoexzh6ZfLFSi7TFb4gLDFjEscI8DrpxLMITg9X
 9oqQRGNMZ4DC13huemL1O/NEF+d2KP9LprpwZUhnXIpJlzK95sNJ/M2YA
 vuZOb0Xhq9Hxy3qtgDMyQ1FZZ/ZMB+0f784t/VXkn6LfpnvFvwzcFccSc A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="317184661"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="317184661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 23:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="714332739"
X-IronPort-AV: E=Sophos;i="5.96,258,1665471600"; d="scan'208";a="714332739"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 19 Dec 2022 23:26:44 -0800
Date: Tue, 20 Dec 2022 15:22:28 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Wang, Wei W" <wei.w.wang@intel.com>,
 "jmattson@google.com" <jmattson@google.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tabba@google.com" <tabba@google.com>, "Hocko, Michal" <mhocko@suse.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "vannapurve@google.com" <vannapurve@google.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "qperret@google.com" <qperret@google.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "naoya.horiguchi@nec.com" <naoya.horiguchi@nec.com>,
 "Christopherson,, Sean" <seanjc@google.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "yu.c.zhang@linux.intel.com" <yu.c.zhang@linux.intel.com>,
 "hughd@google.com" <hughd@google.com>,
 "aarcange@redhat.com" <aarcange@redhat.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "jlayton@kernel.org" <jlayton@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linmiaohe@huawei.com" <linmiaohe@huawei.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221220072228.GA1724933@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
 <20221219075313.GB1691829@chaop.bj.intel.com>
 <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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

On Mon, Dec 19, 2022 at 08:48:10AM +0000, Huang, Kai wrote:
> On Mon, 2022-12-19 at 15:53 +0800, Chao Peng wrote:
> > > 
> > > [...]
> > > 
> > > > +
> > > > +	/*
> > > > +	 * These pages are currently unmovable so don't place them into
> > > > movable
> > > > +	 * pageblocks (e.g. CMA and ZONE_MOVABLE).
> > > > +	 */
> > > > +	mapping = memfd->f_mapping;
> > > > +	mapping_set_unevictable(mapping);
> > > > +	mapping_set_gfp_mask(mapping,
> > > > +			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> > > 
> > > But, IIUC removing __GFP_MOVABLE flag here only makes page allocation from
> > > non-
> > > movable zones, but doesn't necessarily prevent page from being migrated.  My
> > > first glance is you need to implement either a_ops->migrate_folio() or just
> > > get_page() after faulting in the page to prevent.
> > 
> > The current api restrictedmem_get_page() already does this, after the
> > caller calling it, it holds a reference to the page. The caller then
> > decides when to call put_page() appropriately.
> 
> I tried to dig some history. Perhaps I am missing something, but it seems Kirill
> said in v9 that this code doesn't prevent page migration, and we need to
> increase page refcount in restrictedmem_get_page():
> 
> https://lore.kernel.org/linux-mm/20221129112139.usp6dqhbih47qpjl@box.shutemov.name/
> 
> But looking at this series it seems restrictedmem_get_page() in this v10 is
> identical to the one in v9 (except v10 uses 'folio' instead of 'page')?

restrictedmem_get_page() increases page refcount several versions ago so
no change in v10 is needed. You probably missed my reply:

https://lore.kernel.org/linux-mm/20221129135844.GA902164@chaop.bj.intel.com/

The current solution is clear: unless we have better approach, we will
let restrictedmem user (KVM in this case) to hold the refcount to
prevent page migration.

Thanks,
Chao
> 
> Anyway if this is not fixed, then it should be fixed.  Otherwise, a comment at
> the place where page refcount is increased will be helpful to help people
> understand page migration is actually prevented.
> 

