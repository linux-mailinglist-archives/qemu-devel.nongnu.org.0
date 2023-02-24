Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21E6A1542
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 04:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVOa0-00014X-VL; Thu, 23 Feb 2023 22:17:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOZv-00014E-AN
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 22:16:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOZt-0004hl-BL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 22:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677208616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S9Uwq5X3ng+CNozrNFpwjxJg2YpeqwTpzc4faJ5/49o=;
 b=L6+yiAyn1ZxhhXGYswjRQcIOCSxxd8qHlwD7xSDheXa9KfsBMLW1qnEFhk9vTRoWlsp8lv
 CilP/zWgMcuWylz7ak5gkhPSME3wlO8ADdDCRl8byVWO5b6lmeqB0Gg1TvRSmrlV8PpWVc
 XxV/qpZ6nj198DrXCPXAGfCSc+BlQHk=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-eUDBeExkPTiwLoplIDUiZg-1; Thu, 23 Feb 2023 22:16:54 -0500
X-MC-Unique: eUDBeExkPTiwLoplIDUiZg-1
Received: by mail-ot1-f72.google.com with SMTP id
 w5-20020a056830110500b00693d47693e2so1519341otq.10
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 19:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S9Uwq5X3ng+CNozrNFpwjxJg2YpeqwTpzc4faJ5/49o=;
 b=UuX4SUQzMsLxUPK0ckBUxOhckw14n5PIZntB+dzgyqVe+mgDcB7k1yuNLthilJyave
 X5T5V3M1O1PzSXZQWXtlXRiXU/fvZjrFN/gMiYqKJ/1pJHy22jz02QlVsDPD1SFa/Yab
 N91a3f+0e/hcH3ou/u6wVvGCsVQIW7yRVycuFovokPob1hEI0ZFfCKnUk/X8PzTBXmGX
 Qyeko0WNiYMLuJhasoaoVUF1BuconMixN1VLfalbZXJUzqLJ7EZ4GuWuNa4W9njMsGPE
 JtMbiv1cI4pGpLVFXUcgLUMV3oSh4LCBu+tNtAihMCliLckymdAOcDLDahRpU1Ra+H4H
 3nrw==
X-Gm-Message-State: AO0yUKV6CCMsM5rHf97JYeZnPhsDoPSfimpcYr1C/WhlFAcnYwIbkSSp
 M74XcgKF+6RGJLP401s5GZPq9o5hMpVM3vqPGQ01ZDz8CB8j4o6k1FrNdZegz3HB6GCc9O7OkSB
 MaZrMkemm5X3CztzwTcIQb0F9o6FjJmo=
X-Received: by 2002:a05:6870:1aa8:b0:16e:3585:dbf2 with SMTP id
 ef40-20020a0568701aa800b0016e3585dbf2mr562905oab.9.1677208613629; 
 Thu, 23 Feb 2023 19:16:53 -0800 (PST)
X-Google-Smtp-Source: AK7set/rJdL9L8qM2lGjrttiHBU2qF/0MU0BysFZIWmyQ4BGE4Kp8M/J/Rf52OyEtK3h+KIfPHpe3kwb7QvpeXGr/30=
X-Received: by 2002:a05:6870:1aa8:b0:16e:3585:dbf2 with SMTP id
 ef40-20020a0568701aa800b0016e3585dbf2mr562885oab.9.1677208613403; Thu, 23 Feb
 2023 19:16:53 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-12-eperezma@redhat.com>
 <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
 <CAJaqyWdhK7QEHECP7qJP9tPA69e8uTuJtqLPNq_mUUhRDG_2Aw@mail.gmail.com>
 <81762a3b-b01f-2c3a-be63-531ac5b6976c@redhat.com>
 <CAJaqyWcScVMnkf+gXHZTAXrE2dbdzJXQM39BUv7Mm19kzRagqA@mail.gmail.com>
In-Reply-To: <CAJaqyWcScVMnkf+gXHZTAXrE2dbdzJXQM39BUv7Mm19kzRagqA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Feb 2023 11:16:42 +0800
Message-ID: <CACGkMEvk8AjscednP8FQqgk+GZn-kz4WJZycG9b6yv1=U-c+TQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] vdpa: block migration if dev does not have
 _F_SUSPEND
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
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

On Thu, Feb 23, 2023 at 7:07 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Thu, Feb 23, 2023 at 3:38 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2023/2/22 22:25, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Wed, Feb 22, 2023 at 5:05 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >>> Next patches enable devices to be migrated even if vdpa netdev has =
not
> > >>> been started with x-svq. However, not all devices are migratable, s=
o we
> > >>> need to block migration if we detect that.
> > >>>
> > >>> Block vhost-vdpa device migration if it does not offer _F_SUSPEND a=
nd it
> > >>> has not been started with x-svq.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
> > >>>    1 file changed, 21 insertions(+)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>> index 84a6b9690b..9d30cf9b3c 100644
> > >>> --- a/hw/virtio/vhost-vdpa.c
> > >>> +++ b/hw/virtio/vhost-vdpa.c
> > >>> @@ -442,6 +442,27 @@ static int vhost_vdpa_init(struct vhost_dev *d=
ev, void *opaque, Error **errp)
> > >>>            return 0;
> > >>>        }
> > >>>
> > >>> +    /*
> > >>> +     * If dev->shadow_vqs_enabled at initialization that means the=
 device has
> > >>> +     * been started with x-svq=3Don, so don't block migration
> > >>> +     */
> > >>> +    if (dev->migration_blocker =3D=3D NULL && !v->shadow_vqs_enabl=
ed) {
> > >>> +        uint64_t backend_features;
> > >>> +
> > >>> +        /* We don't have dev->backend_features yet */
> > >>> +        ret =3D vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
> > >>> +                              &backend_features);
> > >>> +        if (unlikely(ret)) {
> > >>> +            error_setg_errno(errp, -ret, "Could not get backend fe=
atures");
> > >>> +            return ret;
> > >>> +        }
> > >>> +
> > >>> +        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))=
) {
> > >>> +            error_setg(&dev->migration_blocker,
> > >>> +                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND =
feature.");
> > >>> +        }
> > >>
> > >> I wonder why not let the device to decide? For networking device, we=
 can
> > >> live without suspend probably.
> > >>
> > > Right, but how can we know if this is a net device in init? I don't
> > > think a switch (vhost_vdpa_get_device_id(dev)) is elegant.
> >
> >
> > I meant the caller of vhost_vdpa_init() which is net_init_vhost_vdpa().
> >
>
> That's doable but I'm not sure if it is convenient.

So it's a question whether or not we try to let migration work without
suspending. If we don't, there's no need to bother. Looking at the
current vhost-net implementation, it tries to make migration work upon
the error of get_vring_base() so maybe it's worth a try if it doesn't
bother too much. But I'm fine to go either way.

>
> Since we're always offering _F_LOG I thought of the lack of _F_SUSPEND
> as the default migration blocker for other kinds of devices like blk.

Or we can have this by default and allow a specific type of device to clear=
?

> If we move this code to net_init_vhost_vdpa, all other devices are in
> charge of block migration by themselves.
>
> I guess the right action is to use a variable similar to
> vhost_vdpa->f_log_all. It defaults to false, and the device can choose
> if it should export it or not. This way, the device does not migrate
> by default, and the equivalent of net_init_vhost_vdpa could choose
> whether to offer _F_LOG with SVQ or not.

Looks similar to what I think above.

>
> OTOH I guess other kinds of devices already must place blockers beyond
> _F_LOG, so maybe it makes sense to always offer _F_LOG even if
> _F_SUSPEND is not offered?

I don't see any dependency between the two features. Technically,
there could be devices that have neither _F_LOG nor _F_SUSPEND.

Thanks

> Stefano G., would that break vhost-vdpa-blk
> support?
>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > If the parent device does not need to be suspended i'd go with
> > > exposing a suspend ioctl but do nothing in the parent device. After
> > > that, it could even choose to return an error for GET_VRING_BASE.
> > >
> > > If we want to implement it as a fallback in qemu, I'd go for
> > > implementing it on top of this series. There are a few operations we
> > > could move to a device-kind specific ops.
> > >
> > > Would it make sense to you?
> > >
> > > Thanks!
> > >
> > >
> > >> Thanks
> > >>
> > >>
> > >>> +    }
> > >>> +
> > >>>        /*
> > >>>         * Similar to VFIO, we end up pinning all guest memory and h=
ave to
> > >>>         * disable discarding of RAM.
> >
>


