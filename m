Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF25A61182A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:52:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSVR-0005Uk-DT; Fri, 28 Oct 2022 12:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooSUQ-00026F-I2
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ooSUN-0001n1-B9
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 12:45:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666975541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fn1CjwW5UH2AS1Vk2jNSgvxPjv6WNAd8zI8QZaUpODA=;
 b=bOw5tgQMo+hVrTqIPRctzDSpfHHDc5/ujQxfsn0twwY7f4Zc9EFz9XyE7Pe4ATPuiXT2pQ
 asPLfeaoGo7F9gclSvBLKqnCewW4ZRhBAF6L2hPYxTdpCDdT7H5Qn7itvJs2rWcpafhH70
 rC/0QDYPLCYa1xbkl4u4Uqx2QHj61zI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-249-N5fxNQ2RO-iLVCMRvYU7kw-1; Fri, 28 Oct 2022 12:45:39 -0400
X-MC-Unique: N5fxNQ2RO-iLVCMRvYU7kw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l7-20020a7bc447000000b003cf6133063dso553802wmi.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 09:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fn1CjwW5UH2AS1Vk2jNSgvxPjv6WNAd8zI8QZaUpODA=;
 b=vocHzn+QKQzRA2iy3XoDEjfHcH7898wIzyxw8hamBBh9tPRhXzYwftWp00Iq0RYiAc
 AisoR4RjG3Ebi29Rtqx5zg+BR7NNT5dPtG9VGbp1Tm+gsiYebrf03QEtO737u9J/tRRg
 b/oLtt1Cb38d6VwB7NSlIo5D3ZDpzb4oirC8R6ao66Lst2o9/Xlqv4ZcGnUYReCcZyT2
 dgo0xxPZc2+iMEiqgg4X+AR+DIRS3IiiN8/cuoy5PEJjJBZXv4G2JUrHwxJa8hO8QCJd
 H5OvA2WApaoolPK+Gkbgq0wR6F+l72b6CUbwTv4Y1xITxlAwmOEUFr3ILbjRrvAte1ED
 1Hgg==
X-Gm-Message-State: ACrzQf0jtvuQVsTDlU5G6kxpEAvRx7fnFfEu/hLHMBR0QOe+G9c12A76
 9CE/QtL6O2PdcdGXAbhvwiiUrtLOzK538JtgARexDf8mObcEx2vwr0uhO/AgSyKjXYI0uwkzzc2
 Aq4KSC6BmahZRM8o=
X-Received: by 2002:adf:f609:0:b0:236:680b:8c65 with SMTP id
 t9-20020adff609000000b00236680b8c65mr141866wrp.615.1666975538327; 
 Fri, 28 Oct 2022 09:45:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Zod000RyARXjfLXR91zaphK6LCEaoY+XufKxD6/VCLh/jpbO0RkU/4xdllfhfnZKlv4tq+A==
X-Received: by 2002:adf:f609:0:b0:236:680b:8c65 with SMTP id
 t9-20020adff609000000b00236680b8c65mr141795wrp.615.1666975536538; 
 Fri, 28 Oct 2022 09:45:36 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003b4cba4ef71sm8480785wmo.41.2022.10.28.09.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:45:35 -0700 (PDT)
Date: Fri, 28 Oct 2022 12:45:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 3/4] vhost: Fix lines over 80 characters
Message-ID: <20221028124105-mutt-send-email-mst@kernel.org>
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-4-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028160251.268607-4-eperezma@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Oct 28, 2022 at 06:02:50PM +0200, Eugenio Pérez wrote:
> By qemu coding style.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

You wrote this code originally so I don't mind but just to note I don't
want a flurry of patches "fixing" lines over 80 chars.

> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index 467099f5d9..18a49e1ecb 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -228,8 +228,11 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
>      smp_mb();
>  
>      if (virtio_vdev_has_feature(svq->vdev, VIRTIO_RING_F_EVENT_IDX)) {
> -        uint16_t avail_event = *(uint16_t *)(&svq->vring.used->ring[svq->vring.num]);
> -        needs_kick = vring_need_event(avail_event, svq->shadow_avail_idx, svq->shadow_avail_idx - 1);
> +        size_t num = svq->vring.num;
> +        uint16_t *avail_event = (uint16_t *)&svq->vring.used->ring[num];
> +
> +        needs_kick = vring_need_event(*avail_event, svq->shadow_avail_idx,
> +                                      svq->shadow_avail_idx - 1);
>      } else {
>          needs_kick = !(svq->vring.used->flags & VRING_USED_F_NO_NOTIFY);
>      }
> -- 
> 2.31.1


