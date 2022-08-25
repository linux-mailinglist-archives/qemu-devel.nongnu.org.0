Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E915A08CC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 08:24:46 +0200 (CEST)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6IH-0008NL-5G
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 02:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR60n-0001Eq-Ty
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR60c-0003el-GB
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661407585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GmWd6Tj3H5BXCpfQPluuXPsptTfgi2RxKZhtJsGRf8U=;
 b=KD4bq6JTfiBVYqUgeBVpO9AhcGrfLFp+y3DIzqvvKZ5oqOKtAF24KPc9G8wvYXEsVCXCs7
 UqFfejjP/KT+++8axZlivXSHcJhxuhAe/3uktBSpbxcr9xWSWAQnBYv71GBXpI8MHbiKyO
 tDKRgaZlyKT+lKuWBoaYDR0rxY3JQZE=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-hORsDEogPwuEEXnxzc7SUg-1; Thu, 25 Aug 2022 02:06:24 -0400
X-MC-Unique: hORsDEogPwuEEXnxzc7SUg-1
Received: by mail-lf1-f72.google.com with SMTP id
 y26-20020a19915a000000b00492e321f7bfso3692103lfj.19
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=GmWd6Tj3H5BXCpfQPluuXPsptTfgi2RxKZhtJsGRf8U=;
 b=fv56NP28rryaxAZm1+/oLPQDBwk11vR99FAXL2iq8pDljUQIH4h+kqPDaPtV29malB
 pbqHSMq78K7ndrsum+0pWJgdxeGCnQdF/JsSAOb/cXbHOxyprYbtfzCHRCTWYHfrLg+H
 nRQYrwEqeu2oKiVDeNGfNs0QG7uXyp2pVSK9Ewzha7TqpSG/Hkcp/Kg/Nwpt09v1BLd3
 GgrWPy/iNIgt9DR+sBZdyABEHxssfd8ap3h/e9dFChWc27Ouh7yG9rcJ8NV+LT6Gat+/
 /EvpEOp9JNPuKcUX3j5KMbJaDZS3UIhsMceViqPiGADgJwbimTdmtWCyrzK50vKz8cHJ
 ua8A==
X-Gm-Message-State: ACgBeo1wFMUqRAxO75U3hFe1y0Z1Xc6jnvCckhNp1PiE4bmIDo1XXAtV
 TJ5+kfy4J6VYK3btEU+xvxnQEzMO9AHNdcbEaejWsYmOroL5g8j8Cl5cSbJOg6EIdY1zhwBIG34
 ONx0HrbYxj4GoOcJfyg8jKw/KVH7M7mg=
X-Received: by 2002:a2e:b5a8:0:b0:261:e61a:cff2 with SMTP id
 f8-20020a2eb5a8000000b00261e61acff2mr617947ljn.487.1661407582982; 
 Wed, 24 Aug 2022 23:06:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR59gpsnWz5TJeUSHXyE7g14oYrRAn0IkgmR4pbvIVBIO2ei6KlhUFHz/llAtW/B5oITP2to9b9DMHUytbqTRMs=
X-Received: by 2002:a2e:b5a8:0:b0:261:e61a:cff2 with SMTP id
 f8-20020a2eb5a8000000b00261e61acff2mr617939ljn.487.1661407582720; Wed, 24 Aug
 2022 23:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220818151244.2050-1-qtxuning1999@sjtu.edu.cn>
 <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
In-Reply-To: <20220818151244.2050-2-qtxuning1999@sjtu.edu.cn>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 14:06:11 +0800
Message-ID: <CACGkMEuMkfpGVQJfEHbsRkBoP9yLbdA2p2w-Jbqwm-4cPQQaiQ@mail.gmail.com>
Subject: Re: [RFC 1/2] virtio: expose used buffers
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Cc: eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 mst <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Aug 18, 2022 at 11:13 PM Guo Zhi <qtxuning1999@sjtu.edu.cn> wrote:
>
> Follow VIRTIO 1.1 spec, we can only writing out a single used ring for a
> batch of descriptors, and only notify guest when the batch of
> descriptors have all been used.

Yes, but I don't see anything that is related to the "exposing used
buffers", it looks more like batching used buffers etc.

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

So virtqueue_fill will call virtqueue_unmap_sg(), won't this cause
mapping to be leaked?

And I think playing batching in device specific code seems
sub-optimal, e.g if we want to implement in-order in block we need
duplicate the logic here.

Thanks

> +        for (j = 0; j < num_packets; j++) {
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


