Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8759C245
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 17:13:00 +0200 (CEST)
Received: from localhost ([::1]:47806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ96o-0003Pg-Bc
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 11:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQ93S-0007tP-0C
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQ93O-0003Si-E7
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661180964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBdwi+kHeh5EHiADZNkVI7azyBtnU6yN0MKzrzW3+p4=;
 b=EqD8aLmUm8pvbatm47oUfllaJD9DatIoQUfdksdbuW18mM27tcEBDxn6doX9eeNQ9AhtM8
 BO11d3mZX9FKlxaqnOINacbu8sKtgDgBHmgWQ8TQx3NrRr1UljHCDN6OT6gQMNtH9dZGyP
 KM4vMUuDohoXVJG2ohHvYiy0KOwbV9Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-KhbQiJL-MPm8S16PCy58iA-1; Mon, 22 Aug 2022 10:09:09 -0400
X-MC-Unique: KhbQiJL-MPm8S16PCy58iA-1
Received: by mail-qt1-f197.google.com with SMTP id
 ci6-20020a05622a260600b0034370b6f5d6so8468053qtb.14
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 07:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=vBdwi+kHeh5EHiADZNkVI7azyBtnU6yN0MKzrzW3+p4=;
 b=cnNdskb1xwN0Lu4FKsTYOrjrn1LgFpFaTpSjGB+fOrS9XntufN9XXpw7kQTHPNZtGd
 pKb9U+yJa1zO2+FdpM505Vlt6AfWMTvEJ/F4wb+WSn56WBSvED3BsDDkgQjPMaZp9y0g
 hYZXsloLJoXViag+8uF9DVggAceaB6qAlPeVuKntemDGYfz89bRbQy3572apn93861+o
 tiyS5lI5BqTW74I3aHDrjN3nlWNZKzQjmrbbxEJq8lNgtYF7P+MSrf8IlQQAqPWf08+t
 IQlR+uD2dOFawWTaE/iUf5grxoKLoZnWcp/2XgsMJ9ezI/rF91maXt4d/+WHeito7F2e
 NPWw==
X-Gm-Message-State: ACgBeo1Dzyn5jJh0UlZbVEKIdGnJF7qz1KANalc/E1qU2qDb3taPyWlG
 0W2vfB6d+wM8sSdafo0tX2i2/iTqBWxhyz9iaWIr8pE7XrmOqwM6i3cxz1yEETmnaPvlwOokHvz
 RFKOAtkm/5ZJJrrqxm7DZWGf07COJdIs=
X-Received: by 2002:ad4:5c62:0:b0:496:f703:e0a3 with SMTP id
 i2-20020ad45c62000000b00496f703e0a3mr701783qvh.64.1661177348956; 
 Mon, 22 Aug 2022 07:09:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4Nbx5HZZhZ+qttxpQZDTd2oGNhe+DBwBvV/58de8eyEvZhB452zmyzBAD5napkVOjapJC2ba3eQzmPxR076Gw=
X-Received: by 2002:ad4:5c62:0:b0:496:f703:e0a3 with SMTP id
 i2-20020ad45c62000000b00496f703e0a3mr701750qvh.64.1661177348570; Mon, 22 Aug
 2022 07:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
 <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
In-Reply-To: <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 22 Aug 2022 16:08:32 +0200
Message-ID: <CAJaqyWePsPLtZQh8evqOSyaJAQ2HfAcmV+DhapVdGDn-S4dHdg@mail.gmail.com>
Subject: Re: [RFC 1/2] virtio: expose used buffers
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Cc: Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Michael Tsirkin <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 18, 2022 at 5:13 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>
> Follow VIRTIO 1.1 spec, we can only writing out a single used ring for a
> batch of descriptors, and only notify guest when the batch of
> descriptors have all been used.
>
> We do that batch for tx, because the driver doesn't need to know the
> length of tx buffer, while for rx, we don't apply the batch strategy.
>
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  hw/net/virtio-net.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index dd0d056f..c8e83921 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2542,8 +2542,10 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>      VirtIONet *n = q->n;
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
>      VirtQueueElement *elem;
> +    VirtQueueElement *elems[VIRTQUEUE_MAX_SIZE];
>      int32_t num_packets = 0;
>      int queue_index = vq2q(virtio_get_queue_index(q->tx_vq));
> +    size_t j;
>      if (!(vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
>          return num_packets;
>      }
> @@ -2621,14 +2623,35 @@ static int32_t virtio_net_flush_tx(VirtIONetQueue *q)
>          }
>
>  drop:
> -        virtqueue_push(q->tx_vq, elem, 0);
> -        virtio_notify(vdev, q->tx_vq);
> -        g_free(elem);
> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER)) {
> +            virtqueue_push(q->tx_vq, elem, 0);
> +            virtio_notify(vdev, q->tx_vq);
> +            g_free(elem);
> +        } else {
> +            elems[num_packets] = elem;
> +        }
>
>          if (++num_packets >= n->tx_burst) {
>              break;
>          }
>      }
> +
> +    if (virtio_vdev_has_feature(vdev, VIRTIO_F_IN_ORDER) && num_packets) {
> +        /**
> +         * If in order feature negotiated, devices can notify the use of a batch
> +         * of buffers to the driver by only writing out a single used ring entry
> +         * with the id corresponding to the head entry of the descriptor chain
> +         * describing the last buffer in the batch.
> +         */
> +        virtqueue_fill(q->tx_vq, elems[num_packets - 1], 0, 0);
> +        for (j = 0; j < num_packets; j++) {

There are a few calls on virtqueue_pop that we need to keep cleaning
here. For example, the increment on vq->inuse or dma_memory_map/unmap.
Maybe it is ok to call virtqueue_detach_element here for all skipped
buffers of the batch, but I haven't reviewed it in depth.

Also, if we want to batch, we must increment used idx accordingly.
From the standard, "The device then skips forward in the [used] ring
according to the size of the batch. Accordingly, it increments the
used idx by the size of the batch."

If we are sure virtio-net device will use tx virtqueue in order, maybe
it is better to enable the in order feature bit before and then do the
batching on top.

Thanks!

> +            g_free(elems[j]);
> +        }
> +
> +        virtqueue_flush(q->tx_vq, num_packets);
> +        virtio_notify(vdev, q->tx_vq);
> +    }
> +
>      return num_packets;
>  }
>
> --
> 2.17.1
>


