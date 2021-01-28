Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A49307826
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 15:34:41 +0100 (CET)
Received: from localhost ([::1]:59222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58Nc-0002lC-U8
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 09:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58LU-0001TF-FH; Thu, 28 Jan 2021 09:32:30 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58LL-00048W-Ij; Thu, 28 Jan 2021 09:32:22 -0500
Received: by mail-ej1-x62a.google.com with SMTP id gx5so8056518ejb.7;
 Thu, 28 Jan 2021 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6DRo2VevtgZRCIOMvLkYVjMIfduDRPEFsCZj4TkdEHQ=;
 b=u1AO+jXQpl88AAm8tIxnUUhNsmJin8hGfSeH8pDp7C+Bi78tQuXdo8mIJq6FsjLLIm
 UauQNV0D3P8BXgR3sbIfdMWMZag0tdBTv/i6KWfcegcSLCPx3RT0cgsVY/fPGJ8My057
 jsFpyJ/eC4vQLdbbC3UsJmZy/L0jBgF365rM67X9g1Z/XHo+Xi+0mN+cTEGIH7be1wIA
 B+kVB3hsbkmOFh5iA6CbIbD2Y/K/qzx8G4VSsLzx+M3K9UTOcdESKg6QHSIyug9xJMaK
 c6onmf0yPmZHvG8gKzIxIAXi+cv6RwKTsZN9z0jk83A9l+sCekXoKMl+qicCm7cinipj
 +JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6DRo2VevtgZRCIOMvLkYVjMIfduDRPEFsCZj4TkdEHQ=;
 b=j67FASvI6ziLqCQhzqEh48B+zD5AwPAEPmqSrxfXvKdzc0JHSh21dyQ3XV/kYrqpPu
 p0CSHURiFAvR1TKN6nojBoqW8W+go4aRQ72P6eH7lnickGeJQZ5AWh+PQ85qnoBc9l3Y
 oBgcFZ1QMGrPrgcTxIJ8CYQU4Gf/vcO4IHPvt3i1C4PTJuL1NRWmT7QGWbhfpJYZ30oO
 0GosC6OSEbeviDcUyw0dyZRqF/jQ0jYTiMpEF9aXpkibUu52VoUcBKTfm5bpcOqgMV3/
 o3MX7W2d4UJeT8k/vnLYtEwPzNy9+GlAp4oxtvTXXMPR2sfLxJGC4bxco381LY8EnLOQ
 M04g==
X-Gm-Message-State: AOAM532dhS6lMuZ05azB21cdbEBADNkrXsOCakERSRZIojF3j2GLUF7i
 XJfUkkwVenjwwfbBAW/PsQc=
X-Google-Smtp-Source: ABdhPJwRevZdeH84vTH50ZU8UAuiznFXZQAPSuidsG3QUX/j/c1RUtzyqJP8cNJfAnL3PIhIVSKN2Q==
X-Received: by 2002:a17:906:49c2:: with SMTP id
 w2mr10883323ejv.12.1611844337423; 
 Thu, 28 Jan 2021 06:32:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g25sm2337439ejf.15.2021.01.28.06.32.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:32:16 -0800 (PST)
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
 <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
Date: Thu, 28 Jan 2021 15:32:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 3:22 PM, Peter Maydell wrote:
> On Thu, 28 Jan 2021 at 14:18, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 1/28/21 2:54 PM, Peter Maydell wrote:
>>> On Thu, 28 Jan 2021 at 13:47, Bin Meng <bmeng.cn@gmail.com> wrote:
>>>>
>>>> On Thu, Jan 28, 2021 at 9:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> This retains the CONREG register value for both:
>>>>>  * 'soft' reset caused by write to device register to disable
>>>>>    the block
>>>>>    -- this is corrcet as per the datasheet quote
>>>>>  * 'power on' reset via TYPE_DEVICE's reset method
>>>>>    -- but in this case we should reset CONREG, because the Device
>>>>>    reset method is like a complete device powercycle and should
>>>>>    return the device state to what it was when QEMU was first
>>>>>    started.
>>>>
>>>> The POR value of CONREG is zero, which should be the default value, no?
>>>
>>> But you're not setting it to zero here, you're leaving it with
>>> whatever value it had before. (That's correct for soft reset,
>>> but wrong for power-on.)
>>
>> zero value on power-on is what I tried to describe as
>> "It is initialized to zero when the instance is created."
> 
> Yes, but QOM device reset does not happen just once at startup and
> not thereafter. Consider:
> 
>  * user starts QEMU
>  * QOM devices are created and realized
>  * QOM device reset happens
>      -- CONREG is zero here because QOM structs are zero-initialized
>  * guest runs
>  * guest modifies CONREG from its initial value
>  * system reset is requested (perhaps by user, perhaps by
>    guest writing some register or another)
>  * QOM device reset happens
>      -- CONREG is not zero here, so reset must clear it

Oh I totally missed that :S

Bin, I'd correct this as:

- extract imx_spi_soft_reset(IMXSPIState *s) from imx_spi_reset()
- zero-initialize CONREG in imx_spi_reset().

static void imx_spi_soft_reset(IMXSPIState *s)
{
 ...
}

static void imx_spi_reset(DeviceState *dev)
{
    IMXSPIState *s = IMX_SPI(dev);

    s->regs[ECSPI_CONREG] = 0;
    imx_spi_soft_reset(s);
}

What do you think?

Phil.

