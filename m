Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3D6A625A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8M3-00044J-Nm; Tue, 28 Feb 2023 17:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX8M1-000447-Vx
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pX8Lz-0001IU-T2
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677622906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=notJd6JOZS6qUBQqxgECEXKVvXEWqYqWzOCS7WtAfaY=;
 b=el8OObUUnUPRUSK4gs5nLA3RxicvqyGxl3x/7/pCRCy/c/6FcBv/imrE+uzUvfOXbhaED+
 Kk4zpBQbhNWXj49zMt4+bgevBNuR4QMJ+4Nkv8AdRtUUVULdqJnDUxtMu5UWMBBZ1D7S6/
 vSXxQVbcOqCTFCm1Oaxs7zlImzZkx2o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-ACOAKEVgOoSbzDRfrQvyUg-1; Tue, 28 Feb 2023 17:21:39 -0500
X-MC-Unique: ACOAKEVgOoSbzDRfrQvyUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so4139214wmj.0
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677622899;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=notJd6JOZS6qUBQqxgECEXKVvXEWqYqWzOCS7WtAfaY=;
 b=ddxoRDQyWwJUqcz7qQFlHAUS9h9LnJRynFykskMfEQg8MiYdnqUeIyFazwXUYt2yUj
 B7vWB9Iw3OmNUCPJOsKm5kfLCKIpl9i3eyiwt3aOCnI+UZ2DCCAn36OHoUgm3flpHbym
 8rZzjiYKVst5L6QIYXqNZjMxKMsoRbm5o3Jpq3p0xSfYM6S0ST+oNFGiOjmoCqrW5+pQ
 xAI2OqRqLje9Et41IzIkaEh0kLxJrIX/idW4ZrifXm9xqMzfwPUScYKiowZ4O1DHVyUh
 g8iCQUaEkxSSwZ6OF5s84MhNP0TL4wr2AdyNwqfXz+Ch9oeOJY2wGMowNs90nMBs623E
 r2/Q==
X-Gm-Message-State: AO0yUKXvMvOwE5KiNRi7cSky4oGi+JRLiaZyypLFuphGsTYnUvhjsQ9O
 vYfhpMioHiG4Kr6JOTHpdF7GcH8KGNCLmAN4VrTlGK4fCrWbO/nGAXUxpxnpf2Cxl+OKhqIFIUK
 vwg/RjEHa5Y/arWI=
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id
 h15-20020a05600c350f00b003eb3945d400mr3362365wmq.6.1677622898721; 
 Tue, 28 Feb 2023 14:21:38 -0800 (PST)
X-Google-Smtp-Source: AK7set9rlwspLw5vK84W4bHF6tyyMhAvLpTzq3Zaw10WELV0eaJ2luNWuvIB15jJ3zafvENopoapYg==
X-Received: by 2002:a05:600c:350f:b0:3eb:3945:d400 with SMTP id
 h15-20020a05600c350f00b003eb3945d400mr3362354wmq.6.1677622898395; 
 Tue, 28 Feb 2023 14:21:38 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 bd12-20020a05600c1f0c00b003e0015c8618sm17420216wmb.6.2023.02.28.14.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 14:21:37 -0800 (PST)
Date: Tue, 28 Feb 2023 17:21:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 2/3] hw/acpi/cpu_hotplug: Rename 'parent' MemoryRegion as
 'container'
Message-ID: <20230228172004-mutt-send-email-mst@kernel.org>
References: <20230203163021.35754-1-philmd@linaro.org>
 <20230203163021.35754-3-philmd@linaro.org>
 <20230228164123-mutt-send-email-mst@kernel.org>
 <089b255a-384d-55f4-2868-0f24dd2588ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <089b255a-384d-55f4-2868-0f24dd2588ec@linaro.org>
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

On Tue, Feb 28, 2023 at 11:16:46PM +0100, Philippe Mathieu-Daudé wrote:
> On 28/2/23 22:43, Michael S. Tsirkin wrote:
> > On Fri, Feb 03, 2023 at 05:30:20PM +0100, Philippe Mathieu-Daudé wrote:
> > > No logical change, rename for clarity.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > Can't say container is clearer. If we are changing things
> > I'd like to see a real improvement.
> 
> QOM API usually use 'parent' to indicate the inheritance / hierarchy
> between object.
> Memory API uses 'container', in particular when used with
> memory_region_add_subregion().

It says "container" in the comment but not in the API:

/**
 * memory_region_add_subregion: Add a subregion to a container.
 *  
 * Adds a subregion at @offset.  The subregion may not overlap with other
 * subregions (except for those explicitly marked as overlapping).  A region
 * may only be added once as a subregion (unless removed with
 * memory_region_del_subregion()); use memory_region_init_alias() if you
 * want a region to be a subregion in multiple locations.
 *
 * @mr: the region to contain the new subregion; must be a container
 *      initialized with memory_region_init().
 * @offset: the offset relative to @mr where @subregion is added.
 * @subregion: the subregion to be added.
 */
void memory_region_add_subregion(MemoryRegion *mr,
                                 hwaddr offset,
                                 MemoryRegion *subregion);


> I still believe this is a worthwhile change as API style cleanup,
> but I agree the commit description lacks this explanation.

If you are cleaning up APIs it's a good idea to add documentation.
As long as you don't these renames don't add much.

> > > ---
> > >   hw/acpi/acpi-cpu-hotplug-stub.c |  2 +-
> > >   hw/acpi/cpu_hotplug.c           | 10 +++++-----
> > >   hw/acpi/piix4.c                 | 10 +++++-----
> > >   include/hw/acpi/cpu_hotplug.h   |  2 +-
> > >   4 files changed, 12 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/hw/acpi/acpi-cpu-hotplug-stub.c b/hw/acpi/acpi-cpu-hotplug-stub.c
> > > index b590ad57e1..cbd7a6ec00 100644
> > > --- a/hw/acpi/acpi-cpu-hotplug-stub.c
> > > +++ b/hw/acpi/acpi-cpu-hotplug-stub.c
> > > @@ -13,7 +13,7 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > >       return;
> > >   }
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base)
> > >   {
> > >       return;
> > > diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> > > index 3cfa4f45dc..636e985c50 100644
> > > --- a/hw/acpi/cpu_hotplug.c
> > > +++ b/hw/acpi/cpu_hotplug.c
> > > @@ -81,14 +81,14 @@ void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> > >       acpi_send_event(DEVICE(hotplug_dev), ACPI_CPU_HOTPLUG_STATUS);
> > >   }
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base)
> > >   {
> > >       CPUState *cpu;
> > >       memory_region_init_io(&gpe->io, owner, &AcpiCpuHotplug_ops,
> > >                             gpe, "acpi-cpu-hotplug", ACPI_GPE_PROC_LEN);
> > > -    memory_region_add_subregion(parent, base, &gpe->io);
> > > +    memory_region_add_subregion(container, base, &gpe->io);
> > >       gpe->device = owner;
> > >       CPU_FOREACH(cpu) {
> > > @@ -100,10 +100,10 @@ void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > >                                   CPUHotplugState *cpuhp_state,
> > >                                   uint16_t io_port)
> > >   {
> > > -    MemoryRegion *parent = pci_address_space_io(PCI_DEVICE(gpe->device));
> > > +    MemoryRegion *container = pci_address_space_io(PCI_DEVICE(gpe->device));
> > > -    memory_region_del_subregion(parent, &gpe->io);
> > > -    cpu_hotplug_hw_init(parent, gpe->device, cpuhp_state, io_port);
> > > +    memory_region_del_subregion(container, &gpe->io);
> > > +    cpu_hotplug_hw_init(container, gpe->device, cpuhp_state, io_port);
> > >   }
> > >   void build_legacy_cpu_hotplug_aml(Aml *ctx, MachineState *machine,
> > > diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> > > index c702d83f27..5595fe5be5 100644
> > > --- a/hw/acpi/piix4.c
> > > +++ b/hw/acpi/piix4.c
> > > @@ -555,15 +555,15 @@ static void piix4_set_cpu_hotplug_legacy(Object *obj, bool value, Error **errp)
> > >       s->cpu_hotplug_legacy = value;
> > >   }
> > > -static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> > > +static void piix4_acpi_system_hot_add_init(MemoryRegion *container,
> > >                                              PCIBus *bus, PIIX4PMState *s)
> > >   {
> > >       memory_region_init_io(&s->io_gpe, OBJECT(s), &piix4_gpe_ops, s,
> > >                             "acpi-gpe0", GPE_LEN);
> > > -    memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
> > > +    memory_region_add_subregion(container, GPE_BASE, &s->io_gpe);
> > >       if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
> > > -        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
> > > +        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, container,
> > >                           s->use_acpi_hotplug_bridge, ACPI_PCIHP_ADDR_PIIX4);
> > >       }
> > > @@ -571,11 +571,11 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
> > >       object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
> > >                                piix4_get_cpu_hotplug_legacy,
> > >                                piix4_set_cpu_hotplug_legacy);
> > > -    legacy_acpi_cpu_hotplug_init(parent, OBJECT(s), &s->gpe,
> > > +    legacy_acpi_cpu_hotplug_init(container, OBJECT(s), &s->gpe,
> > >                                    PIIX4_CPU_HOTPLUG_IO_BASE);
> > >       if (s->acpi_memory_hotplug.is_enabled) {
> > > -        acpi_memory_hotplug_init(parent, OBJECT(s), &s->acpi_memory_hotplug,
> > > +        acpi_memory_hotplug_init(container, OBJECT(s), &s->acpi_memory_hotplug,
> > >                                    ACPI_MEMORY_HOTPLUG_BASE);
> > >       }
> > >   }
> > > diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> > > index 99c11b7151..5ff24ec417 100644
> > > --- a/include/hw/acpi/cpu_hotplug.h
> > > +++ b/include/hw/acpi/cpu_hotplug.h
> > > @@ -28,7 +28,7 @@ typedef struct AcpiCpuHotplug {
> > >   void legacy_acpi_cpu_plug_cb(HotplugHandler *hotplug_dev, AcpiCpuHotplug *gpe,
> > >                                DeviceState *dev, Error **errp);
> > > -void legacy_acpi_cpu_hotplug_init(MemoryRegion *parent, Object *owner,
> > > +void legacy_acpi_cpu_hotplug_init(MemoryRegion *container, Object *owner,
> > >                                     AcpiCpuHotplug *gpe, uint16_t base);
> > >   void acpi_switch_to_modern_cphp(AcpiCpuHotplug *gpe,
> > > -- 
> > > 2.38.1
> > 


