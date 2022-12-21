Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AFB653209
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zRO-0000ik-To; Wed, 21 Dec 2022 08:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7zRG-0000dX-8k
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:47:19 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7zRE-0003e3-FK
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671630436; x=1703166436;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Ey/uI44qPCpd4ueyxtxDLkQhSghq6Fbj8dB2OhBP0No=;
 b=IMFsZTl1jM8q5Vepef2Mx53Z1OydbQ0FksDeTh6kfVhgVf4drWgFO0i+
 m325odoy/XGNAWWDha9ZYvPY3KA+lqpPqEhD5WMe8oVGx1FnCdvlDzZMx
 Ebt0IqozKQ493fzuLF1ccfSCHpF9jGmrnqURP4aHYfp85FtaYTi0dlLoa
 Fd6mx+lqQ8KuHLZbTip9F6hLcybqIP/tXGC4sDVYep5F5sybo/cYIWXy3
 O17nj6SdnXre3l8TGO0E5zyYFe834QJYgDDJV3Dtk4nRcoOaqYwftQi+N
 SK4nsxCMHzSbJicR2B0bUG4kQtFtqDqXok0nLr8odgpHuTiKQu88yuSk0 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="318568475"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="318568475"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 05:47:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="651402272"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="651402272"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga002.jf.intel.com with ESMTP; 21 Dec 2022 05:47:03 -0800
Date: Wed, 21 Dec 2022 21:42:46 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Miaohe Lin <linmiaohe@huawei.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20221221134246.GB1766136@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y6B27MpZO8o1Asfe@zn.tnic>
 <20221220074318.GC1724933@chaop.bj.intel.com>
 <Y6GGoAVQGPyCaDnS@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6GGoAVQGPyCaDnS@zn.tnic>
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

On Tue, Dec 20, 2022 at 10:55:44AM +0100, Borislav Petkov wrote:
> On Tue, Dec 20, 2022 at 03:43:18PM +0800, Chao Peng wrote:
> > RESTRICTEDMEM is needed by TDX_HOST, not TDX_GUEST.
> 
> Which basically means that RESTRICTEDMEM should simply depend on KVM.
> Because you can't know upfront whether KVM will run a TDX guest or a SNP
> guest and so on.
> 
> Which then means that RESTRICTEDMEM will practically end up always
> enabled in KVM HV configs.

That's right, CONFIG_RESTRICTEDMEM is always selected for supported KVM
architectures (currently x86_64).

> 
> > The only reason to add another HAVE_KVM_RESTRICTED_MEM is some code only
> > works for 64bit[*] and CONFIG_RESTRICTEDMEM is not sufficient to enforce
> > that.
> 
> This is what I mean with "we have too many Kconfig items". :-\

Yes I agree. One way to remove this is probably additionally checking
CONFIG_64BIT instead.

Thanks,
Chao
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette

