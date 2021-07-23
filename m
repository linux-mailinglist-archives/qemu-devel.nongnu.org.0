Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD213D3B76
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 15:54:29 +0200 (CEST)
Received: from localhost ([::1]:40294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vdE-0001H3-Ln
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 09:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6vbs-0008EB-TV
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:53:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m6vbr-0003nM-CH
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 09:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627048382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3j3wcQlpTIYeO3Zmkf6BYFfXXcWQEzmw6Bg4tBCaPHU=;
 b=QjHm3GCleeweQfKKRKaMuvT7vH94ZSDI708C6cuF+Cew3LbLdrqtVSJ/HEZLV+2Uv2Tftj
 uTba8WpH2GbGY4UOqhIvGT//vBiqsVNxTzCnaA1a4itiBBr1+9slAK/AWcmn1HwJVWwMOJ
 GPFjmJ7cMGbTjAAbMtAcPIV8Y+tKBXw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-4REYTe8QNcub0u3sYGG5ug-1; Fri, 23 Jul 2021 09:52:59 -0400
X-MC-Unique: 4REYTe8QNcub0u3sYGG5ug-1
Received: by mail-ed1-f71.google.com with SMTP id
 v9-20020aa7cd490000b02903ae404e7fb4so776078edw.12
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 06:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3j3wcQlpTIYeO3Zmkf6BYFfXXcWQEzmw6Bg4tBCaPHU=;
 b=dAxW73fM/Ezqk3P/Tr2nKDoet6yLnEpx88MlLuQR3HvIZRtgqUuhBn4kjH4o8/3qkC
 eXUxWV0r/LR6DM5ufDNMIB5u1EZnC5nNJlyA7TJVFsyilgn11Wd2SWMlFKBS+3dcknZn
 BVD5zdZjVdTBbNX/v0IMP8e9ZXOv6IamxwPZsZBypXTCsgiYSP7cireiyHuRBLNQ1USO
 FW+gUYNxZwkuvkttYI7aEIe0sRswJe/TnjRV/daycC0qE7HACd0EDIaonUgNsUQ2tUXV
 es46VSJwtYPlMy22qWlWhVphJEd2wN1TMOw9NFN3I9v9wZ6glwBhtIO0c6I8v54q+Onh
 6iig==
X-Gm-Message-State: AOAM531xVvRNwA9EehxXS/eDTOM0qhADUkZF+s1wtvwaCoOkltAmdVl3
 YKrniOauKaipxBILduhZ/QzVWupliBbVIxVXzBaZi/8KEmcPMnTaa6HNmxq93dxRst1WFXO1NVb
 OLZadIBIsIoxtsEa/6a5mFApPSVmncHphLEuJtgKayZBpzrRJ/MZRASD67e++iGMKnyQ=
X-Received: by 2002:a17:906:81da:: with SMTP id
 e26mr4970894ejx.352.1627048378181; 
 Fri, 23 Jul 2021 06:52:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeKFJjN5+B4m+aXxFHXyYeYX41ny+1gs80FLd0bcaV/LjFixbKE2OtDOED0K/j7+La0bDsLQ==
X-Received: by 2002:a17:906:81da:: with SMTP id
 e26mr4970871ejx.352.1627048377829; 
 Fri, 23 Jul 2021 06:52:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id p26sm10770976ejd.80.2021.07.23.06.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 06:52:57 -0700 (PDT)
Subject: Re: [PATCH] target/i386: Added VGIF feature
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210723112753.46047-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <52adaf59-efaf-a56b-a7b4-624513d43875@redhat.com>
Date: Fri, 23 Jul 2021 15:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723112753.46047-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 23/07/21 13:27, Lara Lazier wrote:
> @@ -353,9 +358,12 @@ void helper_vmrun(CPUX86State *env, int aflag, int next_eip_addend)
>           tlb_flush(cs);
>           break;
>       }
> -
> -    env->hflags2 |= HF2_GIF_MASK;
> -
> +    if (virtual_gif_enabled(env, int_ctl)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl |= V_GIF_MASK);
> +    } else {
> +        env->hflags2 |= HF2_GIF_MASK;
> +    }

This should not be changed, because it is setting the "real" GIF; vGIF 
hasn't taken effect yet.

The CLGI/VMRUN/STGI sequence is there to avoid delivering an interrupt 
while the processor state has been partly changed to whatever the guest 
wants.  VMRUN sets GIF so that it is possible for interrupts (or 
NMI/SMI) to cause a vmexit, but the vmexit immediately clears the GIF 
again so that it is only handled after the host executes STGI.

>       if (int_ctl & V_IRQ_MASK) {
>           CPUState *cs = env_cpu(env);
>   
> @@ -513,13 +521,31 @@ void helper_vmsave(CPUX86State *env, int aflag)
>   void helper_stgi(CPUX86State *env)
>   {
>       cpu_svm_check_intercept_param(env, SVM_EXIT_STGI, 0, GETPC());
> -    env->hflags2 |= HF2_GIF_MASK;
> +
> +    CPUState *cs = env_cpu(env);
> +    uint32_t int_ctl = x86_ldl_phys(cs,
> +                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
> +    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl |= V_GIF_MASK);

No need to use "|=", likewise for "&=" below.

Thanks,

Paolo

> +    } else {
> +        env->hflags2 |= HF2_GIF_MASK;
> +    }
>   }
>   
>   void helper_clgi(CPUX86State *env)
>   {
>       cpu_svm_check_intercept_param(env, SVM_EXIT_CLGI, 0, GETPC());
> -    env->hflags2 &= ~HF2_GIF_MASK;
> +
> +    CPUState *cs = env_cpu(env);
> +    uint32_t int_ctl = x86_ldl_phys(cs,
> +                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
> +    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl &= ~V_GIF_MASK);
> +    } else {
> +        env->hflags2 &= ~HF2_GIF_MASK;
> +    }
>   }
>   
>   bool cpu_svm_has_intercept(CPUX86State *env, uint32_t type)
> 


