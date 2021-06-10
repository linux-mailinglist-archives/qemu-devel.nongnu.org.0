Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 193803A2F6D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:35:42 +0200 (CEST)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMia-0002XK-Uq
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMhP-0008W9-UM
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:34:27 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:34479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMhN-00078W-Js
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:34:27 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g6so1938144pfq.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GCSFq57eqdP+MG8ytIIanxdmilil/bWfNYoFuYMJ3Gk=;
 b=s/05vvLCvkwY1H2iFR1xYYLVINSxjxUPuhkVRifQyOzLw8KFxs64tcO7v5eTxiMMmz
 fvxVQvsniRDy/J666XlcNFHm93nCgwjxB3CEXmtBi1cnm+nCsiEvACh6CPYvaeFRMU1H
 e39oppw903Kj5shOrAVYbOTBMBPcRO3t4TaNX0AnLgHRMsdZGbYSMXFj9vC3OUlgvUV9
 Q5oRqC1zyWgqObn3bfHx2RqU9o78Mv1H5QHBvrVMIJW11iKiNNK5rHQWaA139qnaW5SS
 g3EalgpT77AemOTLFdUtbu8we+VO3JlPpEE+WCito+0sYT54KeclRSWyeXMAU+1A1hUv
 pt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GCSFq57eqdP+MG8ytIIanxdmilil/bWfNYoFuYMJ3Gk=;
 b=A2zxzurCDPxgr+5zYjfeEXtpQ1gm5YwZXMmMYqaqs4SB4tdXGDsITx2JuGkws7iiAg
 blXfuyiXjMkogEbUposBORjxiZdGtsv4tfQJ+1w/bPxJPLQE5q9VDUE6dcV+RfGYVnfU
 STWHQYk/R9zhGxU2M7KLB5wIpn0K9LgOoc2gVXuqHVQUf7jOkCoWS0weZApT8s/4hqxn
 Qeom42ce7jEPv7G0FG/LXC3jYMzwZQtBQD8Y+W1U3tVy+w9tLzuNKyzDCVntzv9RLYxU
 QyxRpxbwKYHSWifQQCsCszCYWzhtiZXmuMotD/aIsoN3HU6aWahv8hsxUKshocQEc+i9
 1QgQ==
X-Gm-Message-State: AOAM533taeNcWb1W4i9bv8zFd64SYnGieXwCJ+F6S96Up7IQIOi9GQgO
 GIk5y6gCes8uxZyiJ3MWQMpwO7iHIXfuNA==
X-Google-Smtp-Source: ABdhPJwJUdZsa5Sa0sog2PgxlwgLQ65AIBAm1wg+lOTZuC04PxKivLa3nBmQjUK38JBGl+GWCfq7JA==
X-Received: by 2002:a62:5547:0:b029:2ec:8f20:4e2 with SMTP id
 j68-20020a6255470000b02902ec8f2004e2mr3558433pfb.71.1623339263704; 
 Thu, 10 Jun 2021 08:34:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 d23sm8047556pjz.15.2021.06.10.08.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:34:23 -0700 (PDT)
Subject: Re: [PATCH v3 27/28] tcg: When allocating for !splitwx, begin with
 PROT_NONE
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-28-richard.henderson@linaro.org>
 <875yynjn72.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <06701a18-1702-618c-9495-2c43e2eff2d5@linaro.org>
Date: Thu, 10 Jun 2021 08:34:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yynjn72.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 4:21 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> There's a change in mprotect() behaviour [1] in the latest macOS
>> on M1 and it's not yet clear if it's going to be fixed by Apple.
>>
>> In this case, instead of changing permissions of N guard pages,
>> we change permissions of N rwx regions.  The same number of
>> syscalls are required either way.
>>
>> [1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/region.c | 19 +++++++++----------
>>   1 file changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/tcg/region.c b/tcg/region.c
>> index 604530b902..5e00db4cfb 100644
>> --- a/tcg/region.c
>> +++ b/tcg/region.c
>> @@ -765,12 +765,15 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
>>           error_free_or_abort(errp);
>>       }
>>   
>> -    prot = PROT_READ | PROT_WRITE | PROT_EXEC;
>> +    /*
>> +     * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
>> +     * rejects a permission change from RWX -> NONE when reserving the
>> +     * guard pages later.  We can go the other way with the same number
>> +     * of syscalls, so always begin with PROT_NONE.
>> +     */
>> +    prot = PROT_NONE;
>>       flags = MAP_PRIVATE | MAP_ANONYMOUS;
>> -#ifdef CONFIG_TCG_INTERPRETER
>> -    /* The tcg interpreter does not need execute permission. */
>> -    prot = PROT_READ | PROT_WRITE;
>> -#elif defined(CONFIG_DARWIN)
>> +#ifdef CONFIG_DARWIN
>>       /* Applicable to both iOS and macOS (Apple Silicon). */
>>       if (!splitwx) {
>>           flags |= MAP_JIT;
>> @@ -901,11 +904,7 @@ void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
>>               }
>>           }
> 
> I think the comment in tcg_region_init needs to be updated, currently
> reads:
> 
>      /*
>       * Set guard pages in the rw buffer, as that's the one into which
>       * buffer overruns could occur.  Do not set guard pages in the rx
>       * buffer -- let that one use hugepages throughout.
>       * Work with the page protections set up with the initial mapping.
>       */
>      need_prot = PAGE_READ | PAGE_WRITE;
> 
> but now we start with everything at PROT_NONE and are just setting
> need_prot for the non-guard pages.

The comment *has* been updated: work with the page protections set up with the 
initial mapping.  Which is *not* always PROT_NONE.

See the USE_STATIC_CODE_GEN_BUFFER and _WIN32 copies of alloc_code_gen_buffer.


>>           if (have_prot != 0) {
>> -            /*
>> -             * macOS 11.2 has a bug (Apple Feedback FB8994773) in which mprotect
>> -             * rejects a permission change from RWX -> NONE.  Guard pages are
>> -             * nice for bug detection but are not essential; ignore any failure.
>> -             */
>> +            /* Guard pages are nice for bug detection but are not essential. */
>>               (void)qemu_mprotect_none(end, page_size);
> 
> Isn't the last page already set as PROT_NONE?

No.


r~

