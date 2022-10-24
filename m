Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD7360AD9B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:29:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy1K-0004n5-0Y; Mon, 24 Oct 2022 10:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1omy13-0004bd-I1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1omy11-0001tp-Td
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666620078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKE7Dn0igtnnHAlnDKq9PTQ1uTucqNOlTz5MzeJW5U8=;
 b=aarkV6Wem6LZOUhJUnt7l20x8i904J9zSFsA9/ainez3cEDZjztvko8fm3bX01Szbkr1tH
 EpUJehNrROERC0OL/yRtDje83Q6jN0oxx4mbzKEvRIMrx7S0s0vawvEHQAni+1+GOTfQ+L
 F2Kb42HyJus37H6A3HWWB4gE6zFienw=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-paPaGD3YNmqrEJjlTM_YgQ-1; Mon, 24 Oct 2022 10:01:15 -0400
X-MC-Unique: paPaGD3YNmqrEJjlTM_YgQ-1
Received: by mail-pl1-f198.google.com with SMTP id
 x18-20020a170902ec9200b001869f20da7eso2631330plg.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MKE7Dn0igtnnHAlnDKq9PTQ1uTucqNOlTz5MzeJW5U8=;
 b=sEVTtS6ZktW5kpBmjGEfVPZYinv4HIvV3tjv2/JKih2vF7qD6zazVsix4SgbKe/ZII
 e9eISH3WIZ1305V83HH4shZeD5KcDByIzQYigsjt/LIgY2fr0bjMm+xTnJy1DgEBb5Ot
 aAhRT19nfnSZkxjHIs2XNGzRikKKJjCr8tfcX23JQz0vZvC684KLxQ7n5UuqCMoESxs/
 2q1TTRR7AvgbAWK6Iyjxwsd425dPtXr2kDuvRpnSnKkPK2TUhO/Fzfqod88ETzaFHDpA
 yvuNl54H2duDP8NUekbbt3Qsrp4IGoTqa9VUnnna52FiF+s3bcKDbMUxiubgygo1o/0B
 cAZw==
X-Gm-Message-State: ACrzQf2ZR2qwielVl12IZGOZE+us4ynMqfY2AnP3LYDTHFl8diYu6Z2U
 thpD24voMma9OGzM3PGER96wAMlZEf/AY5PygJVwEaKKLftkJw82/pRdg+FPPW5eFlDyuQ1gBnG
 IM1H3ytsNmjBGfKjJw1D7XQV/Iy9wT0Q=
X-Received: by 2002:a63:6e45:0:b0:46f:25cc:d557 with SMTP id
 j66-20020a636e45000000b0046f25ccd557mr875698pgc.58.1666620073811; 
 Mon, 24 Oct 2022 07:01:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MDbYp3IAFssdmHGIPaZvlXUzzVNvyrSYziC1UuywvOYoDm9zeAdOTE94ctu9QrX1xHQF1VojfnThvAcvTMIo=
X-Received: by 2002:a63:6e45:0:b0:46f:25cc:d557 with SMTP id
 j66-20020a636e45000000b0046f25ccd557mr875665pgc.58.1666620073536; Mon, 24 Oct
 2022 07:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221020155251.398735-3-eperezma@redhat.com>
 <CACGkMEukKCXRDSmR3nemxdHDphQHspGdY3nC9O5g9grQ59PN8w@mail.gmail.com>
 <CAJaqyWf0uXRze3qK1d02RB+Q4BJ60A8E7YYnnjBpdyANB2=new@mail.gmail.com>
 <20221021041453-mutt-send-email-mst@kernel.org>
 <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
In-Reply-To: <CACGkMEvNoxKcFBpawaWgtq=YgCh4CXMDD9Y5DUgoZ1Qn-zOwpA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 24 Oct 2022 16:00:37 +0200
Message-ID: <CAJaqyWfVEb8cp4c0m_LEjy-aMCmHMuMUao6zaCOFW3EzyuLF6Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: toggle device callbacks using used event idx
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Mon, Oct 24, 2022 at 4:16 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Oct 21, 2022 at 4:15 PM Michael S. Tsirkin <mst@redhat.com> wrote=
:
> >
> > On Fri, Oct 21, 2022 at 09:45:14AM +0200, Eugenio Perez Martin wrote:
> > > On Fri, Oct 21, 2022 at 5:40 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Oct 20, 2022 at 11:53 PM Eugenio P=C3=A9rez <eperezma@redha=
t.com> wrote:
> > > > >
> > > > > Actually use the new field of the used ring and tell the device i=
f SVQ
> > > > > wants to be notified.
> > > > >
> > > > > The code is not reachable at the moment.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > ---
> > > > >  hw/virtio/vhost-shadow-virtqueue.c | 18 +++++++++++++++---
> > > > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost=
-shadow-virtqueue.c
> > > > > index a518f84772..f5c0fad3fc 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > @@ -369,15 +369,27 @@ static bool vhost_svq_more_used(VhostShadow=
Virtqueue *svq)
> > > > >   */
> > > > >  static bool vhost_svq_enable_notification(VhostShadowVirtqueue *=
svq)
> > > > >  {
> > > > > -    svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_I=
NTERRUPT);
> > > > > -    /* Make sure the flag is written before the read of used_idx=
 */
> > > > > +    if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_I=
DX)) {
> > > > > +        uint16_t *used_event =3D (uint16_t *)&svq->vring.avail->=
ring[svq->vring.num];
> > > > > +        *used_event =3D svq->shadow_used_idx;
> > > >
> > > > Do we need to care about the endian here?
> > > >
> > > > E.g vduse has:
> > > >
> > > >     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D htole16=
(val);
> > > >
> > >
> > > Good catch, I forgot about endianness.
> > >
> > > I'll review the series, thanks!
> >
> > It's generally a waste that we don't use endian-ness annotations
> > the way linux does.
>
> Yes, it's worth doing something similar sometime.
>

Maybe we could wrap them in some struct like virtio_le16 or virtio_16,
avoiding at least integer direct assignment? Wrappers like
cpu_to_virtio16 could return these structs and I think all compilers
should emit the same code as direct assignment.

Thanks!




> Thanks
>
> >
> >
> > > > Thanks
> > > >
> > > > > +    } else {
> > > > > +        svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_=
NO_INTERRUPT);
> > > > > +    }
> > > > > +
> > > > > +    /* Make sure the event is enabled before the read of used_id=
x */
> > > > >      smp_mb();
> > > > >      return !vhost_svq_more_used(svq);
> > > > >  }
> > > > >
> > > > >  static void vhost_svq_disable_notification(VhostShadowVirtqueue =
*svq)
> > > > >  {
> > > > > -    svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_IN=
TERRUPT);
> > > > > +    /*
> > > > > +     * No need to disable notification in the event idx case, si=
nce used event
> > > > > +     * index is already an index too far away.
> > > > > +     */
> > > > > +    if (!virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_=
IDX)) {
> > > > > +        svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_N=
O_INTERRUPT);
> > > > > +    }
> > > > >  }
> > > > >
> > > > >  static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVi=
rtqueue *svq,
> > > > > --
> > > > > 2.31.1
> > > > >
> > > >
> >
>


