Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C46645D8B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:19:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wCW-0003hP-Se; Wed, 07 Dec 2022 10:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p2wCV-0003hG-9D
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:19:11 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p2wCT-0001do-N1
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670426349; x=1701962349;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=jSuyaBC+CEdahrEMqj1EGdbe+9W/yLc3hrTCB1EDaSs=;
 b=fZZyXLVY13VF4BLkLl1sHroDxQwU1arr8A4+bdGC1hBRcsuU5h5aEjD/
 1XHFgHuvFGbAxybidIRPxa/F9XkPV7xtSEyB5rA8gTMvYkQRBeoCMeoIt
 5EX62ZgjHOkAyy+Yqe1cxnCFx+TyFRPX/VKZ2rYBwfhHidKMPGr8wHInf
 9MUhWbJu8VA/AqukO2hRnyysG7941qJ/coVZPWXuIxb3WX7dKMPBFlBWl
 z8KMPi8ZryzOARCqhvZQbuki1qxFXa3r2YbLgEu62N6NM9SPXOh7c9H8C
 T/zvPgYg12OYjkBRW/8xoN3eLqI4/yHfxSNFTUb8aSQmJeFhNi/8/ifvw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="343948399"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="343948399"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 07:19:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="710096874"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="710096874"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2022 07:18:57 -0800
Date: Wed, 7 Dec 2022 23:14:37 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Isaku Yamahata <isaku.yamahata@gmail.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
Message-ID: <20221207151437.GF1275553@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-6-chao.p.peng@linux.intel.com>
 <CA+EHjTy5+Ke_7Uh72p--H9kGcE-PK4EVmp7ym6Q1-PO28u6CCQ@mail.gmail.com>
 <20221206115623.GB1216605@chaop.bj.intel.com>
 <20221207063411.GB3632095@ls.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221207063411.GB3632095@ls.amr.corp.intel.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Dec 06, 2022 at 10:34:11PM -0800, Isaku Yamahata wrote:
> On Tue, Dec 06, 2022 at 07:56:23PM +0800,
> Chao Peng <chao.p.peng@linux.intel.com> wrote:
> 
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
> 
> INVALID_GPA is defined as all bit 1.  Please notice "~" (tilde).
> 
> #define INVALID_GPA (~(gpa_t)0)

Thanks for mention. Still looks right moving it to include/linux/kvm_host.h. 
Chao
> -- 
> Isaku Yamahata <isaku.yamahata@gmail.com>

