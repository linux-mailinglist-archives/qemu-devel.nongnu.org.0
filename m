Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7939F309230
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 06:28:53 +0100 (CET)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ioW-0001iB-2j
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 00:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5inm-0001Hk-TQ
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 00:28:06 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:38594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5ink-0007uN-LW
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 00:28:06 -0500
Received: by mail-pg1-x52f.google.com with SMTP id o16so8044341pgg.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 21:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QW8qc3eoAAMWez/ziDyf2b4EgPs1eCCUQoZKvxGJwFw=;
 b=vH0JlYdwTZrkXc4aewuVWIva96IUM2kp5QGh+K5KrVVgWCicK7z4S+j3jyypX0hG/x
 LzNBt+XCVpcACkfXKkZMz2EHwyvlW0ROONb0KgQuzxs7/T8O3EyFoNOe4VQCdS23yh2K
 imIhmZ0k5lhNFIlmR5sB1b6+Slby9eJyi2HKDf6XUdmAptSAUqqk9kEwniq4sG3BMR1E
 DAOI8E3u25YWg2nM0kwSfAYg0qbacRiztwm3B7ALvf2s4hqThPJWa8V+KqCYpfpCDLCM
 6JZUUMtRsu6UYez3NX9qR9Mhd5c6ssFsLC+OGePpDb9FG8eiDkDmgtdn3MSVig9xdehw
 9CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QW8qc3eoAAMWez/ziDyf2b4EgPs1eCCUQoZKvxGJwFw=;
 b=PLnXuhMel9SXsmJQQs0LCOhMY+v0G0NgM72NDI0STghAU+6BRWTtcUA+0Pba4uTBU3
 8X2sMIxf9rF1r4Ko4h6NhbqUms3vWZfV9M1Zr9+57WIXrh/8IqQePC4zEqmoHz/oeuSi
 /74x1jYFTQw0NhPoAkyKQNIVq24JyvKAM8AECL8UXsQtz/R1kyTCqlk9QVqea9kGAK6E
 olA+oUqwbN/mDtnavZiTemNEN4LfhLksTArmOX9lm+b5s4xfTtsehKPdM9tzWGns+AH6
 dxB2A9lr7sezIycxzRTwuwdJVbaZA6M+wdwtWkZjN08T0fIYYDN+AzBYwDa3Sxukl6KZ
 O2tg==
X-Gm-Message-State: AOAM531v8hA8Ftu7ILsYrovM1JA5Q4qC692f13AKaKULh3Y61AF2WG+B
 bZK+yjM5zbOGZtbhG9netMMMog==
X-Google-Smtp-Source: ABdhPJx40FRA6ySQZQg0iol/w61RTLpasTP21e/em8GFi10ACDNqdt1+dYDliZeI6/tIaIylIwYQTA==
X-Received: by 2002:a65:57c7:: with SMTP id q7mr7603950pgr.277.1611984482228; 
 Fri, 29 Jan 2021 21:28:02 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id n2sm10667093pfu.129.2021.01.29.21.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 21:28:01 -0800 (PST)
Subject: Re: [PATCH v3] tcg: Fix execution on Apple Silicon
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20210113032806.18220-1-r.bolshakov@yadro.com>
 <e0b70beb-2905-9520-e825-219278fe4ed7@linaro.org>
 <330c4b1a-6a8a-3625-8c39-7f9c88b20847@linaro.org>
 <YBR1GgEg+WLIo9/M@SPB-NB-133.local>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <616e9fff-f4eb-8540-9628-2bce9c455c6b@linaro.org>
Date: Fri, 29 Jan 2021 19:27:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YBR1GgEg+WLIo9/M@SPB-NB-133.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Joelle van Dyne <j@getutm.app>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 10:50 AM, Roman Bolshakov wrote:
> On Fri, Jan 29, 2021 at 10:18:58AM -1000, Richard Henderson wrote:
>> On 1/21/21 8:34 AM, Richard Henderson wrote:
>>> On 1/12/21 5:28 PM, Roman Bolshakov wrote:
>>>> @@ -1083,6 +1083,12 @@ static bool alloc_code_gen_buffer_anon(size_t size, int prot,
>>>>  {
>>>>      void *buf;
>>>>  
>>>> +#if defined(MAC_OS_VERSION_11_0) && \
>>>> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
>>>> +    if (__builtin_available(macOS 11.0, *)) {
>>>> +        flags |= MAP_JIT;
>>>> +    }
>>>> +#endif
>>>
>>> This hunk should be in alloc_code_gen_buffer, where we do the other flags
>>> manipulation.
>>>
>>> I'll drop this hunk and apply the rest, which is exclusively related to
>>> toggling the jit bit.
>>
>> Ping on this?
>>
> Hi Richard,
> 
>> I would imagine that the patch would look something like
>>
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
>> @@ -1296,6 +1296,11 @@ static bool alloc_code_gen_buffer
>>  #ifdef CONFIG_TCG_INTERPRETER
>>      /* The tcg interpreter does not need execute permission. */
>>      prot = PROT_READ | PROT_WRITE;
>> +#elif defined(MAC_OS_VERSION_11_0) && \
>> +    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0
>> +    if (__builtin_available(macOS 11.0, *)) {
>> +        flags |= MAP_JIT;
>> +    }
>>  #elif defined(CONFIG_DARWIN)
>>      /* Applicable to both iOS and macOS (Apple Silicon). */
>>      if (!splitwx) {
>>
>> But I don't know how CONFIG_DARWIN, iOS, and MAC_OS_VERSION interact, and I'm
>> not able to even compile-test the patch.
>> Certainly the final comment there looks suspicious, given the preceding MAC_OS
>> stanza...
>>
> 
> I thought you already added MAP_JIT in 6f70ddee19e. It's getting enabled
> on my M1 laptop. Was it intended or not?
> 
>     /* Applicable to both iOS and macOS (Apple Silicon). */
>     if (!splitwx) {
>         flags |= MAP_JIT;
>     }
> 
> TCG from master branch of QEMU works fine on M1. I'm not sure why do we
> need to duplicate it.

I thought there was something about abi/api build issues.  If there's nothing
that needs doing, great!


r~


