Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E80445A5C5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:36:58 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWun-0001v3-Ce
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWsl-0000i9-9Y
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:34:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:42379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1mpWsj-0003J2-4G
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:34:51 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="234978986"
X-IronPort-AV: E=Sophos;i="5.87,258,1631602800"; d="scan'208";a="234978986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 06:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; d="scan'208";a="509430316"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga008.jf.intel.com with ESMTP; 23 Nov 2021 06:34:39 -0800
Date: Tue, 23 Nov 2021 22:33:53 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v2 PATCH 01/13] mm/shmem: Introduce F_SEAL_GUEST
Message-ID: <20211123143353.GD32088@chaop.bj.intel.com>
References: <20211119134739.20218-1-chao.p.peng@linux.intel.com>
 <20211119134739.20218-2-chao.p.peng@linux.intel.com>
 <20211119151943.GH876299@ziepe.ca>
 <df11d753-6242-8f7c-cb04-c095f68b41fa@redhat.com>
 <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6de78894-8269-ea3a-b4ee-a5cc4dad827e@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, "J . Bruce Fields" <bfields@fieldses.org>,
 linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, ak@linux.intel.com,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, Hugh Dickins <hughd@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Jim Mattson <jmattson@google.com>, dave.hansen@intel.com,
 Sean Christopherson <seanjc@google.com>, susie.li@intel.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 john.ji@intel.com, Yu Zhang <yu.c.zhang@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 23, 2021 at 10:06:02AM +0100, Paolo Bonzini wrote:
> On 11/19/21 16:39, David Hildenbrand wrote:
> > > If qmeu can put all the guest memory in a memfd and not map it, then
> > > I'd also like to see that the IOMMU can use this interface too so we
> > > can have VFIO working in this configuration.
> > 
> > In QEMU we usually want to (and must) be able to access guest memory
> > from user space, with the current design we wouldn't even be able to
> > temporarily mmap it -- which makes sense for encrypted memory only. The
> > corner case really is encrypted memory. So I don't think we'll see a
> > broad use of this feature outside of encrypted VMs in QEMU. I might be
> > wrong, most probably I am:)
> 
> It's not _that_ crazy an idea, but it's going to be some work to teach KVM
> that it has to kmap/kunmap around all memory accesses.
> 
> I think it's great that memfd hooks are usable by more than one subsystem,
> OTOH it's fair that whoever needs it does the work---and VFIO does not need
> it for confidential VMs, yet, so it should be fine for now to have a single
> user.
> 
> On the other hand, as I commented already, the lack of locking in the
> register/unregister functions has to be fixed even with a single user.
> Another thing we can do already is change the guest_ops/guest_mem_ops to
> something like memfd_falloc_notifier_ops/memfd_pfn_ops, and the
> register/unregister functions to memfd_register/unregister_falloc_notifier.

I'm satisified with this naming ;)

> 
> Chao, can you also put this under a new CONFIG such as "bool MEMFD_OPS", and
> select it from KVM?

Yes, reasonable.

> 
> Thanks,
> 
> Paolo

