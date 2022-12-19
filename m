Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDBC65085B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 09:01:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7B5Y-0003Ld-LX; Mon, 19 Dec 2022 03:01:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B5Q-0003Kp-FN
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:01:25 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p7B5O-0008V6-Jh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 03:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671436882; x=1702972882;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=OfZ8wFDJ+6nAyql1Nd8OAfYvfKbri9zQQ6twPOrF8GY=;
 b=CWkHmVR1E5hufSqUPkXwVGB1FwTM0GaJSjggh1YZk62mzluqyJNUn4Yk
 0EKthgVHH/1PLY4LGQ8Je8EukLITLRRmcHJ+AuCIwtbMgsgT6PHFYMpcn
 ulBJ2mRCmwGRrxZauL3kd6Mjf4gJLAe9lOYxJqeGh2x3Z1KQdVwwipQ6T
 TOkhCNcjoubGNio8sbZDl7wrX2it7s+tcBQDtsmIMAJlv6RtYbg+uZsEW
 QSHYLJaGI/00wyuFKIZ/r5vzlgAVRwcHJuxfT/ZrHVCo8RKPwQqK/79fD
 c02ikwZtMJMseAvdnYhvXa9Rldhzd5vVPE7DKaOsxY7pYTXGxmCESheP0 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="302716677"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="302716677"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2022 23:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="824757705"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; d="scan'208";a="824757705"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga005.jf.intel.com with ESMTP; 18 Dec 2022 23:54:49 -0800
Date: Mon, 19 Dec 2022 15:50:32 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
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
Message-ID: <20221219075032.GA1691829@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <cd950a78-5c5b-16ef-d0a6-ad2878af067e@intel.com>
 <20221208113003.GE1304936@chaop.bj.intel.com>
 <4d736cc0-f249-6531-c0af-7093c2c2537f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d736cc0-f249-6531-c0af-7093c2c2537f@intel.com>
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

On Tue, Dec 13, 2022 at 08:04:14PM +0800, Xiaoyao Li wrote:
> On 12/8/2022 7:30 PM, Chao Peng wrote:
> > On Thu, Dec 08, 2022 at 04:37:03PM +0800, Xiaoyao Li wrote:
> > > On 12/2/2022 2:13 PM, Chao Peng wrote:
> > > 
> > > ..
> > > 
> > > > Together with the change, a new config HAVE_KVM_RESTRICTED_MEM is added
> > > > and right now it is selected on X86_64 only.
> > > > 
> > > 
> > >  From the patch implementation, I have no idea why HAVE_KVM_RESTRICTED_MEM is
> > > needed.
> > 
> > The reason is we want KVM further controls the feature enabling. An
> > opt-in CONFIG_RESTRICTEDMEM can cause problem if user sets that for
> > unsupported architectures.
> 
> HAVE_KVM_RESTRICTED_MEM is not used in this patch. It's better to introduce
> it in the patch that actually uses it.

It's being 'used' in this patch by reverse selecting RESTRICTEDMEM in
arch/x86/kvm/Kconfig, this gives people a sense where
restrictedmem_notifier comes from. Introducing the config with other
private/restricted memslot stuff together can also help future
supporting architectures better identify what they need do. But those
are trivial and moving to patch 08 sounds also good to me.

Thanks,
Chao
> 
> > Here is the original discussion:
> > https://lore.kernel.org/all/YkJLFu98hZOvTSrL@google.com/
> > 
> > Thanks,
> > Chao

