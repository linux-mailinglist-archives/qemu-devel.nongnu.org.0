Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B571460473B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:35:16 +0200 (CEST)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9E3-00037I-Kh
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ol972-0004sr-GL
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:28:01 -0400
Received: from mga03.intel.com ([134.134.136.65]:16791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ol96w-0000SZ-A0
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666186074; x=1697722074;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=maPvHabENdJbu0SifYloWSh+XeE9JeazxOD/pHHB/rU=;
 b=DqQyfFkYeErBEE8vUHOyIAY602ooxHhGxv0iIVKnSznX7koOQRELN9vl
 2gANSFkm8xMrXrnZYwIEpXEVLxRfxK9lM5Cr6j1Rq9G3IjShaBFI0oQzS
 Q0kbkG4SeYPHHCsbuHVo9S+eTpd1L4H7MCqhp8+STb1K5b3/gjnSSn3gW
 0E6xdCN2yrNvrX2qGEPDDWfEKi3aaULWuK2H7nx4/PkIPNwwCKW0vzolu
 jOBFLkHdMPgVTOvZ5KuctPIVzby1uOnqnIyxoY0VeEa9pixQWFvB66/HZ
 1cs8IiSijBvWncG/zzRLAUPdwo0U5E8Sf14Vjder70ytEev75ToGuxStG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="308094844"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="308094844"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 06:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624134706"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="624134706"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 19 Oct 2022 06:27:39 -0700
Date: Wed, 19 Oct 2022 21:23:08 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v8 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <20221019132308.GA3496045@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-6-chao.p.peng@linux.intel.com>
 <CA+EHjTxukqBfaN6D+rPOiX83zkGknHEQ16J0k6GQSdL_-e9C6g@mail.gmail.com>
 <20221012023516.GA3218049@chaop.bj.intel.com>
 <CA+EHjTyGyGL+ox81=jdtoHERtHPV=P7wJub=3j7chdijyq-AgA@mail.gmail.com>
 <Y03UiYYioV+FQIpx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y03UiYYioV+FQIpx@google.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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

On Mon, Oct 17, 2022 at 10:17:45PM +0000, Sean Christopherson wrote:
> On Mon, Oct 17, 2022, Fuad Tabba wrote:
> > Hi,
> > 
> > > > > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > > > > +#define KVM_MEM_ATTR_SHARED    0x0001
> > > > > +static int kvm_vm_ioctl_set_mem_attr(struct kvm *kvm, gpa_t gpa, gpa_t size,
> > > > > +                                    bool is_private)
> > > > > +{
> > > >
> > > > I wonder if this ioctl should be implemented as an arch-specific
> > > > ioctl. In this patch it performs some actions that pKVM might not need
> > > > or might want to do differently.
> > >
> > > I think it's doable. We can provide the mem_attr_array kind thing in
> > > common code and let arch code decide to use it or not. Currently
> > > mem_attr_array is defined in the struct kvm, if those bytes are
> > > unnecessary for pKVM it can even be moved to arch definition, but that
> > > also loses the potential code sharing for confidential usages in other
> > > non-architectures, e.g. if ARM also supports such usage. Or it can be
> > > provided through a different CONFIG_ instead of
> > > CONFIG_HAVE_KVM_PRIVATE_MEM.
> > 
> > This sounds good. Thank you.
> 
> I like the idea of a separate Kconfig, e.g. CONFIG_KVM_GENERIC_PRIVATE_MEM or
> something.  I highly doubt there will be any non-x86 users for multiple years,
> if ever, but it would allow testing the private memory stuff on ARM (and any other
> non-x86 arch) without needing full pKVM support and with only minor KVM
> modifications, e.g. the x86 support[*] to test UPM without TDX is shaping up to be
> trivial.

CONFIG_KVM_GENERIC_PRIVATE_MEM looks good to me.

Thanks,
Chao
> 
> [*] https://lore.kernel.org/all/Y0mu1FKugNQG5T8K@google.com

