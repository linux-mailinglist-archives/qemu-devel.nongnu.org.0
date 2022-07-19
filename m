Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E62157A192
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 16:31:53 +0200 (CEST)
Received: from localhost ([::1]:32852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDoGN-00030m-Ux
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 10:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDnyt-0003Qa-9y
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:13:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:58166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1oDnyr-0006VH-8D
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 10:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658240025; x=1689776025;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=/UxCRrCRwzJ4X66ZQ0IeKBQtuQGxvYag5toGoeMRWuQ=;
 b=ZdSNwcaIeJg/ushuySNK4kbBydPBZ+yI4uW1ykapPUA34echzh+ApD9K
 wJ+qa0BA01Uj+QpG5UNNRWxoLRYUQFh4iyL6mo+bBKPq7cvHKx+M7v5ds
 ei3d1+4XJa7ECLy5Xf4ISsaOWrWzhPmPBkfSUJT3QNGJcJp8t0w9SDE0k
 0Dshc2sNx/MTze+ecKwU6ozd1n2l3UEDdNW8FyLv3KRWrvC9s86JqgnnV
 Hwf2vZu+aRFTyG8B/kjOPTLE92AlSnASQyMmqLWueJyUAfOuh7Fh14S5Q
 WIGYDumNn6K2SCRjS6wqq1e/0wijmhc7PSg5//TrjrqBCbv84IphbCZ45 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="285253575"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="285253575"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:13:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655776691"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.193.75])
 by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2022 07:13:34 -0700
Date: Tue, 19 Jul 2022 22:08:43 +0800
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
Subject: Re: [PATCH v7 11/14] KVM: Register/unregister the guest private
 memory regions
Message-ID: <20220719140843.GA84779@chaop.bj.intel.com>
References: <20220706082016.2603916-1-chao.p.peng@linux.intel.com>
 <20220706082016.2603916-12-chao.p.peng@linux.intel.com>
 <f02baa37-8d34-5d07-a0ae-300ffefc7fee@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f02baa37-8d34-5d07-a0ae-300ffefc7fee@amd.com>
Received-SPF: none client-ip=192.55.52.120;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga04.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 19, 2022 at 10:00:23AM +0200, Gupta, Pankaj wrote:

...

> > +bool __weak kvm_arch_private_mem_supported(struct kvm *kvm)
> > +{
> > +	return false;
> > +}
> 
> Does this function has to be overriden by SEV and TDX to support the private
> regions?

Yes it should be overridden by architectures which want to support it.

> 
> > +
> >   static int check_memory_region_flags(const struct kvm_user_mem_region *mem)
> >   {
> >   	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> > @@ -4689,6 +4729,22 @@ static long kvm_vm_ioctl(struct file *filp,
> >   		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
> >   		break;
> >   	}
> > +#ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
> > +	case KVM_MEMORY_ENCRYPT_REG_REGION:
> > +	case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
> > +		struct kvm_enc_region region;
> > +
> > +		if (!kvm_arch_private_mem_supported(kvm))
> > +			goto arch_vm_ioctl;
> > +
> > +		r = -EFAULT;
> > +		if (copy_from_user(&region, argp, sizeof(region)))
> > +			goto out;
> > +
> > +		r = kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
> 
> this is to store private region metadata not only the encrypted region?

Correct.

> 
> Also, seems same ioctl can be used to put other regions (e.g firmware, later
> maybe DAX backend etc) into private memory?

Possibly. Depends on what exactly the semantics is. If just want to set
those regions as private current code already support that.

Chao
> 
> > +		break;
> > +	}
> > +#endif
> >   	case KVM_GET_DIRTY_LOG: {
> >   		struct kvm_dirty_log log;
> > @@ -4842,6 +4898,7 @@ static long kvm_vm_ioctl(struct file *filp,
> >   		r = kvm_vm_ioctl_get_stats_fd(kvm);
> >   		break;
> >   	default:
> > +arch_vm_ioctl:
> >   		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
> >   	}
> >   out:
> 

