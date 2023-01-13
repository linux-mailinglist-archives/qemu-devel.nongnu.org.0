Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B06668A75
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 04:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGB8P-000855-ET; Thu, 12 Jan 2023 22:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGB8H-00084l-OG
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:53:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGB8F-0006gL-D1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 22:53:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673582010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBoyk0x9MPylpl8iWsWG7oeYGJkh8bCPZLqRlWcsBDY=;
 b=X7LsWTbdQT5HzI35u6P1ZpS20TrQqlPPdpXG/xMBKFtEQWGP+2ucmZM7InsGjkWpEMPjen
 EEdZ3I/e2bwbgqPD8yu+Lf3+jqRguIIWhr0yW6ST8HKava+Bex1lr+PYnWwM8gA6v3jZna
 Fz26Fz+4EQh9uD0XrFeiB2yiQdjRvEI=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-Cm6ReSeuMSOWqDZAbSVhHw-1; Thu, 12 Jan 2023 22:53:26 -0500
X-MC-Unique: Cm6ReSeuMSOWqDZAbSVhHw-1
Received: by mail-ot1-f71.google.com with SMTP id
 e25-20020a05683013d900b00684a1d326e5so4756862otq.13
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 19:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YBoyk0x9MPylpl8iWsWG7oeYGJkh8bCPZLqRlWcsBDY=;
 b=h1WA2m6IznjwWJ6OEDjsWEIHP9I/Jx+lgxhgomaPfIMgFo/bM4yXgLBkK3/bKMwKSp
 /FC5/yXgvgsZeK0nO3jLad/E65of3dxrlMdT+6BuXc2Uk6bfYi+RfG/juYHYTWGB3hpH
 jON1WXrntdYM/c0AwfzDahCPXNhoZCg2qq/qLrr5H2xGBq9tZNqJzkZNfDepWmoVVDyJ
 8P/3bd1QSQTfbOPo4MEu75xasbxxPAtGUqwKRguaMou8mqdbpw6nN4hkSOHpUnggXNc2
 99Fbn/pvtxJ2W5v3QX30vb23rtml7GSB1SPQsB4s1zoNZRb7HGeLKSWK/j9UzCXclAZU
 vN4A==
X-Gm-Message-State: AFqh2kpbN5qfoAlF2INDl2yUE8XgRIzVtTWTOxQbCkSYKjnG5mMnqdgV
 xqukKoSXxUEMn5za1JOgc/45SkTVgHaMvSLsUYFOAHc1KoAe2VyZyT94bRBpQ1AIWTEpEvd/uXh
 LkWKlJHA34O9e6vDEwG7fwTjkvflHYNA=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1323911oab.280.1673582005514; 
 Thu, 12 Jan 2023 19:53:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsgE+J1L7/xx/dvUXPYRxyditFAjfFbAhLyYbsfHbVHQR+QF6JIXIlppv3IwKKv98Ys/LORoma3po5zoguwIDU=
X-Received: by 2002:a05:6870:9e9a:b0:15b:96b5:9916 with SMTP id
 pu26-20020a0568709e9a00b0015b96b59916mr1323892oab.280.1673582005262; Thu, 12
 Jan 2023 19:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-3-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-3-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 11:53:14 +0800
Message-ID: <CACGkMEvoo1LkBj9m9afCu39J9ngBPVV7T2R7VaRabd8-WdN0oQ@mail.gmail.com>
Subject: Re: [RFC v2 02/13] vdpa net: move iova tree creation from init to
 start
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Only create iova_tree if and when it is needed.
>
> The cleanup keeps being responsability of last VQ but this change allows
> to merge both cleanup functions.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  net/vhost-vdpa.c | 101 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 71 insertions(+), 30 deletions(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index de5ed8ff22..75cca497c8 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -178,13 +178,9 @@ err_init:
>  static void vhost_vdpa_cleanup(NetClientState *nc)
>  {
>      VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> -    struct vhost_dev *dev =3D &s->vhost_net->dev;
>
>      qemu_vfree(s->cvq_cmd_out_buffer);
>      qemu_vfree(s->status);
> -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
> -    }
>      if (s->vhost_net) {
>          vhost_net_cleanup(s->vhost_net);
>          g_free(s->vhost_net);
> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *n=
c, const uint8_t *buf,
>      return size;
>  }
>
> +/** From any vdpa net client, get the netclient of first queue pair */
> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
> +{
> +    NICState *nic =3D qemu_get_nic(s->nc.peer);
> +    NetClientState *nc0 =3D qemu_get_peer(nic->ncs, 0);
> +
> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> +}
> +
> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> +{
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +
> +    if (v->shadow_vqs_enabled) {
> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> +                                           v->iova_range.last);
> +    }
> +}
> +
> +static int vhost_vdpa_net_data_start(NetClientState *nc)
> +{
> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> +
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    if (v->index =3D=3D 0) {
> +        vhost_vdpa_net_data_start_first(s);
> +        return 0;
> +    }
> +
> +    if (v->shadow_vqs_enabled) {
> +        VhostVDPAState *s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> +    }

It looks to me the logic here is somehow the same as
vhost_vdpa_net_cvq_start(), can we unify the them?

> +
> +    return 0;
> +}
> +
> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> +{
> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> +    struct vhost_dev *dev;
> +
> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> +
> +    dev =3D s->vhost_vdpa.dev;
> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete=
);
> +    }
> +}
> +
>  static NetClientInfo net_vhost_vdpa_info =3D {
>          .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
>          .size =3D sizeof(VhostVDPAState),
>          .receive =3D vhost_vdpa_receive,
> +        .start =3D vhost_vdpa_net_data_start,
> +        .stop =3D vhost_vdpa_net_client_stop,
>          .cleanup =3D vhost_vdpa_cleanup,
>          .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
>          .has_ufo =3D vhost_vdpa_has_ufo,
> @@ -351,7 +401,7 @@ dma_map_err:
>
>  static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>  {
> -    VhostVDPAState *s;
> +    VhostVDPAState *s, *s0;
>      struct vhost_vdpa *v;
>      uint64_t backend_features;
>      int64_t cvq_group;
> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientState *n=
c)
>          return r;
>      }
>
> -    v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> -                                       v->iova_range.last);
>      v->shadow_vqs_enabled =3D true;
>      s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
>
> @@ -425,6 +473,15 @@ out:
>          return 0;
>      }
>
> +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> +    if (s0->vhost_vdpa.iova_tree) {
> +        /* SVQ is already configured for all virtqueues */
> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> +    } else {
> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> +                                           v->iova_range.last);
> +    }
> +
>      r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>                                 vhost_vdpa_net_cvq_cmd_page_len(), false)=
;
>      if (unlikely(r < 0)) {
> @@ -449,15 +506,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *=
nc)
>      if (s->vhost_vdpa.shadow_vqs_enabled) {
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>          vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> -        if (!s->always_svq) {
> -            /*
> -             * If only the CVQ is shadowed we can delete this safely.
> -             * If all the VQs are shadows this will be needed by the tim=
e the
> -             * device is started again to register SVQ vrings and simila=
r.
> -             */
> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> -        }
>      }
> +
> +    vhost_vdpa_net_client_stop(nc);
>  }
>
>  static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
> @@ -667,8 +718,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>                                         int nvqs,
>                                         bool is_datapath,
>                                         bool svq,
> -                                       struct vhost_vdpa_iova_range iova=
_range,
> -                                       VhostIOVATree *iova_tree)
> +                                       struct vhost_vdpa_iova_range iova=
_range)
>  {
>      NetClientState *nc =3D NULL;
>      VhostVDPAState *s;
> @@ -690,7 +740,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientS=
tate *peer,
>      s->vhost_vdpa.shadow_vqs_enabled =3D svq;
>      s->vhost_vdpa.iova_range =3D iova_range;
>      s->vhost_vdpa.shadow_data =3D svq;
> -    s->vhost_vdpa.iova_tree =3D iova_tree;
>      if (!is_datapath) {
>          s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_size=
(),
>                                              vhost_vdpa_net_cvq_cmd_page_=
len());
> @@ -760,7 +809,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      uint64_t features;
>      int vdpa_device_fd;
>      g_autofree NetClientState **ncs =3D NULL;
> -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
>      struct vhost_vdpa_iova_range iova_range;
>      NetClientState *nc;
>      int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> @@ -812,12 +860,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const =
char *name,
>          goto err;
>      }
>
> -    if (opts->x_svq) {
> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> -            goto err_svq;
> -        }
> -
> -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_range.l=
ast);
> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp=
)) {
> +        goto err;
>      }
>
>      ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> @@ -825,7 +869,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const c=
har *name,
>      for (i =3D 0; i < queue_pairs; i++) {
>          ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                       vdpa_device_fd, i, 2, true, opts->x=
_svq,
> -                                     iova_range, iova_tree);
> +                                     iova_range);
>          if (!ncs[i])
>              goto err;
>      }
> @@ -833,13 +877,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
>      if (has_cvq) {
>          nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>                                   vdpa_device_fd, i, 1, false,
> -                                 opts->x_svq, iova_range, iova_tree);
> +                                 opts->x_svq, iova_range);
>          if (!nc)
>              goto err;
>      }
>
> -    /* iova_tree ownership belongs to last NetClientState */
> -    g_steal_pointer(&iova_tree);
>      return 0;
>
>  err:
> @@ -849,7 +891,6 @@ err:
>          }
>      }
>
> -err_svq:
>      qemu_close(vdpa_device_fd);
>
>      return -1;
> --
> 2.31.1
>


