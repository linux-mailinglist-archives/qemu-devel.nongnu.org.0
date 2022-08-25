Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61B5A0B63
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:26:12 +0200 (CEST)
Received: from localhost ([::1]:54142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8Bn-00039C-Pe
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7rs-00059N-Q0
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:05:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oR7ro-00047u-Uj
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661414732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DuuQU/Xphy2TSN0/jpai3w7vkWOURgncOeBC6SNjms=;
 b=GmUKHzYcowD2egLzDhPaeFaWFPvctEunYXpi05wHCbUZWrerb3bqgc7MLcwljbZVLwXj5l
 6epeN963JEesTxXZXzoZ4qA/E8rcDcOaqeD/+cWh0I7cySSKXtREpNhWJXaT+t91WO+brf
 AcCtN0anqooH3Z2nfqa5BhEJoYR+u2Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-RH6m5vtqMhGbG_IUxXpbag-1; Thu, 25 Aug 2022 04:05:31 -0400
X-MC-Unique: RH6m5vtqMhGbG_IUxXpbag-1
Received: by mail-ej1-f69.google.com with SMTP id
 hd35-20020a17090796a300b0073d67a500e6so3965986ejc.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 01:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=6DuuQU/Xphy2TSN0/jpai3w7vkWOURgncOeBC6SNjms=;
 b=F+tqTt0LYy3B+eFD+whcS7d5CafXtKcGEfRfM/3pePxRkBkjUOV5+X71Kk6jnC4snD
 eXe5bLMw7wZ96NfnGG2qsWoN+fHEK5hfPLSd7FwGO9vwh9zH2aSTgStOhf3ZZYHb4Alg
 7hWK4l6QRD4a0uGmmdIJPiiZlu2cCInq5IvAciIKRvjUo0x4/Ez7bhuxVgR3HJMrXBN/
 14tiyDbO64bCzX68U9iU3IlpZw5UfjNAa8Twuw4NqSpWrO+YPrgD/CRwBWwhV+A8/oJr
 UuUciDOAEeRSYDtzGOJaYHazcslw9gg4aHDscObVVIsIefY6fFqObrCiplHHzYTCRbJv
 K07g==
X-Gm-Message-State: ACgBeo1/9k/7lllbf5T/yiZRZcTzwoWdCp5YFFvzlbsl1+fMTSFC6Dfb
 OCz0p5kDNysRf5viqvYJ8XWrHkz2R6hcXiJqaa7kKWzujNqGxxyqMLDMFLD3iPNvYcxNHe00GLJ
 vo++6j3ITGFn17QY=
X-Received: by 2002:a05:6402:5024:b0:440:e4ad:f7b6 with SMTP id
 p36-20020a056402502400b00440e4adf7b6mr2177855eda.358.1661414729858; 
 Thu, 25 Aug 2022 01:05:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4z1/X5InF/C6sK7VWz+MhUI6qgfGWWnDuj/2E6icBpQnr/+L4wyiwSnmjrx++FC8spDjgKpw==
X-Received: by 2002:a05:6402:5024:b0:440:e4ad:f7b6 with SMTP id
 p36-20020a056402502400b00440e4adf7b6mr2177830eda.358.1661414729597; 
 Thu, 25 Aug 2022 01:05:29 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 gy18-20020a170906f25200b0073c37199b86sm2126263ejb.159.2022.08.25.01.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 01:05:29 -0700 (PDT)
Date: Thu, 25 Aug 2022 10:05:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 jusual@redhat.com, kkostiuk@redhat.com, qemu-devel@nongnu.org,
 ybendito@redhat.com, yvugenfi@redhat.com, jasowang@redhat.com,
 peterx@redhat.com
Subject: Re: [PATCH 2/4] hw/acpi: set ATS capability explicitly per pcie
 root port
Message-ID: <20220825100528.398bf931@redhat.com>
In-Reply-To: <CAARzgwz8inPfcTLvQx1tEVHdoB39jN_Vie0uS5_soEYd_yUHOA@mail.gmail.com>
References: <20220822090811.427029-1-ani@anisinha.ca>
 <20220822090811.427029-3-ani@anisinha.ca>
 <20220824172429.058281c4@redhat.com>
 <CAARzgwz8inPfcTLvQx1tEVHdoB39jN_Vie0uS5_soEYd_yUHOA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Wed, 24 Aug 2022 21:46:58 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> On Wed, Aug 24, 2022 at 8:54 PM Igor Mammedov <imammedo@redhat.com> wrote:
>=20
> > On Mon, 22 Aug 2022 14:38:09 +0530
> > Ani Sinha <ani@anisinha.ca> wrote:
> > =20
> > > Currently the bit 0 of the flags field of Root Port ATS capability =20
> > reporting =20
> > > structure sub-table under the DMAR table is set to 1. This indicates =
=20
> > ALL_PORTS, =20
> > > thus enabling ATS capability for all pcie roots without the ability t=
o =20
> > turn off =20
> > > ATS for some ports and leaving ATS on for others.
> > >
> > > This change clears the bit 0 of the flags field of the above structur=
e =20
> > and =20
> > > explicitly adds scopes for every pcie root port in the structure so t=
hat =20
> > ATS =20
> > > is enabled for all of them. In future, we might add new attribite to =
the =20
> > root =20
> > > ports so that we can selectively enable ATS for some and leave ATS of=
f =20
> > for =20
> > > others. =20
> >
> > Thanks, it was worth a try,
> > unfortunately since we are shooting in dark this time it was a miss. =20
>=20
>=20
> So I take it that even with this patch Windows still exhibited the issue?
unfortunately, yep

> Is it worth pushing the patch anyway?
it will extra cpu time and guest RAM,
so unless we have to have to I'd rather not.
=20
>=20
> >
> > =20
> > > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > > Suggested-by: Michael Tsirkin <mst@redhat.com>
> > > ---
> > >  hw/i386/acpi-build.c | 74 ++++++++++++++++++++++++++++++++++++++++++=
--
> > >  1 file changed, 72 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 0355bd3dda..9c5a555536 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -60,6 +60,7 @@
> > >  #include "hw/i386/fw_cfg.h"
> > >  #include "hw/i386/ich9.h"
> > >  #include "hw/pci/pci_bus.h"
> > > +#include "hw/pci/pcie_port.h"
> > >  #include "hw/pci-host/q35.h"
> > >  #include "hw/i386/x86-iommu.h"
> > >
> > > @@ -2118,6 +2119,60 @@ dmar_host_bridges(Object *obj, void *opaque)
> > >      return 0;
> > >  }
> > >
> > > +/*
> > > + * Insert DMAR scope for PCIE root ports
> > > + */
> > > +static void
> > > +insert_pcie_root_port_scope(PCIBus *bus, PCIDevice *dev, void *opaqu=
e)
> > > +{
> > > +    const size_t device_scope_size =3D 6 + 2;
> > > +                                   /* device scope structure + 1 pat=
h =20
> > entry */ =20
> > > +    GArray *scope_blob =3D opaque;
> > > +
> > > +    /*
> > > +     * We are only interested in PCIE root ports. We can extend
> > > +     * this to check for specific properties of PCIE root ports and =
=20
> > based =20
> > > +     * on that remove some ports from having ATS capability.
> > > +     */
> > > +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCIE_ROOT_PORT)) {
> > > +        return;
> > > +    }
> > > +
> > > +    /* Dmar Scope Type: 0x02 for all PCIE root ports */
> > > +    build_append_int_noprefix(scope_blob, 0x02, 1);
> > > +
> > > +    /* length */
> > > +    build_append_int_noprefix(scope_blob, device_scope_size, 1);
> > > +    /* reserved */
> > > +    build_append_int_noprefix(scope_blob, 0, 2);
> > > +    /* enumeration_id */
> > > +    build_append_int_noprefix(scope_blob, 0, 1);
> > > +    /* bus */
> > > +    build_append_int_noprefix(scope_blob, pci_bus_num(bus), 1);
> > > +    /* device */
> > > +    build_append_int_noprefix(scope_blob, PCI_SLOT(dev->devfn), 1);
> > > +    /* function */
> > > +    build_append_int_noprefix(scope_blob, PCI_FUNC(dev->devfn), 1);
> > > +}
> > > +
> > > +/* For a given PCI host bridge, walk and insert DMAR scope */
> > > +static int
> > > +dmar_pcie_root_ports(Object *obj, void *opaque)
> > > +{
> > > +    GArray *scope_blob =3D opaque;
> > > +
> > > +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> > > +        PCIBus *bus =3D PCI_HOST_BRIDGE(obj)->bus;
> > > +
> > > +        if (bus && !pci_bus_bypass_iommu(bus)) {
> > > +            pci_for_each_device_under_bus(bus, =20
> > insert_pcie_root_port_scope, =20
> > > +                                          scope_blob);
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >  /*
> > >   * Intel =C2=AE Virtualization Technology for Directed I/O
> > >   * Architecture Specification. Revision 3.3
> > > @@ -2190,11 +2245,26 @@ build_dmar_q35(GArray *table_data, BIOSLinker=
 =20
> > *linker, const char *oem_id, =20
> > >
> > >      if (iommu->dt_supported) {
> > >          /* 8.5 Root Port ATS Capability Reporting Structure */
> > > +        /*
> > > +         * A PCI bus walk, for each PCIE root port.
> > > +         * Since we did not enable ALL_PORTS bit in the flags above,=
 we
> > > +         * need to add the scope for each pcie root port explicitly
> > > +         * that are attached to bus0 with iommu enabled.
> > > +         */
> > > +        scope_blob =3D g_array_new(false, true, 1);
> > > +        object_child_foreach_recursive(object_get_root(),
> > > +                                       dmar_pcie_root_ports, =20
> > scope_blob); =20
> > > +
> > >          build_append_int_noprefix(table_data, 2, 2); /* Type */
> > > -        build_append_int_noprefix(table_data, 8, 2); /* Length */
> > > -        build_append_int_noprefix(table_data, 1 /* ALL_PORTS */, 1);=
 /* =20
> > Flags */ =20
> > > +        build_append_int_noprefix(table_data,
> > > +                                  8 + scope_blob->len, 2); /* Length=
 */
> > > +        build_append_int_noprefix(table_data, 0, 1); /* Flags */
> > >          build_append_int_noprefix(table_data, 0, 1); /* Reserved */
> > >          build_append_int_noprefix(table_data, 0, 2); /* Segment Numb=
er =20
> > */ =20
> > > +
> > > +        /* now add the scope to the sub-table */
> > > +        g_array_append_vals(table_data, scope_blob->data, =20
> > scope_blob->len); =20
> > > +        g_array_free(scope_blob, true);
> > >      }
> > >
> > >      acpi_table_end(linker, &table); =20
> >
> > =20


