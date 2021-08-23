Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E013F4BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 15:23:38 +0200 (CEST)
Received: from localhost ([::1]:37742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9vN-00008X-IW
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 09:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI9tj-0007hw-Gt; Mon, 23 Aug 2021 09:21:55 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mI9th-0007V0-PG; Mon, 23 Aug 2021 09:21:55 -0400
Received: by mail-wm1-x335.google.com with SMTP id g138so10529241wmg.4;
 Mon, 23 Aug 2021 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mmho2NJmArVXgpklI5qhMqPsxyU8avG5szH/hlzLIpA=;
 b=elmfV7gYhE7Ghp4bc5S+TO9IgxXgKzCwodB2ESbACb44o4OGCFnEg5eXsTVOpo2lo6
 VkQG1wcoRrDP/kmloVseZt80Vjg03EsDWnGDwhP0zVx2mbCRSKN/9y/r+e199SbOaa+3
 6CYAZM2A+Wfb8HQKgoUl3IrdSDeTgNt/td/Zzv8xhiRaPP+caf5hLDxqQzBkmk4FCxHz
 uZ6nDbx0JnAydvhBLjlxFbluluZ1Rw2HkbTYRa//FI8SawW9qEykSelilW4tRLeeuQ5P
 UHN7Tg3/bJIRR3XCRmmdlOsSo0VCGyE+6ZfeeOEgc1QcohZf0EphtSyME1uTMSV7+DpB
 sbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mmho2NJmArVXgpklI5qhMqPsxyU8avG5szH/hlzLIpA=;
 b=pqIb32GbfCl7QVXbagbzmT0j01+28L3puFivV5Y9fBzmg8TABQS+swVkOFaspcEJRx
 b6HHnKOAZ5wsUTumsTJbjYl7laejpy49qGNq7xzwl2Brae4jUXlqMt4npNarcvfl6EVS
 v9eTRhHMPJT05xRw6P7PtELKNce1RxHeJE42rGX/r97awnbU+UXjq27rsoAgS990NDIk
 +VL7zbqyYKjNT6j0ggll8iLsyZ9RzyhSaq/rBTXqadLFa5jFl5Zd6eBbdFhYRsL+TOT7
 Arr7okusRC3pnBJj1Bk/pFh0aRcN1mVarqbH0THNUjZS7EvaG9roF8kKuM/SfeLYcVnI
 Am5Q==
X-Gm-Message-State: AOAM531NwQfI3TmeLILE7fhGKv8KartIL5lpNpVTRZNi+FmV+EhCL5rN
 blbk/ANnQvebB+rT90lwndE=
X-Google-Smtp-Source: ABdhPJwV6XcLuooP6taMdYYpopswex5q6H7t4t5O9tVA7NV9+OBBSVvH6VT7vPX8lX0pffNS9d6DcQ==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr16367014wmp.146.1629724911823; 
 Mon, 23 Aug 2021 06:21:51 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p8sm17602720wme.22.2021.08.23.06.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 06:21:51 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/char: cadence_uart: Disable transmit when input
 clock is disabled
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210823020813.25192-1-bmeng.cn@gmail.com>
 <20210823020813.25192-3-bmeng.cn@gmail.com>
 <7997927e-3a66-aa0e-6099-f1efe3cbb9ee@amsat.org>
 <CAEUhbmVVRKebU-=k0WaxpaRe-E_UsLy_82K0PzRE=7xNHp9hGQ@mail.gmail.com>
 <abf7ac8e-c5bc-e239-ab9b-a9d868b477dc@amsat.org>
 <CAEUhbmUbeYzbO0dnj2d6A58_Yb=Z9bWFd=1U=iP4GZTqDuz6xQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c90d0295-6d9a-148d-1aff-f7a41e9d62f9@amsat.org>
Date: Mon, 23 Aug 2021 15:21:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUbeYzbO0dnj2d6A58_Yb=Z9bWFd=1U=iP4GZTqDuz6xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.023,
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
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 3:14 PM, Bin Meng wrote:
> On Mon, Aug 23, 2021 at 6:43 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/23/21 11:57 AM, Bin Meng wrote:
>>> On Mon, Aug 23, 2021 at 4:14 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> On 8/23/21 4:08 AM, Bin Meng wrote:
>>>>> At present when input clock is disabled, any character transmitted
>>>>> to tx fifo can still show on the serial line, which is wrong.
>>>>>
>>>>> Fixes: b636db306e06 ("hw/char/cadence_uart: add clock support")
>>>>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>>>> ---
>>>>>
>>>>>  hw/char/cadence_uart.c | 5 +++++
>>>>>  1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>>>>> index b4b5e8a3ee..154be34992 100644
>>>>> --- a/hw/char/cadence_uart.c
>>>>> +++ b/hw/char/cadence_uart.c
>>>>> @@ -327,6 +327,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
>>>>>  static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
>>>>>                                 int size)
>>>>>  {
>>>>> +    /* ignore characters when unclocked or in reset */
>>>>> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
>>>>> +        return;
>>>>> +    }
>>>>
>>>> Incorrect handler?
>>>>
>>>
>>> Sorry I don't get it. This patch is for the Tx path, while patch #3 is
>>> for the Rx path.
>>
>> Sorry, I was not totally awake o_O
>>
>> -- >8 --
>> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
>> index b4b5e8a3ee0..78990ea79dc 100644
>> --- a/hw/char/cadence_uart.c
>> +++ b/hw/char/cadence_uart.c
>> @@ -403,15 +403,20 @@ static void uart_read_rx_fifo(CadenceUARTState *s,
>> uint32_t *c)
>>      uart_update_status(s);
>>  }
>>
>> -static void uart_write(void *opaque, hwaddr offset,
>> -                          uint64_t value, unsigned size)
>> +static MemTxResult uart_write(void *opaque, hwaddr offset, uint64_t value,
>> +                              unsigned size, MemTxAttrs attrs)
>>  {
>>      CadenceUARTState *s = opaque;
>>
>> +    /* ignore characters when unclocked or in reset */
>> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
>> +        return MEMTX_DECODE_ERROR;
>> +    }
>> +
>>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
>>      offset >>= 2;
>>      if (offset >= CADENCE_UART_R_MAX) {
>> -        return;
>> +        return MEMTX_OK;
>>      }
>>      switch (offset) {
>>      case R_IER: /* ier (wts imr) */
>> @@ -458,14 +463,21 @@ static void uart_write(void *opaque, hwaddr offset,
>>          break;
>>      }
>>      uart_update_status(s);
>> +
>> +    return MEMTX_OK;
>>  }
>>
>> -static uint64_t uart_read(void *opaque, hwaddr offset,
>> -        unsigned size)
>> +static MemTxResult uart_read(void *opaque, hwaddr offset, uint64_t *data,
>> +                             unsigned size, MemTxAttrs attrs)
>>  {
>>      CadenceUARTState *s = opaque;
>>      uint32_t c = 0;
>>
>> +    /* ignore characters when unclocked or in reset */
>> +    if (!clock_is_enabled(s->refclk) || device_is_in_reset(DEVICE(s))) {
>> +        return MEMTX_DECODE_ERROR;
>> +    }
>> +
>>      offset >>= 2;
>>      if (offset >= CADENCE_UART_R_MAX) {
>>          c = 0;
>> @@ -476,12 +488,14 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
>>      }
>>
>>      DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2),
>> (unsigned)c);
>> -    return c;
>> +    *data = c;
>> +
>> +    return MEMTX_OK;
>>  }
>>
>>  static const MemoryRegionOps uart_ops = {
>> -    .read = uart_read,
>> -    .write = uart_write,
>> +    .read_with_attrs = uart_read,
>> +    .write_with_attrs = uart_write,
>>      .endianness = DEVICE_NATIVE_ENDIAN,
>>  };
> 
> Thanks, but I think the above change should be a totally separate patch.

Yes, this was not a patch snippet, but the result.

First patch would be convert to memop_with_attrs() and
second return MEMTX_DECODE_ERROR when unclocked.

