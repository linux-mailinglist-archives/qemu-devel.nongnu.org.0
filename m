Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB485677E4B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 15:44:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJy2T-0000sd-Ll; Mon, 23 Jan 2023 09:43:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJy2N-0000rK-4L; Mon, 23 Jan 2023 09:43:07 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJy2L-0000eE-Mg; Mon, 23 Jan 2023 09:43:06 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3922E20E2D07;
 Mon, 23 Jan 2023 06:43:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3922E20E2D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674484983;
 bh=2GWLY1N1oXzoQM3H+Mu71nQ/nLi1bQVm99dloDvq4bI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hwl5sS/zyKRxSi7CxOG8yD73Me2IIfuODtRuaeRJ+cuNuE2vZdwDcbd2WdxDVkB1w
 r4S7fBmrKj9ejJ3z0y0aHGJiARivA9dmaT8jSl2/nZkW0Q7aLaPHYQRikA6uWf4yCp
 vmn76vZebMc9tJbjYcfVEd38XqdPZLVGjQmp0JwI=
Message-ID: <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
Date: Mon, 23 Jan 2023 15:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -208
X-Spam_score: -20.9
X-Spam_bar: --------------------
X-Spam_report: (-20.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>> UART should be enabled in general and have RX enabled specifically to be
>> able to receive data from peripheral device. Same goes for transmitting
>> data to peripheral device and a TXE flag.
>>
>> Check if UART CR register has EN and RXE or TXE bits enabled before
>> trying to receive or transmit data.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>
>> +static inline bool pl011_can_transmit(PL011State *s)
>> +{
>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>> +}
>> +
>>   static void pl011_write(void *opaque, hwaddr offset,
>>                           uint64_t value, unsigned size)
>>   {
>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>>         switch (offset >> 2) {
>>       case 0: /* UARTDR */
>> -        /* ??? Check if transmitter is enabled.  */
>> +        if (!pl011_can_transmit(s)) {
>> +            break;
>> +        }
>>           ch = value;
>>           /* XXX this blocks entire thread. Rewrite to use
>>            * qemu_chr_fe_write and background I/O callbacks */
>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>       PL011State *s = (PL011State *)opaque;
>>       int r;
>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>
> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Thanks! There's already a pl011_can_receive though, its the 
pl011_can_transmit that's new :)


>
>> +        r = 0;
>> +    } else {
>> +        r = s->read_count < pl011_get_fifo_depth(s);
>> +    }
>>       trace_pl011_can_receive(s->lcr, s->read_count, r);
>>       return r;
>>   }

