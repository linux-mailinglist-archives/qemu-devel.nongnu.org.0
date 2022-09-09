Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D905B3AC1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 16:35:08 +0200 (CEST)
Received: from localhost ([::1]:34920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWf63-0006jU-Dp
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 10:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oWf3w-0004rL-CC
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:32:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:16411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1oWf3s-0004Z8-2a
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 10:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662733972; x=1694269972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gVTNsSyIBrhcPs2gtAOglD6dY69wve4jHFwcbsEjqEg=;
 b=m/8PxhpZDeBaUh0AtT1l3n5AHWRYLCShTZ/cyhspqAYkja3y784cU6oC
 NQ+45hOOAPf7yIHfCbcJdeQsF9dWVSMJJGe4sGsD+R28GnoRmRHhFJi9r
 FpxcLkHqQwfFfXKNvw3qPUGq7XSfgqoaCwhdH0eeaEihGmpH9vZMZUxIk
 XRzP7NCqX9imAKgIOdouv90we4ucXpgnByYqzdRonws4VYyMVo71zDOth
 Z1OkDQ5m6GyIlwh76frWvDUhDmeXEbKmNfEYMDit5/9CUuzJ7j/uig4Yp
 nF4XjPmbAY4XeEW999WPzYHwR/Ne27lcJn2b2auP5AUuQcI3iaXEDVxjB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="361441273"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="361441273"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 07:32:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="757619409"
Received: from sumitdes-mobl3.gar.corp.intel.com (HELO box.shutemov.name)
 ([10.249.45.93])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 07:32:39 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id ED94B1037A2; Fri,  9 Sep 2022 17:32:36 +0300 (+03)
Date: Fri, 9 Sep 2022 17:32:36 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
 Hugh Dickins <hughd@google.com>,
 Chao Peng <chao.p.peng@linux.intel.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, jun.nakajima@intel.com,
 dave.hansen@intel.com, ak@linux.intel.com, david@redhat.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220909143236.sznwzkpedldrlnn5@box.shutemov.name>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box>
 <c6ccbb96-5849-2e2f-3b49-4ea711af525d@google.com>
 <20220820002700.6yflrxklmpsavdzi@box.shutemov.name>
 <95bd287b-d17f-fda8-58c9-20700b1e0c72@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95bd287b-d17f-fda8-58c9-20700b1e0c72@kernel.org>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 08, 2022 at 09:48:35PM -0700, Andy Lutomirski wrote:
> On 8/19/22 17:27, Kirill A. Shutemov wrote:
> > On Thu, Aug 18, 2022 at 08:00:41PM -0700, Hugh Dickins wrote:
> > > On Thu, 18 Aug 2022, Kirill A . Shutemov wrote:
> > > > On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
> > > > > 
> > > > > If your memory could be swapped, that would be enough of a good reason
> > > > > to make use of shmem.c: but it cannot be swapped; and although there
> > > > > are some references in the mailthreads to it perhaps being swappable
> > > > > in future, I get the impression that will not happen soon if ever.
> > > > > 
> > > > > If your memory could be migrated, that would be some reason to use
> > > > > filesystem page cache (because page migration happens to understand
> > > > > that type of memory): but it cannot be migrated.
> > > > 
> > > > Migration support is in pipeline. It is part of TDX 1.5 [1]. And swapping
> > > > theoretically possible, but I'm not aware of any plans as of now.
> > > > 
> > > > [1] https://www.intel.com/content/www/us/en/developer/articles/technical/intel-trust-domain-extensions.html
> > > 
> > > I always forget, migration means different things to different audiences.
> > > As an mm person, I was meaning page migration, whereas a virtualization
> > > person thinks VM live migration (which that reference appears to be about),
> > > a scheduler person task migration, an ornithologist bird migration, etc.
> > > 
> > > But you're an mm person too: you may have cited that reference in the
> > > knowledge that TDX 1.5 Live Migration will entail page migration of the
> > > kind I'm thinking of.  (Anyway, it's not important to clarify that here.)
> > 
> > TDX 1.5 brings both.
> > 
> > In TDX speak, mm migration called relocation. See TDH.MEM.PAGE.RELOCATE.
> > 
> 
> This seems to be a pretty bad fit for the way that the core mm migrates
> pages.  The core mm unmaps the page, then moves (in software) the contents
> to a new address, then faults it in.  TDH.MEM.PAGE.RELOCATE doesn't fit into
> that workflow very well.  I'm not saying it can't be done, but it won't just
> work.

Hm. From what I see we have all necessary infrastructure in place.

Unmaping is NOP for inaccessible pages as it is never mapped and we have
mapping->a_ops->migrate_folio() callback that allows to replace software
copying with whatever is needed, like TDH.MEM.PAGE.RELOCATE.

What do I miss?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

