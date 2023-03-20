Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211396C19ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:40:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHbp-0002yQ-IN; Mon, 20 Mar 2023 11:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1peHbn-0002yE-JN
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:39:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1peHbl-0001VH-QM
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679326776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfzL/GgCW2CKNwtkDsBYd1qkUAO9AgnnTTIWuJIHgCI=;
 b=GiYYbbpj3DFVYTg2+liBnboIjorf4g8CCX+PuMd/hekAUVgJvFDkVfhIVoJF6OBlGij+bV
 5jsP7NMvOmMKaIiWFtkte7mAR8jsc12aSLhcid1J0IS+HMpEQrduzpnGhyEjaiGVGDYQDk
 zCHMCr1mpC5DzGIg/sUULF16d/vom0g=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-vDqo5s1DOUeatapMrKXbrg-1; Mon, 20 Mar 2023 11:39:35 -0400
X-MC-Unique: vDqo5s1DOUeatapMrKXbrg-1
Received: by mail-il1-f199.google.com with SMTP id
 n17-20020a056e02141100b003259a56715bso973283ilo.15
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VfzL/GgCW2CKNwtkDsBYd1qkUAO9AgnnTTIWuJIHgCI=;
 b=lBbH5NwRnFfnPHTG2lecvw1Wcj3jhFOcGkl+bqJUQ9dQ9xqGVjuy5OXCLvWuhLoOCE
 rfGdFMBSij6bf3EMhACk3CFSYaxOQB9McEXohWEAcd6Q1Opt+YnM1lx0JWCgWV2eqs9y
 10UjFwydFYnaXVVWLo2IVMfydHHHwBl2NL8kZq3FjCeZjD3G5lsh6Dnsg7uatvlQuF+7
 BrvWLU0svV0OuD0PLYweqX5KOVSo78/2Iaf5/hNt2wRDtun7uR9VcuOA9yTgq3bIZ7BS
 vEH2RRce2qGmCcdrAxZUISysgJMJosC/bBCMvIAD3ow6FJK5Kx/BcLpy0NS/IE8ijMSn
 6UAQ==
X-Gm-Message-State: AO0yUKXmKYI7hRryt/bxjpnfge/YbD6pw3bwI+MC/isD0Q3PVxP3eEMA
 qXcneemcBcrvSyqngIaA2SVLvZfhparL+MtUNonUnBv5m6chEf5s8EZ/6F0HBGYvRJEQcx8FNWz
 26EzQPHEv+znVVgs=
X-Received: by 2002:a92:d489:0:b0:316:4d84:1d0 with SMTP id
 p9-20020a92d489000000b003164d8401d0mr4894603ilg.12.1679326774727; 
 Mon, 20 Mar 2023 08:39:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+J1WtEW+Hy0e/VadD+s2XaJCATRPh79M7EW9esV2rEWIS56a08cYfKqiNzYeJsOOxt2xLpng==
X-Received: by 2002:a92:d489:0:b0:316:4d84:1d0 with SMTP id
 p9-20020a92d489000000b003164d8401d0mr4894561ilg.12.1679326773481; 
 Mon, 20 Mar 2023 08:39:33 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 i15-20020a056e020d8f00b00314007fdbc2sm2868638ilj.62.2023.03.20.08.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 08:39:32 -0700 (PDT)
Date: Mon, 20 Mar 2023 09:39:31 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Cc: <minwoo.im@samsung.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, SSDR Gost Dev <gost.dev@samsung.com>, Klaus
 Birkelund Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] vfio/pci: add support for VF token
Message-ID: <20230320093931.29015496.alex.williamson@redhat.com>
In-Reply-To: <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
References: <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
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

On Mon, 20 Mar 2023 11:03:40 +0100
C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> On 3/20/23 08:35, Minwoo Im wrote:
> > VF token was introduced [1] to kernel vfio-pci along with SR-IOV
> > support [2].  This patch adds support VF token among PF and VF(s). To
> > passthu PCIe VF to a VM, kernel >=3D v5.7 needs this.
> >=20
> > It can be configured with UUID like:
> >=20
> >    -device vfio-pci,host=3DDDDD:BB:DD:F,vf-token=3D<uuid>,...
> >=20
> > [1] https://lore.kernel.org/linux-pci/158396393244.5601.102974307249640=
25753.stgit@gimli.home/
> > [2] https://lore.kernel.org/linux-pci/158396044753.5601.148048706811747=
89709.stgit@gimli.home/
> >=20
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
> > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >   hw/vfio/pci.c | 13 ++++++++++++-
> >   hw/vfio/pci.h |  1 +
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > index ec9a854361..cf27f28936 100644
> > --- a/hw/vfio/pci.c
> > +++ b/hw/vfio/pci.c
> > @@ -2856,6 +2856,8 @@ static void vfio_realize(PCIDevice *pdev, Error *=
*errp)
> >       int groupid;
> >       int i, ret;
> >       bool is_mdev;
> > +    char uuid[UUID_FMT_LEN];
> > +    char *name;
> >  =20
> >       if (!vbasedev->sysfsdev) {
> >           if (!(~vdev->host.domain || ~vdev->host.bus ||
> > @@ -2936,7 +2938,15 @@ static void vfio_realize(PCIDevice *pdev, Error =
**errp)
> >           goto error;
> >       }
> >  =20
> > -    ret =3D vfio_get_device(group, vbasedev->name, vbasedev, errp);
> > +    if (!qemu_uuid_is_null(&vdev->vf_token)) {
> > +        qemu_uuid_unparse(&vdev->vf_token, uuid);
> > +        name =3D g_strdup_printf("%s vf_token=3D%s", vbasedev->name, u=
uid);
> > +    } else {
> > +        name =3D vbasedev->name;
> > +    }
> > +
> > +    ret =3D vfio_get_device(group, name, vbasedev, errp);
> > +    g_free(name);
> >       if (ret) {
> >           vfio_put_group(group);
> >           goto error; =20
>=20
> Shouldn't we set the VF token in the kernel also ? See this QEMU implemen=
tation
>=20
>    https://lore.kernel.org/lkml/20200204161737.34696b91@w520.home/
>=20
> May be I misunderstood.
>=20

I think you're referring to the part there that calls
VFIO_DEVICE_FEATURE in order to set a VF token.  I don't think that's
necessarily applicable here.  I believe this patch is only trying to
make it so that QEMU can consume a VF associated with a PF owned by a
userspace vfio driver, ie. not QEMU.

Setting the VF token is only relevant to PFs, which would require
significantly more SR-IOV infrastructure in QEMU than sketched out in
that proof-of-concept patch.  Even if we did have a QEMU owned PF where
we wanted to generate VFs, the token we use in that case would likely
need to be kept private to QEMU, not passed on the command line.
Thanks,

Alex

> > @@ -3268,6 +3278,7 @@ static void vfio_instance_init(Object *obj)
> >  =20
> >   static Property vfio_pci_dev_properties[] =3D {
> >       DEFINE_PROP_PCI_HOST_DEVADDR("host", VFIOPCIDevice, host),
> > +    DEFINE_PROP_UUID_NODEFAULT("vf-token", VFIOPCIDevice, vf_token),
> >       DEFINE_PROP_STRING("sysfsdev", VFIOPCIDevice, vbasedev.sysfsdev),
> >       DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCI=
Device,
> >                               vbasedev.pre_copy_dirty_page_tracking,
> > diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> > index 177abcc8fb..2674476d6c 100644
> > --- a/hw/vfio/pci.h
> > +++ b/hw/vfio/pci.h
> > @@ -137,6 +137,7 @@ struct VFIOPCIDevice {
> >       VFIOVGA *vga; /* 0xa0000, 0x3b0, 0x3c0 */
> >       void *igd_opregion;
> >       PCIHostDeviceAddress host;
> > +    QemuUUID vf_token;
> >       EventNotifier err_notifier;
> >       EventNotifier req_notifier;
> >       int (*resetfn)(struct VFIOPCIDevice *); =20
>=20
>=20


