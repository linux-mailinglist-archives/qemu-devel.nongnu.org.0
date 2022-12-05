Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D58642239
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 05:20:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p22wY-0000sH-AK; Sun, 04 Dec 2022 23:19:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p22wU-0000s4-Ii
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:18:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p22wS-0001Wq-Nu
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 23:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670213935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0a5F4Dn2mWwKPgTL8tVgW8kEDqY6BvJKQwOGQxB3vrI=;
 b=BQ8Oa/rsMr/aG03NK+nbbvkoFP+P+V/z674cV/yqmJ8ScfUUuvBTSbkNTDR1m6k3Fu6D/T
 FdZemfuoJE66BcjcCYjI/UpKrDwnmTbCqfhM+i8c4fUJ8Jz46mQmV+Vqgvv03NqUJ9KWo6
 sRDqWBc/ClQK7vu9Lx3+jt0xYxZ4rRo=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-G6jQHe8HMAqFMDbpXAnuDA-1; Sun, 04 Dec 2022 23:18:53 -0500
X-MC-Unique: G6jQHe8HMAqFMDbpXAnuDA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-144870e8fe8so1097363fac.13
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 20:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0a5F4Dn2mWwKPgTL8tVgW8kEDqY6BvJKQwOGQxB3vrI=;
 b=ZmwPl1GnJi9N/MeOCSy0jBRFQdy5KJ6Gc4P86YZaUlttHr6a50RBYJf11D6KR7ODfL
 xZPoT19u7wwCqKptxwFyZv27rH2Bh8Ijr2MhlKXIE+E82YN+Ve2Ja1E5QzaRQXzsOMer
 y9k0nUf7oP7rp95xnJdhzPu3rv0Bi/99HEkkGRse1nFL+ONlR9AkZ1YxI+o+fE9tfocY
 lUAZTLvbndq001gp0LfLkQNF3Xi3mGutGWxnq3Lw6ccWRiM+2KxtTaPtgHo273Lbvhy1
 E61sWWp9pYArXahGKHKe5XXsQ/FJftaE3AseGTt8R8di74Oixfx5YYSqB8+pxvz3lXHD
 g+mQ==
X-Gm-Message-State: ANoB5pnoOJ6RbaIdwDaLJ4zUe0gLAbpyJz5RL7uYyZWBpRlYaWUtcVuQ
 T1Z6AQa+SQq6QqFiseMks/K24JC/wlvPbv3OjRGOl7MNm1O4QhUSGe+jCESN7CaubUgsNovLnLn
 fG+SxkCBF9E7WCQWXJ21PWQS3SCmLePI=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr105499oab.280.1670213933142; 
 Sun, 04 Dec 2022 20:18:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5rBm3UpRT7Y2YAJ85sEgwxvrT2sF2nKVW+at2jApJ7SiJ5RVrvSakTh0VOgu0/5+RuwyyNFXiEzlNje721nAc=
X-Received: by 2002:a05:6870:b9b:b0:144:b22a:38d3 with SMTP id
 lg27-20020a0568700b9b00b00144b22a38d3mr105492oab.280.1670213932909; Sun, 04
 Dec 2022 20:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20221130081120.2620722-1-lulu@redhat.com>
 <CACGkMEtnvQwsVTqtGLhPu8eT=3=Q-=RfVQ596qCnJYRKzQa_GA@mail.gmail.com>
 <CACLfguV2TZWUE-MPeYbrCkAjsNy=VhyYYf0xX+o=xp0VVE1bgA@mail.gmail.com>
In-Reply-To: <CACLfguV2TZWUE-MPeYbrCkAjsNy=VhyYYf0xX+o=xp0VVE1bgA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 5 Dec 2022 12:18:42 +0800
Message-ID: <CACGkMEt8847E56onaRxjVm_SQ6LbAYru3gs=_n=QWF8=yOSgtw@mail.gmail.com>
Subject: Re: [PATCH] vhost: Not return fail while the device does not support
 send_iotlb_msg
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
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

On Sat, Dec 3, 2022 at 3:38 PM Cindy Lu <lulu@redhat.com> wrote:
>
> On Thu, 1 Dec 2022 at 16:49, Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Wed, Nov 30, 2022 at 4:11 PM Cindy Lu <lulu@redhat.com> wrote:
> > >
> > > Some device does not support vhost_send_device_iotlb_msg()
> > > such as vDPA device, which is as expected. So we should not
> > > return fail here.

I don't see why vDPA doesn't support this function?

> >
> > Please explain in which case you may hit the -ENODEV and what's the
> > side effect of this.
> >
> > Thanks
> >
> this issue was found during the test of virtio-iommu
> the step is
> 1. while load the VM with qemu
>   -device virtio-iommu-pci \
>   -device virtio-net-pci,netdev=3Dvhost-vdpa0,disable-legacy=3Don,disable=
-modern=3Doff,iommu_platform=3Don\
>   -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0=
\
> 2.  the guest vm's CMDLINE //proc/cmdline don't have  iommu=3Dpt
> there will be a lot error message during loading VM/runing traffic
> ysteqemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> mqemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> dqemu-system-x86_64: Fail to invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> -resolved.=E2=80=A6e - Network Name Resolution...qemu-system-x86_64: Fail=
 to
> invalidate device iotlb
> qemu-system-x86_64: Fail to invalidate device iotlb
> .....
> and the vdpa port in guest VM doesn't working  well
>
> With this fix the guest VM load without error message and the vdpa
> port working correctly at the
> same setting
> [root@ubuntunew ~]# ping 111.1.1.2
> PING 111.1.1.2 (111.1.1.2) 56(84) bytes of data.
> 64 bytes from 111.1.1.2: icmp_seq=3D1 ttl=3D64 time=3D25.0 ms
> 64 bytes from 111.1.1.2: icmp_seq=3D2 ttl=3D64 time=3D22.0 ms
> 64 bytes from 111.1.1.2: icmp_seq=3D3 ttl=3D64 time=3D24.3 ms
>
> Thansk
> Cindy
>
> > >
> > > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > > ---
> > >  hw/virtio/vhost-backend.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > > index 8e581575c9..9321ed9031 100644
> > > --- a/hw/virtio/vhost-backend.c
> > > +++ b/hw/virtio/vhost-backend.c
> > > @@ -360,7 +360,7 @@ int vhost_backend_update_device_iotlb(struct vhos=
t_dev *dev,
> > >      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_ms=
g)
> > >          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &ims=
g);

We need to figure out why we can get vhost_iotlb_miss() here. And if
it is needed, we need to implement the ops or document why it is not
needed here.

It seems to be here:


        /* Update used ring information for IOTLB to work correctly,
         * vhost-kernel code requires for this.*/
        for (i =3D 0; i < hdev->nvqs; ++i) {
            struct vhost_virtqueue *vq =3D hdev->vqs + i;
=3D>          vhost_device_iotlb_miss(hdev, vq->used_phys, true);
        }

The code is only needed for the kernel backend (vhost_init_used()
requires it), so let's try to skip it for other backeds here.

Thanks

> > >
> > > -    return -ENODEV;
> > > +    return 0;
> > >  }
> > >
> > >  int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> > > @@ -375,7 +375,7 @@ int vhost_backend_invalidate_device_iotlb(struct =
vhost_dev *dev,
> > >      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_ms=
g)
> > >          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &ims=
g);
> > >
> > > -    return -ENODEV;
> > > +    return 0;
> > >  }
> > >
> > >  int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > > --
> > > 2.34.3
> > >
> >
>


