Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B017F35A0EF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 16:21:39 +0200 (CEST)
Received: from localhost ([::1]:49300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUs0w-0003nt-Nu
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 10:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUrzb-0002yI-7X; Fri, 09 Apr 2021 10:20:16 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUrzZ-0002WX-JI; Fri, 09 Apr 2021 10:20:15 -0400
Received: by mail-ej1-x631.google.com with SMTP id a7so8970111eju.1;
 Fri, 09 Apr 2021 07:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NH/cjoXYRUZyazvxOW3X1Jw44bHUe/QtVRn6gwVv2ZY=;
 b=epKZy9W9uShiXIJBuQ9fqmkQem84pRtUPVU2xSGz3PX32xHiEHQGKzaQHrI7r7uC/m
 ie6nphFOPl30zjpZWznTWMliTxyVXSqbGYgvj3fx6oSK0+t6y9Q2NEQ/Wrn59siBgTB2
 fhaM/NClwUWXgke7NrZZh19ekEVHXWfY1qxhE3WdJHVsQD6ipF7u5x6qKFKwZgYUKPA4
 qtNS0xpNz5cz49f8QQEXEhECv6vsISWvDPBRuRZOvq/pZnrvDiBNbzB3o7F4Rgmdhpn6
 D7y/E3Gdc566BoqgevWUqeRda4pFBvsYOCCHvbcgxY39E/Upkox4eNvyT+6BOiu0LmL/
 fxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NH/cjoXYRUZyazvxOW3X1Jw44bHUe/QtVRn6gwVv2ZY=;
 b=DCQhJv7v3sOrGBOWOxbBmFtLFTNKx5mAl91BRakd01gY7ylaFV4V75Xx2tqnOeQZz5
 Xkf5faq5ThHWzf2JDdZsBv55IkEgjBqBzTAJi1/85YNcijo/lcH9sv4jqt+ajhwoaNG0
 fg0AGmyq2IRBMDXKzz67nRQAEiPzAtuRu5RhknUGtGodqgPMV1aiWgIPX6WzNOM0ZNYr
 WvIJpVdQAnObJFnFPHL7vDxh4+NtuKa9LwjmCWxBj08wiHakj6HGvpXZWFOM/9riuleM
 ZuO8s3F6h9lFZ/coSBPDp3dp2ghU9v4umtfHG4nPnt1ekGY+xK9VDSvM+EN5wvmW7gqg
 dVlw==
X-Gm-Message-State: AOAM5325NJhQithTQbjKErHaYTxXzMNMl4LmFM1RUi8R3hs7z72N5rSa
 g/GgV4H/2Hm7aFGrbeyvLh4=
X-Google-Smtp-Source: ABdhPJw26RgvtWlVthdiKXOSPqdw1/uJ/iekPRZ4ME3A2ZiWlIqMQHr5b1gfRggRQmmDMq7UjMFuJw==
X-Received: by 2002:a17:907:3d8a:: with SMTP id
 he10mr16579118ejc.184.1617978011591; 
 Fri, 09 Apr 2021 07:20:11 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y2sm1298176ejf.30.2021.04.09.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 07:20:10 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 0/9] hw/clock: Strengthen machine (non-qdev)
 clock propagation
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
References: <20210409062401.2350436-1-f4bug@amsat.org>
 <774acc32-2d5a-298e-f47b-df763f86ad2d@amsat.org>
 <08698b00-e867-2e40-440b-89d303cbefef@amsat.org>
Message-ID: <ada13057-a1d7-936a-fc2a-de07b2708210@amsat.org>
Date: Fri, 9 Apr 2021 16:20:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <08698b00-e867-2e40-440b-89d303cbefef@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 4:11 PM, Philippe Mathieu-Daudé wrote:
> On 4/9/21 3:12 PM, Philippe Mathieu-Daudé wrote:
>> On 4/9/21 8:23 AM, Philippe Mathieu-Daudé wrote:
>>> Hi Damian, Luc, Peter.
>>>
>>> I've been debugging some odd issue with the clocks:
>>> a clock created in the machine (IOW, not a qdev clock) isn't
>>> always resetted, thus propagating its value.
>>> "not always" is the odd part. In the MPS2 board, the machine
>>> clock is propagated. Apparently because the peripherals are
>>> created directly in the machine_init() handler. When moving
>>> them out in a SoC QOM container, the clock isn't... I'm still
>>> having hard time to understand what is going on.
>>>
>>> Alternatively I tried to strengthen the clock API by reducing
>>> the clock creation in 2 cases: machine/device. This way clocks
>>> aren't left dangling around alone. The qdev clocks are properly
>>> resetted, and for the machine clocks I register a generic reset
>>> handler. This way is safer, but I don't think we want to keep
>>> adding generic reset handlers, instead we'd like to remove them.
>>>
>>> I'll keep debugging to understand. Meanwhile posting this series
>>> as RFC to get feedback on the approach and start discussing on
>>> this issue.
>>
>> I wonder if this could be the culprit:
> 
> No (same reverting it) :(
> 
>>   commit 96250eab904261b31d9d1ac3abbdb36737635ffa
>>   Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>   Date:   Fri Aug 28 10:02:44 2020 +0100
>>
>>       hw/clock: Only propagate clock changes if the clock is changed
>>
>>       Avoid propagating the clock change when the clock does not change.
>>
>>   diff --git a/include/hw/clock.h b/include/hw/clock.h
>>   index d85af45c967..9ecd78b2c30 100644
>>   --- a/include/hw/clock.h
>>   +++ b/include/hw/clock.h
>>   @@ -165,8 +165,9 @@ void clock_propagate(Clock *clk);
>>     */
>>    static inline void clock_update(Clock *clk, uint64_t value)
>>    {
>>   -    clock_set(clk, value);
>>   -    clock_propagate(clk);
>>   +    if (clock_set(clk, value)) {
>>   +        clock_propagate(clk);
>>   +    }
>>    }
>>
>> I.e.:
>>
>> - first use clock_set() to set the new period
>> - then call clock_update() with the same "new period"
>>
>> -> the clock parent already has the new period, so the
>>    children are not updated.
> 
> This is actually what clock_set_source() does:
> 
>   void clock_set_source(Clock *clk, Clock *src)
>   {
>       ...
> 
>       clk->period = src->period; // <------------------------------
>       QLIST_INSERT_HEAD(&src->children, clk, sibling);
>       clk->source = src;
>       clock_propagate_period(clk, false);
>   }
> 
> So indeed if we use qdev_connect_clock_in() in DeviceRealize(),
> it calls clock_set_source() and set the period, does not propagate,
> then later when clock_propagate_period() is called:
> 
> static void clock_propagate_period(Clock *clk, bool call_callbacks)
> {
>     ...
>     QLIST_FOREACH(child, &clk->children, sibling) {
>         if (child->period != clk->period) {
>             //           ^^^^ this condition is false
>             ...
>             clock_propagate_period(child, call_callbacks);
>             // ^^^ children never get clock propagated
>         }
>     }
> }
> 
> Does it make sense?

FWIW this fixes the problem I'm having:

-- >8 --
diff --git a/hw/core/clock.c b/hw/core/clock.c
index 23c0c372b5d..4ecb51b1465 100644
--- a/hw/core/clock.c
+++ b/hw/core/clock.c
@@ -87,7 +87,7 @@ static void clock_propagate_period(Clock *clk, bool
call_callbacks)
                                        CLOCK_PERIOD_TO_HZ(clk->period),
                                        CLOCK_PATH(child),
                                        CLOCK_PERIOD_TO_HZ(child->period));
-        if (child->period != clk->period) {
+        if (1) {//child->period != clk->period) {
             if (call_callbacks) {
                 clock_call_callback(child, ClockPreUpdate);
             }
---

At least this confirm my hypothesis and reduces the scope of
the problem.

I'm not sure what is the best way to fix this (yet?) so I'll
wait here for feedback. At least I can keep going :)

Regards,

Phil.

