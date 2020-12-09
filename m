Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7182D3DF1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 09:54:15 +0100 (CET)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmvEk-0001PQ-P9
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 03:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmv9k-0008A5-Cv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:49:04 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kmv9h-0003jF-PQ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 03:49:04 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 30D0721CC4;
 Wed,  9 Dec 2020 08:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1607503737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYKPAbN7G+P2pq0UaKuP00j2q15hHhbQRClOa+GePwQ=;
 b=xbplTeXinCRuXZgT4Ub7gPWC8wX1MFmZ1BbyZ1aafi+RCf9czIXukA2yq+7J+aSuLVPGkS
 rcEcfT35p5Y9jMCtjRcIV8XcGsVWwA9QEJZCC1niok52c1+FMNnxah46pokB7TDrX4qlPO
 RIj0GQJcu81mvSQGl0NILaQ/vmbTn2I=
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <a446bff4-04ff-bf3f-d916-2245fdf5436a@greensocs.com>
Date: Wed, 9 Dec 2020 09:49:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/9/20 12:39 AM, Richard Henderson wrote:
> On 12/8/20 12:15 PM, Peter Maydell wrote:
>> The clock_get_ns() API claims to return the period of a clock in
>> nanoseconds. Unfortunately since it returns an integer and a
>> clock's period is represented in units of 2^-32 nanoseconds,
>> the result is often an approximation, and calculating a clock
>> expiry deadline by multiplying clock_get_ns() by a number-of-ticks
>> is unacceptably inaccurate.
>>
>> Introduce a new API clock_ticks_to_ns() which returns the number
>> of nanoseconds it takes the clock to make a given number of ticks.
>> This function can do the complete calculation internally and
>> will thus give a more accurate result.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> The 64x64->128 multiply is a bit painful for 32-bit and I
>> guess in theory since we know we only want bits [95:32]
>> of the result we could special-case it, but TBH I don't
>> think 32-bit hosts merit much optimization effort these days.
>> ---
>>   docs/devel/clocks.rst | 15 +++++++++++++++
>>   include/hw/clock.h    | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
>> index e5da28e2111..aebeedbb95e 100644
>> --- a/docs/devel/clocks.rst
>> +++ b/docs/devel/clocks.rst
>> @@ -258,6 +258,21 @@ Here is an example:
>>                           clock_get_ns(dev->my_clk_input));
>>       }
>>   
>> +Calculating expiry deadlines
>> +----------------------------
>> +
>> +A commonly required operation for a clock is to calculate how long
>> +it will take for the clock to tick N times; this can then be used
>> +to set a timer expiry deadline. Use the function ``clock_ticks_to_ns()``,
>> +which takes an unsigned 64-bit count of ticks and returns the length
>> +of time in nanoseconds required for the clock to tick that many times.
>> +
>> +It is important not to try to calculate expiry deadlines using a
>> +shortcut like multiplying a "period of clock in nanoseconds" value
>> +by the tick count, because clocks can have periods which are not a
>> +whole number of nanoseconds, and the accumulated error in the
>> +multiplication can be significant.
>> +
>>   Changing a clock period
>>   -----------------------
>>   
>> diff --git a/include/hw/clock.h b/include/hw/clock.h
>> index 81bcf3e505a..a9425d9fb14 100644
>> --- a/include/hw/clock.h
>> +++ b/include/hw/clock.h
>> @@ -16,6 +16,7 @@
>>   
>>   #include "qom/object.h"
>>   #include "qemu/queue.h"
>> +#include "qemu/host-utils.h"
>>   
>>   #define TYPE_CLOCK "clock"
>>   OBJECT_DECLARE_SIMPLE_TYPE(Clock, CLOCK)
>> @@ -218,6 +219,34 @@ static inline unsigned clock_get_ns(Clock *clk)
>>       return CLOCK_PERIOD_TO_NS(clock_get(clk));
>>   }
>>   
>> +/**
>> + * clock_ticks_to_ns:
>> + * @clk: the clock to query
>> + * @ticks: number of ticks
>> + *
>> + * Returns the length of time in nanoseconds for this clock
>> + * to tick @ticks times. Because a clock can have a period
>> + * which is not a whole number of nanoseconds, it is important
>> + * to use this function when calculating things like timer
>> + * expiry deadlines, rather than attempting to obtain a "period
>> + * in nanoseconds" value and then multiplying that by a number
>> + * of ticks.
>> + */
>> +static inline uint64_t clock_ticks_to_ns(const Clock *clk, uint64_t ticks)
>> +{
>> +    uint64_t ns_low, ns_high;
>> +
>> +    /*
>> +     * clk->period is the period in units of 2^-32 ns, so
>> +     * (clk->period * ticks) is the required length of time in those
>> +     * units, and we can convert to nanoseconds by multiplying by
>> +     * 2^32, which is the same as shifting the 128-bit multiplication
>> +     * result right by 32.
>> +     */
>> +    mulu64(&ns_low, &ns_high, clk->period, ticks);
>> +    return ns_low >> 32 | ns_high << 32;
> 
> With the shift, you're discarding the high 32 bits of the result.  You'll lose
> those same bits if you shift one of the inputs left by 32, and use only the
> high part of the result, e.g.
> 
>      mulu(&discard, &ret, clk->period, ticks << 32);
>      return ret;
> 
> Which on some hosts, e.g. aarch64, only requires umulh and not two multiply
> instructions.
> 
> Either way, I wonder if you want to either use uint32_t ticks, or assert that
> ticks <= UINT32_MAX?  Or if you don't shift ticks, assert that ns_high <=
> UINT32_MAX, so that you don't lose output bits?

If I'm not mistaken, loosing bits in the 32 bits upper part would mean 
that the number of ticks correspond to a period greater or equal to:
   2^96 ns ~= 251230855258 years.
So I guess this case is not that relevant anyways. Maybe asserting here 
would help the developer using this function to catch a bug in her/his code.

> 
> 
> r~
> 

