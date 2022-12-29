Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60DF658BE3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 11:46:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqOx-00017C-Cw; Thu, 29 Dec 2022 05:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAqOu-00016k-5q
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:44:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAqOq-0000gf-Ru
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 05:44:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672310675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rLp4JVv/Tdxu1tebxuCE2d6sAXLwFrvqGPHo7KrrIX4=;
 b=FGQsfPAsVRTCqXr0X+cOXKzQp3/hn85Sli8dkHBJN/Ss/J0K28d2LTdzLQmHErMQgOKKPy
 fpbvKfUh6Aa+V9fjRXoWqsS/Wqazfll53J6V7Q8YctTLyauNRGvAFfYd/2b218Za31U8yF
 VH5J57/4OwxQ640iyyXug3qON3KZFk4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-339--LXrQdg-MEuDaWa31PacdQ-1; Thu, 29 Dec 2022 05:44:33 -0500
X-MC-Unique: -LXrQdg-MEuDaWa31PacdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c23-20020a7bc857000000b003d97c8d4935so5302660wml.8
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 02:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rLp4JVv/Tdxu1tebxuCE2d6sAXLwFrvqGPHo7KrrIX4=;
 b=tblsqyQbh3YRFxlbd79N1JSX2wEvBJLOrLNSn6t00WylnDqwRk2yC7wI9ySuatrs/B
 biWAJLt3RBCsydEcYuypwuqxv9LX9waMwqyWdRbzMRUSteqb52zISRd4UosS9/cPf2MN
 15fG+Dx4Up0pFybqq7zlEVZDLFzt9iBcWUGWDoibdzQvI9fO9Dg5bzNKJ0j4YHBi5OBw
 eTMJ8NxC+AVu0TTtdqpEqw1mnJOEvTWYMj+1rUagn0ZTCDWyrq/Thl7YnX+z/KepcYYE
 2zwhOPJ8y717gjs7PGnSRjPE+c2Mez9OBtqMkWeq896k77vmGir6421Y4pgIjrvZjzXo
 r5aw==
X-Gm-Message-State: AFqh2kq83PQBnaekWHDh+occ4/TpD18pIVEKlHgepoYvMsMMi4PpzPrD
 eCryCBX8oGHrY8xrlCmOwBNuhSbdE4VjSpXw78zBd1YxZtFbcDrWUrrMswSDBqTn2wgc8aFR83C
 BXzXrlQllfa9PlfU=
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr11306116wmb.31.1672310672781; 
 Thu, 29 Dec 2022 02:44:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvYCW69nfpbp8gm2WnszvFOqFv3boieA3v7cdPaVGrrTIPQHiPCN8z9nbS2KGhuaLmI/GQ7Zg==
X-Received: by 2002:a05:600c:c0d:b0:3d9:7667:c0e4 with SMTP id
 fm13-20020a05600c0c0d00b003d97667c0e4mr11306102wmb.31.1672310672525; 
 Thu, 29 Dec 2022 02:44:32 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 t184-20020a1c46c1000000b003b4a699ce8esm28707536wma.6.2022.12.29.02.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 02:44:31 -0800 (PST)
Message-ID: <4980caa6-f86f-bafa-b0d2-d5fb43279272@redhat.com>
Date: Thu, 29 Dec 2022 11:44:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target
 independent
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221212075600.17408-1-thuth@redhat.com>
 <6D2F0907-4D76-4D06-9728-7F2D16A1873F@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <6D2F0907-4D76-4D06-9728-7F2D16A1873F@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 16/12/2022 15.26, Bernhard Beschow wrote:
> 
> 
> Am 12. Dezember 2022 07:56:00 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> The only reason for this code being target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
>> simple, we can easily move them into a new, separate file (apic_irqcount.c)
>> which will always be compiled and linked if either APIC or the mc146818 device
>> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
>> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
>> that the code only gets compiled once for all targets.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it
>>
>> include/hw/i386/apic.h          |  2 ++
>> include/hw/i386/apic_internal.h |  2 --
>> include/hw/rtc/mc146818rtc.h    |  1 +
>> hw/intc/apic_common.c           | 27 -----------------
>> hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>> hw/rtc/mc146818rtc.c            | 25 +++++-----------
>> hw/intc/meson.build             |  6 +++-
>> hw/rtc/meson.build              |  3 +-
>> 8 files changed, 69 insertions(+), 50 deletions(-)
>> create mode 100644 hw/intc/apic_irqcount.c
[...]
>> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>> index 1ebb412479..d524dc02c2 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -43,11 +43,7 @@
>> #include "qapi/qapi-events-misc.h"
>> #include "qapi/visitor.h"
>> #include "hw/rtc/mc146818rtc_regs.h"
>> -
>> -#ifdef TARGET_I386
>> -#include "qapi/qapi-commands-misc-target.h"
>> #include "hw/i386/apic.h"
>> -#endif
>>
>> //#define DEBUG_CMOS
>> //#define DEBUG_COALESCED
>> @@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>> static QLIST_HEAD(, RTCState) rtc_devices =
>>      QLIST_HEAD_INITIALIZER(rtc_devices);
>>
>> -#ifdef TARGET_I386
>> void qmp_rtc_reset_reinjection(Error **errp)
>> {
>>      RTCState *s;
>> @@ -145,13 +140,6 @@ static void rtc_coalesced_timer(void *opaque)
>>
>>      rtc_coalesced_timer_update(s);
>> }
>> -#else
>> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
>> -{
>> -    assert(0);
>> -    return false;
>> -}
>> -#endif
>>
>> static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>> {
>> @@ -922,14 +910,15 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
>>      rtc_set_date_from_host(isadev);
>>
>>      switch (s->lost_tick_policy) {
>> -#ifdef TARGET_I386
>> -    case LOST_TICK_POLICY_SLEW:
>> -        s->coalesced_timer =
>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>> -        break;
>> -#endif
>>      case LOST_TICK_POLICY_DISCARD:
>>          break;
>> +    case LOST_TICK_POLICY_SLEW:
>> +        /* Slew tick policy is only available if the machine has an APIC */
>> +        if (object_resolve_path_type("", TYPE_APIC_COMMON, NULL) != NULL) {
> 
> This looks like an attempt to fish out x86 machines to preserve behavior. Does this also work for PIC-only x86 machines such as -M isapc?

Drat, I think you might be right. Looks like the slew code might be usable 
via hw/i386/kvm/i8259.c on isapc, too... I guess I have to replace this with 
a more generic check for x86 instead...

Thanks for pointing this out, I'll try to come up with a v4!

  Thomas


