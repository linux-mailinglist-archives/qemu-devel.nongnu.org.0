Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A904F97B7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:10:41 +0200 (CEST)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpJu-0002k4-Ty
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncp8d-0007Bh-CZ
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:58:59 -0400
Received: from mga17.intel.com ([192.55.52.151]:37619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ncp8b-0007bn-CO
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649426337; x=1680962337;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=6BtLWIQ6HuBMCGyioka43iSSXH1vNEmJNzU6an6OpK4=;
 b=I/yAZu3krSwLEP2JN3ClP32CdnadW/qsD/ZVTVC4m3N7cBNeRonshyL/
 AjhSCrWdkAavVGmx7H7pehDFhBVCgwayG3MmCFRgXAlMmimZnrr51F6l2
 9ZGOGmTRgEztBvtt2h1yGs8bZL5tJxLse/OC4mUG7cNi+fYedvXjaLsUC
 53doIqRFeBfuIs5Z/tMjDmyL5OJhGsrhGjbC6xBs92VyUl3OqGRW7lncW
 aTuQt5qdHTVZGhBnReagdf2qwdpLY7t+2mWs4dsVtlLczwyQab+0f/cCb
 6aBxOKw7xEJSaRt5qo81WaDAYGsuq/3eYNsezkgL19rzvw2PV0atXA/5c Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242191006"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="242191006"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 06:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="698190122"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by fmsmga001.fm.intel.com with ESMTP; 08 Apr 2022 06:58:48 -0700
Date: Fri, 8 Apr 2022 21:58:37 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v5 06/13] KVM: Use kvm_userspace_memory_region_ext
Message-ID: <20220408135837.GE57095@chaop.bj.intel.com>
References: <20220310140911.50924-1-chao.p.peng@linux.intel.com>
 <20220310140911.50924-7-chao.p.peng@linux.intel.com>
 <YkI2Lyv9SJaGPDz+@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkI2Lyv9SJaGPDz+@google.com>
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

On Mon, Mar 28, 2022 at 10:26:55PM +0000, Sean Christopherson wrote:
> On Thu, Mar 10, 2022, Chao Peng wrote:
> > @@ -4476,14 +4477,23 @@ static long kvm_vm_ioctl(struct file *filp,
> >  		break;
> >  	}
> >  	case KVM_SET_USER_MEMORY_REGION: {
> > -		struct kvm_userspace_memory_region kvm_userspace_mem;
> > +		struct kvm_userspace_memory_region_ext region_ext;
> 
> It's probably a good idea to zero initialize the full region to avoid consuming
> garbage stack data if there's a bug and an _ext field is accessed without first
> checking KVM_MEM_PRIVATE.  I'm usually opposed to unnecessary initialization, but
> this seems like something we could screw up quite easily.
> 
> >  		r = -EFAULT;
> > -		if (copy_from_user(&kvm_userspace_mem, argp,
> > -						sizeof(kvm_userspace_mem)))
> > +		if (copy_from_user(&region_ext, argp,
> > +				sizeof(struct kvm_userspace_memory_region)))
> >  			goto out;
> > +		if (region_ext.region.flags & KVM_MEM_PRIVATE) {
> > +			int offset = offsetof(
> > +				struct kvm_userspace_memory_region_ext,
> > +				private_offset);
> > +			if (copy_from_user(&region_ext.private_offset,
> > +					   argp + offset,
> > +					   sizeof(region_ext) - offset))
> 
> In this patch, KVM_MEM_PRIVATE should result in an -EINVAL as it's not yet
> supported.  Copying the _ext on KVM_MEM_PRIVATE belongs in the "Expose KVM_MEM_PRIVATE"
> patch.

Agreed.

> 
> Mechnically, what about first reading flags via get_user(), and then doing a single
> copy_from_user()?  It's technically more work in the common case, and requires an
> extra check to guard against TOCTOU attacks, but this isn't a fast path by any means
> and IMO the end result makes it easier to understand the relationship between
> KVM_MEM_PRIVATE and the two different structs.

Will use this code, thanks for typing.

Chao
> 
> E.g.
> 
> 	case KVM_SET_USER_MEMORY_REGION: {
> 		struct kvm_user_mem_region region;
> 		unsigned long size;
> 		u32 flags;
> 
> 		memset(&region, 0, sizeof(region));
> 
> 		r = -EFAULT;
> 		if (get_user(flags, (u32 __user *)(argp + offsetof(typeof(region), flags))))
> 			goto out;
> 
> 		if (flags & KVM_MEM_PRIVATE)
> 			size = sizeof(struct kvm_userspace_memory_region_ext);
> 		else
> 			size = sizeof(struct kvm_userspace_memory_region);
> 		if (copy_from_user(&region, argp, size))
> 			goto out;
> 
> 		r = -EINVAL;
> 		if ((flags ^ region.flags) & KVM_MEM_PRIVATE)
> 			goto out;
> 
> 		r = kvm_vm_ioctl_set_memory_region(kvm, &region);
> 		break;
> 	}
> 
> > +				goto out;
> > +		}
> >  
> > -		r = kvm_vm_ioctl_set_memory_region(kvm, &kvm_userspace_mem);
> > +		r = kvm_vm_ioctl_set_memory_region(kvm, &region_ext);
> >  		break;
> >  	}
> >  	case KVM_GET_DIRTY_LOG: {
> > -- 
> > 2.17.1
> > 

