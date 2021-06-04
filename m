Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C9F39B835
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 13:43:57 +0200 (CEST)
Received: from localhost ([::1]:39892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp8F2-0002gl-IF
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 07:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lp8Dr-0001Sb-SH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:42:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:56426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cmarinas@kernel.org>)
 id 1lp8Do-0007vi-Uq
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 07:42:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89B72613E9;
 Fri,  4 Jun 2021 11:42:36 +0000 (UTC)
Date: Fri, 4 Jun 2021 12:42:34 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v13 7/8] KVM: arm64: ioctl to fetch/store tags in a guest
Message-ID: <20210604114233.GE31173@arm.com>
References: <20210524104513.13258-1-steven.price@arm.com>
 <20210524104513.13258-8-steven.price@arm.com>
 <20210603171336.GH20338@arm.com>
 <02c7682e-5fb6-29eb-9105-02e3521756a2@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02c7682e-5fb6-29eb-9105-02e3521756a2@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=cmarinas@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Haibo Xu <Haibo.Xu@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, qemu-devel@nongnu.org,
 Marc Zyngier <maz@kernel.org>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, linux-kernel@vger.kernel.org,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 Julien Thierry <julien.thierry.kdev@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 04, 2021 at 12:15:56PM +0100, Steven Price wrote:
> On 03/06/2021 18:13, Catalin Marinas wrote:
> > On Mon, May 24, 2021 at 11:45:12AM +0100, Steven Price wrote:
> >> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> >> index 24223adae150..b3edde68bc3e 100644
> >> --- a/arch/arm64/include/uapi/asm/kvm.h
> >> +++ b/arch/arm64/include/uapi/asm/kvm.h
> >> @@ -184,6 +184,17 @@ struct kvm_vcpu_events {
> >>  	__u32 reserved[12];
> >>  };
> >>  
> >> +struct kvm_arm_copy_mte_tags {
> >> +	__u64 guest_ipa;
> >> +	__u64 length;
> >> +	void __user *addr;
> >> +	__u64 flags;
> >> +	__u64 reserved[2];
> >> +};
> >> +
> >> +#define KVM_ARM_TAGS_TO_GUEST		0
> >> +#define KVM_ARM_TAGS_FROM_GUEST		1
> >> +
> >>  /* If you need to interpret the index values, here is the key: */
> >>  #define KVM_REG_ARM_COPROC_MASK		0x000000000FFF0000
> >>  #define KVM_REG_ARM_COPROC_SHIFT	16
> >> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> >> index e89a5e275e25..baa33359e477 100644
> >> --- a/arch/arm64/kvm/arm.c
> >> +++ b/arch/arm64/kvm/arm.c
> >> @@ -1345,6 +1345,13 @@ long kvm_arch_vm_ioctl(struct file *filp,
> >>  
> >>  		return 0;
> >>  	}
> >> +	case KVM_ARM_MTE_COPY_TAGS: {
> >> +		struct kvm_arm_copy_mte_tags copy_tags;
> >> +
> >> +		if (copy_from_user(&copy_tags, argp, sizeof(copy_tags)))
> >> +			return -EFAULT;
> >> +		return kvm_vm_ioctl_mte_copy_tags(kvm, &copy_tags);
> >> +	}
> > 
> > I wonder whether we need an update of the user structure following a
> > fault, like how much was copied etc. In case of an error, some tags were
> > copied and the VMM may want to skip the page before continuing. But here
> > there's no such information provided.
> > 
> > On the ptrace interface, we return 0 on the syscall if any bytes were
> > copied and update iov_len to such number. Maybe you want to still return
> > an error here but updating copy_tags.length would be nice (and, of
> > course, a copy_to_user() back).
> 
> Good idea - as you suggest I'll make it update length with the number of
> bytes not processed. Although in general I think we're expecting the VMM
> to know where the memory is so this is more of a programming error - but
> could still be useful for debugging.

Or update it to the number of bytes copied to be consistent with
ptrace()'s iov.len. On success, the structure is effectively left
unchanged.

-- 
Catalin

