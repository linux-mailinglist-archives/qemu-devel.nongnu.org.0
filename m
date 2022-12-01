Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D254363EA80
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0eIp-0005p7-SZ; Thu, 01 Dec 2022 02:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eIg-0005ln-2M
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:48:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0eIe-0006RO-6m
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:48:05 -0500
Received: by mail-pg1-x52f.google.com with SMTP id h33so957939pgm.9
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iP0lVfr9l10opVhH/EWCmmiwK1S8P2gAxyMX3NSoFaQ=;
 b=v0mDRicwKSkIVXzp4KNZHccIptxgO3USshez86YUMVnm2XCleSKWm9hySSo5gcXAmu
 3Ur2aSIQYrb+ZXYxv2iW15/dUXINM5/LoaTw8X3YBbMrxDMVXSaZm/gl9lCUd7PsrsG8
 57gwvtR2OzxhnU/7Nw2GOvrf9pQSVHTBMZ/0/dGqfqUfWMUI7fDoPVCa7cnvvqM8liez
 jGoOiUX1D1sIU6ZnJFfO/6yZ49tUwQqh1+NbRsnEKlsK+Qz95boBpIk1E9Uw/6y+0sbu
 QdRxXVOTZcUvjZman4yS8YxteMsKjXlXieYK0dAJNKVsCexFUAiB1uRmH8kw4R5XTkQr
 v+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iP0lVfr9l10opVhH/EWCmmiwK1S8P2gAxyMX3NSoFaQ=;
 b=n6zwRi3BJSZSO662leT4qOZm1vp5Bn+8Bbp7SEXEv5694sMgvvScQHGBkE1M6GPu+C
 GuJPXxYhJ3SC0sVl3oJgtZNVc6ytJn+r9UZECfbv7yOIR/cojL6icJZVm++RNyneZ+FU
 RRWw27qqleC4uD//+19Z2kMa2uPasm5GrwhGvdOPtV7ICFW8fZg/JU2869Rm3rjgoAOX
 6a1R+4gPIAAnCau2XWCoPmTJkVBeTFzkq8JBS7Udrv45djIP8MdDSlmzlsyVrB4EFrvX
 oL+zWMo1YXhV5TUUtJR1yfEaAyRERv8E6dOFCM87Pj81bnZiPtzS5xJZa8wwrA+Lw7JP
 2EEA==
X-Gm-Message-State: ANoB5pl1mF2t1XC97b7vzhD28s9eDu/+RmgzFjpv4Dqr2R4+jDEAaKLw
 sLq8Mol0QD0FD6V5rewg1doVtWmITCwKPg==
X-Google-Smtp-Source: AA0mqf4PyYNdscGY3ZAjA9hRI0JLQQgsgFSq6/KqlqNxNKvRhNCkpYHWejmniFVr4BsGkTHZGt+njA==
X-Received: by 2002:a05:6a00:4c11:b0:574:61ad:84d0 with SMTP id
 ea17-20020a056a004c1100b0057461ad84d0mr39110322pfb.15.1669880877697; 
 Wed, 30 Nov 2022 23:47:57 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a1709027e4a00b0018912c37c8fsm2833945pln.129.2022.11.30.23.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 23:47:57 -0800 (PST)
Message-ID: <bc2c921b-a5e1-4f4a-a20a-864828918e5f@linaro.org>
Date: Wed, 30 Nov 2022 23:47:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH for-7.2] target/i386: Always completely initialize
 TranslateFault
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net,
 Daniel Hoffman <dhoff749@gmail.com>
References: <20221201074522.178498-1-richard.henderson@linaro.org>
In-Reply-To: <20221201074522.178498-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 23:45, Richard Henderson wrote:
> In get_physical_address, the canonical address check failed to
> set TranslateFault.stage2, which resulted in an uninitialized
> read from the struct when reporting the fault in x86_cpu_tlb_fill.
> 
> Adjust all error paths to use structure assignment so that the
> entire struct is always initialized.
> 
> Reported-by: Daniel Hoffman <dhoff749@gmail.com>
> Fixes: 9bbcf372193a ("target/i386: Reorg GET_HPHYS")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 34 ++++++++++++++++------------
>   1 file changed, 19 insertions(+), 15 deletions(-)

Ah hah, I just found the issue filed for this:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1324


r~

> 
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index 405a5d414a..55bd1194d3 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -71,10 +71,11 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
>           TranslateFault *err = inout->err;
>   
>           assert(inout->ptw_idx == MMU_NESTED_IDX);
> -        err->exception_index = 0; /* unused */
> -        err->error_code = inout->env->error_code;
> -        err->cr2 = addr;
> -        err->stage2 = S2_GPT;
> +        *err = (TranslateFault){
> +            .error_code = inout->env->error_code,
> +            .cr2 = addr,
> +            .stage2 = S2_GPT,
> +        };
>           return false;
>       }
>       return true;
> @@ -431,10 +432,11 @@ do_check_protect_pse36:
>                                     MMU_NESTED_IDX, true,
>                                     &pte_trans.haddr, &full, 0);
>           if (unlikely(flags & TLB_INVALID_MASK)) {
> -            err->exception_index = 0; /* unused */
> -            err->error_code = env->error_code;
> -            err->cr2 = paddr;
> -            err->stage2 = S2_GPA;
> +            *err = (TranslateFault){
> +                .error_code = env->error_code,
> +                .cr2 = paddr,
> +                .stage2 = S2_GPA,
> +            };
>               return false;
>           }
>   
> @@ -494,10 +496,11 @@ do_check_protect_pse36:
>           }
>           break;
>       }
> -    err->exception_index = EXCP0E_PAGE;
> -    err->error_code = error_code;
> -    err->cr2 = addr;
> -    err->stage2 = S2_NONE;
> +    *err = (TranslateFault){
> +        .exception_index = EXCP0E_PAGE,
> +        .error_code = error_code,
> +        .cr2 = addr,
> +    };
>       return false;
>   }
>   
> @@ -564,9 +567,10 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
>                   int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
>                   int64_t sext = (int64_t)addr >> shift;
>                   if (sext != 0 && sext != -1) {
> -                    err->exception_index = EXCP0D_GPF;
> -                    err->error_code = 0;
> -                    err->cr2 = addr;
> +                    *err = (TranslateFault){
> +                        .exception_index = EXCP0D_GPF,
> +                        .cr2 = addr,
> +                    };
>                       return false;
>                   }
>               }


