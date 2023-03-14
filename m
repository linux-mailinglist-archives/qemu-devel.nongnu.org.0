Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AD6B95D2
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4XG-0003Ie-GE; Tue, 14 Mar 2023 09:17:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pc4XE-0003IT-Jf
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:17:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pc4XB-0005rS-Tb
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678799865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dD/eOO+0pKgceKKM8fKsW/OzC3zlL3h1c8nutUJKDEY=;
 b=hol5zFOO0trKwLApTWBAnQAq0fYeOgQbg/kIPHeAZho9Ce3KoP6PBzxZMlqYXvRzGEpDUN
 XMkHbI9UKnfQMUbIEtVwCa3yfVKQaLSGVRuWJUC2zvhxAJCrXzE3c0BpuhdBIC+qbJ0wH3
 BeVcQOCCGUsGskJsD5WJ489FA/1jQY4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-4Ic3N50nOGSLLBxicv2uCQ-1; Tue, 14 Mar 2023 09:17:43 -0400
X-MC-Unique: 4Ic3N50nOGSLLBxicv2uCQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 p36-20020a056402502400b004bb926a3d54so21781774eda.2
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678799862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dD/eOO+0pKgceKKM8fKsW/OzC3zlL3h1c8nutUJKDEY=;
 b=3P/Oarb0x4XZk32tA+MK2DlLjgnMHEM+7Nq1onTy8XNCxTpJJc7vJBdnwbDtBwDjFv
 owxBW+bJsPFEqLTnNf0e5mfnFrneQgbN30jA5lJ2mpgNxMm9e8xKPLNHPfN6OzaoXWfd
 KeAO7wQCKWL2v0kOGzDhuuIM+L9Ae3U9mICcrCb1tacsfOfMyZk+eGZOYn3H4rsdfGH/
 vDcHssa0XnMuj46CA4IRHJVOihKNDYsv+Vj3NEGO9H18J6RS/R+BuTa64o7xv2uJ5NsJ
 w0UQjYMkLv1fWum1b6ZsOp3/LCuTe/LG6TQbKv6Jw43nIvUp2XnrRByQt+edbdy8Ques
 erIw==
X-Gm-Message-State: AO0yUKW6UsS3rOnWhmbkhVsjlZIcxtvSf83/LZsikSfjSUeCMQ8s86ae
 T9tRBWv7gDkLO6asOF7VBefDOz/0TwfUbyUB1lajB9SVA6g+Aa+uZdJDcfzr/1My5nxbIOevyzC
 irwJMmdX42Z+BJ/M=
X-Received: by 2002:a17:907:38b:b0:8af:4dab:cf6c with SMTP id
 ss11-20020a170907038b00b008af4dabcf6cmr2412328ejb.23.1678799861870; 
 Tue, 14 Mar 2023 06:17:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set+MDTm40yB+Pzm6DCiPh/E20GuTxTMZPad0cHHH7en8k2Mp/TdF69qzViD9IdRrt222xSVGFw==
X-Received: by 2002:a17:907:38b:b0:8af:4dab:cf6c with SMTP id
 ss11-20020a170907038b00b008af4dabcf6cmr2412304ejb.23.1678799861554; 
 Tue, 14 Mar 2023 06:17:41 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 pw13-20020a17090720ad00b008e40853a712sm1141538ejb.97.2023.03.14.06.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:17:40 -0700 (PDT)
Date: Tue, 14 Mar 2023 09:17:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Chuck Zmudzinski <brchuckz@aol.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Message-ID: <20230314091653-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c8ee7e9-dd23-262f-f67e-359e14abf6f2@ilande.co.uk>
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

On Tue, Mar 14, 2023 at 12:43:12PM +0000, Mark Cave-Ayland wrote:
> On 14/03/2023 06:33, Michael S. Tsirkin wrote:
> 
> > On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> > > Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> > > uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> > > xenfv machine when the guest is configured for igd-passthru.
> > > 
> > > A desired extension to that commit is to allow use of the reserved slot
> > > if the administrator manually configures a device to use the reserved
> > > slot. Currently, slot_reserved_mask is enforced unconditionally. With
> > > this patch, the pci bus can be configured so the slot is only reserved
> > > if the pci device to be added to the bus is configured for automatic
> > > slot assignment.
> > > 
> > > To enable the desired behavior of slot_reserved_mask machine, add a
> > > boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> > > add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> > > called to change the default behavior of always enforcing
> > > slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> > > when the pci device being added is configured for automatic slot
> > > assignment.
> > > 
> > > Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> > > creating the pci bus for the pc/i440fx/xenfv machine type to implement
> > > the desired behavior of causing slot_reserved_mask to only apply when
> > > the pci device to be added to a pc/i440fx/xenfv machine is configured
> > > for automatic slot assignment.
> > > 
> > > Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> > > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > 
> > I really dislike this.
> > It seems that xen should not have used slot_reserved_mask,
> > and instead needs something new like slot_manual_mask.
> > No?
> 
> My suggestion was to move the validation logic to a separate callback
> function in PCIBus (see
> https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03988.html) but
> perhaps I wasn't clear enough in pointing out that I was thinking this could
> *replace* the existing slot_reserved_mask mechanism, rather than providing a
> hook to allow it to be manipulated.
> 
> Here's a very rough patch put together over lunch that attempts this for
> pci_bus_devfn_reserved(): the idea is that sun4u and Xen would call
> pci_bus_set_slot_reserved_fn() with a suitable pci_slot_reserved_fn
> implementation, and slot_reserved_mask gets removed completely i.e.:
> 
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index def5000e7b..30b856499a 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -493,6 +493,13 @@ bool pci_bus_bypass_iommu(PCIBus *bus)
>      return host_bridge->bypass_iommu;
>  }
> 
> +static bool pci_bus_default_slot_reserved(PCISlotReservationType restype,
> +                                          int devfn)
> +{
> +    /* All slots accessible by default */
> +    return false;
> +}
> +
>  static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>                                         MemoryRegion *address_space_mem,
>                                         MemoryRegion *address_space_io,
> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> DeviceState *parent,
>  {
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
> -    bus->slot_reserved_mask = 0x0;
> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>      return !(bus->devices[devfn]);
>  }
> 
> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> +                                   PCISlotReservationType restype)
> +{
> +    return bus->slot_reserved_fn(restype, devfn);
> +}
> +
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>  {
> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> +    bus->slot_reserved_fn = fn;
>  }
> 
>  /* -1 for devfn means auto assign */
> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>              devfn += PCI_FUNC_MAX) {
>              if (pci_bus_devfn_available(bus, devfn) &&
> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>                  goto found;
>              }
>          }
> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                                         MemoryRegion *address_space_io,
> @@ -500,7 +507,7 @@ static void pci_root_bus_internal_init(PCIBus *bus,
> DeviceState *parent,
>  {
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
> -    bus->slot_reserved_mask = 0x0;
> +    bus->slot_reserved_fn = pci_bus_default_slot_reserved;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1111,9 +1118,15 @@ static bool pci_bus_devfn_available(PCIBus *bus, int devfn)
>      return !(bus->devices[devfn]);
>  }
> 
> -static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> +static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn,
> +                                   PCISlotReservationType restype)
> +{
> +    return bus->slot_reserved_fn(restype, devfn);
> +}
> +
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn)
>  {
> -    return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> +    bus->slot_reserved_fn = fn;
>  }
> 
>  /* -1 for devfn means auto assign */
> @@ -1141,7 +1154,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>          for(devfn = bus->devfn_min ; devfn < ARRAY_SIZE(bus->devices);
>              devfn += PCI_FUNC_MAX) {
>              if (pci_bus_devfn_available(bus, devfn) &&
> -                   !pci_bus_devfn_reserved(bus, devfn)) {
> +                   !pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_AUTO)) {
>                  goto found;
>              }
>          }
> @@ -1149,7 +1162,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved(bus, devfn, PCI_SLOT_RESERVATION_MANUAL)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                     " reserved",
>                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index d5a40cd058..8a949f7ae1 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -257,10 +257,18 @@ MemoryRegion *pci_address_space_io(PCIDevice *dev);
>   */
>  int pci_bar(PCIDevice *d, int reg);
> 
> +typedef enum PCISlotReservationType {
> +    PCI_SLOT_RESERVATION_AUTO,
> +    PCI_SLOT_RESERVATION_MANUAL
> +} PCISlotReservationType;
> +
> +typedef bool (*pci_slot_reserved_fn)(PCISlotReservationType restype, int devfn);
>  typedef void (*pci_set_irq_fn)(void *opaque, int irq_num, int level);
>  typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
>  typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
> 
> +void pci_bus_set_slot_reserved_fn(PCIBus *bus, pci_slot_reserved_fn fn);
> +
>  #define TYPE_PCI_BUS "PCI"
>  OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
>  #define TYPE_PCIE_BUS "PCIE"
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 5653175957..d68ea1418d 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -36,7 +36,7 @@ struct PCIBus {
>      PCIIOMMUFunc iommu_fn;
>      void *iommu_opaque;
>      uint8_t devfn_min;
> -    uint32_t slot_reserved_mask;
> +    pci_slot_reserved_fn slot_reserved_fn;
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> 
> 
> If this approach seems reasonable, I'm happy for someone else to take this
> over and turn it into a proper series.
> 
> 
> ATB,
> 
> Mark.

It's ok too though I think I like chuck's proposal better:
less callbacks to chase.

-- 
MST


