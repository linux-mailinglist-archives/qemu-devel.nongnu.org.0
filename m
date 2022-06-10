Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F35546A5E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:29:59 +0200 (CEST)
Received: from localhost ([::1]:47918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhWI-0001Q3-MU
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nzhHJ-00042O-UT
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:14:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1nzhHI-0008Dh-0s
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:14:29 -0400
Received: by mail-pf1-x433.google.com with SMTP id g205so24228597pfb.11
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sqYpRJpV7hTVkJzWeySC/55ywPreerEYyAHVK7rq9LA=;
 b=ZehwwLYuij7pbQaghWD2GrdTIOfQ1XgasEUmVI+nhvd82X4ZEWGF79XBvheRliFM+8
 LQlrxByJVokCQ/gINBsFhOZhZjHXcpmAir492TXOaXI7iC/F7Bwi4ptRQtYUbYGyY5SQ
 TxK5qW/wV8CCV8YqQLV5jWM8YEEm92a1WCcQVxigUczBkLKzhwgrSGPjDy4yzeckQMEl
 k23GcmLFp8s0aWbczjuNfnjBEB9gzzj7nGZZJi5rfah1FRb/8MQ3Cd99incf77459IOk
 fmV8msfIleb4V2r4FMWvWw0fr1RX3bQCUO2JP23SfG2qby97FTF15ddfD8Y7n8su8tG3
 h2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sqYpRJpV7hTVkJzWeySC/55ywPreerEYyAHVK7rq9LA=;
 b=5BW66BCfI/Q8ihhTeNV5TS4/MChV84vjoJx1PzouXOAhg3JxxBEO3GrDI4Mj+6xt43
 1Qlbx8u7Mmqvr1Y3OxDMkj/X3WjrblStJgr5+/XN+H1z1n1EugIjIv6bd8KiZlp0mGdy
 vtaxDn/BRt36hncqmcn2/n2VgELfPff0BRSOeWaCBFccnUIymdfUcWdcQv/LKr138L05
 ovMXyFCMRNSGu46t/1WiXuCzcrKkp8+dlCMr1cR+WjT2/vQlFYgqQevhe03DZicLBIP7
 VdC2LUFeGBADhEfrFSDJLR2NGHk9G2hNMR97E/G4JOs0wQOGhTtzHbqxXlYuA0B8zFd2
 zQ7g==
X-Gm-Message-State: AOAM532B+MnPeI6gMp/kirmA+rJaMnbRDVUWyHEg1G9XWoZUlhpwiMmN
 u/MrYBVorMpRvUtCnJQoHOTnXQ==
X-Google-Smtp-Source: ABdhPJzxrryZznx/9GnvIIDqh+c23V5/Xt5ZsJHD0N8PohIbtiXWvM06mGWU66DmH3LeRvNyTftAHA==
X-Received: by 2002:a63:5:0:b0:3fe:2558:677 with SMTP id
 5-20020a630005000000b003fe25580677mr14572323pga.113.1654877666234; 
 Fri, 10 Jun 2022 09:14:26 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157]) by smtp.gmail.com with ESMTPSA id
 r11-20020a170902e3cb00b0015e8d4eb28csm18669442ple.214.2022.06.10.09.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:14:25 -0700 (PDT)
Date: Fri, 10 Jun 2022 16:14:21 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Peng <chao.p.peng@linux.intel.com>
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
Message-ID: <YqNt3Sgzge5Rph/R@google.com>
References: <20220519153713.819591-1-chao.p.peng@linux.intel.com>
 <20220519153713.819591-5-chao.p.peng@linux.intel.com>
 <8840b360-cdb2-244c-bfb6-9a0e7306c188@kernel.org>
 <YofeZps9YXgtP3f1@google.com>
 <20220523132154.GA947536@chaop.bj.intel.com>
 <YoumuHUmgM6TH20S@google.com>
 <20220530132613.GA1200843@chaop.bj.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220530132613.GA1200843@chaop.bj.intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=seanjc@google.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 30, 2022, Chao Peng wrote:
> On Mon, May 23, 2022 at 03:22:32PM +0000, Sean Christopherson wrote:
> > Actually, if the semantics are that userspace declares memory as private, then we
> > can reuse KVM_MEMORY_ENCRYPT_REG_REGION and KVM_MEMORY_ENCRYPT_UNREG_REGION.  It'd
> > be a little gross because we'd need to slightly redefine the semantics for TDX, SNP,
> > and software-protected VM types, e.g. the ioctls() currently require a pre-exisitng
> > memslot.  But I think it'd work...
> 
> These existing ioctls looks good for TDX and probably SNP as well. For
> softrware-protected VM types, it may not be enough. Maybe for the first
> step we can reuse this for all hardware based solutions and invent new
> interface when software-protected solution gets really supported.
> 
> There is semantics difference for fd-based private memory. Current above
> two ioctls() use userspace addreess(hva) while for fd-based it should be
> fd+offset, and probably it's better to use gpa in this case. Then we
> will need change existing semantics and break backward-compatibility.

My thought was to keep the existing semantics for VMs with type==0, i.e. SEV and
SEV-ES VMs.  It's a bit gross, but the pinning behavior is a dead end for SNP and
TDX, so it effectively needs to be deprecated anyways.  I'm definitely not opposed
to a new ioctl if Paolo or others think this is too awful, but burning an ioctl
for this seems wasteful.

Then generic KVM can do something like:

	case KVM_MEMORY_ENCRYPT_REG_REGION:
	case KVM_MEMORY_ENCRYPT_UNREG_REGION:
		struct kvm_enc_region region;

		if (!kvm_arch_vm_supports_private_memslots(kvm))
			goto arch_vm_ioctl;

		r = -EFAULT;
		if (copy_from_user(&region, argp, sizeof(region)))
			goto out;

		r = kvm_set_encrypted_region(ioctl, &region);
		break;
	default:
arch_vm_ioctl:
		r = kvm_arch_vm_ioctl(filp, ioctl, arg);


where common KVM provides

  __weak void kvm_arch_vm_supports_private_memslots(struct kvm *kvm)
  {
	return false;
  }

and x86 overrides that to

  bool kvm_arch_vm_supports_private_memslots(struct kvm *kvm)
  {
  	/* I can't remember what we decided on calling type '0' VMs. */
	return !!kvm->vm_type;
  }

and if someone ever wants to enable private memslot for SEV/SEV-ES guests we can
always add a capability or even a new VM type.

pKVM on arm can then obviously implement kvm_arch_vm_supports_private_memslots()
to grab whatever identifies a pKVM VM.

