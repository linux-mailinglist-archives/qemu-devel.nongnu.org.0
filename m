Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 698DF6ABE3E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:34:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ968-0003GC-BU; Mon, 06 Mar 2023 06:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZ965-0003Fv-OQ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:33:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pZ963-0008TO-OR
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678102417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RXJfZJsAVkEHfIDktOcHqPYXuV1TKXaqatPKXqtduQs=;
 b=ekPbjiS1qJnUIq08oF6BBjchHZXMReW0sRJuQLWCDLwYVBHHu6VMQMK3i1A2s6oMflmZL4
 AlPsspnF65Cr88VSt41wjJqTjTQ25IHSIvefht3Pea9a/ELS8veqtrlfdt6N9+rnd7Oyqm
 JTnwtEaN9Vsr+HtyiVWqh3GUb3IiGQk=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-Jxjn25krMOySPZa6XmgWvA-1; Mon, 06 Mar 2023 06:33:36 -0500
X-MC-Unique: Jxjn25krMOySPZa6XmgWvA-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-536a545bfbaso100011597b3.20
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 03:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678102416;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXJfZJsAVkEHfIDktOcHqPYXuV1TKXaqatPKXqtduQs=;
 b=Eoz/19OB5AV5wmLjz1lsjeS5Z1iMfRACOhomMQOCQASZcALpVenheahT6qrhUOkEXw
 hGoDOui59/qYaWmdcRf2HRNYxPxdyA1r2l+IX/QeOwXkT8/wWgHTt+4HpyH89nBAdu4+
 RpZW54zLKFB2RhcOeg581RGfy6ytlRzftdeGFlMJlMBIcD6EUTX//ccU9vtEjaJdEMVj
 dlWC234VfUqHId2cKXbPyBVlYk9tB47jY1wC5lTnXHI2tBCoOOpFWi7F09Ed28TUWtX4
 mqQzWbSuOL9NrCQputQa0D7xxEuFKoNiuR2tODizPZ4GomjervqbPm90CuyBu5sntp19
 UyYg==
X-Gm-Message-State: AO0yUKUW+qV5kdaClQf2HxUQnFkiClgK6vHYax87LG8x+iRXSLIO5DBj
 Dpi4Q6Z7Aetw811q9yW4/6vqbMpCL9Lg073CUXlalRtXfP1A5Qx7FL8ovnULgvwzmbNxgShu5lJ
 r3PqDXsLFKj7R2OAcn0UTN+ZCJH4D/Cg=
X-Received: by 2002:a5b:347:0:b0:a06:538f:24b2 with SMTP id
 q7-20020a5b0347000000b00a06538f24b2mr4790516ybp.2.1678102415937; 
 Mon, 06 Mar 2023 03:33:35 -0800 (PST)
X-Google-Smtp-Source: AK7set8s6QdeG+XTKFyCmErQY53nz9plG5Zize1v/Kp358ysOlcuDYKTprQf6fY4EYLtW+380CFtKm4FHZZmKlYvNMY=
X-Received: by 2002:a5b:347:0:b0:a06:538f:24b2 with SMTP id
 q7-20020a5b0347000000b00a06538f24b2mr4790498ybp.2.1678102415659; Mon, 06 Mar
 2023 03:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-13-eperezma@redhat.com>
 <2367dcff-e8c3-c3ca-378a-e9e67e10710a@redhat.com>
 <CACGkMEs13RdzLfU8nZwHT0YsZ_hXy47or4t9jkHCoJ1EVa3q9w@mail.gmail.com>
 <CAJaqyWcUMwchHZ66=o+aayVvsAT78iOnWo0g3jbg4A1TiAupfQ@mail.gmail.com>
 <69983de5-7cb7-02a1-8869-0977ff2928b2@redhat.com>
 <CAJaqyWfoTO26=aeWbWBBqM-kJpa+4ZtWNxwp2nFmZ9L14BoPqA@mail.gmail.com>
 <CACGkMEv-2-wj8xhimgX_iwOP1cuTsVKYgp2UTat6Xyg5QTURmw@mail.gmail.com>
In-Reply-To: <CACGkMEv-2-wj8xhimgX_iwOP1cuTsVKYgp2UTat6Xyg5QTURmw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 6 Mar 2023 12:32:59 +0100
Message-ID: <CAJaqyWdHZJ7ty57=V=CAg_8hB-DQ4K77QPJpJux39nEFPY0+DQ@mail.gmail.com>
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

On Mon, Mar 6, 2023 at 4:42=E2=80=AFAM Jason Wang <jasowang@redhat.com> wro=
te:
>
> On Fri, Mar 3, 2023 at 4:58=E2=80=AFPM Eugenio Perez Martin <eperezma@red=
hat.com> wrote:
> >
> > On Fri, Mar 3, 2023 at 4:48 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > >
> > > =E5=9C=A8 2023/3/2 03:32, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > > On Mon, Feb 27, 2023 at 9:20 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > >> On Mon, Feb 27, 2023 at 4:15=E2=80=AFPM Jason Wang <jasowang@redha=
t.com> wrote:
> > > >>>
> > > >>> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > > >>>> A vdpa net device must initialize with SVQ in order to be migrat=
able at
> > > >>>> this moment, and initialization code verifies some conditions.  =
If the
> > > >>>> device is not initialized with the x-svq parameter, it will not =
expose
> > > >>>> _F_LOG so the vhost subsystem will block VM migration from its
> > > >>>> initialization.
> > > >>>>
> > > >>>> Next patches change this, so we need to verify migration conditi=
ons
> > > >>>> differently.
> > > >>>>
> > > >>>> QEMU only supports a subset of net features in SVQ, and it canno=
t
> > > >>>> migrate state that cannot track or restore in the destination.  =
Add a
> > > >>>> migration blocker if the device offer an unsupported feature.
> > > >>>>
> > > >>>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >>>> ---
> > > >>>> v3: add mirgation blocker properly so vhost_dev can handle it.
> > > >>>> ---
> > > >>>>    net/vhost-vdpa.c | 12 ++++++++----
> > > >>>>    1 file changed, 8 insertions(+), 4 deletions(-)
> > > >>>>
> > > >>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > > >>>> index 4f983df000..094dc1c2d0 100644
> > > >>>> --- a/net/vhost-vdpa.c
> > > >>>> +++ b/net/vhost-vdpa.c
> > > >>>> @@ -795,7 +795,8 @@ static NetClientState *net_vhost_vdpa_init(N=
etClientState *peer,
> > > >>>>                                           int nvqs,
> > > >>>>                                           bool is_datapath,
> > > >>>>                                           bool svq,
> > > >>>> -                                       struct vhost_vdpa_iova_r=
ange iova_range)
> > > >>>> +                                       struct vhost_vdpa_iova_r=
ange iova_range,
> > > >>>> +                                       uint64_t features)
> > > >>>>    {
> > > >>>>        NetClientState *nc =3D NULL;
> > > >>>>        VhostVDPAState *s;
> > > >>>> @@ -818,7 +819,10 @@ static NetClientState *net_vhost_vdpa_init(=
NetClientState *peer,
> > > >>>>        s->vhost_vdpa.shadow_vqs_enabled =3D svq;
> > > >>>>        s->vhost_vdpa.iova_range =3D iova_range;
> > > >>>>        s->vhost_vdpa.shadow_data =3D svq;
> > > >>>> -    if (!is_datapath) {
> > > >>>> +    if (queue_pair_index =3D=3D 0) {
> > > >>>> +        vhost_vdpa_net_valid_svq_features(features,
> > > >>>> +                                          &s->vhost_vdpa.migrat=
ion_blocker);
> > > >>>
> > > >>> Since we do validation at initialization, is this necessary to va=
lid
> > > >>> once again in other places?
> > > >> Ok, after reading patch 13, I think the question is:
> > > >>
> > > >> The validation seems to be independent to net, can we valid it onc=
e
> > > >> during vhost_vdpa_init()?
> > > >>
> > > > vhost_vdpa_net_valid_svq_features also checks for net features. In
> > > > particular, all the non transport features must be in
> > > > vdpa_svq_device_features.
> > > >
> > > > This is how we protect that the device / guest will never negotiate
> > > > things like VLAN filtering support, as SVQ still does not know how =
to
> > > > restore at the destination.
> > > >
> > > > In the VLAN filtering case CVQ is needed to restore VLAN, so it is
> > > > covered by patch 11/15. But other future features may need support =
for
> > > > restoring it in the destination.
> > >
> > >
> > > I wonder how hard to have a general validation code let net specific
> > > code to advertise a blacklist to avoid code duplication.
> > >
> >
> > A blacklist does not work here, because I don't know if SVQ needs
> > changes for future feature bits that are still not in / proposed to
> > the standard.
>
> Could you give me an example for this?
>

Maybe I'm not understanding your blacklist proposal. I'm going to
explain my thoughts on it with a few examples.

SVQ was merged in qemu before VIRTIO_F_RING_RESET, and there are some
proposals like VIRTIO_NET_F_NOTF_COAL or VIRTIO_F_PARTIAL_ORDER in the
virtio-comment list.

If we had gone with the blacklist approach back then, the blacklist
would contain all the features of Virtio standard but the one we do
support in SVQ, isn't it? Then, VIRTIO_F_RING_RESET would get merged,
and SVQ would claim it supports it, but it is not true.

The same can happen with the other two features.
VIRTIO_NET_F_NOTF_COAL will be required to migrate coalescence
parameters, but it is not supported for the moment. _F_PARTIAL_ORDER
will also require changes to hw/virtio/vhost-shadow-virtqueue.c code,
since SVQ it's the "driver" in charge of the SVQ vring.

Most of the changes will only require small changes to support sending
the CVQ message in the destination and to track the state change
parsing CVQ, or no changes at all (like for supporting
VIRTIO_NET_F_SPEED_DUPLEX). But SVQ cannot claim it supports it
anyway.

The only alternative I can think of is to actually block new proposals
(like past VIRTIO_F_RING_RESET) until they either do the changes on
SVQ too or add a blacklist item. I think it is too intrusive.
Especially on this stage of SVQ where not even all QEMU features are
supported. Maybe we can reevaluate it in Q3 or Q4 for example?


> >
> > Regarding the code duplication, do you mean to validate transport
> > features and net specific features in one shot, instead of having a
> > dedicated function for SVQ transport?
>
> Nope.
>

Please expand, maybe I can do something to solve it :).

Thanks!


