Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 027483FF0E9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:14:39 +0200 (CEST)
Received: from localhost ([::1]:49020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpMM-0004nc-3n
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mLpHF-000886-6q; Thu, 02 Sep 2021 12:09:21 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1mLpHC-00033V-H7; Thu, 02 Sep 2021 12:09:20 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so3171709otf.2; 
 Thu, 02 Sep 2021 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VL+3LJFKjgxTJRGBbjVAI41TWq2pj4MCAtAdzBuX17U=;
 b=Qv0A0zDzRGZ/6KV5+fM93iFaRl7wgDn120ywb2lGAOH/X9byUqOfrzQML815xRB6Jb
 H60Odcr6gsrPsjhR26+gZw+qQd5D724IR3OpQUgaqJILevOzrTMzb2IION9tRsdhuGYN
 RI4Hr1uNzKxk9Y71Z5TzeFfpchyORV/kgzNz4Yl9KPvDwzqafmrenvCzmrLEnHnXpgDB
 z7wJiXwTQeTsVyavRC/nhmnMSyxMHa6EYWIJj0fbhz5eNUGZMnt9QS1FaqRPYMCaECmg
 O2/+zlkducFYKSHcPAr+pI4D1Rk8dVDcJZZfRKQxwNIDO2Mt5Z2+Xj5oy9mJ4YdPqpII
 Cjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VL+3LJFKjgxTJRGBbjVAI41TWq2pj4MCAtAdzBuX17U=;
 b=WO/Ph5OMeZVqCU4htrqyslInNhLRIFLM7NzBgK5SRUDsbKqagy2+NHGzKfl54C0mWE
 BSZoiNEkDO+IEXS+HJtPqDCJLXsQUZ5MR2ucR2pP6wM8R6tqMD/pp+6Bcy2myJZ3jjeA
 5Hh9JgWFQzMDz535InebjWqp0ay+fUdZTGnabKzWUQGMhDZZz93BwxMTObiVQLCQ1hTB
 oZiMZjC2Lr0hdFbLQCQrH+sFPJ1l44DfzlxG6332EwjsztuyhvtQHaRN99SZSIvGqEZa
 j59jHamXP+hrTB8PzZ9zfTi2/Z80QzI9XM1c60DcAHrm2R41oTGStHJqahdeUTOqdv3D
 Orgw==
X-Gm-Message-State: AOAM532XHy3hE5/HRE9PrGltLyDnB9SFpsBdzc/afcXGKFOSKsDME4Oc
 Fvh0wpEagd9s3/urG3W/4BhYRtRGfOQ=
X-Google-Smtp-Source: ABdhPJwUs7AAVAtDRBeYrFLo4Tfa/OAzVH0zvLkYuXi1NAsQkJyRQWTJcYMcGl2ZCQkOLNAYn1RW4A==
X-Received: by 2002:a9d:d35:: with SMTP id 50mr3225495oti.22.1630598955631;
 Thu, 02 Sep 2021 09:09:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b24sm448637oic.33.2021.09.02.09.09.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 09:09:14 -0700 (PDT)
Subject: Re: [PATCH] hw/ssi: imx_spi: Improve chip select handling
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210808013406.223506-1-linux@roeck-us.net>
 <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a34c10d4-fc90-0186-3214-c3c5e77b4eea@roeck-us.net>
Date: Thu, 2 Sep 2021 09:09:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8+o69ztRaaMvqh+zNaFs_6reSHX_ijknay6_0VePSE2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=groeck7@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.225,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 8:58 AM, Peter Maydell wrote:
> On Sun, 8 Aug 2021 at 02:34, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The control register does not really have a means to deselect
>> all chip selects directly. As result, CS is effectively never
>> deselected, and connected flash chips fail to perform read
>> operations since they don't get the expected chip select signals
>> to reset their state machine.
>>
>> Normally and per controller documentation one would assume that
>> chip select should be set whenever a transfer starts (XCH is
>> set or the tx fifo is written into), and that it should be disabled
>> whenever a transfer is complete. However, that does not work in
>> practice: attempts to implement this approach resulted in failures,
>> presumably because a single transaction can be split into multiple
>> transfers.
>>
>> At the same time, there is no explicit signal from the host indicating
>> if chip select should be active or not. In the absence of such a direct
>> signal, use the burst length written into the control register to
>> determine if an access is ongoing or not. Disable all chip selects
>> if the burst length field in the configuration register is set to 0,
>> and (re-)enable chip select if a transfer is started. This is possible
>> because the Linux driver clears the burst length field whenever it
>> prepares the controller for the next transfer.
>> This solution  is less than perfect since it effectively only disables
>> chip select when initiating the next transfer, but it does work with
>> Linux and should otherwise do no harm.
>>
>> Stop complaining if the burst length field is set to a value of 0,
>> since that is done by Linux for every transfer.
>>
>> With this patch, a command line parameter such as "-drive
>> file=flash.sabre,format=raw,if=mtd" can be used to instantiate the
>> flash chip in the sabrelite emulation. Without this patch, the
>> flash instantiates, but it only reads zeroes.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> I am not entirely happy with this solution, but it is the best I was
>> able to come up with. If anyone has a better idea, I'll be happy
>> to give it a try.
>>
>>   hw/ssi/imx_spi.c | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>> index 189423bb3a..7a093156bd 100644
>> --- a/hw/ssi/imx_spi.c
>> +++ b/hw/ssi/imx_spi.c
>> @@ -167,6 +167,8 @@ static void imx_spi_flush_txfifo(IMXSPIState *s)
>>       DPRINTF("Begin: TX Fifo Size = %d, RX Fifo Size = %d\n",
>>               fifo32_num_used(&s->tx_fifo), fifo32_num_used(&s->rx_fifo));
>>
>> +    qemu_set_irq(s->cs_lines[imx_spi_selected_channel(s)], 0);
>> +
>>       while (!fifo32_is_empty(&s->tx_fifo)) {
>>           int tx_burst = 0;
>>
>> @@ -385,13 +387,6 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
>>       case ECSPI_CONREG:
>>           s->regs[ECSPI_CONREG] = value;
>>
>> -        burst = EXTRACT(s->regs[ECSPI_CONREG], ECSPI_CONREG_BURST_LENGTH) + 1;
>> -        if (burst % 8) {
>> -            qemu_log_mask(LOG_UNIMP,
>> -                          "[%s]%s: burst length %d not supported: rounding up to next multiple of 8\n",
>> -                          TYPE_IMX_SPI, __func__, burst);
>> -        }
> 
> Why has this log message been removed ?

What I wanted to do is:

"Stop complaining if the burst length field is set to a value of 0,
  since that is done by Linux for every transfer."

What I did instead is to remove the message entirely.

How about the rest of the patch ? Is it worth a resend with the message
restored (except for burst size == 0), or is it not acceptable anyway ?

Thanks,
Guenter

> 
>>           if (!imx_spi_is_enabled(s)) {
>>               /* device is disabled, so this is a soft reset */
>>               imx_spi_soft_reset(s);
> 
> thanks
> -- PMM
> 


