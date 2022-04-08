Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE5F4F97B0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:08:33 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpHs-0008Pk-8E
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncp9e-0000aF-QW
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:00:06 -0400
Received: from mga17.intel.com ([192.55.52.151]:37690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncp9c-0007kw-MS
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:00:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649426400; x=1680962400;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=vzRh1a2g1teZIO284W8xK+WsiWROyR/t9wQMFIz6/+E=;
 b=R+iFzD7Jag2yOhwoTGzbzGq0rNr2cHGyZs2plEFSXOPv7C0+gQBQFc+g
 B6qU7dI8ubimvLLVM4WxAfPTMzTGAT7z4ni9JFxN+5+3WeCKoFl2QYOh5
 5RH7WeCHw/8pKqpvhkDc+zUJuiwD7wdt3Ta7e64mblKvHSd7pJJGOwjEL
 GjRNHuu6ocnGFCN0CcIjvIuZYe2zkJOHdqAZy48gGR6u42n2cD5LVdwuS
 SBt/4xAANshNGbjtEWkHpm+3mjW7c+CR6a32ddkOmdDzRoPrCutSKEyIJ
 IwrrM/Qog9q92f1a7NvxN0E/WOip6d2qYJX6fg3OjZsqpKWuY+dLV2rXN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242191140"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="242191140"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 06:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="698190261"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2022 06:59:52 -0700
Date: Fri, 8 Apr 2022 21:59:41 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 07/13] KVM: Add KVM_EXIT_MEMORY_ERROR exit
Message-ID: <20220408135941.GF57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-8-chao.p.peng@linux.intel.com>
 <YkI3wa3rmWTOrpmw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkI3wa3rmWTOrpmw@google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Steven Price <steven.price@arm.com>, Ingo Molnar <mingo@redhat.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jim Mattson <jmattson@google.com>,
 dave.hansen@intel.com, linux-api@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vishal Annapurve <vannapurve@google.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 28, 2022 at 10:33:37PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > This new KVM exit allows userspace to handle memory-related errors. It
> > indicates an error happens in KVM at guest memory range [gpa, gpa+size).
> > The flags includes additional information for userspace to handle the
> > error. Currently bit 0 is defined as 'private memory' where '1'
> > indicates error happens due to private memory access and '0' indicates
> > error happens due to shared memory access.
> > 
> > After private memory is enabled, this new exit will be used for KVM to
> > exit to userspace for shared memory <-> private memory conversion in
> > memory encryption usage.
> > 
> > In such usage, typically there are two kind of memory conversions:
> >   - explicit conversion: happens when guest explicitly calls into KVM to
> >     map a range (as private or shared), KVM then exits to userspace to
> >     do the map/unmap operations.
> >   - implicit conversion: happens in KVM page fault handler.
> >     * if the fault is due to a private memory access then causes a
> >       userspace exit for a shared->private conversion request when the
> >       page has not been allocated in the private memory backend.
> >     * If the fault is due to a shared memory access then causes a
> >       userspace exit for a private->shared conversion request when the
> >       page has already been allocated in the private memory backend.
> > 
> > Signed-off-by: Yu Zhang <yu.c.zhang@linux.intel.com>
> > Signed-off-by: Chao Peng <chao.p.peng@linux.intel.com>
> > ---
> >  Documentation/virt/kvm/api.rst | 22 ++++++++++++++++++++++
> >  include/uapi/linux/kvm.h       |  9 +++++++++
> >  2 files changed, 31 insertions(+)
> > 
> > diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> > index f76ac598606c..bad550c2212b 100644
> > --- a/Documentation/virt/kvm/api.rst
> > +++ b/Documentation/virt/kvm/api.rst
> > @@ -6216,6 +6216,28 @@ array field represents return values. The userspace should update the return
> >  values of SBI call before resuming the VCPU. For more details on RISC-V SBI
> >  spec refer, https://github.com/riscv/riscv-sbi-doc.
> >  
> > +::
> > +
> > +		/* KVM_EXIT_MEMORY_ERROR */
> > +		struct {
> > +  #define KVM_MEMORY_EXIT_FLAG_PRIVATE	(1 << 0)
> > +			__u32 flags;
> > +			__u32 padding;
> > +			__u64 gpa;
> > +			__u64 size;
> > +		} memory;
> > +If exit reason is KVM_EXIT_MEMORY_ERROR then it indicates that the VCPU has
> 
> Doh, I'm pretty sure I suggested KVM_EXIT_MEMORY_ERROR.  Any objection to using
> KVM_EXIT_MEMORY_FAULT instead of KVM_EXIT_MEMORY_ERROR?  "ERROR" makes me think
> of ECC errors, i.e. uncorrected #MC in x86 land, not more generic "faults".  That
> would align nicely with -EFAULT.

Sure.

> 
> > +encountered a memory error which is not handled by KVM kernel module and
> > +userspace may choose to handle it. The 'flags' field indicates the memory
> > +properties of the exit.

