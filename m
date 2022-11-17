Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D05F62DD27
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 14:48:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfEq-0007lE-5C; Thu, 17 Nov 2022 08:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovfEo-0007l0-GA
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:47:30 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ovfEl-00032o-9k
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 08:47:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668692847; x=1700228847;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=Q9f7oXH6jx2XN9/kuSzGlUsyVFF0nM+veoTgLTKHR8Y=;
 b=A0ifJgAxgq5qM88GJuZlOtnTwwd1SX6OV2BOCeJy1q1ncr2Y+H8CxVay
 eYl2CwrKyq7fH+r4z9zzXOiJpiIK6upqS/mmZPHaLgTtDWYHwrfqRsGqx
 CtZJ/HrEQEBl5r5em0+NiWXkpjA7rdGwZZd0ttfKX1Zp9a1ECVQ4d+dne
 kla9J5ffagTbGsMz97YPzScemjquwA/LE4B5p13mM8xVxY9dKvAjo6dAE
 cerbE8dhLca0vaSZMu7pKihKrrAi1178DegHoGekD7POeV3ZrHFP9htd4
 uAsMzvdUEZkeD75suCJlqMQO5HFQzqU+rp8bzoFb500cbu0Xn1TJ6V+ez A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311556854"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="311556854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="670927116"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="670927116"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 17 Nov 2022 05:47:14 -0800
Date: Thu, 17 Nov 2022 21:42:50 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, kvm list <kvm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, Linux API <linux-api@vger.kernel.org>,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Hugh Dickins <hughd@google.com>,
 Jeff Layton <jlayton@kernel.org>,
 "J . Bruce Fields" <bfields@fieldses.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Andi Kleen <ak@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, aarcange@redhat.com,
 ddutile@redhat.com, dhildenb@redhat.com,
 Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
 Michael Roth <michael.roth@amd.com>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <songmuchun@bytedance.com>, Wei W Wang <wei.w.wang@intel.com>
Subject: Re: [PATCH v9 3/8] KVM: Add KVM_EXIT_MEMORY_FAULT exit
Message-ID: <20221117134250.GC422408@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-4-chao.p.peng@linux.intel.com>
 <2e252f4f-7d45-42ac-a88f-fa8045fe3748@app.fastmail.com>
 <Y3Uwi2lc4NDrdzML@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3Uwi2lc4NDrdzML@google.com>
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

On Wed, Nov 16, 2022 at 06:48:43PM +0000, Sean Christopherson wrote:
> On Wed, Nov 16, 2022, Andy Lutomirski wrote:
> > 
> > 
> > On Tue, Oct 25, 2022, at 8:13 AM, Chao Peng wrote:
> > > diff --git a/Documentation/virt/kvm/api.rst 
> > > b/Documentation/virt/kvm/api.rst
> > > index f3fa75649a78..975688912b8c 100644
> > > --- a/Documentation/virt/kvm/api.rst
> > > +++ b/Documentation/virt/kvm/api.rst
> > > @@ -6537,6 +6537,29 @@ array field represents return values. The 
> > > userspace should update the return
> > >  values of SBI call before resuming the VCPU. For more details on 
> > > RISC-V SBI
> > >  spec refer, https://github.com/riscv/riscv-sbi-doc.
> > > 
> > > +::
> > > +
> > > +		/* KVM_EXIT_MEMORY_FAULT */
> > > +		struct {
> > > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
> > > +			__u32 flags;
> > > +			__u32 padding;
> > > +			__u64 gpa;
> > > +			__u64 size;
> > > +		} memory;
> > > +
> > 
> > Would it make sense to also have a field for the access type (read, write,
> > execute, etc)?  I realize that shared <-> private conversion doesn't strictly
> > need this, but it seems like it could be useful for logging failures and also
> > for avoiding a second immediate fault if the type gets converted but doesn't
> > have the right protection yet.
> 
> I don't think a separate field is necessary, that info can be conveyed via flags.
> Though maybe we should go straight to a u64 for flags.

Yeah, I can do that.

> Hmm, and maybe avoid bits
> 0-3 so that if/when RWX info is conveyed the flags can align with
> PROT_{READ,WRITE,EXEC} and the EPT flags, e.g.

You mean avoiding bits 0-2, right, bit3 is not so special and can be used
for KVM_MEMORY_EXIT_FLAG_PRIVATE.

Chao
> 
> 	KVM_MEMORY_EXIT_FLAG_READ	(1 << 0)
> 	KVM_MEMORY_EXIT_FLAG_WRITE	(1 << 1)
> 	KVM_MEMORY_EXIT_FLAG_EXECUTE	(1 << 2)
> 
> > (Obviously, if this were changed, KVM would need the ability to report that
> > it doesn't actually know the mode.)
> > 
> > --Andy

