Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7C53077EC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:24:11 +0100 (CET)
Received: from localhost ([::1]:42622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58DS-0003rG-Mr
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:24:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l587Z-0006qn-6N; Thu, 28 Jan 2021 09:18:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l587X-0007C0-JG; Thu, 28 Jan 2021 09:18:04 -0500
Received: by mail-ej1-x62e.google.com with SMTP id bl23so8004981ejb.5;
 Thu, 28 Jan 2021 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RjERuanCbSHtMiaBdfhlXB6ezh/LXStNyUZKsPthKw0=;
 b=MHPHAw97C/wXQLERQbwwGr2ffxk/1PCbjDSw38tPW5NLsa1mhgCw0koI+UlBqvXqFH
 1mvubmeddoDFsYd91IlDxktu05n8SJIA/w2UP4Nfghj+AO6X60b7ZhqGaQhtgjaQzMA2
 YcwKZHtYCzIbGag2hXAl79T4wTKvxTOqqbX32oEZ1V6BvrPD8p7vkWLvOSiCWWcbGApo
 mq9tvp0UfanepVk99i/nvBZphxCRxSGwAW2gwsK86TiyA+dn2tta97heWjiNIj/y8JPe
 pj3D2p/LltfUQ+2LM++9gUA8Zqqu35qzlQuf1TFXzyQkR8D4gvX1ix1MEbiDMp8pS6mF
 h9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RjERuanCbSHtMiaBdfhlXB6ezh/LXStNyUZKsPthKw0=;
 b=OXQaCity2Dl7clz0Bm4/KTrJDA4Jsg+jpP/rhhuDBmQbk0GO30K82MqEOzS2iBpK5B
 0YrnejRkMayQKoYVUnH2DrFPhhyCgCcICUwv/bMY6miz6Cel69QhRGpNOEL0iYp1G2W/
 i+7hPKzrboql0lm/5mkdyUqfCW0zD2aS8/xemM4PuEXFQBTBIer7seIUdcYOdkZ+ibWg
 sgY+A6v39W1csSLSYV/gngEI/jqn9pdBc8SrxyQKI9RAoSfwC5RUKbEl8Ecw/BxuAWH5
 tt2ihTRZ2Tq40GJBW/3a+Pl9XiU1bBR48GxG7I6uR+9+2aaFEgx8J/YErMdY2iV7+7o/
 dlIQ==
X-Gm-Message-State: AOAM533iY1iY3sC0x7OzV697SbiH8S9aRRL0q/nux1G2xSkx2QoIxkBs
 vHpfyLFeKxX8zze/m2BkE78=
X-Google-Smtp-Source: ABdhPJzhGqEClocasHd1673LqnCpTy7hQl95kXBHEaqn/uofz9vIlpDKu8/LtCHKvxOFOjfq6yZCEQ==
X-Received: by 2002:a17:906:f1d6:: with SMTP id
 gx22mr11387945ejb.348.1611843481800; 
 Thu, 28 Jan 2021 06:18:01 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n20sm3083755edr.89.2021.01.28.06.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:18:01 -0800 (PST)
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
Date: Thu, 28 Jan 2021 15:17:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 2:54 PM, Peter Maydell wrote:
> On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>
>>>> When the block is disabled, all registers are reset with the
>>>> exception of the ECSPI_CONREG. It is initialized to zero
>>>> when the instance is created.
>>>>
>>>> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>>>>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>>>
>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>> index 8fb3c9b..c952a3d 100644
>>>> --- a/hw/ssi/imx_spi.c
>>>> +++ b/hw/ssi/imx_spi.c
>>>> @@ -231,12 +231,23 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>>>  static void imx_spi_reset(DeviceState *dev)
>>>>  {
>>>>      IMXSPIState *s = IMX_SPI(dev);
>>>> +    int i;
>>>>
>>>>      DPRINTF("\n");
>>>>
>>>> -    memset(s->regs, 0, sizeof(s->regs));
>>>> -
>>>> -    s->regs[ECSPI_STATREG] = 0x00000003;
>>>> +    for (i = 0; i < ARRAY_SIZE(s->regs); i++) {
>>>> +        switch (i) {
>>>> +        case ECSPI_CONREG:
>>>> +            /* CONREG is not updated on reset */
>>>> +            break;
>>>> +        case ECSPI_STATREG:
>>>> +            s->regs[i] = 0x00000003;
>>>> +            break;
>>>> +        default:
>>>> +            s->regs[i] = 0;
>>>> +            break;
>>>> +        }
>>>> +    }
>>>
>>> This retains the CONREG register value for both:
>>>  * 'soft' reset caused by write to device register to disable
>>>    the block
>>>    -- this is corrcet as per the datasheet quote
>>>  * 'power on' reset via TYPE_DEVICE's reset method
>>>    -- but in this case we should reset CONREG, because the Device
>>>    reset method is like a complete device powercycle and should
>>>    return the device state to what it was when QEMU was first
>>>    started.
>>
>> The POR value of CONREG is zero, which should be the default value, no?
> 
> But you're not setting it to zero here, you're leaving it with
> whatever value it had before. (That's correct for soft reset,
> but wrong for power-on.)

zero value on power-on is what I tried to describe as
"It is initialized to zero when the instance is created."

Most of the codebase assumes QOM provides a zero-initialized
instance state. Do you think it should be explicit?

Regards,

Phil.

