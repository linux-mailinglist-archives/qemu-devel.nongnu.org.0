Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DB25983CD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:11:34 +0200 (CEST)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOfJ6-0000Sg-VU
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:11:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOfCT-0004qs-GN
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:04:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oOfCK-00058J-CI
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 09:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660827870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ilP5YHtXJWfK0y9ugMcWVL9G0FqwSyOyjWug20ocdA=;
 b=J1rHhtfggQXIGn9SLWKH/8ZBwKzW32Mz3lSDs89TWmB5AQ+EL184/ym8U6VttQ8GuyjDqz
 cVznOHr9doUFRmnsMsSEYSmEO+nFzUcbS09GGCftZ1FxPnSXipaj0RK51vm4UqPgh8mgwp
 FndimnnKsFKyLeQFfVRj7ArAZTBGO+o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-JYIPyjLrMtqazhcsZtEmFQ-1; Thu, 18 Aug 2022 09:04:29 -0400
X-MC-Unique: JYIPyjLrMtqazhcsZtEmFQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b00224f577fad1so203477wra.4
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 06:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=9ilP5YHtXJWfK0y9ugMcWVL9G0FqwSyOyjWug20ocdA=;
 b=ipGpqMfGj4WUD18fB9Fy0i3065qbCGkvwEsIeErkgcffts6vuabDkkk2BoL2SEpHVw
 SaY4d0LsUC0+W4J7PkHN82V7+1sjSKWe3p1RKZbiZPwfvR66HQUHUmkG7sjty6w68L1i
 7M0MKVPFn8OmO11EpDUdvzC5w5MKW5BEkXqQ+iuHkkxhoC9Wci8tBqEFPE3ME2z7PkoE
 eEm4rs7/pGHiEUmeEJkIR6Y/LGMOS3UAlGD3SA2mpv3IG1HeEJBc+3JGEgAkbmRJseP8
 eUT5TeCs1aj42j2RfCGMbNiBX7vgomaFjpskXLGhvtpQOBhc6VEMrMLq+1yXyeR5T27D
 EnZw==
X-Gm-Message-State: ACgBeo3OfEKu7hI0rccXfoM4kQdTfW6FweiHhMP2gLfHY5p6ZWOz8Az4
 dGDOv7Xv/JR7VBkniwNeS2wVnRUYcvxJytedv84xG9WJTooDFRm0SMzsK0FqQGaIXOq12bRDPwJ
 O+WsE0LzCnozq0DA=
X-Received: by 2002:a5d:6b12:0:b0:21f:1568:c7e1 with SMTP id
 v18-20020a5d6b12000000b0021f1568c7e1mr1608834wrw.532.1660827867066; 
 Thu, 18 Aug 2022 06:04:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7BPPFLet3YcvvlTkf8tyjV/T4yMsXvHe4EzmFjmDEab8qTRe8uAHiv8m95jDTDNqFz568pUg==
X-Received: by 2002:a5d:6b12:0:b0:21f:1568:c7e1 with SMTP id
 v18-20020a5d6b12000000b0021f1568c7e1mr1608814wrw.532.1660827866735; 
 Thu, 18 Aug 2022 06:04:26 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 t126-20020a1c4684000000b003a5fe5ed7edsm6225532wma.0.2022.08.18.06.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 06:04:25 -0700 (PDT)
Date: Thu, 18 Aug 2022 14:04:23 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Andrey Ryabinin <arbn@yandex-team.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, quintela@redhat.com,
 qemu-devel@nongnu.org, yc-core@yandex-team.com
Subject: Re: [PATCH] pci/pci_expander_bridge: migrate state of pxb/pxb-pcie
 devices.
Message-ID: <Yv441+TMUlQOZOvK@work-vm>
References: <20220811164901.25042-1-arbn@yandex-team.com>
 <3cdc0316-b615-107f-65bf-dda340841f73@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3cdc0316-b615-107f-65bf-dda340841f73@yandex-team.ru>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vladimir Sementsov-Ogievskiy (vsementsov@yandex-team.ru) wrote:
> [add migration maintainers]

Thanks,

> On 8/11/22 19:49, Andrey Ryabinin wrote:
> > pxb/pxb-pcie/pxb-cxl devices currently doesn't have vmstate description
> > So the state of device is not preserved during migration and
> > guest can notice that as change of PCI_COMMAND_* registers state.
> > 
> > The diff of lspci output before and after migration:
> > 
> >   00:03.0 Host bridge [0600]: Red Hat, Inc. QEMU PCIe Expander bridge [1b36:000b]
> >           Subsystem: Red Hat, Inc QEMU PCIe Expander bridge [1af4:1100]
> >   -       Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B- DisINTx-
> >   +       Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
> >           Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-

Do you notice any other symptoms other than that minor diff?

> > Add VMStateDescription to pxb devices so their state is transferred
> > during migrations. For saving migration compatibility add
> > 'x-config-reg-migration-enabled' property to pxb devices and disable
> > it for all released machine types.
> > 
> > Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> > ---
> >   hw/core/machine.c                   |  3 +++
> >   hw/pci-bridge/pci_expander_bridge.c | 24 ++++++++++++++++++++++++
> >   include/hw/pci/pci_bridge.h         |  1 +
> >   3 files changed, 28 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index a673302ccec..071853469e2 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -43,6 +43,9 @@
> >   GlobalProperty hw_compat_7_0[] = {
> >       { "arm-gicv3-common", "force-8-bit-prio", "on" },
> >       { "nvme-ns", "eui64-default", "on"},
> > +    { "pxb", "x-config-reg-migration-enabled", "off" },
> > +    { "pxb-cxl", "x-config-reg-migration-enabled", "off" },
> > +    { "pxb-pcie", "x-config-reg-migration-enabled", "off" },
> 
> 
> Seems that it's too late for 7.1, rc2 is out and rc3 is coming soon. And that's not a degradation.

Yeh

> Up to maintainers, but I think we'd better start new hw_compat_7_1 for this thing.

Yep.


Dave
> 
> >   };
> >   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
> > diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> > index c9e817aa586..a3680d4d045 100644
> > --- a/hw/pci-bridge/pci_expander_bridge.c
> > +++ b/hw/pci-bridge/pci_expander_bridge.c
> > @@ -23,6 +23,7 @@
> >   #include "qemu/error-report.h"
> >   #include "qemu/module.h"
> >   #include "sysemu/numa.h"
> > +#include "migration/vmstate.h"
> >   #include "hw/boards.h"
> >   #include "qom/object.h"
> > @@ -404,9 +405,29 @@ static Property pxb_dev_properties[] = {
> >       DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
> >       DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
> >       DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
> > +    DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PXBDev,
> > +                     migratable, true),
> 
> With it, do we create a user-visible property? If so, is it possible to avoid it?
> 
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> > +static bool pxb_vmstate_needed(void *opaque)
> > +{
> > +    PXBDev *pxb = opaque;
> > +
> > +    return pxb->migratable;
> > +}
> > +
> > +static const VMStateDescription vmstate_pxb_device = {
> > +    .name = "pxb-pci",
> > +    .needed = pxb_vmstate_needed,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_PCI_DEVICE(parent_obj, PXBDev),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> >   static void pxb_dev_class_init(ObjectClass *klass, void *data)
> >   {
> >       DeviceClass *dc = DEVICE_CLASS(klass);
> > @@ -422,6 +443,7 @@ static void pxb_dev_class_init(ObjectClass *klass, void *data)
> >       device_class_set_props(dc, pxb_dev_properties);
> >       dc->hotpluggable = false;
> >       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > +    dc->vmsd = &vmstate_pxb_device;
> >   }
> >   static const TypeInfo pxb_dev_info = {
> > @@ -460,6 +482,7 @@ static void pxb_pcie_dev_class_init(ObjectClass *klass, void *data)
> >       device_class_set_props(dc, pxb_dev_properties);
> >       dc->hotpluggable = false;
> >       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> > +    dc->vmsd = &vmstate_pxb_device;
> >   }
> >   static const TypeInfo pxb_pcie_dev_info = {
> > @@ -504,6 +527,7 @@ static void pxb_cxl_dev_class_init(ObjectClass *klass, void *data)
> >       /* Host bridges aren't hotpluggable. FIXME: spec reference */
> >       dc->hotpluggable = false;
> >       dc->reset = pxb_dev_reset;
> > +    dc->vmsd = &vmstate_pxb_device;
> >   }
> >   static const TypeInfo pxb_cxl_dev_info = {
> > diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
> > index ba4bafac7c2..404dc02e36e 100644
> > --- a/include/hw/pci/pci_bridge.h
> > +++ b/include/hw/pci/pci_bridge.h
> > @@ -91,6 +91,7 @@ struct PXBDev {
> >       uint8_t bus_nr;
> >       uint16_t numa_node;
> >       bool bypass_iommu;
> > +    bool migratable;
> >       struct cxl_dev {
> >           CXLHost *cxl_host_bridge; /* Pointer to a CXLHost */
> >       } cxl;
> 
> 
> -- 
> Best regards,
> Vladimir
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


