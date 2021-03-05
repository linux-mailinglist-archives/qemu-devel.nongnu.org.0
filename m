Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF43932EEEA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:34:33 +0100 (CET)
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICTI-0006QD-Kd
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:34:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIC8s-0001Sc-Fi
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:13:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIC8a-0000wE-Iv
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:13:19 -0500
Received: by mail-pj1-x1034.google.com with SMTP id kx1so2039112pjb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Tj3ytNslWe6W1uRGDW3qdBbAevHhV1ERn8mnj7rGmc=;
 b=CUIwEzx7NLf4Nf6HlTu4qFZhdS2RCAKXbxGBaOw1lY/AwY/taUlXvHQlOmqE51Evv5
 DDvMgvjFsQ7xWTA+DNJ19wQDAyJOi6eNpge8PRXfbrtgjk07dLVjEfvak2AsRZhvCzBW
 wGN/cwIK/N8S8ZeupVx4dFwCwa4yrCeqmIW6OHbE3RWGS8F/m0wM+SUK8frl3lBrqJJW
 mlBo7UAAN67/7m9zTBG87r3ggkQVYkkxA8Bb3F8SKnMbxWfPxxfZaiDbE2VO/XlLHGY8
 KFQ/WGXW5fIjgOVpW/Xtr3XKtFwZp9tIHG8PN51778qQ5szydPXkWYxA8kyP+d6ZIyij
 FhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Tj3ytNslWe6W1uRGDW3qdBbAevHhV1ERn8mnj7rGmc=;
 b=rCevuQQO8viM54vWe3bQBLKeW5obwwcBLjS+lfnQ8KtANFAshDMB8lK1kJPltYiTrk
 1Ul4GaVQCgsTkDL2RzMFfykQh5Sf+Id8N5wVr7r9/ieq/CIQA4gJYF0Di4stsgHtZCh5
 IkYrIJkjTPUP4hqtxOaLj0DalkFR9RjcK4QDKyptn1TY50dhLoyrHtNUo/CFN+XcSclN
 qE8RPSInPaOehMBmf0GgLQyZ+RLVRwW/rxqrbIsmWUW852IQl28rZIAYN75ugqNSrHcP
 sUwSalv3Pb2yw4byUh1yh6ghzUC+sEqM2fzrnYvMBtoXfq2cG/ODK+MmolmhTzqkBe0r
 SnwA==
X-Gm-Message-State: AOAM532YEDS3zCTJ7OLJLgOELMN1Kyp65Hv0r0ciC+fPoCPDLNyitHVE
 MQdbfZv7IfPFfXTXKqAd43z0CtrUwvzMpg==
X-Google-Smtp-Source: ABdhPJypJjbT9XC710lkMtNj4AqmB/yFwUOHdFESCtbgodvVgLFlU5E9mykxsU6H9DmIHp5fZkEN/Q==
X-Received: by 2002:a17:90b:3890:: with SMTP id
 mu16mr10763068pjb.9.1614957185584; 
 Fri, 05 Mar 2021 07:13:05 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id gz12sm2720220pjb.33.2021.03.05.07.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 07:13:05 -0800 (PST)
Subject: Re: [PATCH] tcg/aarch64: Fix constant subtraction in tcg_out_addsub2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210228232847.322468-1-richard.henderson@linaro.org>
 <CAFEAcA8bB+f7dvUU795Q-i7AhV_sru1LqgN1spyjT-AgaCySLQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1aa9a1c0-cf39-00ee-5837-019f67580c29@linaro.org>
Date: Fri, 5 Mar 2021 07:13:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8bB+f7dvUU795Q-i7AhV_sru1LqgN1spyjT-AgaCySLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 3:45 AM, Peter Maydell wrote:
> On Sun, 28 Feb 2021 at 23:55, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> An hppa guest executing
>>
>> 0x000000000000e05c:  ldil L%10000,r4
>> 0x000000000000e060:  ldo 0(r4),r4
>> 0x000000000000e064:  sub r3,r4,sp
>>
>> produces
>>
>>   ---- 000000000000e064 000000000000e068
>>   sub2_i32 tmp0,tmp4,r3,$0x1,$0x10000,$0x0
>>
>> after folding and constant propagation.  Then we hit
>>
>> tcg-target.c.inc:640: tcg_out_insn_3401: Assertion `aimm <= 0xfff' failed.
>>
>> because aimm is in fact -16, but unsigned.
>>
>> The ((bl < 0) ^ sub) condition which negates bl is incorrect and will
>> always lead to this abort.  If the constant is positive, sub will make
>> it negative; if the constant is negative, sub will keep it negative.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> -static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
>> -                                   TCGReg rh, TCGReg al, TCGReg ah,
>> -                                   tcg_target_long bl, tcg_target_long bh,
>> -                                   bool const_bl, bool const_bh, bool sub)
>> +static void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
>> +                            TCGReg rh, TCGReg al, TCGReg ah,
>> +                            tcg_target_long bl, tcg_target_long bh,
>> +                            bool const_bl, bool const_bh, bool sub)
>>   {
>>       TCGReg orig_rl = rl;
>>       AArch64Insn insn;
> 
> Seems like an unrelated change ?

Mm.  Perhaps I should remove all of the inline markers all at once.

r~

> 
>> @@ -1423,11 +1423,13 @@ static inline void tcg_out_addsub2(TCGContext *s, TCGType ext, TCGReg rl,
>>       }
>>
>>       if (const_bl) {
>> -        insn = I3401_ADDSI;
>> -        if ((bl < 0) ^ sub) {
>> -            insn = I3401_SUBSI;
>> +        if (bl < 0) {
>>               bl = -bl;
>> +            insn = sub ? I3401_ADDSI : I3401_SUBSI;
>> +        } else {
>> +            insn = sub ? I3401_SUBSI : I3401_ADDSI;
>>           }
>> +
>>           if (unlikely(al == TCG_REG_XZR)) {
>>               /* ??? We want to allow al to be zero for the benefit of
>>                  negation via subtraction.  However, that leaves open the
>> --
>> 2.25.1
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 


