Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256296A6242
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:17:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8HI-0000rg-G0; Tue, 28 Feb 2023 17:16:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8HG-0000qp-7X
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:16:54 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8HD-00007m-Fx
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:16:53 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l25so11351168wrb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677622610;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YcGlOy6d+YJ6uPn4TPoxXOLWH/geCaSw6qAp+kfaDHs=;
 b=TmQ4VbDhLjNY3N8adrrxGF/RjZS9fdrHnLJ2oDzULCK6tCJnfqWbJthdcJ+nbj053M
 QbM9jNKZm3s7veFDFUk47IXQBrNfg0f41huLSrpDhOYeR3zc80AuAELBTwSRnXS61fhy
 OyHYm+mgBAaI25H/PtIgNWTnEumHv4uUJ7DZG5FjI0nWznDiZ570S4YEWhbISenevtop
 SrBNgKfyMSIoPiHDTVjRyCUaUGRYDioMEQhSNJcJ8YkXx05hfYaM/AYqRT5A1taTWqUN
 xfpEUS32iYcmfUOa0gP+t0lhVYtqplgvxGhRVtKQWEoMyT4x9L4X33kn73CxzoiCvAib
 aJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622610;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcGlOy6d+YJ6uPn4TPoxXOLWH/geCaSw6qAp+kfaDHs=;
 b=6pmruFpSoAjVKA1fV5L2hDTCCyJqLiptTsdqD9WYIaGuTHrPdP4i9IyHiPTZ4c9nmu
 /TMzITyuDcSVK2TxpEJJIdFkRAYuyHBmzmIK5X/kLRt27YR2NwR19Xgydf4XQ51w4hyl
 LtGBJ6QGNYaavyJP/Ye7yUy5DIGg92AAL+QXyddepMTBlJ203N/0vxRG5hpNC/0yby05
 SfgC0C8Vvgcta7TA3SBZxakM8+TfPhqD4I8td2gssgSX6O/rvk4AOkGV7a+t8xXF5HZx
 368MJ4Y3dijVzlYTsMosUeBhCLrc0tprdUaG+xa3xaXt2ONPUw76VxvlIbnzuh2kIurb
 vhaA==
X-Gm-Message-State: AO0yUKWiwG1hbd3HPswxv5/fRY9Uo/MSA1uiPXHl75utr1V4oMRmqyt5
 AiHT0yQ67mnmTgFOVDrPvMAxfg==
X-Google-Smtp-Source: AK7set8ZFjkTwvDOGr75vUGF/vJBhOPpxmeb3P9vhff6haJJxS2YI4DfQs69x23iAP62l1H2lNeAuw==
X-Received: by 2002:a05:6000:1a43:b0:2c7:ca2:1a28 with SMTP id
 t3-20020a0560001a4300b002c70ca21a28mr3034763wry.68.1677622609825; 
 Tue, 28 Feb 2023 14:16:49 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d4083000000b002c5a790e959sm10926847wrp.19.2023.02.28.14.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:16:49 -0800 (PST)
Message-ID: <089b255a-384d-55f4-2868-0f24dd2588ec@linaro.org>
Date: Tue, 28 Feb 2023 23:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as
 'container'
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-3-philmd@linaro.org>
 <20230228164123-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228164123-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 28/2/23 22:43, Michael S. Tsirkin wrote:
> On Fri, Feb 03, 2023 at 05:30:20PM +0100, Philippe Mathieu-Daudé wrote:
>> No logical change, rename for clarity.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Can't say container is clearer. If we are changing things
> I'd like to see a real improvement.

QOM API usually use 'parent' to indicate the inheritance / hierarchy
between object.
Memory API uses 'container', in particular when used with
memory_region_add_subregion().

I still believe this is a worthwhile change as API style cleanup,
but I agree the commit description lacks this explanation.

>> ---
>>   hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
>>   hw/acpi/cpu_hotplug.c           | 10 +++++-----
>>   hw/acpi/piix4.c                 | 10 +++++-----
>>   include/hw/acpi/cpu_hotplug.h   |  2 +-
>>   4 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
>> index b590ad57e1..cbd7a6ec00 100644
>> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
>> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
>> @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>       return;
>>   }
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>>                                     AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       return;
>> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
>> index 3cfa4f45dc..636e985c50 100644
>> --- a/hw/acpi/cpu_hotplug.c
>> +++ b/hw/acpi/cpu_hotplug.c
>> @@ -81,14 +81,14 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>>       acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>>   }
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>>                                     AcpiCpuHotplug *gpe, uint16_t base)
>>   {
>>       CPUState *cpu;
>>   
>>       memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
>>                             gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>> -    memory_region_add_subregion(parent, base, &gpe->io);
>> +    memory_region_add_subregion(container, base, &gpe->io);
>>       gpe->device = owner;
>>   
>>       CPU_FOREACH(cpu) {
>> @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>>                                   CPUHotplugState *cpuhp_state,
>>                                   uint16_t io_port)
>>   {
>> -    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
>> +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
>>   
>> -    memory_region_del_subregion(parent, &gpe->io);
>> -    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
>> +    memory_region_del_subregion(container, &gpe->io);
>> +    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
>>   }
>>   
>>   void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index c702d83f27..5595fe5be5 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -555,15 +555,15 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
>>       s->cpu_hotplug_legacy = value;
>>   }
>>   
>> -static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>> +static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
>>                                              PCIBus *bus, PIIX4PMState *s)
>>   {
>>       memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
>>                             "acpi-gpe0", GPE_LEN);
>> -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
>> +    memory_region_add_subregion(container, GPE_BASE, &s->io_gpe);
>>   
>>       if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
>> -        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
>> +        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, container,
>>                           s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
>>       }
>>   
>> @@ -571,11 +571,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>>       object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>>                                piix4_get_cpu_hotplug_legacy,
>>                                piix4_set_cpu_hotplug_legacy);
>> -    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
>> +    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
>>                                    PIIX4_CPU_HOTPLUG_IO_BASE);
>>   
>>       if (s->acpi_memory_hotplug.is_enabled) {
>> -        acpi_memory_hotplug_init(parent, OBJECT(s), &s->acpi_memory_hotplug,
>> +        acpi_memory_hotplug_init(container, OBJECT(s), &s->acpi_memory_hotplug,
>>                                    ACPI_MEMORY_HOTPLUG_BASE);
>>       }
>>   }
>> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
>> index 99c11b7151..5ff24ec417 100644
>> --- a/include/hw/acpi/cpu_hotplug.h
>> +++ b/include/hw/acpi/cpu_hotplug.h
>> @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
>>   void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>>                                DeviceState *dev, Error **errp);
>>   
>> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
>> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>>                                     AcpiCpuHotplug *gpe, uint16_t base);
>>   
>>   void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>> -- 
>> 2.38.1
> 


