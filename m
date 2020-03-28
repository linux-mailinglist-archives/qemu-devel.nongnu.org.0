Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540DC196716
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Mar 2020 16:38:48 +0100 (CET)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIDXq-0003Yx-QV
	for lists+qemu-devel@lfdr.de; Sat, 28 Mar 2020 11:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDWe-00034F-O9
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:37:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jIDWb-0007ql-Kf
 for qemu-devel@nongnu.org; Sat, 28 Mar 2020 11:37:30 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54829)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jIDWb-00078o-39; Sat, 28 Mar 2020 11:37:29 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07607991|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0594787-0.00084909-0.939672;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03268; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H6iwVdF_1585409828; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H6iwVdF_1585409828)
 by smtp.aliyun-inc.com(10.147.40.44); Sat, 28 Mar 2020 23:37:09 +0800
Subject: Re: [PATCH v6 25/61] target/riscv: vector single-width averaging add
 and subtract
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-26-zhiwei_liu@c-sky.com>
 <0cdf21fd-b1f1-36bf-f156-5a673199fa1f@c-sky.com>
 <5c2f0b77-32fa-76bd-0b0e-4ca91d87f3b6@linaro.org>
 <f50a4a63-c5cf-4322-9663-98fb15dde715@c-sky.com>
 <ce13869a-141f-cc4d-8f1e-6a3742197654@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b7705caf-be47-d570-8173-08cc625202cd@c-sky.com>
Date: Sat, 28 Mar 2020 23:37:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <ce13869a-141f-cc4d-8f1e-6a3742197654@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: guoren@linux.alibaba.com, wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, wxy194768@alibaba-inc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/3/28 9:22, Richard Henderson wrote:
> On 3/27/20 6:07 PM, LIU Zhiwei wrote:
>>
>> On 2020/3/28 8:32, Richard Henderson wrote:
>>> On 3/18/20 8:46 PM, LIU Zhiwei wrote:
>>>> +static inline int32_t asub32(CPURISCVState *env, int vxrm, int32_t a, int32_t b)
>>>> +{
>>>> +    int64_t res = (int64_t)a - b;
>>>> +    uint8_t round = get_round(vxrm, res, 1);
>>>> +
>>>> +    return (res >> 1) + round;
>>>> +}
>>>> +
>>>>
>>>> I find a corner case here.  As the spec said in Section 13.2
>>>>
>>>>    "There can be no overflow in the result".
>>>>
>>>> If the a is 0x7fffffff,  b is 0x80000000, and the round mode is round to up(rnu),
>>>> then the result is (0x7fffffff - 0x80000000 + 1) >> 1, equals 0x80000000,
>>>> according the v0.7.1
>>> That's why we used int64_t as the intermediate type:
>>>
>>>    0x000000007fffffff - 0xffffffff80000000 + 1
>>> = 0x000000007fffffff + 0x0000000080000000 + 1
>>> = 0x00000000ffffffff + 1
>>> = 0x0000000100000000
>>>
>>> Shift that right by 1 and you do indeed get 0x80000000.
>>> There's no saturation involved.
>> The minuend 0x7fffffff is INT32_MAX, and the subtrahend 0x80000000 is INT32_MIN.
>>
>> The difference between the minuend  and the subtrahend should be a positive
>> number. But the result here is 0x80000000.
>>
>> So it is overflow.  However, according to the spec, it should not overflow.
> Unless I'm missing something, the spec is wrong about "there can be no
> overflow", the above being a counter-example.
>
> Do you have hardware to compare against?  Perhaps it is in fact "overflow is
> ignored", as the 0.8 spec says for vasubu?
Agree! the overflow is just ignored. The code in the patch is OK now.

I discussed it with hardware coworker and software coworker.

The hardware coworker points that  it is an error in spec.

The software coworker think overflow will make this instruction some 
awkward,
as the shift and round should protect the result from overflow.

Like vasubu,  overflow ignore is much better for vasub in this case.

Zhiwei
>
> I wouldn't add saturation, because the spec says nothing about saturation, and
> does mention truncation, at least for vasubu.
>
>
> r~


