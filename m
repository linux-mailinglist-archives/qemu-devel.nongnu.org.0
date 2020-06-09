Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B151F3985
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 13:22:14 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jicKb-00029s-Qo
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 07:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jicEm-0004SE-1M
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:16:12 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jicEi-0002rp-Tp
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:16:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07749583|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.26687-0.00765069-0.725479;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16384; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=3; RT=3; SR=0; TI=SMTPD_---.Hk5WZ2y_1591701360; 
Received: from 30.225.208.60(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Hk5WZ2y_1591701360)
 by smtp.aliyun-inc.com(10.147.42.241);
 Tue, 09 Jun 2020 19:16:01 +0800
Subject: Re: fpu/softfloat: a question on BFloat 16 support on QEMU
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <ea06c0c3-465e-34a5-5427-41ae6bf583dc@c-sky.com>
 <87img15zfv.fsf@linaro.org> <53bee901-6917-1783-6507-3fef6955cc49@c-sky.com>
 <874krk60e2.fsf@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e48bd1a7-66c4-da43-a413-16aa22f5cd99@c-sky.com>
Date: Tue, 9 Jun 2020 19:16:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <874krk60e2.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 07:16:03
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/6/9 17:42, Alex Bennée wrote:
> LIU Zhiwei <zhiwei_liu@c-sky.com> writes:
>
>> On 2020/6/8 23:50, Alex Bennée wrote:
>>> LIU Zhiwei <zhiwei_liu@c-sky.com> writes:
>>>
>>>> Hi Richard,
>>>>
>>>> I am doing bfloat16 support on QEMU.
>>>>
>>>> Once I tried to reuse float32 interface, but I couldn't properly process
>>>> rounding in some insns like fadd.
>>> What do you mean by re-use the float32 interface?
>> Once I think bfloat16 can been converted to float32  by
>>
>> deposit32(0, 16, 16, bf16)
>>
>> Then do a bfloat16 op by float32 op.
> No I don't think you want to be munging things like that - best to
> decompose it into FloatParts and let the common code deal with the
> actual calculation.
>
> We've learnt the hard way that having lots of slightly different
> functions each dealing with edge cases and rounding ends up in mistakes
> creeping in. The common code path is well tested and a lot easier to
> understand.
Get it. Thanks.
If I am ready, I will upstream the bfloat16 code.

Best Regards,
Zhiwei
>> At last, get the bfloat16 result by right shift the float32 result 16
>> bits.
> Again the common round and packing code should be agnostic to the
> underlying precision.
>
>>> Isn't bfloat16 going
>>> to be pretty much the same as float16 but with some slightly different
>>> float parameters for the different encoding?
>> Agree.
>>> Like the float16 code it won't have to deal with any of the hardfloat
>>> wrappers so it should look pretty similar.
>> Good idea. I will list the float16 interfaces,  and try to emulate the
>> bfloat16 one by one.
>>
>> I list float16 interfaces in softfloat.c alone. It counts 67 interfaces.
>>>> What's your opinion about it? Should I expand the fpu/softfloat?
>>> bfloat16 is certainly going to become more common that we should have
>>> common softfloat code to handle it. It would be nice is TestFloat could
>>> exercise it as well.
>> Thanks. I will try to use make check-softfloat to test bfloat16 interfaces.
>>
>> Best Regards,
>> Zhiwei
>>>> Best Regards,
>>>> Zhiwei
>


