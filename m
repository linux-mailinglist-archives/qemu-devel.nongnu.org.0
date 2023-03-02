Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F286A84FF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 16:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXkdI-0003Dw-T3; Thu, 02 Mar 2023 10:14:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkdG-0003DO-8h
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXkdE-0005a4-9C
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 10:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677770047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8tdsVIIaLfBE6FG120QJC1j+fMrSIe1kGAtOJdB7RcQ=;
 b=SaJSGpSkHwLGbaf4jkwlbRAdTM9WFnZmvvFMaAhSw2pQINOBTVtxngQsdLIylWPPhHYbIX
 8mdAvM5qjqxzSFiX17bZEnXs46N3O7RCBt4TgEA5M8S6pLG9Mw9D8Q24wHXmFDH1/Pc2vR
 Kr20jcebgMqC0Lxf5VHKd0MbT6onrKE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-10SFjxS0O3GhkLN4lxUpoQ-1; Thu, 02 Mar 2023 10:14:06 -0500
X-MC-Unique: 10SFjxS0O3GhkLN4lxUpoQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 d7-20020a25adc7000000b00953ffdfbe1aso4406296ybe.23
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 07:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677770045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8tdsVIIaLfBE6FG120QJC1j+fMrSIe1kGAtOJdB7RcQ=;
 b=Kp5bEX1bFiXUZV5Chf7k3NEMeUN8YtJ4LKZzF0dyCmCE5STNVsPGlATdwfWsQMEXs2
 tUxtUFycJiFiQVVonaKrLSXRUnD3WkBH5qXGy7a5sPAPgNIkWyCGAVsL0G/BIXaEOKNs
 KU0lD4QCHZO6R0fAA18/RhYdSV5048HaKAlnBVZFrGuS7k6SK5GkKsvmHuzwygTFdRJn
 j68Ij9rhyLBHlIhuBb0fwJ8U7beKatAsHC1QASkmGomxFK69iCTBzS2DEG1vBfL50QWc
 OzhcWcXmsNak1CvNhlA64S6qQ7/FS4Ztt+1Hcyl2zsNd59qhDpLXqqT78W5L0R+EI7UC
 UH7A==
X-Gm-Message-State: AO0yUKVkqArJQz14Iimbrq1BdmLZqexXRewo27DJG1GehQKRI5RldhvZ
 BoQ7IbxKPgLlv16yrP+2Ld7eSSvD7xqCYdppZuQxka/7tuYwOAIWGYyDsBrqopCzOgwtgikyctf
 LMHtzhpz6T7aEoCrwUGfPxNVeCdNSFi8=
X-Received: by 2002:a81:ac4e:0:b0:535:5e8c:65ef with SMTP id
 z14-20020a81ac4e000000b005355e8c65efmr6405231ywj.6.1677770045424; 
 Thu, 02 Mar 2023 07:14:05 -0800 (PST)
X-Google-Smtp-Source: AK7set/X7F8rXvM5K0LEGmF6WDac4uE9AMq03SLlqt1cqFKIjLWOmR9BUa48yPQarvoDc5HzOf3K0fYS5dJxXoJ+2iI=
X-Received: by 2002:a81:ac4e:0:b0:535:5e8c:65ef with SMTP id
 z14-20020a81ac4e000000b005355e8c65efmr6405205ywj.6.1677770045158; Thu, 02 Mar
 2023 07:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-12-eperezma@redhat.com>
 <687e3228-2070-2842-0e30-c636c2fbda05@redhat.com>
In-Reply-To: <687e3228-2070-2842-0e30-c636c2fbda05@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 2 Mar 2023 16:13:29 +0100
Message-ID: <CAJaqyWf105waB9TaBqVsgWGr_=3DWUdRESufadyRHe=jzT0SOg@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] vdpa net: block migration if the device has CVQ
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

On Mon, Feb 27, 2023 at 9:13 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Devices with CVQ needs to migrate state beyond vq state.  Leaving this
> > to future series.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> > v3: Migration blocker is registered in vhost_dev.
> > ---
> >   include/hw/virtio/vhost-vdpa.h | 1 +
> >   hw/virtio/vhost-vdpa.c         | 1 +
> >   net/vhost-vdpa.c               | 9 +++++++++
> >   3 files changed, 11 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 4a7d396674..c278a2a8de 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -50,6 +50,7 @@ typedef struct vhost_vdpa {
> >       const VhostShadowVirtqueueOps *shadow_vq_ops;
> >       void *shadow_vq_ops_opaque;
> >       struct vhost_dev *dev;
> > +    Error *migration_blocker;
> >       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
> >   } VhostVDPA;
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 27655e7582..25b64ae854 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -438,6 +438,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, v=
oid *opaque, Error **errp)
> >       v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >       vhost_vdpa_init_svq(dev, v);
> >
> > +    error_propagate(&dev->migration_blocker, v->migration_blocker);
> >       if (!vhost_vdpa_first_dev(dev)) {
> >           return 0;
> >       }
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index c5512ddf10..4f983df000 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -828,6 +828,15 @@ static NetClientState *net_vhost_vdpa_init(NetClie=
ntState *peer,
> >
> >           s->vhost_vdpa.shadow_vq_ops =3D &vhost_vdpa_net_svq_ops;
> >           s->vhost_vdpa.shadow_vq_ops_opaque =3D s;
> > +
> > +        /*
> > +         * TODO: We cannot migrate devices with CVQ as there is no way=
 to set
> > +         * the device state (MAC, MQ, etc) before starting datapath.
> > +         *
> > +         * Migration blocker ownership now belongs to v
>
>
> The sentence is incomplete.
>

Right, I'll fix it for the next version.

Thanks!

> Other looks good.
>
> Thanks
>
>
> > +         */
> > +        error_setg(&s->vhost_vdpa.migration_blocker,
> > +                   "net vdpa cannot migrate with CVQ feature");
> >       }
> >       ret =3D vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_ind=
ex, nvqs);
> >       if (ret) {
>


