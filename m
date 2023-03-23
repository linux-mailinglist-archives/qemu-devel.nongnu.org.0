Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76A6C7075
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 19:47:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfPxA-0002NA-Iu; Thu, 23 Mar 2023 14:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pfPx7-0002My-9E
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pfPx5-00044E-94
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 14:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679597175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lyzBV3c0kL9RYXiRxrNoCZQdtWKvyW7KFIsjrWfdARU=;
 b=WmxMuRX6fPJyj4Sl9YQN4gbhteg2DGvWRxQ4r0ot6gIPSsD9/OYRyLm2sMZbZJm7Aw05QK
 hgozCbj/Mtv8eN9Hz3mhzsILgoQD+qjYi31SktSvXPBTX22nsgBCznX+9OOTIjb/AnAQUL
 FbD30izrl9srb9UUVRfjcJRbnnB3Q8Y=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-BYXeopfQOKS07ES4W57U0A-1; Thu, 23 Mar 2023 14:46:13 -0400
X-MC-Unique: BYXeopfQOKS07ES4W57U0A-1
Received: by mail-io1-f71.google.com with SMTP id
 f15-20020a05660215cf00b00752dd002fd1so12219133iow.3
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 11:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679597173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lyzBV3c0kL9RYXiRxrNoCZQdtWKvyW7KFIsjrWfdARU=;
 b=6M2/kVr5NORHgGaCnklOQqWkiGt0kGqV9cMVGHRdZKkLjpw7ZIB+2XRAwsvJpfQvuQ
 CNU7B/Y9QIAChx1nkR+EnoEiQjawmlUMWuCo1HCJpfHwu8klzhB1qz9oNkUVZKYk/m5h
 XWhpt8B8AEYRN34IN75D68nLi5HP8+aShEzfh6/QJbbML4QL5okjDaxvGOxao7LEjQkm
 KMUW/UeGxHLwnBc4TLqx4Z3wiHZfMfC2v2zna6bijL/W3KE9VvfolFAmtmjksRghYDNe
 V3ToCqQARV9o55o1GHcGPPW2qTkJjQ9AycqnzRCTOhqz/XVgsv9D1n4pGLHBky3LXNiQ
 gWtg==
X-Gm-Message-State: AAQBX9eiYzbLSu95vvAWmuOlz5pmLAZ8uSjgpaWHGi0cgnGHVqf7ZTrM
 cw0UQ4QeSF3XnisDcKWTYARzJR2JpgAGJb9u5yGcWL+wSsla4+pJrNDqgV3VpqENQ0G/810hxrq
 1tU8BXdn8dJzVAoI=
X-Received: by 2002:a92:d0c5:0:b0:315:4b70:8376 with SMTP id
 y5-20020a92d0c5000000b003154b708376mr433394ila.29.1679597172855; 
 Thu, 23 Mar 2023 11:46:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAfjRppr2fyy+uHeWW6Nm0+XXUFNMABX8Yg6KVOWZfVD6l/9QUnF1zpRa2s3h620wtRymfEg==
X-Received: by 2002:a92:d0c5:0:b0:315:4b70:8376 with SMTP id
 y5-20020a92d0c5000000b003154b708376mr433382ila.29.1679597172479; 
 Thu, 23 Mar 2023 11:46:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u16-20020a056e02111000b003157696c04esm5344279ilk.46.2023.03.23.11.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 11:46:11 -0700 (PDT)
Date: Thu, 23 Mar 2023 12:46:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Minwoo Im <minwoo.im@samsung.com>
Cc: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, SSDR Gost Dev
 <gost.dev@samsung.com>, Klaus Birkelund Jensen <k.jensen@samsung.com>
Subject: Re: [PATCH] vfio/pci: add support for VF token
Message-ID: <20230323124610.10a55a29.alex.williamson@redhat.com>
In-Reply-To: <20230322211945epcms2p4fdcdcfdc3857d2451f24ac229f3992a8@epcms2p4>
References: <20230320093931.29015496.alex.williamson@redhat.com>
 <20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <7db48667-11e2-b806-03f7-eb516a7be157@kaod.org>
 <CGME20230320073522epcms2p48f682ecdb73e0ae1a4850ad0712fd780@epcms2p4>
 <20230322211945epcms2p4fdcdcfdc3857d2451f24ac229f3992a8@epcms2p4>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
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

On Thu, 23 Mar 2023 06:19:45 +0900
Minwoo Im <minwoo.im@samsung.com> wrote:

> > On Mon, 20 Mar 2023 11:03:40 +0100
> > C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >  =20
> > > On 3/20/23 08:35, Minwoo Im wrote: =20
> > > > VF token was introduced [1] to kernel vfio-pci along with SR-IOV
> > > > support [2].  This patch adds support VF token among PF and VF(s). =
To
> > > > passthu PCIe VF to a VM, kernel >=3D v5.7 needs this.
> > > >
> > > > It can be configured with UUID like:
> > > >
> > > >    -device vfio-pci,host=3DDDDD:BB:DD:F,vf-token=3D<uuid>,...
> > > >
> > > > [1] https://lore.kernel.org/linux- =20
> > pci/158396393244.5601.10297430724964025753.stgit@gimli.home/ =20
> > > > [2] https://lore.kernel.org/linux- =20
> > pci/158396044753.5601.14804870681174789709.stgit@gimli.home/ =20
> > > >
> > > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > > Signed-off-by: Minwoo Im <minwoo.im@samsung.com>
> > > > Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> > > > ---
> > > >   hw/vfio/pci.c | 13 ++++++++++++-
> > > >   hw/vfio/pci.h |  1 +
> > > >   2 files changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> > > > index ec9a854361..cf27f28936 100644
> > > > --- a/hw/vfio/pci.c
> > > > +++ b/hw/vfio/pci.c
> > > > @@ -2856,6 +2856,8 @@ static void vfio_realize(PCIDevice *pdev, Err=
or **errp)
> > > >       int groupid;
> > > >       int i, ret;
> > > >       bool is_mdev;
> > > > +    char uuid[UUID_FMT_LEN];
> > > > +    char *name;
> > > >
> > > >       if (!vbasedev->sysfsdev) {
> > > >           if (!(~vdev->host.domain || ~vdev->host.bus ||
> > > > @@ -2936,7 +2938,15 @@ static void vfio_realize(PCIDevice *pdev, Er=
ror **errp)
> > > >           goto error;
> > > >       }
> > > >
> > > > -    ret =3D vfio_get_device(group, vbasedev->name, vbasedev, errp);
> > > > +    if (!qemu_uuid_is_null(&vdev->vf_token)) {
> > > > +        qemu_uuid_unparse(&vdev->vf_token, uuid);
> > > > +        name =3D g_strdup_printf("%s vf_token=3D%s", vbasedev->nam=
e, uuid);
> > > > +    } else {
> > > > +        name =3D vbasedev->name;
> > > > +    }
> > > > +
> > > > +    ret =3D vfio_get_device(group, name, vbasedev, errp);
> > > > +    g_free(name);
> > > >       if (ret) {
> > > >           vfio_put_group(group);
> > > >           goto error; =20
> > >
> > > Shouldn't we set the VF token in the kernel also ? See this QEMU impl=
ementation
> > >
> > >    https://lore.kernel.org/lkml/20200204161737.34696b91@w520.home/
> > >
> > > May be I misunderstood.
> > > =20
> >=20
> > I think you're referring to the part there that calls
> > VFIO_DEVICE_FEATURE in order to set a VF token.  I don't think that's
> > necessarily applicable here.  I believe this patch is only trying to
> > make it so that QEMU can consume a VF associated with a PF owned by a
> > userspace vfio driver, ie. not QEMU. =20
>=20
> Yes, that's what this patch exactly does.
>=20
> >=20
> > Setting the VF token is only relevant to PFs, which would require
> > significantly more SR-IOV infrastructure in QEMU than sketched out in
> > that proof-of-concept patch.  Even if we did have a QEMU owned PF where
> > we wanted to generate VFs, the token we use in that case would likely
> > need to be kept private to QEMU, not passed on the command line.
> > Thanks, =20
>=20
> Can we also take a command line property for the PF for that case that
> QEMU owns a PF?  I think the one who wants to make QEMU owns PF or VF
> should know the VF token.  If I've missed anything, please let me know.

IIRC, the only case where a VF token is required for a PF is if there
are existing VFs in use.  Opening the PF would then require a token
matching the VFs.  In general though, if the PF is owned by QEMU, the
VF token should likely be an internal secret to QEMU.  Configuring the
PF device with a token suggests that VFs could be created and bound to
other userspace drivers outside of the control of the QEMU instance
that owns the PF.  Therefore I would not suggest adding the ability to
set the VF token for a PF without a strong use case in-hand, an
certainly not when QEMU doesn't expose SR-IOV support to be able to
manage VFs itself.  Thanks,

Alex


