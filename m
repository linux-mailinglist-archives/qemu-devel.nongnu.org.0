Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88235580A83
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:40:43 +0200 (CEST)
Received: from localhost ([::1]:33090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCN8-0000fq-Ft
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCGy-0004Uc-FF
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:34:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCGu-0007dN-UL
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658810056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hCt8fUk2kbWw+HCVfjC913KNcutNtoAeZ6RYoB8/lOY=;
 b=DhELwjetmNSq4W89r2tguqDNsIqltWr9c63GwDU+O4UQwaIsJYa1aRKMtUwjkeIbvSmWgT
 nZU+3JEPIb2gF+WJmKSiCHIZYYfCLkGgTH0+jh2bNH6FQhAK0FsCC0o08b5Fm32M6Tm6f3
 goPZu1WJCO3OmlQ1AIdA0FUbXv9vSiQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-sIc-GvA8MjyjsWyVvNBZug-1; Tue, 26 Jul 2022 00:34:06 -0400
X-MC-Unique: sIc-GvA8MjyjsWyVvNBZug-1
Received: by mail-lf1-f72.google.com with SMTP id
 a19-20020a19f813000000b0048a7379e38bso3330184lff.5
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hCt8fUk2kbWw+HCVfjC913KNcutNtoAeZ6RYoB8/lOY=;
 b=76ScmEkYr2YJkgt9lqPWA0uPVVJwVtgKtHRGGN6UFyE8sKTe2H8Ws2Qzb9b+/R2ua5
 VIRZb8yYo0SIvgbeCA+DtFhZcUSIqlPXQ7QEKbJIX8i3zuenaYPAd72ECe1QszD2TNXL
 SqhhNYTcHGo7NDsiCuK+PPDdbYxhauFG+0GMZw4ctA8BXMVvgPgFvGcEUGmfgOQr1okM
 5e5M8NMa9rWAB0Nkb6gVUszdF9lHKaU1lRD3Yf/ESPAXTvMa+yeMzUSHuRjUYuCjz7X/
 j4OTvJgZVlNFhRef8k5zksgUZoE6Fw8JbzdbwFBIGGG1LNFzbS1jT3YO4ZLS6f8cL3iE
 7guw==
X-Gm-Message-State: AJIora9vVoDjd9aey59204RTePFXx9hOKLucb5pBb/dVR1TZeli8sgCO
 4tekkoWgklrGbn2A2VR8TcTcm1hH/SN2rQE4VzrFehmwin1Fsk31gKXXOojL2GSM1b57Vb5bmVv
 saKPJ6GLz1G6haXWpXCYrTSA7jzfKDE8=
X-Received: by 2002:a05:6512:2284:b0:48a:7c35:2729 with SMTP id
 f4-20020a056512228400b0048a7c352729mr5903572lfu.397.1658810044670; 
 Mon, 25 Jul 2022 21:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twlmpJzSSTdrGN7/58ZzcLDqFdW+1ctStBQezOTJULkFaGTlm1TxmTKTz5K3CYfulHVbd6D/k4i6cN4ft1PZs=
X-Received: by 2002:a05:6512:2284:b0:48a:7c35:2729 with SMTP id
 f4-20020a056512228400b0048a7c352729mr5903564lfu.397.1658810044223; Mon, 25
 Jul 2022 21:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220718120545.2879871-1-eperezma@redhat.com>
 <CACGkMEtQN7EaPvwUzN8fU_LdOqKS90nk0n_CuAduVgsSf+oU2Q@mail.gmail.com>
In-Reply-To: <CACGkMEtQN7EaPvwUzN8fU_LdOqKS90nk0n_CuAduVgsSf+oU2Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Jul 2022 12:33:52 +0800
Message-ID: <CACGkMEtTUHjNxjM3b0WTKfGP9g=LXO3c3Wg3PWRYT3XiHCgFSg@mail.gmail.com>
Subject: Re: [PATCH v2] vhost: Get vring base from vq, not svq
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 25, 2022 at 3:07 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Jul 18, 2022 at 8:05 PM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > The SVQ vring used idx usually match with the guest visible one, as lon=
g
> > as all the guest buffers (GPA) maps to exactly one buffer within qemu's
> > VA. However, as we can see in virtqueue_map_desc, a single guest buffer
> > could map to many buffers in SVQ vring.
> >
> > Also, its also a mistake to rewind them at the source of migration.
> > Since VirtQueue is able to migrate the inflight descriptors, its
> > responsability of the destination to perform the rewind just in case it
> > cannot report the inflight descriptors to the device.
> >
> > This makes easier to migrate between backends or to recover them in
> > vhost devices that support set in flight descriptors.
> >
> > Fixes: 6d0b22266633 ("vdpa: Adapt vhost_vdpa_get_vring_base to SVQ")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>

I've queued this for hard-freeze.

Thanks

>
> >
> > --
> > v2: Squash both fixes in one.
> > ---
> >  hw/virtio/vhost-vdpa.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 795ed5a049..4458c8d23e 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhos=
t_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > +    VirtQueue *vq =3D virtio_get_queue(dev->vdev, ring->index);
> >
> > +    /*
> > +     * vhost-vdpa devices does not support in-flight requests. Set all=
 of them
> > +     * as available.
> > +     *
> > +     * TODO: This is ok for networking, but other kinds of devices mig=
ht
> > +     * have problems with these retransmissions.
> > +     */
> > +    while (virtqueue_rewind(vq, 1)) {
> > +        continue;
> > +    }
> >      if (v->shadow_vqs_enabled) {
> >          /*
> >           * Device vring base was set at device start. SVQ base is hand=
led by
> > @@ -1194,21 +1205,10 @@ static int vhost_vdpa_get_vring_base(struct vho=
st_dev *dev,
> >                                         struct vhost_vring_state *ring)
> >  {
> >      struct vhost_vdpa *v =3D dev->opaque;
> > -    int vdpa_idx =3D ring->index - dev->vq_index;
> >      int ret;
> >
> >      if (v->shadow_vqs_enabled) {
> > -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 vdpa_idx);
> > -
> > -        /*
> > -         * Setting base as last used idx, so destination will see as a=
vailable
> > -         * all the entries that the device did not use, including the =
in-flight
> > -         * processing ones.
> > -         *
> > -         * TODO: This is ok for networking, but other kinds of devices=
 might
> > -         * have problems with these retransmissions.
> > -         */
> > -        ring->num =3D svq->last_used_idx;
> > +        ring->num =3D virtio_queue_get_last_avail_idx(dev->vdev, ring-=
>index);
> >          return 0;
> >      }
> >
> > --
> > 2.31.1
> >


