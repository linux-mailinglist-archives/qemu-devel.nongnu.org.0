Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BD583940
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 09:08:16 +0200 (CEST)
Received: from localhost ([::1]:46410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGxd1-0003Dn-Ex
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 03:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGxSa-0005yl-Hy
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGxSW-0002XZ-JK
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658991440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aNrvDX5jD4bbxr/ZoGZ9aTRGHV2eCpOGLNsGcDL70rk=;
 b=CpkXJAakNcITCduGTPu6YCoXVbdoxjGX2XAVLOF2fv9pHJBdOqwWCy48HPvE6hxe5XIRRf
 aCGgyfOWlqCeY/z+yGiQcbdVpp08h1NvdIB4c+TKaG5R4mbSBIMm/Q9HW2gX1sdzSrC7Ak
 PIQzsZUz4ioRagWkaTS+JmzPk4E413o=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-Utvl-74fNVulmMqYANNhIg-1; Thu, 28 Jul 2022 02:57:17 -0400
X-MC-Unique: Utvl-74fNVulmMqYANNhIg-1
Received: by mail-lj1-f198.google.com with SMTP id
 r4-20020a2e80c4000000b0025e05dbef18so142070ljg.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aNrvDX5jD4bbxr/ZoGZ9aTRGHV2eCpOGLNsGcDL70rk=;
 b=2G/f2xWmX/Yr0hNKwBESTcjEoP/7odsWXRAWZ5qVYIjQUzyepGkMPFhZIMlv6ZZb1Y
 mC62xMNRnu4+JHnMidWBKFuCHHJWMhNW+S8DDbu4x0DidFGnGBdToTvHsF/QGLghJn1N
 eyCUYJrrkW7KjGOic2n/LAOqfP6exYt8GTOAcrGj/8VQu4mSCB/3NL3vFr2r+OyTNYwY
 mV7kG5eP4p5KkCI0k4C61xplx51NJsyvBTWKL9cpFWGhNX3umi9Mwfq+L3uyrlJ+30ZD
 us+eD0TmOYXYv+bH+jGgv6hcT4x963X+LyrBFLJUPDxU3ze44OBHi8QERw5RFET+53O+
 kTyw==
X-Gm-Message-State: AJIora+Y5ZaCD8687voLuJanstuCzgzCGBs8ofxN0EufSVLpqe8XCyBu
 zghaY5sAmlrk6Zrr1GIdM+26nMj3vsZ7Wx0f0U/Sw6tN4jPLMKSiBYEM/8KiEg/7kxwTNKJfXY0
 Hf2bRKnzfNYfz2V+uEdlpwZbVIwOQcKE=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr8244229ljh.251.1658991435720; 
 Wed, 27 Jul 2022 23:57:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vdsjbwQyA+nyZuEq4P7rLEB919gZUApUoDGS+e1G5Z0SAXUGDmRrGD5xjFrpBeBQGT+SvcePA5Q4Wd296jaP4=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr8244223ljh.251.1658991435500; Wed, 27
 Jul 2022 23:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
 <DM8PR12MB5400DBF0BFFF104940BB4A45AB969@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
 <20220728024712-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220728024712-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 14:57:04 +0800
Message-ID: <CACGkMEs-n5NVFOs8qO+0nmWTgAnMrS05+0t_c4wJekc05p0jYQ@mail.gmail.com>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eli Cohen <elic@nvidia.com>, Eugenio Perez Martin <eperezma@redhat.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Jul 28, 2022 at 2:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Jul 28, 2022 at 01:51:37PM +0800, Jason Wang wrote:
> > On Thu, Jul 28, 2022 at 1:39 PM Eli Cohen <elic@nvidia.com> wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Thursday, July 28, 2022 5:09 AM
> > > > To: Eli Cohen <elic@nvidia.com>
> > > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.o=
rg; Michael S. Tsirkin <mst@redhat.com>;
> > > > virtualization@lists.linux-foundation.org
> > > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > > >
> > > > On Wed, Jul 27, 2022 at 2:52 PM Eli Cohen <elic@nvidia.com> wrote:
> > > > >
> > > > > I found out that the reason why I could not enforce the mtu stems=
 from the fact that I did not configure max mtu for the net device
> > > > (e.g. through libvirt <mtu size=3D"9000"/>).
> > > > > Libvirt does not allow this configuration for vdpa devices and pr=
obably for a reason. The vdpa backend driver has the freedom to do
> > > > it using its copy of virtio_net_config.
> > > > >
> > > > > The code in qemu that is responsible to allow to consider the dev=
ice MTU restriction is here:
> > > > >
> > > > > static void virtio_net_device_realize(DeviceState *dev, Error **e=
rrp)
> > > > > {
> > > > >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > > >     VirtIONet *n =3D VIRTIO_NET(dev);
> > > > >     NetClientState *nc;
> > > > >     int i;
> > > > >
> > > > >     if (n->net_conf.mtu) {
> > > > >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > > > >     }
> > > > >
> > > > > The above code can be interpreted as follows:
> > > > > if the command line arguments of qemu indicates that mtu should b=
e limited, then we would read this mtu limitation from the
> > > > device (that actual value is ignored).
> > > > >
> > > > > I worked around this limitation by unconditionally setting VIRTIO=
_NET_F_MTU in the host features. As said, it only indicates that
> > > > we should read the actual limitation for the device.
> > > > >
> > > > > If this makes sense I can send a patch to fix this.
> > > >
> > > > I wonder whether it's worth to bother:
> > > >
> > > > 1) mgmt (above libvirt) should have the knowledge to prepare the co=
rrect XML
> > > > 2) it's not specific to MTU, we had other features work like, for
> > > > example, the multiqueue?
> > > >
> > >
> > >
> > > Currently libvirt does not recognize setting the mtu through XML for =
vdpa device. So you mean the fix should go to libvirt?
> >
> > Probably.
> >
> > > Furthermore, even if libvirt supports MTU configuration for a vdpa de=
vice, the actual value provided will be ignored and the limitation will be =
taken from what the vdpa device published in its virtio_net_config structur=
e. That makes the XML configuration binary.
> >
> > Yes, we suffer from a similar issue for "queues=3D". I think we should
> > fix qemu by failing the initialization if the value provided by cli
> > doesn't match what is read from config space.
> >
> > E.g when mtu=3D9000 was set by cli but the actual mtu is 1500.
> >
> > Thanks
>
>
> Jason most features are passthrough now, no?
> Why do you want to make this one special?

I don't want to make anything special, but I couldn't find a better approac=
h.

MTU is not the only thing. It applies to all the other features whose
default value is false (MQ, RSS, etc).

Thanks

>
>
>
> > >
> > > > Thanks
> > >
>


