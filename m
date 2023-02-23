Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FE56A127C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:01:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJeQ-0000wI-C3; Thu, 23 Feb 2023 17:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJeO-0000w5-G0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:01:16 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVJeM-0002va-Ms
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:01:16 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so799130pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VUAr7tQ340AsD7XwqSWBdLwZ/G70LTCn7BaHHbf3bXs=;
 b=N8t53xrdStyaYq7AKAJLJJPSphjYbC9K2CsBXMJa3OQONvEWyN3YPDnc7nGoNLiO98
 MYYb1csl7p8XvFuwVYgOB9hAFHAQuDKKRU1tgnYqpe0P4EYhmovA3IH5YC0xcYkTlwQB
 KeTWk3ga8YDPhlp0vi1Hl7PX5pIyKrly/dhagucbi0vtwjr2sXjKoWVM4lxcFoKkzD20
 IbgiWrWzaiORJmzh4nHgvVbZvo12tBPEGUMT/zTfsVHz+GNG94NBHbUXJNSnN9tqLakc
 pXQi4epj9ve7pkLZj1dK4W/sdsd0ZOQ0a7+jkO2JVc/yYfAmQHOSxLjDBOFAscP7ilAq
 uxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VUAr7tQ340AsD7XwqSWBdLwZ/G70LTCn7BaHHbf3bXs=;
 b=HBXyjnVoRG539dSLdcgGwbic4o4skjIiv5A2BswlNjJalLPrmdUMF/21Vo6VZLyD9N
 fXF+YLvzJ0yBbnxuxPPzn0hfWPZ5R6WUcsmzFmON5u73nIPGZhe1MW6jA6y3OF/tfMfo
 wVxKlQpsAWrBEakgWzrNnFswrQ7CBugbOSQ77T+ereUQU04iTNXtzc3wDIi0RNDhPZVE
 DxRAHTH3yE/ROh07sqvnbVUUxrP0EGFqzs8fvzJO8rTNxfLXpi+32Iypqcabhq5OcJtW
 CxOzWpXw8gH3wDbiOsa51s/oCCd+axQCjuMB8ZTbY15sOujM3Wqf3jKRMVNreNBmpaF0
 4UQw==
X-Gm-Message-State: AO0yUKUoxAV4Z/VIhEB/TPvYsaov+mCKE7KONT8rA+Skyf7M7PC+ZFUI
 WaISnl/PIoSuWNC9bslKp6lywQ==
X-Google-Smtp-Source: AK7set98sCJ+5rdsXXbEvzqMYjOh0fRX+oKBy0PVBbv7JPT9k1NjqxRwN7Ng+h3zctpiJ+Bp+UqZBQ==
X-Received: by 2002:a17:90a:199:b0:234:b3cb:147 with SMTP id
 25-20020a17090a019900b00234b3cb0147mr13259063pjc.16.1677189672912; 
 Thu, 23 Feb 2023 14:01:12 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 p6-20020a17090ac00600b002366c766ef4sm165474pjt.33.2023.02.23.14.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 14:01:12 -0800 (PST)
Message-ID: <1ecf3d94-8e0e-94fd-51a0-7772ea8cb786@linaro.org>
Date: Thu, 23 Feb 2023 12:01:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH qemu 1/1] target/i386: Fix gen_shift_rm_T1, wrong eflags
 calculation
Content-Language: en-US
To: ~vilenka <vilen.kamalov@gmail.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, pbonzini@redhat.com
References: <167718710208.23058.11278141733696221981-1@git.sr.ht>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <167718710208.23058.11278141733696221981-1@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/23/23 11:13, ~vilenka wrote:
> From: Vilen Kamalov <vilen.kamalov@gmail.com>
> 
> gen_shift_rm_T1 in the uses wrong tmp0 register, eflags calculation uses tmp4 at target/i386/tcg/translate.c, line 5488
> `tcg_gen_mov_tl(cpu_cc_src, s->tmp4);`

The line you quote only applies to the bit instructions, bt/bts/btr/btc, so your 
explanation is clearly incorrect.

> push rcx
> mov dword ptr [rsp], 010000000h
> mov rcx, 01eh
> sar dword ptr [rsp], cl
> jnc pass1
> int 3
> pass1:
> mov dword ptr [rsp], 0ffffffffh
> mov rcx, 01eh
> sar dword ptr [rsp], cl
> jc pass2
> int 3
> pass2:
> pop rcx

Thanks for the test case.

> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 9d9392b009..9048e22868 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -1686,27 +1686,27 @@ static void gen_shift_rm_T1(DisasContext *s, MemOp ot, int op1,
>       }
>   
>       tcg_gen_andi_tl(s->T1, s->T1, mask);
> -    tcg_gen_subi_tl(s->tmp0, s->T1, 1);
> +    tcg_gen_subi_tl(s->tmp4, s->T1, 1);
>   
>       if (is_right) {
>           if (is_arith) {
>               gen_exts(ot, s->T0);
> -            tcg_gen_sar_tl(s->tmp0, s->T0, s->tmp0);
> +            tcg_gen_sar_tl(s->tmp4, s->T0, s->tmp4);
>               tcg_gen_sar_tl(s->T0, s->T0, s->T1);
>           } else {
>               gen_extu(ot, s->T0);
> -            tcg_gen_shr_tl(s->tmp0, s->T0, s->tmp0);
> +            tcg_gen_shr_tl(s->tmp4, s->T0, s->tmp4);
>               tcg_gen_shr_tl(s->T0, s->T0, s->T1);
>           }
>       } else {
> -        tcg_gen_shl_tl(s->tmp0, s->T0, s->tmp0);
> +        tcg_gen_shl_tl(s->tmp4, s->T0, s->tmp4);
>           tcg_gen_shl_tl(s->T0, s->T0, s->T1);
>       }
>   
>       /* store */
>       gen_op_st_rm_T0_A0(s, ot, op1);
>   
> -    gen_shift_flags(s, ot, s->T0, s->tmp0, s->T1, is_right);
> +    gen_shift_flags(s, ot, s->T0, s->tmp4, s->T1, is_right);
>   }

The use of tmp0 vs tmp4 is completely local to this function.
Within gen_shift_flags, the 4th argument is consistently used, and neither tmp0 nor tmp4 
are referenced.

If this does fix the issue, that means there's some other explanation, and possibly some 
deeper fix is required.


r~

