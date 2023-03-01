Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24286A7416
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRrn-00052K-FP; Wed, 01 Mar 2023 14:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXRrj-00051s-4W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pXRrg-0006zh-U5
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677697907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qwn/aXOr2awn9mXFMuHqGgL6YrMMn2q9BwbqwRU6kFA=;
 b=SdgwZmn/eF6wzRS8wv+3PC8im9Ab8CgxjeT6kZlSVuTKI/Y2iNjH7oEPVGn0Vt1Xx+KHHV
 w6j/DePHIZ+5m03OCDVJFdHPfkGeuIETKGb0wjL3kcLJaCPw4q4a971c/fXYFw5iW0UNlo
 /mB6yTBYcRP9g7q8j16irHpLe8voQUw=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-3sMnPn2MNpa_CkjlMUchmA-1; Wed, 01 Mar 2023 14:11:46 -0500
X-MC-Unique: 3sMnPn2MNpa_CkjlMUchmA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-536bf635080so293022067b3.23
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:11:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677697906;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qwn/aXOr2awn9mXFMuHqGgL6YrMMn2q9BwbqwRU6kFA=;
 b=cytdMDRSNVCf+ntqCnAyzYa63Xd80J+cRK+ntqdoFZv9yWGKWANN+F972B0OKMLZWr
 gASekHp8goT9nb4ru/O3Kq7r8oVi24kS+EWBhddInXJn0gO3cHS+ULoQiQJ89ipliNGX
 3Nr9RjMrJEJk9c2HaAVm1Wwee1QZDt9SlWP+SdyahMnGhxrz7sc8tkS3df9ZiZs5WYJh
 yNmXzCbA08K7TQwYwtNCWfpqEmH00galFytjBwGcgp+guYiHudIvjZYi+Sn9YAo77XFm
 5zlMDfU7W/uUZbFF9AtEgmeOaTe/UX/RQWpqCvViWEs8MLj3qKby92rU9nt7ySwwUDId
 WQAg==
X-Gm-Message-State: AO0yUKUL5sQGVr9YHU2p3S4mfdFjqGCZj++pyp64XNEhHoUnQWTaUlCi
 19tX/yzSGM4wIyUYu81JvqnjDwY31VYSiJGESkcOlBgLlThDEwASRode5EfgqNaQMUoFGQWWMNf
 vPERZvlNugaC9rDNX9su2kS+QzuGT7DM=
X-Received: by 2002:a05:690c:681:b0:533:a15a:d33e with SMTP id
 bp1-20020a05690c068100b00533a15ad33emr15489669ywb.5.1677697905896; 
 Wed, 01 Mar 2023 11:11:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+eWHhX1rtK1+0wv/LvGjHnSeGEYrS5P0HQdvhijhmL+S17PBrw4aRM9xNHY8CzOKKTEOJolZSP34JBrMFbSN8=
X-Received: by 2002:a05:690c:681:b0:533:a15a:d33e with SMTP id
 bp1-20020a05690c068100b00533a15ad33emr15489655ywb.5.1677697905660; Wed, 01
 Mar 2023 11:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-7-eperezma@redhat.com>
 <f3111a92-75a0-c12e-147e-a75084e7457b@redhat.com>
In-Reply-To: <f3111a92-75a0-c12e-147e-a75084e7457b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 1 Mar 2023 20:11:09 +0100
Message-ID: <CAJaqyWddwpW7tjkiC5Vw57aUkpxnapzWP0_VFn6Ou34MCvU-bg@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] vdpa: add vhost_vdpa->suspended parameter
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

On Mon, Feb 27, 2023 at 8:24 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/24 23:54, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > This allows vhost_vdpa to track if it is safe to get vring base from th=
e
> > device or not.  If it is not, vhost can fall back to fetch idx from the
> > guest buffer again.
> >
> > No functional change intended in this patch, later patches will use thi=
s
> > field.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> I think we probably need to re-order the patch, e.g to let this come
> before at least patch 5.
>

Right, that was a miss. I'll reorder them.

>
> > ---
> >   include/hw/virtio/vhost-vdpa.h | 2 ++
> >   hw/virtio/vhost-vdpa.c         | 8 ++++++++
> >   2 files changed, 10 insertions(+)
> >
> > diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-v=
dpa.h
> > index 7997f09a8d..4a7d396674 100644
> > --- a/include/hw/virtio/vhost-vdpa.h
> > +++ b/include/hw/virtio/vhost-vdpa.h
> > @@ -42,6 +42,8 @@ typedef struct vhost_vdpa {
> >       bool shadow_vqs_enabled;
> >       /* Vdpa must send shadow addresses as IOTLB key for data queues, =
not GPA */
> >       bool shadow_data;
> > +    /* Device suspended successfully */
> > +    bool suspended;
>
>
> Should we implement the set/clear in this patch as well?
>

I'd prefer to keep each patch separated in declaration / usage but
they can be squashed for sure.

Thanks!

> Thanks
>
>
> >       /* IOVA mapping used by the Shadow Virtqueue */
> >       VhostIOVATree *iova_tree;
> >       GPtrArray *shadow_vqs;
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 8cc9c98db9..228677895a 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -1227,6 +1227,14 @@ static int vhost_vdpa_get_vring_base(struct vhos=
t_dev *dev,
> >           return 0;
> >       }
> >
> > +    if (!v->suspended) {
> > +        /*
> > +         * Cannot trust in value returned by device, let vhost recover=
 used
> > +         * idx from guest.
> > +         */
> > +        return -1;
> > +    }
> > +
> >       ret =3D vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
> >       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
> >       return ret;
>


