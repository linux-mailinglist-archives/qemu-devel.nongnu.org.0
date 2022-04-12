Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527724FE2F2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 15:42:15 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neGmb-0007Td-UP
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGkH-0006Zs-Hp
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:39:49 -0400
Received: from mga12.intel.com ([192.55.52.136]:15603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1neGkF-0001wo-Bj
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 09:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649770787; x=1681306787;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=imgoy6oXMIaQRH/0xG58po19cKwE7PGh6Cx68gmrnn8=;
 b=b8Y6PNaO3m8CZibPI4pIMfMxQow4iIKT6MoPq3lQYTUgIJvBvHOU4kuo
 aL7d0aN+lXwdpPTiZxWm211r2/PKlb7XQCYjaRg/p8pD3fo1D4QO6hH/z
 FjLuHBn/Fikg1WgkmXWOcuIlSgBiaOhdJcVDc01/fNFRYCSx2nxePqFHF
 utgizKeqCoWuKlLACiovypFiyQNcNDTqODuY8TyZJz3BRJgSHLxwrOv7X
 cAswTGUM7Iiv1TjWjJxrH031rAUMhwjtGLg5MyPmS7RJioUiagwoWcG0s
 rmtBgUn7v1zqlT3n5vfZmAMT6gLNoruyAXGXiovvKLOl+j7nhSMgPb0Yw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242317029"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; d="scan'208";a="242317029"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 06:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="590329640"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga001.jf.intel.com with ESMTP; 12 Apr 2022 06:39:36 -0700
Date: Tue, 12 Apr 2022 21:39:25 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v5 04/13] mm/shmem: Restrict MFD_INACCESSIBLE memory
 against RLIMIT_MEMLOCK
Message-ID: <20220412133925.GG8013@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-5-chao.p.peng@linux.intel.com>
 <Yk8L0CwKpTrv3Rg3@google.com>
 <20220411153233.54ljmi7zgqovhgsn@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411153233.54ljmi7zgqovhgsn@box.shutemov.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 11, 2022 at 06:32:33PM +0300, Kirill A. Shutemov wrote:
> On Thu, Apr 07, 2022 at 04:05:36PM +0000, Sean Christopherson wrote:
> > Hmm, shmem_writepage() already handles SHM_F_INACCESSIBLE by rejecting the swap, so
> > maybe it's just the page migration path that needs to be updated?
> 
> My early version prevented migration with -ENOTSUPP for
> address_space_operations::migratepage().
> 
> What's wrong with that approach?

I previously thought migratepage will not be called since we already
marked the pages as UNMOVABLE, sounds not correct?

Thanks,
Chao
> 
> -- 
>  Kirill A. Shutemov

