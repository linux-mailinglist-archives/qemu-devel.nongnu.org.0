Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C5400DC8
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 04:09:52 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMhbU-00086u-2p
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 22:09:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMhZy-0007D8-DS; Sat, 04 Sep 2021 22:08:18 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mMhZw-0008QJ-NV; Sat, 04 Sep 2021 22:08:18 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so4096075otf.6; 
 Sat, 04 Sep 2021 19:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=So1YCLEmOvB5x9/EVSVNUOSaGHzfynrFZe9dXhRrKCc=;
 b=XS8bGcG+21bGTyTZhJub7DBBCInF2kA5xW/bPfthTpetpSurAxIWQU8XFffe3shqdb
 qPCbFl1fyK6KQ+Ql6jlYPGrP7Ur0PUa1hDQV/CI1vTUP8wItxd1rKzp9QhDRuL1/b/jK
 nqGYdJ8WwggsBP5Ni7BEGYZ1Y7FUnuRR/9wGT1wxdubEpwMh2URzj1SRgj8xhuMhy6Nm
 phAF1vcLJNzl51+OP+29ub9aA8kJa/cT+lNBvF1brDSLBv2rfa5OahP3blmbW6/fKyaa
 TTf35YUxgoE7aq9ox6gxhHvpqF3ne3752KnzzKQt1v6CTqkD3z8kajHm/Z8khksTcIwY
 M6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=So1YCLEmOvB5x9/EVSVNUOSaGHzfynrFZe9dXhRrKCc=;
 b=GesrhD5P1fe4B0RTFYwZFYsVLxA9MpLZfTubt+CcZ+ZL45Yz5INtGpan7dAOp6diNL
 nYUuwTsL6dPGXve2cGaZvq0OZ16xf10c4igYRlGcLTP7vE4r7ANGjKerBW3ntFwuPBgC
 FT/FX1NLHXknqUD+zF339csah+twcWrOhhqZeyYnOqVbUdbbnUr6w1MwE/WcHRQOdwmQ
 ZV804nRRVt36yDr4A2VhtSAUBQ5TT8jkAZx2uT+AzJLkuiTNk2lcopbSQRiPstCDNu9G
 BYW3WKWgCyIrrPM7S5lZliRcmnvj9eg1PR3IBrSkmp5lLw0urKNG/ZGlmfbAVVr0bbQL
 Mkhw==
X-Gm-Message-State: AOAM533iCOv7QgqYWZ0Qj6Or1eIURTka5F0EuhPFeKGiVcE5DY7rC7/N
 38qcrH600yTdgUisuYe9jeAx4buD+8o=
X-Google-Smtp-Source: ABdhPJy2TAJ/1YO+LSIkkaYo4JfhmRSOuI+Z/YEPEqywlq/lJTVyFdDydVDVoa7bfP7lzL1n2aNZGA==
X-Received: by 2002:a05:6830:1d8c:: with SMTP id
 y12mr5741638oti.362.1630807695150; 
 Sat, 04 Sep 2021 19:08:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q13sm886415ota.17.2021.09.04.19.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 19:08:14 -0700 (PDT)
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
 <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e08467c0-bd69-81d3-93d3-13b8fc812453@roeck-us.net>
Date: Sat, 4 Sep 2021 19:08:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/4/21 4:19 PM, Philippe Mathieu-Daudé wrote:
> On 9/5/21 1:06 AM, Bin Meng wrote:
>> On Sun, Sep 5, 2021 at 1:13 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 9/2/21 12:29 PM, Peter Maydell wrote:
>>>> On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On 9/2/21 8:58 AM, Peter Maydell wrote:
>>>>>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>>
>>>>>>> The control register does not really have a means to deselect
>>>>>>> all chip selects directly. As result, CS is effectively never
>>>>>>> deselected, and connected flash chips fail to perform read
>>>>>>> operations since they don't get the expected chip select signals
>>>>>>> to reset their state machine.
>>>>>>>
>>>>>>> Normally and per controller documentation one would assume that
>>>>>>> chip select should be set whenever a transfer starts (XCH is
>>>>>>> set or the tx fifo is written into), and that it should be disabled
>>>>>>> whenever a transfer is complete. However, that does not work in
>>>>>>> practice: attempts to implement this approach resulted in failures,
>>>>>>> presumably because a single transaction can be split into multiple
>>>>>>> transfers.
>>>>>>>
>>>>>>> At the same time, there is no explicit signal from the host indicating
>>>>>>> if chip select should be active or not. In the absence of such a direct
>>>>>>> signal, use the burst length written into the control register to
>>>>>>> determine if an access is ongoing or not. Disable all chip selects
>>>>>>> if the burst length field in the configuration register is set to 0,
>>>>>>> and (re-)enable chip select if a transfer is started. This is possible
>>>>>>> because the Linux driver clears the burst length field whenever it
>>>>>>> prepares the controller for the next transfer.
>>>>>>> This solution  is less than perfect since it effectively only disables
>>>>>>> chip select when initiating the next transfer, but it does work with
>>>>>>> Linux and should otherwise do no harm.
>>>>>>>
>>>>>>> Stop complaining if the burst length field is set to a value of 0,
>>>>>>> since that is done by Linux for every transfer.
>>>>>>>
>>>>>>> With this patch, a command line parameter such as "-drive
>>>>>>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
>>>>>>> flash chip in the sabrelite emulation. Without this patch, the
>>>>>>> flash instantiates, but it only reads zeroes.
>>>>>>>
>>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>>> ---
>>>>>>> I am not entirely happy with this solution, but it is the best I was
>>>>>>> able to come up with. If anyone has a better idea, I'll be happy
>>>>>>> to give it a try.
>>>>>>>
>>>>>>>     hw/ssi/imx_spi.c | 17 +++++++----------
>>>>>>>     1 file changed, 7 insertions(+), 10 deletions(-)
>>>>>>>
>>>>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>>>>> index 189423bb3a..7a093156bd 100644
>>>>>>> --- a/hw/ssi/imx_spi.c
>>>>>>> +++ b/hw/ssi/imx_spi.c
>>>>>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>>>>>>         DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>>>>>>>                 fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>>>>>>>
>>>>>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
>>>>>>> +
>>>>>>>         while (!fifo32_is_empty(&s->tx_fifo)) {
>>>>>>>             int tx_burst = 0;
>>>>>>>
>>>>>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>>>>         case ECSPI_CONREG:
>>>>>>>             s->regs[ECSPI_CONREG] = value;
>>>>>>>
>>>>>>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
>>>>>>> -        if (burst % 8) {
>>>>>>> -            qemu_log_mask(LOG_UNIMP,
>>>>>>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
>>>>>>> -                          TYPE_IMX_SPI, __func__, burst);
>>>>>>> -        }
>>>>>>
>>>>>> Why has this log message been removed ?
>>>>>
>>>>> What I wanted to do is:
>>>>>
>>>>> "Stop complaining if the burst length field is set to a value of 0,
>>>>>     since that is done by Linux for every transfer."
>>>>>
>>>>> What I did instead is to remove the message entirely.
>>>>>
>>>>> How about the rest of the patch ? Is it worth a resend with the message
>>>>> restored (except for burst size == 0), or is it not acceptable anyway ?
>>>>
>>>> I did the easy bit of the code review because answering this
>>>> question is probably a multiple-hour job...this is still on my
>>>> todo list, but I'm hoping somebody who understands the MIX
>>>> SPI device gets to it first.
>>>>
>>>
>>> Makes sense. Of course, it would be even better if someone can explain
>>> how this works on real hardware.
>>>
>>
>> I happened to notice this patch today. Better to cc people who once
>> worked on this part from "git blame" or "git log".
> 
> Even better if you add yourself as designated reviewer ;)
> 
> $ ./scripts/get_maintainer.pl -f hw/ssi/imx_spi.c
> Alistair Francis <alistair@alistair23.me> (maintainer:SSI)
> Peter Maydell <peter.maydell@linaro.org> (odd fixer:i.MX31 (kzm))
> Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)
> 
>>
>>> In this context, it would be useful to know if real SPI flash chips
>>> reset their state to idle under some conditions which are not covered
>>> by the current code in hw/block/m25p80.c. Maybe the real problem is
>>> as simple as that code setting data_read_loop when it should not,
>>> or that it doesn't reset that flag when it should (unless I am missing
>>> something, the flag is currently only reset by disabling chip select).
> 
> Plausible hypothesis.
> 

Possibly. Note that I did check the flash chip specification, but I don't
see a notable difference to the qemu implementation. But then, again,
I may be missing something.

Guenter

