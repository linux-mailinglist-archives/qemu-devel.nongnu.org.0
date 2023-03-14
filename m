Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8806F6B95CC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 14:17:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc4WJ-0002X5-Gn; Tue, 14 Mar 2023 09:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pc4WH-0002Vy-E4
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pc4WF-0005i2-4U
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 09:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678799806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hIAXseRKi4A6hgBwN93vaPfaXQdoWyfyU0Q1ZAsvdyE=;
 b=dPFryS1bmtlefCtZZtdr7S33MrEynTw5Ie6kUQdlOmDLA+NHosbsU03HykDWyxj+pSzIjW
 /7mrHAsIcNgvUKsKOuWUXXmmT18lK4G/QzS5Hg8AR1KWNNV76PD3WE++nuRj235QiEgXw3
 JtAn67ZFhxs2LsYzROlLO40/83il2wc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-p1Fl7ilyN9a1q3v1MX0mSw-1; Tue, 14 Mar 2023 09:16:44 -0400
X-MC-Unique: p1Fl7ilyN9a1q3v1MX0mSw-1
Received: by mail-ed1-f71.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso21895801edb.4
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 06:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678799803;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIAXseRKi4A6hgBwN93vaPfaXQdoWyfyU0Q1ZAsvdyE=;
 b=zArJz5jEcgqmO4RgnBhamJpmLpS9qCyiLNZq+5nm3HgjFJ6IMaGny30rzaM749JIWY
 mjUrW4LZDqJ9l1kh7W4sYu4yNQi82kQXY3AX2sFVmA5eDRtmLFzHpa9f/jAfiqC8SdE7
 T5KfckiWmVZxmbr3BhvrX7qVz3WhsE6aff+S92i/TIxq55z7rds0FGwSeeQIMa1yJETu
 /Errul90nYkLt1otInpEsKdWrBIu3sOrhBZDsSGXLqyDr3FwJStI4t7gsyHG4Iv1M3nI
 gsje+tF4Iq08sFqUV5GDqBIZUBnDe+3myXbOun05AZJima6K0gGJ9UCHwKuVO6b9Zn+v
 aX+Q==
X-Gm-Message-State: AO0yUKVNwQ52kc7of0RDAGQwHe70dj95lm9Cuk7aiMoHs/9CxBx25J4u
 Mb/qnXaruZsg0tvmN7GeCpRtCnNqMHVy+TY3Y/9hqUiKE5zWljvnQtc7RRzG8zNjJP6P3AFZZ4x
 mDcLWoUiVkvNrHxo=
X-Received: by 2002:a17:907:d13:b0:8f4:809e:faee with SMTP id
 gn19-20020a1709070d1300b008f4809efaeemr2766639ejc.19.1678799803057; 
 Tue, 14 Mar 2023 06:16:43 -0700 (PDT)
X-Google-Smtp-Source: AK7set/bTtWokPnmCG+Y9HcT9FaE2j2zBWfT9dGSuyKJ37cXmbtLNdihy9mpTH9ckpsrrBBKuM8Gcw==
X-Received: by 2002:a17:907:d13:b0:8f4:809e:faee with SMTP id
 gn19-20020a1709070d1300b008f4809efaeemr2766612ejc.19.1678799802743; 
 Tue, 14 Mar 2023 06:16:42 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f7:4129:3ef9:ea05:f0ca:6b81])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170906c28800b00928e0ea53e5sm1138289ejz.84.2023.03.14.06.16.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 06:16:42 -0700 (PDT)
Date: Tue, 14 Mar 2023 09:16:36 -0400
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
Message-ID: <20230314091342-mutt-send-email-mst@kernel.org>
References: <cover.1678763217.git.brchuckz@aol.com>
 <d9ae459b2814425c2d9e756e45d993c824da150a.1678763217.git.brchuckz@aol.com>
 <20230314023148-mutt-send-email-mst@kernel.org>
 <ad2741b3-1f5f-8704-d51b-426d3d496811@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad2741b3-1f5f-8704-d51b-426d3d496811@aol.com>
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

On Tue, Mar 14, 2023 at 08:33:02AM -0400, Chuck Zmudzinski wrote:
> On 3/14/2023 2:33 AM, Michael S. Tsirkin wrote:
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
> Actually, xen would use something like slot_auto_mask, and
> sun4u would use both slot_auto_mask and slot_manual_mask.
> 
> Is it just that this patch touches hw/pci-host/i440fx.c that you
> don't like or is it that you don't like adding slot_reserved_mask_manual
> and pci_bus_ignore_slot_reserved_mask_manual, or is it both
> that you don't like?

I don't like the enforce_slot_reserved_mask_manual flag -
I prefer straight forward logic with no branches in
the common code.

> If it's the former that you don't like, the call to
> pci_bus_ignore_slot_reserved_mask_manual can be moved to
> xen_igd_reserve_slot in hw/xen/xen_pt.c and this would
> avoid touching hw/pci-host/i440fx.c.
> 
> If it's the latter that you don't like, both slot_reserved_mask_manual
> and pci_bus_ignore_slot_reserved_mask_manual can be removed
> and this can be implemented with two independent slot masks:
> 
> rename slot_reserved_mask as slot_auto_mask - used by both xen and sun4u
> slot_manual_mask - new mask, used only by sun4u.

Sounds good to me, except let's add "reserved" in here.
slot_reserved_mask_auto, slot_reserved_mask_manual ?

> We would also need to have two sets of accessor functions in this case, one
> set to access slot_auto_mask, and the other to access slot_manual_mask.
> Since the sun4u machine does not need to either get the value of
> slot_manual_mask or clear the slot_manual_mask, slot_manual_mask
> would only need to have one accessor function to set the value of the
> mask. slot_auto_mask would have all three accessor functions that xen
> needs to use.
> 
> Would that be OK?


Sounds good to me.

> >
> > > ---
> > > Changelog
> > > 
> > > v2: Change Subject of patch from
> > >     "pci: add enforce_slot_reserved_mask_manual property" To
> > >     "pci: allow slot_reserved_mask to be ignored with manual slot assignment"
> > > 
> > >     Add pci_bus_ignore_slot_reserved_mask_manual function
> > > 
> > >     Call pci_bus_ignore_slot_reserved_mask_manual at appropriate place
> > >     in hw/pci-host/i440fx.c
> > > 
> > >  hw/pci-host/i440fx.c     |  1 +
> > >  hw/pci/pci.c             | 14 +++++++++++++-
> > >  include/hw/pci/pci.h     |  1 +
> > >  include/hw/pci/pci_bus.h |  1 +
> > >  4 files changed, 16 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
> > > index 262f82c303..8e00b88926 100644
> > > --- a/hw/pci-host/i440fx.c
> > > +++ b/hw/pci-host/i440fx.c
> > > @@ -257,6 +257,7 @@ PCIBus *i440fx_init(const char *pci_type,
> > >      s = PCI_HOST_BRIDGE(dev);
> > >      b = pci_root_bus_new(dev, NULL, pci_address_space,
> > >                           address_space_io, 0, TYPE_PCI_BUS);
> > > +    pci_bus_ignore_slot_reserved_mask_manual(b);
> > >      s->bus = b;
> > >      object_property_add_child(qdev_get_machine(), "i440fx", OBJECT(dev));
> > >      sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > > diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> > > index 8a87ccc8b0..670ecc6986 100644
> > > --- a/hw/pci/pci.c
> > > +++ b/hw/pci/pci.c
> > > @@ -501,6 +501,7 @@ static void pci_root_bus_internal_init(PCIBus *bus, DeviceState *parent,
> > >      assert(PCI_FUNC(devfn_min) == 0);
> > >      bus->devfn_min = devfn_min;
> > >      bus->slot_reserved_mask = 0x0;
> > > +    bus->enforce_slot_reserved_mask_manual = true;
> > >      bus->address_space_mem = address_space_mem;
> > >      bus->address_space_io = address_space_io;
> > >      bus->flags |= PCI_BUS_IS_ROOT;
> > > @@ -1116,6 +1117,17 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
> > >      return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
> > >  }
> > >  
> > > +static bool pci_bus_devfn_reserved_manual(PCIBus *bus, int devfn)
> > > +{
> > > +    return bus->enforce_slot_reserved_mask_manual &&
> > > +            (bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn)));
> > > +}
> > > +
> > > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus)
> > > +{
> > > +    bus->enforce_slot_reserved_mask_manual = false;
> > > +}
> > > +
> > >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
> > >  {
> > >      return bus->slot_reserved_mask;
> > > @@ -1164,7 +1176,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
> > >                     "or reserved", name);
> > >          return NULL;
> > >      found: ;
> > > -    } else if (pci_bus_devfn_reserved(bus, devfn)) {
> > > +    } else if (pci_bus_devfn_reserved_manual(bus, devfn)) {
> > >          error_setg(errp, "PCI: slot %d function %d not available for %s,"
> > >                     " reserved",
> > >                     PCI_SLOT(devfn), PCI_FUNC(devfn), name);
> > > diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> > > index 935b4b91b4..48d29ec234 100644
> > > --- a/include/hw/pci/pci.h
> > > +++ b/include/hw/pci/pci.h
> > > @@ -287,6 +287,7 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
> > >  void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
> > >  void pci_bus_irqs_cleanup(PCIBus *bus);
> > >  int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
> > > +void pci_bus_ignore_slot_reserved_mask_manual(PCIBus *bus);
> > >  uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
> > >  void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> > >  void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
> > > diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> > > index 5653175957..e0f15ee9be 100644
> > > --- a/include/hw/pci/pci_bus.h
> > > +++ b/include/hw/pci/pci_bus.h
> > > @@ -37,6 +37,7 @@ struct PCIBus {
> > >      void *iommu_opaque;
> > >      uint8_t devfn_min;
> > >      uint32_t slot_reserved_mask;
> > > +    bool enforce_slot_reserved_mask_manual;
> > >      pci_set_irq_fn set_irq;
> > >      pci_map_irq_fn map_irq;
> > >      pci_route_irq_fn route_intx_to_irq;
> > > -- 
> > > 2.39.2
> >


