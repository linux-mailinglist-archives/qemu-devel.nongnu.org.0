Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523E3D14A7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:54:51 +0200 (CEST)
Received: from localhost ([::1]:50650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FUg-0006qs-Co
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6FTM-0005qj-Kj
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:53:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6FTK-0004mI-PZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626886405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svIrYblkxJ+HT+048QpbJOi4KoT4rrfh9gTe2oBu6Qg=;
 b=gCf66TwsFU26dcvSDMAgRGRKeiBRNKyp2mmX+uNGy9loG4755d1JhYBdUVOSRdY4PlubCy
 cf/B87QJQIxpTryUGi9f5DVyhaKbpCUTUVVILRPI0fsBDT2yNFJJv86GhN2tUysqjXoivJ
 vWoBfRfo06w/bu2Qd+evLjNVo9NDav4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590--TmXSxXmMd2gRlb1PjTpTw-1; Wed, 21 Jul 2021 12:53:23 -0400
X-MC-Unique: -TmXSxXmMd2gRlb1PjTpTw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c1d06b0290225338d8f53so804951wms.8
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=svIrYblkxJ+HT+048QpbJOi4KoT4rrfh9gTe2oBu6Qg=;
 b=hX3NCuxiYM8Mt2yHsRe7F2mt9jPULjSuk1EUEB2DhwQtoFphJxfrN0JZvkAeZBuxF/
 7StS/+7uPKbhoX2QhW1X5l7rUGhrHQwTexU20pBwCinL6Rp1ojoEPnvIEMzFcyl+kdMx
 UIJGxqd1w8RoPWVV8c+1dpkRaL3BZ3GUCzcN7yhxOC4OGmFngRqmJ8gZr22F2krWEHuq
 e5Qqn1se3x3r1s9PWynBdqFpZeFa6m6mFvsScj+jH1I9HDTDP3bZ6qgW0GX+isnrLHKB
 mFLCdxhfK8kyGJEJMO7XeZh1OHsvKqrK4ItrPkRGf4JWAigP0L8Ljtiot1jAardsVcYw
 BCXw==
X-Gm-Message-State: AOAM532klVf5TACmCCHlGsircnaMdJI7KrwnxejqiICBiVCnXM+92e4J
 7klF0CZHqVgOSdhHKcAELH6cGA2PS0neJufaiIjqzmrJAVq/ea0JdeoPoKEx1BvLx8gj3tc4kSK
 oxu/a4xrIGVklhoQOC1PLaaY+Nz5asB7i/A65RTD/UQSRr42hCyQ2oOxsGMyRtxdtmaI=
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr16908637wrt.185.1626886402277; 
 Wed, 21 Jul 2021 09:53:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7pqNO92Rtiphlfsg6Ybx1IK/wf1NAOXLSd4Sv3vytuVqiIbb56XSVqIY7VbJFn2cnMl0MZw==
X-Received: by 2002:a5d:4d0f:: with SMTP id z15mr16908610wrt.185.1626886401992; 
 Wed, 21 Jul 2021 09:53:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j12sm28107605wrq.83.2021.07.21.09.53.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:53:21 -0700 (PDT)
Subject: Re: [PATCH v2] target/i386: Added consistency checks for EFER
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210721152651.14683-1-laramglazier@gmail.com>
 <20210721152651.14683-3-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d399cdc8-527e-4fba-4a66-54723c5a68f4@redhat.com>
Date: Wed, 21 Jul 2021 18:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721152651.14683-3-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/21 17:26, Lara Lazier wrote:
> EFER.SVME has to be set, and EFER reserved bits must
> be zero.
> In addition the combinations
>   * EFER.LMA or EFER.LME is non-zero and the processor does not support LM
>   * non-zero EFER.LME and CR0.PG and zero CR4.PAE
>   * non-zero EFER.LME and CR0.PG and zero CR0.PE
>   * non-zero EFER.LME, CR0.PG, CR4.PAE, CS.L and CS.D
> are all invalid.
> (AMD64 Architecture Programmer's Manual, V2, 15.5)
> 
> Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> ---
>   target/i386/cpu.h                   |  5 ++++
>   target/i386/tcg/sysemu/svm_helper.c | 40 +++++++++++++++++++++++++++++
>   2 files changed, 45 insertions(+)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 5d98a4e7c0..0b3057bdb6 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -466,6 +466,11 @@ typedef enum X86Seg {
>   #define MSR_EFER_SVME  (1 << 12)
>   #define MSR_EFER_FFXSR (1 << 14)
>   
> +#define MSR_EFER_RESERVED\
> +        (~(target_ulong)(MSR_EFER_SCE | MSR_EFER_LME\
> +            | MSR_EFER_LMA | MSR_EFER_NXE | MSR_EFER_SVME\
> +            | MSR_EFER_FFXSR))
> +
>   #define MSR_STAR                        0xc0000081
>   #define MSR_LSTAR                       0xc0000082
>   #define MSR_CSTAR                       0xc0000083
> diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
> index 00618cff23..b6df36d4e5 100644
> --- a/target/i386/tcg/sysemu/svm_helper.c
> +++ b/target/i386/tcg/sysemu/svm_helper.c
> @@ -65,6 +65,42 @@ static inline void svm_load_seg_cache(CPUX86State *env, hwaddr addr,
>                              sc->base, sc->limit, sc->flags);
>   }
>   
> +static inline bool is_efer_invalid_state (CPUX86State *env)
> +{
> +    if (!(env->efer & MSR_EFER_SVME)) {
> +        return true;
> +    }
> +
> +    if (env->efer & MSR_EFER_RESERVED) {
> +        return true;
> +    }
> +
> +    if ((env->efer & (MSR_EFER_LMA | MSR_EFER_LME)) &&
> +            !(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_LM)) {
> +        return true;
> +    }
> +
> +    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
> +                                && !(env->cr[4] & CR4_PAE_MASK)) {
> +        return true;
> +    }
> +
> +    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
> +                                && !(env->cr[0] & CR0_PE_MASK)) {
> +        return true;
> +    }
> +
> +    if ((env->efer & MSR_EFER_LME) && (env->cr[0] & CR0_PG_MASK)
> +                                && (env->cr[4] & CR4_PAE_MASK)
> +                                && (env->segs[R_CS].flags & DESC_L_MASK)
> +                                && (env->segs[R_CS].flags & DESC_B_MASK)) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +
>   void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>   {
>       CPUState *cs = env_cpu(env);
> @@ -278,6 +314,10 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>       }
>   #endif
>   
> +    if (is_efer_invalid_state(env)) {
> +        cpu_vmexit(env, SVM_EXIT_ERR, 0, GETPC());
> +    }
> +
>       switch (x86_ldub_phys(cs,
>                         env->vm_vmcb + offsetof(struct vmcb, control.tlb_ctl))) {
>       case TLB_CONTROL_DO_NOTHING:
> 

Queued all, thanks.  However I modified the CR4 one to use a static 
inline function instead of a macro (the KVM code you based it on reuses 
the code for both the host and the guest CPUID, but this is not the case 
in QEMU).

Paolo


