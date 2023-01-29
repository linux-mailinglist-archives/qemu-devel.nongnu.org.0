Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E4367FD55
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 08:13:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM1rr-0005u2-F4; Sun, 29 Jan 2023 02:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM1rp-0005sD-SM
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pM1rn-0004im-MW
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 02:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674976362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hZpx3yt5XuNI3gqd7ll5fXR7QLWakZQC0BoJVRp2MUU=;
 b=CubMmjqAQIu0IogHL9f4Z2coP3U1gY0qgFnqI9AayNcJ4TtXlgOCq3et/9uAUstroDbUl7
 cLAKSKiQOqFczq7S8PGfpwgZovHTvCT1s8cZBh+AOOJpZJB6Qooor6JysBIXIeuLBWFmlQ
 MnhoiUB8wG8rxw/pRSm2XqfFzQL+V74=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-283-xsPBqYijP-S0VQX7eGCltQ-1; Sun, 29 Jan 2023 02:12:40 -0500
X-MC-Unique: xsPBqYijP-S0VQX7eGCltQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l19-20020a7bc353000000b003dc554c8263so328425wmj.3
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 23:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZpx3yt5XuNI3gqd7ll5fXR7QLWakZQC0BoJVRp2MUU=;
 b=7QGH39387wJRV1ynO1JZBJPs8L1e9InHDVtwwXuxABO+1ABr+QihE0zoFbMpIf4m9l
 WPc8Od+fxTLBG8E37+p0ZyIDNKIUKn1OqamEv9xrpt9iV9t2MD8+tV7ZN6keIpQ0Hy9D
 Tmq3zzqJQ6VLqgIcV2JDUlXDBE+tWyGl9CMPQXsFKmpX95YtIvykaT5ot/FzHLXG/osV
 KjKjecBp18LZZDckr0qlWe1jEj3tv2qIsXZOCUI/lysL37r57Maq9Z0/AGMtmnUSDzsi
 +9k8RygB2qNqiQ8ZIkbFIn8EgXe447Kx4OwuoTxUE9vNSJqVqkglrOrNRd1DQjeHX7dZ
 Qp9g==
X-Gm-Message-State: AO0yUKUXVTVZLDcoLSGgTqzXp1pbABHey/nM7ANjLxyj/vpu8I6uKU73
 UzMGil1UGoTdfWZRyleMcb8g/PC0yj1Uljmug3r/S4nRVqM1D23cvFVttiNZaXNsSW5Xx01wgM6
 FJ6Htybx0FlvA53s=
X-Received: by 2002:a5d:62d1:0:b0:2bf:d680:e37a with SMTP id
 o17-20020a5d62d1000000b002bfd680e37amr6021412wrv.67.1674976359820; 
 Sat, 28 Jan 2023 23:12:39 -0800 (PST)
X-Google-Smtp-Source: AK7set++16/riczxe5kJcgoh8e6SBYnv1Z5ATfwXf0+wCm8l4GPMkJ0YvGx0jtw5deFV1e/4jTyseQ==
X-Received: by 2002:a5d:62d1:0:b0:2bf:d680:e37a with SMTP id
 o17-20020a5d62d1000000b002bfd680e37amr6021402wrv.67.1674976359555; 
 Sat, 28 Jan 2023 23:12:39 -0800 (PST)
Received: from redhat.com ([2.52.20.248]) by smtp.gmail.com with ESMTPSA id
 h12-20020a056000000c00b002bdd96d88b4sm8474809wrx.75.2023.01.28.23.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jan 2023 23:12:38 -0800 (PST)
Date: Sun, 29 Jan 2023 02:12:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1 1/2] virtio: struct VirtQueue introduce reset
Message-ID: <20230129020903-mutt-send-email-mst@kernel.org>
References: <20230129025150.119972-1-xuanzhuo@linux.alibaba.com>
 <20230129025150.119972-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129025150.119972-2-xuanzhuo@linux.alibaba.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


subject seems wrong.

On Sun, Jan 29, 2023 at 10:51:49AM +0800, Xuan Zhuo wrote:
> In the current design, we stop the device from operating on the vring
> during per-queue reset by resetting the structure VirtQueue.
> 
> But before the reset operation, when recycling some resources, we should
> stop referencing new vring resources. For example, when recycling
> virtio-net's asynchronous sending resources, virtio-net should be able
> to perceive that the current queue is in the per-queue reset state, and
> stop sending new packets from the tx queue.
> 
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  hw/virtio/virtio.c         | 15 +++++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index f35178f5fc..c954f2a2b3 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -142,6 +142,8 @@ struct VirtQueue
>      /* Notification enabled? */
>      bool notification;
>  
> +    bool disabled_by_reset;
> +
>      uint16_t queue_index;
>  
>      unsigned int inuse;
> @@ -2079,6 +2081,12 @@ void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>  {
>      VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
>  
> +    /*
> +     * Mark this queue is per-queue reset status. The device should release the
> +     * references of the vring, and not refer more new vring item.

items

> +     */
> +    vdev->vq[queue_index].disabled_by_reset = true;
> +
>      if (k->queue_reset) {
>          k->queue_reset(vdev, queue_index);
>      }

can we set this after calling queue_reset? For symmetry with enable.

> @@ -2102,11 +2110,18 @@ void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>      }
>      */
>  
> +    vdev->vq[queue_index].disabled_by_reset = false;
> +
>      if (k->queue_enable) {
>          k->queue_enable(vdev, queue_index);
>      }
>  }
>  
> +bool virtio_queue_reset_state(VirtQueue *vq)
> +{
> +    return vq->disabled_by_reset;
> +}
> +
>  void virtio_reset(void *opaque)
>  {
>      VirtIODevice *vdev = opaque;
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 77c6c55929..00e91af7c4 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -319,6 +319,7 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
>  void virtio_reset(void *opaque);
>  void virtio_queue_reset(VirtIODevice *vdev, uint32_t queue_index);
>  void virtio_queue_enable(VirtIODevice *vdev, uint32_t queue_index);
> +bool virtio_queue_reset_state(VirtQueue *vq);
>  void virtio_update_irq(VirtIODevice *vdev);
>  int virtio_set_features(VirtIODevice *vdev, uint64_t val);

OK I guess ... what about migration. This state won't be
set correctly will it?


>  
> -- 
> 2.32.0.3.g01195cf9f


