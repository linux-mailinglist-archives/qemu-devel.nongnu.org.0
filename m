Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A69E647DCA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 07:30:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Wsj-0004DZ-2T; Fri, 09 Dec 2022 01:29:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p3Wsg-0004DB-AZ
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 01:29:10 -0500
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p3Wsd-0006NF-PB
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 01:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670567347; x=1702103347;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Tlu8CMGwsT7F5T0zdAfMh3PoUym3LStYGuVUhIigsRU=;
 b=b3znZuxgqtNK36Dt4GtJSyZLvShmra0xpTh5qbVod9OhiUgQOfZtQy0N
 s+8y6lEZuOcWa7qRXbqKa7WNJCbj9qZ1qBUwU5XQdwxkve5cpbnUibLGT
 2iNN8B7JJA+yUwLK8vgt53+yxgRAVUx1apk6H/GIhnUHSUlwvakElysPS
 tTYrS+tFaI+Xh+kTciktUo+qCulQGP3ptXGt0C03yBGARzMjmX8Eu13Ax
 ako47E4jdZpE42CPY90ElGe9CoId6NlJTKvJn9Wwb+nPPJZAZcZeBbNh+
 gDWOOyr1fraN5Gt6TKxp8hTmBNj255YnQOekKaIzn1RDwsSTG8+kMZk+A g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="403646405"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="403646405"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 22:29:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="640921316"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="640921316"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 08 Dec 2022 22:28:50 -0800
Date: Fri, 9 Dec 2022 14:24:31 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Arnd Bergmann <arnd@arndb.de>, Naoya Horiguchi <naoya.horiguchi@nec.com>,
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
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 5/9] KVM: Use gfn instead of hva for mmu_notifier_retry
Message-ID: <20221209062431.GA1342934@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-6-chao.p.peng@linux.intel.com>
 <CA+EHjTy5+Ke_7Uh72p--H9kGcE-PK4EVmp7ym6Q1-PO28u6CCQ@mail.gmail.com>
 <20221206115623.GB1216605@chaop.bj.intel.com>
 <CA+EHjTx3_Vkh9Jb_ZJNi5Xx=O24eM-jpF0gR+UGf9W0ORgNyhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTx3_Vkh9Jb_ZJNi5Xx=O24eM-jpF0gR+UGf9W0ORgNyhQ@mail.gmail.com>
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga05.intel.com
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

On Tue, Dec 06, 2022 at 03:48:50PM +0000, Fuad Tabba wrote:
...
 > >
> > > >          */
> > > > -       if (unlikely(kvm->mmu_invalidate_in_progress) &&
> > > > -           hva >= kvm->mmu_invalidate_range_start &&
> > > > -           hva < kvm->mmu_invalidate_range_end)
> > > > -               return 1;
> > > > +       if (unlikely(kvm->mmu_invalidate_in_progress)) {
> > > > +               /*
> > > > +                * Dropping mmu_lock after bumping mmu_invalidate_in_progress
> > > > +                * but before updating the range is a KVM bug.
> > > > +                */
> > > > +               if (WARN_ON_ONCE(kvm->mmu_invalidate_range_start == INVALID_GPA ||
> > > > +                                kvm->mmu_invalidate_range_end == INVALID_GPA))
> > >
> > > INVALID_GPA is an x86-specific define in
> > > arch/x86/include/asm/kvm_host.h, so this doesn't build on other
> > > architectures. The obvious fix is to move it to
> > > include/linux/kvm_host.h.
> >
> > Hmm, INVALID_GPA is defined as ZERO for x86, not 100% confident this is
> > correct choice for other architectures, but after search it has not been
> > used for other architectures, so should be safe to make it common.

As Yu posted a patch:
https://lore.kernel.org/all/20221209023622.274715-1-yu.c.zhang@linux.intel.com/

There is a GPA_INVALID in include/linux/kvm_types.h and I see ARM has already
been using it so sounds that is exactly what I need.

Chao
> 
> With this fixed,
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> And the necessary work to port to arm64 (on qemu/arm64):
> Tested-by: Fuad Tabba <tabba@google.com>
> 
> Cheers,
> /fuad

