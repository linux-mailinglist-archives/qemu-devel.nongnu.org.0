Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6856B66C64A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSAX-0006gV-Dg; Mon, 16 Jan 2023 11:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHSAU-0006f0-GV
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:17:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHSAS-0000CG-HT
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:17:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673885823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GlWsqRYOeSYxi4SdfpQtlKKB4zSKLP9WQteI93fNl8=;
 b=b0d0KEUdqLjgIYcKo+pJl33ByQughIpXsmS4EAJs0GZTHpKmp1y+37eMNDlI8PMMnuFUjf
 irxLD1pcgFikJzYjqM/lprc0JlGI0ton8eoHCKKqtvV/5RFcDki7seGuArmSqBxfp9ZYZV
 EiBvsnVryDEwSTnBZ6kd5h/KVdoxO/U=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-25mEAU8ROBGJvO2mfYyjOQ-1; Mon, 16 Jan 2023 11:17:02 -0500
X-MC-Unique: 25mEAU8ROBGJvO2mfYyjOQ-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-4ea88f2f57aso35061717b3.20
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5GlWsqRYOeSYxi4SdfpQtlKKB4zSKLP9WQteI93fNl8=;
 b=FmstBSmr1pbU4VMVFbikbcVPYR8u44AQGAYr6+fAjTbk8iAmypsfXAK1lsEAboynLL
 t57dJWV/UxV7eCDB7T0shF1Ci8SizoiY/7Pi0frB7Ism6UUZCXFcVXV43QzadYdT4si4
 P14kLPNNXY84TtdazWYkHoQZ8a2YUX6ULduO8z9DAKqbENqXwkuARII8hYQUaPQfHXTq
 Gtj4BIMOwlFJhquRmjv2GVwnTCWg9KF9/zgcUBQg2TBUEfh3/wPcT2ky7iIMMGbzD9R1
 Yau2c0MvDnUkB6MzGWDVUJXO16RJ47DJc65vcRNL63zXA2uZTd8UMPeL1DliCzaemOqw
 MNCQ==
X-Gm-Message-State: AFqh2kokEmAXDrPkvAlilFM7kFamj/+A66pU8CwSZEDowhIShbyraVWb
 aZsdkRBIiXX1k/qXS1DdsfCAsYApRpat3Y7ILUH/DAN0F+NOGOowANpOpAh+VQZ+QoJJm0VLRGC
 e5TBYzxnELiBism9Raw2MN/DvZk2YnsE=
X-Received: by 2002:a81:8744:0:b0:499:f27a:2924 with SMTP id
 x65-20020a818744000000b00499f27a2924mr861831ywf.411.1673885821345; 
 Mon, 16 Jan 2023 08:17:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZRODSwSW0CEn7NKPSB0uf89pCqkG1JzJFRNGmVShOmOGqAYoZbfI9AEjVSzvOcIZYXftZefui6U1vneXYYo4=
X-Received: by 2002:a81:8744:0:b0:499:f27a:2924 with SMTP id
 x65-20020a818744000000b00499f27a2924mr861812ywf.411.1673885821018; Mon, 16
 Jan 2023 08:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
 <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
 <0aae4d77-2c03-7ba2-8496-024b5a683449@redhat.com>
In-Reply-To: <0aae4d77-2c03-7ba2-8496-024b5a683449@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Jan 2023 17:16:24 +0100
Message-ID: <CAJaqyWdhs+jyXF1Cqf2rd_+gfFNecEJ526a2OFMOZ6+T8rKccQ@mail.gmail.com>
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Mon, Jan 16, 2023 at 7:37 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 16:19, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> To restore the device at the destination of a live migration we send =
the
> >>> commands through control virtqueue. For a device to read CVQ it must
> >>> have received the DRIVER_OK status bit.
> >> This probably requires the support from the parent driver and requires
> >> some changes or fixes in the parent driver.
> >>
> >> Some drivers did:
> >>
> >> parent_set_status():
> >> if (DRIVER_OK)
> >>      if (queue_enable)
> >>          write queue_enable to the device
> >>
> >> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
> >>
> > I don't get your point here. No device should start reading CVQ (or
> > any other VQ) without having received DRIVER_OK.
>
>
> If I understand the code correctly:
>
> For CVQ, we do SET_VRING_ENABLE before DRIVER_OK, that's fine.
>
> For datapath_vq, we do SET_VRING_ENABLE after DRIVER_OK, this requires
> parent driver support (explained above)
>
>
> >
> > Some parent drivers do not support sending the queue enable command
> > after DRIVER_OK, usually because they clean part of the state like the
> > set by set_vring_base. Even vdpa_net_sim needs fixes here.
>
>
> Yes, so the question is:
>
> Do we need another backend feature for this? (otherwise thing may break
> silently)
>
>
> >
> > But my understanding is that it should be supported so I consider it a
> > bug.
>
>
> Probably, we need fine some proof in the spec, e.g in 3.1.1:
>
> """
>
> 7.Perform device-specific setup, including discovery of virtqueues for
> the device, optional per-bus setup, reading and possibly writing the
> device=E2=80=99s virtio configuration space, and population of virtqueues=
.
> 8.Set the DRIVER_OK status bit. At this point the device is =E2=80=9Clive=
=E2=80=9D.
>
> """
>
> So if my understanding is correct, "discovery of virtqueues for the
> device" implies queue_enable here which is expected to be done before
> DRIVER_OK. But it doesn't say anything regrading to the behaviour of
> setting queue ready after DRIVER_OK.
>
> I'm not sure it's a real bug or not, may Michael and comment on this.
>

Right, input on this topic would be really appreciated.

>
> >   Especially after queue_reset patches. Is that what you mean?
>
>
> We haven't supported queue_reset yet in Qemu. But it allows to write 1
> to queue_enable after DRIVER_OK for sure.
>

I was not clear, I meant in the emulated device. I'm testing this
series with the proposal of _F_STATE.

>
> >
> >>> However this opens a window where the device could start receiving
> >>> packets in rx queue 0 before it receives the RSS configuration. To av=
oid
> >>> that, we will not send vring_enable until all configuration is used b=
y
> >>> the device.
> >>>
> >>> As a first step, run vhost_set_vring_ready for all vhost_net backend =
after
> >>> all of them are started (with DRIVER_OK). This code should not affect
> >>> vdpa.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   hw/net/vhost_net.c | 17 ++++++++++++-----
> >>>   1 file changed, 12 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >>> index c4eecc6f36..3900599465 100644
> >>> --- a/hw/net/vhost_net.c
> >>> +++ b/hw/net/vhost_net.c
> >>> @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClient=
State *ncs,
> >>>           } else {
> >>>               peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >>>           }
> >>> +        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >>> +        if (r < 0) {
> >>> +            goto err_start;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    for (int j =3D 0; j < nvhosts; j++) {
> >>> +        if (j < data_queue_pairs) {
> >>> +            peer =3D qemu_get_peer(ncs, j);
> >>> +        } else {
> >>> +            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >>> +        }
> >> I fail to understand why we need to change the vhost_net layer? This
> >> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
> >> vhost_vdpa_dev_start()?
> >>
> > The vhost-net layer explicitly calls vhost_set_vring_enable before
> > vhost_dev_start, and this is exactly the behavior we want to avoid.
> > Even if we make changes to vhost_dev, this change is still needed.
>
>
> Note that the only user of vhost_set_vring_enable() is vhost-user where
> the semantic is different:
>
> It uses that to changes the number of active queues:
>
> static int peer_attach(VirtIONet *n, int index)
>
>          if (nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_USER) {
> =3D>      vhost_set_vring_enable(nc->peer, 1);
>      }
>
> This is not the semantic of vhost-vDPA that tries to be complaint with
> virtio-spec. So I'm not sure how it can help here.
>

Right, but previous changes use enable callback to delay the enable of
the datapath virtqueues. I'll try to fit the changes in
virtio/vhost-vdpa though.

Thanks!

>
> >
> > And we want to explicitly enable CVQ first, which "only" vhost_net
> > knows which is.
>
>
> This should be known by net/vhost-vdpa.c.
>
>
> > To perform that in vhost_vdpa_dev_start would require
> > quirks, involving one or more of:
> > * Ignore vq enable calls if the device is not the CVQ one. How to
> > signal what is the CVQ? Can we trust it will be the last one for all
> > kind of devices?
> > * Enable queues that do not belong to the last vhost_dev from the enabl=
e call.
> > * Enable the rest of the queues from the last enable in reverse order.
> > * Intercalate the "net load" callback between enabling the last
> > vhost_vdpa device and enabling the rest of devices.
> > * Add an "enable priority" order?
>
>
> Haven't had time in thinking through, but it would be better if we can
> limit the changes in vhost-vdpa layer. E.g currently the
> VHOST_VDPA_SET_VRING_ENABLE is done at vhost_dev_start().
>
> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>>           if (peer->vring_enable) {
> >>>               /* restore vring enable state */
> >>> @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClient=
State *ncs,
> >>>                   goto err_start;
> >>>               }
> >>>           }
> >>> -
> >>> -        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >>> -        if (r < 0) {
> >>> -            goto err_start;
> >>> -        }
> >>>       }
> >>>
> >>>       return 0;
> >>> --
> >>> 2.31.1
> >>>
>


