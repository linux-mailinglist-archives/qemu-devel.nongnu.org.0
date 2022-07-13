Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B292F574044
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 01:56:44 +0200 (CEST)
Received: from localhost ([::1]:36438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBmDj-0006nb-8h
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 19:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBmAA-00055H-42
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 19:53:02 -0400
Received: from mga12.intel.com ([192.55.52.136]:19582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oBmA7-0004Rs-9N
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 19:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657756379; x=1689292379;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=d4b95Nutiv+fVkeoTmmbeGdels6G19ALZ7QCpFCTTwc=;
 b=Gy5f1KMcoC3rW0KB7FyywkB0YD/AbAS+QTp1D041LYeZsdXweyOH6YEW
 29bgcb+RwfLX165+rE7RnU0s2+8MfMwKWw92xKBqUUTpqPXIgdnWgwEq9
 0dn6i2GQLR/5hpxooJRAzao0dG5s8Vi6KrYV/O8mngBS/J8hrSCSRFks6
 e3yi9D69vF1Q++zRH82UttQ4cOthf6++zpASlB0IHPGWVErCzWtKTXH7d
 SGzacHnXOExjyi8i/dpi5Hrbd5FV32VRhUc6Z37wt2tlbcpHAlN9t9dM4
 QgvRexaTjD3QkGJLl2gJQ0x3ecEv929qeSFYdU5BDN+lssLjRbfQf4M69 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="265161939"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="265161939"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 16:52:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593176855"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 13 Jul 2022 16:52:20 -0700
Date: Thu, 14 Jul 2022 07:49:03 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 04/14] mm/shmem: Support memfile_notifier
Message-ID: <20220713234903.GA2881285@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-5-chao.p.peng@linux.intel.com>
 <c4112b84-9359-d4c8-1852-0057c074607c@amd.com>
 <20220713074458.GB2831541@chaop.bj.intel.com>
 <74097857-1908-2ff2-1e54-bf7e658ea6c6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74097857-1908-2ff2-1e54-bf7e658ea6c6@amd.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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

On Wed, Jul 13, 2022 at 12:01:13PM +0200, Gupta, Pankaj wrote:
> 
> > > > +#ifdef CONFIG_MIGRATION
> > > > +static int shmem_migrate_page(struct address_space *mapping,
> > > > +			      struct page *newpage, struct page *page,
> > > > +			      enum migrate_mode mode)
> > > > +{
> > > > +	struct inode *inode = mapping->host;
> > > > +	struct shmem_inode_info *info = SHMEM_I(inode);
> > > > +
> > > > +	if (info->memfile_node.flags & MEMFILE_F_UNMOVABLE)
> > > > +		return -EOPNOTSUPP;
> > > > +	return migrate_page(mapping, newpage, page, mode);
> > > 
> > > Wondering how well page migrate would work for private pages
> > > on shmem memfd based backend?
> > 
> >  From high level:
> >    - KVM unset MEMFILE_F_UNMOVABLE bit to indicate it capable of
> >      migrating a page.
> >    - Introduce new 'migrate' callback(s) to memfile_notifier_ops for KVM
> >      to register.
> >    - The callback is hooked to migrate_page() here.
> >    - Once page migration requested, shmem calls into the 'migrate'
> >      callback(s) to perform additional steps for encrypted memory (For
> >      TDX we will call TDH.MEM.PAGE.RELOCATE).
> 
> Yes, that would require additional (protocol specific) handling for private
> pages. Was trying to find where "MEMFILE_F_UNMOVABLE" flag is set currently?

It's set with memfile_register_notifier() in patch 13.

> 
> Thanks,
> Pankaj

