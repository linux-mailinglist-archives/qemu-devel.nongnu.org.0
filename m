Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 014DE6A9434
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:33:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1Fj-0003bc-0L; Fri, 03 Mar 2023 03:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY1Fg-0003Wn-Vj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:58:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY1Ff-0006bK-AK
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677833933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgxN3imb2UFGCqj8l4AW6tphMkdyG+4NvKkmb9QOgh8=;
 b=dRLLQ+PuSuRhh5sYukeiPCKMQhSNJxdQoFT8GF9QSdSkjyoxXalCqLEO4WaNahYOjqcvCJ
 AqIEg/uo0AurmsTdcnO4imrqfe4hvhWxAT5Lex8AMv33XE5V5HSirUjRjcKmewuLHeMZVz
 +DwXCV6v//pP73ilSnZjKjV7khRvNlo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-zNktgGrDOkemGfSOOt1gFA-1; Fri, 03 Mar 2023 03:58:51 -0500
X-MC-Unique: zNktgGrDOkemGfSOOt1gFA-1
Received: by mail-yb1-f199.google.com with SMTP id
 c192-20020a25c0c9000000b0092aabd4fa90so1720683ybf.18
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677833931;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgxN3imb2UFGCqj8l4AW6tphMkdyG+4NvKkmb9QOgh8=;
 b=CXhhTTuaGdzvyMc8mZC4K4hrGYRSc+bDFGQ5HX4n41OBtq08VHcJqqw4uUxxUSh9ES
 xW3dOwazvZZyrGix5sBGzSCYLS9L1fgjfZ/h/gZtM4Tox6DYnEa4shcFGWnfV9l9mAcd
 NK9UHk1qJkarkXHQTXh5WpX5ET43TyV8cp7daZesGn1xlouE9WSYok1Y5ILhW4uyDh7I
 0eoUHz8VZ26P+Zlh9gy0u6PDucSx3eHg5Ko5nF5CYqQU+N1f3j/wQSsGgOvzRsRRBPyi
 e/UgA2qkZDlS7w4IGSsBIwYtvhOAeaOT8VGy5q1gL7n0pCHzsMKkHlfuuFATUs5iNKYu
 R1xw==
X-Gm-Message-State: AO0yUKWBKiSHU9uvDUBVWCN1R92xd5oLkZ8+4JdQ+o9H3tnjXwXB/4cM
 CWUMROLYvrbhriUKr4qYvI3kY2OPrVldlOhhMsxjSr+UEsQrL+Jc6qYIPPHmDqGLtvwo03+hBGr
 B2UeY4MbkDPoQxiyG/d84vqMw9nTbK7o=
X-Received: by 2002:a81:ad68:0:b0:536:4d58:54b8 with SMTP id
 l40-20020a81ad68000000b005364d5854b8mr445534ywk.6.1677833931224; 
 Fri, 03 Mar 2023 00:58:51 -0800 (PST)
X-Google-Smtp-Source: AK7set9Vn0y8jUvL3OcIduRFkSX5xMXIjfuyYrpGOWCaT/MWyZBomXn+AVIY8OL6OAg1K9xydTY7cx7C4fwkkuOvg3A=
X-Received: by 2002:a81:ad68:0:b0:536:4d58:54b8 with SMTP id
 l40-20020a81ad68000000b005364d5854b8mr445511ywk.6.1677833930988; Fri, 03 Mar
 2023 00:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
 <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
 <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
 <69983de5-7cb7-02a1-8869-0977ff2928b2@redhat.com>
In-Reply-To: <69983de5-7cb7-02a1-8869-0977ff2928b2@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 3 Mar 2023 09:58:14 +0100
Message-ID: <CAJaqyWfoTO26=aeWbWBBqM-kJpa+4ZtWNxwp2nFmZ9L14BoPqA@mail.gmail.com>
Subject: Re: [PATCH v4 12/15] vdpa: block migration if device has unsupported
 features
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>, 
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
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

On Fri, Mar 3, 2023 at 4:48 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/3/2 03:32, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Mon, Feb 27, 2023 at 9:20 AM Jason Wang <jasowang@redhat.com> wrote:
> >> On Mon, Feb 27, 2023 at 4:15=E2=80=AFPM Jason Wang <jasowang@redhat.co=
m> wrote:
> >>>
> >>> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>>> A vdpa net device must initialize with SVQ in order to be migratable=
 at
> >>>> this moment, and initialization code verifies some conditions.  If t=
he
> >>>> device is not initialized with the x-svq parameter, it will not expo=
se
> >>>> _F_LOG so the vhost subsystem will block VM migration from its
> >>>> initialization.
> >>>>
> >>>> Next patches change this, so we need to verify migration conditions
> >>>> differently.
> >>>>
> >>>> QEMU only supports a subset of net features in SVQ, and it cannot
> >>>> migrate state that cannot track or restore in the destination.  Add =
a
> >>>> migration blocker if the device offer an unsupported feature.
> >>>>
> >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>>> ---
> >>>> v3: add mirgation blocker properly so vhost_dev can handle it.
> >>>> ---
> >>>>    net/vhost-vdpa.c | 12 ++++++++----
> >>>>    1 file changed, 8 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>>> index 4f983df000..094dc1c2d0 100644
> >>>> --- a/net/vhost-vdpa.c
> >>>> +++ b/net/vhost-vdpa.c
> >>>> @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(NetCl=
ientState *peer,
> >>>>                                           int nvqs,
> >>>>                                           bool is_datapath,
> >>>>                                           bool svq,
> >>>> -                                       struct vhost_vdpa_iova_range=
 iova_range)
> >>>> +                                       struct vhost_vdpa_iova_range=
 iova_range,
> >>>> +                                       uint64_t features)
> >>>>    {
> >>>>        NetClientState *nc =3D NULL;
> >>>>        VhostVDPAState *s;
> >>>> @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(NetC=
lientState *peer,
> >>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> >>>>        s->vhost_vdpa.iova_range =3D iova_range;
> >>>>        s->vhost_vdpa.shadow_data =3D svq;
> >>>> -    if (!is_datapath) {
> >>>> +    if (queue_pair_index =3D=3D 0) {
> >>>> +        vhost_vdpa_net_valid_svq_features(features,
> >>>> +                                          &s->vhost_vdpa.migration_=
blocker);
> >>>
> >>> Since we do validation at initialization, is this necessary to valid
> >>> once again in other places?
> >> Ok, after reading patch 13, I think the question is:
> >>
> >> The validation seems to be independent to net, can we valid it once
> >> during vhost_vdpa_init()?
> >>
> > vhost_vdpa_net_valid_svq_features also checks for net features. In
> > particular, all the non transport features must be in
> > vdpa_svq_device_features.
> >
> > This is how we protect that the device / guest will never negotiate
> > things like VLAN filtering support, as SVQ still does not know how to
> > restore at the destination.
> >
> > In the VLAN filtering case CVQ is needed to restore VLAN, so it is
> > covered by patch 11/15. But other future features may need support for
> > restoring it in the destination.
>
>
> I wonder how hard to have a general validation code let net specific
> code to advertise a blacklist to avoid code duplication.
>

A blacklist does not work here, because I don't know if SVQ needs
changes for future feature bits that are still not in / proposed to
the standard.

Regarding the code duplication, do you mean to validate transport
features and net specific features in one shot, instead of having a
dedicated function for SVQ transport?

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>> Thanks
> >>>
> >>>
> >>>> +    } else if (!is_datapath) {
> >>>>            s->cvq_cmd_out_buffer =3D qemu_memalign(qemu_real_host_pa=
ge_size(),
> >>>>                                                vhost_vdpa_net_cvq_cm=
d_page_len());
> >>>>            memset(s->cvq_cmd_out_buffer, 0, vhost_vdpa_net_cvq_cmd_p=
age_len());
> >>>> @@ -956,7 +960,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, co=
nst char *name,
> >>>>        for (i =3D 0; i < queue_pairs; i++) {
> >>>>            ncs[i] =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, nam=
e,
> >>>>                                         vdpa_device_fd, i, 2, true, =
opts->x_svq,
> >>>> -                                     iova_range);
> >>>> +                                     iova_range, features);
> >>>>            if (!ncs[i])
> >>>>                goto err;
> >>>>        }
> >>>> @@ -964,7 +968,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, co=
nst char *name,
> >>>>        if (has_cvq) {
> >>>>            nc =3D net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
> >>>>                                     vdpa_device_fd, i, 1, false,
> >>>> -                                 opts->x_svq, iova_range);
> >>>> +                                 opts->x_svq, iova_range, features)=
;
> >>>>            if (!nc)
> >>>>                goto err;
> >>>>        }
>


