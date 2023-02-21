Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E15C69E02A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:20:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pURcP-00010D-4S; Tue, 21 Feb 2023 07:19:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pURcL-0000zs-Q8
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:19:34 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pURcI-0000o7-Ju
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676981970; x=1708517970;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=rNp1uu81FPNgOnZRpB88mbF0GVkK0krzknn+hkCEz0w=;
 b=dYD5FZHW5YjatGVvgLFEfAo6MOEfLZoG7AtcyQZuPNBLScSFs4ROjjn1
 s1moH15HG8BkhLv3g7mpb8YN/3aXod7Sw1mdvlKtJaMYN4lFZyYQL6je3
 7p6rosuXuPJi6YaKN/CBiMxnk+Jbl5oZXEJ2e3IuxVGgxhD7E7lKmKbX/
 2JoVE/OJWuyEgnWhKcKq6La6n4abYuO6ExtA7cBcM+YJppWOQ/v/lBxgv
 PBTA+eYx+MRJVUxBWutUwIyXQzf/zMMAuV4+EjfEsf3VON0SkB4F0PfUY
 60BwtpCGs4m1sOmwwscQJcg519CmWfPaRXQN0f7KEnFONYexN/RRV5eKE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="316337817"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="316337817"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 04:19:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="917165304"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="917165304"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by fmsmga006.fm.intel.com with ESMTP; 21 Feb 2023 04:19:16 -0800
Date: Tue, 21 Feb 2023 20:11:35 +0800
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
Message-ID: <20230221121135.GA1595130@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <Y8H5Z3e4hZkFxAVS@google.com>
 <20230119111308.GC2976263@ls.amr.corp.intel.com>
 <Y8lg1G2lRIrI/hld@google.com>
 <20230119223704.GD2976263@ls.amr.corp.intel.com>
 <Y880FiYF7YCtsw/i@google.com>
 <20230213130102.two7q3kkcf254uof@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213130102.two7q3kkcf254uof@amd.com>
Received-SPF: none client-ip=134.134.136.126;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga18.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Hi Sean,
> 
> We've rebased the SEV+SNP support onto your updated UPM base support
> tree and things seem to be working okay, but we needed some fixups on
> top of the base support get things working, along with 1 workaround
> for an issue that hasn't been root-caused yet:
> 
>   https://github.com/mdroth/linux/commits/upmv10b-host-snp-v8-wip
> 
>   *stash (upm_base_support): mm: restrictedmem: Kirill's pinning implementation
>   *workaround (use_base_support): mm: restrictedmem: loosen exclusivity check

What I'm seeing is Slot#3 gets added first and then deleted. When it's
gets added, Slot#0 already has the same range bound to restrictedmem so
trigger the exclusive check. This check is exactly the current code for.

>   *fixup (upm_base_support): KVM: use inclusive ranges for restrictedmem binding/unbinding
>   *fixup (upm_base_support): mm: restrictedmem: use inclusive ranges for issuing invalidations

As many kernel APIs treat 'end' as exclusive, I would rather keep using
exclusive 'end' for these APIs(restrictedmem_bind/restrictedmem_unbind
and notifier callbacks) but fix it internally in the restrictedmem. E.g.
all the places where xarray API needs a 'last'/'max' we use 'end - 1'.
See below for the change.

>   *fixup (upm_base_support): KVM: fix restrictedmem GFN range calculations

Subtracting slot->restrictedmem.index for start/end in
restrictedmem_get_gfn_range() is the correct fix.

>   *fixup (upm_base_support): KVM: selftests: CoCo compilation fixes
> 
> We plan to post an updated RFC for v8 soon, but also wanted to share
> the staging tree in case you end up looking at the UPM integration aspects
> before then.
> 
> -Mike

This is the restrictedmem fix to solve 'end' being stored and checked in xarray:

--- a/mm/restrictedmem.c
+++ b/mm/restrictedmem.c
@@ -46,12 +46,12 @@ static long restrictedmem_punch_hole(struct restrictedmem *rm, int mode,
         */
        down_read(&rm->lock);
 
-       xa_for_each_range(&rm->bindings, index, notifier, start, end)
+       xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
                notifier->ops->invalidate_start(notifier, start, end);
 
        ret = memfd->f_op->fallocate(memfd, mode, offset, len);
 
-       xa_for_each_range(&rm->bindings, index, notifier, start, end)
+       xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
                notifier->ops->invalidate_end(notifier, start, end);
 
        up_read(&rm->lock);
@@ -224,7 +224,7 @@ static int restricted_error_remove_page(struct address_space *mapping,
                }
                spin_unlock(&inode->i_lock);
 
-               xa_for_each_range(&rm->bindings, index, notifier, start, end)
+               xa_for_each_range(&rm->bindings, index, notifier, start, end - 1)
                        notifier->ops->error(notifier, start, end);
                break;
        }
@@ -301,11 +301,12 @@ int restrictedmem_bind(struct file *file, pgoff_t start, pgoff_t end,
                if (exclusive != rm->exclusive)
                        goto out_unlock;
 
-               if (exclusive && xa_find(&rm->bindings, &start, end, XA_PRESENT))
+               if (exclusive &&
+                   xa_find(&rm->bindings, &start, end - 1, XA_PRESENT))
                        goto out_unlock;
        }
 
-       xa_store_range(&rm->bindings, start, end, notifier, GFP_KERNEL);
+       xa_store_range(&rm->bindings, start, end - 1, notifier, GFP_KERNEL);
        rm->exclusive = exclusive;
        ret = 0;
 out_unlock:
@@ -320,7 +321,7 @@ void restrictedmem_unbind(struct file *file, pgoff_t start, pgoff_t end,
        struct restrictedmem *rm = file->f_mapping->private_data;
 
        down_write(&rm->lock);
-       xa_store_range(&rm->bindings, start, end, NULL, GFP_KERNEL);
+       xa_store_range(&rm->bindings, start, end - 1, NULL, GFP_KERNEL);
        synchronize_rcu();
        up_write(&rm->lock);
 }

