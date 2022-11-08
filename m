Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655A0620B2F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 09:30:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osJyb-0003ov-52; Tue, 08 Nov 2022 03:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1osJyY-0003oW-6f
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:28:54 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1osJyV-0008CO-2b
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 03:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667896131; x=1699432131;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=WIPURCPIsIJH60CXb2Fq3UuwkzckzrtWTTFyYgbY51I=;
 b=M/sNJVHAB+ArBICW7WNoNrZRtlmMyGSo6ImfDRheEqn8H+0RsRsqpG9v
 RQ/bEKCeOUDLYlary+QSIk4phCfOkSfthi/nxbh+7+yfwIOVvcLYWlOLs
 E2hlaTUYbBYxKR4ufxHA3ys+/pvrWNoVo9z+lnFjWirz6RRcn6tiePDHg
 22Y22Fxl192bnc5o9UHHfe4ElypGD8FmIXs/y3ZxdJz8Qyntpvo2HQYH+
 vcQt15gnmdaZaRar8v0PUy8TA75swHFyF6U2x/JT70Y5ai7/sRGADbgPF
 jiiYhoLK8S+uy1Spz4LKxhZQ3JWgkuJhM0i1RPRrvjtFChoGkL+G7s36d Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="290359591"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="290359591"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 00:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630798909"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; d="scan'208";a="630798909"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga007.jf.intel.com with ESMTP; 08 Nov 2022 00:28:36 -0800
Date: Tue, 8 Nov 2022 16:24:10 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>,
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
 Quentin Perret <qperret@google.com>, tabba@google.com,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com,
 Muchun Song <songmuchun@bytedance.com>, wei.w.wang@intel.com
Subject: Re: [PATCH v9 5/8] KVM: Register/unregister the guest private memory
 regions
Message-ID: <20221108082410.GA84375@chaop.bj.intel.com>
References: <20221025151344.3784230-1-chao.p.peng@linux.intel.com>
 <20221025151344.3784230-6-chao.p.peng@linux.intel.com>
 <Y2RJFWplouV2iF5E@google.com>
 <20221104082843.GA4142342@chaop.bj.intel.com>
 <Y2WB48kD0J4VGynX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2WB48kD0J4VGynX@google.com>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Fri, Nov 04, 2022 at 09:19:31PM +0000, Sean Christopherson wrote:
> Paolo, any thoughts before I lead things further astray?
> 
> On Fri, Nov 04, 2022, Chao Peng wrote:
> > On Thu, Nov 03, 2022 at 11:04:53PM +0000, Sean Christopherson wrote:
> > > On Tue, Oct 25, 2022, Chao Peng wrote:
> > > > @@ -4708,6 +4802,24 @@ static long kvm_vm_ioctl(struct file *filp,
> > > >  		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> > > >  		break;
> > > >  	}
> > > > +#ifdef CONFIG_KVM_GENERIC_PRIVATE_MEM
> > > > +	case KVM_MEMORY_ENCRYPT_REG_REGION:
> > > > +	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
> > > 
> > > I'm having second thoughts about usurping KVM_MEMORY_ENCRYPT_(UN)REG_REGION.  Aside
> > > from the fact that restricted/protected memory may not be encrypted, there are
> > > other potential use cases for per-page memory attributes[*], e.g. to make memory
> > > read-only (or no-exec, or exec-only, etc...) without having to modify memslots.
> > > 
> > > Any paravirt use case where the attributes of a page are effectively dictated by
> > > the guest is going to run into the exact same performance problems with memslots,
> > > which isn't suprising in hindsight since shared vs. private is really just an
> > > attribute, albeit with extra special semantics.
> > > 
> > > And if we go with a brand new ioctl(), maybe someday in the very distant future
> > > we can deprecate and delete KVM_MEMORY_ENCRYPT_(UN)REG_REGION.
> > > 
> > > Switching to a new ioctl() should be a minor change, i.e. shouldn't throw too big
> > > of a wrench into things.
> > > 
> > > Something like:
> > > 
> > >   KVM_SET_MEMORY_ATTRIBUTES
> > > 
> > >   struct kvm_memory_attributes {
> > > 	__u64 address;
> > > 	__u64 size;
> > > 	__u64 flags;
> 
> Oh, this is half-baked.  I lost track of which flags were which.  What I intended
> was a separate, initially-unused flags, e.g.

That makes sense.

> 
>  struct kvm_memory_attributes {
> 	__u64 address;
> 	__u64 size;
> 	__u64 attributes;
> 	__u64 flags;
>   }
> 
> so that KVM can tweak behavior and/or extend the effective size of the struct.
> 
> > I like the idea of adding a new ioctl(). But putting all attributes into
> > a flags in uAPI sounds not good to me, e.g. forcing userspace to set all
> > attributes in one call can cause pain for userspace, probably for KVM
> > implementation as well. For private<->shared memory conversion, we
> > actually only care the KVM_MEM_ATTR_SHARED or KVM_MEM_ATTR_PRIVATE bit,
> 
> Not necessarily, e.g. I can see pKVM wanting to convert from RW+PRIVATE => RO+SHARED
> or even RW+PRIVATE => NONE+SHARED so that the guest can't write/access the memory
> while it's accessible from the host.
> 
> And if this does extend beyond shared/private, dropping from RWX=>R, i.e. dropping
> WX permissions, would also be a common operation.
> 
> Hmm, typing that out makes me think that if we do end up supporting other "attributes",
> i.e. protections, we should go straight to full RWX protections instead of doing
> things piecemeal, i.e. add individual protections instead of combinations like
> NO_EXEC and READ_ONLY.  The protections would have to be inverted for backwards
> compatibility, but that's easy enough to handle.  The semantics could be like
> protection keys, which also have inverted persmissions, where the final protections
> are the combination of memslot+attributes, i.e. a read-only memslot couldn't be made
> writable via attributes.
> 
> E.g. userspace could do "NO_READ | NO_WRITE | NO_EXEC" to temporarily block access
> to memory without needing to delete the memslot.  KVM would need to disallow
> unsupported combinations, e.g. disallowed effective protections would be:
> 
>   - W or WX [unless there's an arch that supports write-only memory]
>   - R or RW [until KVM plumbs through support for no-exec, or it's unsupported in hardware]
>   - X       [until KVM plumbs through support for exec-only, or it's unsupported in hardware]
> 
> Anyways, that's all future work...
> 
> > but we force userspace to set other irrelevant bits as well if use this
> > API.
> 
> They aren't irrelevant though, as the memory attributes are all describing the
> allowed protections for a given page.

The 'allowed' protections seems answer my concern. But after we enabled
"NO_READ | NO_WRITE | NO_EXEC", are we going to check "NO_READ |
NO_WRITE | NO_EXEC" are also set together with the PRIVATE bit? I just
can't imagine what the semantic would be if we have the PRIVATE bit set
but other bits indicate it's actually can READ/WRITE/EXEC from usrspace.

> If there's a use case where userspace "can't"
> keep track of the attributes for whatever reason, then userspace could do a RMW
> to set/clear attributes.  Alternatively, the ioctl() could take an "operation" and
> support WRITE/OR/AND to allow setting/clearing individual flags, e.g. tweak the
> above to be: 

A getter would be good, it might also be needed for live migration.

>  
>  struct kvm_memory_attributes {
> 	__u64 address;
> 	__u64 size;
> 	__u64 attributes;
> 	__u32 operation;
> 	__u32 flags;
>   }
> 
> > I looked at kvm_device_attr, sounds we can do similar:
> 
> The device attributes deal with isolated, arbitrary values, whereas memory attributes
> are flags, i.e. devices are 1:1 whereas memory is 1:MANY.  There is no "unset" for
> device attributes, because they aren't flags.  Device attributes vs. memory attributes
> really are two very different things that just happen to use a common name.
> 
> If it helped clarify things without creating naming problems, we could even use
> PROTECTIONS instead of ATTRIBUTES.
> 
> >   KVM_SET_MEMORY_ATTR
> > 
> >   struct kvm_memory_attr {
> > 	__u64 address;
> > 	__u64 size;
> > #define KVM_MEM_ATTR_SHARED	BIT(0)
> > #define KVM_MEM_ATTR_READONLY	BIT(1)
> > #define KVM_MEM_ATTR_NOEXEC	BIT(2)
> > 	__u32 attr;
> 
> As above, letting userspace set only a single attribute would prevent setting
> (or clearing) multiple attributes in a single ioctl().
> 
> > 	__u32 pad;
> >   }
> > 
> > I'm not sure if we need KVM_GET_MEMORY_ATTR/KVM_HAS_MEMORY_ATTR as well,
> 
> Definitely would need to communicate to userspace that various attributes are
> supported.  That doesn't necessarily require a common ioctl(), but I don't see
> any reason not to add a common helper, and adding a common helper would mean
> KVM_CAP_PRIVATE_MEM can go away.  But it should return a bitmask so that userspace
> can do a single query to get all supported attributes, e.g. KVM_SUPPORTED_MEMORY_ATTRIBUTES.  

Do you have preference on using a new ioctl or just keep it as a cap?
E.g. KVM_CAP_MEMORY_ATTIBUTES can also returns a mask.

> 
> As for KVM_GET_MEMORY_ATTRIBUTES, we wouldn't necessarily have to provide such an
> API, e.g. we could hold off until someone came along with a RMW use case (as above).
> That said, debug would likely be a nightmare without KVM_GET_MEMORY_ATTRIBUTES,
> so it's probably best to add it straightway.

Dive into the implementation a bit, for KVM_GET_MEMORY_ATTRIBUTES we can
have different attributes for different pages in the same user-provided
range, in that case we will have to either return a list or just a error
number. Or we only support per-page attributes for the getter?

Chao
> 
> > but sounds like we need a KVM_UNSET_MEMORY_ATTR.
> 
> No need if the setter operates on all attributes.
> 
> > Since we are exposing the attribute directly to userspace I also think
> > we'd better treat shared memory as the default, so even when the private
> > memory is not used, the bit can still be meaningful. So define BIT(0) as
> > KVM_MEM_ATTR_PRIVATE instead of KVM_MEM_ATTR_SHARED.
> 
> Ah, right.

