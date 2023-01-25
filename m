Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0267B51D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 15:51:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKh6h-00010K-2W; Wed, 25 Jan 2023 09:50:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pKh6X-0000zY-8z; Wed, 25 Jan 2023 09:50:29 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pKh6V-0003cT-42; Wed, 25 Jan 2023 09:50:25 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id CD21E20E580E;
 Wed, 25 Jan 2023 06:50:18 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CD21E20E580E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674658219;
 bh=USZiNuJEoiOuVF5clpkTLG8fOjsoeIsxtFfKzGiab/k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PUjywKKWmNre7yVF1FTjIWQyUfjRD25/+WEvcMm94PD463nbBNSsQKkWIaNAQQwbL
 vy7gdltEdfxal9EtLtdAR99/DwS4zRpAwoGZOEORnE6gbGd9Y25cEQ144AezmVYbsh
 lM3s8xKNqMkx1ZFyV9luzaGA4M2T03bcKoGoi8yY=
Message-ID: <c1568ae1-2740-9628-ee70-ed3914d37e56@linux.microsoft.com>
Date: Wed, 25 Jan 2023 15:50:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
 <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
 <484f5d72-2186-c60c-112a-1ae76b7b7e45@linaro.org>
Content-Language: en-US
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <484f5d72-2186-c60c-112a-1ae76b7b7e45@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -208
X-Spam_score: -20.9
X-Spam_bar: --------------------
X-Spam_report: (-20.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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


On 1/23/2023 17:41, Philippe Mathieu-Daudé wrote:
> On 23/1/23 17:23, Peter Maydell wrote:
>> On Mon, 23 Jan 2023 at 15:21, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>> pl011_can_receive() returns the number of bytes that pl011_receive() 
>>> can
>>> accept, pl011_can_transmit() returns a boolean.
>>>
>>> I was thinking of:
>>>
>>> -- >8 --
>>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>>> index dd20b76609..ea5769a31c 100644
>>> --- a/hw/char/pl011.c
>>> +++ b/hw/char/pl011.c
>>> @@ -221,6 +221,11 @@ static inline bool 
>>> pl011_can_transmit(PL011State *s)
>>>        return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>>    }
>>>
>>> +static inline bool pl011_can_receive(PL011State *s)
>>> +{
>>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
>>> +}
>>> +
>>>    static void pl011_write(void *opaque, hwaddr offset,
>>>                            uint64_t value, unsigned size)
>>>    {
>>> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr 
>>> offset,
>>>        }
>>>    }
>>>
>>> -static int pl011_can_receive(void *opaque)
>>> +static int pl011_receivable_bytes(void *opaque)
>>>    {
>>>        PL011State *s = (PL011State *)opaque;
>>>        int r;
>>>
>>> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>>> +    if (!pl011_can_receive(s)) {
>>>            r = 0;
>>>        } else {
>>>            r = s->read_count < pl011_get_fifo_depth(s);
>>> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error
>>> **errp)
>>>    {
>>>        PL011State *s = PL011(dev);
>>>
>>> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, 
>>> pl011_receive,
>>> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes,
>>> pl011_receive,
>>>                                 pl011_event, NULL, s, NULL, true);
>>>    }
>>>
>>> ---
>>>
>>> with maybe a better name for pl011_receivable_bytes().
>>
>> Our standard-ish name for the function you pass to
>> qemu_chr_fe_set_handlers() is either foo_can_receive
>> or foo_can_read, though. That is followed through in
>> the name of the function argument (fd_can_read),
>> its type (IOCanReadHandler), and the field it gets stored
>> in (CharBackend::chr_can_read). It's not a great convention
>> but at least it is a convention...
>
> I agree this deserves a better name; maybe this is not a
> convention but I'd expect functions starting with is_* / can_*
> to return a boolean value, not a number:
>
> /**
>  * IOCanReadHandler: Return the number of bytes that #IOReadHandler 
> can accept
>  *
>  * This function reports how many bytes #IOReadHandler is prepared to 
> accept.
>  * #IOReadHandler may be invoked with up to this number of bytes. If this
>  * function returns 0 then #IOReadHandler is not invoked.
>  *
>  * This function is typically called from an event loop.  If the 
> number of
>  * bytes changes outside the event loop (e.g. because a vcpu thread 
> drained the
>  * buffer), then it is necessary to kick the event loop so that this 
> function
>  * is called again.  aio_notify() or qemu_notify_event() can be used 
> to kick
>  * the event loop.
>  */
> typedef int IOCanReadHandler(void *opaque);
>
> Also, maybe using unsigned or size_t type for the return value would
> better fit. Anyhow, not really a priority :)


I've made a rename for v4 though :) Feel free to ignore it then and take 
the current version, there's no functional change in 5/5 otherwise.



