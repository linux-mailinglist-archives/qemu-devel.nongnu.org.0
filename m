Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC76459982
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 02:08:59 +0100 (CET)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpKIr-0000j7-W1
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 20:08:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpKHc-0008UA-1A
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 20:07:40 -0500
Received: from mga02.intel.com ([134.134.136.20]:44746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpKHa-0004gb-20
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 20:07:39 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="222144195"
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="222144195"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 17:07:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,256,1631602800"; d="scan'208";a="649751921"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 22 Nov 2021 17:07:25 -0800
Date: Tue, 23 Nov 2021 09:06:39 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [RFC v2 PATCH 13/13] KVM: Enable memfd based page
 invalidation/fallocate
Message-ID: <20211123010639.GA32088@chaop.bj.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-14-chao.p.peng@linux.intel.com>
 <20211122141647.3pcsywilrzcoqvbf@box.shutemov.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122141647.3pcsywilrzcoqvbf@box.shutemov.name>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Wanpeng Li <wanpengli@tencent.com>, jun.nakajima@intel.com,
 kvm@vger.kernel.org, david@redhat.com, qemu-devel@nongnu.org,
 "J . Bruce Fields" <bfields@fieldses.org>, dave.hansen@intel.com,
 "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>,
 linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>,
 susie.li@intel.com, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, john.ji@intel.com,
 Yu Zhang <yu.c.zhang@linux.intel.com>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 22, 2021 at 05:16:47PM +0300, Kirill A. Shutemov wrote:
> On Fri, Nov 19, 2021 at 09:47:39PM +0800, Chao Peng wrote:
> > Since the memory backing store does not get notified when VM is
> > destroyed so need check if VM is still live in these callbacks.
> > 
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  virt/kvm/memfd.c | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > 
> > diff --git a/virt/kvm/memfd.c b/virt/kvm/memfd.c
> > index bd930dcb455f..bcfdc685ce22 100644
> > --- a/virt/kvm/memfd.c
> > +++ b/virt/kvm/memfd.c
> > @@ -12,16 +12,38 @@
> >  #include <linux/memfd.h>
> >  const static struct guest_mem_ops *memfd_ops;
> >  
> > +static bool vm_is_dead(struct kvm *vm)
> > +{
> > +	struct kvm *kvm;
> > +
> > +	list_for_each_entry(kvm, &vm_list, vm_list) {
> > +		if (kvm == vm)
> > +			return false;
> > +	}
> 
> I don't think this is enough. The struct kvm can be freed and re-allocated
> from the slab and this function will give false-negetive.

Right.

> 
> Maybe the kvm has to be tagged with a sequential id that incremented every
> allocation. This id can be checked here.

Sounds like a sequential id will be needed, no existing fields in struct
kvm can work for this.

> 
> > +
> > +	return true;
> > +}
> 
> -- 
>  Kirill A. Shutemov

