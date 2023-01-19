Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D68674555
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:59:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcuZ-0007mj-QY; Thu, 19 Jan 2023 16:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIcuY-0007mX-Jr; Thu, 19 Jan 2023 16:57:30 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIcuX-0005Wd-4G; Thu, 19 Jan 2023 16:57:30 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id C170920E09FC;
 Thu, 19 Jan 2023 13:57:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C170920E09FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674165446;
 bh=ox9Mgqpo2btbYUKl6NZR0OsVv+FdVRx11CPR/p7v8Uk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ahLzHjM0v7SllW+H/FcqUaJcEONdKKMQW4D03tFFBByVkeSHZ40xNELrUdhPhp967
 8HWEBGsEnPFHqkqRTPYEgkJ04PmRLux6P2j0XloJrdB55Auawz4nx3Rj6zmcVmUX8q
 qqYkMec0CQ52vyW+BHc2sRv8dac7CcjPTx6oQo6k=
Message-ID: <b139bb17-4a1e-b393-d06f-67adc3310f46@linux.microsoft.com>
Date: Thu, 19 Jan 2023 22:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/4] hw/char/pl011: implement a reset method
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
 <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/19/2023 14:27, Peter Maydell wrote:
> On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
>> PL011 currently lacks a reset method. Implement it.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> ---
>>   hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
>>   1 file changed, 26 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index 329cc6926d..404d52a3b8 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
>>       s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
>>                                   ClockUpdate);
>>
>> -    s->read_trigger = 1;
>> -    s->ifl = 0x12;
>> -    s->cr = 0x300;
>> -    s->flags = 0x90;
>> -
>>       s->id = pl011_id_arm;
>>   }
>>
>> @@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
>>                                pl011_event, NULL, s, NULL, true);
>>   }
>>
>> +static void pl011_reset(DeviceState *dev)
>> +{
>> +    PL011State *s = PL011(dev);
>> +    int i;
>> +
>> +    s->lcr = 0;
>> +    s->rsr = 0;
>> +    s->dmacr = 0;
>> +    s->int_enabled = 0;
>> +    s->int_level = 0;
>> +    s->ilpr = 0;
>> +    s->ibrd = 0;
>> +    s->fbrd = 0;
>> +    s->read_pos = 0;
>> +    s->read_count = 0;
>> +    s->read_trigger = 1;
>> +    s->ifl = 0x12;
>> +    s->cr = 0x300;
>> +    s->flags = 0x90;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
>> +        qemu_irq_lower(s->irq[i]);
>> +    }
> Reset should never touch outbound qemu_irq lines.
> (The other end of the line will also reset and will end
> up in the correct "as if the input is 0" state.)


Really? I saw this reset happening on other devices in hw/char (don't 
remember which ones specifically), so i though it is needed.


>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> thanks
> -- PMM

