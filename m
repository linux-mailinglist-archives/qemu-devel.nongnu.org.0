Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A6947EB38
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Dec 2021 05:15:37 +0100 (CET)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0bzU-0000SH-1D
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 23:15:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0bxL-00071h-CO
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 23:13:23 -0500
Received: from mga09.intel.com ([134.134.136.24]:1634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n0bxG-00005K-Ow
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 23:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640319198; x=1671855198;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=EsRqF2wL7EbaIGBJmS33K3y/lg8UFHqvEvBQI19Vsxw=;
 b=dnOrdw+Z1ILkHRQDHZeK8XGXdL+Z6qHs/LSu6JdOMR7ErKvAMZJ6jldR
 XuB/iH/1BonfGYnXxTOoTSPTBanHia/DARXVvWiVbG5MfettSP4lBaovf
 lWt1QD8UqnAXoLqauvyj6ILyBRDEbpkut/hsxu/hu4QeUDm9jjBgW7Zrh
 h7orKrFUvrV+4VjTOYefDrQLQOgrEp2DxH3ACfG0zZcvx4x87VfI+RT49
 UJtVsd4vXac4Lba55vZMUfpWZtP30767UaNkUJGpNeZ8NisThVSOhnmsq
 hF26iNPJkCk2dw4vZ6BAjh0W49tBA/cneHTkd2iHJh+B+37FYq7SNduy8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="240726284"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="240726284"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 20:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="664765488"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2021 20:13:08 -0800
Date: Fri, 24 Dec 2021 12:12:31 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 06/16] KVM: Implement fd-based memory using
 MEMFD_OPS interfaces
Message-ID: <20211224041231.GA44042@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-7-chao.p.peng@linux.intel.com>
 <YcTBLpVlETdI8JHi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcTBLpVlETdI8JHi@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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

On Thu, Dec 23, 2021 at 06:34:22PM +0000, Sean Christopherson wrote:
> On Thu, Dec 23, 2021, Chao Peng wrote:
> > diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> > index 03b2ce34e7f4..86655cd660ca 100644
> > --- a/arch/x86/kvm/Kconfig
> > +++ b/arch/x86/kvm/Kconfig
> > @@ -46,6 +46,7 @@ config KVM
> >  	select SRCU
> >  	select INTERVAL_TREE
> >  	select HAVE_KVM_PM_NOTIFIER if PM
> > +	select MEMFD_OPS
> 
> MEMFD_OPS is a weird Kconfig name given that it's not just memfd() that can
> implement the ops.
> 
> >  	help
> >  	  Support hosting fully virtualized guest machines using hardware
> >  	  virtualization extensions.  You will need a fairly recent
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 3bd875f9669f..21f8b1880723 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -806,6 +806,12 @@ static inline void kvm_irqfd_exit(void)
> >  {
> >  }
> >  #endif
> > +
> > +int kvm_memfd_register(struct kvm *kvm, struct kvm_memory_slot *slot);
> > +void kvm_memfd_unregister(struct kvm_memory_slot *slot);
> > +long kvm_memfd_get_pfn(struct kvm_memory_slot *slot, gfn_t gfn, int *order);
> > +void kvm_memfd_put_pfn(kvm_pfn_t pfn);
> > +
> >  int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
> >  		  struct module *module);
> >  void kvm_exit(void);
> > diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
> > index ffdcad3cc97a..8842128d8429 100644
> > --- a/virt/kvm/Makefile.kvm
> > +++ b/virt/kvm/Makefile.kvm
> > @@ -5,7 +5,7 @@
> >  
> >  KVM ?= ../../../virt/kvm
> >  
> > -kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
> > +kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o $(KVM)/memfd.o
> 
> This should be
> 
>    kvm-$(CONFIG_MEMFD_OPS) += $(KVM)/memfd.o
> 
> with stubs provided in a header file as needed.  I also really dislike naming KVM's
> file memfd.c, though I don't have a good alternative off the top of my head.
> 
> >  kvm-$(CONFIG_KVM_VFIO) += $(KVM)/vfio.o
> >  kvm-$(CONFIG_KVM_MMIO) += $(KVM)/coalesced_mmio.o
> >  kvm-$(CONFIG_KVM_ASYNC_PF) += $(KVM)/async_pf.o
> 
> 
> > +#ifdef CONFIG_MEMFD_OPS
> > +static const struct memfd_pfn_ops *memfd_ops;
> 
> memfd_ops needs to be associated with the slot, e.g. userspace should be able to
> map multiple types of a backing stores into a single VM.

I considered this but gave up as I'm not so confident that we will
support other memory backends than memfd in the forthcoming future. 

>This doesn't even allow
> that for multiple VMs, and there are all kinds of ordering issues.

Current memfd kAPI actually returns the same set of callback pointer for
all the VMs. It supports multiple VMs via callback parameter inode,
assume one inode can be associated with only one VM.

> 
> > +void kvm_memfd_unregister(struct kvm_memory_slot *slot)
> > +{
> > +#ifdef CONFIG_MEMFD_OPS
> > +	if (slot->file) {
> > +		fput(slot->file);
> 
> Needs to actually unregister.

Good catch, thanks.
> 
> > +		slot->file = NULL;
> > +	}
> > +#endif
> > +}
> > -- 
> > 2.17.1
> > 

