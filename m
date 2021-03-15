Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2D33B3C9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:22:32 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnB1-0003P6-L0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn83-0002Ph-DX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:19:27 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLn81-0007o8-Ao
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:19:27 -0400
Received: by mail-qk1-x72c.google.com with SMTP id l4so31550210qkl.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fwTFn1W9zl6xLXoufUK2dKRo2uICom5miT89atxUxSE=;
 b=wIU24LwAcVAFy5FlOPzEq4JtJBeS9ZlMuFD02ai7d/DEy+0Vp8yT9egZQiaDRtDT5G
 JLo1au27rZ7YsEZ3XeaXb/jKSIx4gpmlK0EplIRvxsbTzqxKqTwlkke/D1x+TTWXGBNl
 jmafJrayeTPlHGmXHrWm6GVHNQkL/LuvqFZabAddPSaAEgpYdwsstaszbq1zO0zg1F3g
 hfHexRByE7nFIsGM3SFnAkeEtbP2SMMDLFxJuY+wCbyFY5O8vJ7NKwBkQeYWiX4koe0H
 TWNRdyWKWYduird0+BjROCz1eSL3BLcSzyvzk0nR2khvOEGLBAf2YZ37a1qiRAWg19sb
 pVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fwTFn1W9zl6xLXoufUK2dKRo2uICom5miT89atxUxSE=;
 b=KQxdn2L9FTRoehOl5uI2msL04v+YcRDqMLY9fhdi/PIlNSrzr9Pe0/ulQu8WeVNGoG
 0AEZkuHcFKQBCDtk/9uXMvYUexkUSL35+CTZTrxIA74qsKgRtd5V09TOufJbA+INyHzE
 s+TePHxD7XFGnMidAijI8ZEsI2DiBP4ln28Sje2uJ3sGTyLorTr/p/T8ToDxGkj1Wehe
 tVdxKjrWsur1lpVuYlNWJERmTEKgRTn1w25vMS9y4t7VHGd+YiSZlNMhhCZK49ZAXDjw
 sfiGtufKrfC87Tge6u02CIyKDhhiRryqM/JIT5WMx7HXKL8ZCl78A92QtI+4lYmwUzsz
 3iAw==
X-Gm-Message-State: AOAM532a0vpsutnYeFjhc7Wt2uXE/1+ILTqiawWsKEwqp0dE1Jmm8IXA
 5Ha0vfkUtxRtT1YDWbVJVnlvEw==
X-Google-Smtp-Source: ABdhPJzJQ7iNw3LAr+wn0rdOn3wFOPGaKgfX+GOB3rfnmfRM/xWKkZUKMwiGVpqQbfW8O1jDbOFLpA==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr23898025qkk.209.1615814364286; 
 Mon, 15 Mar 2021 06:19:24 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j24sm12279019qka.67.2021.03.15.06.19.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:19:23 -0700 (PDT)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
 <0697b6d1-0a64-3d71-2f7f-3c52a005b77b@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b942a3c-38c1-1832-68cb-b447d804bf23@linaro.org>
Date: Mon, 15 Mar 2021 07:19:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <0697b6d1-0a64-3d71-2f7f-3c52a005b77b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 3:10 AM, Philippe Mathieu-Daudé wrote:
> On 3/15/21 12:48 AM, Richard Henderson wrote:
>> Use fma to simulatneously scale and round up fraction.
> 
> "simultaneously"
> 
>> The libm function will always return a properly rounded double precision
>> value, which will eliminate any extra precision the x87 co-processor may
>> give us, which will keep the output predictable vs other hosts.
>>
>> Adding DBL_EPSILON while scaling should help with fractions like
>> 12.345, where the closest representable number is actually 12.3449*.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   util/cutils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index d89a40a8c3..f7f8e48a68 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
>>       if (val > (UINT64_MAX - ((uint64_t) (fraction * mul))) / mul) {
> 
> Shouldn't we use fma() here too? ^^^^^^^^^^^^^^^^^^^^^^^^^^

Yep, I should have looked at the larger context.


r~

> 
>>           retval = -ERANGE;
>>           goto out;
>>       }
>> -    *result = val * mul + (uint64_t) (fraction * mul);
>> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
>>       retval = 0;
>>   
>>   out:
>>
> 


