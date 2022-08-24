Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCAD59F84B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:02:00 +0200 (CEST)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQo91-0003md-8p
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQnqF-0004V9-FQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:42:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:2295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oQnqD-0002iP-NY
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 06:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661337753; x=1692873753;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=lnG4/IetgJJiCFvYl2XSmHM42xhaifZaMgp7nfdirTE=;
 b=MMZ1CgNIzHY20rjGP+13CPsIS8lEYQu/cO2bpZqNz68YScr/mOalIzZ6
 VToYgGoqsti83PHV3fHtDukjRBFXxnIWakLGKtZZ9sX1ufmwjyJs8hToV
 P1yKgWfiSvB6yot9oXR0aquqrxyG1zSpaZ2CQoHqmhVsorvCtcBnzXzB3
 MwZxx5RXUBb2kz8+hjPnaFXTkKZX2HQxiqEG38TjK5k5A6oo8L3eWQi4I
 RTtDoyoXnwQwqs+57XRGStOgmFZNKLBH+ZGESZFFQyxaOc8MsBDcRYLXC
 4oNjH1UZBK/NoQ6Wl/Gv26yJaxCERkJw0fmDZUyIx35c1r61SASDqp9mo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="357905318"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="357905318"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 03:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="605989312"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 24 Aug 2022 03:42:21 -0700
Date: Wed, 24 Aug 2022 18:37:38 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: kvm list <kvm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, linux-kselftest@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86 <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Hugh Dickins <hughd@google.com>, Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <20220824103738.GA1386620@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
 <CAGtprH9xyw6bt4=RBWF6-v2CSpabOCpKq5rPz+e-9co7EisoVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGtprH9xyw6bt4=RBWF6-v2CSpabOCpKq5rPz+e-9co7EisoVQ@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Aug 19, 2022 at 12:37:42PM -0700, Vishal Annapurve wrote:
> > ...
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 230c8ff9659c..bb714c2a4b06 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -914,6 +914,35 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
> >
> >  #endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
> >
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +#define KVM_MEM_ATTR_PRIVATE   0x0001
> > +static int kvm_vm_ioctl_set_encrypted_region(struct kvm *kvm, unsigned int ioctl,
> > +                                            struct kvm_enc_region *region)
> > +{
> > +       unsigned long start, end;
> > +       void *entry;
> > +       int r;
> > +
> > +       if (region->size == 0 || region->addr + region->size < region->addr)
> > +               return -EINVAL;
> > +       if (region->addr & (PAGE_SIZE - 1) || region->size & (PAGE_SIZE - 1))
> > +               return -EINVAL;
> > +
> > +       start = region->addr >> PAGE_SHIFT;
> > +       end = (region->addr + region->size - 1) >> PAGE_SHIFT;
> > +
> > +       entry = ioctl == KVM_MEMORY_ENCRYPT_REG_REGION ?
> > +                               xa_mk_value(KVM_MEM_ATTR_PRIVATE) : NULL;
> > +
> > +       r = xa_err(xa_store_range(&kvm->mem_attr_array, start, end,
> > +                                       entry, GFP_KERNEL_ACCOUNT));
> 
> xa_store_range seems to create multi-index entries by default.
> Subsequent xa_store_range call changes all the entries stored
> previously.

By using xa_store_range and storing them as multi-index entries I
expected to save some memory for continuous pages originally.

But sounds like the current multi-index store behaviour isn't quite
ready for our usage.

Chao
> xa_store needs to be used here instead of xa_store_range to achieve
> the intended behavior.
> 
> > +
> > +       kvm_zap_gfn_range(kvm, start, end + 1);
> > +
> > +       return r;
> > +}
> > +#endif /* CONFIG_HAVE_KVM_PRIVATE_MEM */
> > +
> > ...

