Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D973BF13C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 23:09:59 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Enu-0008SS-DK
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 17:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EmV-00074m-TR
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:08:31 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1EmU-0003Y3-8h
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 17:08:31 -0400
Received: by mail-pf1-x433.google.com with SMTP id 21so3432165pfp.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uEaeVWcswi2S7NlBPD2BIduTnNEYLCeYr2L1OnERT9s=;
 b=HENiRv4bp40WQ715BjGXDS2kcAo6lKJrjzUYHCOdZctXkGQBusOQLW079I9Xcb4efj
 PVS3DGHtRkIFpBpgEu98gsuij+DhExHcE9DaRbCU2hoJj6e+4MECAonSnN67WIbSMrZ4
 3kG34pBzdIoUNPXDg+0DFtDqlVbvdVp7sVGVgbNdFdaqpB9/CMcInHv8RBemjVeWZuAA
 sVYT7j79CQKOby4dkOe3VObPp6mj3YjoAkvxXgQ90RIt34wsy7oHRe5RrD3eUPWEXHI5
 qmRFlGB/mbicAAnOnBNcX/uVXC/gzh10sL9niw2wPd2boJTlsrQy9kbAJP75eonNV4q5
 ZZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uEaeVWcswi2S7NlBPD2BIduTnNEYLCeYr2L1OnERT9s=;
 b=HenQO6TOaTzBLVXtQ2FBffmoV8VE68ho5HA2CvQYGHyJaha/GCCZ/2/PCvVpmo0exG
 uH5g6xlMkBCOCO1vqzMDAYZZlVwzihJlQBo1uAd1PseYSv9VGhXopWF6vNo6i/ZbMCQJ
 iZ46yr++yjo5ALMNtBoMIfWjVo40FyD4N2HzIhufnF3tMFiosh36x65ozWs3WrjEsbAr
 fWesQwVK4Do2icRWOcFHl5Kt+C6Okw+3s3NmJTW1+SVDbm/WOAGDGc1lQHRbNqj8RWdT
 xFpQEA89RDvG+1A3vt9yTFhQz7gRfUVGzTnb4eA/btTVA2LvIrqNUgMQRaA0dUCYWABE
 JFcA==
X-Gm-Message-State: AOAM53046LR+J3/dEKoqn6ePelv+EHm+sEsPQIVJA4WAqczICmd3UVsr
 87tNn1/3+YCHLJGy0qMPCq2n6w==
X-Google-Smtp-Source: ABdhPJwfsUpnfBkgHkFNfa6bXQqviLoo5VfdaBGVuAtaPVYZAz1kdCJ2gZtgyGKmQgMYYdh+BeWP/w==
X-Received: by 2002:aa7:9e1a:0:b029:31d:144d:da08 with SMTP id
 y26-20020aa79e1a0000b029031d144dda08mr20668116pfq.11.1625692108646; 
 Wed, 07 Jul 2021 14:08:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k10sm102454pfc.169.2021.07.07.14.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 14:08:28 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] target/i386: Correct implementation for FCS, FIP, 
 FDS and FDP
To: Ziqiao Kong <ziqiaokong@gmail.com>, qemu-devel@nongnu.org
References: <20210530150112.74411-1-ziqiaokong@gmail.com>
 <20210530150112.74411-2-ziqiaokong@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <56f215ae-8535-90ee-44f7-a30e712e0318@linaro.org>
Date: Wed, 7 Jul 2021 14:08:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210530150112.74411-2-ziqiaokong@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/30/21 8:01 AM, Ziqiao Kong wrote:
>       /* fninit */
> -    env->fpus = 0;
> -    env->fpstt = 0;
> -    cpu_set_fpuc(env, 0x37f);
> -    env->fptags[0] = 1;
> -    env->fptags[1] = 1;
> -    env->fptags[2] = 1;
> -    env->fptags[3] = 1;
> -    env->fptags[4] = 1;
> -    env->fptags[5] = 1;
> -    env->fptags[6] = 1;
> -    env->fptags[7] = 1;
> +    helper_fninit(env);

Directly calling a function named "helper" is bad practice.  Those should only be called 
from TCG generated code.  In this case it happens to be ok, since helper_fninit does not 
use GETPC(), but really we should break out a "do_fninit" function to share.


>       case 0xd8 ... 0xdf:
>           {
> +            TCGv last_addr = tcg_temp_new();
> +            int last_seg;
> +            bool update_fdp = false;

These belong...

> @@ -5942,7 +5947,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>               op = ((b & 7) << 3) | ((modrm >> 3) & 7);
>               if (mod != 3) {
>                   /* memory op */
> -                gen_lea_modrm(env, s, modrm);
> +                AddressParts a = gen_lea_modrm_0(env, s, modrm);

... here, within the section that deals with memory operands.

> +            if (update_fip) {
> +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> +                                 offsetof(CPUX86State, segs[R_CS].selector));
> +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpcs));
> +
> +                tcg_gen_movi_tl(s->T0, pc_start - s->cs_base);
> +                tcg_gen_st_tl(s->T0, cpu_env, offsetof(CPUX86State, fpip));
> +            }
> +
> +            if (update_fdp) {
> +                if (s->override >= 0) {
> +                    last_seg = s->override;
> +                }
> +                tcg_gen_ld32u_tl(s->T0, cpu_env,
> +                                 offsetof(CPUX86State,
> +                                 segs[last_seg].selector));
> +                tcg_gen_st16_tl(s->T0, cpu_env, offsetof(CPUX86State, fpds));
> +
> +                tcg_gen_st_tl(last_addr, cpu_env, offsetof(CPUX86State, fpdp));
> +            }

Similarly the update_fdp test belongs at the end of the memory op block.


r~

