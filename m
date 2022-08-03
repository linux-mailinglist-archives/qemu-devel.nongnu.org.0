Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 894CB588A4C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 12:24:53 +0200 (CEST)
Received: from localhost ([::1]:56748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJBYa-0006kF-6g
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 06:24:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJBS2-0002Cv-N7
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:18:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:24330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oJBS0-0007Iq-Lo
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 06:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659521884; x=1691057884;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=wFam+LDcRbKILr0ubXYReeOGRVLmWUy4n8feDpXT4KY=;
 b=cxaeXmovr+oUSgj1TIIUIEJQzPwrv/Fng0HpeVZKGQ9+qDxHi9YSv2yZ
 0F9bdNH2OZ2rzq1oiwXGcs/Ps+f6WX39+B7iIYx/sazU8UT5tKOiOi3H4
 58W7NjHlAXLjelofnXeYj+PeCprHMRZakeFiBpZdwpqfrJqQ1n+HjEsVx
 26U4Cs3zR5SJ9zmntf7dTAa3FDe7MpUqez35fVfn48SF+tfvBfQJE7nQB
 XSPNYQTrx3SqYyEiDgmHEkakv+cojQ6zfYYeDJyP25qD93xgnq+8okx7Z
 B14eybxJzv+3pbFQdWteJAQ65gBJpKuKyTHjBV9Nj2jqogYtzVheJZ9ge A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="270016846"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="270016846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 03:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="631095811"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 03 Aug 2022 03:17:51 -0700
Date: Wed, 3 Aug 2022 18:13:04 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
Subject: Re: [PATCH v7 08/14] KVM: Rename mmu_notifier_*
Message-ID: <20220803101304.GE607465@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-9-chao.p.peng@linux.intel.com>
 <YuQutJAhKWcsrrYl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YuQutJAhKWcsrrYl@google.com>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Reply-To: Chao Peng <chao.p.peng@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 29, 2022 at 07:02:12PM +0000, Sean Christopherson wrote:
> On Wed, Jul 06, 2022, Chao Peng wrote:
> > The sync mechanism between mmu_notifier and page fault handler employs
> > fields mmu_notifier_seq/count and mmu_notifier_range_start/end. For the
> > to be added private memory, there is the same mechanism needed but not
> > rely on mmu_notifier (It uses new introduced memfile_notifier). This
> > patch renames the existing fields and related helper functions to a
> > neutral name mmu_updating_* so private memory can reuse.
> 
> mmu_updating_* is too broad of a term, e.g. page faults and many other operations
> also update the mmu.  Although the name most definitely came from the mmu_notifier,
> it's not completely inaccurate for other sources, e.g. KVM's MMU is still being
> notified of something, even if the source is not the actual mmu_notifier.
> 
> If we really want a different name, I'd vote for nomenclature that captures the
> invalidation aspect, which is really what the variables are all trackng, e.g.
> 
>   mmu_invalidate_seq
>   mmu_invalidate_in_progress
>   mmu_invalidate_range_start
>   mmu_invalidate_range_end

Looks good to me. Thanks.

Chao

