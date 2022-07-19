Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA657A134
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:21:06 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDo5x-0006f2-Ig
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:21:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDo39-0000YK-Jl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:18:12 -0400
Received: from mga14.intel.com ([192.55.52.115]:33818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDo34-00079S-Ls
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:18:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658240286; x=1689776286;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=uCiOnx7XhlhIdPTfR9PaYhGj+08ZCZ+aPucYOLw91eY=;
 b=McyKUVQsWBbp1icnoxVZUzttfD7NNP0WIsbbWpBTfi8ogtjx9nQtB3W6
 Pq+je4hJe9WEG5j6gFc+pzNhQLm0IFDDTZpRW2Ek86PwjYj11egM+6kX8
 dv+YzaK4AQ00JCzTUvGV8mN79mGB5QzGmCrWJWLtlA3fMcS1ytwvr+2nS
 ufPDHCGxLWKz7/aobfd6JQ49AmYE6anfXCRthq/H18pJ7aMM7Qbvk9nt1
 H6nGMz6MZ1BxOpmXkvFHkgGFhp14WkU6ohuOej/4GGI2SKieBq/nv1GOB
 rLvzA5NTQlofAAYWlWwB3ApWr6jYN6imxg54A/aPIRXZOF7cEOzof20C4 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="286515613"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="286515613"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655777767"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2022 07:17:33 -0700
Date: Tue, 19 Jul 2022 22:12:43 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: "Gupta, Pankaj" <pankaj.gupta@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Sean Christopherson <seanjc@google.com>,
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
 Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH v7 13/14] KVM: Enable and expose KVM_MEM_PRIVATE
Message-ID: <20220719141243.GB84779@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-14-chao.p.peng@linux.intel.com>
 <de1e15b8-b7e7-d077-eff8-0992bd06e38a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de1e15b8-b7e7-d077-eff8-0992bd06e38a@amd.com>
Received-SPF: none client-ip=192.55.52.115;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 11:55:24AM +0200, Gupta, Pankaj wrote:

...

> > @@ -4712,12 +4813,10 @@ static long kvm_vm_ioctl(struct file *filp,
> >   			(u32 __user *)(argp + offsetof(typeof(mem), flags))))
> >   			goto out;
> > -		if (flags & KVM_MEM_PRIVATE) {
> > -			r = -EINVAL;
> > -			goto out;
> > -		}
> > -
> > -		size = sizeof(struct kvm_userspace_memory_region);
> > +		if (flags & KVM_MEM_PRIVATE)
> > +			size = sizeof(struct kvm_userspace_memory_region_ext);
> 
> Not sure if we use kvm_userspace_memory_region_ext or kvm_user_mem_region,
> just for readability.

Somehow, but majorly for code maintainability, kvm_user_mem_region is
designed to be the alias of kvm_userspace_memory_region_ext so in the
code we can access the 'unpacked' fields using something like
'mem.usersapce_addr' instead of 'mem.region.userspace_addr'.

Chao
> 
> > +		else
> > +			size = sizeof(struct kvm_userspace_memory_region);
> >   		if (copy_from_user(&mem, argp, size))
> >   			goto out;

