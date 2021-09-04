Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A489400D83
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 01:21:04 +0200 (CEST)
Received: from localhost ([::1]:57534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMey7-0008Km-5L
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 19:21:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMewE-0007KG-NN; Sat, 04 Sep 2021 19:19:06 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMewC-0007xD-MT; Sat, 04 Sep 2021 19:19:06 -0400
Received: by mail-wr1-x429.google.com with SMTP id q14so4001496wrp.3;
 Sat, 04 Sep 2021 16:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8wMxiQoHn4ehUrvgm5Kkh8sm/Pfpy7iIFY/tgRVb0vk=;
 b=CQqL83kKXrVBVaJn4rTUsbIZ5SaZpyzKlRbjsi+tP74k8NJRxJ/LuJ1Ul2RcqKz5ro
 KkecadYl0LyGTpsZBtt6ouw9/dZgccANpKAVLwYF392Z+RMPgoQr601KxOMTNOT4KHce
 nvMY6qEsV1TBatg5OYGV3xCfl42EuoXSlZ3SaG6XASJKHVMh3ler4E3KymYQ1cWhR18D
 /0w2P0efU9iQ1yxkacVQHqu+aB6ln9ZIYV8ynlHfBzh0zCoUwvE0NMunrL9tf7iCsjBx
 gBnHWoadCQqfAUnV2VB81XAcb4ZGGIsDKDPyQV0F9wpj16nPaHL+tiscuNWZrt2D6pV/
 RDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8wMxiQoHn4ehUrvgm5Kkh8sm/Pfpy7iIFY/tgRVb0vk=;
 b=G95xPvWod57HM1UhUx+NyGhBaYU2mL5rbI6X0aC3GLpC5ALQn2uzDeJxZS5Ge0IraH
 gTy1A8Aw48Dwgh/Z509Vc9u75iVCkSUje+7531n0huQKRTEjWPrgNmbxuDBn7BF0+p+9
 JdvL0Fmf27YWlQQ9GTtyv993q3qmFzMEzV2lrRu6Vjcp+sAsDiUqwuCW0qBZq0HeyrNK
 FwvnrlAaRAgdz3gGzE4rwHlz6BL6Yqnf1kLS8KNaHxozO8mIJFvyKK0drb9jCoj/xOsu
 UyoOR2yAG2aE3nMrja2BDE1x/LWmOKAaOZFW+/aufiKjprG1lp+WsZiR/PxPuVKICYwj
 QHHA==
X-Gm-Message-State: AOAM530uKOI3wWRyMNNhASNvPOM7wESvrYJDBiYfPKaGZ0g/O44GmdL1
 5Al3AIow4b/jEfWaeKPaz8Q=
X-Google-Smtp-Source: ABdhPJy8MS/vlyc9hX08pZcU/1bkb13XymAWYk3J7ggjv8y8jp0z/HAfNb4pUss5R3PtHky2pz1Khw==
X-Received: by 2002:adf:816f:: with SMTP id 102mr5684478wrm.368.1630797542712; 
 Sat, 04 Sep 2021 16:19:02 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id y11sm3963535wru.0.2021.09.04.16.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 16:19:01 -0700 (PDT)
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Bin Meng <bmeng.cn@gmail.com>, Guenter Roeck <linux@roeck-us.net>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
 <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
 <CAFEAcA_cAp6kWTE6Lpx6QF1zfTYfQXiOPgdfkztS3iuJkRB0xQ@mail.gmail.com>
 <b5e43e87-c1bd-3265-298e-346413a22a82@roeck-us.net>
 <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c49b65a2-fa3e-c180-5fdf-a0a64cb91a32@amsat.org>
Date: Sun, 5 Sep 2021 01:19:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWN1=j=hPntg1j6aOv-AZNDm1UrDFB364Qqf0SAccyJew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.832,
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

On 9/5/21 1:06 AM, Bin Meng wrote:
> On Sun, Sep 5, 2021 at 1:13 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 9/2/21 12:29 PM, Peter Maydell wrote:
>>> On Thu, 2 Sept 2021 at 17:09, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>
>>>> On 9/2/21 8:58 AM, Peter Maydell wrote:
>>>>> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>>
>>>>>> The control register does not really have a means to deselect
>>>>>> all chip selects directly. As result, CS is effectively never
>>>>>> deselected, and connected flash chips fail to perform read
>>>>>> operations since they don't get the expected chip select signals
>>>>>> to reset their state machine.
>>>>>>
>>>>>> Normally and per controller documentation one would assume that
>>>>>> chip select should be set whenever a transfer starts (XCH is
>>>>>> set or the tx fifo is written into), and that it should be disabled
>>>>>> whenever a transfer is complete. However, that does not work in
>>>>>> practice: attempts to implement this approach resulted in failures,
>>>>>> presumably because a single transaction can be split into multiple
>>>>>> transfers.
>>>>>>
>>>>>> At the same time, there is no explicit signal from the host indicating
>>>>>> if chip select should be active or not. In the absence of such a direct
>>>>>> signal, use the burst length written into the control register to
>>>>>> determine if an access is ongoing or not. Disable all chip selects
>>>>>> if the burst length field in the configuration register is set to 0,
>>>>>> and (re-)enable chip select if a transfer is started. This is possible
>>>>>> because the Linux driver clears the burst length field whenever it
>>>>>> prepares the controller for the next transfer.
>>>>>> This solution  is less than perfect since it effectively only disables
>>>>>> chip select when initiating the next transfer, but it does work with
>>>>>> Linux and should otherwise do no harm.
>>>>>>
>>>>>> Stop complaining if the burst length field is set to a value of 0,
>>>>>> since that is done by Linux for every transfer.
>>>>>>
>>>>>> With this patch, a command line parameter such as "-drive
>>>>>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
>>>>>> flash chip in the sabrelite emulation. Without this patch, the
>>>>>> flash instantiates, but it only reads zeroes.
>>>>>>
>>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>>>> ---
>>>>>> I am not entirely happy with this solution, but it is the best I was
>>>>>> able to come up with. If anyone has a better idea, I'll be happy
>>>>>> to give it a try.
>>>>>>
>>>>>>    hw/ssi/imx_spi.c | 17 +++++++----------
>>>>>>    1 file changed, 7 insertions(+), 10 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>>>>>> index 189423bb3a..7a093156bd 100644
>>>>>> --- a/hw/ssi/imx_spi.c
>>>>>> +++ b/hw/ssi/imx_spi.c
>>>>>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>>>>>        DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>>>>>>                fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>>>>>>
>>>>>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
>>>>>> +
>>>>>>        while (!fifo32_is_empty(&s->tx_fifo)) {
>>>>>>            int tx_burst = 0;
>>>>>>
>>>>>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>>>>>        case ECSPI_CONREG:
>>>>>>            s->regs[ECSPI_CONREG] = value;
>>>>>>
>>>>>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
>>>>>> -        if (burst % 8) {
>>>>>> -            qemu_log_mask(LOG_UNIMP,
>>>>>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
>>>>>> -                          TYPE_IMX_SPI, __func__, burst);
>>>>>> -        }
>>>>>
>>>>> Why has this log message been removed ?
>>>>
>>>> What I wanted to do is:
>>>>
>>>> "Stop complaining if the burst length field is set to a value of 0,
>>>>    since that is done by Linux for every transfer."
>>>>
>>>> What I did instead is to remove the message entirely.
>>>>
>>>> How about the rest of the patch ? Is it worth a resend with the message
>>>> restored (except for burst size == 0), or is it not acceptable anyway ?
>>>
>>> I did the easy bit of the code review because answering this
>>> question is probably a multiple-hour job...this is still on my
>>> todo list, but I'm hoping somebody who understands the MIX
>>> SPI device gets to it first.
>>>
>>
>> Makes sense. Of course, it would be even better if someone can explain
>> how this works on real hardware.
>>
> 
> I happened to notice this patch today. Better to cc people who once
> worked on this part from "git blame" or "git log".

Even better if you add yourself as designated reviewer ;)

$ ./scripts/get_maintainer.pl -f hw/ssi/imx_spi.c
Alistair Francis <alistair@alistair23.me> (maintainer:SSI)
Peter Maydell <peter.maydell@linaro.org> (odd fixer:i.MX31 (kzm))
Jean-Christophe Dubois <jcd@tribudubois.net> (reviewer:SABRELITE / i.MX6)

> 
>> In this context, it would be useful to know if real SPI flash chips
>> reset their state to idle under some conditions which are not covered
>> by the current code in hw/block/m25p80.c. Maybe the real problem is
>> as simple as that code setting data_read_loop when it should not,
>> or that it doesn't reset that flag when it should (unless I am missing
>> something, the flag is currently only reset by disabling chip select).

Plausible hypothesis.

> One quick question, did you test this on the latest QEMU? Is that
> Linux used for testing? There have been a number of bug fixes in
> imx_spi recently.

Coming from Guenter I'm almost sure the answer is "yes" to both questions.

I suppose you meant these changes?

$ git log --oneline 1da79ecc7a2..8c495d13792
8c495d13792 hw/ssi: imx_spi: Correct tx and rx fifo endianness
6ed924823c8 hw/ssi: imx_spi: Correct the burst length > 32 bit transfer
logic
24bf8ef3f53 hw/ssi: imx_spi: Round up the burst length to be multiple of 8
50dc25932eb hw/ssi: imx_spi: Disable chip selects when controller is
disabled
fb116b5456c hw/ssi: imx_spi: Rework imx_spi_write() to handle block disabled
7c87bb5333f hw/ssi: imx_spi: Rework imx_spi_read() to handle block disabled
93722b6f6a6 hw/ssi: imx_spi: Rework imx_spi_reset() to keep CONREG
register value
9c431a43a62 hw/ssi: imx_spi: Remove pointless variable initialization
3c9829e5746 hw/ssi: imx_spi: Remove imx_spi_update_irq() in imx_spi_reset()

Regards,

Phil.

