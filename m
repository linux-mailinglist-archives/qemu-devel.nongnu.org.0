Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84C66DF02
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:39:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmAR-0001gn-NA; Tue, 17 Jan 2023 08:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pHmAO-0001gS-T8
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:38:20 -0500
Received: from mga14.intel.com ([192.55.52.115])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1pHmAM-0003kI-7I
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:38:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673962698; x=1705498698;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=1YxIhrDQKE2lDqlUyO/ARVgD5QjeSGAHzdlrkVl5mCo=;
 b=lC+YIrKbuaFsa7BNtpbMXWQ5oixcYNHGSISfKwRcdwMOCHKt3P6KRFE0
 7yUUs15FdibDE5fJp+YZvqU5O9VZCldMD3/JlNRH7eNNLI1dDd4X/xD51
 u6MG0m6KwvtQ+cWW9Evb64GInWKvGj8Yx5UaTd5+2W9OpCawpirwCBTHM
 wYCzmbghJDpZUBEacKPcmNIHC99K/YofrL2XhFYdHCExZjaEQyBuLTpYN
 WH3seNzzqA5afNPKO2yuRlwn+JBMEY2MuTkgxRvZbwauZRmBEJJtM3rC7
 yQrlG6ZJvTh9J1FZggkwkKpr6o8kQPzUpL0xQe03/mASd/kvHxq3nydCj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324748851"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="324748851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="783240137"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="783240137"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.105])
 by orsmga004.jf.intel.com with ESMTP; 17 Jan 2023 05:38:03 -0800
Date: Tue, 17 Jan 2023 21:30:15 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
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
Subject: Re: [PATCH v10 2/9] KVM: Introduce per-page memory attributes
Message-ID: <20230117133015.GE273037@chaop.bj.intel.com>
References: <20221202061347.1070246-1-chao.p.peng@linux.intel.com>
 <20221202061347.1070246-3-chao.p.peng@linux.intel.com>
 <c25f1f8c-f7c0-6a96-cd67-260df47f79a9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25f1f8c-f7c0-6a96-cd67-260df47f79a9@linux.intel.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
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

On Tue, Jan 17, 2023 at 11:21:10AM +0800, Binbin Wu wrote:
> 
> On 12/2/2022 2:13 PM, Chao Peng wrote:
> > In confidential computing usages, whether a page is private or shared is
> > necessary information for KVM to perform operations like page fault
> > handling, page zapping etc. There are other potential use cases for
> > per-page memory attributes, e.g. to make memory read-only (or no-exec,
> > or exec-only, etc.) without having to modify memslots.
> > 
> > Introduce two ioctls (advertised by KVM_CAP_MEMORY_ATTRIBUTES) to allow
> > userspace to operate on the per-page memory attributes.
> >    - KVM_SET_MEMORY_ATTRIBUTES to set the per-page memory attributes to
> >      a guest memory range.
> >    - KVM_GET_SUPPORTED_MEMORY_ATTRIBUTES to return the KVM supported
> >      memory attributes.
> > 
> > KVM internally uses xarray to store the per-page memory attributes.
> > 
> > Suggested-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > Link: https://lore.kernel.org/all/Y2WB48kD0J4VGynX@google.com/
> > ---
> >   Documentation/virt/kvm/api.rst | 63 ++++++++++++++++++++++++++++
> >   arch/x86/kvm/Kconfig           |  1 +
> >   include/linux/kvm_host.h       |  3 ++
> >   include/uapi/linux/kvm.h       | 17 ++++++++
> 
> Should the changes introduced in this file also need to be added in
> tools/include/uapi/linux/kvm.h ?

Yes I think. But I'm hesitate to include in this patch or not. I see
many commits sync kernel kvm.h to tools's copy. Looks that is done
periodically and with a 'pull' model.

Chao

