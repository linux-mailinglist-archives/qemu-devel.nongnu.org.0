Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D575F9B46
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:44:15 +0200 (CEST)
Received: from localhost ([::1]:49840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohoOU-000538-MC
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoAi-0000e7-AZ
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:30:01 -0400
Received: from mga12.intel.com ([192.55.52.136]:62254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ohoAc-0002Ff-Rv
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665390594; x=1696926594;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=5AUxEww8V8qWvvG5bCArmS7RBRQUNOLUMKgyDwR1O0k=;
 b=BYSQ0/oCN/EMFDWfwu/4Js8Mx1DMpkSDcbvWuR8/h9ItBNN8GzIDuNmb
 +NXvERrhsJxsuiJnJDDt7zWo+SgpwQWic5YzvyergRHwOh3A0AZ53myTV
 scBzpa1uHwAzLePPBdW9u0BnswUHkXJqDZJBj3El6AGFc07Zy+QB4FxI/
 nlENjdaMelw87RXp0KcR6Ks7VnGgEKWToiPtU6K/CxESXwbd4ZPpDUOtY
 j/zX3DXM5Ljbe4LFynejElXnk2qOY0b9bL7sLZHmc0GcCP8gD35GsVHUQ
 RPMqWVPajvFym8R6iZ2cROU00B39+wgU+xUV2UJg3EHUBIeiTa6cd6iMe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="283899554"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="283899554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 01:29:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="656853060"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="656853060"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 10 Oct 2022 01:29:40 -0700
Date: Mon, 10 Oct 2022 16:25:07 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org,
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
Subject: Re: [PATCH v8 2/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20221010082507.GA3144879@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
 <Yz7s+JIexAHJm5dc@kernel.org> <Yz7vHXZmU3EpmI0j@kernel.org>
 <Yz71ogila0mSHxxJ@google.com> <Y0AJ++m/TxoscOZg@kernel.org>
 <Y0A+rogB6TRDtbyE@google.com> <Y0CgFIq6JnHmdWrL@kernel.org>
 <Y0GiEW0cYCNx5jyK@kernel.org> <Y0G085xCmFBxSodG@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0G085xCmFBxSodG@kernel.org>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Sat, Oct 08, 2022 at 08:35:47PM +0300, Jarkko Sakkinen wrote:
> On Sat, Oct 08, 2022 at 07:15:17PM +0300, Jarkko Sakkinen wrote:
> > On Sat, Oct 08, 2022 at 12:54:32AM +0300, Jarkko Sakkinen wrote:
> > > On Fri, Oct 07, 2022 at 02:58:54PM +0000, Sean Christopherson wrote:
> > > > On Fri, Oct 07, 2022, Jarkko Sakkinen wrote:
> > > > > On Thu, Oct 06, 2022 at 03:34:58PM +0000, Sean Christopherson wrote:
> > > > > > On Thu, Oct 06, 2022, Jarkko Sakkinen wrote:
> > > > > > > On Thu, Oct 06, 2022 at 05:58:03PM +0300, Jarkko Sakkinen wrote:
> > > > > > > > On Thu, Sep 15, 2022 at 10:29:07PM +0800, Chao Peng wrote:
> > > > > > > > > This new extension, indicated by the new flag KVM_MEM_PRIVATE, adds two
> > > > > > > > > additional KVM memslot fields private_fd/private_offset to allow
> > > > > > > > > userspace to specify that guest private memory provided from the
> > > > > > > > > private_fd and guest_phys_addr mapped at the private_offset of the
> > > > > > > > > private_fd, spanning a range of memory_size.
> > > > > > > > > 
> > > > > > > > > The extended memslot can still have the userspace_addr(hva). When use, a
> > > > > > > > > single memslot can maintain both private memory through private
> > > > > > > > > fd(private_fd/private_offset) and shared memory through
> > > > > > > > > hva(userspace_addr). Whether the private or shared part is visible to
> > > > > > > > > guest is maintained by other KVM code.
> > > > > > > > 
> > > > > > > > What is anyway the appeal of private_offset field, instead of having just
> > > > > > > > 1:1 association between regions and files, i.e. one memfd per region?
> > > > > > 
> > > > > > Modifying memslots is slow, both in KVM and in QEMU (not sure about Google's VMM).
> > > > > > E.g. if a vCPU converts a single page, it will be forced to wait until all other
> > > > > > vCPUs drop SRCU, which can have severe latency spikes, e.g. if KVM is faulting in
> > > > > > memory.  KVM's memslot updates also hold a mutex for the entire duration of the
> > > > > > update, i.e. conversions on different vCPUs would be fully serialized, exacerbating
> > > > > > the SRCU problem.
> > > > > > 
> > > > > > KVM also has historical baggage where it "needs" to zap _all_ SPTEs when any
> > > > > > memslot is deleted.
> > > > > > 
> > > > > > Taking both a private_fd and a shared userspace address allows userspace to convert
> > > > > > between private and shared without having to manipulate memslots.
> > > > > 
> > > > > Right, this was really good explanation, thank you.
> > > > > 
> > > > > Still wondering could this possibly work (or not):
> > > > > 
> > > > > 1. Union userspace_addr and private_fd.
> > > > 
> > > > No, because userspace needs to be able to provide both userspace_addr (shared
> > > > memory) and private_fd (private memory) for a single memslot.
> > > 
> > > Got it, thanks for clearing my misunderstandings on this topic, and it
> > > is quite obviously visible in 5/8 and 7/8. I.e. if I got it right,
> > > memblock can be partially private, and you dig the shared holes with
> > > KVM_MEMORY_ENCRYPT_UNREG_REGION. We have (in Enarx) ATM have memblock
> > > per host mmap, I was looking into this dilated by that mindset but makes
> > > definitely sense to support that.
> > 
> > For me the most useful reference with this feature is kvm_set_phys_mem()
> > implementation in privmem-v8 branch. Took while to find it because I did
> > not have much experience with QEMU code base. I'd even recommend to mention
> > that function in the cover letter because it is really good reference on
> > how this feature is supposed to be used.

That's a good point, I can mention that if people find useful. 

> 
> While learning QEMU code, I also noticed bunch of comparison like this:
> 
> if (slot->flags | KVM_MEM_PRIVATE)
> 
> I guess those could be just replaced with unconditional fills as it does
> not do any harm, if KVM_MEM_PRIVATE is not set.

Make sense, thanks.

Chao
> 
> BR, Jarkko

