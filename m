Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF2613209
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:57:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQZs-0001On-6H; Mon, 31 Oct 2022 04:55:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opQZj-0001NN-Te
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opQZi-0000wF-89
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667206517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQj/qFITOFXmA1R71pETUOIKo7reNcNfgSTjo4dguJ8=;
 b=eyLyRkCmj2RbqxMnGBakKSLglcdYabWdMrSe8eRX4QWXHGcFAuMtK39CmFbqpaYMxf1qV8
 AmXnC4AFbeA/6mNePkJIvQUshI3IZMLxSiK22jfRz3jP+Ct63RODqHXAPrf37WOQ5KG5SG
 v+xaML2q3D/dZQPF7GmREUmzNIEfUL0=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-E5i_FCpwORCPonoWgI2ZAw-1; Mon, 31 Oct 2022 04:55:12 -0400
X-MC-Unique: E5i_FCpwORCPonoWgI2ZAw-1
Received: by mail-pl1-f200.google.com with SMTP id
 n1-20020a170902f60100b00179c0a5c51fso7757495plg.7
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQj/qFITOFXmA1R71pETUOIKo7reNcNfgSTjo4dguJ8=;
 b=8EJ4+XKcFZRLDJf0V9OMZJOLZH9IvBrZhV7IeGUZlG8ORTFYqAFuNh0/XqZRmOQjvZ
 /O/S+nhWpGZRi2+a+J2R9uJ/vRmd82bDrK4k4U4A62BOYQiDAppQRMmz7vkEKJhukb4F
 pyKavFvPT52wLG78RS70HBUFlVNMXqoH3Wppmc9lE0bZ4suqShcwP2dVuFb37OmD5wqm
 JlRxKEhmtZpqGTzb5VERAnC8lYrEtWMgsRQhv0AJyz2svzodjtL51TZnNtGe727TgpSV
 Dgzapv9rXiJYk52qzXibS3Ucqr4YyPnxM+ccpiEnafCocTL6OxB/UuRbSJH+0V4ZDQOu
 yOeA==
X-Gm-Message-State: ACrzQf1RJtU5ATKKIUfWH8QoVDo9mO2ZN2oYK91lwbDMfsHZ7W4awrbI
 1vFA/fxKY/rNLhppDcEi7EzV2dmy9hJ7zweWerqYtYLAHfyx25oLXFyEKq/drOfcPp5lmm+LYDW
 5n1T/cGYVPt/nU9ORQ8YYTmmVlGhh3Nc=
X-Received: by 2002:a17:902:8542:b0:179:eb8d:f41d with SMTP id
 d2-20020a170902854200b00179eb8df41dmr13064089plo.62.1667206511654; 
 Mon, 31 Oct 2022 01:55:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qW1uQnEL+rp5XaYWDduLCf1YjKjAQCHeKFPE8luylvPyj9sPIYkhoL+m4x2edW0tNLuOOM2vsCxCn/qTBcSI=
X-Received: by 2002:a17:902:8542:b0:179:eb8d:f41d with SMTP id
 d2-20020a170902854200b00179eb8df41dmr13064072plo.62.1667206511399; Mon, 31
 Oct 2022 01:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-3-eperezma@redhat.com>
 <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
In-Reply-To: <6375bb66-91a5-d638-dd4f-2700ac3a26cc@linaro.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 09:54:34 +0100
Message-ID: <CAJaqyWdj2OPyjZ1s9jK1botrVEHd2+K+Q783soLtmf5WVnArFg@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost: convert byte order on SVQ used event write
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Oct 29, 2022 at 12:48 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 28/10/22 18:02, Eugenio P=C3=A9rez wrote:
> > This causes errors on virtio modern devices on big endian hosts
> >
> > Fixes: 01f8beacea2a ("vhost: toggle device callbacks using used event i=
dx")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 70766ea740..467099f5d9 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -382,7 +382,7 @@ static bool vhost_svq_enable_notification(VhostShad=
owVirtqueue *svq)
> >   {
> >       if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) =
{
> >           uint16_t *used_event =3D &svq->vring.avail->ring[svq->vring.n=
um];
> > -        *used_event =3D svq->shadow_used_idx;
> > +        *used_event =3D cpu_to_le16(svq->shadow_used_idx);
>
> This looks correct, but what about:
>
>             virtio_stw_p(svq->vdev, used_event, svq->shadow_used_idx);
>

Hi Philippe,

I think this has the same answer as [1], the endianness conversion
from the guest to the host may not be the same as the one needed from
qemu SVQ to the vdpa device. Please let me know if it is not the case.

Thanks!

[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg06081.html

> >       } else {
> >           svq->vring.avail->flags &=3D ~cpu_to_le16(VRING_AVAIL_F_NO_IN=
TERRUPT);
> >       }
>


