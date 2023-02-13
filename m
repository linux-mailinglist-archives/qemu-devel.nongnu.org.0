Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3C694442
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:17:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRWo6-0003Id-OL; Mon, 13 Feb 2023 06:15:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRWnz-0003IA-UP
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:15:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pRWnv-0006v2-UE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676286924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3krPcRoVewQj5tiDOMVRwWFEo1Qb9NMf4c6RHf2X7IY=;
 b=FtNHnkfyX6eKdR+weRALTkcILbgSRWb3jTLY3AxLgjo4dsclXA/M1GPqFZqFdq5WksFHbr
 5UXwQxO3JqyFCD5qVfEs2pgFLu0vADDHGtdALKb5g1tftcQVHq5l3SQkO3vTma/aLvw34o
 WzQC0mFSdYVOQB+sBLEVLlF3xMwt8KY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-114-K-jp_OsBNCG6jymszRGIuQ-1; Mon, 13 Feb 2023 06:15:23 -0500
X-MC-Unique: K-jp_OsBNCG6jymszRGIuQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-4c8e781bc0aso123895887b3.22
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3krPcRoVewQj5tiDOMVRwWFEo1Qb9NMf4c6RHf2X7IY=;
 b=khnJxyutkrOByCr47GqjEWNlDIiNqYsrw8JbY9nCzx2f54UFqYzSmzx79VIEpF1R+a
 Y5sWtOEYAF295dvGvuwRXRt6ZWo4dLdhBVIHeMfAn2VzHzm0UiP/VORllga8qoXkFSfI
 2BETlgpeSNXDEMk+4kLSPFPBFrYQbMfynw8bTfKz+XwrKsAfgLaRPIm/GbNL05N5JZ0W
 eDU1ETY+GfKvCW0d6Isk3nVPGeExBbPjmFMnkzxDeoVWK9noe4EHVvWj5Rsq4pH67XDr
 KImmtgB7rwhXbfkCzqWHK39sPWX+2g9DaBAZ7fa20Wb+q5Xz4SKprjfn3PMjzxHti5oT
 L23Q==
X-Gm-Message-State: AO0yUKUoEHhEUbIsM02CwS+yHJf+mxudFsASo10HzJGb/ymOP/1WeJ0A
 guZDf/KNu4A3r0x1PA0EEui36HhtBOy9datO1RlAyFY940NNSgr7m+6Ne9uLgfkHQAP19/ykgX+
 nCg0a7jc7TWelAH0VPTfOfkBAXGko7i8=
X-Received: by 2002:a25:8e84:0:b0:8be:8c5f:9d58 with SMTP id
 q4-20020a258e84000000b008be8c5f9d58mr1865569ybl.202.1676286922668; 
 Mon, 13 Feb 2023 03:15:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+rA4YqPyTtxJ2e8KkW/2ZD5KcVz0BdV7Xp1kiZNajPzx9OGNohCpgfsD91avqW2HM481VV1q1pIdCfzNIIjus=
X-Received: by 2002:a25:8e84:0:b0:8be:8c5f:9d58 with SMTP id
 q4-20020a258e84000000b008be8c5f9d58mr1865563ybl.202.1676286922395; Mon, 13
 Feb 2023 03:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-2-eperezma@redhat.com>
 <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
In-Reply-To: <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 13 Feb 2023 12:14:46 +0100
Message-ID: <CAJaqyWfVOmVs5j_O=TMRSO3ZkDWuX-ZRJMY_nTYicAev8+QMHA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] vdpa net: move iova tree creation from init to
 start
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Lei Yang <leiyang@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Shannon Nelson <snelson@pensando.io>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>
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

On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
>
>
> On 2/8/2023 1:42 AM, Eugenio P=C3=A9rez wrote:
> > Only create iova_tree if and when it is needed.
> >
> > The cleanup keeps being responsible of last VQ but this change allows i=
t
> > to merge both cleanup functions.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
> > ---
> >   net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++-------------=
-
> >   1 file changed, 71 insertions(+), 28 deletions(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index de5ed8ff22..a9e6c8f28e 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -178,13 +178,9 @@ err_init:
> >   static void vhost_vdpa_cleanup(NetClientState *nc)
> >   {
> >       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> > -    struct vhost_dev *dev =3D &s->vhost_net->dev;
> >
> >       qemu_vfree(s->cvq_cmd_out_buffer);
> >       qemu_vfree(s->status);
> > -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> > -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_dele=
te);
> > -    }
> >       if (s->vhost_net) {
> >           vhost_net_cleanup(s->vhost_net);
> >           g_free(s->vhost_net);
> > @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState =
*nc, const uint8_t *buf,
> >       return size;
> >   }
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
> >   static NetClientInfo net_vhost_vdpa_info =3D {
> >           .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >           .size =3D sizeof(VhostVDPAState),
> >           .receive =3D vhost_vdpa_receive,
> > +        .start =3D vhost_vdpa_net_data_start,
> > +        .stop =3D vhost_vdpa_net_client_stop,
> >           .cleanup =3D vhost_vdpa_cleanup,
> >           .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >           .has_ufo =3D vhost_vdpa_has_ufo,
> > @@ -351,7 +401,7 @@ dma_map_err:
> >
> >   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >   {
> > -    VhostVDPAState *s;
> > +    VhostVDPAState *s, *s0;
> >       struct vhost_vdpa *v;
> >       uint64_t backend_features;
> >       int64_t cvq_group;
> > @@ -425,6 +475,15 @@ out:
> >           return 0;
> >       }
> >
> > +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> > +    if (s0->vhost_vdpa.iova_tree) {
> > +        /* SVQ is already configured for all virtqueues */
> > +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> > +    } else {
> > +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> > +                                           v->iova_range.last);
> I wonder how this case could happen, vhost_vdpa_net_data_start_first()
> should've allocated an iova tree on the first data vq. Is zero data vq
> ever possible on net vhost-vdpa?
>

It's the case of the current qemu master when only CVQ is being
shadowed. It's not that "there are no data vq": If that case were
possible, CVQ vhost-vdpa state would be s0.

The case is that since only CVQ vhost-vdpa is the one being migrated,
only CVQ has an iova tree.

With this series applied and with no migration running, the case is
the same as before: only SVQ gets shadowed. When migration starts, all
vqs are migrated, and share iova tree.

Thanks!

> Thanks,
> -Siwei
> > +    }
> > +
> >       r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffe=
r,
> >                                  vhost_vdpa_net_cvq_cmd_page_len(), fal=
se);
> >       if (unlikely(r < 0)) {
> > @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState=
 *nc)
> >       if (s->vhost_vdpa.shadow_vqs_enabled) {
> >           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffe=
r);
> >           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
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
> >       }
> > +
> > +    vhost_vdpa_net_client_stop(nc);
> >   }
> >
> >   static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_l=
en,
> > @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >                                          int nvqs,
> >                                          bool is_datapath,
> >                                          bool svq,
> > -                                       struct vhost_vdpa_iova_range io=
va_range,
> > -                                       VhostIOVATree *iova_tree)
> > +                                       struct vhost_vdpa_iova_range io=
va_range)
> >   {
> >       NetClientState *nc =3D NULL;
> >       VhostVDPAState *s;
> > @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClien=
tState *peer,
> >       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >       s->vhost_vdpa.iova_range =3D iova_range;
> >       s->vhost_vdpa.shadow_data =3D svq;
> > -    s->vhost_vdpa.iova_tree =3D iova_tree;
> >       if (!is_datapath) {
> >           s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page_s=
ize(),
> >                                               vhost_vdpa_net_cvq_cmd_pa=
ge_len());
> > @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       uint64_t features;
> >       int vdpa_device_fd;
> >       g_autofree NetClientState **ncs =3D NULL;
> > -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >       struct vhost_vdpa_iova_range iova_range;
> >       NetClientState *nc;
> >       int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> > @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, cons=
t char *name,
> >           goto err;
> >       }
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
> >       }
> >
> >       ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> > @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const=
 char *name,
> >       for (i =3D 0; i < queue_pairs; i++) {
> >           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                        vdpa_device_fd, i, 2, true, opts=
->x_svq,
> > -                                     iova_range, iova_tree);
> > +                                     iova_range);
> >           if (!ncs[i])
> >               goto err;
> >       }
> > @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >       if (has_cvq) {
> >           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >                                    vdpa_device_fd, i, 1, false,
> > -                                 opts->x_svq, iova_range, iova_tree);
> > +                                 opts->x_svq, iova_range);
> >           if (!nc)
> >               goto err;
> >       }
> >
> > -    /* iova_tree ownership belongs to last NetClientState */
> > -    g_steal_pointer(&iova_tree);
> >       return 0;
> >
> >   err:
> > @@ -849,7 +893,6 @@ err:
> >           }
> >       }
> >
> > -err_svq:
> >       qemu_close(vdpa_device_fd);
> >
> >       return -1;
>


