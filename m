Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D96A61BD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:50:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7qR-0005c3-G6; Tue, 28 Feb 2023 16:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7qL-0005bn-SL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:49:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7qJ-0002m7-TY
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:49:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677620943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ALinEJYxaU6iqoXJvQ/IuOqFWm3lQG0kir3t3kA+exk=;
 b=M10lQRiLCbYmleSm/3VwhxCWB1W3qcn+cWfo9xDE2ym2Qz73LTpmXcefW1GSEqofVM28Gy
 yoSQXIaL3kqaHcMQhmO0lO06kfKFmiYx7yvlb3kaWHY9gtHw/UNXo4VXXXGhaEnjQ7XeWR
 X77p9hD5zqjR2Vhn43H61Xr0CrjLwf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-3rQy39xvMIGr2G-eHu46Yg-1; Tue, 28 Feb 2023 16:49:01 -0500
X-MC-Unique: 3rQy39xvMIGr2G-eHu46Yg-1
Received: by mail-wm1-f71.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so4110153wmj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677620939;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ALinEJYxaU6iqoXJvQ/IuOqFWm3lQG0kir3t3kA+exk=;
 b=1cH32dlZGnj+cPxuSL605e51+1Xu4ZdaqjU31sjyt1soPaaBSMh7rlcMKwOdEobt03
 eWDkDEuBRW/OdpEjNDnDNoL1B0v90dGwZsiqKWgDkOccXJSLTURZM5Ut0a0mBMsuWjWe
 0/ivvPNKj4sNcmMlWAtkZtzDBv6843jpHedbJpsTzp3ztAniLy1+jPdE6oXAmuXhr7dB
 +zbulPCIRUPQ0LxMttuh5eNvnuutDzelfdYgxIjhd2ST+AlKPZxkVygQ2JwhHbDPMGAL
 TpNZDmlJ5K1RhV0htBfzrMoIdQ03heh9+i3l2mj2tySbwWmQZXeiI0P3/vHyHLDIEWiS
 hdag==
X-Gm-Message-State: AO0yUKW23tinUuQ+ekEa7dDsl26PY8iYF6GUwWoVt21t+2wXEhLeutxo
 tdq/JsaI85bSA81LP9/5InhROANxk/nOf1GRlNxWhCepOSvgB0Cmjf1anwjg7u4VG24U4MMU/M6
 HDL/tYczO67NcWHU=
X-Received: by 2002:a5d:5e82:0:b0:2c5:51a5:9ef8 with SMTP id
 ck2-20020a5d5e82000000b002c551a59ef8mr10440542wrb.8.1677620939715; 
 Tue, 28 Feb 2023 13:48:59 -0800 (PST)
X-Google-Smtp-Source: AK7set+ZtvXvbz1uOHj0M9ivStjq8KArr3BvDzRmuUmn1I2pdBPLYGuSOEp7dx4SCTG6taG3hDDcRQ==
X-Received: by 2002:a5d:5e82:0:b0:2c5:51a5:9ef8 with SMTP id
 ck2-20020a5d5e82000000b002c551a59ef8mr10440528wrb.8.1677620939277; 
 Tue, 28 Feb 2023 13:48:59 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 a2-20020a05600c348200b003e8f0334db8sm17642615wmq.5.2023.02.28.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:48:58 -0800 (PST)
Date: Tue, 28 Feb 2023 16:48:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 1/3] hw/acpi/cpu_hotplug: Rename gpe_cpu -> gpe
Message-ID: <20230228164455-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203163021.35754-2-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Feb 03, 2023 at 05:30:19PM +0100, Philippe Mathieu-Daudé wrote:
> Rename 'g' and 'gpe_cpu' variables as 'gpe' to simplify.
> No logical change.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c |  6 ++---
>  hw/acpi/cpu_hotplug.c           | 40 ++++++++++++++++-----------------
>  hw/acpi/ich9.c                  |  8 +++----
>  hw/acpi/piix4.c                 |  6 ++---
>  include/hw/acpi/cpu_hotplug.h   |  8 +++----
>  include/hw/acpi/ich9.h          |  2 +-
>  include/hw/acpi/piix4.h         |  2 +-
>  7 files changed, 36 insertions(+), 36 deletions(-)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index 3fc4b14c26..b590ad57e1 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -6,7 +6,7 @@
>  /* Following stubs are all related to ACPI cpu hotplug */
>  const VMStateDescription vmstate_cpu_hotplug;
>  
> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port)
>  {
> @@ -14,7 +14,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
>  }
>  
>  void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
> +                                  AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      return;
>  }
> @@ -31,7 +31,7 @@ void acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
>  }
>  
>  void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
> +                             AcpiCpuHotplug *gpe, DeviceState *dev, Error **errp)
>  {
>      return;
>  }


just a stub here it does not matter at all.

> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index ff14c3f410..3cfa4f45dc 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -26,8 +26,8 @@
>  
>  static uint64_t cpu_status_read(void *opaque, hwaddr addr, unsigned int size)
>  {
> -    AcpiCpuHotplug *cpus = opaque;
> -    uint64_t val = cpus->sts[addr];
> +    AcpiCpuHotplug *gpe = opaque;
> +    uint64_t val = gpe->sts[addr];
>  
>      return val;
>  }
> @@ -40,8 +40,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
>         mode by writing 0 at the beginning of legacy CPU bitmap
>       */
>      if (addr == 0 && data == 0) {
> -        AcpiCpuHotplug *cpus = opaque;
> -        object_property_set_bool(cpus->device, "cpu-hotplug-legacy", false,
> +        AcpiCpuHotplug *gpe = opaque;
> +        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>                                   &error_abort);
>      }
>  }
> @@ -59,51 +59,51 @@ static const MemoryRegionOps AcpiCpuHotplug_ops = {
>      },
>  };
>  
> -static void acpi_set_cpu_present_bit(AcpiCpuHotplug *g, CPUState *cpu)
> +static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
>  {
>      CPUClass *k = CPU_GET_CLASS(cpu);
>      int64_t cpu_id;
>  
>      cpu_id = k->get_arch_id(cpu);
>      if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(g->device, "cpu-hotplug-legacy", false,
> +        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
>                                   &error_abort);
>          return;
>      }
>  
> -    g->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
> +    gpe->sts[cpu_id / 8] |= (1 << (cpu_id % 8));
>  }
>  
> -void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp)
> +void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> +                             DeviceState *dev, Error **errp)
>  {
> -    acpi_set_cpu_present_bit(g, CPU(dev));
> +    acpi_set_cpu_present_bit(gpe, CPU(dev));
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>  }
>  
>  void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base)
> +                                  AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      CPUState *cpu;
>  
> -    memory_region_init_io(&gpe_cpu->io, owner, &AcpiCpuHotplug_ops,
> -                          gpe_cpu, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
> -    memory_region_add_subregion(parent, base, &gpe_cpu->io);
> -    gpe_cpu->device = owner;
> +    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
> +                          gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
> +    memory_region_add_subregion(parent, base, &gpe->io);
> +    gpe->device = owner;
>  
>      CPU_FOREACH(cpu) {
> -        acpi_set_cpu_present_bit(gpe_cpu, cpu);
> +        acpi_set_cpu_present_bit(gpe, cpu);
>      }
>  }
>  
> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port)
>  {
> -    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe_cpu->device));
> +    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
>  
> -    memory_region_del_subregion(parent, &gpe_cpu->io);
> -    cpu_hotplug_hw_init(parent, gpe_cpu->device, cpuhp_state, io_port);
> +    memory_region_del_subregion(parent, &gpe->io);
> +    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
>  }
>  
>  void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index a93c470e9d..4f8385b894 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s = opaque;
> -    Object *obj = OBJECT(s->gpe_cpu.device);
> +    Object *obj = OBJECT(s->gpe.device);
>      object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
>      return 0;
>  }
> @@ -338,7 +338,7 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>      qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>  
>      legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
> -        OBJECT(lpc_pci), &pm->gpe_cpu, ICH9_CPU_HOTPLUG_IO_BASE);
> +        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
>  
>      if (pm->acpi_memory_hotplug.is_enabled) {
>          acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
> @@ -385,7 +385,7 @@ static void ich9_pm_set_cpu_hotplug_legacy(Object *obj, bool value,
>  
>      assert(!value);
>      if (s->pm.cpu_hotplug_legacy && value == false) {
> -        acpi_switch_to_modern_cphp(&s->pm.gpe_cpu, &s->pm.cpuhp_state,
> +        acpi_switch_to_modern_cphp(&s->pm.gpe, &s->pm.cpuhp_state,
>                                     ICH9_CPU_HOTPLUG_IO_BASE);
>      }
>      s->pm.cpu_hotplug_legacy = value;
> @@ -514,7 +514,7 @@ void ich9_pm_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
>          }
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          if (lpc->pm.cpu_hotplug_legacy) {
> -            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe_cpu, dev, errp);
> +            legacy_acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.gpe, dev, errp);
>          } else {
>              acpi_cpu_plug_cb(hotplug_dev, &lpc->pm.cpuhp_state, dev, errp);
>          }
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 724294b378..c702d83f27 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -353,7 +353,7 @@ static void piix4_device_plug_cb(HotplugHandler *hotplug_dev,
>          acpi_pcihp_device_plug_cb(hotplug_dev, &s->acpi_pci_hotplug, dev, errp);
>      } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
>          if (s->cpu_hotplug_legacy) {
> -            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe_cpu, dev, errp);
> +            legacy_acpi_cpu_plug_cb(hotplug_dev, &s->gpe, dev, errp);
>          } else {
>              acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
>          }
> @@ -549,7 +549,7 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
>  
>      assert(!value);
>      if (s->cpu_hotplug_legacy && value == false) {
> -        acpi_switch_to_modern_cphp(&s->gpe_cpu, &s->cpuhp_state,
> +        acpi_switch_to_modern_cphp(&s->gpe, &s->cpuhp_state,
>                                     PIIX4_CPU_HOTPLUG_IO_BASE);
>      }
>      s->cpu_hotplug_legacy = value;
> @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>                               piix4_get_cpu_hotplug_legacy,
>                               piix4_set_cpu_hotplug_legacy);
> -    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe_cpu,
> +    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
>                                   PIIX4_CPU_HOTPLUG_IO_BASE);
>  
>      if (s->acpi_memory_hotplug.is_enabled) {
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 3b932abbbb..99c11b7151 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -25,13 +25,13 @@ typedef struct AcpiCpuHotplug {
>      uint8_t sts[ACPI_GPE_PROC_LEN];
>  } AcpiCpuHotplug;
>  
> -void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev,
> -                             AcpiCpuHotplug *g, DeviceState *dev, Error **errp);
> +void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> +                             DeviceState *dev, Error **errp);
>  
>  void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> -                                  AcpiCpuHotplug *gpe_cpu, uint16_t base);
> +                                  AcpiCpuHotplug *gpe, uint16_t base);
>  
> -void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe_cpu,
> +void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port);
>  


I don't see how parameter names matter much.



> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index d41866a229..3ec706c0d7 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -53,7 +53,7 @@ typedef struct ICH9LPCPMRegs {
>      Notifier powerdown_notifier;
>  
>      bool cpu_hotplug_legacy;
> -    AcpiCpuHotplug gpe_cpu;
> +    AcpiCpuHotplug gpe;
>      CPUHotplugState cpuhp_state;
>  
>      bool keep_pci_slot_hpc;
> diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
> index be1f8ea80e..b88ef92455 100644
> --- a/include/hw/acpi/piix4.h
> +++ b/include/hw/acpi/piix4.h
> @@ -66,7 +66,7 @@ struct PIIX4PMState {
>      uint8_t s4_val;
>  
>      bool cpu_hotplug_legacy;
> -    AcpiCpuHotplug gpe_cpu;
> +    AcpiCpuHotplug gpe;
>      CPUHotplugState cpuhp_state;
>  
>      MemHotplugState acpi_memory_hotplug;


gpe to me reads like ACPIGPE. I think using it for AcpiCpuHotplug is
confusing.



> -- 
> 2.38.1


