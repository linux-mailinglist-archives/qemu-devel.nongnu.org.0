Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A173AA556
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:31:08 +0200 (CEST)
Received: from localhost ([::1]:46752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcBn-0003Du-G3
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltc9Z-0001wR-KC; Wed, 16 Jun 2021 16:28:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltc9X-0007j9-TH; Wed, 16 Jun 2021 16:28:49 -0400
Received: by mail-wr1-x429.google.com with SMTP id f2so4047372wri.11;
 Wed, 16 Jun 2021 13:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d5+mb0t1pnCjN9TgFIpxPVkq19ArR55/x4gs9zz9GFA=;
 b=jG4jzgoxpnOQAVmtt59yLB4idgQGe3MLmBJLNQQGLsH8qZ5ZJJFmYFjbgs0JeObWxL
 Uq+GrRRz2xxMZakGn4dM1/30Tqq6tPo/5QTKDoL5ZFi7frU2h5X/PMNocWEFTVD3mGAC
 SfjJtkK3XPWTKeHgNshqalLlFkT+MXY6v9IWwb8FW0idRHkBoiOr93PIU/pCSXAOKKci
 k58bueH/jVP81D488mmLTvCLNXfvD0M207bUkMDEmp6Sn4WhGSpgmM2cosw8roTQI7z+
 evzgjIYwZaYFjmajhAV1po7oBKeJTuKIlqaFgz5iscz8gMucBLuTAmrlzfSi+N8ekmYW
 91PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5+mb0t1pnCjN9TgFIpxPVkq19ArR55/x4gs9zz9GFA=;
 b=Yv25iz8QxwHDHWEjPsCYGk4hYA/lOzIJ7vf8AlL27O5kHBK+gPWwq2QkSjVbe/M+LY
 i8ZT5AarNthX+xhs1j0B+RjxhzYdNWzp+G7nZHulENJijupvwEkZKCPmwZGcmRC4qxd7
 4ixRyxu8NyBUmT2lavalyfe/xBZq132Zi/RpR3lQEsWov7piLKasl1p9aV1n5VKnIZHy
 aOqBHqgIg2TjBl0iXK2kIgkLBbSRcNR9K5Wl2kb67OU6YBTrnMYRHzWV1kK6FFsSjt9I
 C2ospvxG4rSZ3t8XTjobgj8d5Zo13EwU++emZDjfkUun3iraFoBVA9YxWPgNKVoRzc6b
 KlxA==
X-Gm-Message-State: AOAM531Fz/ILObJr514WZpdkM+HAAvXzrMZ8K6G9QnxeOatky5obyvzc
 8dpbm5k2iwbhucnxInf+7PDeOCBnywtM0Q==
X-Google-Smtp-Source: ABdhPJxqN1Y3gJZ4NYXlo0OqyuBAvsBBN5bYVsTglAyZRgFHyFeSnCQPuM3OMkUXWU/TTHxoXQcZLg==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr1059103wre.217.1623875325131; 
 Wed, 16 Jun 2021 13:28:45 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p12sm5549300wme.43.2021.06.16.13.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 13:28:43 -0700 (PDT)
Subject: Re: [PATCH v3 06/13] hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-7-f4bug@amsat.org>
 <20210616191637.GF11196@minyard.net>
 <59fb23da-ddad-0436-6935-89712fbddf0f@amsat.org>
 <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <416b4c36-b838-a5f4-6575-74685627b9c3@amsat.org>
Date: Wed, 16 Jun 2021 22:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7bf42f64-b6dd-1e1d-dec9-f710cc94cb2@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
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
Cc: cminyard@mvista.com,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 10:01 PM, BALATON Zoltan wrote:
> On Wed, 16 Jun 2021, Philippe Mathieu-Daudé wrote:
>> On 6/16/21 9:16 PM, Corey Minyard wrote:
>>> On Wed, Jun 16, 2021 at 06:14:11PM +0200, Philippe Mathieu-Daudé wrote:
>>>> Instead of using the confuse i2c_send_recv(), rewrite to directly
>>>> call i2c_recv() & i2c_send(), resulting in code easire to review.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/i2c/ppc4xx_i2c.c | 13 ++++++++-----
>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/i2c/ppc4xx_i2c.c b/hw/i2c/ppc4xx_i2c.c
>>>> index f4c5bc12d36..b3d3da56e38 100644
>>>> --- a/hw/i2c/ppc4xx_i2c.c
>>>> +++ b/hw/i2c/ppc4xx_i2c.c
>>>> @@ -240,11 +240,14 @@ static void ppc4xx_i2c_writeb(void *opaque,
>>>> hwaddr addr, uint64_t value,
>>>>                          i2c->sts &= ~IIC_STS_ERR;
>>>>                      }
>>>>                  }
>>>> -                if (!(i2c->sts & IIC_STS_ERR) &&
>>>> -                    i2c_send_recv(i2c->bus, &i2c->mdata[i], !recv)) {
>>>> -                    i2c->sts |= IIC_STS_ERR;
>>>> -                    i2c->extsts |= IIC_EXTSTS_XFRA;
>>>> -                    break;
>>>> +                if (!(i2c->sts & IIC_STS_ERR)) {
>>>> +                    if (recv) {
>>>> +                        i2c->mdata[i] = i2c_recv(i2c->bus);
>>>> +                    } else if (i2c_send(i2c->bus, i2c->mdata[i])) {
>>>
>>> In the previous patch you checked < 0, it would be nice to be
>>> consistent.
>>
>> I did that first but thought Zoltan wouldn't be happy, then went back :)
>>
>> I'll fix for the next iteration, thanks.
> 
> I generally had no problem with i2c_send_recv only that its argument
> that decides which operation to do was inverted compared to other
> similar i2c functions so my original patch just corrected that for
> consistency and I was happy with that.

But we have to make the maintainer happy too to get patch merged ;)

> Having a send_recv in one func
> allowed to avoid if-else in some places like these but if you think it's
> better without this function at all I can work with that too. I'll have
> to check if these changes could break anything. At first sight I'm not
> sure errors are handled as before if recv fails but it was years ago I
> did the sm501 and ati parts and I forgot how they work so I need to
> check again. I'll wait for the final version of the series then and test
> that.

Thanks, that would be great!

> I remember I had to tweak these a lot because each guest OS had
> drivers that did things slightly differently so if I've fixed one,
> another broke until I've found a way that worked for all.

I wish Avocado (or any other testing framework) could help you with
your testing, and you could contribute your tests even if you can not
contribute your firmware blob due to incompatible license.
That would help us understand how you use your firmware, and save you
time while testing.

Regards,

Phil.

