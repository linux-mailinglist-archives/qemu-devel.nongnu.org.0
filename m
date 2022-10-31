Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED061315B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 08:45:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opPTJ-0006lW-Gz; Mon, 31 Oct 2022 03:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opPTG-0006jW-Nb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opPTF-0008Ry-0Y
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 03:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667202270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jij6IAyCeyZQK7sgph781iG0Kwj01rCgTpXg6kfxKiI=;
 b=O4eaku7go4GUG+KFdOtff3/uG08Xx3kkQicSeHXIDHAiBCs/EpcN0WmrERbOJVKG8c6HTs
 UlMjX4dohi1SNpKZLtQDroxjWfwyce8D39ew3TB3xaOaewySDblvhDt8tzchMLGNsqZm6N
 njr1mwzxtKmx/T+X35+zj7qWVioowcM=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-Dq1jc0nYNzyUCQTFQyA21Q-1; Mon, 31 Oct 2022 03:44:22 -0400
X-MC-Unique: Dq1jc0nYNzyUCQTFQyA21Q-1
Received: by mail-pl1-f199.google.com with SMTP id
 o7-20020a170902d4c700b001868cdac9adso7729699plg.13
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 00:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jij6IAyCeyZQK7sgph781iG0Kwj01rCgTpXg6kfxKiI=;
 b=NL+6q4K4vx2bK2RPumHX9X39fB+g7QxVzYUXNYHL5mqVFg+uSsebQlqq5+VRxw0roK
 g9Y3Ybbhl5iAKyZ/4UMeFvYEX5lenSLJVceySdUQ0aurF9fi4Xwvyx9NF/kOzTSoEtL9
 cYFqFWhDZWDHS+omyq6iH7NnXZkempyxRf58mbJDhpvROqhtltt9nkF6gqzTAKDOhgsS
 hu9FURG54xkGlinQuuOdZLzdjasDvPp44bavZ+/ZabR8u0c76NUSWd6fz2LSrc8FWA9D
 ozscY54rIGwD7sQB33linLV4OcuQTDcYiD9ayaJn1/jsq8W5IZCcCKuxTfO17ybyMt8T
 j9Bg==
X-Gm-Message-State: ACrzQf21v/Lfmmmd/on84Yvq4k1jt/jgu+mjMa3tl+/ASka7yWmiXhVI
 Iq/1NhWUyoaOfBhJZqqbzT3fFaBI7JZzKzvHAknbJ94JlW+ujWZ404eAimX/dJQ9xXDxoaeoYbQ
 QfOp4DennlncoEd1JDipezUUs/ffm248=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr12755084plb.17.1667202261070; 
 Mon, 31 Oct 2022 00:44:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NN4sJZFkd69qIjE69gPele8fevUzv1UJAiJ7Y+aS7wF2O6wSs0vACi+ouR0TSq8nPaUyxzWC4hlS2NFWiQsg=
X-Received: by 2002:a17:903:1303:b0:186:969d:97cf with SMTP id
 iy3-20020a170903130300b00186969d97cfmr12755072plb.17.1667202260791; Mon, 31
 Oct 2022 00:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-4-eperezma@redhat.com>
 <20221028124105-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221028124105-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 08:43:44 +0100
Message-ID: <CAJaqyWcSeemtm07qX7CQti8Ew=LMTDNtFg5keM9qudy5+P=hQA@mail.gmail.com>
Subject: Re: [PATCH 3/4] vhost: Fix lines over 80 characters
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Oct 28, 2022 at 06:02:50PM +0200, Eugenio P=C3=A9rez wrote:
> > By qemu coding style.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> You wrote this code originally so I don't mind but just to note I don't
> want a flurry of patches "fixing" lines over 80 chars.
>

My bad, I didn't realize it the first time I sent it. I probably
missed to run checkpatch.

This patch can be merged with the next one if it is more convenient.

> > ---
> >  hw/virtio/vhost-shadow-virtqueue.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 467099f5d9..18a49e1ecb 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -228,8 +228,11 @@ static void vhost_svq_kick(VhostShadowVirtqueue *s=
vq)
> >      smp_mb();
> >
> >      if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> > -        uint16_t avail_event =3D *(uint16_t *)(&svq->vring.used->ring[=
svq->vring.num]);
> > -        needs_kick =3D vring_need_event(avail_event, svq->shadow_avail=
_idx, svq->shadow_avail_idx - 1);
> > +        size_t num =3D svq->vring.num;
> > +        uint16_t *avail_event =3D (uint16_t *)&svq->vring.used->ring[n=
um];
> > +
> > +        needs_kick =3D vring_need_event(*avail_event, svq->shadow_avai=
l_idx,
> > +                                      svq->shadow_avail_idx - 1);
> >      } else {
> >          needs_kick =3D !(svq->vring.used->flags & VRING_USED_F_NO_NOTI=
FY);
> >      }
> > --
> > 2.31.1
>


