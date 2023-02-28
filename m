Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9D36A6264
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:27:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8QM-0008G3-PA; Tue, 28 Feb 2023 17:26:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8QJ-0008Fg-Sd
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:26:16 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8QH-000298-Lf
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:26:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so10637904wmb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677623171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9YCOHBTEPboLxNtfdZ7kNv9PpZdOeoLQQ3vXosCGDb8=;
 b=UvceLYbABKDQ3Tygymj6xMfanOZLxv/j+DA+beBQw74QQCdeaoPjirmVD1VXuLHvNZ
 ggKr2upQBTjKk9xg4DUi9xBvoClxbolwmOnOeGWlYCJUHBTIGRfHDZFVnarQSzA3Bomo
 yNP3EvNT9tMmfQ2Dz+Xo7yFhzSCNV2XjrlaTkiOsexRDNM5o3p0117sgxHgtt5kJFanb
 agSqxCOTquY+mAVA903LXRVsS9TkJWCRnPz3LmeGKxAOkOCnsO+JTPu0Ja7u12x9TyDO
 Z07KQCyNpmrMZZSBpED3uwihTL3bdDjOPcQmL1HaWLV4XmUrwr3porVSj005I9/Txr/A
 dBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677623171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9YCOHBTEPboLxNtfdZ7kNv9PpZdOeoLQQ3vXosCGDb8=;
 b=Cs12IjHQGqA0KZveFaMu9sYVKUWcv8xIGi3eE7FVq+pk3EXwzA+kxwH0kHi9YjO9ns
 /cIfsgQuMvbm5IujYS6Ixlx4R+Q9WHdlMCFJFYxde2Ye2fcqUPxj983Mw6wM0AjWW2hR
 BWLZ27YKPPHjaYy4GyP0gJNC5nygjWe8se00J0dSoncplSmf58avg/moCnodkKVECdO0
 8b4EjLnkVJHITVHAQRUdGVuZCqPgL+OUQS5V1AMpKAjVaJk4g0LuzgC4GQZMuRTVb5ws
 lInCj4kdpVaJ9mJWLeJf64ckEPj3nDcScZ2oYVp7mnNswwR3ZSI7Ctf27+tQbwnCcGDX
 6KBA==
X-Gm-Message-State: AO0yUKX5CQhJFldBlAHRPkvTekoNR1AKhFR8lOa+DMadCwrx0esXh8OT
 kVwWNk6Pld4c1lEb5eVdDpg00Q==
X-Google-Smtp-Source: AK7set82HYbRXNf5Y7VxNtHKkEsRlL86ybR/7QWCqoW+Ndx4/Z4yKl+RHZJJWTQ696ojS8pcURDhAg==
X-Received: by 2002:a05:600c:43d4:b0:3eb:37ce:4c3d with SMTP id
 f20-20020a05600c43d400b003eb37ce4c3dmr3373059wmn.38.1677623171604; 
 Tue, 28 Feb 2023 14:26:11 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c441a00b003e21638c0edsm14215336wmn.45.2023.02.28.14.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:26:11 -0800 (PST)
Message-ID: <0fb75305-72ec-4fca-8add-0d73d6fe03b5@linaro.org>
Date: Tue, 28 Feb 2023 23:26:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-2-philmd@linaro.org>
 <20230228164455-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228164455-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 28/2/23 22:48, Michael S. Tsirkin wrote:
> On Fri, Feb 03, 2023 at 05:30:19PM +0100, Philippe Mathieu-Daudé wrote:
>> Rename 'g' and 'gpe_cpu' variables as 'gpe' to simplify.
>> No logical change.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/acpi/acpi-cpu-hotplug-stub.c |  6 ++---
>>   hw/acpi/cpu_hotplug.c           | 40 ++++++++++++++++-----------------
>>   hw/acpi/ich9.c                  |  8 +++----
>>   hw/acpi/piix4.c                 |  6 ++---
>>   include/hw/acpi/cpu_hotplug.h   |  8 +++----
>>   include/hw/acpi/ich9.h          |  2 +-
>>   include/hw/acpi/piix4.h         |  2 +-
>>   7 files changed, 36 insertions(+), 36 deletions(-)
>>
>> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
>> index 3fc4b14c26..b590ad57e1 100644
>> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>> @@ -6,7 +6,7 @@
>>   /* Following stubs are all related to ACPI cpu hotplug */
>>   const VMStateDescription vmstate_cpu_hotplug;
>>   
>> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
>> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>                                   CPUHotplugState *cpuhp_state,
>>                                   uint16_t io_port)
>>   {
>> @@ -14,7 +14,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
>>   }
>>   
>>   void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
>> +                                  AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       return;
>>   }
>> @@ -31,7 +31,7 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>>   }
>>   
>>   void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
>> +                             AcpiCpuHotplug *gpe, DeviceState *dev, Error **errp)
>>   {
>>       return;
>>   }
> 
> 
> just a stub here it does not matter at all.

I kept it consistent with the prototype renamed in the header.

Safe to assume you don't mind if I rename s/hotplug_dev/cow/ 
s/errp/success/ s/gpe/cpu/ s/dev/cat/ here. /s

>> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
>> index ff14c3f410..3cfa4f45dc 100644
>> --- a/hw/acpi/cpu_hotplug.c
>> +++ b/hw/acpi/cpu_hotplug.c
>> @@ -26,8 +26,8 @@
>>   
>>   static uint64_t cpu_status_read(void *opaque, hwaddr addr, unsigned int size)
>>   {
>> -    AcpiCpuHotplug *cpus = opaque;
>> -    uint64_t val = cpus->sts[addr];
>> +    AcpiCpuHotplug *gpe = opaque;
>> +    uint64_t val = gpe->sts[addr];
>>   
>>       return val;
>>   }
>> @@ -40,8 +40,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
>>          mode by writing 0 at the beginning of legacy CPU bitmap
>>        */
>>       if (addr == 0 && data == 0) {
>> -        AcpiCpuHotplug *cpus = opaque;
>> -        object_property_set_bool(cpus->device, "cpu-hotplug-legacy", false,
>> +        AcpiCpuHotplug *gpe = opaque;
>> +        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>>                                    &error_abort);
>>       }
>>   }
>> @@ -59,51 +59,51 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>>       },
>>   };
>>   
>> -static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu)
>> +static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
>>   {
>>       CPUClass *k = CPU_GET_CLASS(cpu);
>>       int64_t cpu_id;
>>   
>>       cpu_id = k->get_arch_id(cpu);
>>       if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
>> -        object_property_set_bool(g->device, "cpu-hotplug-legacy", false,
>> +        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>>                                    &error_abort);
>>           return;
>>       }
>>   
>> -    g->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
>> +    gpe->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
>>   }
>>   
>> -void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
>> +void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>> +                             DeviceState *dev, Error **errp)
>>   {
>> -    acpi_set_cpu_present_bit(g, CPU(dev));
>> +    acpi_set_cpu_present_bit(gpe, CPU(dev));
>>       acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>>   }
>>   
>>   void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
>> +                                  AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       CPUState *cpu;
>>   
>> -    memory_region_init_io(&gpe_cpu->io, owner, &AcpiCpuHotplug_ops,
>> -                          gpe_cpu, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>> -    memory_region_add_subregion(parent, base, &gpe_cpu->io);
>> -    gpe_cpu->device = owner;
>> +    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
>> +                          gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>> +    memory_region_add_subregion(parent, base, &gpe->io);
>> +    gpe->device = owner;
>>   
>>       CPU_FOREACH(cpu) {
>> -        acpi_set_cpu_present_bit(gpe_cpu, cpu);
>> +        acpi_set_cpu_present_bit(gpe, cpu);
>>       }
>>   }
>>   
>> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
>> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>                                   CPUHotplugState *cpuhp_state,
>>                                   uint16_t io_port)
>>   {
>> -    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe_cpu->device));
>> +    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
>>   
>> -    memory_region_del_subregion(parent, &gpe_cpu->io);
>> -    cpu_hotplug_hw_init(parent, gpe_cpu->device, cpuhp_state, io_port);
>> +    memory_region_del_subregion(parent, &gpe->io);
>> +    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
>>   }
>>   
>>   void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
>> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
>> index a93c470e9d..4f8385b894 100644
>> --- a/hw/acpi/ich9.c
>> +++ b/hw/acpi/ich9.c
>> @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>>   static int vmstate_cpuhp_pre_load(void *opaque)
>>   {
>>       ICH9LPCPMRegs *s = opaque;
>> -    Object *obj = OBJECT(s->gpe_cpu.device);
>> +    Object *obj = OBJECT(s->gpe.device);
>>       object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
>>       return 0;
>>   }
>> @@ -338,7 +338,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>>       qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>>   
>>       legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
>> -        OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
>> +        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
>>   
>>       if (pm->acpi_memory_hotplug.is_enabled) {
>>           acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
>> @@ -385,7 +385,7 @@ static void ich9_pm_set_cpu_hotplug_legacy(Object *obj, bool value,
>>   
>>       assert(!value);
>>       if (s->pm.cpu_hotplug_legacy && value == false) {
>> -        acpi_switch_to_modern_cphp(&s->pm.gpe_cpu, &s->pm.cpuhp_state,
>> +        acpi_switch_to_modern_cphp(&s->pm.gpe, &s->pm.cpuhp_state,
>>                                      ICH9_CPU_HOTPLUG_IO_BASE);
>>       }
>>       s->pm.cpu_hotplug_legacy = value;
>> @@ -514,7 +514,7 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>>           }
>>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>>           if (lpc->pm.cpu_hotplug_legacy) {
>> -            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe_cpu, dev, errp);
>> +            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe, dev, errp);
>>           } else {
>>               acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
>>           }
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index 724294b378..c702d83f27 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -353,7 +353,7 @@ static void piix4_device_plug_cb(HotplugHandler *hotplug_dev,
>>           acpi_pcihp_device_plug_cb(hotplug_dev, &s->acpi_pci_hotplug, dev, errp);
>>       } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>>           if (s->cpu_hotplug_legacy) {
>> -            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe_cpu, dev, errp);
>> +            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe, dev, errp);
>>           } else {
>>               acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>>           }
>> @@ -549,7 +549,7 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
>>   
>>       assert(!value);
>>       if (s->cpu_hotplug_legacy && value == false) {
>> -        acpi_switch_to_modern_cphp(&s->gpe_cpu, &s->cpuhp_state,
>> +        acpi_switch_to_modern_cphp(&s->gpe, &s->cpuhp_state,
>>                                      PIIX4_CPU_HOTPLUG_IO_BASE);
>>       }
>>       s->cpu_hotplug_legacy = value;
>> @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>>       object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>>                                piix4_get_cpu_hotplug_legacy,
>>                                piix4_set_cpu_hotplug_legacy);
>> -    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe_cpu,
>> +    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
>>                                    PIIX4_CPU_HOTPLUG_IO_BASE);
>>   
>>       if (s->acpi_memory_hotplug.is_enabled) {
>> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
>> index 3b932abbbb..99c11b7151 100644
>> --- a/include/hw/acpi/cpu_hotplug.h
>> +++ b/include/hw/acpi/cpu_hotplug.h
>> @@ -25,13 +25,13 @@ typedef struct AcpiCpuHotplug {
>>       uint8_t sts[ACPI_GPE_PROC_LEN];
>>   } AcpiCpuHotplug;
>>   
>> -void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp);
>> +void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>> +                             DeviceState *dev, Error **errp);
>>   
>>   void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base);
>> +                                  AcpiCpuHotplug *gpe, uint16_t base);
>>   
>> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
>> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>                                   CPUHotplugState *cpuhp_state,
>>                                   uint16_t io_port);
>>   
> 
> 
> I don't see how parameter names matter much.

'gpe' is slightly more meaningful than 'g'. Why not name 
s/hotplug_dev/h/, s/errp/e/, or actually, why do we name variables
in prototype? \s

>> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
>> index d41866a229..3ec706c0d7 100644
>> --- a/include/hw/acpi/ich9.h
>> +++ b/include/hw/acpi/ich9.h
>> @@ -53,7 +53,7 @@ typedef struct ICH9LPCPMRegs {
>>       Notifier powerdown_notifier;
>>   
>>       bool cpu_hotplug_legacy;
>> -    AcpiCpuHotplug gpe_cpu;
>> +    AcpiCpuHotplug gpe;
>>       CPUHotplugState cpuhp_state;
>>   
>>       bool keep_pci_slot_hpc;
>> diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
>> index be1f8ea80e..b88ef92455 100644
>> --- a/include/hw/acpi/piix4.h
>> +++ b/include/hw/acpi/piix4.h
>> @@ -66,7 +66,7 @@ struct PIIX4PMState {
>>       uint8_t s4_val;
>>   
>>       bool cpu_hotplug_legacy;
>> -    AcpiCpuHotplug gpe_cpu;
>> +    AcpiCpuHotplug gpe;
>>       CPUHotplugState cpuhp_state;
>>   
>>       MemHotplugState acpi_memory_hotplug;
> 
> 
> gpe to me reads like ACPIGPE. I think using it for AcpiCpuHotplug is
> confusing.

SIGPIPE?

Anyway I'm glad these prototypes are maintained, let's keep them as
their maintainer like to see them, even if it is opaque to neophytes.

Dropping this series and stopping trying to improve / clarify the API
on your subsystem, I'm just wasting both your / mine time, and that
is certainly not what I aimed at first.

