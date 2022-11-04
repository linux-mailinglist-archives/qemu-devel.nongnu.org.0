Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A0061A418
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 23:30:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or5CI-0001KN-3F; Fri, 04 Nov 2022 18:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1or5CG-0001KC-Ec
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:29:56 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1or5CE-0000uT-Kv
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 18:29:56 -0400
Received: by mail-pl1-x635.google.com with SMTP id g24so6148742plq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5Aq/mVWfLwMWGNt8fSCRAZ8qaQX+Rp9/roFUUSHdFcg=;
 b=dKOKOca6Gt2YyKKroo64YoypifXCi0Cnu7uvNh/c1CQKTYDigZb1a5Lc6nfrrUEMI/
 4AE2r5sOnFMf/n4N6rkqJkEinjHy10LPkOYq61AodJoYbUhGCTtIzVhqSoARiYYRtFo/
 EclovTivzigbK81kGBQRDG0qF26K9JY+bLhX0J0qVedsSALXRnsV1mIYQbLUA7RdI4Bl
 F8BWIJWldzMyvETppjo+2Y4ZQDwmlrfV9ZT/zySDdpk9yZyTmfAxbwSHbaM4LwBFWmC7
 KyZY28moUsv5znWRMH9QPRY8B1+WPpJCb1AVkbrC9wmyWUSfTKUMmauuTdOpubCs51OC
 6Y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Aq/mVWfLwMWGNt8fSCRAZ8qaQX+Rp9/roFUUSHdFcg=;
 b=DOV6DwfLGyEf7jhoCppZ1LPhwGfd8EauvBc5h3ADWOqQeNnibDX8LJt3mU801S93ue
 Bo9IlP856IWe6juYqVIrk/6zHHkl7Kzty1Dl8B8YCCkbNb36paQp6js6O4zb+WXl9yuw
 PmxlGAL8mgYWIkEak26otCwpEoZl4b/lYkjXscxwI7/BOCD2raQJdPp7VkiAVh6qX0PQ
 veE+NaviwgjyOf1jelZtDy5SFvBA7L+h4jd7HnCwcqyhX5tdNTt8cCyjXoFJO8GhqxqT
 d1rwVZPI4nXSWlJmFGo1HMJIErdk/n4RW3mqVIUFm8Py4SFpxs9Ngo49U810DH2KDcpv
 G94g==
X-Gm-Message-State: ACrzQf0qaPDyVe8QktqvRL27YPZxMyUtyJLoL4PMqaHPZu7+1/5H+Vud
 AwEX+Vj9lYXsLB0/sZk7hHORUQ==
X-Google-Smtp-Source: AMsMyM6o08bPyM7u13HIMLyxzK/w69wLSfIdjhMYyTpFlvV74UC9l3d3wEgtuR0o04KYkQ2hwL/GmQ==
X-Received: by 2002:a17:903:2645:b0:185:480a:85d2 with SMTP id
 je5-20020a170903264500b00185480a85d2mr37750861plb.144.1667600993126; 
 Fri, 04 Nov 2022 15:29:53 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com.
 [34.168.104.7]) by smtp.gmail.com with ESMTPSA id
 s11-20020a170902ea0b00b0018700ba9090sm237049plg.185.2022.11.04.15.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 15:29:52 -0700 (PDT)
Date: Fri, 4 Nov 2022 22:29:48 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
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
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 4/8] KVM: Use gfn instead of hva for mmu_notifier_retry
Message-ID: <Y2WSXLtcJOpWPtuv@google.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-5-chao.p.peng@linux.intel.com>
 <CA+EHjTySnJTuLB+XoRya6kS_zw2iMahW9-Ze70oKTf+6k0GrGQ@mail.gmail.com>
 <20221104022813.GA4129873@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104022813.GA4129873@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=seanjc@google.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Nov 04, 2022, Chao Peng wrote:
> On Thu, Oct 27, 2022 at 11:29:14AM +0100, Fuad Tabba wrote:
> > Hi,
> > 
> > On Tue, Oct 25, 2022 at 4:19 PM Chao Peng <chao.p.peng@linux.intel.com> wrote:
> > >
> > > Currently in mmu_notifier validate path, hva range is recorded and then
> > > checked against in the mmu_notifier_retry_hva() of the page fault path.
> > > However, for the to be introduced private memory, a page fault may not
> > > have a hva associated, checking gfn(gpa) makes more sense.
> > >
> > > For existing non private memory case, gfn is expected to continue to
> > > work. The only downside is when aliasing multiple gfns to a single hva,
> > > the current algorithm of checking multiple ranges could result in a much
> > > larger range being rejected. Such aliasing should be uncommon, so the
> > > impact is expected small.
> > >
> > > It also fixes a bug in kvm_zap_gfn_range() which has already been using
> > 
> > nit: Now it's kvm_unmap_gfn_range().
> 
> Forgot to mention: the bug is still with kvm_zap_gfn_range(). It calls
> kvm_mmu_invalidate_begin/end with a gfn range but before this series
> kvm_mmu_invalidate_begin/end actually accept a hva range. Note it's
> unrelated to whether we use kvm_zap_gfn_range() or kvm_unmap_gfn_range()
> in the following patch (patch 05).

Grr, in the future, if you find an existing bug, please send a patch.  At the
very least, report the bug.  The APICv case that this was added for could very
well be broken because of this, and the resulting failures would be an absolute
nightmare to debug.

Compile tested only...

--
From: Sean Christopherson <seanjc@google.com>
Date: Fri, 4 Nov 2022 22:20:33 +0000
Subject: [PATCH] KVM: x86/mmu: Block all page faults during
 kvm_zap_gfn_range()

When zapping a GFN range, pass 0 => ALL_ONES for the to-be-invalidated
range to effectively block all page faults while the zap is in-progress.
The invalidation helpers take a host virtual address, whereas zapping a
GFN obviously provides a guest physical address and with the wrong unit
of measurement (frame vs. byte).

Alternatively, KVM could walk all memslots to get the associated HVAs,
but thanks to SMM, that would require multiple lookups.  And practically
speaking, kvm_zap_gfn_range() usage is quite rare and not a hot path,
e.g. MTRR and CR0.CD are almost guaranteed to be done only on vCPU0
during boot, and APICv inhibits are similarly infrequent operations.

Fixes: edb298c663fc ("KVM: x86/mmu: bump mmu notifier count in kvm_zap_gfn_range")
Cc: stable@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6f81539061d6..1ccb769f62af 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6056,7 +6056,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 
 	write_lock(&kvm->mmu_lock);
 
-	kvm_mmu_invalidate_begin(kvm, gfn_start, gfn_end);
+	kvm_mmu_invalidate_begin(kvm, 0, -1ul);
 
 	flush = kvm_rmap_zap_gfn_range(kvm, gfn_start, gfn_end);
 
@@ -6070,7 +6070,7 @@ void kvm_zap_gfn_range(struct kvm *kvm, gfn_t gfn_start, gfn_t gfn_end)
 		kvm_flush_remote_tlbs_with_address(kvm, gfn_start,
 						   gfn_end - gfn_start);
 
-	kvm_mmu_invalidate_end(kvm, gfn_start, gfn_end);
+	kvm_mmu_invalidate_end(kvm, 0, -1ul);
 
 	write_unlock(&kvm->mmu_lock);
 }

base-commit: c12879206e47730ff5ab255bbf625b28ade4028f
-- 


