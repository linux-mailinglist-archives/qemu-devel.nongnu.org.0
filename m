Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7067F85E
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 15:04:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLlnO-0001Ou-VC; Sat, 28 Jan 2023 09:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pLlnJ-0001Mm-1o
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:03:04 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pLlnG-00007A-0y
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674914578; x=1706450578;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Kc8vJ3FvU/EJ0EkuHD1xOBQzKplcG7pKfCLj/xSsBkU=;
 b=FJezAQUDux256KIirHdw/42joiMmH3phpNJwYKwjubZtun+xEPAx2682
 msgrvPJQaXe3l5LLgDyBF+9fi0gSkbsgsn98MsCyCLZ3deG/wfmGhXOMN
 rwVh6rMpvte6KNcJYywCmhbz9ZJd5sQjl1Ru36TWs14WCwhk3YQqfOfgd
 HJJvPGacuKUoW2ENPKQrHdHMtEwUYMidiJ1aBNIiVDZVrvXPZvj+9Psej
 yclYPNK3YjokiUOU/g2vcpxoskCQ5Bicef7A02wYD2Ji+NvOKr5PMyEjs
 +/jOby0Gn03OgKju3FFScxSoyjs7VlvJsBe3yhbEUx/42vDF490rAbnXK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391846268"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="391846268"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 06:02:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="908979126"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="908979126"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 06:02:39 -0800
Date: Sat, 28 Jan 2023 21:54:54 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 7/9] KVM: Update lpage info when private/shared
 memory are mixed
Message-ID: <20230128135454.GA700688@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-8-chao.p.peng@linux.intel.com>
 <Y8HmS2iE4u0Gfkrn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8HmS2iE4u0Gfkrn@google.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
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

On Fri, Jan 13, 2023 at 11:16:27PM +0000, Sean Christopherson wrote:
> On Fri, Dec 02, 2022, Chao Peng wrote:
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 9a07380f8d3c..5aefcff614d2 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -12362,6 +12362,8 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
> >  		if ((slot->base_gfn + npages) & (KVM_PAGES_PER_HPAGE(level) - 1))
> >  			linfo[lpages - 1].disallow_lpage = 1;
> >  		ugfn = slot->userspace_addr >> PAGE_SHIFT;
> > +		if (kvm_slot_can_be_private(slot))
> > +			ugfn |= slot->restricted_offset >> PAGE_SHIFT;
> >  		/*
> >  		 * If the gfn and userspace address are not aligned wrt each
> >  		 * other, disable large page support for this slot.
> 
> Forgot to talk about the bug.  This code needs to handle the scenario where a
> memslot is created with existing, non-uniform attributes.  It might be a bit ugly
> (I didn't even try to write the code), but it's definitely possible, and since
> memslot updates are already slow I think it's best to handle things here.
> 
> In the meantime, I added this so we don't forget to fix it before merging.
> 
> #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> 	pr_crit_once("FIXME: Walk the memory attributes of the slot and set the mixed status appropriately");
> #endif

Here is the code to fix (based on your latest github repo).

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index e552374f2357..609ff1cba9c5 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2195,4 +2195,9 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages);
 	 KVM_X86_QUIRK_FIX_HYPERCALL_INSN |	\
 	 KVM_X86_QUIRK_MWAIT_NEVER_UD_FAULTS)
 
+#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
+void kvm_memory_attributes_create_memslot(struct kvm *kvm,
+					  struct kvm_memory_slot *slot);
+#endif
+
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index eda615f3951c..8833d7201e41 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7201,10 +7201,11 @@ static bool has_mixed_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
 	return false;
 }
 
-void kvm_arch_set_memory_attributes(struct kvm *kvm,
-				    struct kvm_memory_slot *slot,
-				    unsigned long attrs,
-				    gfn_t start, gfn_t end)
+static void kvm_update_lpage_mixed_flag(struct kvm *kvm,
+					struct kvm_memory_slot *slot,
+					bool set_attrs,
+					unsigned long attrs,
+					gfn_t start, gfn_t end)
 {
 	unsigned long pages, mask;
 	gfn_t gfn, gfn_end, first, last;
@@ -7231,25 +7232,53 @@ void kvm_arch_set_memory_attributes(struct kvm *kvm,
 		first = start & mask;
 		last = (end - 1) & mask;
 
-		/*
-		 * We only need to scan the head and tail page, for middle pages
-		 * we know they will not be mixed.
-		 */
+		/* head page */
 		gfn = max(first, slot->base_gfn);
 		gfn_end = min(first + pages, slot->base_gfn + slot->npages);
+		if(!set_attrs)
+			attrs = kvm_get_memory_attributes(kvm, gfn);
 		mixed = has_mixed_attrs(kvm, slot, level, attrs, gfn, gfn_end);
 		linfo_update_mixed(gfn, slot, level, mixed);
 
 		if (first == last)
 			return;
 
-		for (gfn = first + pages; gfn < last; gfn += pages)
-			linfo_update_mixed(gfn, slot, level, false);
+		/* middle pages */
+		for (gfn = first + pages; gfn < last; gfn += pages) {
+			if (set_attrs) {
+				mixed = false;
+			} else {
+				gfn_end = gfn + pages;
+				attrs = kvm_get_memory_attributes(kvm, gfn);
+				mixed = has_mixed_attrs(kvm, slot, level, attrs,
+							gfn, gfn_end);
+			}
+			linfo_update_mixed(gfn, slot, level, mixed);
+		}
 
+		/* tail page */
 		gfn = last;
 		gfn_end = min(last + pages, slot->base_gfn + slot->npages);
+		if(!set_attrs)
+			attrs = kvm_get_memory_attributes(kvm, gfn);
 		mixed = has_mixed_attrs(kvm, slot, level, attrs, gfn, gfn_end);
 		linfo_update_mixed(gfn, slot, level, mixed);
 	}
 }
+
+void kvm_arch_set_memory_attributes(struct kvm *kvm,
+				    struct kvm_memory_slot *slot,
+				    unsigned long attrs,
+				    gfn_t start, gfn_t end)
+{
+	kvm_update_lpage_mixed_flag(kvm, slot, true, attrs, start, end);
+}
+
+void kvm_memory_attributes_create_memslot(struct kvm *kvm,
+					  struct kvm_memory_slot *slot)
+{
+
+	kvm_update_lpage_mixed_flag(kvm, slot, false, 0, slot->base_gfn,
+				    slot->base_gfn + slot->npages);
+}
 #endif
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 268c3d16894d..c1074aecf2d0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12443,7 +12443,7 @@ static int kvm_alloc_memslot_metadata(struct kvm *kvm,
 	}
 
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
-	pr_crit_once("FIXME: Walk the memory attributes of the slot and set the mixed status appropriately");
+	kvm_memory_attributes_create_memslot(kvm, slot);
 #endif
 
 	if (kvm_page_track_create_memslot(kvm, slot, npages))

