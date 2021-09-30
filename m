Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C657041D58D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:36:31 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrYM-0007bX-TX
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVrWY-0005xK-As
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:34:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mVrWV-000268-Fs
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:34:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632990874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMxox06wry7fOQB1NbLB2v4Z9QehDnBGuBwr+j20JvM=;
 b=NBRPxtjWSfDM3ZPFEOOxEbgGQSWBiiTf/GeSkQEH65jGEWLAbC+1qvPCgYH7j6i3MDDX6t
 uH3a1c4hge26lSf02I1XXk494v+7Ommi9dx1yhoip0vNnog3kEzzQVP8gcn2TAOy+qrO8X
 iaRtjykBC3aO61cxPB1AfUZnhLrgGh4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-Qh3AbJ54MRWHe7nO1qXPSQ-1; Thu, 30 Sep 2021 04:34:28 -0400
X-MC-Unique: Qh3AbJ54MRWHe7nO1qXPSQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso5421025edj.20
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 01:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GTJMzLS3rhBUpVlTiugfSArbJxb4AzMspHSEMIQ+5K4=;
 b=UfUkMf2xATPYwZCsrEBXAqJweMLc2MjqQzUyw5gazmh/l0Fl2pGXuhkcsB5FhTfRA/
 9mMw5r8ba0zR5tfpb6jVWi7h8LVAu5xLjNlZc3MukfPoFCzIMSJzwaF5JRD4FR1MpG0F
 CfvZ/SLDq4mhOM6aN7Z1rtktmDNNDwC6ZyoPShCn8DpU/xstXjrxSEB2raX/aZ9KVFJv
 CPEFTpf58J9Zgu/iDq225c0Qqhh6lUsD2GzAQyGDSNlc165n1kXltAklRRUgLKv94Cln
 mLOziV9mr/Q2YTveNRvxlXn+b5eIiLEemgJxgCrfstVkIsRnEDgvr9wAaytAU62ZdXMj
 FlNg==
X-Gm-Message-State: AOAM531NmplUpW/qefRoaC8DCnYokeVyUxe2diMWQx1fUisHxEftkbhf
 d9s9ZyeSqO8TcNhgEScumcnfhEtpLrveyI0nlmWsIoU07Y9M/VUTqUi2PFdt/UzNuzDif54QETp
 eoyptesmZFnMFLxE=
X-Received: by 2002:a17:906:34c5:: with SMTP id
 h5mr5399089ejb.152.1632990866966; 
 Thu, 30 Sep 2021 01:34:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywEdMyvycuIKaWx5Qwp1IwSASde2xLyDh8NhKTuSgQIfNttu+g26xQCprpAo9L756tpMa/Tg==
X-Received: by 2002:a17:906:34c5:: with SMTP id
 h5mr5399060ejb.152.1632990866656; 
 Thu, 30 Sep 2021 01:34:26 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id cn8sm1082336edb.77.2021.09.30.01.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 01:34:26 -0700 (PDT)
Date: Thu, 30 Sep 2021 10:34:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PULL 1/5] hw/pcie-root-port: Fix hotplug for PCI devices
 requiring IO
Message-ID: <20210930103424.5f408978@redhat.com>
In-Reply-To: <20210929172519-mutt-send-email-mst@kernel.org>
References: <20210803205043.165034-1-mst@redhat.com>
 <20210803205043.165034-2-mst@redhat.com>
 <YVGP9vdTtu5sRVpl@redhat.com>
 <20210927053932-mutt-send-email-mst@kernel.org>
 <CA+aaKfDO_KRZYova9fGkPAr0vgh=YygATZ87iwrfqeV=CyN=tg@mail.gmail.com>
 <20210929172519-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: marcel@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Sep 2021 17:47:37 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Sep 29, 2021 at 04:41:49PM +0300, Marcel Apfelbaum wrote:
> > Hi=C2=A0Michael,
> >=20
> > On Mon, Sep 27, 2021 at 12:49 PM Michael S. Tsirkin <mst@redhat.com> wr=
ote:
> >=20
> >     On Mon, Sep 27, 2021 at 10:33:42AM +0100, Daniel P. Berrang=C3=A9 w=
rote: =20
> >     > On Tue, Aug 03, 2021 at 04:52:03PM -0400, Michael S. Tsirkin wrot=
e: =20
> >     > > From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> >     > >
> >     > > Q35 has now ACPI hotplug enabled by default for PCI(e) devices.
> >     > > As opposed to native PCIe hotplug, guests like Fedora 34
> >     > > will not assign IO range to pcie-root-ports not supporting
> >     > > native hotplug, resulting into a regression.
> >     > >
> >     > > Reproduce by:
> >     > >=C2=A0 =C2=A0 =C2=A0qemu-bin -M q35 -device pcie-root-port,id=3D=
p1 -monitor stdio
> >     > >=C2=A0 =C2=A0 =C2=A0device_add e1000,bus=3Dp1
> >     > > In the Guest OS the respective pcie-root-port will have the IO =
range
> >     > > disabled.
> >     > >
> >     > > Fix it by setting the "reserve-io" hint capability of the
> >     > > pcie-root-ports so the firmware will allocate the IO range inst=
ead.
> >     > >
> >     > > Acked-by: Igor Mammedov <imammedo@redhat.com>
> >     > > Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
> >     > > Message-Id: <20210802090057.1709775-1-marcel@redhat.com>
> >     > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >     > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >     > > ---
> >     > >=C2=A0 hw/pci-bridge/gen_pcie_root_port.c | 5 +++++
> >     > >=C2=A0 1 file changed, 5 insertions(+) =20
> >     >
> >     > This change, when combined with the switch to ACPI based hotplug =
by
> >     > default, is responsible for a significant regression in QEMU 6.1.=
0
> >     >
> >     > It is no longer possible to have more than 15 pcie-root-port devi=
ces
> >     > added to a q35 VM in 6.1.0.=C2=A0 Before this I've had as many as=
 80+ devices
> >     > present before I stopped trying to add more.
> >     >
> >     >=C2=A0 =C2=A0https://gitlab.com/qemu-project/qemu/-/issues/641
> >     >
> >     > This regression is significant, because it has broken the out of =
the
> >     > box default configuration that OpenStack uses for booting all VMs=
.
> >     > They add 16 pcie-root-ports by defalt to allow empty slots for de=
vice
> >     > hotplug under q35 [1]. =20
> >=20
> >=20
> >     Indeed, oops. Thanks for the report!
> >=20
> >     Going back and looking at seabios code, didn't we get confused?
> >     Shouldn't we have reserved memory and not IO?
> >=20
> >=20
> > We need the IO space for the legacy PCI bridges, otherwise an empty PCI=
 bridge
> > will become unusable. =20
>=20
> Maybe we should go back to using OSC then ... the issue
> is we can't then mix acpi and native hotplug for bridges.

How OSC could help with the issue?

> >=20
> >=20
> >     I see:
> >     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int resource_optional =3D=
 pcie_cap && (type =3D=3D
> >     PCI_REGION_TYPE_IO);
> >     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sum && hotplug_suppo=
rt && !resource_optional)
> >     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum =3D ali=
gn; /* reserve min size for hot-plug */
> >=20
> >=20
> >     generally maybe we should just add an ACPI-hotplug capability and
> >     teach seabios about it?
> >=20
> >=20
> > I suppose it is possible.
> >=20
> > Thanks,
> > Marcel
> > =C2=A0
> >=20
> >=20
> >     Marcel?
> >  =20
> >     > > diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge=
/ =20
> >     gen_pcie_root_port.c =20
> >     > > index ec9907917e..20099a8ae3 100644
> >     > > --- a/hw/pci-bridge/gen_pcie_root_port.c
> >     > > +++ b/hw/pci-bridge/gen_pcie_root_port.c
> >     > > @@ -28,6 +28,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(GenPCIERootPort, =
=20
> >     GEN_PCIE_ROOT_PORT) =20
> >     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (GEN_PCIE_ROOT_PORT_AER_OFFSE=
T + PCI_ERR_SIZEOF)
> >     > >=C2=A0
> >     > >=C2=A0 #define GEN_PCIE_ROOT_PORT_MSIX_NR_VECTOR=C2=A0 =C2=A0 =
=C2=A0 =C2=A01
> >     > > +#define GEN_PCIE_ROOT_DEFAULT_IO_RANGE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 4096
> >     > >=C2=A0
> >     > >=C2=A0 struct GenPCIERootPort {
> >     > >=C2=A0 =C2=A0 =C2=A0 /*< private >*/
> >     > > @@ -75,6 +76,7 @@ static bool gen_rp_test_migrate_msix(void *op=
aque, =20
> >     int version_id) =20
> >     > >=C2=A0 static void gen_rp_realize(DeviceState *dev, Error **errp=
)
> >     > >=C2=A0 {
> >     > >=C2=A0 =C2=A0 =C2=A0 PCIDevice *d =3D PCI_DEVICE(dev);
> >     > > +=C2=A0 =C2=A0 PCIESlot *s =3D PCIE_SLOT(d);
> >     > >=C2=A0 =C2=A0 =C2=A0 GenPCIERootPort *grp =3D GEN_PCIE_ROOT_PORT=
(d);
> >     > >=C2=A0 =C2=A0 =C2=A0 PCIERootPortClass *rpc =3D PCIE_ROOT_PORT_G=
ET_CLASS(d);
> >     > >=C2=A0 =C2=A0 =C2=A0 Error *local_err =3D NULL;
> >     > > @@ -85,6 +87,9 @@ static void gen_rp_realize(DeviceState *dev, =
Error =20
> >     **errp) =20
> >     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> >     > >=C2=A0 =C2=A0 =C2=A0 }
> >     > >=C2=A0
> >     > > +=C2=A0 =C2=A0 if (grp->res_reserve.io =3D=3D -1 && s->hotplug =
&& !s->native_hotplug) =20
> >     { =20
> >     > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 grp->res_reserve.io =3D GEN_PCIE_R=
OOT_DEFAULT_IO_RANGE;
> >     > > +=C2=A0 =C2=A0 }
> >     > >=C2=A0 =C2=A0 =C2=A0 int rc =3D pci_bridge_qemu_reserve_cap_init=
(d, 0,
> >     > >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 grp->res_reserve, errp);
> >     > >=C2=A0
> >     > > --
> >     > > MST
> >     > >
> >     > > =20
> >     >
> >     > Regards,
> >     > Daniel
> >     >
> >     > [1] https://github.com/openstack/tripleo-heat-templates/blob/ =20
> >     7a6cd0640ec390a330f5699d8ed60f71b2a9f514/deployment/nova/
> >     nova-compute-container-puppet.yaml#L462-L472 =20
> >     > --
> >     > |: https://berrange.com=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 http=
s://www.flickr.com/photos/ =20
> >     dberrange :| =20
> >     > |: https://libvirt.org=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 https:// =20
> >     fstop138.berrange.com :| =20
> >     > |: https://entangle-photo.org=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 https=
://www.instagram.com/ =20
> >     dberrange :|
> >=20
> >  =20
>=20


