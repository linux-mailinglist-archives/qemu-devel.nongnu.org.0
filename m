Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD726A61AD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7le-00038o-S7; Tue, 28 Feb 2023 16:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7lc-00037Q-2i
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7lZ-0001ke-Gf
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:44:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677620646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itI8N/z7bPFQsN1bpTpP6oHEPYQCrhlDqYSDEBMkO/k=;
 b=cpYTA2y/nB1+9JIG+7xWOW2qdlV73y2EV6ZpBNZwAlaYQupDVy3ZmRq5S93Ex8EplT7hnR
 hwsI5m51qELCO3nqad5RcwoXylXQh7BKuVGWfU7cwSCR4t3qygH20mTlQCDKANfe878kHK
 lu3aWJFIqO3PYEPByNiSvPgXJy+ayrI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-m7iSB_GLMy6fUZgN_BgF1g-1; Tue, 28 Feb 2023 16:44:05 -0500
X-MC-Unique: m7iSB_GLMy6fUZgN_BgF1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so7481782wml.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677620644;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=itI8N/z7bPFQsN1bpTpP6oHEPYQCrhlDqYSDEBMkO/k=;
 b=6v+Q8RlGaqB17u99j1gOXMWOkxjEDoG15hqv6z1h2MlUEd5sQtn9eVpZTFrPrNt22l
 2cheaelrn023NzsYPVYSkPQjCOra7ctUCk2+IL3sjPRdx05EYnqeEH7PiFiSWDYgySo+
 w6cITq6+76dkRvu4gGEcop7OTujjOY65pfW8pPn6vdDqwuQwqu1XURrgDxNtkKLxcpHw
 W4y608ehyDjyorfHTtwHjfn1UVZ7Ldgo+wkxcg9bprnlOkZ2k4pYEG6XxPfHqJJmYBoQ
 9nn3Oldnm8eGOtMNzhOWuxeaiLAQRxOA1Vcde+dfbwhb9QH9lNi91BLwWhauuziMupEH
 ViGw==
X-Gm-Message-State: AO0yUKXPwvbgfCW8TOu05BCrKDgmv6plwlQAkY7ZagB+4wSHGJom+XsV
 G6IrOTUDxHtj8cPpzXSzUTubpon/9R6PTYxvBn+qGb+kwz1fDv+B7ePiJPELXUEvdSGajIdPcnf
 rzNi5hG1nXMxOChE=
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id
 y2-20020adffa42000000b002c89cfe9e29mr2893264wrr.38.1677620643905; 
 Tue, 28 Feb 2023 13:44:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+cbxBNmXcVJmwaVezIxlyf6UZdsssjGp9toy/YE47Qj5t5euFy6gBBRQ9bYm6T5YFh0LMK3w==
X-Received: by 2002:adf:fa42:0:b0:2c8:9cfe:9e29 with SMTP id
 y2-20020adffa42000000b002c89cfe9e29mr2893251wrr.38.1677620643585; 
 Tue, 28 Feb 2023 13:44:03 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b002c7163660a9sm11073515wrs.105.2023.02.28.13.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:44:02 -0800 (PST)
Date: Tue, 28 Feb 2023 16:43:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 2/3] hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as
 'container'
Message-ID: <20230228164123-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203163021.35754-3-philmd@linaro.org>
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

On Fri, Feb 03, 2023 at 05:30:20PM +0100, Philippe Mathieu-Daudé wrote:
> No logical change, rename for clarity.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Can't say container is clearer. If we are changing things
I'd like to see a real improvement.

> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
>  hw/acpi/cpu_hotplug.c           | 10 +++++-----
>  hw/acpi/piix4.c                 | 10 +++++-----
>  include/hw/acpi/cpu_hotplug.h   |  2 +-
>  4 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index b590ad57e1..cbd7a6ec00 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>      return;
>  }
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      return;
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 3cfa4f45dc..636e985c50 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -81,14 +81,14 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>  }
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      CPUState *cpu;
>  
>      memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
>                            gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
> -    memory_region_add_subregion(parent, base, &gpe->io);
> +    memory_region_add_subregion(container, base, &gpe->io);
>      gpe->device = owner;
>  
>      CPU_FOREACH(cpu) {
> @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port)
>  {
> -    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
> +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
>  
> -    memory_region_del_subregion(parent, &gpe->io);
> -    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
> +    memory_region_del_subregion(container, &gpe->io);
> +    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
>  }
>  
>  void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index c702d83f27..5595fe5be5 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -555,15 +555,15 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
>      s->cpu_hotplug_legacy = value;
>  }
>  
> -static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> +static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
>                                             PCIBus *bus, PIIX4PMState *s)
>  {
>      memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
>                            "acpi-gpe0", GPE_LEN);
> -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> +    memory_region_add_subregion(container, GPE_BASE, &s->io_gpe);
>  
>      if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
> -        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> +        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, container,
>                          s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
>      }
>  
> @@ -571,11 +571,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
>      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>                               piix4_get_cpu_hotplug_legacy,
>                               piix4_set_cpu_hotplug_legacy);
> -    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
> +    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
>                                   PIIX4_CPU_HOTPLUG_IO_BASE);
>  
>      if (s->acpi_memory_hotplug.is_enabled) {
> -        acpi_memory_hotplug_init(parent, OBJECT(s), &s->acpi_memory_hotplug,
> +        acpi_memory_hotplug_init(container, OBJECT(s), &s->acpi_memory_hotplug,
>                                   ACPI_MEMORY_HOTPLUG_BASE);
>      }
>  }
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 99c11b7151..5ff24ec417 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
>  void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>                               DeviceState *dev, Error **errp);
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
>                                    AcpiCpuHotplug *gpe, uint16_t base);
>  
>  void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> -- 
> 2.38.1


