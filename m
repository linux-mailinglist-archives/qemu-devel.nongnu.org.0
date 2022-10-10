Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FA05F9B2C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:40:30 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohoKr-0001w2-8A
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoGT-0005WC-CX
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:35:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:20651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoGL-0003Qv-Tw
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665390949; x=1696926949;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=RGybB6W0aj8JXJpoXUjKNcVo6czdIa5pC/Wiclkx0F8=;
 b=S1lmQ5AJoFgYp/KpIRMRaVSEUekKKB4h9zyxUuZQToXn2Eoykf/IKBmv
 LpjvNLl3kRIHKBkDvGKbt7x79APyNtA1271kgxTmftWXPzg8/Fgu8jEjN
 /Ms4atuxErSS1MNWFJ9KAVn1Afk5xuURzL2eWr0ucOTiQImKx83xjPHlK
 vOz3ezUb7SQ2E+SeVyijx8XqQeYcs4678d3PIvl+wOZ2b0a/PJ3TPm9UX
 wwxBcFRaZ01ciaSBprpPlYSQrcslA6ri/08p5CxygGKuf8kw/Up+kpORL
 LesFOJAmjekBrrzFhEbFLmBUxKsZ4uE8KXSue9ixMr3Mg3bPsMJjG0WPZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390480918"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390480918"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 01:35:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="656854721"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="656854721"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 01:35:37 -0700
Date: Mon, 10 Oct 2022 16:31:04 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 luto@kernel.org, jun.nakajima@intel.com, dave.hansen@intel.com,
 ak@linux.intel.com, david@redhat.com, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v8 8/8] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20221010083104.GA3145236@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-9-chao.p.peng@linux.intel.com>
 <YzxJYAsIkKhpqeSb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YzxJYAsIkKhpqeSb@kernel.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 05:55:28PM +0300, Jarkko Sakkinen wrote:
> On Thu, Sep 15, 2022 at 10:29:13PM +0800, Chao Peng wrote:
> > Expose KVM_MEM_PRIVATE and memslot fields private_fd/offset to
> > userspace. KVM will register/unregister private memslot to fd-based
> > memory backing store and response to invalidation event from
> > inaccessible_notifier to zap the existing memory mappings in the
> > secondary page table.
> > 
> > Whether KVM_MEM_PRIVATE is actually exposed to userspace is determined
> > by architecture code which can turn on it by overriding the default
> > kvm_arch_has_private_mem().
> > 
> > A 'kvm' reference is added in memslot structure since in
> > inaccessible_notifier callback we can only obtain a memslot reference
> > but 'kvm' is needed to do the zapping.
> > 
> > Co-developed-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> 
> ld: arch/x86/../../virt/kvm/kvm_main.o: in function `kvm_free_memslot':
> kvm_main.c:(.text+0x1385): undefined reference to `inaccessible_unregister_notifier'
> ld: arch/x86/../../virt/kvm/kvm_main.o: in function `kvm_set_memslot':
> kvm_main.c:(.text+0x1b86): undefined reference to `inaccessible_register_notifier'
> ld: kvm_main.c:(.text+0x1c85): undefined reference to `inaccessible_unregister_notifier'
> ld: arch/x86/kvm/mmu/mmu.o: in function `kvm_faultin_pfn':
> mmu.c:(.text+0x1e38): undefined reference to `inaccessible_get_pfn'
> ld: arch/x86/kvm/mmu/mmu.o: in function `direct_page_fault':
> mmu.c:(.text+0x67ca): undefined reference to `inaccessible_put_pfn'
> make: *** [Makefile:1169: vmlinux] Error 1
> 
> I attached kernel config for reproduction.
> 
> The problem is that CONFIG_MEMFD_CREATE does not get enabled:
> 
> mm/Makefile:obj-$(CONFIG_MEMFD_CREATE) += memfd.o memfd_inaccessible.o

Thanks for reporting. Yes there is a dependency issue needs to fix.

Chao


