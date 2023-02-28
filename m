Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1286A5C2D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 16:41:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX268-0003z1-1Y; Tue, 28 Feb 2023 10:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX25v-0003u6-5K
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:40:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pX25r-0002pY-1n
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 10:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677598841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ws0zLQHlOXMtN1DHOLJ82kXtdTzObP64AGZnuWAnJi4=;
 b=J3qBFsiTAJsuniKlkapcp67hlv8rsXfRCIbzZJ4IrGOtWvllaUJubIQ9XkNQ7QXBJhJsg8
 qVsHcBjc2RzPzpivTwngnvC1gjVuXvfRcWO+lEh23H90nWZhEcBQ8YZDnlRL5glYXwei96
 0gamcK9MRGYS2HVQS8D5IAl67M3ywe0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-HQA-eoxlP_WlgOwiDnBo2g-1; Tue, 28 Feb 2023 10:40:40 -0500
X-MC-Unique: HQA-eoxlP_WlgOwiDnBo2g-1
Received: by mail-qk1-f200.google.com with SMTP id
 m25-20020ae9e019000000b007421ddd945eso6120926qkk.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 07:40:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ws0zLQHlOXMtN1DHOLJ82kXtdTzObP64AGZnuWAnJi4=;
 b=SlPw5I2/k4ImWx9MGiGuh2fQBJUPlrS4XFZj0ZDtSK0COPKcxffLY6A7/QDALRMP3I
 T2wIcHOgNLvgDbHFKVfx4wMYGOtnyuotf9tnmDWtczN8xholzS3zZf/aAFkkos71E/hi
 7DhlLoHmLadUwlIjeT4IsfUTMV7AZP0LFXO9M2FDtyb3ZeXxOsN5lDn/PTTkCKnzpjlz
 4TWRAqnRpDtROLyKgp7Xnn43Mt2hxFh/LyvvGLXUTGnl9vrukhyYL40RLI1fkBgpCU1P
 mPL/BSLQP7C1T78jXEXWPAZfl4f6Yx7yvHKZhEWGUXjaGN0FkHtq6qGpbmRA23RmvoSa
 oypQ==
X-Gm-Message-State: AO0yUKW2psr4qRHc/ZgBpkxiCI2+kaZ5F7iTFjrS9wb/RzDhqafjK/he
 56l4nCn+7HP6ifsXWjzoyNqhGkVnROc7XmBhyFYWLR7K+477x1Pvo2iYrXR2E4BwhCJ7j5hV/DI
 +dtcY4msUGYodxB0=
X-Received: by 2002:ad4:4ea7:0:b0:56e:abb8:b656 with SMTP id
 ed7-20020ad44ea7000000b0056eabb8b656mr24431113qvb.7.1677598839764; 
 Tue, 28 Feb 2023 07:40:39 -0800 (PST)
X-Google-Smtp-Source: AK7set+KQNBraYpqsy9snnQcB9YzjObmTZhwIKYS4v7nB62gyyIaRLvj+2EEmDWaAfICIiBjmk9B2g==
X-Received: by 2002:ad4:4ea7:0:b0:56e:abb8:b656 with SMTP id
 ed7-20020ad44ea7000000b0056eabb8b656mr24431078qvb.7.1677598839486; 
 Tue, 28 Feb 2023 07:40:39 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a05620a223800b007426b917031sm6905020qkh.121.2023.02.28.07.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 07:40:38 -0800 (PST)
Date: Tue, 28 Feb 2023 16:40:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Markus
 Armbruster <armbru@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Message-ID: <20230228164035.4aad7717@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203163021.35754-4-philmd@linaro.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri,  3 Feb 2023 17:30:21 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
> Convert AcpiCpuHotplug::device field as QDev to enforce this.
> Rename 'owner' and 'device' variables as 'parent'.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
>  hw/acpi/cpu_hotplug.c           | 18 +++++++++---------
>  hw/acpi/ich9.c                  |  5 +++--
>  hw/acpi/piix4.c                 |  2 +-
>  include/hw/acpi/cpu_hotplug.h   |  4 ++--
>  5 files changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-s=
tub.c
> index cbd7a6ec00..0fcc1ec8ea 100644
> --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>      return;
>  }
> =20
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *=
parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      return;
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 636e985c50..b8c9081738 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -41,8 +41,8 @@ static void cpu_status_write(void *opaque, hwaddr addr,=
 uint64_t data,
>       */
>      if (addr =3D=3D 0 && data =3D=3D 0) {
>          AcpiCpuHotplug *gpe =3D opaque;
> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", fals=
e,
> -                                 &error_abort);
> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> +                                 false, &error_abort);
>      }
>  }
> =20
> @@ -66,8 +66,8 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gp=
e, CPUState *cpu)
> =20
>      cpu_id =3D k->get_arch_id(cpu);
>      if ((cpu_id / 8) >=3D ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", fals=
e,
> -                                 &error_abort);
> +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> +                                 false, &error_abort);
>          return;
>      }
> =20
> @@ -81,15 +81,15 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_=
dev, AcpiCpuHotplug *gpe,
>      acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
>  }
> =20
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *=
parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base)
>  {
>      CPUState *cpu;
> =20
> -    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
> +    memory_region_init_io(&gpe->io, OBJECT(parent), &AcpiCpuHotplug_ops,
>                            gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
>      memory_region_add_subregion(container, base, &gpe->io);
> -    gpe->device =3D owner;
> +    gpe->parent =3D parent;
> =20
>      CPU_FOREACH(cpu) {
>          acpi_set_cpu_present_bit(gpe, cpu);
> @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
>                                  CPUHotplugState *cpuhp_state,
>                                  uint16_t io_port)
>  {
> -    MemoryRegion *container =3D pci_address_space_io(PCI_DEVICE(gpe->dev=
ice));
> +    MemoryRegion *container =3D pci_address_space_io(PCI_DEVICE(gpe->par=
ent));
> =20
>      memory_region_del_subregion(container, &gpe->io);
> -    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
> +    cpu_hotplug_hw_init(container, OBJECT(gpe->parent), cpuhp_state, io_=
port);
did you forget to convert (..., Object *owner) here to DeviceState*?

>  }
> =20
>  void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 4f8385b894..6c9a737479 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s =3D opaque;
> -    Object *obj =3D OBJECT(s->gpe.device);
> +    Object *obj =3D OBJECT(s->gpe.parent);
>      object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
>      return 0;
>  }
> @@ -338,7 +338,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *=
pm,
>      qemu_register_powerdown_notifier(&pm->powerdown_notifier);
> =20
>      legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
> -        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
> +                                 DEVICE(lpc_pci), &pm->gpe,
> +                                 ICH9_CPU_HOTPLUG_IO_BASE);
> =20
>      if (pm->acpi_memory_hotplug.is_enabled) {
>          acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(l=
pc_pci),
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 5595fe5be5..3a61d89f92 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegi=
on *container,
>      object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
>                               piix4_get_cpu_hotplug_legacy,
>                               piix4_set_cpu_hotplug_legacy);
> -    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
> +    legacy_acpi_cpu_hotplug_init(container, DEVICE(s), &s->gpe,
>                                   PIIX4_CPU_HOTPLUG_IO_BASE);
> =20
>      if (s->acpi_memory_hotplug.is_enabled) {
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 5ff24ec417..b2f990f0b8 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -20,7 +20,7 @@
>  #include "hw/acpi/cpu.h"
> =20
>  typedef struct AcpiCpuHotplug {
> -    Object *device;
> +    DeviceState *parent;
>      MemoryRegion io;
>      uint8_t sts[ACPI_GPE_PROC_LEN];
>  } AcpiCpuHotplug;
> @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
>  void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug=
 *gpe,
>                               DeviceState *dev, Error **errp);
> =20
> -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *=
parent,
>                                    AcpiCpuHotplug *gpe, uint16_t base);
> =20
>  void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,


