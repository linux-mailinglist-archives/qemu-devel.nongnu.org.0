Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE0583854
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 07:58:37 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwXb-0006Dv-Qx
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 01:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwRD-0000VW-M3
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:52:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwR9-0001A8-2X
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 01:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658987513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z3p+5YoHErrWZsylgsT25kVJ1/LRXBSCOr+pq6In3vE=;
 b=RA1Bz2ggq/AxT8nacTopRV5A/GU0iyOmEVnb4VdXIKpvL3qXZKbNCJT71ykwL39VyaoC2M
 Lvw5yOVOrqoxV4NK4atkVrVShLQRy1ZUdMZU3d3sEb8EkKQGzOtAT7g0y4f9dq+zhEnwaA
 Na7NKF57AGNM+1gn/DfuXyM1DblJpws=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-XLJyL6e_N0ONbsETMlMUKQ-1; Thu, 28 Jul 2022 01:51:50 -0400
X-MC-Unique: XLJyL6e_N0ONbsETMlMUKQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 9-20020ac25f09000000b0048aae4b6e40so327714lfq.20
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 22:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=z3p+5YoHErrWZsylgsT25kVJ1/LRXBSCOr+pq6In3vE=;
 b=VlO5YD3FBmplrO7ApWP8hBiiEgL7mGuU2vKmUNdPCMasM4x5GdPhVKsfqe7mRbBLJe
 v3M6EYNFKLMkrSSlgD6IS1GeBL3QFhf4z9mEmPXyL7EDxvNnkvuWO5NrTe1ux2FnHiwS
 bhrNvG6PoFiO8IVqhhd5lDSpzHgqG+IK8F+FCK6DAjVNGwDZJhnozL4m4xEGNu7BmKwP
 CJ5GanzzJtRVZfhPK6CkRHljwG6JdoXToPMDl6YWBJHvs8XCjwsDzqEMElQnlaep3R/u
 6ZKxvZKfpOunAICbpLOmK2o/jY4C22oTYlrlsg/BCkPl51l70G6viLK4N85+5EAsdGgP
 2knQ==
X-Gm-Message-State: AJIora9yvTCdIgaEBpNnMi5ZwJVm8lcU7qvVeeIpZyaqO7s05a6hxKMT
 WmKiBo8hAwwKmjFPESDAUwA8A5O7qWNUpeTKRXj7Ns9zHEOe//2EhwE2/wHluttV1qk8xR7yrrx
 Ig/DpL4cpH7twKXumU65fPE0J6w2WpSg=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr8851665lfa.124.1658987509148; 
 Wed, 27 Jul 2022 22:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1txUOkXryg1lzI7tBfRmKQs3G8/BxqE7jBH5umVM1ezcD7IXHDnb1Ai9RjwKMsE5sot+EEkwqfG+wIHW57Ll7o=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr8851658lfa.124.1658987508825; Wed, 27
 Jul 2022 22:51:48 -0700 (PDT)
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
In-Reply-To: <DM8PR12MB5400DBF0BFFF104940BB4A45AB969@DM8PR12MB5400.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Jul 2022 13:51:37 +0800
Message-ID: <CACGkMEv6AfPsgSBr6P4NqhG=EoXdHhXmAVAZpzWtSkdcJ-Bbxw@mail.gmail.com>
Subject: Re: VIRTIO_NET_F_MTU not negotiated
To: Eli Cohen <elic@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Thu, Jul 28, 2022 at 1:39 PM Eli Cohen <elic@nvidia.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, July 28, 2022 5:09 AM
> > To: Eli Cohen <elic@nvidia.com>
> > Cc: Eugenio Perez Martin <eperezma@redhat.com>; qemu-devel@nongnu.org; =
Michael S. Tsirkin <mst@redhat.com>;
> > virtualization@lists.linux-foundation.org
> > Subject: Re: VIRTIO_NET_F_MTU not negotiated
> >
> > On Wed, Jul 27, 2022 at 2:52 PM Eli Cohen <elic@nvidia.com> wrote:
> > >
> > > I found out that the reason why I could not enforce the mtu stems fro=
m the fact that I did not configure max mtu for the net device
> > (e.g. through libvirt <mtu size=3D"9000"/>).
> > > Libvirt does not allow this configuration for vdpa devices and probab=
ly for a reason. The vdpa backend driver has the freedom to do
> > it using its copy of virtio_net_config.
> > >
> > > The code in qemu that is responsible to allow to consider the device =
MTU restriction is here:
> > >
> > > static void virtio_net_device_realize(DeviceState *dev, Error **errp)
> > > {
> > >     VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> > >     VirtIONet *n =3D VIRTIO_NET(dev);
> > >     NetClientState *nc;
> > >     int i;
> > >
> > >     if (n->net_conf.mtu) {
> > >         n->host_features |=3D (1ULL << VIRTIO_NET_F_MTU);
> > >     }
> > >
> > > The above code can be interpreted as follows:
> > > if the command line arguments of qemu indicates that mtu should be li=
mited, then we would read this mtu limitation from the
> > device (that actual value is ignored).
> > >
> > > I worked around this limitation by unconditionally setting VIRTIO_NET=
_F_MTU in the host features. As said, it only indicates that
> > we should read the actual limitation for the device.
> > >
> > > If this makes sense I can send a patch to fix this.
> >
> > I wonder whether it's worth to bother:
> >
> > 1) mgmt (above libvirt) should have the knowledge to prepare the correc=
t XML
> > 2) it's not specific to MTU, we had other features work like, for
> > example, the multiqueue?
> >
>
>
> Currently libvirt does not recognize setting the mtu through XML for vdpa=
 device. So you mean the fix should go to libvirt?

Probably.

> Furthermore, even if libvirt supports MTU configuration for a vdpa device=
, the actual value provided will be ignored and the limitation will be take=
n from what the vdpa device published in its virtio_net_config structure. T=
hat makes the XML configuration binary.

Yes, we suffer from a similar issue for "queues=3D". I think we should
fix qemu by failing the initialization if the value provided by cli
doesn't match what is read from config space.

E.g when mtu=3D9000 was set by cli but the actual mtu is 1500.

Thanks

>
> > Thanks
>


