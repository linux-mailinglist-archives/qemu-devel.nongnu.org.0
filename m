Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127906414C6
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 08:40:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1N6T-0003jS-Ks; Sat, 03 Dec 2022 02:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p1N6R-0003jF-U4
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 02:38:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p1N6Q-0001IM-2J
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 02:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670053104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W+SHMnO2MzbDmSOs4Dv/gK/wJOQ/qP4PmZMJCsmg4kE=;
 b=aVkjAgw5Q2Y5pdm1ggqKOREW57d28gL3HAZ8wTgm0cNAJoJpA2Na34fjl4iV5E4ZCio/Hp
 aZrWGlItICABniinkADd/F/JMdm3mzRxQnzo7JlUXnkf25kMwF1vf+JjwBxsgfHt3weO+k
 leR0h75oP5KoGMv0I5HhzCALkiopBgc=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-16-llCeCtcwNCeZsFKeGQBZvg-1; Sat, 03 Dec 2022 02:38:22 -0500
X-MC-Unique: llCeCtcwNCeZsFKeGQBZvg-1
Received: by mail-vs1-f69.google.com with SMTP id
 m125-20020a672683000000b003af413a8263so3555182vsm.17
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 23:38:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+SHMnO2MzbDmSOs4Dv/gK/wJOQ/qP4PmZMJCsmg4kE=;
 b=H0wlNM6d6wkr8YgPpZdE7clhJijv5x/WFJ+GakaeqefrCRuSeMDps7C5eLefWEjhJc
 9M5OGZc0JeURXDQFIZjnvdpyeXlfXTzsxGqdkDUo15O/lqD3V0fB9ZO5NQ6dGHS8eLLB
 gx3MpqeHMMQOD8a3e6XhsQjI3D9J9Ugo0hbThEywbB0u1e8WbXmyYXHm3M7BPpt29VKE
 j8TTf5NtQjCt9ra+0V5jBauJtdRKy63uF6P1pkRM6tKjPgMDD4/lx2VbDeCodZtG+3Ps
 3On2ACdC5cDUAU8M5VI0YVPIWsqirJ/7FZ3rE00y4zZgbVQj3i+EIypSJo/Gd1OxZV2R
 al+Q==
X-Gm-Message-State: ANoB5pm2nP0FbBTQoMtzYbhGtXEXyvEbTBynggHbK/0QTDjEOxyhIgx0
 qkaZlpGs5C23i3cjTFgETH12tqUXM/nDhbJSMjlROWJrO3WZs4zGCAajicdaxq0hmmPXcIufn/e
 e8zwtxX05h22ymB97gIC6Nj2uyqmFXWc=
X-Received: by 2002:a05:6122:789:b0:3b8:77f8:83a4 with SMTP id
 k9-20020a056122078900b003b877f883a4mr35852477vkr.5.1670053102410; 
 Fri, 02 Dec 2022 23:38:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50Okr0Kjy8PNiyeHgIVgtwAGs8i64cH6is6wSS4Lul8o6ThorKq3DMgxoHONDeiNiO4fTMn83F/Nro2vA8Qq4=
X-Received: by 2002:a05:6122:789:b0:3b8:77f8:83a4 with SMTP id
 k9-20020a056122078900b003b877f883a4mr35852472vkr.5.1670053102070; Fri, 02 Dec
 2022 23:38:22 -0800 (PST)
MIME-Version: 1.0
References: <20221130081120.2620722-1-lulu@redhat.com>
 <CACGkMEtnvQwsVTqtGLhPu8eT=3=Q-=RfVQ596qCnJYRKzQa_GA@mail.gmail.com>
In-Reply-To: <CACGkMEtnvQwsVTqtGLhPu8eT=3=Q-=RfVQ596qCnJYRKzQa_GA@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Sat, 3 Dec 2022 15:37:44 +0800
Message-ID: <CACLfguV2TZWUE-MPeYbrCkAjsNy=VhyYYf0xX+o=xp0VVE1bgA@mail.gmail.com>
Subject: Re: [PATCH] vhost: Not return fail while the device does not support
 send_iotlb_msg
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Thu, 1 Dec 2022 at 16:49, Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 4:11 PM Cindy Lu <lulu@redhat.com> wrote:
> >
> > Some device does not support vhost_send_device_iotlb_msg()
> > such as vDPA device, which is as expected. So we should not
> > return fail here.
>
> Please explain in which case you may hit the -ENODEV and what's the
> side effect of this.
>
> Thanks
>
this issue was found during the test of virtio-iommu
the step is
1. while load the VM with qemu
  -device virtio-iommu-pci \
  -device virtio-net-pci,netdev=3Dvhost-vdpa0,disable-legacy=3Don,disable-m=
odern=3Doff,iommu_platform=3Don\
  -netdev type=3Dvhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dvhost-vdpa0\
2.  the guest vm's CMDLINE //proc/cmdline don't have  iommu=3Dpt
there will be a lot error message during loading VM/runing traffic
ysteqemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
mqemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
dqemu-system-x86_64: Fail to invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
-resolved.=E2=80=A6e - Network Name Resolution...qemu-system-x86_64: Fail t=
o
invalidate device iotlb
qemu-system-x86_64: Fail to invalidate device iotlb
.....
and the vdpa port in guest VM doesn't working  well

With this fix the guest VM load without error message and the vdpa
port working correctly at the
same setting
[root@ubuntunew ~]# ping 111.1.1.2
PING 111.1.1.2 (111.1.1.2) 56(84) bytes of data.
64 bytes from 111.1.1.2: icmp_seq=3D1 ttl=3D64 time=3D25.0 ms
64 bytes from 111.1.1.2: icmp_seq=3D2 ttl=3D64 time=3D22.0 ms
64 bytes from 111.1.1.2: icmp_seq=3D3 ttl=3D64 time=3D24.3 ms

Thansk
Cindy

> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/vhost-backend.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> > index 8e581575c9..9321ed9031 100644
> > --- a/hw/virtio/vhost-backend.c
> > +++ b/hw/virtio/vhost-backend.c
> > @@ -360,7 +360,7 @@ int vhost_backend_update_device_iotlb(struct vhost_=
dev *dev,
> >      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
> >          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg)=
;
> >
> > -    return -ENODEV;
> > +    return 0;
> >  }
> >
> >  int vhost_backend_invalidate_device_iotlb(struct vhost_dev *dev,
> > @@ -375,7 +375,7 @@ int vhost_backend_invalidate_device_iotlb(struct vh=
ost_dev *dev,
> >      if (dev->vhost_ops && dev->vhost_ops->vhost_send_device_iotlb_msg)
> >          return dev->vhost_ops->vhost_send_device_iotlb_msg(dev, &imsg)=
;
> >
> > -    return -ENODEV;
> > +    return 0;
> >  }
> >
> >  int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
> > --
> > 2.34.3
> >
>


