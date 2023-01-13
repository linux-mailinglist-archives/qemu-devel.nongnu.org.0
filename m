Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA492668AF5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 05:40:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGBql-0007IB-GD; Thu, 12 Jan 2023 23:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBqj-0007I0-9h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:39:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pGBqh-0005TQ-CM
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 23:39:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673584766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKJ6itfdUvAPca7QjWi+TFvBFy2dVBDC0bnC2FqZVhE=;
 b=Na6dHjwKwe+hg10q4c8gyx2WhAjW/oIzV+nATfbFapULAgEdUkkKn/pw6za2WUoHeWLeQd
 UTumquJxoFrD7714yEvqrfaNFhCkBgt5SaXH4omLzjyo5MGjCoCsZzYhgCcscIMMwj5T+4
 3VKiGCAqXAJ8Xug2GSL738e+MAxoM/E=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-atakQeAaOJi0VIY8m5g6lQ-1; Thu, 12 Jan 2023 23:39:24 -0500
X-MC-Unique: atakQeAaOJi0VIY8m5g6lQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 g6-20020a4a6b06000000b004f2965e6125so706895ooc.21
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 20:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKJ6itfdUvAPca7QjWi+TFvBFy2dVBDC0bnC2FqZVhE=;
 b=n1C+3gqg63gOHYROHBkn9M01cNRWhdt1IudOoiqM9ZWVq0a8vA5PQ11rzHo3H1zbFc
 ElNruKJfjJNLtL8oE+67tabcStZNcUwzsMQYDozZOXxpkx92q16kkwWsRPLRJ/OpoTSk
 jXe+JMi/swbw+DhJeGCyK/TXKZh9HNVWkYmckQby2d85PnBWFkKKEdE4CuW5bbghAnxz
 0mHA3E1PD4R5dpc/d69TBaNnn5zfdfYJKSqnWy1HbQwGq8Z0oxsojC8NsRqcQd94gHlv
 zh+NU1oNDayDOavOrMPdC60+mX59A5/P5lwKWykC16e3uIVlwqtQGcmcuiekiAfn0brQ
 RTcQ==
X-Gm-Message-State: AFqh2kp9JbsWebYNIPGGmusUFFq/yASPZe0fWhN4sLPeWouKABvNWuoA
 pp10eC/3v14bMNb09/glZZQWKoyb9O2zSmS8tgUG0IEok0BvbIVggNFfxsLPFHIASdPihtoxkmw
 gL3NnXZ9VA0X92fXfe32kpStwqEZS+/o=
X-Received: by 2002:a05:6830:1c9:b0:684:c737:8322 with SMTP id
 r9-20020a05683001c900b00684c7378322mr212903ota.237.1673584764096; 
 Thu, 12 Jan 2023 20:39:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyLusy4LcxPChk9vp6t1Gs1Hc/bs7d4U2Lxtfzxo5XBnGMb1zBctnUZ7P3z6O/9rBO0yDCE6r11yS2+xGuuUM=
X-Received: by 2002:a05:6830:1c9:b0:684:c737:8322 with SMTP id
 r9-20020a05683001c900b00684c7378322mr212898ota.237.1673584763786; Thu, 12 Jan
 2023 20:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-9-eperezma@redhat.com>
In-Reply-To: <20230112172434.760850-9-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2023 12:39:12 +0800
Message-ID: <CACGkMEuAbJq=uTgeZAPhiJVwbR5UuF9k+5pbFU9OwtiD+Om33w@mail.gmail.com>
Subject: Re: [RFC v2 08/13] vdpa: Negotiate _F_SUSPEND feature
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Fri, Jan 13, 2023 at 1:25 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This is needed for qemu to know it can suspend the device to retrieve
> its status and enable SVQ with it, so all the process is transparent to
> the guest.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

We probably need to add the resume in the future to have a quick
recovery from migration failures.

Thanks

> ---
>  hw/virtio/vhost-vdpa.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 4296427a69..a61a6b2a74 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -659,7 +659,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_de=
v *dev)
>      uint64_t features;
>      uint64_t f =3D 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
>          0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
> -        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
> +        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID |
> +        0x1ULL << VHOST_BACKEND_F_SUSPEND;
>      int r;
>
>      if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
> --
> 2.31.1
>


