Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FD54D0DC1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:57:26 +0100 (CET)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP6L-0002ut-NP
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:57:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nROvX-0001Sq-8V
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:46:16 -0500
Received: from mga12.intel.com ([192.55.52.136]:3648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1nROvT-0006uW-9e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646703971; x=1678239971;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=mHBCi6qAEBh/nnklYLjjX0eLK1S8y5VX77Z1SPbc3yQ=;
 b=Aq2QDIWcw79S3Lu+GoYzmIQlCE2hvsJ4ydhTOvlrkNJq0z0zk3bzh21h
 CdHXA8hzN8TqrxalYybQqaAdPOkoxVdqCNMM3ZFvUJIdIPgEthDsFlepe
 AqPIPm++I3kw+OaKhiWk93y606EqJo+ggxb8QMcl8erbYdn8Tcy+ohPrZ
 bbNMuAGEzU8oJd0YxesJ8nQMuJXQ4Gv1MXU6zOG0eWsVq46BanyvSugzy
 DVbzmWmfEo8houLetkDemPyUtdYEdrK7+gB6SF7YSZbdOcTepvnnaYkZE
 1QtpjpYFaiRGW25AcDZdBJBrGjTbklq3lnSlsYl8qrglVSszI39xWQDuQ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234513544"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="234513544"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 17:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495276231"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga003.jf.intel.com with ESMTP; 07 Mar 2022 17:46:02 -0800
Date: Tue, 8 Mar 2022 09:45:45 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 03/12] mm: Introduce memfile_notifier
Message-ID: <20220308014545.GA43625@chaop.bj.intel.com>
References: <20220118132121.31388-1-chao.p.peng@linux.intel.com>
 <20220118132121.31388-4-chao.p.peng@linux.intel.com>
 <9ac9a88f-54b4-a49f-0857-c3094d3e0d2b@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ac9a88f-54b4-a49f-0857-c3094d3e0d2b@suse.cz>
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
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 04:42:08PM +0100, Vlastimil Babka wrote:
> On 1/18/22 14:21, Chao Peng wrote:
> > This patch introduces memfile_notifier facility so existing memory file
> > subsystems (e.g. tmpfs/hugetlbfs) can provide memory pages to allow a
> > third kernel component to make use of memory bookmarked in the memory
> > file and gets notified when the pages in the memory file become
> > allocated/invalidated.
> > 
> > It will be used for KVM to use a file descriptor as the guest memory
> > backing store and KVM will use this memfile_notifier interface to
> > interact with memory file subsystems. In the future there might be other
> > consumers (e.g. VFIO with encrypted device memory).
> > 
> > It consists two sets of callbacks:
> >   - memfile_notifier_ops: callbacks for memory backing store to notify
> >     KVM when memory gets allocated/invalidated.
> >   - memfile_pfn_ops: callbacks for KVM to call into memory backing store
> >     to request memory pages for guest private memory.
> > 
> > Userspace is in charge of guest memory lifecycle: it first allocates
> > pages in memory backing store and then passes the fd to KVM and lets KVM
> > register each memory slot to memory backing store via
> > memfile_register_notifier.
> > 
> > The supported memory backing store should maintain a memfile_notifier list
> > and provide routine for memfile_notifier to get the list head address and
> > memfile_pfn_ops callbacks for memfile_register_notifier. It also should call
> > memfile_notifier_fallocate/memfile_notifier_invalidate when the bookmarked
> > memory gets allocated/invalidated.
> > 
> > Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> Process nitpick:
> Here and in patch 4/12 you have Kirill's S-o-b so there should probably be
> also "From: Kirill ..." as was in v3? Or in case you modified the original
> patches so much to become the primary author, you should add
> "Co-developed-by: Kirill ..." here before his S-o-b.

Thanks. 3/12 is vastly rewritten so the latter case can be applied.
4/12 should keep Kirill as the primary author.

Chao

