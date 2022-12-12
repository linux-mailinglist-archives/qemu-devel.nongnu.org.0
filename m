Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7E96499C2
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 08:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4dbz-0003qq-Pt; Mon, 12 Dec 2022 02:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4dbv-0003ps-EN
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:52:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4dbt-0004VY-AC
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 02:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670831531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNmmR4fMMto6lx1c8xtEJJtLM9gOZA7WLpAWbWwKj88=;
 b=E4F4yWvrj1c5GyTA2rAEBdov4820DbxPv49sj5MXQLfQbniAzr+PzxY4zf79PoIs+FO9s3
 HJNKRibVb4tCCaJoWWnw/aYRn188OzNYmn1l4MkBF/KlTDkVwzSt/NlLUEAvJ83PDrhAQn
 BjVSNvM8f00xLkDtFF4AlLtBPRZ1DJo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-91-qOZCLdz2PcWLQ8Go96XJ-w-1; Mon, 12 Dec 2022 02:52:02 -0500
X-MC-Unique: qOZCLdz2PcWLQ8Go96XJ-w-1
Received: by mail-wm1-f72.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso1679120wml.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 23:52:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oNmmR4fMMto6lx1c8xtEJJtLM9gOZA7WLpAWbWwKj88=;
 b=mt8H23ekeWCdTSanaYGfa+0AS03fznj+h+ZkOOhRje6muO90JG2Gu6MLnErFK8TAPS
 obq/U6IGyav/XKbPuhtMXy6Bo9TlQPUFQh6H+89et2HZFeccn1RgffYsRTFj4MYJARfm
 MCZ0sH+T5gEktG9o7hitM9/fRouF0IEoDOzvle4FitIIFmIZD99S+D1O7yVMPiw6sNG2
 qH4vP5MIoIufhwmT9YexzuGMKgj06OUFM6mN+PJFHLLG/FE4qQTFPeDMTfWVK2rvInuK
 II5Nz8bppC/WLK9j/tQCdhp0IO65KsvfVgItr//CqmrxGwTOsppJkvMUVZBbOj1945He
 HxiA==
X-Gm-Message-State: ANoB5pk53L5Ev9LLw0CmnIcibpVL7H6myhCgWpemoAp9jGMr5BPCSh4h
 2alZEPFbHe+35yKOsQNUc7jq79I8X47+/XH3gjmO0kLZfnWkvFlnEfEDeQYfdRJ2ouaERE0dDoa
 aNeJ7iQLKYyLDHjk=
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id
 n5-20020a05600c4f8500b003cf792507a3mr11759131wmq.24.1670831520891; 
 Sun, 11 Dec 2022 23:52:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5uSkqvOWBXHq/q1ORZgJ71IN25xIgfPHmLyeXKvtHVsDRiJmPQJGBrVhyQtwVfcIkfYZUZQA==
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id
 n5-20020a05600c4f8500b003cf792507a3mr11759117wmq.24.1670831520646; 
 Sun, 11 Dec 2022 23:52:00 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-127.web.vodafone.de.
 [109.43.178.127]) by smtp.gmail.com with ESMTPSA id
 fc18-20020a05600c525200b003cfd64b6be1sm10361294wmb.27.2022.12.11.23.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 23:51:59 -0800 (PST)
Message-ID: <b03e7084-54e5-4aa8-d089-2a5f9beb5639@redhat.com>
Date: Mon, 12 Dec 2022 08:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 for-8.0] hw/rtc/mc146818rtc: Make this rtc device
 target independent
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221209111556.110757-1-thuth@redhat.com>
 <a9e8d0ef-e4cb-2319-d8d3-f657e167c729@ilande.co.uk>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <a9e8d0ef-e4cb-2319-d8d3-f657e167c729@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 10/12/2022 14.48, Mark Cave-Ayland wrote:
> On 09/12/2022 11:15, Thomas Huth wrote:
> 
>> The only reason for this code being target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
>> simple, we can easily move them into a new, separate file (apic_irqcount.c)
>> which will always be compiled and linked if either APIC or the mc146818 
>> device
>> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
>> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
>> that the code only gets compiled once for all targets.
[...]
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index 1ebb412479..afb1f385a3 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -43,11 +43,7 @@
>>   #include "qapi/qapi-events-misc.h"
>>   #include "qapi/visitor.h"
>>   #include "hw/rtc/mc146818rtc_regs.h"
>> -
>> -#ifdef TARGET_I386
>> -#include "qapi/qapi-commands-misc-target.h"
>>   #include "hw/i386/apic.h"
>> -#endif
>>   //#define DEBUG_CMOS
>>   //#define DEBUG_COALESCED
>> @@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>>   static QLIST_HEAD(, RTCState) rtc_devices =
>>       QLIST_HEAD_INITIALIZER(rtc_devices);
>> -#ifdef TARGET_I386
>>   void qmp_rtc_reset_reinjection(Error **errp)
>>   {
>>       RTCState *s;
>> @@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
>>       rtc_coalesced_timer_update(s);
>>   }
>> -#else
>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>> -{
>> -    assert(0);
>> -    return false;
>> -}
>> -#endif
>>   static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>>   {
>> @@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error 
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
>> +        /* Slew tick policy is only available if the machine has an APIC */
>> +        if (object_resolve_path_type("", "apic-common", NULL) != NULL) {
> 
> Hmmm. These days we should be using TYPE_APIC_COMMON, however it seems that 
> APICCommonState is defined in apic_internal.h rather than apic.h which seems 
> wrong (it prevents you from passing an APICCommonState as an object link 
> property as well as from using TYPE_APIC_COMMON).
> 
>> +            s->coalesced_timer = timer_new_ns(rtc_clock, 
>> rtc_coalesced_timer, s);
>> +            break;
>> +        }
>> +        /* fallthrough */
>>       default:
>>           error_setg(errp, "Invalid lost tick policy.");
>>           return;
>> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
>> index bcbf22ff51..036ad1936b 100644
>> --- a/hw/intc/meson.build
>> +++ b/hw/intc/meson.build
>> @@ -25,8 +25,12 @@ softmmu_ss.add(when: 'CONFIG_XILINX', if_true: 
>> files('xilinx_intc.c'))
>>   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: 
>> files('xlnx-zynqmp-ipi.c'))
>>   softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: 
>> files('xlnx-pmu-iomod-intc.c'))
>> -specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: 
>> files('allwinner-a10-pic.c'))
>> +if config_all_devices.has_key('CONFIG_APIC') or 
>> config_all_devices.has_key('CONFIG_MC146818RTC')
>> +    softmmu_ss.add(files('apic_irqcount.c'))
>> +endif
>>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 
>> 'apic_common.c'))
>> +
>> +specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: 
>> files('allwinner-a10-pic.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: 
>> files('arm_gicv3_cpuif_common.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: 
>> files('arm_gicv3_cpuif.c'))
>>   specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: 
>> files('arm_gic_kvm.c'))
>> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
>> index dc33973384..34a4d316fa 100644
>> --- a/hw/rtc/meson.build
>> +++ b/hw/rtc/meson.build
>> @@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: 
>> files('aspeed_rtc.c'))
>>   softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true: 
>> files('goldfish_rtc.c'))
>>   softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
>>   softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: 
>> files('allwinner-rtc.c'))
>> -
>> -specific_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
>> +softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true: files('mc146818rtc.c'))
> 
> Fixing up the headers to allow TYPE_APIC_COMMON rather than hard-coding 
> "apic-common" would be my preference, however there is a lot of legacy code 
> here and the fear would be that once you pull on that string then more will 
> keep unravelling... 

I gave it a try now and it seems to be OK to move TYPE_APIC_COMMON from 
apic_internal.h to apic.h ... so I'll add that change and send a v3.

Thanks!

  Thomas


