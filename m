Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD573A2F35
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 17:22:24 +0200 (CEST)
Received: from localhost ([::1]:55268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrMVj-0001hE-DH
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 11:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMUG-0008AP-MW
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:20:52 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:42785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrMUE-0000Bl-MD
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 11:20:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id i34so27350pgl.9
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=axSFCD73ac8zMfikZYWan+30XJiDs2JcXWEpELo37rE=;
 b=IgwVNhx4dDRSQtk/AcrV7Ai8Of3mglRhS4KDVSAWoZP66Fb4DEA1lSIMbCZK5+NJcM
 atI3SiaK3b8eIWJ5f9QQToieXSZy+0v4VLRHGHjsyV2KMo4qjHQTjObHOwQ7dcFmb5KQ
 B4G5ipoGrLE92K4XyQmyyJtFVHw+Xn+vY2tcq8+s+r4M4VRUNY9cI6EwIcIGl7N8yQ4Y
 uXq/wlMLazqD/q6R46M3lU68ymihTTZV9ipNQg19QImOnpp3ywJ/vXi4pW3IR3fcchUR
 wFwr7VgjQHSnwwOXV0EjntzWLL7a+GV53s09iUJQdnTCRyPetnf+Cb8qCXjv+DIFZSNk
 puCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axSFCD73ac8zMfikZYWan+30XJiDs2JcXWEpELo37rE=;
 b=iWpsw3OLfmltwX7OJavzxXzBUVKjBHy/3DZgKJKyHjUgd5kwd05JaJS4AiLFTQWs8l
 JJNajYMFpW8szjDJxLrR6nATnJjwP1wqmMWIV7Z0sfhj3VgJswCWD/iB6piYWcwy3YRP
 6EcdqlhLfe3G8uq3611vVncxxeRPZT1tecckLrmnK37leDYRwOpZlXfj7rHL0QMmvqVX
 yAY1cpdyvcapxqgK93CuJI8Aic53U3MB6XGS52XZfn+HzEsxx7D3YVFqxMmxgtvAlS3+
 /rP+2h87p3LNZDgJ+4vHMgEFEUBp5cgLdeufX8E1CnqkQkI86/j31oPJ6lgEVzupuxRE
 0w1w==
X-Gm-Message-State: AOAM530R1fIqPFC5IVOaJ4r+vGBT26nEGADN71Hd9S6iTLspunMSOOXY
 8n4ftmqUaNVfY9D6m2pIlfPIluS6p8UPmQ==
X-Google-Smtp-Source: ABdhPJzNGkP0zknakMEKczH7PzUvkxSJ0BgfwkJ8crgrXsEjq0wV4BM7EepCu6d7onuxz1eJz/h7wA==
X-Received: by 2002:a62:8c0d:0:b029:2e9:e1f4:c433 with SMTP id
 m13-20020a628c0d0000b02902e9e1f4c433mr3470408pfd.24.1623338449051; 
 Thu, 10 Jun 2021 08:20:49 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j2sm7895060pji.34.2021.06.10.08.20.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:20:48 -0700 (PDT)
Subject: Re: [PATCH v3 19/28] tcg: Tidy split_cross_256mb
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-20-richard.henderson@linaro.org>
 <CP2PR80MB366803188DBDFF88FDFB6BABDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fd6c89e-f51d-9948-263e-ddd9fe388f75@linaro.org>
Date: Thu, 10 Jun 2021 08:20:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CP2PR80MB366803188DBDFF88FDFB6BABDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 7:59 AM, Luis Fernando Fujita Pires wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
>> Return output buffer and size via output pointer arguments, rather than
>> returning size via tcg_ctx->code_gen_buffer_size.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/region.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/tcg/region.c b/tcg/region.c index b44246e1aa..652f328d2c 100644
>> --- a/tcg/region.c
>> +++ b/tcg/region.c
>> @@ -467,7 +467,8 @@ static inline bool cross_256mb(void *addr, size_t size)
>>   /* We weren't able to allocate a buffer without crossing that boundary,
>>      so make do with the larger portion of the buffer that doesn't cross.
>>      Returns the new base of the buffer, and adjusts code_gen_buffer_size.  */ -
>> static inline void *split_cross_256mb(void *buf1, size_t size1)
>> +static inline void split_cross_256mb(void **obuf, size_t *osize,
>> +                                     void *buf1, size_t size1)
> 
> Need to adjust the comment, now that we're no longer adjusting code_gen_buffer_size in here.

Done, thanks.

>> @@ -583,8 +583,7 @@ static bool alloc_code_gen_buffer_anon(size_t size, int
>> prot,
>>               /* fallthru */
>>           default:
>>               /* Split the original buffer.  Free the smaller half.  */
>> -            buf2 = split_cross_256mb(buf, size);
>> -            size2 = tcg_ctx->code_gen_buffer_size;
>> +            split_cross_256mb(&buf2, &size2, buf, size);
> 
> This will be fixed by patch 21 (tcg: Allocate code_gen_buffer into struct tcg_region_state), but shouldn't we update tcg_ctx->code_gen_buffer_size here?

Good catch.  I moved the store to _size from above to below.


r~

