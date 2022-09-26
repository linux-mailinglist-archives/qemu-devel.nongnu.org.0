Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A6A5EA865
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:29:33 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp6x-0002Gy-LI
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oconw-0001iH-7I
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:09:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:18822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1ocons-0001ru-KO
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664201388; x=1695737388;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=kLBWR5qEV1U14bOBHrdj86S+fx8bShjKVx0oSvRe47k=;
 b=DpBfsZrInNXbQPqbhyL332mH2Hrylub3+fxKsjkKs0CRavKPmnEAHRx9
 IdR+kY415kviHdEYc6baOO9EIHTLrImjTWPqnVBBMWkHDjpfWV8Q7lRM0
 i0AzdiiXNGjoJgWaH19+La7pMoFX7VlCtMJNqXyQ3qKsvwjsWi9HTrFyM
 zmKcBPpQ7YG9FNZ82tniTb5IHYAgRjPHukKAwVUuhopQhNSOKYGO7ht2+
 T/a5+1gpWDD2lHaU+hTJfmQfb3Qq3zJQFALhTgVKQF0VN4jZSWvrjN/KV
 pzEbLf7XpyJIADHH9hOVL656jRRaE2kEPKb3A7lbtpc2/wDjsX72FNFV2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="365068853"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="365068853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 07:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="651840417"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; d="scan'208";a="651840417"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by orsmga008.jf.intel.com with ESMTP; 26 Sep 2022 07:09:28 -0700
Date: Mon, 26 Sep 2022 22:04:51 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>,
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
Message-ID: <20220926140451.GA2658254@chaop.bj.intel.com>
References: <20220915142913.2213336-1-chao.p.peng@linux.intel.com>
 <20220915142913.2213336-3-chao.p.peng@linux.intel.com>
 <CA+EHjTzHTaDaAKEMjFHzXLBgUS4bMfnppzO==KeDGpyUKO0fCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzHTaDaAKEMjFHzXLBgUS4bMfnppzO==KeDGpyUKO0fCw@mail.gmail.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga07.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 26, 2022 at 11:26:45AM +0100, Fuad Tabba wrote:
...

> > +
> > +- KVM_MEM_PRIVATE can be set to indicate a new slot has private memory backed by
> > +  a file descirptor(fd) and the content of the private memory is invisible to
> 
> s/descirptor/descriptor

Thanks.

...

>  static long kvm_vm_ioctl(struct file *filp,
> >                            unsigned int ioctl, unsigned long arg)
> >  {
> > @@ -4645,14 +4672,20 @@ static long kvm_vm_ioctl(struct file *filp,
> >                 break;
> >         }
> >         case KVM_SET_USER_MEMORY_REGION: {
> > -               struct kvm_userspace_memory_region kvm_userspace_mem;
> > +               struct kvm_user_mem_region mem;
> > +               unsigned long size = sizeof(struct kvm_userspace_memory_region);
> 
> nit: should this be sizeof(struct mem)? That's more similar to the
> existing code and makes it dependent on the size of mem regardless of
> possible changes to its type in the future.

Unluckily no, the size we need copy_from_user() depends on the flags,
e.g. without KVM_MEM_PRIVATE, we can't safely copy that big size since
the 'extended' part may not even exist.

> 
> > +
> > +               kvm_sanity_check_user_mem_region_alias();
> >
> >                 r = -EFAULT;
> > -               if (copy_from_user(&kvm_userspace_mem, argp,
> > -                                               sizeof(kvm_userspace_mem)))
> > +               if (copy_from_user(&mem, argp, size);
> 
> It gets fixed in a future patch, but the ; should be a ).

Good catch, thanks!

Chao
> 
> Cheers,
> /fuad

