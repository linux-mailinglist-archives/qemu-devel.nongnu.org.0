Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3634646EB8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 12:36:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3FAw-0004pi-5y; Thu, 08 Dec 2022 06:34:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p3FAm-0004pA-5J
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 06:34:41 -0500
Received: from mga04.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1p3FAj-0003XJ-Lh
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 06:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670499277; x=1702035277;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=BNKj0Q3HaLW0QQmlzFra5ewPCCLiShH0XE7KzON/axc=;
 b=CFBmrARQBtj1dWTXIBHj1T8eNiPP1FmKEvEJwv7bloP24pSVvhqNeG4d
 g/XO/+pkKl4s4yhBju4WFtKOErJff2PQO8OBdviiwISVN9J9MYC0pRA6T
 uKSPOx1hDCEEUsp/OwjixzEbS9LpHDnaJxIFQVEU8FIy7gsi7/tqN4qS5
 Drtf63+Jtf0Yd0dPj5OE5P9qQKKMnWRnQ9JaepmIWAt/Zvw1u4Pk718J+
 buf6NTUgkQU5QF1nKgEbMYik3Zdjau6HdZ7v/2A3mpgb19ky8eCqXQ4IQ
 soGrSFC+eLBfb9oIG9PJ+QcE8bnALRx1YRbytfYquFKsFZg+QahxUFVbG Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="315865234"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="315865234"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 03:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="624670349"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="624670349"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga006.jf.intel.com with ESMTP; 08 Dec 2022 03:34:22 -0800
Date: Thu, 8 Dec 2022 19:30:03 +0800
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
Message-ID: <20221208113003.GE1304936@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-4-chao.p.peng@linux.intel.com>
 <cd950a78-5c5b-16ef-d0a6-ad2878af067e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd950a78-5c5b-16ef-d0a6-ad2878af067e@intel.com>
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

On Thu, Dec 08, 2022 at 04:37:03PM +0800, Xiaoyao Li wrote:
> On 12/2/2022 2:13 PM, Chao Peng wrote:
> 
> ..
> 
> > Together with the change, a new config HAVE_KVM_RESTRICTED_MEM is added
> > and right now it is selected on X86_64 only.
> > 
> 
> From the patch implementation, I have no idea why HAVE_KVM_RESTRICTED_MEM is
> needed.

The reason is we want KVM further controls the feature enabling. An
opt-in CONFIG_RESTRICTEDMEM can cause problem if user sets that for
unsupported architectures.

Here is the original discussion:
https://lore.kernel.org/all/YkJLFu98hZOvTSrL@google.com/

Thanks,
Chao

