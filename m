Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E3668F3E
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 08:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGEV5-0000cO-MJ; Fri, 13 Jan 2023 02:29:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEUx-0000c4-9H
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:29:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGEUv-00047N-8F
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 02:29:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673594948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JYyPDLO/5bNaVjXL7sQisq445lXzTopfYraJPeiJvU=;
 b=jJZR3cbvQ5LhkvHJ0Uf2wYk1CcffoXizAwkRTZikecX0r76tb72EqEissU21T6lZj3F4nt
 n6Thta2VS9M13swg2PQaD5u9Ng1faQQyRYkDmm3H3BtTemntoj7gYn08f2fOQM6tJx0VRO
 kHCex3jfeM4BRcZyhbq+3YAalm8v5Ps=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-uuhK2-bsOWqdYuFfM2Z48A-1; Fri, 13 Jan 2023 02:29:07 -0500
X-MC-Unique: uuhK2-bsOWqdYuFfM2Z48A-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-4c2d68b6969so208327537b3.7
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 23:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5JYyPDLO/5bNaVjXL7sQisq445lXzTopfYraJPeiJvU=;
 b=3g75BM9yHKlccPAooz17FTLHvyCabESic8lROs6XSiyzQcxej1nAnOPVBx7DAlDYNG
 N1vb5CE4nYIRV2Mh9DaFGyg/MhEhJ1BhBTN9hc68Ap6yfErCdMbLuB+5tQ/zHMhHNb95
 qQwSetGn7FgXO3zL9D6UjahQWDw+0hwVaQYy92Gqp7lI82Xmjfp2HZmS/O9UAZB2TSDN
 vChOGHjaSDJ/zwcLd65Ynh3NUEK69jBZU4IQG1h/qXGavmYh2Cwnfjbmg0NNUKmZxp5s
 qnGxckeNgSIaUbwIQLr1bY7ry93lopOQjFdh6S523yHoCT82BfoMsuRX+InJdc6nn1oQ
 oIAw==
X-Gm-Message-State: AFqh2kquLY0sC6YpzbR8BD/uc5Pv9EZLQHzVSss6b0Y89jMS3eLN0z/R
 6zCZVqYX0/r5MiKcZ0/+LYb0T5YdwsXXFmn75P6J17HDEgYlkIqfbW42NFVuL0lY90vd9qWVLPn
 8gndQaNJj776QaHLIAkXsu/MRs+PqPL4=
X-Received: by 2002:a25:cc53:0:b0:7ce:4650:5e5a with SMTP id
 l80-20020a25cc53000000b007ce46505e5amr99899ybf.123.1673594946520; 
 Thu, 12 Jan 2023 23:29:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsHHU0SwN4RuUzbX+gsbkRfIPC0yAB2bvNP7iHT10CcaG1VDYghLEew3If5Cpk2KJvTVnh/HxRhxW7o5PEPK0U=
X-Received: by 2002:a25:cc53:0:b0:7ce:4650:5e5a with SMTP id
 l80-20020a25cc53000000b007ce46505e5amr99880ybf.123.1673594946259; Thu, 12 Jan
 2023 23:29:06 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-3-eperezma@redhat.com>
 <CACGkMEvoo1LkBj9m9afCu39J9ngBPVV7T2R7VaRabd8-WdN0oQ@mail.gmail.com>
In-Reply-To: <CACGkMEvoo1LkBj9m9afCu39J9ngBPVV7T2R7VaRabd8-WdN0oQ@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 08:28:29 +0100
Message-ID: <CAJaqyWdioFYZPJT+xfHUxgsZzwVVGKfSbmieuKvhEodgK99c=Q@mail.gmail.com>
Subject: Re: [RFC v2 02/13] vdpa net: move iova tree creation from init to
 start
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

On Fri, Jan 13, 2023 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Only create iova_tree if and when it is needed.
> >
> > The cleanup keeps being responsability of last VQ but this change allow=
s
> > to merge both cleanup functions.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  net/vhost-vdpa.c | 101 +++++++++++++++++++++++++++++++++--------------
> >  1 file changed, 71 insertions(+), 30 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index de5ed8ff22..75cca497c8 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -178,13 +178,9 @@ err_init:
> >  static void vhost_vdpa_cleanup(NetClientState *nc)
> >  {
> >      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > -    struct vhost_dev *dev =3D &s->vhost_net->dev;
> >
> >      qemu_vfree(s->cvq_cmd_out_buffer);
> >      qemu_vfree(s->status);
> > -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > -    }
> >      if (s->vhost_net) {
> >          vhost_net_cleanup(s->vhost_net);
> >          g_free(s->vhost_net);
> > @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState =
*nc, const uint8_t *buf,
> >      return size;
> >  }
> >
> > +/** From any vdpa net client, get the netclient of first queue pair */
> > +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
> > +{
> > +    NICState *nic =3D qemu_get_nic(s->nc.peer);
> > +    NetClientState *nc0 =3D qemu_get_peer(nic->ncs, 0);
> > +
> > +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> > +}
> > +
> > +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> > +{
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > +                                           v->iova_range.last);
> > +    }
> > +}
> > +
> > +static int vhost_vdpa_net_data_start(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    if (v->index =3D=3D 0) {
> > +        vhost_vdpa_net_data_start_first(s);
> > +        return 0;
> > +    }
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        VhostVDPAState *s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> > +    }
>
> It looks to me the logic here is somehow the same as
> vhost_vdpa_net_cvq_start(), can we unify the them?
>

It depends on what you mean by unify :). But we can explore it for sure.

We can call vhost_vdpa_net_data_start, but the steps to do if
s0->vhost_vdpa.iova_tree =3D=3D NULL are different. Data queues must do
nothing, but CVQ must create a new iova tree.

So one possibility is to convert this part of vhost_vdpa_net_cvq_start:
    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
    if (s0->vhost_vdpa.iova_tree) {
        /* SVQ is already configured for all virtqueues */
        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
    } else {
        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
                                           v->iova_range.last);
    }

into:
    vhost_vdpa_net_data_start(nc);
    if (!v->iova_tree) {
        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
                                           v->iova_range.last);
    }

I'm ok with the change but it's less clear in my opinion: it's not
obvious that net_data_start is in charge of setting v->iova_tree to
me.

Another possibility is to abstract something like
first_nc_iova_tree(), but we need to check more fields of s0 later
(shadow_data) so I'm not sure about the benefit.

Is that what you have in mind?

Thanks!

> > +
> > +    return 0;
> > +}
> > +
> > +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> > +{
> > +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > +    struct vhost_dev *dev;
> > +
> > +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> > +
> > +    dev =3D s->vhost_vdpa.dev;
> > +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > +    }
> > +}
> > +
> >  static NetClientInfo net_vhost_vdpa_info =3D {
> >          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >          .size =3D sizeof(VhostVDPAState),
> >          .receive =3D vhost_vdpa_receive,
> > +        .start =3D vhost_vdpa_net_data_start,
> > +        .stop =3D vhost_vdpa_net_client_stop,
> >          .cleanup =3D vhost_vdpa_cleanup,
> >          .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >          .has_ufo =3D vhost_vdpa_has_ufo,
> > @@ -351,7 +401,7 @@ dma_map_err:
> >
> >  static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >  {
> > -    VhostVDPAState *s;
> > +    VhostVDPAState *s, *s0;
> >      struct vhost_vdpa *v;
> >      uint64_t backend_features;
> >      int64_t cvq_group;
> > @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState =
*nc)
> >          return r;
> >      }
> >
> > -    v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > -                                       v->iova_range.last);
> >      v->shadow_vqs_enabled =3D true;
> >      s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> >
> > @@ -425,6 +473,15 @@ out:
> >          return 0;
> >      }
> >
> > +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > +    if (s0->vhost_vdpa.iova_tree) {
> > +        /* SVQ is already configured for all virtqueues */
> > +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> > +    } else {
> > +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > +                                           v->iova_range.last);
> > +    }
> > +
> >      r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
,
> >                                 vhost_vdpa_net_cvq_cmd_page_len(), fals=
e);
> >      if (unlikely(r < 0)) {
> > @@ -449,15 +506,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState=
 *nc)
> >      if (s->vhost_vdpa.shadow_vqs_enabled) {
> >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer=
);
> >          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> > -        if (!s->always_svq) {
> > -            /*
> > -             * If only the CVQ is shadowed we can delete this safely.
> > -             * If all the VQs are shadows this will be needed by the t=
ime the
> > -             * device is started again to register SVQ vrings and simi=
lar.
> > -             */
> > -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_=
delete);
> > -        }
> >      }
> > +
> > +    vhost_vdpa_net_client_stop(nc);
> >  }
> >
> >  static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_le=
n,
> > @@ -667,8 +718,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >                                         int nvqs,
> >                                         bool is_datapath,
> >                                         bool svq,
> > -                                       struct vhost_vdpa_iova_range io=
va_range,
> > -                                       VhostIOVATree *iova_tree)
> > +                                       struct vhost_vdpa_iova_range io=
va_range)
> >  {
> >      NetClientState *nc =3D NULL;
> >      VhostVDPAState *s;
> > @@ -690,7 +740,6 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >      s->vhost_vdpa.iova_range =3D iova_range;
> >      s->vhost_vdpa.shadow_data =3D svq;
> > -    s->vhost_vdpa.iova_tree =3D iova_tree;
> >      if (!is_datapath) {
> >          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_si=
ze(),
> >                                              vhost_vdpa_net_cvq_cmd_pag=
e_len());
> > @@ -760,7 +809,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >      uint64_t features;
> >      int vdpa_device_fd;
> >      g_autofree NetClientState **ncs =3D NULL;
> > -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >      struct vhost_vdpa_iova_range iova_range;
> >      NetClientState *nc;
> >      int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > @@ -812,12 +860,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >          goto err;
> >      }
> >
> > -    if (opts->x_svq) {
> > -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> > -            goto err_svq;
> > -        }
> > -
> > -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range=
.last);
> > +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, er=
rp)) {
> > +        goto err;
> >      }
> >
> >      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > @@ -825,7 +869,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >      for (i =3D 0; i < queue_pairs; i++) {
> >          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                       vdpa_device_fd, i, 2, true, opts-=
>x_svq,
> > -                                     iova_range, iova_tree);
> > +                                     iova_range);
> >          if (!ncs[i])
> >              goto err;
> >      }
> > @@ -833,13 +877,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >      if (has_cvq) {
> >          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                   vdpa_device_fd, i, 1, false,
> > -                                 opts->x_svq, iova_range, iova_tree);
> > +                                 opts->x_svq, iova_range);
> >          if (!nc)
> >              goto err;
> >      }
> >
> > -    /* iova_tree ownership belongs to last NetClientState */
> > -    g_steal_pointer(&iova_tree);
> >      return 0;
> >
> >  err:
> > @@ -849,7 +891,6 @@ err:
> >          }
> >      }
> >
> > -err_svq:
> >      qemu_close(vdpa_device_fd);
> >
> >      return -1;
> > --
> > 2.31.1
> >
>


