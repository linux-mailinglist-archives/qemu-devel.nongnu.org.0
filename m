Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3144C23D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:39:03 +0100 (CET)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknoc-00089l-DY
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:39:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkngS-0000C0-SY
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:30:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mkngQ-0001xH-Nb
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:30:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y/VAyXiQh2+Do2MLon01JknI6qvdVna7JoA+ZKKCAfw=;
 b=MgPNonKImkCsuFkBoz81o7EzzVKwpFzjmpKQh3uMgykHk9R8IJz26yIiPjKqJcf1Xi3rjx
 RWcY7IPFqyUqemKYIu3KydA7GTM2cwGEloOcdN2cSB+6C/6Vg5t3tzHu6FHu+q4qQfA5jd
 AZvFAuUrj1GJTkN5aey2x3hksOKoUPY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-hHaQSytvPmC17iXdv8Nbnw-1; Wed, 10 Nov 2021 08:30:31 -0500
X-MC-Unique: hHaQSytvPmC17iXdv8Nbnw-1
Received: by mail-ed1-f72.google.com with SMTP id
 f20-20020a0564021e9400b003e2ad3eae74so2336607edf.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 05:30:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5Q113OHi32AScihLoXGpEc3NgCgyoeorbk1pwb7aSs=;
 b=siNJzNIm8vVmTdkHbW3GHpi6KEjRs2Tu1CcWXXGqwWwe8qtELZiMcry6/pHy6qmxUE
 rxuGef/eWU8kDf7JEhwloReKDMpeyuOtgtU4kpPaGYicgF401djZ+1WQjHkMzKaOqMfJ
 ArdfKpBCSbRejFTq6cg4TZsmGC86fFGIeQOWy+0r5BINPArsuR+I8DND9lfN6eFBaXzI
 5b9GWupgrZUIU84+IeX+xEiHZHQIw2Bq9DpDqn2idfEJReIxmQINzBNy8D5Rj42OJmK9
 V0scXIn9dlZcUWPaspZzUql9bl1+sa+Li70yOAOjsqI6xNTHDMJXgDDZof5aZlZa0nVt
 hZQA==
X-Gm-Message-State: AOAM532bN3ZD5L80VIl/av/t7ZGYLYXsPSY7rf4I1xJmHTGCvEJ1kBx9
 dwvJY8u4gskwb+8+A+/ot+sgGoq4GoILLvuYd7SmPgj2OJDYvnAxX3X49lP8xiLW8XcUN+PCefd
 kTSnmojJ86c3RvY4=
X-Received: by 2002:a50:d492:: with SMTP id s18mr22044778edi.145.1636551029441; 
 Wed, 10 Nov 2021 05:30:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJgf9a2uKxkw6wn1B2xObq+hpIIWNYczva/aZNLa2H/fbGchail6u4JN8lBU1oiTf418IsOg==
X-Received: by 2002:a50:d492:: with SMTP id s18mr22044742edi.145.1636551029040; 
 Wed, 10 Nov 2021 05:30:29 -0800 (PST)
Received: from localhost ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id s26sm13031126edq.6.2021.11.10.05.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 05:30:28 -0800 (PST)
Date: Wed, 10 Nov 2021 14:30:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Subject: Re: [PATCH 1/5] hw/pci/pcie_port: Rename 'native-hotplug' to
 'native-hpc-bit'
Message-ID: <20211110143027.72f7ca0b@redhat.com>
In-Reply-To: <YYuMEtYOSCNO5whZ@redhat.com>
References: <20211110053014.489591-1-jusual@redhat.com>
 <20211110053014.489591-2-jusual@redhat.com>
 <20211110010239-mutt-send-email-mst@kernel.org>
 <YYuMEtYOSCNO5whZ@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julia Suvorova <jusual@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 09:08:34 +0000
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Nov 10, 2021 at 01:04:54AM -0500, Michael S. Tsirkin wrote:
> > On Wed, Nov 10, 2021 at 06:30:10AM +0100, Julia Suvorova wrote: =20
> > > Rename the option to better represent its function - toggle Hot-Plug
> > > Capable bit in the PCIe Slot Capability.
> > >=20
> > > Signed-off-by: Julia Suvorova <jusual@redhat.com>
> > > ---
> > >  include/hw/pci/pcie_port.h         | 2 +-
> > >  hw/i386/pc_q35.c                   | 2 +-
> > >  hw/pci-bridge/gen_pcie_root_port.c | 6 +++++-
> > >  hw/pci/pcie.c                      | 2 +-
> > >  hw/pci/pcie_port.c                 | 2 +-
> > >  5 files changed, 9 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
> > > index e25b289ce8..0da6d66c95 100644
> > > --- a/include/hw/pci/pcie_port.h
> > > +++ b/include/hw/pci/pcie_port.h
> > > @@ -60,7 +60,7 @@ struct PCIESlot {
> > >      /* Indicates whether any type of hot-plug is allowed on the slot=
 */
> > >      bool        hotplug;
> > > =20
> > > -    bool        native_hotplug;
> > > +    bool        native_hpc_bit;
> > > =20
> > >      QLIST_ENTRY(PCIESlot) next;
> > >  };
> > > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c =20
> >=20
> >=20
> > This is ok.
> >=20
> >  =20
> > > index 797e09500b..ded61f8ef7 100644
> > > --- a/hw/i386/pc_q35.c
> > > +++ b/hw/i386/pc_q35.c
> > > @@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
> > >                                            NULL);
> > > =20
> > >      if (acpi_pcihp) {
> > > -        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
> > > +        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hpc-bit",
> > >                                     "false", true);
> > >      }
> > > =20
> >=20
> >=20
> > This part is problematic since we made the feature user-settable in 6.1=
.
> > We can have two features if we really want to ...
> > I don't think we have a way to mark properties deprecated, do we?=20

describe them in deprecated.rst
=20
>=20
> IMHO just leave the feature with its current name. It won't be the
> first thing without a "perfect" name and the name doesn't have a
> negative impact on mgmt apps. Changing the name will cause more
> pain than it solves.

looking at the code, it was introduced in 6.1 for internal needs mostly

 3f3cbbb23 hw/pci/pcie: Do not set HPC flag if acpihp is used

to hide slot from guest's native-hotplug module.
Even if user tried explicitly to set native-hoplug=3Don on a slot
with ACPI hotplug enabled, native hotplug will not work properly
as slot's hotplug is still handled by acpi_pcihp_device_plug_cb().

Given above and that it shouldn't been used by users,
I'd rather rename it to x-native-hotplug now than go through deprecation
process and expose it for 2 more releases.


> >    =20
> > > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_p=
cie_root_port.c
> > > index 20099a8ae3..ed079d72b3 100644
> > > --- a/hw/pci-bridge/gen_pcie_root_port.c
> > > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> > > @@ -87,7 +87,11 @@ static void gen_rp_realize(DeviceState *dev, Error=
 **errp)
> > >          return;
> > >      }
> > > =20
> > > -    if (grp->res_reserve.io =3D=3D -1 && s->hotplug && !s->native_ho=
tplug) {
> > > +    /*
> > > +     * Make sure that IO is assigned in case the slot is hot-pluggab=
le
> > > +     * but it is not visible through the PCIe Slot Capabilities
> > > +     */
> > > +    if (grp->res_reserve.io =3D=3D -1 && s->hotplug && !s->native_hp=
c_bit) {
> > >          grp->res_reserve.io =3D GEN_PCIE_ROOT_DEFAULT_IO_RANGE;
> > >      }
> > >      int rc =3D pci_bridge_qemu_reserve_cap_init(d, 0,
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index 914a9bf3d1..ebe002831e 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -535,7 +535,7 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot =
*s)
> > >       * hot-plug is disabled on the slot.
> > >       */
> > >      if (s->hotplug &&
> > > -        (s->native_hotplug || DEVICE(dev)->hotplugged)) {
> > > +        (s->native_hpc_bit || DEVICE(dev)->hotplugged)) {
> > >          pci_long_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCA=
P,
> > >                                     PCI_EXP_SLTCAP_HPS |
> > >                                     PCI_EXP_SLTCAP_HPC);
> > > diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> > > index da850e8dde..eae06d10e2 100644
> > > --- a/hw/pci/pcie_port.c
> > > +++ b/hw/pci/pcie_port.c
> > > @@ -148,7 +148,7 @@ static Property pcie_slot_props[] =3D {
> > >      DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
> > >      DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
> > >      DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
> > > -    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, tru=
e),
> > > +    DEFINE_PROP_BOOL("native-hpc-bit", PCIESlot, native_hpc_bit, tru=
e),
> > >      DEFINE_PROP_END_OF_LIST()
> > >  };
> > > =20
> > > --=20
> > > 2.31.1 =20
> >=20
> >  =20
>=20
> Regards,
> Daniel


