Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9284F6A61A7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 22:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX7in-0003Zh-RA; Tue, 28 Feb 2023 16:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7ij-0003W9-H7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:41:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX7ih-0001D2-03
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 16:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677620468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gk6RWWiIack08br5azkdmBsomLAV+wCbqi4VBKWw8ZA=;
 b=exPRcdHKxxfU1BFUc4MNy2lt0ApnZrXEFdT0hDCZGUz7sGhHlei5XeEHRYr3o/NpEfRyDH
 +BouweYKn5YY+W8Uhxn/fJsnxIkTbW+9w4cmqnNQvcVxSv1MI8uVygHvb7nT8P9qynx7b4
 Ssk8XW2BgrII6FxeNY5yEDldg1sIgC0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-272-4HPxx1i4PWq-bwp5dwPeNw-1; Tue, 28 Feb 2023 16:41:06 -0500
X-MC-Unique: 4HPxx1i4PWq-bwp5dwPeNw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bi21-20020a05600c3d9500b003e836e354e0so4741038wmb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 13:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677620465;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gk6RWWiIack08br5azkdmBsomLAV+wCbqi4VBKWw8ZA=;
 b=T7YIvUUSge9aIw5lCLMMDsN6IFGz+A02h8oJv4BQS0IsFDrL4oUex37CO7KHO0EY1F
 VGCgEFwJwyq2PTK316b5+cgSUT+2Kn1LwzdXhW3Cm547zX6T67ZaQRPFtcH1VLofbOGY
 MWJrgD7bdwqAuV1HW2j6x8Gi5VwEti+RQPN7qzGPVLI6Y2xUPybXBpbxDKAQawO1BHF1
 TKeq8fyo7LIoUCnyahzc7PAhx+rtBMZ/zU20ys7gEDLNoXY0PFaL8xSNB9foo0RBYrNe
 MLsRf8UCiAv4cJxrvDa+XmhO/8CA4IqSJmraFLgHcZuY3DJww5U2SxAgCjALSrBeRuzk
 5/Eg==
X-Gm-Message-State: AO0yUKXLpdjX3PLoC4VHXjX0hqBEyPXwJZVJ0XYTcIle8sVWR18E4UFu
 jXpIr0PE9JjtVx89Snx4Lo5Kq8kB3D9j1mBj4uW43SW5DgGuYSh8RGFlH8w9Xlxk9qLEguJfaiq
 /DNR0E5jsEmXNw0I=
X-Received: by 2002:a05:600c:4d24:b0:3eb:3986:9bfc with SMTP id
 u36-20020a05600c4d2400b003eb39869bfcmr3281630wmp.37.1677620465309; 
 Tue, 28 Feb 2023 13:41:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8ZClnVWFM9lykZe3MaHIeJdYgbYGaBF4knTkD9icyXs4OOrvyK9TegRLutvwhdizT9ZYbRVw==
X-Received: by 2002:a05:600c:4d24:b0:3eb:3986:9bfc with SMTP id
 u36-20020a05600c4d2400b003eb39869bfcmr3281616wmp.37.1677620464927; 
 Tue, 28 Feb 2023 13:41:04 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002c55521903bsm10669964wrr.51.2023.02.28.13.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 13:41:04 -0800 (PST)
Date: Tue, 28 Feb 2023 16:41:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Message-ID: <20230228163949-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230203163021.35754-4-philmd@linaro.org>
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

On Fri, Feb 03, 2023 at 05:30:21PM +0100, Philippe Mathieu-Daudé wrote:
> ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
> Convert AcpiCpuHotplug::device field as QDev to enforce this.
> Rename 'owner' and 'device' variables as 'parent'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


So instead of plain gpe->device we now have OBJECT all over
the place. Why is this an improvement?

> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
>  hw/acpi/cpu_hotplug.c           | 18 +++++++++---------
>  hw/acpi/ich9.c                  |  5 +++--
>  hw/acpi/piix4.c                 |  2 +-
>  include/hw/acpi/cpu_hotplug.h   |  4 ++--
>  5 files changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> index cbd7a6ec00..0fcc1ec8ea 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>      return;
>  }
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      return;
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 636e985c50..b8c9081738 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -41,8 +41,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
>       */
>      if (addr == 0 && data == 0) {
>          AcpiCpuHotplug *gpe = opaque;
> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
> -                                 &error_abort);
> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
> +                                 false, &error_abort);
>      }
>  }
>  
> @@ -66,8 +66,8 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
>  
>      cpu_id = k->get_arch_id(cpu);
>      if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
> -                                 &error_abort);
> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
> +                                 false, &error_abort);
>          return;
>      }
>  
> @@ -81,15 +81,15 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>  }
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      CPUState *cpu;
>  
> -    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
> +    memory_region_init_io(&gpe->io, OBJECT(parent), &AcpiCpuHotplug_ops,
>                            gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>      memory_region_add_subregion(container, base, &gpe->io);
> -    gpe->device = owner;
> +    gpe->parent = parent;
>  
>      CPU_FOREACH(cpu) {
>          acpi_set_cpu_present_bit(gpe, cpu);
> @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port)
>  {
> -    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
> +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->parent));
>  
>      memory_region_del_subregion(container, &gpe->io);
> -    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
> +    cpu_hotplug_hw_init(container, OBJECT(gpe->parent), cpuhp_state, io_port);
>  }
>  
>  void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 4f8385b894..6c9a737479 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s = opaque;
> -    Object *obj = OBJECT(s->gpe.device);
> +    Object *obj = OBJECT(s->gpe.parent);
>      object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
>      return 0;
>  }
> @@ -338,7 +338,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>      qemu_register_powerdown_notifier(&pm->powerdown_notifier);
>  
>      legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
> -        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
> +                                 DEVICE(lpc_pci), &pm->gpe,
> +                                 ICH9_CPU_HOTPLUG_IO_BASE);
>  
>      if (pm->acpi_memory_hotplug.is_enabled) {
>          acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 5595fe5be5..3a61d89f92 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
>      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>                               piix4_get_cpu_hotplug_legacy,
>                               piix4_set_cpu_hotplug_legacy);
> -    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
> +    legacy_acpi_cpu_hotplug_init(container, DEVICE(s), &s->gpe,
>                                   PIIX4_CPU_HOTPLUG_IO_BASE);
>  
>      if (s->acpi_memory_hotplug.is_enabled) {
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 5ff24ec417..b2f990f0b8 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -20,7 +20,7 @@
>  #include "hw/acpi/cpu.h"
>  
>  typedef struct AcpiCpuHotplug {
> -    Object *device;
> +    DeviceState *parent;
>      MemoryRegion io;
>      uint8_t sts[ACPI_GPE_PROC_LEN];
>  } AcpiCpuHotplug;
> @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
>  void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
>                               DeviceState *dev, Error **errp);
>  
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base);
>  
>  void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> -- 
> 2.38.1


