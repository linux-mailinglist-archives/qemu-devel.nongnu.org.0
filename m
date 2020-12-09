Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5440B2D4416
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:24:13 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0O3-0003FU-U4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0C3-0005Zt-W7
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:11:48 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0C1-0006IU-R8
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:11:47 -0500
Received: by mail-ot1-x343.google.com with SMTP id b62so1452756otc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ifOxJsK7MEU/FLYj2eYIeScmkIHULfnZsCZYriHNWH4=;
 b=lQKecINqxouQxUK1XVajzLI+tE4UckM+oIcjK/fEI4pIsEkN0zRxWo3xrz0fF1n87l
 pXVKDPfSVLHlAfPruRwMSs7ZYZ0EoWcOEO7beg+jl+W82PYB2GVxMFGSTnn51ftlLxHu
 E6yyhBe4t96u9IyEwt0O0pkZrp+GZ5fTGxo0Znu+5Q4nGVd7Joe4GBw4jjuy5aIozcip
 4FyuMa+DiRRJfQ2TZEqzwhCzMt2JgSwNaBJbk9MGRkgC5hv1Dn8o+Yy2ActgTTasZado
 73Kx+PCmUHtNU2WMSprq2deQaTB6zDyNP4RIby5n5e/feioRa+7ZVONuYX/ZAOHEBv8J
 9L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ifOxJsK7MEU/FLYj2eYIeScmkIHULfnZsCZYriHNWH4=;
 b=ab0upvjjIaHVwRsAn8PN/3svNCKla+tW953dsD6wXqD7Nd7uFcKM9jx0fzuNNYeAPI
 /eKQJq4Yrc/YURYsJVKtqxxcFLB/9DqgYuLmPE50Hu/fPQbqz0fUxtciIRc9r9aoka7E
 t1PiVQEhsjEOfTnL3Lgjrp9z7EqOO0ACpZn6s01a48i6VFJ4aPy+pcnCy+itph+S8qUD
 +n6Z1AqR5I7D+7TpOSIOQdSiZSgZ32FKq46T82ckKa6UcW2fn1rgzuM5ONQkQANtrf5Y
 tOc96MtKwFqJ0TG6ZPf+WhjYQyti3WR+P0VJqhUKsU73dU3vgtrn61E48jnxKth9M85B
 4OfA==
X-Gm-Message-State: AOAM530zolgC2zj0qPtHj0Y4AIE1reiC2iT6FyV2YuWkFB1Ms2qtJbSU
 3vi4DS6qhwT1dVTb3OGGAo+m/Q==
X-Google-Smtp-Source: ABdhPJxAouHnxCqo8qVgifGIM4luOre8j3D+hHwthPth+LHTFja2rpAzWGEJwgrRZgER6v39dkdUtA==
X-Received: by 2002:a9d:6e0d:: with SMTP id e13mr443652otr.334.1607523103545; 
 Wed, 09 Dec 2020 06:11:43 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d62sm325009oia.6.2020.12.09.06.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:11:42 -0800 (PST)
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Luc Michel <luc.michel@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
 <a446bff4-04ff-bf3f-d916-2245fdf5436a@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7d91508-73da-2b26-9a3f-569c7722c99c@linaro.org>
Date: Wed, 9 Dec 2020 08:11:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a446bff4-04ff-bf3f-d916-2245fdf5436a@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 2:49 AM, Luc Michel wrote:
> On 12/9/20 12:39 AM, Richard Henderson wrote:
>> On 12/8/20 12:15 PM, Peter Maydell wrote:
>>> The clock_get_ns() API claims to return the period of a clock in
>>> nanoseconds. Unfortunately since it returns an integer and a
>>> clock's period is represented in units of 2^-32 nanoseconds,
>>> the result is often an approximation, and calculating a clock
>>> expiry deadline by multiplying clock_get_ns() by a number-of-ticks
>>> is unacceptably inaccurate.
>>>
>>> Introduce a new API clock_ticks_to_ns() which returns the number
>>> of nanoseconds it takes the clock to make a given number of ticks.
>>> This function can do the complete calculation internally and
>>> will thus give a more accurate result.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>> The 64x64->128 multiply is a bit painful for 32-bit and I
>>> guess in theory since we know we only want bits [95:32]
>>> of the result we could special-case it, but TBH I don't
>>> think 32-bit hosts merit much optimization effort these days.
>>> ---
>>>   docs/devel/clocks.rst | 15 +++++++++++++++
>>>   include/hw/clock.h    | 29 +++++++++++++++++++++++++++++
>>>   2 files changed, 44 insertions(+)
>>>
>>> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
>>> index e5da28e2111..aebeedbb95e 100644
>>> --- a/docs/devel/clocks.rst
>>> +++ b/docs/devel/clocks.rst
>>> @@ -258,6 +258,21 @@ Here is an example:
>>>                           clock_get_ns(dev->my_clk_input));
>>>       }
>>>   +Calculating expiry deadlines
>>> +----------------------------
>>> +
>>> +A commonly required operation for a clock is to calculate how long
>>> +it will take for the clock to tick N times; this can then be used
>>> +to set a timer expiry deadline. Use the function ``clock_ticks_to_ns()``,
>>> +which takes an unsigned 64-bit count of ticks and returns the length
>>> +of time in nanoseconds required for the clock to tick that many times.
>>> +
>>> +It is important not to try to calculate expiry deadlines using a
>>> +shortcut like multiplying a "period of clock in nanoseconds" value
>>> +by the tick count, because clocks can have periods which are not a
>>> +whole number of nanoseconds, and the accumulated error in the
>>> +multiplication can be significant.
>>> +
>>>   Changing a clock period
>>>   -----------------------
>>>   diff --git a/include/hw/clock.h b/include/hw/clock.h
>>> index 81bcf3e505a..a9425d9fb14 100644
>>> --- a/include/hw/clock.h
>>> +++ b/include/hw/clock.h
>>> @@ -16,6 +16,7 @@
>>>     #include "qom/object.h"
>>>   #include "qemu/queue.h"
>>> +#include "qemu/host-utils.h"
>>>     #define TYPE_CLOCK "clock"
>>>   OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>>> @@ -218,6 +219,34 @@ static inline unsigned clock_get_ns(Clock *clk)
>>>       return CLOCK_PERIOD_TO_NS(clock_get(clk));
>>>   }
>>>   +/**
>>> + * clock_ticks_to_ns:
>>> + * @clk: the clock to query
>>> + * @ticks: number of ticks
>>> + *
>>> + * Returns the length of time in nanoseconds for this clock
>>> + * to tick @ticks times. Because a clock can have a period
>>> + * which is not a whole number of nanoseconds, it is important
>>> + * to use this function when calculating things like timer
>>> + * expiry deadlines, rather than attempting to obtain a "period
>>> + * in nanoseconds" value and then multiplying that by a number
>>> + * of ticks.
>>> + */
>>> +static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
>>> +{
>>> +    uint64_t ns_low, ns_high;
>>> +
>>> +    /*
>>> +     * clk->period is the period in units of 2^-32 ns, so
>>> +     * (clk->period * ticks) is the required length of time in those
>>> +     * units, and we can convert to nanoseconds by multiplying by
>>> +     * 2^32, which is the same as shifting the 128-bit multiplication
>>> +     * result right by 32.
>>> +     */
>>> +    mulu64(&ns_low, &ns_high, clk->period, ticks);
>>> +    return ns_low >> 32 | ns_high << 32;
>>
>> With the shift, you're discarding the high 32 bits of the result.  You'll lose
>> those same bits if you shift one of the inputs left by 32, and use only the
>> high part of the result, e.g.
>>
>>      mulu(&discard, &ret, clk->period, ticks << 32);
>>      return ret;
>>
>> Which on some hosts, e.g. aarch64, only requires umulh and not two multiply
>> instructions.
>>
>> Either way, I wonder if you want to either use uint32_t ticks, or assert that
>> ticks <= UINT32_MAX?  Or if you don't shift ticks, assert that ns_high <=
>> UINT32_MAX, so that you don't lose output bits?
> 
> If I'm not mistaken, loosing bits in the 32 bits upper part would mean that the
> number of ticks correspond to a period greater or equal to:
>   2^96 ns ~= 251230855258 years.

No, would be the bit above above ns_high (this integer 64x64->128
multiplication is computing fixed point 64.0 x 32.32 -> 96.32).

This function is truncating back to 64.0, dropping the 32 high bits and 32 low
bits.  We lose bits at 2^64 ns ~= 584 years.  Which is still unreasonably long,
but could still be had from a timer setting ~= never.

An alternate to an assert could be saturation.  Input "infinity", return
"infinity".  More or less.


r~

