Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA660AF59
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:45:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyvl-0001iS-Qa; Mon, 24 Oct 2022 10:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1omyvi-0001gk-Qu
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:54 -0400
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kirill.shutemov@linux.intel.com>)
 id 1omyvg-0003hC-CF
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:59:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666623592; x=1698159592;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f12+hDSs2xhh9+cgFUHAQwPz5EdOX4nrGTxSpB9xto8=;
 b=P5i+fMfFm8pHXc5Vn7vbNleR1wl0Bh3KQ3Vdy/g3T2QlsS6L3CFBdaA5
 sXOtjI5vfNW1oMah6Jz5sr+o70+ggP9+Csto207mDMH+IU1hpoNfOF4t1
 ISRc/4TPiXBJQW+OiWG+Z2W2CgzD66liK1I7AkjSbZ5zXE2URwxxRQY05
 Yo+7nVc79hMUZyfQcHwBtf1DswrXiWEkLoOi89RGMb/g15WfRaVuM3mgn
 LnfpQUaS6zcUF+hLIVVhGz49UfivCKOV68u5tGq2IW5meDUEzLe0xjCqx
 gkGl6ptEe5f71UKSDUO7ePYG2oY2KJUfK1/hF5Hrlk6WN1qBfG6e0B12v Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="308531679"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="308531679"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:59:41 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="631284461"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="631284461"
Received: from unisar-mobl.ger.corp.intel.com (HELO box.shutemov.name)
 ([10.249.38.228])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 07:59:30 -0700
Received: by box.shutemov.name (Postfix, from userid 1000)
 id 381A7104D5C; Mon, 24 Oct 2022 17:59:28 +0300 (+03)
Date: Mon, 24 Oct 2022 17:59:28 +0300
From: "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Chao Peng <chao.p.peng@linux.intel.com>,
 Vishal Annapurve <vannapurve@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
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
 Vlastimil Babka <vbabka@suse.cz>,
 Yu Zhang <yu.c.zhang@linux.intel.com>, luto@kernel.org,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 1/8] mm/memfd: Introduce userspace inaccessible memfd
Message-ID: <20221024145928.66uehsokp7bpa2st@box.shutemov.name>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-2-chao.p.peng@linux.intel.com>
 <CAGtprH_MiCxT2xSxD2UrM4M+ghL0V=XEZzEX4Fo5wQKV4fAL4w@mail.gmail.com>
 <20221021134711.GA3607894@chaop.bj.intel.com>
 <Y1LGRvVaWwHS+Zna@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1LGRvVaWwHS+Zna@google.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=kirill.shutemov@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 21, 2022 at 04:18:14PM +0000, Sean Christopherson wrote:
> On Fri, Oct 21, 2022, Chao Peng wrote:
> > > 
> > > In the context of userspace inaccessible memfd, what would be a
> > > suggested way to enforce NUMA memory policy for physical memory
> > > allocation? mbind[1] won't work here in absence of virtual address
> > > range.
> > 
> > How about set_mempolicy():
> > https://www.man7.org/linux/man-pages/man2/set_mempolicy.2.html
> 
> Andy Lutomirski brought this up in an off-list discussion way back when the whole
> private-fd thing was first being proposed.
> 
>   : The current Linux NUMA APIs (mbind, move_pages) work on virtual addresses.  If
>   : we want to support them for TDX private memory, we either need TDX private
>   : memory to have an HVA or we need file-based equivalents. Arguably we should add
>   : fmove_pages and fbind syscalls anyway, since the current API is quite awkward
>   : even for tools like numactl.

Yeah, we definitely have gaps in API wrt NUMA, but I don't think it be
addressed in the initial submission.

BTW, it is not regression comparing to old KVM slots, if the memory is
backed by memfd or other file:

MBIND(2)
       The  specified policy will be ignored for any MAP_SHARED mappings in the
       specified memory range.  Rather the pages will be allocated according to
       the  memory  policy  of the thread that caused the page to be allocated.
       Again, this may not be the thread that called mbind().

It is not clear how to define fbind(2) semantics, considering that multiple
processes may compete for the same region of page cache.

Should it be per-inode or per-fd? Or maybe per-range in inode/fd?

fmove_pages(2) should be relatively straight forward, since it is
best-effort and does not guarantee that the page will note be moved
somewhare else just after return from the syscall.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

