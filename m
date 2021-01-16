Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE82F8D9E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 17:13:43 +0100 (CET)
Received: from localhost ([::1]:54938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0oCr-0003zg-PJ
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 11:13:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0oBQ-0003Sk-An; Sat, 16 Jan 2021 11:12:12 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0oBO-00080G-Ij; Sat, 16 Jan 2021 11:12:12 -0500
Received: by mail-wr1-x435.google.com with SMTP id v15so8628199wrx.4;
 Sat, 16 Jan 2021 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oxOL1MDGpic7M31Lg7mDraKuOjB4l0Ysgno9cxrjJLM=;
 b=Bq5Wt7B0692GwkYRGkktDE/N9CoGYffFSdriAxO6WbQeuWrGl7380XwD+iA045SMlV
 Uq/6IHgonHSHxPVHESdBBAgOlcA13LetkqzJGrhFHuptW1oR8XTpH2FT5xZQK2LVyn25
 7mwzBfQk0zZaOa0CRtLqJEsD/GYhp5Beq2MjKeELjnQvR8mm54IUvXNe5wrXHaRKK17+
 YEcyNrzdx2foJ1xF/D3NTTQWzhzWwxS1mjmnJ+PUFxM222Mt9CYOh7/jzQwiULRHmZQC
 b+LyfkYCMTtxvFFAGNHHFg10hRt9r5m9Yp2T6oXvqJuVF1gTSjSxDnrbyjbR+mqk8Oo3
 oDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oxOL1MDGpic7M31Lg7mDraKuOjB4l0Ysgno9cxrjJLM=;
 b=ZeZotPo2vF6LP1syAW+mflnMdAh67WpovqbcylwobQKGwwnjMT1KwJTHm1g61YNp1Q
 sJ5rNCHCRAYbX9U4/SRuBL5BYm8YLOsRErmkJPeGQCRFu+WP08azOiaLxT7dAyj/t9CB
 X520aJh3Aesppa4kRB4+eKX/eGiBKDovqwGqlSr9x3FQfFwDfU4Z/HCu5GemOdnU8oo8
 UE6xlwU2i5eWjhk8Zmq2GDAoJCfFp3RP+1pCRyOxI+89Hd4T6D8juM6WlPI7dT2NEpS+
 0knzVz3t+Lj8GpStzwyt0orVV5z6cftRo5otV21stYi2jwM5mO6U4cpihPBWDo26bC3F
 dRwg==
X-Gm-Message-State: AOAM531VTlERIA2J9Cktli2x0zyUwFy4I2SlRKUj2Yl411wPUWnMgxZF
 JnFlKo8P0kqE9OOKuuxSd1E=
X-Google-Smtp-Source: ABdhPJxB1WrvNr5gF4p33SJDmeT+Ln4Pm9TQJ0T3YhSXOvWttoD0oRz7EsvIS37CWWjoOlRAfYgdYQ==
X-Received: by 2002:adf:b343:: with SMTP id k3mr18163677wrd.202.1610813528418; 
 Sat, 16 Jan 2021 08:12:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a62sm15652944wmf.7.2021.01.16.08.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 08:12:07 -0800 (PST)
Subject: Re: [PATCH v7 5/9] hw/ssi: imx_spi: Rework imx_spi_write() to handle
 block disabled
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-6-f4bug@amsat.org>
 <CAEUhbmUXfm4JqqopEhq9-FQYJeY8Md7uwCczbSHm2H9oqERkJg@mail.gmail.com>
 <7fcb40af-12a4-8926-b612-34d21988baf5@amsat.org>
 <CAEUhbmWP5dyKuttdT+-DGSCQdqV326dGwWfS_=RQcxsjTfz_JQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dd9868f5-7d94-4516-6300-2bf5f2bf850f@amsat.org>
Date: Sat, 16 Jan 2021 17:12:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWP5dyKuttdT+-DGSCQdqV326dGwWfS_=RQcxsjTfz_JQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/16/21 4:59 PM, Bin Meng wrote:
> Hi Philippe,
> 
> On Sat, Jan 16, 2021 at 11:21 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Bin,
>>
>> On 1/16/21 2:57 PM, Bin Meng wrote:
>>> On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> When the block is disabled, only the ECSPI_CONREG register can
>>>> be modified. Setting the EN bit enabled the device, clearing it
>>>
>>> I don't know how this conclusion came out. The manual only says the
>>> following 2 registers ignore the write when the block is disabled.
>>>
>>> ECSPI_TXDATA, ECSPI_INTREG
>>
>> 21.4.5 Reset
>>
>>   Whenever a device reset occurs, a reset is performed on the
>>   ECSPI, resetting all registers to their default values.
>>
>> My understanding is it is pointless to update them when the
>> device is in reset, as they will get their default value when
>> going out of reset.
> 
> I have a different understanding. When ECSPI_CONREG[EN] is cleared,
> it's like a hardware reset, and the ECSPI takes the following action:
> 
>     "Whenever a device reset occurs, a reset is performed on the
> ECSPI, resetting all registers to their default values."
> 
> Chapter 21.4.5 Reset does not mention what's the hardware behavior afterwards.
> 
> So my understanding is: afterwards, the software can still write to
> various registers, unless the register description tells us it's
> ignored.
> 
>>
>>>
>>>> "disables the block and resets the internal logic with the
>>>> exception of the ECSPI_CONREG" register.
>>>>
>>>> Move the imx_spi_is_enabled() check earlier.
>>>>
>>>> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>>>>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/ssi/imx_spi.c | 26 ++++++++++++++++----------
>>>>  1 file changed, 16 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>> index ba7d3438d87..f06bbf317e2 100644
>>>> --- a/hw/ssi/imx_spi.c
>>>> +++ b/hw/ssi/imx_spi.c
>>>> @@ -322,6 +322,21 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>      DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx_spi_reg_name(index),
>>>>              (uint32_t)value);
>>>>
>>>> +    if (!imx_spi_is_enabled(s)) {
>>>> +        /* Block is disabled */
>>>> +        if (index != ECSPI_CONREG) {
>>>> +            /* Ignore access */
>>>> +            return;
>>>> +        }
>>>> +        s->regs[ECSPI_CONREG] = value;
>>
>>                                    [*]
>>
>>>> +        if (!(value & ECSPI_CONREG_EN)) {
>>>> +            /* Keep disabled */
>>>
>>> So other bits except ECSPI_CONREG_EN are discarded? The manual does
>>> not explicitly mention this but this looks suspicious.
>>
>> See in [*], all bits from the register are updated. We simply check
>> ECSPI_CONREG_EN to see if we need to go out of reset.
> 
> Oops, I missed the [*] line. Now I have read this carefully, and found
> there is one problem:
> 
> Now with the new logic the device reset activity has been postponed
> until next time a device register is written. This is wrong.

Yes, I just realized that in the imx_spi_read() function.

> 
>>
>> See:
>>
>> 21.5 Initialization
>>
>>   This section provides initialization information for ECSPI.
>>
>>   To initialize the block:
>>
>>   1. Clear the EN bit in ECSPI_CONREG to reset the block.
>>   2. Enable the clocks for ECSPI.
>>   3. Set the EN bit in ECSPI_CONREG to put ECSPI out of reset.
>>   4. Configure corresponding IOMUX for ECSPI external signals.
>>   5 Configure registers of ECSPI properly according to the
>>     specifications of the external SPI device.
>>
>> And ECSPI_CONREG_EN bit description:
>>
>>   SPI Block Enable Control. This bit enables the ECSPI. This bit
>>   must be set before writing to other registers or initiating an
>>   exchange. Writing zero to this bit disables the block and resets
>>   the internal logic with the exception of the ECSPI_CONREG. The
>>   block's internal clocks are gated off whenever the block is
>>   disabled.
>>
>>
>> I simply wanted to help you. I don't want to delay your work, so
>> if you think my approach is incorrect, suggest Peter to queue your
>> v5 or resend it (once riscv-next is merged) as v8.
> 
> Thank you for the help. I mentioned in an earlier thread before, that
> my view was not to fix it until it's broken as the v5 series can
> satisfy my work. But since you pointed out various spec violation
> stuff related to device reset, I do think your findings make sense. So
> let's improve this model together. :)

I'm not mad, just I'm doing too many things and I should rather review
your ssi-sd series. I don't have the physical hardware (neither know the
firmware using it) so it is a bit dumb of me to code blindly with no
possibility of testing. If you think this series is going the good way,
it would be great if you can give it another try, and I will be happy
to review.

Regards,

Phil.

