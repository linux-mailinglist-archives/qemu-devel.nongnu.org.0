Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA305669089
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFI9-0007Xh-0m; Fri, 13 Jan 2023 03:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFI2-0007XN-CE
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:19:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGFHv-0008OB-Jl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673597979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8CuNm7fIiQpgimFV7cAlaPA8dz2+iUfKlqKN1Q0x1G8=;
 b=cmvMz6Ns2abefIT6kLu1XLZ/Tq1SpwVE0TxsGdnysvRg8trIRlDt+rTudqihvq8KYQ3bF7
 0llS3kXbJ1e/6J24PGJJaj0Hb59ow20eQW2G+aHSeCsj7qnKU6wxJQgfyx9ECHXxvZWMNM
 eihLKLv0hxhXzG3HhEqX8Agc8wu4+wQ=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-zO_aUK9-MK64oFZKpVF84A-1; Fri, 13 Jan 2023 03:19:37 -0500
X-MC-Unique: zO_aUK9-MK64oFZKpVF84A-1
Received: by mail-yb1-f198.google.com with SMTP id
 z17-20020a25e311000000b00719e04e59e1so22157568ybd.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CuNm7fIiQpgimFV7cAlaPA8dz2+iUfKlqKN1Q0x1G8=;
 b=3KhrQjiFM/FsObUcrU4sfQqfM+o9iNvK0Iq2O3psBLcghuXEDjgTzPodg338Qt1Z2u
 dYHLnEcTFTs/LDittWVhey0bASN88YqsGuA2MIY96C0jGSj2s+he59ipDNVoLthI6VkU
 eAZVUffImFXAk28LuneYGLVfXQ0MhfdMc4EGn9aZ0n99rW/zezYpvdxSbcobeAtymAjk
 /onDFDrNzP/XymekEVpnOYvujKdy7RGVRkjMDgh3x1ulrYIy4u0UtG9qSK/i/mvvJSss
 iN18ht6ZJbolpJ1fHU4kDT3GYOkrxrq4jc+ydZO7s9Ydz/xAncKBq/XNdQruSziLb7ex
 IR/Q==
X-Gm-Message-State: AFqh2krZYi1lKPJaXVtePVcFa3uPpmHDzEEG9SVyVGwL3fktTBlWihwe
 13AQjZ+AXG835PhrPF4baR+KrHiERXopZOtmOP26lI58NLul3iYqvzzX25wglliTtC5qmF33S2Y
 MA/wU8wv1SC3vhr+SqDxHYlrfrYal2bE=
X-Received: by 2002:a5b:85:0:b0:7ca:5202:8e78 with SMTP id
 b5-20020a5b0085000000b007ca52028e78mr398349ybp.382.1673597976768; 
 Fri, 13 Jan 2023 00:19:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXshJpP+LvJlJg4DXmnnvwDsZ0f15lVH/3gtJJi6zks2xjh1NhUTdYU/Ig5PvFLwnfVlTSNh3/kWdWEULKdRKec=
X-Received: by 2002:a5b:85:0:b0:7ca:5202:8e78 with SMTP id
 b5-20020a5b0085000000b007ca52028e78mr398343ybp.382.1673597976520; 
 Fri, 13 Jan 2023 00:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
In-Reply-To: <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 09:19:00 +0100
Message-ID: <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > To restore the device at the destination of a live migration we send th=
e
> > commands through control virtqueue. For a device to read CVQ it must
> > have received the DRIVER_OK status bit.
>
> This probably requires the support from the parent driver and requires
> some changes or fixes in the parent driver.
>
> Some drivers did:
>
> parent_set_status():
> if (DRIVER_OK)
>     if (queue_enable)
>         write queue_enable to the device
>
> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
>

I don't get your point here. No device should start reading CVQ (or
any other VQ) without having received DRIVER_OK.

Some parent drivers do not support sending the queue enable command
after DRIVER_OK, usually because they clean part of the state like the
set by set_vring_base. Even vdpa_net_sim needs fixes here.

But my understanding is that it should be supported so I consider it a
bug. Especially after queue_reset patches. Is that what you mean?

> >
> > However this opens a window where the device could start receiving
> > packets in rx queue 0 before it receives the RSS configuration. To avoi=
d
> > that, we will not send vring_enable until all configuration is used by
> > the device.
> >
> > As a first step, run vhost_set_vring_ready for all vhost_net backend af=
ter
> > all of them are started (with DRIVER_OK). This code should not affect
> > vdpa.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 17 ++++++++++++-----
> >  1 file changed, 12 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index c4eecc6f36..3900599465 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >          } else {
> >              peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> >          }
> > +        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> > +        if (r < 0) {
> > +            goto err_start;
> > +        }
> > +    }
> > +
> > +    for (int j =3D 0; j < nvhosts; j++) {
> > +        if (j < data_queue_pairs) {
> > +            peer =3D qemu_get_peer(ncs, j);
> > +        } else {
> > +            peer =3D qemu_get_peer(ncs, n->max_queue_pairs);
> > +        }
>
> I fail to understand why we need to change the vhost_net layer? This
> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
> vhost_vdpa_dev_start()?
>

The vhost-net layer explicitly calls vhost_set_vring_enable before
vhost_dev_start, and this is exactly the behavior we want to avoid.
Even if we make changes to vhost_dev, this change is still needed.

And we want to explicitly enable CVQ first, which "only" vhost_net
knows which is. To perform that in vhost_vdpa_dev_start would require
quirks, involving one or more of:
* Ignore vq enable calls if the device is not the CVQ one. How to
signal what is the CVQ? Can we trust it will be the last one for all
kind of devices?
* Enable queues that do not belong to the last vhost_dev from the enable ca=
ll.
* Enable the rest of the queues from the last enable in reverse order.
* Intercalate the "net load" callback between enabling the last
vhost_vdpa device and enabling the rest of devices.
* Add an "enable priority" order?

Thanks!

> Thanks
>
> >
> >          if (peer->vring_enable) {
> >              /* restore vring enable state */
> > @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientSt=
ate *ncs,
> >                  goto err_start;
> >              }
> >          }
> > -
> > -        r =3D vhost_net_start_one(get_vhost_net(peer), dev);
> > -        if (r < 0) {
> > -            goto err_start;
> > -        }
> >      }
> >
> >      return 0;
> > --
> > 2.31.1
> >
>


