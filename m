Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E72962F545
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 13:47:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow0k7-0002Nj-1P; Fri, 18 Nov 2022 07:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow0jt-0002HO-Q7
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 07:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow0jr-0000HD-Pb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 07:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668775499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NcUGyXpWix3x5OCNUTtXV43ZVS0eiOCeLiFSNdHjqFc=;
 b=C6Bsmwp4cRtvvhrICx1qvKKlgNYtaQpDl00ixcVBeWKSJXMvLnbnTs6RrIkvUwulsOGPeO
 kDRUhzAnmuQVwnb752QF/yOO/FtGkOOaPL1Ji8CMl/FmG59Zc/tLnNRALNVJ7zCb7AR8m8
 RbUwsiohcRiaCSaLY97dDHwGViURjsE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-IHGTmlZaNLyARfgSovSLrg-1; Fri, 18 Nov 2022 07:44:50 -0500
X-MC-Unique: IHGTmlZaNLyARfgSovSLrg-1
Received: by mail-ed1-f72.google.com with SMTP id
 h9-20020a05640250c900b00461d8ee12e2so2928198edb.23
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 04:44:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NcUGyXpWix3x5OCNUTtXV43ZVS0eiOCeLiFSNdHjqFc=;
 b=VoL6i5UlfJ1bRaHxANmTYms6Tfs5lVXLxqLYJFMoVyp3ITIaQnFgfsOVyruYPjtbwH
 8GuDG0gYnF07gr9c1gRkgua5OXdBCHlYhAZGb/bzbbasfJqQLdWK8uxfvgjyXQLvPgNr
 wA1MM0+PiQwtDI8mdzU6e3fZ+vb8oHnCL+NeBjiaUyJD9QLQTzRrLy5nz+fjqnYTLq+9
 c4NVVnj/iCOr8alD43JJZ/vmcUt9amC8Fyr3d/TorLYOjcTOMJHcpIosfTyAPj7sw/ny
 JLJNCUsGSciCMhlZkDsacIr6P2vDG36eLI1x7DeoreeZyermjwX/yV+H7kWdlNQ77GQA
 pJrA==
X-Gm-Message-State: ANoB5plU58GMAZeCL+xuBNstrNDwmI93rSdh+Xr42qMdQiLVjYJrLX//
 mcFgxJbwS7vDwXgMeiEJg2jAU/p3UC+sFmZh6Y1TsLGJjbAyhsIRtj9TBUj2S3PRSMO6uIBWkF8
 zYoHBjwKOUIDIBNk=
X-Received: by 2002:a17:907:75f3:b0:78d:b046:aaae with SMTP id
 jz19-20020a17090775f300b0078db046aaaemr5638046ejc.218.1668775489308; 
 Fri, 18 Nov 2022 04:44:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7P86gHbkkOY8EdEwfFpDPe05Ihqzd4NXt0/giD9NneEDDdLcJ548wrsiemjvlJWmBniKe9lQ==
X-Received: by 2002:a17:907:75f3:b0:78d:b046:aaae with SMTP id
 jz19-20020a17090775f300b0078db046aaaemr5638010ejc.218.1668775488903; 
 Fri, 18 Nov 2022 04:44:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 kv9-20020a17090778c900b0078b03d57fa7sm1642795ejc.34.2022.11.18.04.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 04:44:48 -0800 (PST)
Date: Fri, 18 Nov 2022 13:44:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 mark.cave-ayland@ilande.co.uk, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 1/2] remove DEC 21154 PCI bridge
Message-ID: <20221118134447.6b13b791@imammedo.users.ipa.redhat.com>
In-Reply-To: <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-2-imammedo@redhat.com>
 <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 16 Nov 2022 20:39:29 +0100 (CET)
BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Wed, 16 Nov 2022, Igor Mammedov wrote:
> 
> > Code has not been used practically since its inception (2004)
> >  f2aa58c6f4a20 UniNorth PCI bridge support
> > or maybe even earlier, but it was consuming contributors time
> > as QEMU was being rewritten.
> > Drop it for now. Whomever would like to actually
> > use the thing, can make sure it actually works/reintroduce
> > it back when there is a user.
> >
> > PS:
> > I've stumbled upon this when replacing PCIDeviceClass::is_bridge
> > field with QOM cast to PCI_BRIDGE type. Unused DEC 21154
> > was the only one trying to use the field with plain PCIDevice.
> > It's not worth keeping the field around for the sake of the code
> > that was commented out 'forever'.
> >
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > hw/pci-bridge/dec.h       |   9 ---
> > include/hw/pci/pci_ids.h  |   1 -
> > hw/pci-bridge/dec.c       | 164 --------------------------------------
> > hw/pci-bridge/meson.build |   2 -
> > hw/pci-host/uninorth.c    |   6 --
> > 5 files changed, 182 deletions(-)
> > delete mode 100644 hw/pci-bridge/dec.h
> > delete mode 100644 hw/pci-bridge/dec.c
> >
> > diff --git a/hw/pci-bridge/dec.h b/hw/pci-bridge/dec.h
> > deleted file mode 100644
> > index 869e90b136..0000000000
> > --- a/hw/pci-bridge/dec.h
> > +++ /dev/null
> > @@ -1,9 +0,0 @@
> > -#ifndef HW_PCI_BRIDGE_DEC_H
> > -#define HW_PCI_BRIDGE_DEC_H
> > -
> > -
> > -#define TYPE_DEC_21154 "dec-21154-sysbus"
> > -
> > -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
> > -
> > -#endif
> > diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> > index bc9f834fd1..e4386ebb20 100644
> > --- a/include/hw/pci/pci_ids.h
> > +++ b/include/hw/pci/pci_ids.h
> > @@ -169,7 +169,6 @@
> >
> > #define PCI_VENDOR_ID_DEC                0x1011
> > #define PCI_DEVICE_ID_DEC_21143          0x0019
> > -#define PCI_DEVICE_ID_DEC_21154          0x0026
> >
> > #define PCI_VENDOR_ID_CIRRUS             0x1013
> >
> > diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
> > deleted file mode 100644
> > index 4773d07e6d..0000000000
> > --- a/hw/pci-bridge/dec.c
> > +++ /dev/null
> > @@ -1,164 +0,0 @@
> > -/*
> > - * QEMU DEC 21154 PCI bridge
> > - *
> > - * Copyright (c) 2006-2007 Fabrice Bellard
> > - * Copyright (c) 2007 Jocelyn Mayer
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaining a copy
> > - * of this software and associated documentation files (the "Software"), to deal
> > - * in the Software without restriction, including without limitation the rights
> > - * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> > - * copies of the Software, and to permit persons to whom the Software is
> > - * furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice shall be included in
> > - * all copies or substantial portions of the Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> > - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> > - * THE SOFTWARE.
> > - */
> > -
> > -#include "qemu/osdep.h"
> > -#include "dec.h"
> > -#include "hw/sysbus.h"
> > -#include "qapi/error.h"
> > -#include "qemu/module.h"
> > -#include "hw/pci/pci.h"
> > -#include "hw/pci/pci_host.h"
> > -#include "hw/pci/pci_bridge.h"
> > -#include "hw/pci/pci_bus.h"
> > -#include "qom/object.h"
> > -
> > -OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
> > -
> > -struct DECState {
> > -    PCIHostState parent_obj;
> > -};
> > -
> > -static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
> > -{
> > -    return irq_num;
> > -}
> > -
> > -static void dec_pci_bridge_realize(PCIDevice *pci_dev, Error **errp)
> > -{
> > -    pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
> > -}
> > -
> > -static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
> > -{
> > -    DeviceClass *dc = DEVICE_CLASS(klass);
> > -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> > -
> > -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > -    k->realize = dec_pci_bridge_realize;
> > -    k->exit = pci_bridge_exitfn;
> > -    k->vendor_id = PCI_VENDOR_ID_DEC;
> > -    k->device_id = PCI_DEVICE_ID_DEC_21154;
> > -    k->config_write = pci_bridge_write_config;
> > -    k->is_bridge = true;
> > -    dc->desc = "DEC 21154 PCI-PCI bridge";
> > -    dc->reset = pci_bridge_reset;
> > -    dc->vmsd = &vmstate_pci_device;
> > -}
> > -
> > -static const TypeInfo dec_21154_pci_bridge_info = {
> > -    .name          = "dec-21154-p2p-bridge",
> > -    .parent        = TYPE_PCI_BRIDGE,
> > -    .instance_size = sizeof(PCIBridge),
> > -    .class_init    = dec_21154_pci_bridge_class_init,
> > -    .interfaces = (InterfaceInfo[]) {
> > -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > -        { },
> > -    },
> > -};
> > -
> > -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
> > -{
> > -    PCIDevice *dev;
> > -    PCIBridge *br;
> > -
> > -    dev = pci_new_multifunction(devfn, false, "dec-21154-p2p-bridge");
> > -    br = PCI_BRIDGE(dev);
> > -    pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge", dec_map_irq);
> > -    pci_realize_and_unref(dev, parent_bus, &error_fatal);
> > -    return pci_bridge_get_sec_bus(br);
> > -}
> > -
> > -static void pci_dec_21154_device_realize(DeviceState *dev, Error **errp)
> > -{
> > -    PCIHostState *phb;
> > -    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> > -
> > -    phb = PCI_HOST_BRIDGE(dev);
> > -
> > -    memory_region_init_io(&phb->conf_mem, OBJECT(dev), &pci_host_conf_le_ops,
> > -                          dev, "pci-conf-idx", 0x1000);
> > -    memory_region_init_io(&phb->data_mem, OBJECT(dev), &pci_host_data_le_ops,
> > -                          dev, "pci-data-idx", 0x1000);
> > -    sysbus_init_mmio(sbd, &phb->conf_mem);
> > -    sysbus_init_mmio(sbd, &phb->data_mem);
> > -}
> > -
> > -static void dec_21154_pci_host_realize(PCIDevice *d, Error **errp)
> > -{
> > -    /* PCI2PCI bridge same values as PearPC - check this */
> > -}
> > -
> > -static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
> > -{
> > -    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
> > -    DeviceClass *dc = DEVICE_CLASS(klass);
> > -
> > -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > -    k->realize = dec_21154_pci_host_realize;
> > -    k->vendor_id = PCI_VENDOR_ID_DEC;
> > -    k->device_id = PCI_DEVICE_ID_DEC_21154;
> > -    k->revision = 0x02;
> > -    k->class_id = PCI_CLASS_BRIDGE_PCI;
> > -    k->is_bridge = true;
> > -    /*
> > -     * PCI-facing part of the host bridge, not usable without the
> > -     * host-facing part, which can't be device_add'ed, yet.
> > -     */
> > -    dc->user_creatable = false;
> > -}
> > -
> > -static const TypeInfo dec_21154_pci_host_info = {
> > -    .name          = "dec-21154",
> > -    .parent        = TYPE_PCI_DEVICE,
> > -    .instance_size = sizeof(PCIDevice),
> > -    .class_init    = dec_21154_pci_host_class_init,
> > -    .interfaces = (InterfaceInfo[]) {
> > -        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > -        { },
> > -    },
> > -};
> > -
> > -static void pci_dec_21154_device_class_init(ObjectClass *klass, void *data)
> > -{
> > -    DeviceClass *dc = DEVICE_CLASS(klass);
> > -
> > -    dc->realize = pci_dec_21154_device_realize;
> > -}
> > -
> > -static const TypeInfo pci_dec_21154_device_info = {
> > -    .name          = TYPE_DEC_21154,
> > -    .parent        = TYPE_PCI_HOST_BRIDGE,
> > -    .instance_size = sizeof(DECState),
> > -    .class_init    = pci_dec_21154_device_class_init,
> > -};
> > -
> > -static void dec_register_types(void)
> > -{
> > -    type_register_static(&pci_dec_21154_device_info);
> > -    type_register_static(&dec_21154_pci_host_info);
> > -    type_register_static(&dec_21154_pci_bridge_info);
> > -}
> > -
> > -type_init(dec_register_types)
> > diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
> > index 243ceeda50..fe92d43de6 100644
> > --- a/hw/pci-bridge/meson.build
> > +++ b/hw/pci-bridge/meson.build
> > @@ -8,8 +8,6 @@ pci_ss.add(when: 'CONFIG_PXB', if_true: files('pci_expander_bridge.c'),
> > pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c', 'xio3130_downstream.c'))
> > pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_upstream.c', 'cxl_downstream.c'))
> >
> > -# NewWorld PowerMac
> > -pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
> > # Sun4u
> > pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
> >
> > diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> > index aebd44d265..5c617e86c1 100644
> > --- a/hw/pci-host/uninorth.c
> > +++ b/hw/pci-host/uninorth.c
> > @@ -127,12 +127,6 @@ static void pci_unin_main_realize(DeviceState *dev, Error **errp)
> >                                    PCI_DEVFN(11, 0), 4, TYPE_PCI_BUS);
> >
> >     pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-north-pci");
> > -
> > -    /* DEC 21154 bridge */
> > -#if 0
> > -    /* XXX: not activated as PPC BIOS doesn't handle multiple buses properly */  
> 
> I think real hardware has this bridge and QEMU could emulate it but 
> OpenBIOS can't handle more than one PCI bus or this bridge yet so this was 
> disabled for that reason. Maybe leave the comment around as a reminder 
> that this could be brought back from git history if somebody wants to fix 
> it in the future, otherwise this may be forgotten and reimplemented from 
> scratch.

Ok, I'll leave/amend commend as you suggested on respin.

On the other hand it might not be bad if it's re-implemented
from scratch, but that could be looked into when someone tries
to bring it back. 

> 
> Regards,
> BALATON Zoltan
> 
> > -    pci_create_simple(h->bus, PCI_DEVFN(12, 0), "dec-21154");
> > -#endif
> > }
> >
> > static void pci_unin_main_init(Object *obj)
> >  
> 


