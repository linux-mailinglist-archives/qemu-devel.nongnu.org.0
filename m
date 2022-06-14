Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03754A9CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 08:53:11 +0200 (CEST)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o10QH-00026s-JJ
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 02:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o10MH-0000Wl-JN
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:49:03 -0400
Received: from mga01.intel.com ([192.55.52.88]:48252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.p.peng@linux.intel.com>)
 id 1o10MF-0005Vv-8U
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 02:49:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655189339; x=1686725339;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=wuX5JnFrxSq386a6TH37odo/ge8jsmW2qkPxXWwsMwk=;
 b=VDCEAeYzDnPJbN3/k6B4DHJglkIgebz892KpTOtb0fOjLGJS+/HYBwI9
 zdgaxse+klhXz6V5nk2y7oGlOLO/4R13YsZLjDF4VqGW0VVeP6FD3OQlx
 RXD855EtVvMf1aS2nVVaAphdSCju3E0oHq5LNHiUVm2Mw9ZJe9GOKvgCf
 mRRpmPGDcub+mstm5AHhZ+ujpWBMrm2bffh4wtVon5lFPPm2c6VYSFNzY
 QpCPB0s8gwqtwffVFn1kDzAQnsL8jFiIUx5rE1Wv6j6h4eGErQnNmXiMl
 19f8Rz7/hlxODq/fp7HOGQimxO39UaT2IIzVj3Kfvlir3D+YSc+AKHI6u w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303933444"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="303933444"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 23:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="582566724"
Received: from chaop.bj.intel.com (HELO localhost) ([10.240.192.101])
 by orsmga007.jf.intel.com with ESMTP; 13 Jun 2022 23:48:44 -0700
Date: Tue, 14 Jun 2022 14:45:22 +0800
From: Chao Peng <chao.p.peng@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, kvm@vger.kernel.org,
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
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Steven Price <steven.price@arm.com>,
 "Maciej S . Szmigiero" <mail@maciej.szmigiero.name>,
 Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>,
 Yu Zhang <yu.c.zhang@linux.intel.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 jun.nakajima@intel.com, dave.hansen@intel.com, ak@linux.intel.com,
 david@redhat.com, aarcange@redhat.com, ddutile@redhat.com,
 dhildenb@redhat.com, Quentin Perret <qperret@google.com>,
 Michael Roth <michael.roth@amd.com>, mhocko@suse.com
Subject: Re: [PATCH v6 4/8] KVM: Extend the memslot to support fd-based
 private memory
Message-ID: <20220614064522.GA1783435@chaop.bj.intel.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
 <20220523132154.GA947536@chaop.bj.intel.com>
 <YoumuHUmgM6TH20S@google.com>
 <20220530132613.GA1200843@chaop.bj.intel.com>
 <YqNt3Sgzge5Rph/R@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqNt3Sgzge5Rph/R@google.com>
Received-SPF: none client-ip=192.55.52.88;
 envelope-from=chao.p.peng@linux.intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, Jun 10, 2022 at 04:14:21PM +0000, Sean Christopherson wrote:
> On Mon, May 30, 2022, Chao Peng wrote:
> > On Mon, May 23, 2022 at 03:22:32PM +0000, Sean Christopherson wrote:
> > > Actually, if the semantics are that userspace declares memory as private, then we
> > > can reuse KVM_MEMORY_ENCRYPT_REG_REGION and KVM_MEMORY_ENCRYPT_UNREG_REGION.  It'd
> > > be a little gross because we'd need to slightly redefine the semantics for TDX, SNP,
> > > and software-protected VM types, e.g. the ioctls() currently require a pre-exisitng
> > > memslot.  But I think it'd work...
> > 
> > These existing ioctls looks good for TDX and probably SNP as well. For
> > softrware-protected VM types, it may not be enough. Maybe for the first
> > step we can reuse this for all hardware based solutions and invent new
> > interface when software-protected solution gets really supported.
> > 
> > There is semantics difference for fd-based private memory. Current above
> > two ioctls() use userspace addreess(hva) while for fd-based it should be
> > fd+offset, and probably it's better to use gpa in this case. Then we
> > will need change existing semantics and break backward-compatibility.
> 
> My thought was to keep the existing semantics for VMs with type==0, i.e. SEV and
> SEV-ES VMs.  It's a bit gross, but the pinning behavior is a dead end for SNP and
> TDX, so it effectively needs to be deprecated anyways. 

Yes agreed.

> I'm definitely not opposed
> to a new ioctl if Paolo or others think this is too awful, but burning an ioctl
> for this seems wasteful.

Yes, I also feel confortable if it's acceptable to reuse kvm_enc_region
to pass _gpa_ range for this new type.

> 
> Then generic KVM can do something like:
> 
> 	case KVM_MEMORY_ENCRYPT_REG_REGION:
> 	case KVM_MEMORY_ENCRYPT_UNREG_REGION:
> 		struct kvm_enc_region region;
> 
> 		if (!kvm_arch_vm_supports_private_memslots(kvm))
> 			goto arch_vm_ioctl;
> 
> 		r = -EFAULT;
> 		if (copy_from_user(&region, argp, sizeof(region)))
> 			goto out;
> 
> 		r = kvm_set_encrypted_region(ioctl, &region);
> 		break;
> 	default:
> arch_vm_ioctl:
> 		r = kvm_arch_vm_ioctl(filp, ioctl, arg);
> 
> 
> where common KVM provides
> 
>   __weak void kvm_arch_vm_supports_private_memslots(struct kvm *kvm)
>   {
> 	return false;
>   }

I already had kvm_arch_private_mem_supported() introduced in patch-07
so that can be reused.

> 
> and x86 overrides that to
> 
>   bool kvm_arch_vm_supports_private_memslots(struct kvm *kvm)
>   {
>   	/* I can't remember what we decided on calling type '0' VMs. */
> 	return !!kvm->vm_type;
>   }
> 
> and if someone ever wants to enable private memslot for SEV/SEV-ES guests we can
> always add a capability or even a new VM type.
> 
> pKVM on arm can then obviously implement kvm_arch_vm_supports_private_memslots()
> to grab whatever identifies a pKVM VM.

