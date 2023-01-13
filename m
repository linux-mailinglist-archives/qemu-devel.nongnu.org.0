Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5036693A4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:05:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGGv9-0003e7-JZ; Fri, 13 Jan 2023 05:04:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGGuk-0003WD-Fb
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGGui-0002Rs-Gw
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673604235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INB2ZBYj2bgpgxcRjjqq8fWtlzU2FE+lTyETwE0CltY=;
 b=inGaILw36SqXsETbZKGOIH79YLDUViyIFiKoR6JjLDKp+JvO1xhw/zzdFolRnZMeOTzNV4
 iMIv4tBzu2YrTx3swfwumRUF2yS+br36ARaYkflyv4EPOoAqiSpJkd+819yN1mrfe+AA7k
 9zNmHoEdh6mK8bvXmRWuWnVntFmD2ik=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-445-eYexFfNSPiCiY8xuz95MDw-1; Fri, 13 Jan 2023 05:03:54 -0500
X-MC-Unique: eYexFfNSPiCiY8xuz95MDw-1
Received: by mail-yb1-f198.google.com with SMTP id
 u186-20020a2560c3000000b007c8e2cf3668so4599001ybb.14
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=INB2ZBYj2bgpgxcRjjqq8fWtlzU2FE+lTyETwE0CltY=;
 b=T807qJHX4U89JubBcGcJ2Ud2zvX/6rjuHw2PcrhuhEixtG9Um1ARI08G7lAssLb9Xg
 FeXjKvzOdebMnB8rkK8CJJ27n3QtDnrrUKdSAsGqvrXfbmXJk9eEQyqGECZD5nNslJ/Q
 9QMG6DLvwbf7Ted5i2YtPW/eeaeLwxN+3RQIcl94I2h0DM+fimYXIH3uZe1pVVzJHj6m
 yyxequ0K+z96BpIj9Uunf8JPVCrjrJIghR4xop2QQLwgCfMWVMzaBDt5q1iF6hMOjXzp
 hrUpa1ihuj//HKbdCpcf+mkUSwyDOfxHAMAoor4hGEB+EFKfMlBM9GcWhDQGZ4Fmp+uf
 29iQ==
X-Gm-Message-State: AFqh2kquuE0Jp5VFB4q+njt7JfOVSCeKZ+leWpFIQ4jf6FXBq071HYBH
 qVO6GX1rBY3TiC1EkovaatmUj6lzt0UllgcuFUjVedKPtYpzm8NdNN+YaG82ClI7cYTdWALaGar
 j3pjMJLZB8Nq7vFoGU8ftA5fTnVvgQxY=
X-Received: by 2002:a25:cc53:0:b0:7ce:4650:5e5a with SMTP id
 l80-20020a25cc53000000b007ce46505e5amr139818ybf.123.1673604233853; 
 Fri, 13 Jan 2023 02:03:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuFnJRPncV3hRrMXlyVPRQZi4Me431HPh5Dcut5SZq9FEJ0CcHKghmQbzyjHkjqSojrxVArlTDmw8D2rK7AEU8=
X-Received: by 2002:a25:cc53:0:b0:7ce:4650:5e5a with SMTP id
 l80-20020a25cc53000000b007ce46505e5amr139808ybf.123.1673604233640; Fri, 13
 Jan 2023 02:03:53 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
 <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
 <20230113095143.si4qzblki3votezg@sgarzare-redhat>
In-Reply-To: <20230113095143.si4qzblki3votezg@sgarzare-redhat>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 11:03:17 +0100
Message-ID: <CAJaqyWfrb+JN8ZMfvi1eWt-uM9sQvYb=uKvygDu9bj0OmL0pUA@mail.gmail.com>
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, 
 Maxime Coquelin <maxime.coquelin@redhat.com>
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

On Fri, Jan 13, 2023 at 10:51 AM Stefano Garzarella <sgarzare@redhat.com> w=
rote:
>
> On Fri, Jan 13, 2023 at 09:19:00AM +0100, Eugenio Perez Martin wrote:
> >On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >> >
> >> > To restore the device at the destination of a live migration we send=
 the
> >> > commands through control virtqueue. For a device to read CVQ it must
> >> > have received the DRIVER_OK status bit.
> >>
> >> This probably requires the support from the parent driver and requires
> >> some changes or fixes in the parent driver.
> >>
> >> Some drivers did:
> >>
> >> parent_set_status():
> >> if (DRIVER_OK)
> >>     if (queue_enable)
> >>         write queue_enable to the device
> >>
> >> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
> >>
> >
> >I don't get your point here. No device should start reading CVQ (or
> >any other VQ) without having received DRIVER_OK.
> >
> >Some parent drivers do not support sending the queue enable command
> >after DRIVER_OK, usually because they clean part of the state like the
> >set by set_vring_base. Even vdpa_net_sim needs fixes here.
> >
> >But my understanding is that it should be supported so I consider it a
> >bug. Especially after queue_reset patches. Is that what you mean?
> >
> >> >
> >> > However this opens a window where the device could start receiving
> >> > packets in rx queue 0 before it receives the RSS configuration. To a=
void
> >> > that, we will not send vring_enable until all configuration is used =
by
> >> > the device.
> >> >
> >> > As a first step, run vhost_set_vring_ready for all vhost_net backend=
 after
> >> > all of them are started (with DRIVER_OK). This code should not affec=
t
> >> > vdpa.
> >> >
> >> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> > ---
> >> >  hw/net/vhost_net.c | 17 ++++++++++++-----
> >> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> > index c4eecc6f36..3900599465 100644
> >> > --- a/hw/net/vhost_net.c
> >> > +++ b/hw/net/vhost_net.c
> >> > @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClien=
tState *ncs,
> >> >          } else {
> >> >              peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >> >          }
> >> > +        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >> > +        if (r < 0) {
> >> > +            goto err_start;
> >> > +        }
> >> > +    }
> >> > +
> >> > +    for (int j =3D 0; j < nvhosts; j++) {
> >> > +        if (j < data_queue_pairs) {
> >> > +            peer =3D qemu_get_peer(ncs, j);
> >> > +        } else {
> >> > +            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >> > +        }
> >>
> >> I fail to understand why we need to change the vhost_net layer? This
> >> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
> >> vhost_vdpa_dev_start()?
> >>
> >
> >The vhost-net layer explicitly calls vhost_set_vring_enable before
> >vhost_dev_start, and this is exactly the behavior we want to avoid.
> >Even if we make changes to vhost_dev, this change is still needed.
>
> I'm working on something similar since I'd like to re-work the following
> commit we merged just before 7.2 release:
>      4daa5054c5 vhost: enable vrings in vhost_dev_start() for vhost-user
>      devices
>
> vhost-net wasn't the only one who enabled vrings independently, but it
> was easy enough for others devices to avoid it and enable them in
> vhost_dev_start().
>
> Do you think can we avoid in some way this special behaviour of
> vhost-net and enable the vrings in vhost_dev_start?
>

Actually looking forward to it :). If that gets merged before this
series, I think we could drop this patch.

If I'm not wrong the enable/disable dance is used just by vhost-user
at the moment.

Maxime, could you give us some hints about the tests to use to check
that changes do not introduce regressions in vhost-user?

Thanks!

> Thanks,
> Stefano
>
> >
> >And we want to explicitly enable CVQ first, which "only" vhost_net
> >knows which is. To perform that in vhost_vdpa_dev_start would require
> >quirks, involving one or more of:
> >* Ignore vq enable calls if the device is not the CVQ one. How to
> >signal what is the CVQ? Can we trust it will be the last one for all
> >kind of devices?
> >* Enable queues that do not belong to the last vhost_dev from the enable=
 call.
> >* Enable the rest of the queues from the last enable in reverse order.
> >* Intercalate the "net load" callback between enabling the last
> >vhost_vdpa device and enabling the rest of devices.
> >* Add an "enable priority" order?
> >
> >Thanks!
> >
> >> Thanks
> >>
> >> >
> >> >          if (peer->vring_enable) {
> >> >              /* restore vring enable state */
> >> > @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClien=
tState *ncs,
> >> >                  goto err_start;
> >> >              }
> >> >          }
> >> > -
> >> > -        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> >> > -        if (r < 0) {
> >> > -            goto err_start;
> >> > -        }
> >> >      }
> >> >
> >> >      return 0;
> >> > --
> >> > 2.31.1
> >> >
> >>
> >
>


