Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB16531F3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:44:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zNz-0003t1-Fn; Wed, 21 Dec 2022 08:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7zNj-0003qd-94
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:43:39 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7zNh-0002sP-3f
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:43:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671630217; x=1703166217;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=KeOWd+1s5+y+piSUTaodricsl+2xgK/0jmwlSljJARM=;
 b=Oz8pUPLgKCpxAFENmNLR39vm3QTbZ1q3PnAxWXGpb//w5t7hNpJkQKOM
 xWlbOatcY9r7EmbI/mpVwp0OkUS1M5/m5ltiGlLi9FDOEiy59iF+uPx1f
 88U4IOaEalaPfMFrNphxKL6t89NJldVTYELTm9PtEjGV01Xw8ddlcjd0D
 6IGMsg6iI75EcfZZ169952CO5+dNzsFD1vtn7rTCdPsTojjM1KqzVy6g2
 2XYeyRz4xAmlYtUKHx5isH2LL4d63YyRHpH99QFjwHbbNkkGv/hmVRMEm
 QvtFiwS5ZwCBrHzTC679rpCyzvNkefU1NEYDpvtdHIrioNa9gh6FxGrtq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="318567874"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="318567874"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 05:43:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="651401281"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="651401281"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga002.jf.intel.com with ESMTP; 21 Dec 2022 05:43:21 -0800
Date: Wed, 21 Dec 2022 21:39:05 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jmattson@google.com" <jmattson@google.com>,
 "Lutomirski, Andy" <luto@kernel.org>,
 "ak@linux.intel.com" <ak@linux.intel.com>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "Hocko, Michal" <mhocko@suse.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "tabba@google.com" <tabba@google.com>,
 "david@redhat.com" <david@redhat.com>,
 "michael.roth@amd.com" <michael.roth@amd.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "dhildenb@redhat.com" <dhildenb@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "bp@alien8.de" <bp@alien8.de>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "rppt@kernel.org" <rppt@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "vbabka@suse.cz" <vbabka@suse.cz>,
 "mail@maciej.szmigiero.name" <mail@maciej.szmigiero.name>,
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "qperret@google.com" <qperret@google.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vannapurve@google.com" <vannapurve@google.com>,
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
 "Wang, Wei W" <wei.w.wang@intel.com>,
 "steven.price@arm.com" <steven.price@arm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Hansen, Dave" <dave.hansen@intel.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linmiaohe@huawei.com" <linmiaohe@huawei.com>
Subject: Re: [PATCH v10 1/9] mm: Introduce memfd_restricted system call to
 create restricted user memory
Message-ID: <20221221133905.GA1766136@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-2-chao.p.peng@linux.intel.com>
 <5c6e2e516f19b0a030eae9bf073d555c57ca1f21.camel@intel.com>
 <20221219075313.GB1691829@chaop.bj.intel.com>
 <deba096c85e41c3a15d122f2159986a74b16770f.camel@intel.com>
 <20221220072228.GA1724933@chaop.bj.intel.com>
 <126046ce506df070d57e6fe5ab9c92cdaf4cf9b7.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <126046ce506df070d57e6fe5ab9c92cdaf4cf9b7.camel@intel.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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

On Tue, Dec 20, 2022 at 08:33:05AM +0000, Huang, Kai wrote:
> On Tue, 2022-12-20 at 15:22 +0800, Chao Peng wrote:
> > On Mon, Dec 19, 2022 at 08:48:10AM +0000, Huang, Kai wrote:
> > > On Mon, 2022-12-19 at 15:53 +0800, Chao Peng wrote:
> > > > > 
> > > > > [...]
> > > > > 
> > > > > > +
> > > > > > +	/*
> > > > > > +	 * These pages are currently unmovable so don't place them into
> > > > > > movable
> > > > > > +	 * pageblocks (e.g. CMA and ZONE_MOVABLE).
> > > > > > +	 */
> > > > > > +	mapping = memfd->f_mapping;
> > > > > > +	mapping_set_unevictable(mapping);
> > > > > > +	mapping_set_gfp_mask(mapping,
> > > > > > +			     mapping_gfp_mask(mapping) & ~__GFP_MOVABLE);
> > > > > 
> > > > > But, IIUC removing __GFP_MOVABLE flag here only makes page allocation from
> > > > > non-
> > > > > movable zones, but doesn't necessarily prevent page from being migrated.  My
> > > > > first glance is you need to implement either a_ops->migrate_folio() or just
> > > > > get_page() after faulting in the page to prevent.
> > > > 
> > > > The current api restrictedmem_get_page() already does this, after the
> > > > caller calling it, it holds a reference to the page. The caller then
> > > > decides when to call put_page() appropriately.
> > > 
> > > I tried to dig some history. Perhaps I am missing something, but it seems Kirill
> > > said in v9 that this code doesn't prevent page migration, and we need to
> > > increase page refcount in restrictedmem_get_page():
> > > 
> > > https://lore.kernel.org/linux-mm/20221129112139.usp6dqhbih47qpjl@box.shutemov.name/
> > > 
> > > But looking at this series it seems restrictedmem_get_page() in this v10 is
> > > identical to the one in v9 (except v10 uses 'folio' instead of 'page')?
> > 
> > restrictedmem_get_page() increases page refcount several versions ago so
> > no change in v10 is needed. You probably missed my reply:
> > 
> > https://lore.kernel.org/linux-mm/20221129135844.GA902164@chaop.bj.intel.com/
> 
> But for non-restricted-mem case, it is correct for KVM to decrease page's
> refcount after setting up mapping in the secondary mmu, otherwise the page will
> be pinned by KVM for normal VM (since KVM uses GUP to get the page).

That's true. Actually even true for restrictedmem case, most likely we
will still need the kvm_release_pfn_clean() for KVM generic code. On one
side, other restrictedmem users like pKVM may not require page pinning
at all. On the other side, see below.

> 
> So what we are expecting is: for KVM if the page comes from restricted mem, then
> KVM cannot decrease the refcount, otherwise for normal page via GUP KVM should.

I argue that this page pinning (or page migration prevention) is not
tied to where the page comes from, instead related to how the page will
be used. Whether the page is restrictedmem backed or GUP() backed, once
it's used by current version of TDX then the page pinning is needed. So
such page migration prevention is really TDX thing, even not KVM generic
thing (that's why I think we don't need change the existing logic of
kvm_release_pfn_clean()). Wouldn't better to let TDX code (or who
requires that) to increase/decrease the refcount when it populates/drops
the secure EPT entries? This is exactly what the current TDX code does:

get_page():
https://github.com/intel/tdx/blob/kvm-upstream/arch/x86/kvm/vmx/tdx.c#L1217

put_page():
https://github.com/intel/tdx/blob/kvm-upstream/arch/x86/kvm/vmx/tdx.c#L1334

Thanks,
Chao
> 
> > 
> > The current solution is clear: unless we have better approach, we will
> > let restrictedmem user (KVM in this case) to hold the refcount to
> > prevent page migration.
> > 
> 
> OK.  Will leave to others :)
> 

