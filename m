Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E05E58673B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:09:31 +0200 (CEST)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISMb-0003QZ-KW
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oISGY-0000BC-Ai
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:03:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oISGU-0008P0-Bl
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659348189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qi0mvTfTwbDStnutUlBkWHrtC77p1J8iw+tNAOhJo6U=;
 b=H5sVBwsuwD38Idt3JPoS+kZbFOAEyoSEvuMuE8huK7SVhibeDWKwnHIKb65SeIZzudPF5k
 ih8Z4qlHeswrYSLTAWDQYvUiTYjLPal0CULw2506YgzewUq5ziO1uQOiDnOpfOosj5n25r
 9Y7KBogDl7Chrl2XPZozhvq3rQKzCfQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-jnRdYMszM6KAvTIyU9gk9w-1; Mon, 01 Aug 2022 06:03:07 -0400
X-MC-Unique: jnRdYMszM6KAvTIyU9gk9w-1
Received: by mail-qv1-f70.google.com with SMTP id
 p14-20020a0cfd8e000000b004747f93486bso6165185qvr.13
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 03:03:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qi0mvTfTwbDStnutUlBkWHrtC77p1J8iw+tNAOhJo6U=;
 b=L090wybIW23GVnwx8IuIRENaqRuIlh3YEIAgHJsMM58Kz5IV2bCqFrr9HJo+WiiGBJ
 KSNuF4+yJXWrCGwEIV2lVskanchByTsgYn9lkceNJEJba0SWdPaM8bsrsGzylEl5xWe6
 NXgIZEIC8rf5CPEXmoL5pYoux74Ed68w0+X5YSdrevpCwcm0Qe2EmsHAnQCn8kojUpcL
 2VXwKc2hygy7Wnv75TFA9gdg7MMPbQG1hhHgVRSYDoSjJjb3N5jL/4yBMe8MZAI+he62
 xeeE5o5ho53wXP20GGOOgElMT8+9RCqo8m+P3Q8cGtgMr91pU0J85mIdVspR2urmhOL3
 iiIg==
X-Gm-Message-State: AJIora83bhGs7Jj3IUohPRJVmK/HGsMs96wRLpITdTp0pCRW0jzq46uD
 5IqywYQsxxctDTrsYyUlLmSmRx7ozttpU1iXWNXiO+cd8th42aMj0tw2vvinIYmhbp2QaxEm8gK
 AmNQkfVXt+B9YiJFSeC1pyCZL3DUba3c=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr10955246qkl.559.1659348186957; 
 Mon, 01 Aug 2022 03:03:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1soMsm9l5wKObEZr8PgDVBW/ydLIgHeJb+IcIsVAa0NGKd/ypC4GrtYmWD7HOFgwJSvwL58kVLcMaMwv3HnnvY=
X-Received: by 2002:a05:620a:f10:b0:6aa:318e:55a9 with SMTP id
 v16-20020a05620a0f1000b006aa318e55a9mr10955208qkl.559.1659348186437; Mon, 01
 Aug 2022 03:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB5400869D5921E28CE2DC7263AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <20220719093841-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5400F967A710B1151AD5132CAB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <DM8PR12MB5400AB08EE51E6BF05EEBDE2AB8F9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWc0M4O8Rr2jR4L_myPd_VmxkYjHTnwdxQFAf3N_hZw_3g@mail.gmail.com>
 <DM8PR12MB540033DA1293BA23E29148EAAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWfOS9nCBNeborhTdOXAnmZX9XwRF=2E0aphuHbqr352CA@mail.gmail.com>
 <DM8PR12MB54005AB1DE4617493645D2CBAB8E9@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CAJaqyWczrvaaookrQE5=6mTABS-VmJKF6iY+aO3ZD8OB4FumRA@mail.gmail.com>
 <DM8PR12MB54001D7DFB29EF048CCD04CCAB979@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEtDu9D2ovmWkKEuxqg5POqvMgYNK1_MHWCGMYOG7_t7Qg@mail.gmail.com>
 <DM8PR12MB5400DBF0BFFF104940BB4A45AB969@DM8PR12MB5400.namprd12.prod.outlook.com>
 <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
In-Reply-To: <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 1 Aug 2022 12:02:30 +0200
Message-ID: <CAJaqyWe6oodoBO8pMCST8fbGV3hGDhnPSVfeOOS1cZJGK7T5Fg@mail.gmail.com>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
To: Jason Wang <jasowang@redhat.com>
Cc: Eli Cohen <elic@nvidia.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jul 28, 2022 at 7:51 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Thu, Jul 28, 2022 at 1:39 PM Eli Cohen <elic@nvidia.com> wrote:
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Thursday, July 28, 2022 5:09 AM
> > > To: Eli Cohen <elic@nvidia.com>
> > > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org=
; Michael S. Tsirkin <mst@redhat.com>;
> > > virtualization@lists.linux-foundation.org
> > > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> > >
> > > On Wed, Jul 27, 2022 at 2:52 PM Eli Cohen <elic@nvidia.com> wrote:
> > > >
> > > > I found out that the reason why I could not enforce the mtu stems f=
rom the fact that I did not configure max mtu for the net device
> > > (e.g. through libvirt <mtu size=3D"9000"/>).
> > > > Libvirt does not allow this configuration for vdpa devices and prob=
ably for a reason. The vdpa backend driver has the freedom to do
> > > it using its copy of virtio_net_config.
> > > >
> > > > The code in qemu that is responsible to allow to consider the devic=
e MTU restriction is here:
> > > >
> > > > static void virtio_net_device_realize(DeviceState *dev, Error **err=
p)
> > > > {
> > > >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > > >     VirtIONet *n =3D VIRTIO_NET(dev);
> > > >     NetClientState *nc;
> > > >     int i;
> > > >
> > > >     if (n->net_conf.mtu) {
> > > >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > > >     }
> > > >
> > > > The above code can be interpreted as follows:
> > > > if the command line arguments of qemu indicates that mtu should be =
limited, then we would read this mtu limitation from the
> > > device (that actual value is ignored).
> > > >
> > > > I worked around this limitation by unconditionally setting VIRTIO_N=
ET_F_MTU in the host features. As said, it only indicates that
> > > we should read the actual limitation for the device.
> > > >
> > > > If this makes sense I can send a patch to fix this.
> > >
> > > I wonder whether it's worth to bother:
> > >
> > > 1) mgmt (above libvirt) should have the knowledge to prepare the corr=
ect XML
> > > 2) it's not specific to MTU, we had other features work like, for
> > > example, the multiqueue?
> > >
> >
> >
> > Currently libvirt does not recognize setting the mtu through XML for vd=
pa device. So you mean the fix should go to libvirt?
>
> Probably.
>
> > Furthermore, even if libvirt supports MTU configuration for a vdpa devi=
ce, the actual value provided will be ignored and the limitation will be ta=
ken from what the vdpa device published in its virtio_net_config structure.=
 That makes the XML configuration binary.
>
> Yes, we suffer from a similar issue for "queues=3D". I think we should
> fix qemu by failing the initialization if the value provided by cli
> doesn't match what is read from config space.
>
> E.g when mtu=3D9000 was set by cli but the actual mtu is 1500.
>

Maybe we can be less strict? Since config space mtu is the maximum
value accepted by the device.

So the case of setting mtu=3D9000 by cli while the device mtu is 1500
should fail, but not the reverse one. To set a cli mtu <=3D device mtu
should work in my opinion.

If libvirt has the knowledge to set max mtu properly, it can do so. If
not (or not using libvirt), it should be possible to pass the device's
one.

Other features may need to do the same.

Thanks!


