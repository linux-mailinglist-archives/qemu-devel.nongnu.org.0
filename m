Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 955B56B8B44
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:34:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbyEV-0002oh-17; Tue, 14 Mar 2023 02:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pbyES-0002oS-J9
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pbyEQ-0001H8-IN
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678775637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lq5fRA91Dz76/36Mqq+Q+0pTC3rTPwX5ANXm7UXICR0=;
 b=YD7Ar1myrXHxLoXx4d7noLJaeIK5aloO8HXJDdvNd4NgPa2zmzwfO3c41+abGrAOfQUC9B
 F3oi9HbyQAhvjEoFTbR0no+rETgIiIcQLZWr+ym9v7mSNADxw4+MXcmwLI3gJ8Oq9QmU7B
 ChXEyD08X6CbuB14KJuIoHBKtPWG96I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-4Rn83w2ePLCqpAlBwOyixg-1; Tue, 14 Mar 2023 02:33:55 -0400
X-MC-Unique: 4Rn83w2ePLCqpAlBwOyixg-1
Received: by mail-ed1-f69.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so20562911edb.21
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678775633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lq5fRA91Dz76/36Mqq+Q+0pTC3rTPwX5ANXm7UXICR0=;
 b=A1poY216K7MjvDuzBu59+lKIYhwxpAlMiDOlo/2Cu+R7y1W2MAY0ARIAGdSgFt0grM
 jEp38P4FOKXy2igcdP8Uxjl3aNlKctWU/lJSfmHzoMH+kfgVY76+wQQQK47Rmbv4sOZZ
 YYGPq9EnqrkJJFIIto7LprT+UVm1OqzVH8cDeBVjsjgipIBAPx/686PjnWXdDSd9bcE2
 H8KwCFjlzPyvv0gIa2kqKXa+PyVJ5ncrl1V1T2IcSXSNqTLIWU9wBBGRwUixdIt2ddbY
 K12hjzOpgif9C4wvA5I7Mh+hBvH8ml5abUz/c0G91yq/zHXsSdTSqDbpo5HBsi5T15IA
 gj8g==
X-Gm-Message-State: AO0yUKXgPgTv7yEaIxzDjouYYV7LHTe4SV7fb0kEaWOuZQqX7IovkwyR
 RQasCORDOtUeLG/VZtROG8rU7NXxYDpVY8P8wPNT56pk7vcVyuXOtnS+oLzYmFZ5oWszuPBdblC
 93f/si2ukpOJQi6s=
X-Received: by 2002:a50:ee18:0:b0:4a0:e31a:434 with SMTP id
 g24-20020a50ee18000000b004a0e31a0434mr34907218eds.27.1678775633578; 
 Mon, 13 Mar 2023 23:33:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set8XZbrP0FadH8QOrNJ6E83pKOAATpnvma8FvoixrV7d5/Ux9eSRJV3bFA7NXa+cZhau384i3g==
X-Received: by 2002:a50:ee18:0:b0:4a0:e31a:434 with SMTP id
 g24-20020a50ee18000000b004a0e31a0434mr34907202eds.27.1678775633291; 
 Mon, 13 Mar 2023 23:33:53 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5085cb000000b004bd6e3ed196sm493314edh.86.2023.03.13.23.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 23:33:52 -0700 (PDT)
Date: Tue, 14 Mar 2023 02:33:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 2/2] pci: allow slot_reserved_mask to be ignored with
 manual slot assignment
Message-ID: <20230314023148-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
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

On Tue, Mar 14, 2023 at 12:01:09AM -0400, Chuck Zmudzinski wrote:
> Commit 4f67543bb8c5 ("xen/pt: reserve PCI slot 2 for Intel igd-passthru")
> uses slot_reserved_mask to reserve slot 2 for the Intel IGD for the
> xenfv machine when the guest is configured for igd-passthru.
> 
> A desired extension to that commit is to allow use of the reserved slot
> if the administrator manually configures a device to use the reserved
> slot. Currently, slot_reserved_mask is enforced unconditionally. With
> this patch, the pci bus can be configured so the slot is only reserved
> if the pci device to be added to the bus is configured for automatic
> slot assignment.
> 
> To enable the desired behavior of slot_reserved_mask machine, add a
> boolean member enforce_slot_reserved_mask_manual to struct PCIBus and
> add a function pci_bus_ignore_slot_reserved_mask_manual which can be
> called to change the default behavior of always enforcing
> slot_reserved_mask so, in that case, slot_reserved_mask is only enforced
> when the pci device being added is configured for automatic slot
> assignment.
> 
> Call the new pci_bus_ignore_slot_reserved_mask_manual function after
> creating the pci bus for the pc/i440fx/xenfv machine type to implement
> the desired behavior of causing slot_reserved_mask to only apply when
> the pci device to be added to a pc/i440fx/xenfv machine is configured
> for automatic slot assignment.
> 
> Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

I really dislike this. 
It seems that xen should not have used slot_reserved_mask,
and instead needs something new like slot_manual_mask.
No?

> ---
> Changelog
> 
> v2: Change Subject of patch from
>     "pci: add enforce_slot_reserved_mask_manual property" To
>     "pci: allow slot_reserved_mask to be ignored with manual slot assignment"
> 
>     Add pci_bus_ignore_slot_reserved_mask_manual function
> 
>     Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
>     in hw/pci-host/i440fx.c
> 
>  hw/pci-host/i440fx.c     |  1 +
>  hw/pci/pci.c             | 14 +++++++++++++-
>  include/hw/pci/pci.h     |  1 +
>  include/hw/pci/pci_bus.h |  1 +
>  4 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> index 262f82c303..8e00b88926 100644
> --- a/hw/pci-host/i440fx.c
> +++ b/hw/pci-host/i440fx.c
> @@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
>      s = PCI_HOST_BRIDGE(dev);
>      b = pci_root_bus_new(dev, NULL, pci_address_space,
>                           address_space_io, 0, TYPE_PCI_BUS);
> +    pci_bus_ignore_slot_reserved_mask_manual(b);
>      s->bus = b;
>      object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 8a87ccc8b0..670ecc6986 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
>      assert(PCI_FUNC(devfn_min) == 0);
>      bus->devfn_min = devfn_min;
>      bus->slot_reserved_mask = 0x0;
> +    bus->enforce_slot_reserved_mask_manual = true;
>      bus->address_space_mem = address_space_mem;
>      bus->address_space_io = address_space_io;
>      bus->flags |= PCI_BUS_IS_ROOT;
> @@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
>      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
>  }
>  
> +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> +{
> +    return bus->enforce_slot_reserved_mask_manual &&
> +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> +}
> +
> +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
> +{
> +    bus->enforce_slot_reserved_mask_manual = false;
> +}
> +
>  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
>  {
>      return bus->slot_reserved_mask;
> @@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
>                     "or reserved", name);
>          return NULL;
>      found: ;
> -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
>          error_setg(errp, "PCI: slot %d function %d not available for %s,"
>                     " reserved",
>                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 935b4b91b4..48d29ec234 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
>  void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
>  void pci_bus_irqs_cleanup(PCIBus *bus);
>  int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
> +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
>  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
>  void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
>  void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 5653175957..e0f15ee9be 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -37,6 +37,7 @@ struct PCIBus {
>      void *iommu_opaque;
>      uint8_t devfn_min;
>      uint32_t slot_reserved_mask;
> +    bool enforce_slot_reserved_mask_manual;
>      pci_set_irq_fn set_irq;
>      pci_map_irq_fn map_irq;
>      pci_route_irq_fn route_intx_to_irq;
> -- 
> 2.39.2


