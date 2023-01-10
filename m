Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718EB663D08
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFAmq-0002iW-0R; Tue, 10 Jan 2023 04:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pFAme-0002df-3T
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:19:07 -0500
Received: from mga09.intel.com ([134.134.136.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pFAmb-0002db-Uw
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673342341; x=1704878341;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=2L0+jVEogDEzAgz7y5b+vzXDvmX8Ax8MX0YUEFpP2YQ=;
 b=hMK6G/ElgX6zoGHEqOvSYT/2ZpWZ09G396lSONG+MoC03gwaIg8xsPjw
 vhusF9YMLKqZ5IWu/nsncnJGM/zZlKZIkka33REZpwyca4YNwMGLVuSyP
 nHVXDWQ/xpVhkhFxM1DzAMHxbc2WBO5sLmevvVIiNmpvcXhqfSEkuPDOt
 2BuLN6uGkbLXDJWsOdUpaLdi5uGKkRcPq1ygy1ZDvaMIQYCouz7tx6zEp
 mNoRCNjMUqdpWlEI3j03CN3BjTd1GGydrqVkETlOA1pAAxFwzZfWNtTMv
 OinhN5DcED2ZKVZhr8WjrQt70A8l1FnhMehOC/lk7I1yXBxuH0isV3Ik0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="324343041"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="324343041"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 01:18:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="689352645"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="689352645"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga001.jf.intel.com with ESMTP; 10 Jan 2023 01:18:43 -0800
Date: Tue, 10 Jan 2023 17:14:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, kvm@vger.kernel.org,
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
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com, wei.w.wang@intel.com
Subject: Re: [PATCH v10 3/9] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20230110091432.GA2441264@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <Y7azFdnnGAdGPqmv@kernel.org>
 <20230106094000.GA2297836@chaop.bj.intel.com>
 <Y7xrtf9FCuYRYm1q@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7xrtf9FCuYRYm1q@google.com>
Received-SPF: none client-ip=134.134.136.24;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga09.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 07:32:05PM +0000, Sean Christopherson wrote:
> On Fri, Jan 06, 2023, Chao Peng wrote:
> > On Thu, Jan 05, 2023 at 11:23:01AM +0000, Jarkko Sakkinen wrote:
> > > On Fri, Dec 02, 2022 at 02:13:41PM +0800, Chao Peng wrote:
> > > > To make future maintenance easy, internally use a binary compatible
> > > > alias struct kvm_user_mem_region to handle both the normal and the
> > > > '_ext' variants.
> > > 
> > > Feels bit hacky IMHO, and more like a completely new feature than
> > > an extension.
> > > 
> > > Why not just add a new ioctl? The commit message does not address
> > > the most essential design here.
> > 
> > Yes, people can always choose to add a new ioctl for this kind of change
> > and the balance point here is we want to also avoid 'too many ioctls' if
> > the functionalities are similar.  The '_ext' variant reuses all the
> > existing fields in the 'normal' variant and most importantly KVM
> > internally can reuse most of the code. I certainly can add some words in
> > the commit message to explain this design choice.
> 
> After seeing the userspace side of this, I agree with Jarkko; overloading
> KVM_SET_USER_MEMORY_REGION is a hack.  E.g. the size validation ends up being
> bogus, and userspace ends up abusing unions or implementing kvm_user_mem_region
> itself.

How is the size validation being bogus? I don't quite follow. Then we
will use kvm_userspace_memory_region2 as the KVM internal alias, right?
I see similar examples use different functions to handle different
versions but it does look easier if we use alias for this function.

> 
> It feels absolutely ridiculous, but I think the best option is to do:
> 
> #define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
> 					 struct kvm_userspace_memory_region2)

Just interesting, is 0x49 a safe number we can use? 

> 
> /* for KVM_SET_USER_MEMORY_REGION2 */
> struct kvm_user_mem_region2 {
> 	__u32 slot;
> 	__u32 flags;
> 	__u64 guest_phys_addr;
> 	__u64 memory_size;
> 	__u64 userspace_addr;
> 	__u64 restricted_offset;
> 	__u32 restricted_fd;
> 	__u32 pad1;
> 	__u64 pad2[14];
> }
> 
> And it's consistent with other KVM ioctls(), e.g. KVM_SET_CPUID2.

Okay, agree from KVM userspace API perspective this is more consistent
with similar existing examples. I see several of them.

I think we will also need a CAP_KVM_SET_USER_MEMORY_REGION2 for this new
ioctl.

> 
> Regarding the userspace side of things, please include Vishal's selftests in v11,
> it's impossible to properly review the uAPI changes without seeing the userspace
> side of things.  I'm in the process of reviewing Vishal's v2[*], I'll try to
> massage it into a set of patches that you can incorporate into your series.

Previously I included Vishal's selftests in the github repo, but not
include them in this patch series. It's OK for me to incorporate them
directly into this series and review together if Vishal is fine.

Chao
> 
> [*] https://lore.kernel.org/all/20221205232341.4131240-1-vannapurve@google.com

