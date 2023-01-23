Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7456780AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzE9-00020f-2Y; Mon, 23 Jan 2023 10:59:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzE6-00020P-UW; Mon, 23 Jan 2023 10:59:19 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzE5-0007PE-7U; Mon, 23 Jan 2023 10:59:18 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 65FA520E2D0F;
 Mon, 23 Jan 2023 07:59:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 65FA520E2D0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674489555;
 bh=H5IXCBsXs+2eIhZoL7esKf8UqYYK+CJzFKL1wDWLnOY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PICWPvoKTZgNdRdFmyoREBvQdJsJlPBdbMK4PAs1IYTmIKGU28tL3DO9oxeD57QmA
 WVXq+7fP961gxNPndxeho87CSd7xBMnVrVN7afHqjOIYaNn3s3Dh9TV+krfcSPBKsW
 u9Y66awJ2Uw4m5DrbXkwJD8wYexbl2i1l53T4eZo=
Message-ID: <be7dae6f-30d6-a6c6-af3c-4d826b39de07@linux.microsoft.com>
Date: Mon, 23 Jan 2023 16:59:12 +0100
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
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
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


On 1/23/2023 16:21, Philippe Mathieu-Daudé wrote:
> On 23/1/23 15:43, Evgeny Iakovlev wrote:
>>
>> On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
>>> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>>>> UART should be enabled in general and have RX enabled specifically 
>>>> to be
>>>> able to receive data from peripheral device. Same goes for 
>>>> transmitting
>>>> data to peripheral device and a TXE flag.
>>>>
>>>> Check if UART CR register has EN and RXE or TXE bits enabled before
>>>> trying to receive or transmit data.
>>>>
>>>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>> ---
>>>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>
>>>> +static inline bool pl011_can_transmit(PL011State *s)
>>>> +{
>>>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>>> +}
>>>> +
>>>>   static void pl011_write(void *opaque, hwaddr offset,
>>>>                           uint64_t value, unsigned size)
>>>>   {
>>>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr 
>>>> offset,
>>>>         switch (offset >> 2) {
>>>>       case 0: /* UARTDR */
>>>> -        /* ??? Check if transmitter is enabled.  */
>>>> +        if (!pl011_can_transmit(s)) {
>>>> +            break;
>>>> +        }
>>>>           ch = value;
>>>>           /* XXX this blocks entire thread. Rewrite to use
>>>>            * qemu_chr_fe_write and background I/O callbacks */
>>>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>>>       PL011State *s = (PL011State *)opaque;
>>>>       int r;
>>>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>>>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>>>
>>> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>>>
>>> Otherwise:
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>
>> Thanks! There's already a pl011_can_receive though, its the 
>> pl011_can_transmit that's new :)
>
> pl011_can_receive() returns the number of bytes that pl011_receive() 
> can accept, pl011_can_transmit() returns a boolean.


Hm, no, pl011_can_receive never actually returned the number of bytes. 
It's a boolean value as an int. Which is a bug, because 
qemu_chr_fe_set_handlers expects it to return the byte count, not a 0/1 
value.

I'll fix it then.


>
> I was thinking of:
>
> -- >8 --
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index dd20b76609..ea5769a31c 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State *s)
>      return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>  }
>
> +static inline bool pl011_can_receive(PL011State *s)
> +{
> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
> +}
> +
>  static void pl011_write(void *opaque, hwaddr offset,
>                          uint64_t value, unsigned size)
>  {
> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr 
> offset,
>      }
>  }
>
> -static int pl011_can_receive(void *opaque)
> +static int pl011_receivable_bytes(void *opaque)
>  {
>      PL011State *s = (PL011State *)opaque;
>      int r;
>
> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
> +    if (!pl011_can_receive(s)) {
>          r = 0;
>      } else {
>          r = s->read_count < pl011_get_fifo_depth(s);
> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error 
> **errp)
>  {
>      PL011State *s = PL011(dev);
>
> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes, 
> pl011_receive,
>                               pl011_event, NULL, s, NULL, true);
>  }
>
> ---
>
> with maybe a better name for pl011_receivable_bytes().
>

