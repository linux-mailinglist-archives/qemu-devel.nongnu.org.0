Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63302DB71A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:27:06 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJij-0001g3-Os
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJXz-0004aM-V3
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:16:00 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kpJXu-00079R-CX
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:15:55 -0500
Received: by mail-ej1-x643.google.com with SMTP id ga15so30082723ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9dCcW2yfDp7PaJ6DVJDhuVJLOrCCNCTbY7slHpIWSxM=;
 b=IcZLLArA5vsruhnHAA/Q4+8qO090ljVVEf9iGTmuB6awSZ2UA8O6F6kXU9Tl6wwN6p
 FF3piSrLk7HGgmdfMxlo+pyXB8Ld9Y//TXgW2pYV2fftOo90vQUcOx2zVkUrzw/M3ktQ
 QsrrHyVHMUvha1ICNh8WAkVmDMNxGRz9NoXKSWlIypTFmamSaiopW7kbpt1IBeXFvQBJ
 7m9YE4rgMLuth+N1Esbm9j0NYhXY81wGF3DFCnPuMtCzNC1aIz0kqe+PTROgoDLps9hH
 6OgKmrbIHC/WLDSn63XJCSzL5xvmaHXenQVu+2UpLbekBl+VN1jFrlKkieZpUIglJrn2
 K+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9dCcW2yfDp7PaJ6DVJDhuVJLOrCCNCTbY7slHpIWSxM=;
 b=PtX2zTTPwEoqOkoMr4lZPjwvFkbnU1FVURFzO6F71cLFVAQuH3ZgKSKryLjiKNMxWR
 cKAgh2xXXDr1fSNgQH+OSLcz5Oypo1A8aCGNrjk7X8vzJCUJZgG76Y2fICRaEqK9ol3G
 TAA5KEvLaoFkY3Im7rUL7nJDKnXsrXe+Orue21zbh6G9Vp6UKHO6byqThTx7f/dtVclj
 H9uXqTaX0Kqq+iIBcDCiQ9cE430dsmEAzIDU222aOF0nJ5g9O9BnRLgxSfW1d6VrrThi
 jbpky+s/Gv5xMH6k0+KTu8OoyEVZFtyx+IuCt6nHiwpu4xR0n2+YzgFmShwcBmCpfJ1Q
 EokQ==
X-Gm-Message-State: AOAM530fb7nvvvi8AaNwAe0uF6OvG8AoO1GVhsandi6YTP7VXOB9USkK
 Pou3+5rV1TtsIwENxqieUDew2i1OnXoX6Q==
X-Google-Smtp-Source: ABdhPJwFm4UkuaLZj6y0cFS3mSnuBgCO0K7vXYybfnS2R+8aA92ZMT3Q/llTmm5erEk5Jm+7Chg/Gg==
X-Received: by 2002:a17:906:524a:: with SMTP id
 y10mr28910940ejm.97.1608074151623; 
 Tue, 15 Dec 2020 15:15:51 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id n9sm19069016edy.83.2020.12.15.15.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:15:50 -0800 (PST)
Subject: Re: [PATCH v4 07/43] tcg: Add in_code_gen_buffer
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-8-richard.henderson@linaro.org>
 <0ca448f1-bbd1-36b3-67c7-d430005db00d@amsat.org>
 <a79b5c1f-80c3-d0cf-770e-838cafa3373d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8461d292-5946-08c0-0e92-16db25e791d4@amsat.org>
Date: Wed, 16 Dec 2020 00:15:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a79b5c1f-80c3-d0cf-770e-838cafa3373d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 12/15/20 11:43 PM, Richard Henderson wrote:
> On 12/14/20 4:09 PM, Philippe Mathieu-Daudé wrote:
>> On 12/14/20 3:02 PM, Richard Henderson wrote:
>>> Create a function to determine if a pointer is within the buffer.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>  include/tcg/tcg.h         |  6 ++++++
>>>  accel/tcg/translate-all.c | 26 ++++++++------------------
>>>  2 files changed, 14 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
>>> index bb1e97b13b..e4d0ace44b 100644
>>> --- a/include/tcg/tcg.h
>>> +++ b/include/tcg/tcg.h
>>> @@ -680,6 +680,12 @@ extern __thread TCGContext *tcg_ctx;
>>>  extern void *tcg_code_gen_epilogue;
>>>  extern TCGv_env cpu_env;
>>>  
>>> +static inline bool in_code_gen_buffer(const void *p)
>>> +{
>>> +    const TCGContext *s = &tcg_init_ctx;
>>> +    return (size_t)(p - s->code_gen_buffer) <= s->code_gen_buffer_size;
>>
>> If 'p == s->code_gen_buffer + s->code_gen_buffer_size',
>> is it really "in" the buffer?
> 
> Well, sort of.
> 
> Compare the fact that in C, a pointer to the end of an array is valid as a
> pointer even though it can't be dereferenced.  This is a pointer to the end of
> the buffer.
> 
> Extra commentary required?

Preferably, since you change from '<' to '<=', this would
make it clearer, then no question asked :)

With it:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks,

Phil.

