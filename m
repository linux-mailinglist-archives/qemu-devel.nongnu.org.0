Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97066BA00
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLZp-0006Vh-5J; Mon, 16 Jan 2023 04:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHLZm-0006Uq-Oo
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pHLZk-0002Cq-Po
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:14:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673860483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xn04j6G9fzNjdn+rZ5NK/59tYh+sGuVfD0X14vf7A2I=;
 b=S5zqNJ0Kr0/aqsQC19S6S8LSaGplkWJIujzLOIXfWCOHKV0G0haJQERJ3dfBwE3ZVpjB60
 5lTM29fVsasFaVnwFgWAxJDnpUvGYqKX0hFzUSVTuUktXb3MXes/HoT1r10YRxZYh1eL2U
 BmGuO5X0UBBVBvOPqXT/8L8tHlWjM2I=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-cwRwyWj6MGmUcqgW_0w_XQ-1; Mon, 16 Jan 2023 04:14:42 -0500
X-MC-Unique: cwRwyWj6MGmUcqgW_0w_XQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 r8-20020a252b08000000b007b989d5e105so26820078ybr.11
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 01:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xn04j6G9fzNjdn+rZ5NK/59tYh+sGuVfD0X14vf7A2I=;
 b=X5LUIe4zTl17oqvCpzuJxPnMGH2uEAnNMTcNeMTUq6aa3n40dtbhEF2qoAjkwoeCvV
 OtS5zG763iAe4shE0ABkPpwU0NgDtVDg0BIuSR5wWloz3y05G9evNWu9f6NQTBbFTgvt
 lv/38tndYi4JuAmhxvOIA2ex1O74A0AamZ9nyycZBb0OuMKEfiLqEG/8uoatahDMb6yd
 8Trxp37U9Iv8YH/bCndlp53Jji5gOFdPcQ7f+zuAU99jq1e9f/q4CQIRIaeQ2HqDTRiV
 Pas4Pyt5zfr6GSyFK4/KDmc2MF0XyHHqibtscEHuOGgwn8r9z0roCSLYuwb7SabWzy3L
 8Gfg==
X-Gm-Message-State: AFqh2kp/Oz+2Qa6FzjLVQd8NyfHkSKHPuyjDhSs2otShLj3Et4jCjvQl
 JSZeah6F6XvTC3cjL4V9dqYnQzLh58XxDcgcceB/jN4erJweA1UuWFT5vT2GYBiLajOrSOPnJtR
 nN5d9+m5OJ2mzKBa8rblJ7PAVvyKWGRA=
X-Received: by 2002:a25:840a:0:b0:7e9:6368:71a3 with SMTP id
 u10-20020a25840a000000b007e9636871a3mr82616ybk.381.1673860481660; 
 Mon, 16 Jan 2023 01:14:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtPZw8bizZWtAjXs5gOf3aUY2dW9L5t78kAgPkycN1RpofYKDwTG7OjdXFRddGjAMxx/ZB0qVIVUBjDQUNoHRQ=
X-Received: by 2002:a25:840a:0:b0:7e9:6368:71a3 with SMTP id
 u10-20020a25840a000000b007e9636871a3mr82610ybk.381.1673860481316; Mon, 16 Jan
 2023 01:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-3-eperezma@redhat.com>
 <CACGkMEvoo1LkBj9m9afCu39J9ngBPVV7T2R7VaRabd8-WdN0oQ@mail.gmail.com>
 <CAJaqyWdioFYZPJT+xfHUxgsZzwVVGKfSbmieuKvhEodgK99c=Q@mail.gmail.com>
 <147cd500-abf3-8d2c-ae7a-02a9672ba61d@redhat.com>
In-Reply-To: <147cd500-abf3-8d2c-ae7a-02a9672ba61d@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 16 Jan 2023 10:14:05 +0100
Message-ID: <CAJaqyWfcV2stgY7mNrw2rEpBN+RC72L39it6Ag=3jW1Pxx_7eA@mail.gmail.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 16, 2023 at 4:05 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/1/13 15:28, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Fri, Jan 13, 2023 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.co=
m> wrote:
> >>> Only create iova_tree if and when it is needed.
> >>>
> >>> The cleanup keeps being responsability of last VQ but this change all=
ows
> >>> to merge both cleanup functions.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>   net/vhost-vdpa.c | 101 +++++++++++++++++++++++++++++++++-----------=
---
> >>>   1 file changed, 71 insertions(+), 30 deletions(-)
> >>>
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index de5ed8ff22..75cca497c8 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -178,13 +178,9 @@ err_init:
> >>>   static void vhost_vdpa_cleanup(NetClientState *nc)
> >>>   {
> >>>       VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> -    struct vhost_dev *dev =3D &s->vhost_net->dev;
> >>>
> >>>       qemu_vfree(s->cvq_cmd_out_buffer);
> >>>       qemu_vfree(s->status);
> >>> -    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> >>> -    }
> >>>       if (s->vhost_net) {
> >>>           vhost_net_cleanup(s->vhost_net);
> >>>           g_free(s->vhost_net);
> >>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientStat=
e *nc, const uint8_t *buf,
> >>>       return size;
> >>>   }
> >>>
> >>> +/** From any vdpa net client, get the netclient of first queue pair =
*/
> >>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *=
s)
> >>> +{
> >>> +    NICState *nic =3D qemu_get_nic(s->nc.peer);
> >>> +    NetClientState *nc0 =3D qemu_get_peer(nic->ncs, 0);
> >>> +
> >>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
> >>> +{
> >>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>> +
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>> +                                           v->iova_range.last);
> >>> +    }
> >>> +}
> >>> +
> >>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
> >>> +{
> >>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> +    struct vhost_vdpa *v =3D &s->vhost_vdpa;
> >>> +
> >>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>> +
> >>> +    if (v->index =3D=3D 0) {
> >>> +        vhost_vdpa_net_data_start_first(s);
> >>> +        return 0;
> >>> +    }
> >>> +
> >>> +    if (v->shadow_vqs_enabled) {
> >>> +        VhostVDPAState *s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> >>> +    }
> >> It looks to me the logic here is somehow the same as
> >> vhost_vdpa_net_cvq_start(), can we unify the them?
> >>
> > It depends on what you mean by unify :). But we can explore it for sure=
.
> >
> > We can call vhost_vdpa_net_data_start, but the steps to do if
> > s0->vhost_vdpa.iova_tree =3D=3D NULL are different. Data queues must do
> > nothing, but CVQ must create a new iova tree.
> >
> > So one possibility is to convert this part of vhost_vdpa_net_cvq_start:
> >      s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >      if (s0->vhost_vdpa.iova_tree) {
> >          /* SVQ is already configured for all virtqueues */
> >          v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> >      } else {
> >          v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >                                             v->iova_range.last);
> >      }
> >
> > into:
> >      vhost_vdpa_net_data_start(nc);
> >      if (!v->iova_tree) {
> >          v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >                                             v->iova_range.last);
> >      }
> >
> > I'm ok with the change but it's less clear in my opinion: it's not
> > obvious that net_data_start is in charge of setting v->iova_tree to
> > me.
>
>
> Ok.
>
>
> >
> > Another possibility is to abstract something like
> > first_nc_iova_tree(), but we need to check more fields of s0 later
> > (shadow_data) so I'm not sure about the benefit.
> >
> > Is that what you have in mind?
>
>
> Kind of, but I think we can leave the code as is.
>
> In the future, as discussed, we need to introduce something like a
> parent or opaque structure for NetClientState structure, it can simply a
> lot of things: we can have one same common parent for all queues, then
> there's no need for the trick like first_nc_iova_tree() and other
> similar tricks.
>

So we can ack this patch or you prefer to explore the change for the
next series?

Thanks!

> Thanks
>
> >
> > Thanks!
> >
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
> >>> +{
> >>> +    VhostVDPAState *s =3D DO_UPCAST(VhostVDPAState, nc, nc);
> >>> +    struct vhost_dev *dev;
> >>> +
> >>> +    assert(nc->info->type =3D=3D NET_CLIENT_DRIVER_VHOST_VDPA);
> >>> +
> >>> +    dev =3D s->vhost_vdpa.dev;
> >>> +    if (dev->vq_index + dev->nvqs =3D=3D dev->vq_index_end) {
> >>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_de=
lete);
> >>> +    }
> >>> +}
> >>> +
> >>>   static NetClientInfo net_vhost_vdpa_info =3D {
> >>>           .type =3D NET_CLIENT_DRIVER_VHOST_VDPA,
> >>>           .size =3D sizeof(VhostVDPAState),
> >>>           .receive =3D vhost_vdpa_receive,
> >>> +        .start =3D vhost_vdpa_net_data_start,
> >>> +        .stop =3D vhost_vdpa_net_client_stop,
> >>>           .cleanup =3D vhost_vdpa_cleanup,
> >>>           .has_vnet_hdr =3D vhost_vdpa_has_vnet_hdr,
> >>>           .has_ufo =3D vhost_vdpa_has_ufo,
> >>> @@ -351,7 +401,7 @@ dma_map_err:
> >>>
> >>>   static int vhost_vdpa_net_cvq_start(NetClientState *nc)
> >>>   {
> >>> -    VhostVDPAState *s;
> >>> +    VhostVDPAState *s, *s0;
> >>>       struct vhost_vdpa *v;
> >>>       uint64_t backend_features;
> >>>       int64_t cvq_group;
> >>> @@ -415,8 +465,6 @@ static int vhost_vdpa_net_cvq_start(NetClientStat=
e *nc)
> >>>           return r;
> >>>       }
> >>>
> >>> -    v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>> -                                       v->iova_range.last);
> >>>       v->shadow_vqs_enabled =3D true;
> >>>       s->vhost_vdpa.address_space_id =3D VHOST_VDPA_NET_CVQ_ASID;
> >>>
> >>> @@ -425,6 +473,15 @@ out:
> >>>           return 0;
> >>>       }
> >>>
> >>> +    s0 =3D vhost_vdpa_net_first_nc_vdpa(s);
> >>> +    if (s0->vhost_vdpa.iova_tree) {
> >>> +        /* SVQ is already configured for all virtqueues */
> >>> +        v->iova_tree =3D s0->vhost_vdpa.iova_tree;
> >>> +    } else {
> >>> +        v->iova_tree =3D vhost_iova_tree_new(v->iova_range.first,
> >>> +                                           v->iova_range.last);
> >>> +    }
> >>> +
> >>>       r =3D vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buf=
fer,
> >>>                                  vhost_vdpa_net_cvq_cmd_page_len(), f=
alse);
> >>>       if (unlikely(r < 0)) {
> >>> @@ -449,15 +506,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientSta=
te *nc)
> >>>       if (s->vhost_vdpa.shadow_vqs_enabled) {
> >>>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buf=
fer);
> >>>           vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
> >>> -        if (!s->always_svq) {
> >>> -            /*
> >>> -             * If only the CVQ is shadowed we can delete this safely=
.
> >>> -             * If all the VQs are shadows this will be needed by the=
 time the
> >>> -             * device is started again to register SVQ vrings and si=
milar.
> >>> -             */
> >>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tre=
e_delete);
> >>> -        }
> >>>       }
> >>> +
> >>> +    vhost_vdpa_net_client_stop(nc);
> >>>   }
> >>>
> >>>   static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out=
_len,
> >>> @@ -667,8 +718,7 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> >>>                                          int nvqs,
> >>>                                          bool is_datapath,
> >>>                                          bool svq,
> >>> -                                       struct vhost_vdpa_iova_range =
iova_range,
> >>> -                                       VhostIOVATree *iova_tree)
> >>> +                                       struct vhost_vdpa_iova_range =
iova_range)
> >>>   {
> >>>       NetClientState *nc =3D NULL;
> >>>       VhostVDPAState *s;
> >>> @@ -690,7 +740,6 @@ static NetClientState *net_vhost_vdpa_init(NetCli=
entState *peer,
> >>>       s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>       s->vhost_vdpa.iova_range =3D iova_range;
> >>>       s->vhost_vdpa.shadow_data =3D svq;
> >>> -    s->vhost_vdpa.iova_tree =3D iova_tree;
> >>>       if (!is_datapath) {
> >>>           s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_page=
_size(),
> >>>                                               vhost_vdpa_net_cvq_cmd_=
page_len());
> >>> @@ -760,7 +809,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >>>       uint64_t features;
> >>>       int vdpa_device_fd;
> >>>       g_autofree NetClientState **ncs =3D NULL;
> >>> -    g_autoptr(VhostIOVATree) iova_tree =3D NULL;
> >>>       struct vhost_vdpa_iova_range iova_range;
> >>>       NetClientState *nc;
> >>>       int queue_pairs, r, i =3D 0, has_cvq =3D 0;
> >>> @@ -812,12 +860,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, co=
nst char *name,
> >>>           goto err;
> >>>       }
> >>>
> >>> -    if (opts->x_svq) {
> >>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
> >>> -            goto err_svq;
> >>> -        }
> >>> -
> >>> -        iova_tree =3D vhost_iova_tree_new(iova_range.first, iova_ran=
ge.last);
> >>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, =
errp)) {
> >>> +        goto err;
> >>>       }
> >>>
> >>>       ncs =3D g_malloc0(sizeof(*ncs) * queue_pairs);
> >>> @@ -825,7 +869,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, con=
st char *name,
> >>>       for (i =3D 0; i < queue_pairs; i++) {
> >>>           ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >>>                                        vdpa_device_fd, i, 2, true, op=
ts->x_svq,
> >>> -                                     iova_range, iova_tree);
> >>> +                                     iova_range);
> >>>           if (!ncs[i])
> >>>               goto err;
> >>>       }
> >>> @@ -833,13 +877,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, c=
onst char *name,
> >>>       if (has_cvq) {
> >>>           nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >>>                                    vdpa_device_fd, i, 1, false,
> >>> -                                 opts->x_svq, iova_range, iova_tree)=
;
> >>> +                                 opts->x_svq, iova_range);
> >>>           if (!nc)
> >>>               goto err;
> >>>       }
> >>>
> >>> -    /* iova_tree ownership belongs to last NetClientState */
> >>> -    g_steal_pointer(&iova_tree);
> >>>       return 0;
> >>>
> >>>   err:
> >>> @@ -849,7 +891,6 @@ err:
> >>>           }
> >>>       }
> >>>
> >>> -err_svq:
> >>>       qemu_close(vdpa_device_fd);
> >>>
> >>>       return -1;
> >>> --
> >>> 2.31.1
> >>>
>


