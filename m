Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D13FCC26
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:16:47 +0200 (CEST)
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7NG-0007Kl-A8
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mL7AM-0008AH-2D
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mL7AH-000785-8U
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630429390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vQUv2r18jvoOsOxOMtnzkzGPJCmvmNZQ3DZGkKe7McM=;
 b=dF9n6mTjUjrEDaELmoKrBxNfXHUszS1ep/ahjrypaDGvvaE7suu71JJX1P145pcHvWcSzl
 vkifXZX/JIKlxNshzsglMqvwzF51wcph8vFZokdT4spgBxOWwUZ9pnrNAvDvw6hY+6V5ID
 O9xkMnRnwjNCTOlfX2uQuSR4Kk5viPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-FGoPBAXiOd6JbkLHeWfkzg-1; Tue, 31 Aug 2021 13:03:07 -0400
X-MC-Unique: FGoPBAXiOd6JbkLHeWfkzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AA6893920;
 Tue, 31 Aug 2021 17:03:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 373205D6D5;
 Tue, 31 Aug 2021 17:03:05 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:03:04 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com
Subject: Re: [PULL 08/15] target/i386: Added consistency checks for CR4
Message-ID: <20210831170304.GA24819@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
 <20210722153612.955537-9-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722153612.955537-9-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 05:36:05PM +0200, Paolo Bonzini wrote:
> From: Lara Lazier <laramglazier@gmail.com>
> 
> All MBZ bits in CR4 must be zero. (APM2 15.5)
> Added reserved bitmask and added checks in both
> helper_vmrun and helper_write_crN.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

FYI this commit causes a regression with -cpu max (regression analyzed
by Daniel Berrange).  See:

https://bugzilla.redhat.com/show_bug.cgi?id=1999700

Rich.

>  target/i386/cpu.h                    | 39 ++++++++++++++++++++++++++++
>  target/i386/tcg/sysemu/misc_helper.c |  3 +++
>  target/i386/tcg/sysemu/svm_helper.c  |  9 ++++---
>  3 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 5d98a4e7c0..1f7e8d7f0a 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -240,6 +240,7 @@ typedef enum X86Seg {
>  #define CR4_OSFXSR_SHIFT 9
>  #define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
>  #define CR4_OSXMMEXCPT_MASK  (1U << 10)
> +#define CR4_UMIP_MASK   (1U << 11)
>  #define CR4_LA57_MASK   (1U << 12)
>  #define CR4_VMXE_MASK   (1U << 13)
>  #define CR4_SMXE_MASK   (1U << 14)
> @@ -251,6 +252,14 @@ typedef enum X86Seg {
>  #define CR4_PKE_MASK   (1U << 22)
>  #define CR4_PKS_MASK   (1U << 24)
>  
> +#define CR4_RESERVED_MASK \
> +(~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
> +                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
> +                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
> +                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
> +                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
> +                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
> +
>  #define DR6_BD          (1 << 13)
>  #define DR6_BS          (1 << 14)
>  #define DR6_BT          (1 << 15)
> @@ -2196,6 +2205,36 @@ static inline bool hyperv_feat_enabled(X86CPU *cpu, int feat)
>      return !!(cpu->hyperv_features & BIT(feat));
>  }
>  
> +static inline uint64_t cr4_reserved_bits(CPUX86State *env)
> +{
> +    uint64_t reserved_bits = CR4_RESERVED_MASK;
> +    if (!env->features[FEAT_XSAVE]) {
> +        reserved_bits |= CR4_OSXSAVE_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMEP)) {
> +        reserved_bits |= CR4_SMEP_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_SMAP)) {
> +        reserved_bits |= CR4_SMAP_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_EBX] & CPUID_7_0_EBX_FSGSBASE)) {
> +        reserved_bits |= CR4_FSGSBASE_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKU)) {
> +        reserved_bits |= CR4_PKE_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57)) {
> +        reserved_bits |= CR4_LA57_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_UMIP)) {
> +        reserved_bits |= CR4_UMIP_MASK;
> +    }
> +    if (!(env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_PKS)) {
> +        reserved_bits |= CR4_PKS_MASK;
> +    }
> +    return reserved_bits;
> +}
> +
>  #if defined(TARGET_X86_64) && \
>      defined(CONFIG_USER_ONLY) && \
>      defined(CONFIG_LINUX)
> diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
> index db0d8a9d79..a2af2c9bba 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -99,6 +99,9 @@ void helper_write_crN(CPUX86State *env, int reg, target_ulong t0)
>          cpu_x86_update_cr3(env, t0);
>          break;
>      case 4:
> +        if (t0 & cr4_reserved_bits(env)) {
> +            cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +        }
>          if (((t0 ^ env->cr[4]) & CR4_LA57_MASK) &&
>              (env->hflags & HF_CS64_MASK)) {
>              raise_exception_ra(env, EXCP0D_GPF, GETPC());
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 72b03a345d..d7d7a86aa9 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -85,6 +85,7 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>      uint32_t int_ctl;
>      uint32_t asid;
>      uint64_t new_cr0;
> +    uint64_t new_cr4;
>  
>      cpu_svm_check_intercept_param(env, SVM_EXIT_VMRUN, 0, GETPC());
>  
> @@ -225,14 +226,16 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>      if ((new_cr0 & CR0_NW_MASK) && !(new_cr0 & CR0_CD_MASK)) {
>          cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
>      }
> +    new_cr4 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr4));
> +    if (new_cr4 & cr4_reserved_bits(env)) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
>      /* clear exit_info_2 so we behave like the real hardware */
>      x86_stq_phys(cs,
>               env->vm_vmcb + offsetof(struct vmcb, control.exit_info_2), 0);
>  
>      cpu_x86_update_cr0(env, new_cr0);
> -    cpu_x86_update_cr4(env, x86_ldq_phys(cs,
> -                                     env->vm_vmcb + offsetof(struct vmcb,
> -                                                             save.cr4)));
> +    cpu_x86_update_cr4(env, new_cr4);
>      cpu_x86_update_cr3(env, x86_ldq_phys(cs,
>                                       env->vm_vmcb + offsetof(struct vmcb,
>                                                               save.cr3)));
> -- 
> 2.31.1
> 
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org


