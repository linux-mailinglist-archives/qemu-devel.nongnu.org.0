Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E46A6226
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8AE-0002fi-MW; Tue, 28 Feb 2023 17:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX8AC-0002el-Jv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX8AA-0006qa-Mo
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ed/P6rbuRiQsiDf4wpmZfdmra9r6heUwpVyrVFEJ/pc=;
 b=dLXwsaHHcsqB74fd24NtVvcpTqETFMbGmDhMImQoTpcQ0lW5PFIvvFIwl54TNhagqAN0UE
 0Pe2KidltxyUA/rHqXodEibZROXGo2MbJHxB4KpwYXXgLzrYT182gjR5d71sMfWAIuqOXI
 olanIJbXnjZa2Ei7LIWfnswRQxcJvuQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-kPptv3rbORmJfwHNhvF6Rg-1; Tue, 28 Feb 2023 17:09:31 -0500
X-MC-Unique: kPptv3rbORmJfwHNhvF6Rg-1
Received: by mail-wm1-f69.google.com with SMTP id
 az12-20020a05600c600c00b003e8910ec2fdso4107498wmb.6
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:09:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622170;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ed/P6rbuRiQsiDf4wpmZfdmra9r6heUwpVyrVFEJ/pc=;
 b=yJftbVAntHHc/2VR2CrU4bEPxyYk25TuxE76sLwpg3DXApaRRkvYdoXC4N+BxAyYtw
 0aV/CskiHzkgB12zCYdtX4WZSLyiGIFrQXQmjrmSktbNdNyysXKOdTaao9hyyZ3VMSDm
 Lv0JMEbXvPAPHvIbxPJmOcrtcMrvfp4PLHLyw7f6xzHp2yc/OJxNUv10oNfxtfdQpBqY
 6Kj0T4OW+Nrk561Fak261tpmLi5N68tvslfPJBJZiW8XQNadgc4rRYHu/2uuwX3NvHYz
 ejcCpPHgwBXZgyO5zoQ7jjaUuuZABPL6vspv+sd+8teLABAIm2KVa+wUOIHicmc6+XaU
 NDcg==
X-Gm-Message-State: AO0yUKXLDlmuuGlvOwH/Ffr4JgCL9y2GjUgL/SXIvvKUzwzIL1MBCRjQ
 OzXN6YkO6DSI7RSHq0uSrfg8htDRruxBYGdhVUId7NzycKMEgLxpg7e5kykmi0B16Ktwf/xbsKe
 Vw+RBVZhQYeuUkD8=
X-Received: by 2002:a05:6000:11c2:b0:2c7:1d55:a56b with SMTP id
 i2-20020a05600011c200b002c71d55a56bmr3024513wrx.70.1677622170688; 
 Tue, 28 Feb 2023 14:09:30 -0800 (PST)
X-Google-Smtp-Source: AK7set/IkPlv6HyL8O/PUgS+m4VF8afY8AoPja19ZRBLoXeWuyVxtgCz91CqkJvzNyK7UASg+MHdiQ==
X-Received: by 2002:a05:6000:11c2:b0:2c7:1d55:a56b with SMTP id
 i2-20020a05600011c200b002c71d55a56bmr3024507wrx.70.1677622170330; 
 Tue, 28 Feb 2023 14:09:30 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 y18-20020adffa52000000b002c55efa9cbesm10654829wrr.39.2023.02.28.14.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:09:29 -0800 (PST)
Date: Tue, 28 Feb 2023 17:09:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 3/3] hw/acpi/cpu_hotplug: Convert 'Object *device' ->
 'DeviceState *parent'
Message-ID: <20230228170637-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-4-philmd@linaro.org>
 <20230228163949-mutt-send-email-mst@kernel.org>
 <708fa08e-d9f8-7d08-848b-2adafb3fac70@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <708fa08e-d9f8-7d08-848b-2adafb3fac70@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Feb 28, 2023 at 11:05:24PM +0100, Philippe Mathieu-Daudé wrote:
> On 28/2/23 22:41, Michael S. Tsirkin wrote:
> > On Fri, Feb 03, 2023 at 05:30:21PM +0100, Philippe Mathieu-Daudé wrote:
> > > ACPI CPU hotplug parent can't be any QOM object, it must be a QDev.
> > > Convert AcpiCpuHotplug::device field as QDev to enforce this.
> > > Rename 'owner' and 'device' variables as 'parent'.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > 
> > So instead of plain gpe->device we now have OBJECT all over
> > the place. Why is this an improvement?
> 
> From QOM PoV, in this prototype change:
> 
>   void legacy_acpi_cpu_hotplug_init(MemoryRegion *container,
> - Object *owner,
> + DeviceState *parent,
> 
> we promote the parent/owner argument from generic Object to
> Device, which is more restrictive.
> 
> Thus now you can not pass any QOM object, it has to be a QDev.

None of the functions really seem to care what kind of object
they get. Anything that results in less casting is a win
in my book. More casting - a loss.

> > > ---
> > >   hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
> > >   hw/acpi/cpu_hotplug.c           | 18 +++++++++---------
> > >   hw/acpi/ich9.c                  |  5 +++--
> > >   hw/acpi/piix4.c                 |  2 +-
> > >   include/hw/acpi/cpu_hotplug.h   |  4 ++--
> > >   5 files changed, 16 insertions(+), 15 deletions(-)
> > > 
> > > diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> > > index cbd7a6ec00..0fcc1ec8ea 100644
> > > --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> > > +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> > > @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > >       return;
> > >   }
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base)
> > >   {
> > >       return;
> > > diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> > > index 636e985c50..b8c9081738 100644
> > > --- a/hw/acpi/cpu_hotplug.c
> > > +++ b/hw/acpi/cpu_hotplug.c
> > > @@ -41,8 +41,8 @@ static void cpu_status_write(void *opaque, hwaddr addr, uint64_t data,
> > >        */
> > >       if (addr == 0 && data == 0) {
> > >           AcpiCpuHotplug *gpe = opaque;
> > > -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
> > > -                                 &error_abort);
> > > +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
> > > +                                 false, &error_abort);
> > >       }
> > >   }
> > > @@ -66,8 +66,8 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gpe, CPUState *cpu)
> > >       cpu_id = k->get_arch_id(cpu);
> > >       if ((cpu_id / 8) >= ACPI_GPE_PROC_LEN) {
> > > -        object_property_set_bool(gpe->device, "cpu-hotplug-legacy", false,
> > > -                                 &error_abort);
> > > +        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legacy",
> > > +                                 false, &error_abort);
> > >           return;
> > >       }
> > > @@ -81,15 +81,15 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> > >       acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
> > >   }
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base)
> > >   {
> > >       CPUState *cpu;
> > > -    memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
> > > +    memory_region_init_io(&gpe->io, OBJECT(parent), &AcpiCpuHotplug_ops,
> > >                             gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
> > >       memory_region_add_subregion(container, base, &gpe->io);
> > > -    gpe->device = owner;
> > > +    gpe->parent = parent;
> > >       CPU_FOREACH(cpu) {
> > >           acpi_set_cpu_present_bit(gpe, cpu);
> > > @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > >                                   CPUHotplugState *cpuhp_state,
> > >                                   uint16_t io_port)
> > >   {
> > > -    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
> > > +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->parent));
> > >       memory_region_del_subregion(container, &gpe->io);
> > > -    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
> > > +    cpu_hotplug_hw_init(container, OBJECT(gpe->parent), cpuhp_state, io_port);
> > >   }
> > >   void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> > > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > > index 4f8385b894..6c9a737479 100644
> > > --- a/hw/acpi/ich9.c
> > > +++ b/hw/acpi/ich9.c
> > > @@ -197,7 +197,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
> > >   static int vmstate_cpuhp_pre_load(void *opaque)
> > >   {
> > >       ICH9LPCPMRegs *s = opaque;
> > > -    Object *obj = OBJECT(s->gpe.device);
> > > +    Object *obj = OBJECT(s->gpe.parent);
> > >       object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_abort);
> > >       return 0;
> > >   }
> > > @@ -338,7 +338,8 @@ void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
> > >       qemu_register_powerdown_notifier(&pm->powerdown_notifier);
> > >       legacy_acpi_cpu_hotplug_init(pci_address_space_io(lpc_pci),
> > > -        OBJECT(lpc_pci), &pm->gpe, ICH9_CPU_HOTPLUG_IO_BASE);
> > > +                                 DEVICE(lpc_pci), &pm->gpe,
> > > +                                 ICH9_CPU_HOTPLUG_IO_BASE);
> > >       if (pm->acpi_memory_hotplug.is_enabled) {
> > >           acpi_memory_hotplug_init(pci_address_space_io(lpc_pci), OBJECT(lpc_pci),
> > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > index 5595fe5be5..3a61d89f92 100644
> > > --- a/hw/acpi/piix4.c
> > > +++ b/hw/acpi/piix4.c
> > > @@ -571,7 +571,7 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
> > >       object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
> > >                                piix4_get_cpu_hotplug_legacy,
> > >                                piix4_set_cpu_hotplug_legacy);
> > > -    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
> > > +    legacy_acpi_cpu_hotplug_init(container, DEVICE(s), &s->gpe,
> > >                                    PIIX4_CPU_HOTPLUG_IO_BASE);
> > >       if (s->acpi_memory_hotplug.is_enabled) {
> > > diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> > > index 5ff24ec417..b2f990f0b8 100644
> > > --- a/include/hw/acpi/cpu_hotplug.h
> > > +++ b/include/hw/acpi/cpu_hotplug.h
> > > @@ -20,7 +20,7 @@
> > >   #include "hw/acpi/cpu.h"
> > >   typedef struct AcpiCpuHotplug {
> > > -    Object *device;
> > > +    DeviceState *parent;
> > >       MemoryRegion io;
> > >       uint8_t sts[ACPI_GPE_PROC_LEN];
> > >   } AcpiCpuHotplug;
> > > @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
> > >   void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> > >                                DeviceState *dev, Error **errp);
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, DeviceState *parent,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base);
> > >   void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > > -- 
> > > 2.38.1
> > 


