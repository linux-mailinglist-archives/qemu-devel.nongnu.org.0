Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B3C333DE0
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:30:31 +0100 (CET)
Received: from localhost ([::1]:45306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyv0-0001EM-L4
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJysO-0008Ie-8o
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:27:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJysM-0006OT-DA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:27:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id ox4so23070690ejb.11
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 05:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TeaVNhD/oCWc32M3amiCTbKW5azWxNSmnxtPz7O+ZNk=;
 b=ce7s3++psvs1yoOeTgvGBb8HsN3or5mUO/yIg+xihwEb7tPVYg82xczNa+e7kIwr44
 DCGycUYZaYqHzaBD3PB4FomhqE8oEpUOu20nYtyBXh3bIimTm27Sl1JiIQhyFCYnX78e
 gBqy6dfQI7CJA+aTDT2uRekaO48iJ8YMdVDRhsVwfWpwzr/2gWNqTdAElMH8qpND8vM2
 EYkzP1DWduyubiNmAy5v5q5VBgleRgzX9AV0KldkbNLD+9FCAiydmKlswRC18Fv1CSw4
 MG25aJlhHLpIkusD2ECg079S44R9Py4w3qQ+imsf3BU6Hp894eTNwayB+iEjtUm6JIiP
 QRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TeaVNhD/oCWc32M3amiCTbKW5azWxNSmnxtPz7O+ZNk=;
 b=Sx2zH2H1fXvtLD4dj4IsF5rLrjkVIQK6mCRaJNyrsbrhYb6TYDKqSx3koMw4TIRsj1
 UGh233OwlCKPjscDwn/VSDtd6jHg+jbK8PUjqYvVllsv3ijGYURaCo0vVeqZmBUxj0Fy
 /+X51iFlH6D/9IaZRpFx5NryLIx/8W/xY5xcE7NI/ewTwcBtyUnwfP6mwRlG9X9QpCPA
 uvl+0/k230iDrvB/x+bTCQbr3Fgfs7lJEFxIzKtAPDlnJNKTSc7t1Obv4fcBl+eEb4Gd
 Jtkg4/tJpqNm/xXbxxvOia1XWMn6q5XoJO2GECiOgLSHORd0eALjkkrInDBjaNrLhGeq
 MjWg==
X-Gm-Message-State: AOAM533TP/JImq2WrfHpcMHU3NNqXjiWNePN/zo5iOoUSs5XzMQAkp4X
 brRmzjW8wMNXz4llKEuUeg+n5P1okhk=
X-Google-Smtp-Source: ABdhPJyBhFdSxpKWkhY9WSCi9mLVtztekQf0R94gay4Z41SVX+ynppt9pxD3cAgKsNu/WnZA6uS9CA==
X-Received: by 2002:a17:907:3e8c:: with SMTP id
 hs12mr3676395ejc.105.1615382864204; 
 Wed, 10 Mar 2021 05:27:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v11sm10698432eds.14.2021.03.10.05.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 05:27:43 -0800 (PST)
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
To: Laurent Vivier <laurent@vivier.eu>, BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
 <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
 <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
 <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c81ab80-8071-97ce-9dc6-1ee7c9c60019@amsat.org>
Date: Wed, 10 Mar 2021 14:27:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 2:10 PM, Laurent Vivier wrote:
> Le 10/03/2021 à 13:56, Laurent Vivier a écrit :
>> Le 10/03/2021 à 13:32, BALATON Zoltan a écrit :
>>> On Wed, 10 Mar 2021, Mark Cave-Ayland wrote:
>>>> The 60Hz timer is initialised using timer_new_ns() meaning that the timer
>>>> interval should be measured in ns, and therefore its period is a thousand
>>>> times too short.
>>>>
>>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>>> ---
>>>> hw/misc/mac_via.c | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/misc/mac_via.c b/hw/misc/mac_via.c
>>>> index f994fefa7c..c6e1552a59 100644
>>>> --- a/hw/misc/mac_via.c
>>>> +++ b/hw/misc/mac_via.c
>>>> @@ -302,8 +302,8 @@ static void via1_sixty_hz_update(MOS6522Q800VIA1State *v1s)
>>>>     MOS6522State *s = MOS6522(v1s);
>>>>
>>>>     /* 60 Hz irq */
>>>> -    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630) /
>>>> -                          16630 * 16630;
>>>> +    v1s->next_sixty_hz = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 16630000) /
>>>> +                          16630000 * 16630000;
>>>
>>> Can you put this magic number in a #define maybe also rewriting it in a way that shows it
>>> corresponds to a 60 Hz interval. (There's NANOSECONDS_PER_SECOND defined in include/qemu/timer.h
>>> that could be used for that, there's also SCALE_MS that might replace 1000 * 1000 elsewhere in this
>>> file). Also NANOSECONDS_PER_SECOND / 60 is 16666666, should that value be used here instead?
>>
>> In fact, the Mac Frequency is not exactly 60 Hz, in docs we can find 60.147 Hz, in kernel 60.15 Hz.
>> I Think there are several ways to compute it...

Good candidate to switch to the Clock API, see docs/devel/clocks.rst
once this gets merged:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg788864.html

> In fact, we can read:
> 
> "the vertical retrace frequency is approximately 60.15 Hz, resulting in a period of approximately
> 16.63 milliseconds"
> 
> https://developer.apple.com/library/archive/documentation/mac/pdf/Processes/Vertical_Retrace_Mgr.pdf
> 
> Thanks,
> Laurent
> 
> 


