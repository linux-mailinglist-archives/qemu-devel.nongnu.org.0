Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4BD3E2C15
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:07:28 +0200 (CEST)
Received: from localhost ([::1]:50386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0VT-0003iy-6V
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC0UG-0002lR-9L
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mC0UD-0005TJ-3q
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:06:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628258767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lO16NulCqeix0MZZ3nOQC22QC2DP+SLoSHiHr2cOT8g=;
 b=QPpMSh8f/RNvz0mxRgWnJYDa8mvCpbtZOfdckmLgy4rpRHkCdbBjolhg8ou/isg0TGSsJS
 m0FSdYPwALDm5XOsDfaRHqyTFJtEpo4w8C0KhvawduJ83HJ+CdU6ULe5/jvkDTXJ5xiutk
 NoU//kAHIQ0o0nMpkE3iwS1AuCCDLcU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-m6fhKcrrPkaJI8BWxXSIJQ-1; Fri, 06 Aug 2021 10:06:05 -0400
X-MC-Unique: m6fhKcrrPkaJI8BWxXSIJQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 q19-20020a1709064cd3b02904c5f93c0124so3140617ejt.14
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lO16NulCqeix0MZZ3nOQC22QC2DP+SLoSHiHr2cOT8g=;
 b=DuGseRQIMqHIIyI5DXq7xWgyCVuB3AoGv9UsHagL9d5OKzBv5d4fCsNlt/3VuTAkrK
 wNhR1rSQfLckq+jUXfeNJRFkayxwa8nbZZdRh2mGio80zdFpHB4qqe7jBikAUida3yxK
 eFDP2xtToaRtAGjcUF2q+nXEDvgQIRA4yWCvKQo9BKjSmGO9cvR7PqnN9PfkpBGuQllh
 qCXk85KRJh7Ash/G+MEHVYn7WE9F3rKBpPhPZTHGMLR6yC9s5seQLBf0gm9PDo89D9Lk
 5ogOtSepDjy8yx3SijE/FG3KdrFzspqmh1sZzamm+1Cb2NRAef48xkQVn0QKwLP96Nrb
 6wLA==
X-Gm-Message-State: AOAM53031T4GVYc/+YyVGcRtiMXXX/Bw3Re3XpTxtOg07hRLxrv8T0kK
 ll54JnI14BL5QGlCoWHvbSeGz4PQU62mMgIyfF045+N3wxnuom59gZpqGWmhroWr3woVFGy6MGC
 aXY6FVHs0P6qTFVoGIwFUms7oIPlDeR30efRzKAeDLWwy1Cnnmt19vord3ZNJAZB66QI=
X-Received: by 2002:a17:906:5fc7:: with SMTP id
 k7mr9678309ejv.377.1628258764239; 
 Fri, 06 Aug 2021 07:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQpwvCeinZ9ldKWfylIQhEGPR/ScDbuCC+VMgsl7TSpEjAf0rYAv5fQ7mQAIBO7AES5IcJjw==
X-Received: by 2002:a17:906:5fc7:: with SMTP id
 k7mr9678288ejv.377.1628258764006; 
 Fri, 06 Aug 2021 07:06:04 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id yc29sm2922389ejb.104.2021.08.06.07.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:06:03 -0700 (PDT)
Subject: Re: [PATCH] target/i386: VMRUN and VMLOAD canonicalizations
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210804113058.45186-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <75d0eb3d-839d-0707-3e6e-0a49557b5bfa@redhat.com>
Date: Fri, 6 Aug 2021 16:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804113058.45186-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.619, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/08/21 13:30, Lara Lazier wrote:
> APM2 requires that VMRUN and VMLOAD canonicalize (sign extend to 63
> from 48/57) all base addresses in the segment registers that have been
> respectively loaded.
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/cpu.c                   | 19 +++++++++++--------
>   target/i386/cpu.h                   |  2 ++
>   target/i386/tcg/sysemu/svm_helper.c | 27 +++++++++++++++++----------
>   3 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 71d26cf1bd..de4c8316c9 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5108,6 +5108,15 @@ static void x86_register_cpudef_types(const X86CPUDefinition *def)
>   
>   }
>   
> +uint32_t cpu_x86_virtual_addr_width(CPUX86State *env)
> +{
> +    if  (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57) {
> +        return 57; /* 57 bits virtual */
> +    } else {
> +        return 48; /* 48 bits virtual */
> +    }
> +}
> +
>   void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                      uint32_t *eax, uint32_t *ebx,
>                      uint32_t *ecx, uint32_t *edx)
> @@ -5510,16 +5519,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       case 0x80000008:
>           /* virtual & phys address size in low 2 bytes. */
> +        *eax = cpu->phys_bits;
>           if (env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM) {
>               /* 64 bit processor */
> -            *eax = cpu->phys_bits; /* configurable physical bits */
> -            if  (env->features[FEAT_7_0_ECX] & CPUID_7_0_ECX_LA57) {
> -                *eax |= 0x00003900; /* 57 bits virtual */
> -            } else {
> -                *eax |= 0x00003000; /* 48 bits virtual */
> -            }
> -        } else {
> -            *eax = cpu->phys_bits;
> +             *eax |= (cpu_x86_virtual_addr_width(env) << 8);
>           }
>           *ebx = env->features[FEAT_8000_0008_EBX];
>           if (cs->nr_cores * cs->nr_threads > 1) {
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 6c50d3ab4f..c9c7350c76 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1954,6 +1954,8 @@ typedef struct PropValue {
>   } PropValue;
>   void x86_cpu_apply_props(X86CPU *cpu, PropValue *props);
>   
> +uint32_t cpu_x86_virtual_addr_width(CPUX86State *env);
> +
>   /* cpu.c other functions (cpuid) */
>   void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                      uint32_t *eax, uint32_t *ebx,
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 6c29a6a778..032561ef8c 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -41,6 +41,16 @@ static inline void svm_save_seg(CPUX86State *env, hwaddr addr,
>                ((sc->flags >> 8) & 0xff) | ((sc->flags >> 12) & 0x0f00));
>   }
>   
> +/*
> + * VMRUN and VMLOAD canonicalizes (i.e., sign-extend to bit 63) all base
> + * addresses in the segment registers that have been loaded.
> + */
> +static inline void svm_canonicalization(CPUX86State *env, target_ulong *seg_base)
> +{
> +    uint16_t shift_amt = 64 - cpu_x86_virtual_addr_width(env);
> +    *seg_base = ((((long) *seg_base) << shift_amt) >> shift_amt);
> +}
> +
>   static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
>                                   SegmentCache *sc)
>   {
> @@ -53,6 +63,7 @@ static inline void svm_load_seg(CPUX86State *env, hwaddr addr,
>       sc->limit = x86_ldl_phys(cs, addr + offsetof(struct vmcb_seg, limit));
>       flags = x86_lduw_phys(cs, addr + offsetof(struct vmcb_seg, attrib));
>       sc->flags = ((flags & 0xff) << 8) | ((flags & 0x0f00) << 12);
> +    svm_canonicalization(env, &sc->base);
>   }
>   
>   static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
> @@ -256,16 +267,6 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       env->tsc_offset = x86_ldq_phys(cs, env->vm_vmcb +
>                                  offsetof(struct vmcb, control.tsc_offset));
>   
> -    env->gdt.base  = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
> -                                                      save.gdtr.base));
> -    env->gdt.limit = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
> -                                                      save.gdtr.limit));
> -
> -    env->idt.base  = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
> -                                                      save.idtr.base));
> -    env->idt.limit = x86_ldl_phys(cs, env->vm_vmcb + offsetof(struct vmcb,
> -                                                      save.idtr.limit));
> -
>       new_cr0 = x86_ldq_phys(cs, env->vm_vmcb + offsetof(struct vmcb, save.cr0));
>       if (new_cr0 & SVM_CR0_RESERVED_MASK) {
>           cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> @@ -319,6 +320,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>                          R_SS);
>       svm_load_seg_cache(env, env->vm_vmcb + offsetof(struct vmcb, save.ds),
>                          R_DS);
> +    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.idtr),
> +                       &env->idt);
> +    svm_load_seg(env, env->vm_vmcb + offsetof(struct vmcb, save.gdtr),
> +                       &env->gdt);
>   
>       env->eip = x86_ldq_phys(cs,
>                           env->vm_vmcb + offsetof(struct vmcb, save.rip));
> @@ -456,6 +461,7 @@ void helper_vmload(CPUX86State *env, int aflag)
>       env->lstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.lstar));
>       env->cstar = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.cstar));
>       env->fmask = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.sfmask));
> +    svm_canonicalization(env, &env->kernelgsbase);
>   #endif
>       env->star = x86_ldq_phys(cs, addr + offsetof(struct vmcb, save.star));
>       env->sysenter_cs = x86_ldq_phys(cs,
> @@ -464,6 +470,7 @@ void helper_vmload(CPUX86State *env, int aflag)
>                                                    save.sysenter_esp));
>       env->sysenter_eip = x86_ldq_phys(cs, addr + offsetof(struct vmcb,
>                                                    save.sysenter_eip));
> +
>   }
>   
>   void helper_vmsave(CPUX86State *env, int aflag)
> 

Queued, thanks.

Paolo


