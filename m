Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA2647CAC3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 02:27:12 +0100 (CET)
Received: from localhost ([::1]:48746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzqPP-0006TE-2B
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 20:27:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzqLc-0005VC-A6
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:23:16 -0500
Received: from mga12.intel.com ([192.55.52.136]:19104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mzqLZ-0004de-VC
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 20:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640136193; x=1671672193;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=soai/pmfaSqocLc0zgIUXqg4L+dRY+Q0ibdRNh+8JpM=;
 b=GjTyTXj2fXVY/wccjel7eI8JphjT0ZrOz7B66B+lfFqWIRyMvjt8wHaU
 94Sl4pq1co5i9NrRZQDPtjY9KmlpTk09EH+1dTTpB+zwHEbjsu/Xd9SiL
 27tFI18dIf9GiNM2NrM5U5fif4sDIrGeW4YZYnzbLwf3nEYAZFwN7/Hez
 stiNb487btsiTUZgmV0aTxQqDx16hvGScp0PftRMlN/b/AjRLOnSydgMo
 4EEURkS42UmsbMgEGByKq9oyXl4616onIHm6kz2l5LtVFjcSlHnhhWiqa
 9s6KQz0MwQXqc5IQcaiXf6pfx7x0TJMNT7lXClC0CC3yulRw6/euyuwC6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="220533779"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="220533779"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 17:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="521477368"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 21 Dec 2021 17:23:01 -0800
Date: Wed, 22 Dec 2021 09:22:23 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 00/15] KVM: mm: fd-based approach for supporting KVM
 guest private memory
Message-ID: <20211222012223.GA22448@chaop.bj.intel.com>
References: <20211221151125.19446-1-chao.p.peng@linux.intel.com>
 <YcH2aGNJn57pLihJ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcH2aGNJn57pLihJ@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 21, 2021 at 03:44:40PM +0000, Sean Christopherson wrote:
> On Tue, Dec 21, 2021, Chao Peng wrote:
> > This is the third version of this series which try to implement the
> > fd-based KVM guest private memory.
> 
> ...
> 
> > Test
> > ----
> > This code has been tested with latest TDX code patches hosted at
> > (https://github.com/intel/tdx/tree/kvm-upstream) with minimal TDX
> > adaption and QEMU support.
> > 
> > Example QEMU command line:
> > -object tdx-guest,id=tdx \
> > -object memory-backend-memfd-private,id=ram1,size=2G \
> > -machine q35,kvm-type=tdx,pic=no,kernel_irqchip=split,memory-encryption=tdx,memory-backend=ram1
> > 
> > Changelog
> > ----------
> > v3:
> >   - Added locking protection when calling
> >     invalidate_page_range/fallocate callbacks.
> >   - Changed memslot structure to keep use useraddr for shared memory.
> >   - Re-organized F_SEAL_INACCESSIBLE and MEMFD_OPS.
> >   - Added MFD_INACCESSIBLE flag to force F_SEAL_INACCESSIBLE.
> >   - Commit message improvement.
> >   - Many small fixes for comments from the last version.
> 
> Can you rebase on top of kvm/queue and send a new version?  There's a massive
> overhaul of KVM's memslots code that's queued for 5.17, and the KVM core changes
> in this series conflict mightily.

Sure, will do the rebase and send a new version.

> 
> It's ok if the private memslot support isn't tested exactly as-is, it's not like
> any of us reviewers can test it anyways, but I would like to be able to apply
> cleanly and verify that the series doesn't break existing functionality.

Good, it will ease me if that is acceptable (e.g. test on the relative
new TDX codebase but send out the patch on latest kvm/queue which is not
verified for the new function). This gets rid of the 'chicken and egg'
dependency between this series and TDX patchset.

> 
> This version also appears to be based on an internal development branch, e.g. patch
> 12/15 has some bits from the TDX series.

Right, it's based on latest TDX code https://github.com/intel/tdx/tree/kvm-upstream.
I did this because this is the only way I can test the code. 

Thanks,
Chao
> 
> @@ -336,6 +348,7 @@ struct kvm_tdx_exit {
>  #define KVM_EXIT_X86_BUS_LOCK     33
>  #define KVM_EXIT_XEN              34
>  #define KVM_EXIT_RISCV_SBI        35
> +#define KVM_EXIT_MEMORY_ERROR     36
>  #define KVM_EXIT_TDX              50   /* dump number to avoid conflict. */
> 
>  /* For KVM_EXIT_INTERNAL_ERROR */
> @@ -554,6 +567,8 @@ struct kvm_run {
>                         unsigned long args[6];
>                         unsigned long ret[2];
>                 } riscv_sbi;
> +               /* KVM_EXIT_MEMORY_ERROR */
> +               struct kvm_memory_exit mem;
>                 /* KVM_EXIT_TDX_VMCALL */
>                 struct kvm_tdx_exit tdx;
>                 /* Fix the size of the union. */

