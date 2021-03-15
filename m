Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B03233B46B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:28:59 +0100 (CET)
Received: from localhost ([::1]:34706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnHG-0007D2-IV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnFt-0006iI-5C
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:27:33 -0400
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:46897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLnFm-0003iG-6j
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 09:27:32 -0400
Received: by mail-oi1-x230.google.com with SMTP id w125so5890438oib.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 06:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b8jT9WRobKW5dPVhS0QHs/2gdjijNIAEiyHlIL8Jo/8=;
 b=fwlbRACt1WkIrNNVt9W7ELHbHWdOalfMuoB55RbWaCSvaGP2/8fv9pENmVGP+Q6dyS
 Tru6kW3tGVhT1fNt3uU+z6TCzFDNSepeujJIs2KVgy2+6YryrFOyFPsxUlncLREecgXQ
 AcaV8ijKv7E78F3fEn4aH4pSwSq4UiWSf20N4TTWzReigfnEe5uX/aFenyP3qRSPVLQq
 asWiLpvxlNJh8E0mw0pJgqITNRhNAiJVApnIk7uPmLf5+fAO8zQZYsB2TZ1VeTn2brmC
 P42w3XJ2LOXldqajybClt6M0Pol3iULKNjTrwpGRxFmBG0Xn85AkR+vreNFCWSmYsIND
 nYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b8jT9WRobKW5dPVhS0QHs/2gdjijNIAEiyHlIL8Jo/8=;
 b=kvtfYqK0PVKAwekryXqXuyW3FCG5zgHs1QN4FXGLLRdEgR/Yf6OynljjBSYWLnhiM4
 XQ82m+hXjx+F94h9Na+rT05BxxaX+LVDRuM/NfFvstxkA4lbaSwwJ/TO7Ws2pgIcUzg7
 fTBPGNycTh3XY/3IG0l8siaTpsQIPz6DRYisApdgtupuaUhItR6zgC/6+YYGBjDYjjCr
 yQajgcyd6oJ1+7C+sMXcnIwUMWD8vOwER37asxVBexErTnKrEZAtiORDPHWiBhNVGZHg
 4aO7/s8huyeYL0E8gsALBjL3ZzUgG9h6EwGr1DQYcGae13WZ3CJvvVT1dkKsme0y45z/
 gskA==
X-Gm-Message-State: AOAM533H+T+c9hKRgvUqzpMhGfc5EuRPr38a8hNoTHdPwF+/NVeSh4bQ
 xL7ASYGjvsuRopjhE1C0DV/btw==
X-Google-Smtp-Source: ABdhPJxmKZpq2w0beypybJmlOMwyCDTNQ/43fdHwV5yl3wmNNwicna9UCSb/CFmCLjAggj+E3OBO8w==
X-Received: by 2002:a05:6808:a90:: with SMTP id
 q16mr18011742oij.77.1615814844871; 
 Mon, 15 Mar 2021 06:27:24 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b9sm7183643ooa.47.2021.03.15.06.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 06:27:24 -0700 (PDT)
Subject: Re: [PATCH] utils: Use fma in qemu_strtosz
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210314234821.1954428-1-richard.henderson@linaro.org>
 <5510483b-b38c-ad82-c138-6c757e4dac3a@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62c26988-9b4e-ee93-8f82-84da489c8151@linaro.org>
Date: Mon, 15 Mar 2021 07:27:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <5510483b-b38c-ad82-c138-6c757e4dac3a@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

On 3/15/21 5:38 AM, Eric Blake wrote:
> On 3/14/21 6:48 PM, Richard Henderson wrote:
>> Use fma to simulatneously scale and round up fraction.
>>
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
>>           retval = -ERANGE;
>>           goto out;
>>       }
>> -    *result = val * mul + (uint64_t) (fraction * mul);
>> +    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
> 
> Don't you need to include <float.h> to get DBL_EPSILON?

Apparently we get it via some other route.

> More importantly, this patch seems wrong.  fma(a, b, c) performs (a * b)
> + c without intermediate rounding errors, but given our values for a and
> b, where mul > 1 in any situation we care about, adding 2^-53 is so much
> smaller than a*b that it not going to round the result up to the next
> integer.  Don't you want to do fma(fraction, mul, 0.5) instead?

I tried that first, but that requires changes to the testsuite, where we have a 
*.7 result, and expect it to be truncated.

I assumed adding 0.00*1 to 0.99*9 would still have an effect.

I think I should have tried fma(fraction, mul, 0) as well, just to see if it's 
the elimination of extended-precision results that were the real problem.


r~

