Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5812C59F819
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:45:22 +0200 (CEST)
Received: from localhost ([::1]:58534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnsv-0000vE-Fl
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQmyG-00081y-O5
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:46:50 -0400
Received: from mga02.intel.com ([134.134.136.20]:36038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQmyE-0002aF-6c
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:46:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661334406; x=1692870406;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=8HINI0FFOmHZ98p+KrUxRjOuWiCSe4IMz6bvZat9QRk=;
 b=TFCKUHDmP7spFLL65TJaYRg2KBql3OdV+VwyM3punwRDeT6o3C7btE8b
 Hhut6h4UonulqTVp2JYIC0PfyChZAIAhCebTkPkWf20YkDU8jpj1s3qyv
 KI2kHbVOVCb72g4Xre+haIkLf/Uqv/9MXsi7+u4WEaTo/JlKewaHyE5fQ
 NwhNJpyOb8HlIL36goPmDWGgrYz2u3ZiZJ5Txzrsh3NMpoFpVmUL7nHJi
 lDhhWFVTZQVRXXTZKLVWEaCVTdPhkckX3/mlKyIrgFGAWVyj9jFYY3H6R
 siCPruY45Qrp3HX1Yrecat5TJwUOHJI81MHxMFGWxtr9A0v3X9K2LuAWx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="280895659"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="280895659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 02:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="605977030"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 24 Aug 2022 02:46:32 -0700
Date: Wed, 24 Aug 2022 17:41:49 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@redhat.com>, Hugh Dickins <hughd@google.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-kselftest@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 aarcange@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>,
 "Gupta, Pankaj" <pankaj.gupta@amd.com>
Subject: Re: [PATCH v7 00/14] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20220824094149.GA1383966@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <ff5c5b97-acdf-9745-ebe5-c6609dd6322e@google.com>
 <20220818132421.6xmjqduempmxnnu2@box> <Yv7XTON3MwuC1Q3U@google.com>
 <226ab26d-9aa8-dce2-c7f0-9e3f5b65b63@google.com>
 <b2743a3a-a1b4-2d2e-98be-87b58ad387cf@redhat.com>
 <YwT6x2g9jcMH60LI@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YwT6x2g9jcMH60LI@google.com>
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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

On Tue, Aug 23, 2022 at 04:05:27PM +0000, Sean Christopherson wrote:
> On Tue, Aug 23, 2022, David Hildenbrand wrote:
> > On 19.08.22 05:38, Hugh Dickins wrote:
> > > On Fri, 19 Aug 2022, Sean Christopherson wrote:
> > >> On Thu, Aug 18, 2022, Kirill A . Shutemov wrote:
> > >>> On Wed, Aug 17, 2022 at 10:40:12PM -0700, Hugh Dickins wrote:
> > >>>> On Wed, 6 Jul 2022, Chao Peng wrote:
> > >>>> But since then, TDX in particular has forced an effort into preventing
> > >>>> (by flags, seals, notifiers) almost everything that makes it shmem/tmpfs.
> > >>>>
> > >>>> Are any of the shmem.c mods useful to existing users of shmem.c? No.
> > >>>> Is MFD_INACCESSIBLE useful or comprehensible to memfd_create() users? No.
> > >>
> > >> But QEMU and other VMMs are users of shmem and memfd.  The new features certainly
> > >> aren't useful for _all_ existing users, but I don't think it's fair to say that
> > >> they're not useful for _any_ existing users.
> > > 
> > > Okay, I stand corrected: there exist some users of memfd_create()
> > > who will also have use for "INACCESSIBLE" memory.
> > 
> > As raised in reply to the relevant patch, I'm not sure if we really have
> > to/want to expose MFD_INACCESSIBLE to user space. I feel like this is a
> > requirement of specific memfd_notifer (memfile_notifier) implementations
> > -- such as TDX that will convert the memory and MCE-kill the machine on
> > ordinary write access. We might be able to set/enforce this when
> > registering a notifier internally instead, and fail notifier
> > registration if a condition isn't met (e.g., existing mmap).
> >
> > So I'd be curious, which other users of shmem/memfd would benefit from
> > (MMU)-"INACCESSIBLE" memory obtained via memfd_create()?
> 
> I agree that there's no need to expose the inaccessible behavior via uAPI.  Making
> it a kernel-internal thing that's negotiated/resolved when KVM binds to the fd
> would align INACCESSIBLE with the UNMOVABLE and UNRECLAIMABLE flags (and any other
> flags that get added in the future).
> 
> AFAICT, the user-visible flag is a holdover from the early RFCs and doesn't provide
> any unique functionality.

That's also what I'm thinking. And I don't see problem immediately if
user has populated the fd at the binding time. Actually that looks an
advantage for previously discussed guest payload pre-loading.

> 
> If we go that route, we might want to have shmem/memfd require INACCESSIBLE to be
> set for the initial implementation.  I.e. disallow binding without INACCESSIBLE
> until there's a use case.

I can do that.

Chao

