Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E40EC60C627
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 10:16:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onF31-0000L1-0Y; Tue, 25 Oct 2022 04:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onDqe-0002LJ-G4
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 02:55:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1onDqc-0005hv-Nd
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 02:55:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666680937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8pyUxYxzMfXEEhRrLj+D3l6yccH7aZTr+EiU2jtfRa8=;
 b=SLZYrm54deSsOOFs06WcljAmQauC9KOWOl9D3+ZykmhOWXadZ+0b7/39oJOO/rJNI5TMR2
 PitbEb1FtW3/uU/Kdes0STGwpLUnPOO8XWwNfcyoewG9TgDPKv+qD38NF1zMuAgTDOt54e
 WQkedaWVgb2CrEbWcfu4/HYfWv7g6H0=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-u28CGMwZNdWkjph7LX2HiA-1; Tue, 25 Oct 2022 02:55:35 -0400
X-MC-Unique: u28CGMwZNdWkjph7LX2HiA-1
Received: by mail-pj1-f72.google.com with SMTP id
 f64-20020a17090a28c600b0020db64bf9faso4952198pjd.8
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 23:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8pyUxYxzMfXEEhRrLj+D3l6yccH7aZTr+EiU2jtfRa8=;
 b=P59xyNG/OOnSADsKR0NsXl2v7+lsjdYz+hd2ocGSASSb5fe77SwpTwteYkiH0ZOEok
 nj3OpOvm0O7bGhRHqC0SZk8Jo0aBgTkphPCbN0g5QPB4R1ZxrUBOiypNqQ72iCyWSknd
 CUHoiMuL1Nhhtak+jVqdEURkG7+FUfy+VXrifYBuMDyg5C3vncr0FCFDfJ6JyNV/isaQ
 l9nyXfU9vS0aXDoHd04RIm0JAaoRkizHemHjBQKfc+54Odg8yEqFSYEsfeHqxelMTPL0
 0Ls8t29wGuvfGE//umpxmVeO68um1ReXZDqsMUAQxMc5QQPq+QkMJjXhRHIylb8OACN1
 TapQ==
X-Gm-Message-State: ACrzQf3uDzNwUPVf1Yi7JL+/PJx1YDOrRXC2/pEGMtKGLkcSf4FIQJ1q
 cHZUXSFKYwTw3PhBqBRim/YCwQ81es4eINes0zYI19K61HElzxXx3gICRi2fcmstWicGowa1dhq
 YMJEzEYMuo4DjSRE/VYX2yXfEeWBGrSQ=
X-Received: by 2002:a63:c5d:0:b0:460:17cc:73a6 with SMTP id
 29-20020a630c5d000000b0046017cc73a6mr31364393pgm.332.1666680933864; 
 Mon, 24 Oct 2022 23:55:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xp32JWmQRfF+PwrvB0Md5bJZk46GSCrcmd1yjS763W7cqWUPb+CTzGBrNkmWjAdU7ZflJdfgQYV4FCN7I6qw=
X-Received: by 2002:a63:c5d:0:b0:460:17cc:73a6 with SMTP id
 29-20020a630c5d000000b0046017cc73a6mr31364370pgm.332.1666680933433; Mon, 24
 Oct 2022 23:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221019125210.226291-1-eperezma@redhat.com>
 <20221019125210.226291-3-eperezma@redhat.com>
 <CACGkMEvQOksFuE37SCCW+4x=Ku5CfHpcbgCDq6tic_H5fW7hYw@mail.gmail.com>
 <CAJaqyWd6bFH7ZL=rKr8kXrQEi2sOFkq=x=PHUmgz8N9K6Ct70w@mail.gmail.com>
 <CACGkMEs9mc5pqRr8XNhVw8pvQZ+hvnPRiMmyuzJvNsSU=Cfoxg@mail.gmail.com>
 <CAJaqyWfCn0gPc=+GY-0ASutwSP+1-AyFhp0XO4v6K+3JJZktuA@mail.gmail.com>
 <CACGkMEuwq_s6P9AxQD4Pmhb5R3naETeiQG+Nx0TJLbpdF6Xesg@mail.gmail.com>
 <CAJaqyWfo4WJo_LJpBtLirHtNCUO23NZQETv7k_jWo0LjQ1tVLw@mail.gmail.com>
 <CACGkMEtiJeSebHVFMQ79Zkx4LoKeywxRvyi6m63JF_Kvfc3YdA@mail.gmail.com>
In-Reply-To: <CACGkMEtiJeSebHVFMQ79Zkx4LoKeywxRvyi6m63JF_Kvfc3YdA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 25 Oct 2022 08:54:56 +0200
Message-ID: <CAJaqyWfjjtAQjYwKx9W=ywa93un3t2Hd-LrqgpRxF9S-JrmFbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] vdpa: Save emulated features list in vhost_vdpa
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 4:45 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Oct 24, 2022 at 5:26 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Mon, Oct 24, 2022 at 4:14 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Oct 21, 2022 at 4:56 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Fri, Oct 21, 2022 at 4:57 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > > On Thu, Oct 20, 2022 at 2:34 PM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Thu, Oct 20, 2022 at 6:23 AM Jason Wang <jasowang@redhat.com=
> wrote:
> > > > > > >
> > > > > > > On Wed, Oct 19, 2022 at 8:52 PM Eugenio P=C3=A9rez <eperezma@=
redhat.com> wrote:
> > > > > > > >
> > > > > > > > At this moment only _F_LOG is added there.
> > > > > > > >
> > > > > > > > However future patches add features that depend on the kind=
 of device.
> > > > > > > > In particular, only net devices can add VIRTIO_F_GUEST_ANNO=
UNCE. So
> > > > > > > > let's allow vhost_vdpa creator to set custom emulated devic=
e features.
> > > > > > > >
> > > > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > > > > ---
> > > > > > > >  include/hw/virtio/vhost-vdpa.h | 2 ++
> > > > > > > >  hw/virtio/vhost-vdpa.c         | 8 ++++----
> > > > > > > >  net/vhost-vdpa.c               | 4 ++++
> > > > > > > >  3 files changed, 10 insertions(+), 4 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/vi=
rtio/vhost-vdpa.h
> > > > > > > > index 1111d85643..50083e1e3b 100644
> > > > > > > > --- a/include/hw/virtio/vhost-vdpa.h
> > > > > > > > +++ b/include/hw/virtio/vhost-vdpa.h
> > > > > > > > @@ -31,6 +31,8 @@ typedef struct vhost_vdpa {
> > > > > > > >      bool iotlb_batch_begin_sent;
> > > > > > > >      MemoryListener listener;
> > > > > > > >      struct vhost_vdpa_iova_range iova_range;
> > > > > > > > +    /* VirtIO device features that can be emulated by qemu=
 */
> > > > > > > > +    uint64_t added_features;
> > > > > > >
> > > > > > > Any reason we need a per vhost_vdpa storage for this? Or is t=
here a
> > > > > > > chance that this field could be different among the devices?
> > > > > > >
> > > > > >
> > > > > > Yes, one device could support SVQ and the other one could not s=
upport
> > > > > > it because of different feature sets for example.
> > > > >
> > > > > Right, but for those devices that don't support SVQ, we don't eve=
n
> > > > > need mediation for feature like F_LOG and _F_STATUS?
> > > > >
> > > >
> > > > No, and we cannot offer it to the guest either.
> > >
> > > Just to make sure we are on the same page, what I meant is, consider
> > > in the future SVQ get the support of all features, so we can remove
> > > this field? This is because _F_STATUS can be mediated unconditionally
> > > anyhow.
> > >
> >
> > For _F_STATUS that is right. But we cannot handle full
> > _F_GUEST_ANNOUNCE since control SVQ (will) needs features from the
> > device that cannot be emulated, like ASID.
> >
> > I think your point is "Since qemu cannot migrate these devices it will
> > never set VIRTIO_NET_S_ANNOUNCE, so the guest will never send
> > VIRTIO_NET_CTRL_ANNOUNCE messages". And I think that is totally right,
> > but I still feel it is weird to expose it if we cannot handle it.
> >
> > Maybe a good first step is to move added_features to vhost_net, or
> > maybe to convert it to "bool guest_announce_emulated" or something
> > similar?  This way hw/virtio/vhost-vdpa is totally unaware of this and
> > changes are more self contained.
>
> This reminds me of something. For vhost, if Qemu can handle some
> feature bits, we don't need to validate if vhost has such support.
>
> E.g we don't have _F_SATAUS and _F_GUEST_ANNOUNCE in kernel_feature_bits.
>
> I wonder if we can do something similar for vhost-vDPA? Then we don't
> need to bother new fields.
>

That is valid for _F_GUEST_ANNOUNCE, because all of it is emulated and
we must forbid the ack of it for simplicity.

But _F_STATUS has two parts, one bit that must be exposed to the guest
from the physical NIC, since qemu cannot know when to change it
(VIRTIO_NET_S_LINK_UP) and another one that must be 100% emulated
(VIRTIO_NET_S_ANNOUNCE). VIRTIO_NET_F_STATUS is 100% emulated only if
it is not offered by the device.

I'm moving to vhost_net for the next series, and I'll try to make all
of this more explicit.

Thanks!


