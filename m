Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066563078F9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:03:33 +0100 (CET)
Received: from localhost ([::1]:42004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l58pX-0007WP-PS
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:03:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58bm-00034A-V8; Thu, 28 Jan 2021 09:49:18 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l58bl-0001SK-Dv; Thu, 28 Jan 2021 09:49:18 -0500
Received: by mail-ej1-x634.google.com with SMTP id rv9so8111155ejb.13;
 Thu, 28 Jan 2021 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SrxEts2129qGoww/QhPzpYQOwcyVGTBmHuwr9Mjv48Q=;
 b=gZ+YvYAAQXX9d3o8EkpbLirUtyXs5CK1a+cqnOS1aJblByH+EalpxECPCi0COi6fpz
 ByHMMrfEpQKHIE3+bLfYO1zyTg9z3yg/TRdsQniH9op1+93bY1KwRiG7P2cmfBT0eRpe
 kLcMP7aXb6pGcu/hr7A8UNXkRC6Ijss5ievJurOID/8i+PT/hxWX/qHsH9d2c6lDqwgd
 8cMhwDvXfoQ2Qp3bMbhYUrhZiReuGHBdVon0+RQciNxZX311WqmjXdOGVVVGQS6hJ4yU
 zwg6c0b/uCt7TVmLnPSUoOrIANkO/h23FG++IiTidEKX3GQYlN+J/hVDN+fHD5Jc78hk
 ou7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SrxEts2129qGoww/QhPzpYQOwcyVGTBmHuwr9Mjv48Q=;
 b=kx/IL8cubM9EBZV5MOfbseVK9nha5XYrmgM7d5kz3v+i0eucDoeaFj53RTFgCFun/m
 s8f50QukMvPEKxbtE0FKRMG7WksAEN76Lze1WCac9Y1oUyR5MltW4b+nj2UGv3Ie+WOB
 X+SpDV9mhNqt8UhX886wbIckbn1NZDrcqgu9QsOQnGpVYp2bjTTtIjF7CPlV3LOpsPr1
 FIc+uR4GLMe+uFaBRdHecOLmAnkUgCUwMJZH8F5DfJ0HtJD+MN9Geqd23eav3GEOR+ZR
 0YR75a3X0XJbQqpP8kGtaAzCWt0BGXuHRwZ3Hlz1V2tTkUG3XnW7U9/dFgC7vPzFm/h/
 UljQ==
X-Gm-Message-State: AOAM532ZqSLDvhzrrWezDHaET2F+t4zqqX0d4Xhj+WsLdfl9/tm9ioLi
 tk3hPuk5BEmcOE3M5QdoeB8=
X-Google-Smtp-Source: ABdhPJx+jNqv36fcneXCzyM18W8iEt9Pld6oncP6nc8iLr9IE8dTjtOqB9h2RprWQMFapm0YGbn+eg==
X-Received: by 2002:a17:906:f755:: with SMTP id
 jp21mr11374119ejb.22.1611845355327; 
 Thu, 28 Jan 2021 06:49:15 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id n2sm2522628ejl.1.2021.01.28.06.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:49:14 -0800 (PST)
Subject: Re: [PATCH v8 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Peter Maydell <peter.maydell@linaro.org>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-5-git-send-email-bmeng.cn@gmail.com>
 <CAFEAcA-SG1nJ3g1dDSvZ99Wgduz+Wd0p483keCvd-oQNb0DO0A@mail.gmail.com>
 <CAEUhbmVTPnPBO-8qY1UoZ_4HR4d-GcMLcwCf-Hm20rhD9pSi5w@mail.gmail.com>
 <CAFEAcA_cE=fHmegAjs0Sefk4p1Fhi34ohjFcuxYFQUviBtRszQ@mail.gmail.com>
 <34c45d74-adec-2734-830b-612b5e2f6083@amsat.org>
 <CAFEAcA8=t6pxsvSt3FrPbAPXKT6y4t4hqjU8CXfbsw=RbbXK_w@mail.gmail.com>
 <9a8312d7-d3b3-b896-a669-8ce8efc66bf0@amsat.org>
 <CAFEAcA9LbKUZPhDfqQjHGfF9s-Se2drWYmKkn6pHY3gQit=BcA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26b80ae5-f1e0-f438-a1e5-9922686be128@amsat.org>
Date: Thu, 28 Jan 2021 15:49:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9LbKUZPhDfqQjHGfF9s-Se2drWYmKkn6pHY3gQit=BcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/21 3:41 PM, Peter Maydell wrote:
> On Thu, 28 Jan 2021 at 14:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Oh I totally missed that :S
>>
>> Bin, I'd correct this as:
>>
>> - extract imx_spi_soft_reset(IMXSPIState *s) from imx_spi_reset()
>> - zero-initialize CONREG in imx_spi_reset().
>>
>> static void imx_spi_soft_reset(IMXSPIState *s)
>> {
>>  ...
>> }
>>
>> static void imx_spi_reset(DeviceState *dev)
>> {
>>     IMXSPIState *s = IMX_SPI(dev);
>>
>>     s->regs[ECSPI_CONREG] = 0;
>>     imx_spi_soft_reset(s);
>> }
>>
>> What do you think?
> 
> That doesn't give you anywhere to put the imx_spi_update_irq()
> call, which must happen only on soft reset and not on DeviceState
> reset. You could do one of:
>  * have a 'common reset' function that does most of this,
>    plus an imx_spi_reset which clears CONREG and calls
>    common reset and an imx_spi_soft_reset which calls
>    common reset and imx_spi_update_irq()
>  * have imx_spi_soft_reset save the old CONREG in a local
>    variable before calling imx_spi_reset and then restore it
>    to s->regs

Long term maintenance I'd prefer the 'common reset' approach
(but this is probably subjective to my view on the hardware,
since this is software, the 2nd approach is also valid but
harder to represent thinking of hardware).

Bin, can you send a v9? (using the approach you prefer)

Thanks,

Phil.

