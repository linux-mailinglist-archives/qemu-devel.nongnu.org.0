Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D824EE60E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:31:42 +0200 (CEST)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na74f-0006qK-EF
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:31:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na73A-0005q8-Cl
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na738-0005OM-FN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648780204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2S+fr5zOAWY7hAFzJbeu6ai8ScB0FfV0yDu5+2+nZPw=;
 b=hGL5Lfh9ZbS5uTqzrgmNnyAAFeiK+HMFOAbK97E+YTDprwnQaq1/GAKG/O8ebmfrsDX0pp
 j7NRgWg/DOvCyIgeOjduRBC+ttv993Pb8BZ+GoFjAOG4CFPpHfeZU5196FUarkhEPcswYj
 jDdpah3szdC6PsyVH9cQcolzFQgF73c=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-Y0boQCx7MXqg6rxOvJ2CBw-1; Thu, 31 Mar 2022 22:30:03 -0400
X-MC-Unique: Y0boQCx7MXqg6rxOvJ2CBw-1
Received: by mail-lf1-f72.google.com with SMTP id
 h14-20020a056512220e00b0044a1337e409so592811lfu.12
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2S+fr5zOAWY7hAFzJbeu6ai8ScB0FfV0yDu5+2+nZPw=;
 b=uVEdhMgyab9hXw4Rjl254V9IExY5QqvemETf8NTwyzQ/kOds5fQ4NUQpqCNJ2ck5Lq
 RaXthNgeEY6J9fUmWVKlWQ9pnZqwtePz02abZcqrRWkA9FJbEhYBXeppSVXdGaBq8nLJ
 p/g9Z8NJ+qo9VLeZmVp84Tg8alGyICsa/vZicWHj+OCWIgIwx38mk/F+rVLWfUhQgVui
 AVD38r58UrYUArE35UUwthudtsyRRt/5pFUyYG2dVSafH8tCiojiVZ/7QNvKM8MvL+cX
 goKm9M350rP1fMWRopPT5yGTpLKZWm8bRWqqWFQ635jr5aYh5LNBuW0qxzWaKevih5mq
 WKCg==
X-Gm-Message-State: AOAM532+02v2yDkcl1eSkEQum1T+K26iqVCkP4IZFJpi/CIBFni3EDLR
 ldOVCaHnvhxz5AmSvNtuH0N2v+5i0/d938lVdolyZkb8Cahv6lQAYvP3hzipBg0+RkIw2GaC/8y
 Hz3d5TIIpcAHnTHsuhXDer7yj9vDTZWc=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr12226242lfk.587.1648780201723; 
 Thu, 31 Mar 2022 19:30:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz46Q1kq3wxI5129vPh6cLHwqVgyaGv1k2f6HyLH5YwJZXUKqIYoiDmd2kAzIBjpkvX9izp7SmyrClzBhnTuUI=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr12226234lfk.587.1648780201462; Thu, 31
 Mar 2022 19:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220331181451.534433-1-eperezma@redhat.com>
In-Reply-To: <20220331181451.534433-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:29:50 +0800
Message-ID: <CACGkMEsfBRFHMRVSUFDxjnLGc6WdmtcEwAiXGmuue7j4_-Ybew@mail.gmail.com>
Subject: Re: [PATCH] vhost: Fix bad return of descriptors to SVQ
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 2:14 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wro=
te:
>
> Only the first one of them were properly enqueued back.
>
> Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index b232803d1b..c17506df20 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -333,13 +333,25 @@ static void vhost_svq_disable_notification(VhostSha=
dowVirtqueue *svq)
>      svq->vring.avail->flags |=3D cpu_to_le16(VRING_AVAIL_F_NO_INTERRUPT)=
;
>  }
>
> +static uint16_t vhost_svq_last_desc_of_chain(VhostShadowVirtqueue *svq,
> +                                             uint16_t i)
> +{
> +    vring_desc_t *descs =3D svq->vring.desc;
> +
> +    while (le16_to_cpu(descs[i].flags) & VRING_DESC_F_NEXT) {
> +        i =3D le16_to_cpu(descs[i].next);


This seems to be a guest trigger-able infinite loop?

Thanks


> +    }
> +
> +    return i;
> +}
> +
>  static VirtQueueElement *vhost_svq_get_buf(VhostShadowVirtqueue *svq,
>                                             uint32_t *len)
>  {
>      vring_desc_t *descs =3D svq->vring.desc;
>      const vring_used_t *used =3D svq->vring.used;
>      vring_used_elem_t used_elem;
> -    uint16_t last_used;
> +    uint16_t last_used, last_used_chain;
>
>      if (!vhost_svq_more_used(svq)) {
>          return NULL;
> @@ -365,7 +377,8 @@ static VirtQueueElement *vhost_svq_get_buf(VhostShado=
wVirtqueue *svq,
>          return NULL;
>      }
>
> -    descs[used_elem.id].next =3D svq->free_head;
> +    last_used_chain =3D vhost_svq_last_desc_of_chain(svq, used_elem.id);
> +    descs[last_used_chain].next =3D svq->free_head;
>      svq->free_head =3D used_elem.id;
>
>      *len =3D used_elem.len;
> --
> 2.27.0
>


