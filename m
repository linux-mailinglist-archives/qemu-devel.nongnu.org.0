Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F36A070F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 12:08:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9Rb-0004Xi-CC; Thu, 23 Feb 2023 06:07:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pV9RU-0004We-EZ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:07:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pV9RS-0000V7-8E
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 06:07:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677150431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KC04nhWtIT8crFWPhMBFueFtNhBYWB3k62G6VGImlkU=;
 b=ijdsMBzqzgA7zkxjX8tDWxarUOQtRI6Sm0vAjD9ooe9BOX6M9FY0uPaRH2DxIZpCE7biHn
 mHsFo5v0Z8rw4G6H/9rWhkg5IM9tdRsp0rfVOr/mn+gL6cTPgybSOPIMwAE9brEarhXemN
 JrdKzBEq0tdHp1XhH7Eiwv9TFVGSEB0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-TFME9aaZPmu2cSrg1tNFrA-1; Thu, 23 Feb 2023 06:07:10 -0500
X-MC-Unique: TFME9aaZPmu2cSrg1tNFrA-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-536af109f9aso125747907b3.13
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 03:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KC04nhWtIT8crFWPhMBFueFtNhBYWB3k62G6VGImlkU=;
 b=L6efP+5/dwackFWGsE6RqgCsFqy0zVK9uJz+7tv/JAy2yBDyjqqUzq4GuniPIcZ4/y
 ZRToGxJbaJsb1LeBVfsmP29hanBOgxAY7o2fB8jl3TAmDxEwsJHH79nvY/tOiFQMNUox
 m5l6hz4Re7K6VvyMA+S3Aam8FcO8yECmSmYx6echmGms3z15KqYDJbcbFh/EsrLwdau0
 zvlngeHYyQiSdBSaMVg2SLRlllILjw5YMlDYTcQibOqD2aqKq9cBuEOrvylzeSB4jDt6
 3JdIOHEfZoyS9kZyANktlIVIK3StSCXlHp5LRWesjZXBHaOQ8VvBVIRidD6ChXEjDhlr
 QfxA==
X-Gm-Message-State: AO0yUKUeR3moaWTqvvOIgn52uWh+q0vJFZUOKhCQmPX+xMgPj5p/hN6x
 u/SieO9mwOH4Ls04kmvmMtahl+G1QxYBavv2lwQCTmC5jU3kF2XPlKA1IAk/3GG2ACDZA2HDio9
 G927gBUKWT/hwFtDjncnkejSB8YFgY1s=
X-Received: by 2002:a05:6902:188a:b0:8ed:3426:8a69 with SMTP id
 cj10-20020a056902188a00b008ed34268a69mr2618701ybb.1.1677150430143; 
 Thu, 23 Feb 2023 03:07:10 -0800 (PST)
X-Google-Smtp-Source: AK7set/ZCB/p3uGsBbspffbxf3i5ON7BvRwNDh9DVcuwfUvAv3mNEW82DOdZecTVbxncV22hRtG4dDmSUnzOdSJN8Qk=
X-Received: by 2002:a05:6902:188a:b0:8ed:3426:8a69 with SMTP id
 cj10-20020a056902188a00b008ed34268a69mr2618687ybb.1.1677150429892; Thu, 23
 Feb 2023 03:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-12-eperezma@redhat.com>
 <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
 <CAJaqyWdhK7QEHECP7qJP9tPA69e8uTuJtqLPNq_mUUhRDG_2Aw@mail.gmail.com>
 <81762a3b-b01f-2c3a-be63-531ac5b6976c@redhat.com>
In-Reply-To: <81762a3b-b01f-2c3a-be63-531ac5b6976c@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 23 Feb 2023 12:06:33 +0100
Message-ID: <CAJaqyWcScVMnkf+gXHZTAXrE2dbdzJXQM39BUv7Mm19kzRagqA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] vdpa: block migration if dev does not have
 _F_SUSPEND
To: Jason Wang <jasowang@redhat.com>
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

On Thu, Feb 23, 2023 at 3:38 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/22 22:25, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Wed, Feb 22, 2023 at 5:05 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>> Next patches enable devices to be migrated even if vdpa netdev has no=
t
> >>> been started with x-svq. However, not all devices are migratable, so =
we
> >>> need to block migration if we detect that.
> >>>
> >>> Block vhost-vdpa device migration if it does not offer _F_SUSPEND and=
 it
> >>> has not been started with x-svq.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
> >>>    1 file changed, 21 insertions(+)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 84a6b9690b..9d30cf9b3c 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -442,6 +442,27 @@ static int vhost_vdpa_init(struct vhost_dev *dev=
, void *opaque, Error **errp)
> >>>            return 0;
> >>>        }
> >>>
> >>> +    /*
> >>> +     * If dev->shadow_vqs_enabled at initialization that means the d=
evice has
> >>> +     * been started with x-svq=3Don, so don't block migration
> >>> +     */
> >>> +    if (dev->migration_blocker =3D=3D NULL && !v->shadow_vqs_enabled=
) {
> >>> +        uint64_t backend_features;
> >>> +
> >>> +        /* We don't have dev->backend_features yet */
> >>> +        ret =3D vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
> >>> +                              &backend_features);
> >>> +        if (unlikely(ret)) {
> >>> +            error_setg_errno(errp, -ret, "Could not get backend feat=
ures");
> >>> +            return ret;
> >>> +        }
> >>> +
> >>> +        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) =
{
> >>> +            error_setg(&dev->migration_blocker,
> >>> +                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND fe=
ature.");
> >>> +        }
> >>
> >> I wonder why not let the device to decide? For networking device, we c=
an
> >> live without suspend probably.
> >>
> > Right, but how can we know if this is a net device in init? I don't
> > think a switch (vhost_vdpa_get_device_id(dev)) is elegant.
>
>
> I meant the caller of vhost_vdpa_init() which is net_init_vhost_vdpa().
>

That's doable but I'm not sure if it is convenient.

Since we're always offering _F_LOG I thought of the lack of _F_SUSPEND
as the default migration blocker for other kinds of devices like blk.
If we move this code to net_init_vhost_vdpa, all other devices are in
charge of block migration by themselves.

I guess the right action is to use a variable similar to
vhost_vdpa->f_log_all. It defaults to false, and the device can choose
if it should export it or not. This way, the device does not migrate
by default, and the equivalent of net_init_vhost_vdpa could choose
whether to offer _F_LOG with SVQ or not.

OTOH I guess other kinds of devices already must place blockers beyond
_F_LOG, so maybe it makes sense to always offer _F_LOG even if
_F_SUSPEND is not offered? Stefano G., would that break vhost-vdpa-blk
support?

Thanks!

> Thanks
>
>
> >
> > If the parent device does not need to be suspended i'd go with
> > exposing a suspend ioctl but do nothing in the parent device. After
> > that, it could even choose to return an error for GET_VRING_BASE.
> >
> > If we want to implement it as a fallback in qemu, I'd go for
> > implementing it on top of this series. There are a few operations we
> > could move to a device-kind specific ops.
> >
> > Would it make sense to you?
> >
> > Thanks!
> >
> >
> >> Thanks
> >>
> >>
> >>> +    }
> >>> +
> >>>        /*
> >>>         * Similar to VFIO, we end up pinning all guest memory and hav=
e to
> >>>         * disable discarding of RAM.
>


