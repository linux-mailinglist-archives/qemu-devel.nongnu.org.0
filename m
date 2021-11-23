Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2454845A59D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:26:20 +0100 (CET)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWkU-0001Ey-UJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWjb-0000Pa-9J
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:25:23 -0500
Received: from mga11.intel.com ([192.55.52.93]:24940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWjZ-0001vd-0Y
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:25:23 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="232520731"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="232520731"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 06:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="509427091"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Nov 2021 06:25:06 -0800
Date: Tue, 23 Nov 2021 22:24:20 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 09/13] KVM: Introduce kvm_memfd_invalidate_range
Message-ID: <20211123142420.GB32088@chaop.bj.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-10-chao.p.peng@linux.intel.com>
 <4041d98a-23df-e9ed-b245-5edd7151fec5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4041d98a-23df-e9ed-b245-5edd7151fec5@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 09:46:34AM +0100, Paolo Bonzini wrote:
> On 11/19/21 14:47, Chao Peng wrote:
> > +
> > +	/* Prevent memslot modification */
> > +	spin_lock(&kvm->mn_invalidate_lock);
> > +	kvm->mn_active_invalidate_count++;
> > +	spin_unlock(&kvm->mn_invalidate_lock);
> > +
> > +	ret = __kvm_handle_useraddr_range(kvm, &useraddr_range);
> > +
> > +	spin_lock(&kvm->mn_invalidate_lock);
> > +	kvm->mn_active_invalidate_count--;
> > +	spin_unlock(&kvm->mn_invalidate_lock);
> > +
> 
> 
> You need to follow this with a rcuwait_wake_up as in
> kvm_mmu_notifier_invalidate_range_end.

Oh right.

> 
> It's probably best if you move the manipulations of
> mn_active_invalidate_count from kvm_mmu_notifier_invalidate_range_* to two
> separate functions.

Will do.

> 
> Paolo

