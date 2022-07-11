Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3656F9AE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 11:07:38 +0200 (CEST)
Received: from localhost ([::1]:60322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oApOD-00064h-G2
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 05:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApM7-0004D2-Cb
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:05:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oApLr-0003as-HI
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 05:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657530310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EVgYZdCcS8s02+GbwddLMLlrQ80P5476rRhOCWyp+A=;
 b=PVF27LVNehtZBqpDWYWuCHC/YgddsNc3y0GPQ8q4Igqe/M/SshVuX1/s1YJ1lF6CQTlFDT
 Cjqd0JezddCFApjyY2zminXq5Q93FfDHgBHBrQ5t7wyhSvck1DZ3C4bINihEN19ag8GID3
 QQ51kdLKGdJxnpNkVknzaOv59ZQqTYI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-f65DIpzeO_2_Ix2Rjhh0SQ-1; Mon, 11 Jul 2022 05:05:09 -0400
X-MC-Unique: f65DIpzeO_2_Ix2Rjhh0SQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 a127-20020a624d85000000b00525950b1feeso787671pfb.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 02:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8EVgYZdCcS8s02+GbwddLMLlrQ80P5476rRhOCWyp+A=;
 b=Ede/eNYnbSvpsbfLA2myLe+/ItfGZIEuVX3Vee5ydZp5CuhBIX4FTJqaOaP/0ExPk4
 KIUGRiz85AJyGebq5LpjzhuaUfqcQKNUJjqjE88U6JrHVGYoAPdcaZbRNOChULYmDUHB
 kblmZcGbro897R33pdWPIHfO83zEA77CRuYP0XGxxQENTzBz0PKo/pxT7gsTlu3x0eGp
 S3hnNWXzurt4+Kk9DaQXcn5y8P07Cz5ND0YXucvnP5P13sTkhVgW45FgOVzUOcPFnlfq
 4PaT9iIyldOpN5n7w/hGaerKQoeTjpGHOjeFfV5/naWFor3A3GUwD4PcIAADZUkbtBXb
 7AmQ==
X-Gm-Message-State: AJIora8NVCShKRfO9tLvFF9Q5PFGT4A0a3CnjSEw7uIhYQJjBrhWuPFw
 4GTxzOvis3EJxtndAqKNFswTAS1I2Xc0Xi/32YsCcheGP7HZpxbraFQrHJmI4Ys9TiC3EpngK0h
 WvCYH28wXt2vjjF0=
X-Received: by 2002:a17:90b:1805:b0:1ed:1391:c8b7 with SMTP id
 lw5-20020a17090b180500b001ed1391c8b7mr17190900pjb.193.1657530308339; 
 Mon, 11 Jul 2022 02:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vQIdsGycVqrjXBD+ZB9pHctT9U0e8QV+H7iN5j5qPNihEtWSZU9yuxsOLjNtPv/btSbPLjgw==
X-Received: by 2002:a17:90b:1805:b0:1ed:1391:c8b7 with SMTP id
 lw5-20020a17090b180500b001ed1391c8b7mr17190860pjb.193.1657530308029; 
 Mon, 11 Jul 2022 02:05:08 -0700 (PDT)
Received: from [10.72.13.128] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a63e301000000b0040c9df2b060sm3773296pgh.30.2022.07.11.02.05.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 02:05:07 -0700 (PDT)
Message-ID: <ffa1e417-846a-0da8-7fa1-fe473e860215@redhat.com>
Date: Mon, 11 Jul 2022 17:05:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC PATCH v9 12/23] vhost: Add opaque member to SVQElement
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20220706184008.1649478-1-eperezma@redhat.com>
 <20220706184008.1649478-13-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220706184008.1649478-13-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


在 2022/7/7 02:39, Eugenio Pérez 写道:
> When qemu injects buffers to the vdpa device it will be used to maintain
> contextual data. If SVQ has no operation, it will be used to maintain
> the VirtQueueElement pointer.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-shadow-virtqueue.h |  3 ++-
>   hw/virtio/vhost-shadow-virtqueue.c | 13 +++++++------
>   2 files changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
> index 0e434e9fd0..a811f90e01 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.h
> +++ b/hw/virtio/vhost-shadow-virtqueue.h
> @@ -16,7 +16,8 @@
>   #include "hw/virtio/vhost-iova-tree.h"
>   
>   typedef struct SVQElement {
> -    VirtQueueElement *elem;
> +    /* Opaque data */
> +    void *opaque;


So I wonder if we can simply:

1) introduce a opaque to VirtQueueElement
2) store pointers to ring_id_maps

Since

1) VirtQueueElement's member looks general
2) help to reduce the tricky codes like vhost_svq_empty_elem() and 
vhost_svq_empty_elem().

Thanks


>   
>       /* Last descriptor of the chain */
>       uint32_t last_chain_id;
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> index c5e49e51c5..492bb12b5f 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -237,7 +237,7 @@ static uint16_t vhost_svq_last_desc_of_chain(const VhostShadowVirtqueue *svq,
>    */
>   static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>                             size_t out_num, const struct iovec *in_sg,
> -                          size_t in_num, VirtQueueElement *elem)
> +                          size_t in_num, void *opaque)
>   {
>       SVQElement *svq_elem;
>       unsigned qemu_head;
> @@ -245,13 +245,12 @@ static bool vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
>       bool ok = vhost_svq_add_split(svq, out_sg, out_num, in_sg, in_num,
>                                     &qemu_head);
>       if (unlikely(!ok)) {
> -        g_free(elem);
>           return false;
>       }
>   
>       n = out_num + in_num;
>       svq_elem = &svq->ring_id_maps[qemu_head];
> -    svq_elem->elem = elem;
> +    svq_elem->opaque = opaque;
>       svq_elem->last_chain_id = vhost_svq_last_desc_of_chain(svq, n, qemu_head);
>       return true;
>   }
> @@ -277,6 +276,8 @@ static bool vhost_svq_add_element(VhostShadowVirtqueue *svq,
>                               elem->in_num, elem);
>       if (ok) {
>           vhost_svq_kick(svq);
> +    } else {
> +        g_free(elem);
>       }
>   
>       return ok;
> @@ -392,7 +393,7 @@ static void vhost_svq_disable_notification(VhostShadowVirtqueue *svq)
>   
>   static bool vhost_svq_is_empty_elem(SVQElement elem)
>   {
> -    return elem.elem == NULL;
> +    return elem.opaque == NULL;
>   }
>   
>   static SVQElement vhost_svq_empty_elem(void)
> @@ -483,7 +484,7 @@ static void vhost_svq_flush(VhostShadowVirtqueue *svq,
>                   break;
>               }
>   
> -            elem = g_steal_pointer(&svq_elem.elem);
> +            elem = g_steal_pointer(&svq_elem.opaque);
>               virtqueue_fill(vq, elem, len, i++);
>           }
>   
> @@ -651,7 +652,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
>   
>       for (unsigned i = 0; i < svq->vring.num; ++i) {
>           g_autofree VirtQueueElement *elem = NULL;
> -        elem = g_steal_pointer(&svq->ring_id_maps[i].elem);
> +        elem = g_steal_pointer(&svq->ring_id_maps[i].opaque);
>           if (elem) {
>               virtqueue_detach_element(svq->vq, elem, 0);
>           }


