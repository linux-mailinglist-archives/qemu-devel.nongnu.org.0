Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA74821A6
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 03:55:58 +0100 (CET)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n385F-0005AH-1k
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 21:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n383t-0004Rv-8t
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:54:33 -0500
Received: from mga12.intel.com ([192.55.52.136]:53438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1n383q-0008I8-JO
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 21:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640919270; x=1672455270;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=LPcVk7Dhs/psxqqcTf8fKAlDbNnm7Ve0rMtCoM0tbUc=;
 b=UC0cm27VFdLShbisUuRWdPfIaLsK4ycSMgSGeeZ3N3Cx0Mcqtf+DIscX
 0hkxE+6dMa5B1rDmU9wP4gcpi0kZ48QESZwZlvtqGnLJ/9ZQo6hdWeAFV
 iJhe+BaWJdk4CLDnJ3Jz3XMHMwVjAqAwSXPCKnvzJettLdp7eueypLfKc
 Zamjpzn/zyKFfjyJrkH/vGpaYoXnSdEpm9r3yHriOJ4ERLCVlDzLll6+N
 epU1A8i29rc5okHzzjtQrqQRshW6ZRebelB6atvlQwC/cQV86NT8PGjs2
 aUgT92gl+dS7eBwZXLoUn2go16FffOtTJtiOp9EHCrEOCMouKtPSBHjl+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="221760121"
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="221760121"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 18:54:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,250,1635231600"; d="scan'208";a="666710583"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2021 18:54:19 -0800
Date: Fri, 31 Dec 2021 10:53:44 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v3 kvm/queue 04/16] KVM: Extend the memslot to support
 fd-based private memory
Message-ID: <20211231025344.GC7255@chaop.bj.intel.com>
References: <20211223123011.41044-1-chao.p.peng@linux.intel.com>
 <20211223123011.41044-5-chao.p.peng@linux.intel.com>
 <YcSzafzpjMy6m28B@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YcSzafzpjMy6m28B@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Dec 23, 2021 at 05:35:37PM +0000, Sean Christopherson wrote:
> On Thu, Dec 23, 2021, Chao Peng wrote:
> 
> > +	struct file *file;
> 
> Please use more descriptive names, shaving characters is not at all priority.
> 
> > +	u64 ofs;
> 
> I believe this should be loff_t.
> 
> 	struct file *private_file;
> 	struct loff_t private_offset;
> 
> >  };
> >  
> > +static inline bool kvm_slot_is_private(const struct kvm_memory_slot *slot)
> > +{
> > +	if (slot && (slot->flags & KVM_MEM_PRIVATE))
> > +		return true;
> > +	return false;
> 
> 	return slot && (slot->flags & KVM_MEM_PRIVATE);
> 
> > +}
> > +
> >  static inline bool kvm_slot_dirty_track_enabled(const struct kvm_memory_slot *slot)
> >  {
> >  	return slot->flags & KVM_MEM_LOG_DIRTY_PAGES;
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 1daa45268de2..41434322fa23 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -103,6 +103,17 @@ struct kvm_userspace_memory_region {
> >  	__u64 userspace_addr; /* start of the userspace allocated memory */
> >  };
> >  
> > +struct kvm_userspace_memory_region_ext {
> > +	__u32 slot;
> > +	__u32 flags;
> > +	__u64 guest_phys_addr;
> > +	__u64 memory_size; /* bytes */
> > +	__u64 userspace_addr; /* hva */
> 
> Would it make sense to embed "struct kvm_userspace_memory_region"?
> 
> > +	__u64 ofs; /* offset into fd */
> > +	__u32 fd;
> 
> Again, use descriptive names, then comments like "offset into fd" are unnecessary.
> 
> 	__u64 private_offset;
> 	__u32 private_fd;

My original thought is the same fields might be used for shared memslot
as well in future (e.g. there may be another KVM_MEM_* bit can reuse the
same fields for shared slot) so non private-specific name may sound
better. But definitely I have no objection and can use private_* names
for next version unless there is other objection.

Thanks,
Chao
> 
> > +	__u32 padding[5];
> > +};
> > +
> >  /*
> >   * The bit 0 ~ bit 15 of kvm_memory_region::flags are visible for userspace,
> >   * other bits are reserved for kvm internal use which are defined in
> > @@ -110,6 +121,7 @@ struct kvm_userspace_memory_region {
> >   */
> >  #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
> >  #define KVM_MEM_READONLY	(1UL << 1)
> > +#define KVM_MEM_PRIVATE		(1UL << 2)
> >  
> >  /* for KVM_IRQ_LINE */
> >  struct kvm_irq_level {
> > -- 
> > 2.17.1
> > 

