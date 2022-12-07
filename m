Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09B6455A1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 09:45:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2q2P-0000u9-6s; Wed, 07 Dec 2022 03:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2q2N-0000tm-7w
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:44:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p2q2L-0007Wd-Gi
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 03:44:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670402657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8iFXFP0oIWqNIWQmNbQsSxrs6lkAYzGQL2qd0S5gsrQ=;
 b=Eq5aMhSRShyILJo3Ez9yzriN+lYVxjelwtEZ20USnm2hVoaJs7t0DPoI2ELZJ/EiuDLh3V
 14W6ci64rHWnEfWgjrhQTyHkwXD6uRV9smApC2CHiwybfhuJlDCKWPRoxAiFxD8vxJ8zyO
 WmH3ZD/aTKOCiYq3HLrCFZbHEdhWIU8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-Ad0nhXvZPA-R88IKmkxe1A-1; Wed, 07 Dec 2022 03:43:35 -0500
X-MC-Unique: Ad0nhXvZPA-R88IKmkxe1A-1
Received: by mail-wr1-f71.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so3973382wrg.12
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 00:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8iFXFP0oIWqNIWQmNbQsSxrs6lkAYzGQL2qd0S5gsrQ=;
 b=b5VoWP6yOoC6Tzwg2Bas3agtwIQiSzJSnNnnSMy3cY6tPUnbNdGgyd2JF0UwV5AshC
 Z6Cp2E3BvoGF4uN2B/dINl1bsjxIIcrMMnqIicfBVMeFF6MPFAaP/04niXhONXRM1hWN
 h7NhxW+JJ8tjSGOu7mCsxeSR+w9aJK+hbBQR/sZAP84bP9wjZ3ngVVRAJK69sHfMbq6M
 VWYawOODcYdSh5UUYr68xAvm8nBYLpJboJAVNkYVdcCGFHCZLDwmKSdudOPqWQEFW0Zd
 NZOa+vNm7m19N9j5wMw1b88w6YoRiwGgQT3OX9vFswQbALQSVOnYXNh7Csa/XM6UtYfv
 YBdg==
X-Gm-Message-State: ANoB5pm+vFzCLdqYwCU2XXN3YWuehBK+5h0DZBkmESEM+k0K8Z3SsZ2Q
 ANc2JTbDMh2prOSPhIgp9VKSMz7F0UbgjKaovdIVlkiogRPKRMhltPkIoYh/xLbqbNl/SctzMOx
 0AaEJ4ykJ7b536TI=
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id
 k3-20020adff5c3000000b002423427bb51mr16630308wrp.635.1670402613926; 
 Wed, 07 Dec 2022 00:43:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65wCyTNpPgt7xZuj3uLPBEjKynqzpYneIZTVraOArU0meCgNUEn89GFaWFUG/1ix1HVIV08g==
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id
 k3-20020adff5c3000000b002423427bb51mr16630295wrp.635.1670402613687; 
 Wed, 07 Dec 2022 00:43:33 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-155.web.vodafone.de.
 [109.43.178.155]) by smtp.gmail.com with ESMTPSA id
 p1-20020a5d68c1000000b002420fe50322sm18472730wrw.91.2022.12.07.00.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 00:43:33 -0800 (PST)
Message-ID: <1e82a59e-6c02-68c4-946b-e710d8702d53@redhat.com>
Date: Wed, 7 Dec 2022 09:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20221206200641.339116-1-thuth@redhat.com>
 <5365BEF1-658C-412D-8A95-C5E1A9A5AB7E@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-8.0] hw/rtc/mc146818rtc: Make this rtc device target
 independent
In-Reply-To: <5365BEF1-658C-412D-8A95-C5E1A9A5AB7E@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.27, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 07/12/2022 00.38, Bernhard Beschow wrote:
> 
> 
> Am 6. Dezember 2022 20:06:41 UTC schrieb Thomas Huth <thuth@redhat.com>:
>> The only code that is really, really target dependent is the apic-related
>> code in rtc_policy_slew_deliver_irq(). By moving this code into the hw/i386/
>> folder (renamed to rtc_apic_policy_slew_deliver_irq()) and passing this
>> function as parameter to mc146818_rtc_init(), we can make the RTC completely
>> target-independent.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>> include/hw/rtc/mc146818rtc.h |  7 +++++--
>> hw/alpha/dp264.c             |  2 +-
>> hw/hppa/machine.c            |  2 +-
>> hw/i386/microvm.c            |  3 ++-
>> hw/i386/pc.c                 | 10 +++++++++-
>> hw/mips/jazz.c               |  2 +-
>> hw/ppc/pnv.c                 |  2 +-
>> hw/rtc/mc146818rtc.c         | 34 +++++++++++-----------------------
>> hw/rtc/meson.build           |  3 +--
>> 9 files changed, 32 insertions(+), 33 deletions(-)
>>
>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>> index 1db0fcee92..c687953cc4 100644
>> --- a/include/hw/rtc/mc146818rtc.h
>> +++ b/include/hw/rtc/mc146818rtc.h
>> @@ -46,14 +46,17 @@ struct RTCState {
>>      Notifier clock_reset_notifier;
>>      LostTickPolicy lost_tick_policy;
>>      Notifier suspend_notifier;
>> +    bool (*policy_slew_deliver_irq)(RTCState *s);
>>      QLIST_ENTRY(RTCState) link;
>> };
>>
>> #define RTC_ISA_IRQ 8
>>
>> -ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>> -                             qemu_irq intercept_irq);
>> +ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq,
>> +                             bool (*policy_slew_deliver_irq)(RTCState *s));
>> void rtc_set_memory(ISADevice *dev, int addr, int val);
>> int rtc_get_memory(ISADevice *dev, int addr);
>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s);
>> +void qmp_rtc_reset_reinjection(Error **errp);
>>
>> #endif /* HW_RTC_MC146818RTC_H */
>> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
>> index c502c8c62a..8723942b52 100644
>> --- a/hw/alpha/dp264.c
>> +++ b/hw/alpha/dp264.c
>> @@ -118,7 +118,7 @@ static void clipper_init(MachineState *machine)
>>      qdev_connect_gpio_out(i82378_dev, 0, isa_irq);
>>
>>      /* Since we have an SRM-compatible PALcode, use the SRM epoch.  */
>> -    mc146818_rtc_init(isa_bus, 1900, rtc_irq);
>> +    mc146818_rtc_init(isa_bus, 1900, rtc_irq, NULL);
>>
>>      /* VGA setup.  Don't bother loading the bios.  */
>>      pci_vga_init(pci_bus);
>> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
>> index de1cc7ab71..311031714a 100644
>> --- a/hw/hppa/machine.c
>> +++ b/hw/hppa/machine.c
>> @@ -232,7 +232,7 @@ static void machine_hppa_init(MachineState *machine)
>>      assert(isa_bus);
>>
>>      /* Realtime clock, used by firmware for PDC_TOD call. */
>> -    mc146818_rtc_init(isa_bus, 2000, NULL);
>> +    mc146818_rtc_init(isa_bus, 2000, NULL, NULL);
>>
>>      /* Serial ports: Lasi and Dino use a 7.272727 MHz clock. */
>>      serial_mm_init(addr_space, LASI_UART_HPA + 0x800, 0,
>> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
>> index 170a331e3f..d0ed4dca50 100644
>> --- a/hw/i386/microvm.c
>> +++ b/hw/i386/microvm.c
>> @@ -267,7 +267,8 @@ static void microvm_devices_init(MicrovmMachineState *mms)
>>
>>      if (mms->rtc == ON_OFF_AUTO_ON ||
>>          (mms->rtc == ON_OFF_AUTO_AUTO && !kvm_enabled())) {
>> -        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL);
>> +        rtc_state = mc146818_rtc_init(isa_bus, 2000, NULL,
>> +                                      rtc_apic_policy_slew_deliver_irq);
>>          microvm_set_rtc(mms, rtc_state);
>>      }
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 546b703cb4..650e7bc199 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1244,6 +1244,13 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
>>      g_free(a20_line);
>> }
>>
>> +bool rtc_apic_policy_slew_deliver_irq(RTCState *s)
>> +{
>> +    apic_reset_irq_delivered();
>> +    qemu_irq_raise(s->irq);
>> +    return apic_get_irq_delivered();
>> +}
>> +
>> void pc_basic_device_init(struct PCMachineState *pcms,
>>                            ISABus *isa_bus, qemu_irq *gsi,
>>                            ISADevice **rtc_state,
>> @@ -1299,7 +1306,8 @@ void pc_basic_device_init(struct PCMachineState *pcms,
>>          pit_alt_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_PIT_INT);
>>          rtc_irq = qdev_get_gpio_in(hpet, HPET_LEGACY_RTC_INT);
>>      }
>> -    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq);
>> +    *rtc_state = mc146818_rtc_init(isa_bus, 2000, rtc_irq,
>> +                                   rtc_apic_policy_slew_deliver_irq);
> 
> In my PIIX consolidation series [1] I'm instantiating the RTC in the south bridges since embedding the struct in the host device is the preferred new way. In the end there is one initialization shared by both PIIX3 and -4. While PIIX3 (PC) will require rtc_apic_policy_slew_deliver_irq, PIIX4 (Malta) won't. Furthermore, my goal ist to reuse PIIX4 in the PC machine to eliminate today's Frankenstein PIIX4 ACPI controller. Any idea how to solve this?

I assume that you could ignore this in the shared initialization code and 
just add the pointer in the code that sets up the x86 boards. It's a little 
bit ugly [*], but RTCState is public in
include/hw/rtc/mc146818rtc.h, so it should be doable.

  Thomas


[*] Well, that whole driftfix=slew thing is ugly. I'm also not very familiar 
with it and don't know whether this is still in wide use ... does anybody 
know? Otherwise, we could could maybe also deprecate and finally remove that 
driftfix=slew stuff?


