Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EAF663162
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:23:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyVd-0007Yk-63; Mon, 09 Jan 2023 15:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEyVa-0007UQ-Ib
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:12:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pEyVY-0001IJ-EJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673295155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5R1qBpu3R7plf3W11SVGK0aWVnV8D1jvCc4gNgxseYk=;
 b=Zgk72ckgnwxNIRzFgaDHbPvJ71dCeR0pfGt8ubz7khWH5Mnh9EkyNVCBpCrLeEBIcipgfN
 1fx612sbfWaTegAeQ02VpZhkj68EcmueqeNP5ePckBiNik9+fPRFZOE0CyBZn2xlV8vCiB
 34kS5y0D6J4BmkGamazzqJld3virAQU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-0VyjeXCpNpeLcui8w8DqYQ-1; Mon, 09 Jan 2023 15:12:34 -0500
X-MC-Unique: 0VyjeXCpNpeLcui8w8DqYQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 x13-20020a05640226cd00b0047ac11c9774so6008024edd.17
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5R1qBpu3R7plf3W11SVGK0aWVnV8D1jvCc4gNgxseYk=;
 b=qmCwlWed1CDtHTxn597Rrzhsev4kD674sWPhy61i6NeNeXiz4p0xeA5GR+7mgsENpb
 zUD1IAkL2AVbkYZGDSTttIUGqxVnNQjkbz2vFa3PypNjXAqkKtamM2Th0D2XNxaSuz2g
 5326Ngr1VGmQbMvxFel2NIWCV8E7sYxxEbj9MZ6ldr7GnqbjGwz2AuTMZ8zzbpxecHlj
 fm1WNUOZl4vY0E/4F+G+2i9sekxvkuDxB2uVe8kacIMLMnj6Gmfdiw8JEVh5cBzY2HD0
 /rBxvHPcsRYEsBDEkHew/YDa0ONXCsY4+jOfuVsmGm6eB0KyP4iTNVZ+Z/w3fMhztTd3
 OxBA==
X-Gm-Message-State: AFqh2kpVzT2HczzXzuoaRtJD9lv/SFsdjhI31mRlsUAlG6bhnosFKORr
 odV3wNOMWM100Xwx5++yebhmjf93I+iA6KSb2ygZ512tvMMKlWcE7urumiR2mFNMf+ano4eZqX5
 M/7YB2oDrx1mDAUE=
X-Received: by 2002:aa7:de11:0:b0:497:233d:3ef6 with SMTP id
 h17-20020aa7de11000000b00497233d3ef6mr10520525edv.17.1673295153228; 
 Mon, 09 Jan 2023 12:12:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvG0q9EgIOfRCjxEO7Gu47hF4HIDNk0tppUMgKVW1REgGEk5tgcXVYimXas/tv5IVaxOZupWQ==
X-Received: by 2002:aa7:de11:0:b0:497:233d:3ef6 with SMTP id
 h17-20020aa7de11000000b00497233d3ef6mr10520506edv.17.1673295153009; 
 Mon, 09 Jan 2023 12:12:33 -0800 (PST)
Received: from [192.168.8.100] (tmo-124-91.customers.d1-online.com.
 [80.187.124.91]) by smtp.gmail.com with ESMTPSA id
 e3-20020a170906314300b0073ae9ba9ba8sm4057338eje.3.2023.01.09.12.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 12:12:31 -0800 (PST)
Message-ID: <045df8de-c9c4-b68c-29f6-1893724574e4@redhat.com>
Date: Mon, 9 Jan 2023 21:12:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the
 availability of the slew tick policy
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
 <1bd2f34b-2364-1ce7-a3f4-946e76594344@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1bd2f34b-2364-1ce7-a3f4-946e76594344@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/01/2023 09.55, Mark Cave-Ayland wrote:
> On 03/01/2023 08:47, Thomas Huth wrote:
> 
>> We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
>> code, so we need a different way to decide whether the slew tick policy
>> is available or not. Introduce a new property "slew-tick-policy-available"
>> which can be set by the machines that support this tick policy.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   include/hw/rtc/mc146818rtc.h |  1 +
>>   hw/i386/pc_piix.c            |  1 +
>>   hw/isa/lpc_ich9.c            |  1 +
>>   hw/isa/piix3.c               |  1 +
>>   hw/rtc/mc146818rtc.c         | 16 ++++++++++------
>>   5 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>> index 1db0fcee92..54af63d091 100644
>> --- a/include/hw/rtc/mc146818rtc.h
>> +++ b/include/hw/rtc/mc146818rtc.h
>> @@ -45,6 +45,7 @@ struct RTCState {
>>       QEMUTimer *coalesced_timer;
>>       Notifier clock_reset_notifier;
>>       LostTickPolicy lost_tick_policy;
>> +    bool slew_tick_policy_available;
>>       Notifier suspend_notifier;
>>       QLIST_ENTRY(RTCState) link;
>>   };
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index bc9ea8cdae..382c6add3b 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
>>           rtc_state = isa_new(TYPE_MC146818_RTC);
>>           qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
>> +        qdev_prop_set_bit(DEVICE(rtc_state), 
>> "slew-tick-policy-available", true);
>>           isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
>>           i8257_dma_init(isa_bus, 0);
>> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
>> index 498175c1cc..aeab4d8549 100644
>> --- a/hw/isa/lpc_ich9.c
>> +++ b/hw/isa/lpc_ich9.c
>> @@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
>>       /* RTC */
>>       qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
>> +    qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-policy-available", 
>> true);
>>       if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
>>           return;
>>       }
>> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
>> index c68e51ddad..825b1cbee2 100644
>> --- a/hw/isa/piix3.c
>> +++ b/hw/isa/piix3.c
>> @@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error 
>> **errp)
>>       /* RTC */
>>       qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
>> +    qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-policy-available", true);
>>       if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>>           return;
>>       }
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index 947d68c257..86381a74c3 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error 
>> **errp)
>>       rtc_set_date_from_host(isadev);
>>       switch (s->lost_tick_policy) {
>> -#ifdef TARGET_I386
>> -    case LOST_TICK_POLICY_SLEW:
>> -        s->coalesced_timer =
>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>> -        break;
>> -#endif
>>       case LOST_TICK_POLICY_DISCARD:
>>           break;
>> +    case LOST_TICK_POLICY_SLEW:
>> +#ifdef TARGET_I386
>> +        if (s->slew_tick_policy_available) {
>> +            s->coalesced_timer = timer_new_ns(rtc_clock, 
>> rtc_coalesced_timer, s);
>> +            break;
>> +        }
>> +#endif
>> +        /* fallthrough */
>>       default:
>>           error_setg(errp, "Invalid lost tick policy.");
>>           return;
>> @@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] = {
>>       DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>>       DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>>                                  lost_tick_policy, LOST_TICK_POLICY_DISCARD),
>> +    DEFINE_PROP_BOOL("slew-tick-policy-available", RTCState,
>> +                     slew_tick_policy_available, false),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };
> 
> My first thought when looking at the new "slew-tick-policy-available" 
> property introduced above was that it seems to overlap with the 
> "lost_tick_policy" property defined just above it using 
> DEFINE_PROP_LOSTTICKPOLICY().

You've got a point here ... it's a little bit ugly that we have two 
user-visible properties for the lost tick policy now...

> This made me wonder if a better approach here would be to move the logic 
> that determines if LOST_TICK_POLICY_SLEW is available into the 
> "lost_tick_policy" property setter defined at 
> https://gitlab.com/qemu-project/qemu/-/blob/master/hw/core/qdev-properties-system.c#L558. 
> 
> If you look at the code directly below the link above you can see how 
> set_blocksize() overrides the .set function for qdev_prop_blocksize to 
> provide additional validation, which is similar to what we are trying to do 
> here.
> 
> I think it may be possible to come up with a similar solution for 
> qdev_prop_losttickpolicy which makes use of the logic you suggested before i.e.
> 
>      MachineState *ms = MACHINE(qdev_get_machine());
> 
>      if (!object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE)) {
>          ....
>      }
> 
> which can then emit a suitable warning or return an error accordingly. A 
> quick glance at hw/core/qdev-properties-system.c suggests there are a number 
> of similar examples showing how this could be done.

Thanks, I like that idea! I'll give it a try!

  Thomas


