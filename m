Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18FD3B7475
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:38:06 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEsH-0005ma-Gd
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEkh-00046o-Qc
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:30:18 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyEke-0001Jk-Sz
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:30:15 -0400
Received: by mail-pg1-x535.google.com with SMTP id a2so18636953pgi.6
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 07:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uJ9HqMO2697to4vZ9XNe3EnzXOWf5jyma7zfl8CPKVA=;
 b=YzuEoaKmqQ3lJFe8lHw/9GsBPnT4Dht+sgpRpAUQJgwkEfniTKwGdAV3Gdww0ljXRq
 jPi4bKR4oQoAcpvK/5h7nhOq7sb4h4alpB+mzPGm4yWj4a76Rj/HA3jozSsrNHXj8L9a
 M3stxHYSf+GGwbjr1PcF/l4f+D8KNhglYc/+SdR8ZBoQ/gnIuzJ6g/YcmJkTJz1riBai
 8MGZrSbnVbJ0mcTFv7facTad1BI1RoNz8HoAIQ4IwH8sCCNwa4mUJVhfB3mfu0h7ueJl
 2DBWGWGhw82qQFahD/ScNTgKpcXAdk+bI1p5oNkwfWqC7+KpPYy/xBlFsZRVIwzqXB1j
 YhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uJ9HqMO2697to4vZ9XNe3EnzXOWf5jyma7zfl8CPKVA=;
 b=UFrCMZupsAC8O0X9iUDDH5/x7NFZagxLra9jliMPCMH/sQ7q71CvczH5xXYJbav3Ai
 oRsIiQaWPSwINMEFdZR+83mqFP3UYA6cPDXOHn+71IjloZAQgclozECWLbIkfoT64HtT
 zWfRegy7I8QTSA9lRvgYETPEBv1hT9RZgdSonrGcnnRvhEO51lqbfcazrHIZK0vzn+EI
 vztNJ/Ehm7dVAQpTqVq996hcsh/BsxnhOS3wSBYyOfumW3ueVRtLspzkt24cmK1qcBmV
 AvMBrNCgo46zQ4Ow8MnlIK0Y4s8ReY4rbGQg3YYZvaOPgjMMeW7Rv/SJChjsFiSsGowd
 2ijQ==
X-Gm-Message-State: AOAM533JaaFQTppNevsyiUPQLm8JdNGmRlLJLZfScXWW3xKb4/la/rmN
 WUf3dpzr1lrRotICmv8PvrLtqQ==
X-Google-Smtp-Source: ABdhPJwARwGNz+DoVFRG3P3+3Qx034XeQtp4NPxhByX13GzgKPWRf23OZbE2UM09bHvBQTJUUccOvg==
X-Received: by 2002:a63:3105:: with SMTP id x5mr24302478pgx.364.1624977010970; 
 Tue, 29 Jun 2021 07:30:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id t3sm18004378pfl.44.2021.06.29.07.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 07:30:10 -0700 (PDT)
Subject: Re: [PATCH v2 03/23] linux-user/arm: Split out v2_frame
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-4-richard.henderson@linaro.org>
 <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <66be19d6-507b-8a28-1544-80727abdbadc@linaro.org>
Date: Tue, 29 Jun 2021 07:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92sHgV1DSKv6XaSBcuyaSfOLhm4OyH5hNsTJTVCx+Tkw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 6:53 AM, Peter Maydell wrote:
> On Fri, 18 Jun 2021 at 20:32, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Split out a helper function to test for a v2 signal frame.
>>
>> Cc: qemu-arm@nongnu.org
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/arm/signal.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/arm/signal.c b/linux-user/arm/signal.c
>> index 32b68ee302..cb65623965 100644
>> --- a/linux-user/arm/signal.c
>> +++ b/linux-user/arm/signal.c
>> @@ -165,6 +165,11 @@ static inline int valid_user_regs(CPUARMState *regs)
>>       return 1;
>>   }
>>
>> +static bool v2_frame(void)
>> +{
>> +    return get_osversion() >= 0x020612;
>> +}
> 
> Not sure how much we care about supporting claiming to be a 15-year-old
> kernel any more (especially since we set UNAME_MINIMUM_RELEASE to 2.6.32...)
> so it's awfully tempting to just blow away the v1 frame support instead...
> 
> Anyway
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I hadn't noticed the minimum release setting.  Yes, I think it would be better to remove 
the v1 support instead of bodging around it like this.


r~

