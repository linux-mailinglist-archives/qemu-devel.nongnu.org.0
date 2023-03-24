Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTP id 628F86C7A1B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 09:43:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfX6G-0001Ly-L0; Thu, 23 Mar 2023 22:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pfX6F-0001Lq-0g
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 22:24:15 -0400
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pfX3L-0002Bb-BT
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 22:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679624475; x=1711160475;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=WC/GKCLsgaUV1To9x+OiRyuA8e2gZbfaT5Wbg90dNqM=;
 b=ZV9YGidz6GodhuTEWQD/B3DcKd9yT/tAFpmLzW36lfuOPFxd3pYDCghL
 NMGrxzR4C9GPAql0QKeEpGOdJEMvunxjeBw9FuD0Q3SWoReDThJWAenXD
 bWacvdFVSbVqeq4Gldfq82zBNa/Y4Gs5Djqq7wgJfIBmlPo9OZb62goG5
 ALha4TtB65YWfli5QO1w+OGLfptHa1cbGqgilILhMTlbE9LQHuKOrE8Kc
 2+qrpZxPn610V2v/SFWUGQxkn9JlBbgfys87QjZ9WTEudlgxl/8mC9uMz
 LqyMqj0k3W8L62fOqEcW2ph3HWgYc/ms8H3RuO4xvNlxDRi7bYilQ+1Cr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338401274"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="338401274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 19:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="746987117"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="746987117"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 19:20:52 -0700
Date: Fri, 24 Mar 2023 10:13:17 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: Sean Christopherson <seanjc@google.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 0/9] KVM: mm: fd-based approach for supporting KVM
Message-ID: <20230324021317.GB2774613@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com>
 <20230119111308.GC2976263@ls.amr.corp.intel.com>
 <Y8lg1G2lRIrI/hld@google.com>
 <20230119223704.GD2976263@ls.amr.corp.intel.com>
 <Y880FiYF7YCtsw/i@google.com>
 <20230213130102.two7q3kkcf254uof@amd.com>
 <20230221121135.GA1595130@chaop.bj.intel.com>
 <20230323012737.7vn4ynsbfz7c2ch4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323012737.7vn4ynsbfz7c2ch4@amd.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Mar 22, 2023 at 08:27:37PM -0500, Michael Roth wrote:
> On Tue, Feb 21, 2023 at 08:11:35PM +0800, Chao Peng wrote:
> > > Hi Sean,
> > > 
> > > We've rebased the SEV+SNP support onto your updated UPM base support
> > > tree and things seem to be working okay, but we needed some fixups on
> > > top of the base support get things working, along with 1 workaround
> > > for an issue that hasn't been root-caused yet:
> > > 
> > >   https://github.com/mdroth/linux/commits/upmv10b-host-snp-v8-wip
> > > 
> > >   *stash (upm_base_support): mm: restrictedmem: Kirill's pinning implementation
> > >   *workaround (use_base_support): mm: restrictedmem: loosen exclusivity check
> > 
> > What I'm seeing is Slot#3 gets added first and then deleted. When it's
> > gets added, Slot#0 already has the same range bound to restrictedmem so
> > trigger the exclusive check. This check is exactly the current code for.
> 
> With the following change in QEMU, we no longer trigger this check:
> 
>   diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
>   index 20da121374..849b5de469 100644
>   --- a/hw/pci-host/q35.c
>   +++ b/hw/pci-host/q35.c
>   @@ -588,9 +588,9 @@ static void mch_realize(PCIDevice *d, Error **errp)
>        memory_region_init_alias(&mch->open_high_smram, OBJECT(mch), "smram-open-high",
>                                 mch->ram_memory, MCH_HOST_BRIDGE_SMRAM_C_BASE,
>                                 MCH_HOST_BRIDGE_SMRAM_C_SIZE);
>   +    memory_region_set_enabled(&mch->open_high_smram, false);
>        memory_region_add_subregion_overlap(mch->system_memory, 0xfeda0000,
>                                            &mch->open_high_smram, 1);
>   -    memory_region_set_enabled(&mch->open_high_smram, false);
> 
> I'm not sure if QEMU is actually doing something wrong here though or if
> this check is putting tighter restrictions on userspace than what was
> expected before. Will look into it more.

I don't think above QEMU change is upstream acceptable. It may break
functionality for 'normal' VMs.

The UPM check does putting tighter restriction, the restriction is that
you can't bind the same fd range to more than one memslot. For SMRAM in
QEMU however, it violates this restriction. The right 'fix' is disabling
SMM in QEMU for UPM usages rather than trying to work around it. There
is more discussion in below link:

  https://lore.kernel.org/all/Y8bOB7VuVIsxoMcn@google.com/

Chao

> 
> > 
> > >   *fixup (upm_base_support): KVM: use inclusive ranges for restrictedmem binding/unbinding
> > >   *fixup (upm_base_support): mm: restrictedmem: use inclusive ranges for issuing invalidations
> > 
> > As many kernel APIs treat 'end' as exclusive, I would rather keep using
> > exclusive 'end' for these APIs(restrictedmem_bind/restrictedmem_unbind
> > and notifier callbacks) but fix it internally in the restrictedmem. E.g.
> > all the places where xarray API needs a 'last'/'max' we use 'end - 1'.
> > See below for the change.
> 
> Yes I did feel like I was fighting the kernel a bit on that; your
> suggestion seems like it would be a better fit.
> 
> > 
> > >   *fixup (upm_base_support): KVM: fix restrictedmem GFN range calculations
> > 
> > Subtracting slot->restrictedmem.index for start/end in
> > restrictedmem_get_gfn_range() is the correct fix.
> > 
> > >   *fixup (upm_base_support): KVM: selftests: CoCo compilation fixes
> > > 
> > > We plan to post an updated RFC for v8 soon, but also wanted to share
> > > the staging tree in case you end up looking at the UPM integration aspects
> > > before then.
> > > 
> > > -Mike
> > 
> > This is the restrictedmem fix to solve 'end' being stored and checked in xarray:
> 
> Looks good.
> 
> Thanks!
> 
> -Mike
> 
> > 
> > --- a/mm/restrictedmem.c
> > +++ b/mm/restrictedmem.c
> > @@ -46,12 +46,12 @@ static long restrictedmem_punch_hole(struct restrictedmem *rm, int mode,
> >          */
> >         down_read(&rm->lock);
> >  
> > -       xa_for_each_range(&rm->bindings, index, notifier, start, end)
> > +       xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
> >                 notifier->ops->invalidate_start(notifier, start, end);
> >  
> >         ret = memfd->f_op->fallocate(memfd, mode, offset, len);
> >  
> > -       xa_for_each_range(&rm->bindings, index, notifier, start, end)
> > +       xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
> >                 notifier->ops->invalidate_end(notifier, start, end);
> >  
> >         up_read(&rm->lock);
> > @@ -224,7 +224,7 @@ static int restricted_error_remove_page(struct address_space *mapping,
> >                 }
> >                 spin_unlock(&inode->i_lock);
> >  
> > -               xa_for_each_range(&rm->bindings, index, notifier, start, end)
> > +               xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
> >                         notifier->ops->error(notifier, start, end);
> >                 break;
> >         }
> > @@ -301,11 +301,12 @@ int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
> >                 if (exclusive != rm->exclusive)
> >                         goto out_unlock;
> >  
> > -               if (exclusive && xa_find(&rm->bindings, &start, end, XA_PRESENT))
> > +               if (exclusive &&
> > +                   xa_find(&rm->bindings, &start, end - 1, XA_PRESENT))
> >                         goto out_unlock;
> >         }
> >  
> > -       xa_store_range(&rm->bindings, start, end, notifier, GFP_KERNEL);
> > +       xa_store_range(&rm->bindings, start, end - 1, notifier, GFP_KERNEL);
> >         rm->exclusive = exclusive;
> >         ret = 0;
> >  out_unlock:
> > @@ -320,7 +321,7 @@ void restrictedmem_unbind(struct file *file, pgoff_t start, pgoff_t end,
> >         struct restrictedmem *rm = file->f_mapping->private_data;
> >  
> >         down_write(&rm->lock);
> > -       xa_store_range(&rm->bindings, start, end, NULL, GFP_KERNEL);
> > +       xa_store_range(&rm->bindings, start, end - 1, NULL, GFP_KERNEL);
> >         synchronize_rcu();
> >         up_write(&rm->lock);
> >  }

