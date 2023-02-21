Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F069DAEB
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 08:07:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUMj9-0007Xl-B8; Tue, 21 Feb 2023 02:06:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUMj5-0007Wh-12
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUMj1-00024x-Vr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 02:06:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676963163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T4w2LvsvHxMbKzT0wfuzCCQAFPcaIyTK4mDSqMlqQoY=;
 b=c2dswYi9pNyYf9vF7wZHU8i/l+rJjWYPKHNCmH5EKzw6n5AuykkYcPJDZ6x0AIYrq5r3Gl
 lBNQzMD6IhtZI2mCQEaglhkOcmT8UPpHYD+8ONR3bt5oofof99Zo7myaXPFHiv+EHXxjfZ
 QmTfRxx5wHvA9xmRt8OTyg5FdW/3EhA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-a6MDaH_QO9-qb4IDRkxRug-1; Tue, 21 Feb 2023 02:06:01 -0500
X-MC-Unique: a6MDaH_QO9-qb4IDRkxRug-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-536a4eba107so44144127b3.19
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 23:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T4w2LvsvHxMbKzT0wfuzCCQAFPcaIyTK4mDSqMlqQoY=;
 b=Z7ibenddBe7zjUJKnfTYyV9xLwtPtrzetvgLsKpBQZ1FAxcZKziQtZjr79HGR4zRcl
 8Yih3YGmdnZw5b4gsnrxNIZD3gc5u08bV6NgCJBq4sFVZNTtJ9a4qAzGoOCFtHWRwOHI
 drX/UdWAtcD6rQ6MgmklVAFjt00rifW5lDqDfNsvKkkHngq5L7r+Ux3kzZjPubihSfgz
 K8MS4rYIJl2ylFFmmoU/AXRxQb81prX/M5NdQToE0WZpBCgRNK5xGvkO1Silp2PwPc0Q
 PDqWcwUlM0+99MXJRY6KsOjWhgMPak1mzlhaBrXk8k5Cz4c/CbYYUjLXPj8Y1Mlfo/Q9
 5aRQ==
X-Gm-Message-State: AO0yUKXmdb05UKETCKMabIMIR/ux4zy/o7faTs5QzLWXIkYiyQRR5xzs
 0wcg5UVL5TYyOtyfEPCKYe7xw8PNbD63ZzJ+SJML6lCPcezkjG5eMB+Arw9kYFVbzUbnjFJ7bOH
 3dEKP5kiuMaI84sPrlXjD5cil8jALHvc=
X-Received: by 2002:a0d:db11:0:b0:510:b7af:7e7c with SMTP id
 d17-20020a0ddb11000000b00510b7af7e7cmr2271042ywe.70.1676963160517; 
 Mon, 20 Feb 2023 23:06:00 -0800 (PST)
X-Google-Smtp-Source: AK7set+4eXBnf6NuTjLoy8awy9jmttufIuLodqq94KcHdIgg5cPCN0UxSG7ky2t//BeIZJ/Z+/UQ1lEufEu/DryTtFc=
X-Received: by 2002:a0d:db11:0:b0:510:b7af:7e7c with SMTP id
 d17-20020a0ddb11000000b00510b7af7e7cmr2271038ywe.70.1676963160315; Mon, 20
 Feb 2023 23:06:00 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-4-eperezma@redhat.com>
 <5a4749e4-4cd4-4f07-a4db-665772003058@redhat.com>
 <3c994402-9c09-bbf2-31a1-c8e785674b6b@redhat.com>
In-Reply-To: <3c994402-9c09-bbf2-31a1-c8e785674b6b@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 21 Feb 2023 08:05:24 +0100
Message-ID: <CAJaqyWd5DwHBoosY8LgPRaQ65QkjJk+gS7TFxL58OThr-729Pg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] vdpa: add vhost_vdpa_suspend
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

On Tue, Feb 21, 2023 at 6:33 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/21 13:27, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >> The function vhost.c:vhost_dev_stop fetches the vring base so the vq
> >> state can be migrated to other devices.  However, this is unreliable i=
n
> >> vdpa, since we didn't signal the device to suspend the queues, making
> >> the value fetched useless.
> >>
> >> Suspend the device if possible before fetching first and subsequent
> >> vring bases.
> >>
> >> Moreover, vdpa totally reset and wipes the device at the last device
> >> before fetch its vrings base, making that operation useless in the las=
t
> >> device. This will be fixed in later patches of this series.
> >
> >
> > It would be better not introduce a bug first and fix it in the
> > following patch.
> >
> >
> >>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> ---
> >>   hw/virtio/vhost-vdpa.c | 19 +++++++++++++++++++
> >>   hw/virtio/trace-events |  1 +
> >>   2 files changed, 20 insertions(+)
> >>
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index 2e79fbe4b2..cbbe92ffe8 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -1108,6 +1108,24 @@ static void vhost_vdpa_svqs_stop(struct
> >> vhost_dev *dev)
> >>       }
> >>   }
> >>   +static void vhost_vdpa_suspend(struct vhost_dev *dev)
> >> +{
> >> +    struct vhost_vdpa *v =3D dev->opaque;
> >> +    int r;
> >> +
> >> +    if (!vhost_vdpa_first_dev(dev) ||
> >
> >
> > Any reason we need to use vhost_vdpa_first_dev() instead of replacing t=
he
> >
> > if (started) {
> > } else {
> >     vhost_vdpa_reset_device(dev);
> >     ....
> > }

I can also move the check to vhost_vdpa_dev_start, for sure.

>
> Ok, I think I kind of understand, so I think we need re-order the
> patches, at least patch 4 should come before this patch?
>

I think it is doable, yes. I'll check and come back to you.

Thanks!

> Thanks
>
>
> >
> >
> > We check
> >
> > if (dev->vq_index + dev->nvqs !=3D dev->vq_index_end) in
> > vhost_vdpa_dev_start() but vhost_vdpa_first_dev() inside
> > vhost_vdpa_suspend(). This will result code that is hard to maintain.
> >
> > Thanks
> >
> >
> >> +        !(dev->backend_cap & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> >> +        return;
> >> +    }
> >> +
> >> +    trace_vhost_vdpa_suspend(dev);
> >> +    r =3D ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
> >> +    if (unlikely(r)) {
> >> +        error_report("Cannot suspend: %s(%d)", g_strerror(errno),
> >> errno);
> >> +        /* Not aborting since we're called from stop context */
> >> +    }
> >> +}
> >> +
> >>   static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
> >>   {
> >>       struct vhost_vdpa *v =3D dev->opaque;
> >> @@ -1122,6 +1140,7 @@ static int vhost_vdpa_dev_start(struct
> >> vhost_dev *dev, bool started)
> >>           }
> >>           vhost_vdpa_set_vring_ready(dev);
> >>       } else {
> >> +        vhost_vdpa_suspend(dev);
> >>           vhost_vdpa_svqs_stop(dev);
> >>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
> >>       }
> >> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> >> index a87c5f39a2..8f8d05cf9b 100644
> >> --- a/hw/virtio/trace-events
> >> +++ b/hw/virtio/trace-events
> >> @@ -50,6 +50,7 @@ vhost_vdpa_set_vring_ready(void *dev) "dev: %p"
> >>   vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
> >>   vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size,
> >> uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags:
> >> 0x%"PRIx32
> >>   vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len)
> >> "dev: %p config: %p config_len: %"PRIu32
> >> +vhost_vdpa_suspend(void *dev) "dev: %p"
> >>   vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
> >>   vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long
> >> long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64"
> >> size: %llu refcnt: %d fd: %d log: %p"
> >>   vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned
> >> int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t
> >> avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags:
> >> 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64"
> >> avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
>


