Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2559D2D2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:58:54 +0200 (CEST)
Received: from localhost ([::1]:58098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOoH-0002AM-Ad
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQObT-0005vU-A3
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQObE-00075D-8J
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oYN5GKIfEa66gDvc0MGJ+3riX3+Ull22X+M6aK486PM=;
 b=QF9qIiyKZToswidXcz92l8mXK1tCKXxN4S9senWi1lEz/GG877pJ+QS+YCkKqcj7ijismh
 TReAwiLuXxRUYztLNZ8yycTvdsuSlSfOamqEzP7hvQjIEhGIvp54+A5FCkjN4w7yyyUM1B
 KSfKbhg8d/pM43aq/E/hLEQVJ1E1pOM=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-ObsEuQxnPFu5zuMBGVoSuw-1; Tue, 23 Aug 2022 03:45:22 -0400
X-MC-Unique: ObsEuQxnPFu5zuMBGVoSuw-1
Received: by mail-pg1-f198.google.com with SMTP id
 g10-20020a63564a000000b0042aa3915494so2458579pgm.18
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=oYN5GKIfEa66gDvc0MGJ+3riX3+Ull22X+M6aK486PM=;
 b=A652WxRnOe5xjvoeShpPikA+ozwXmtgfkQnn6s6ckV/IdjEg+cDYIjkcEjc3WgLw2m
 crJWR9bpc1s2wBa0qs+c+va7YX719s03FKUQSUcMSVpAWaQ9hYom1Fw60X/4dfxgEQjk
 n+DgYkDMQC5I4awT3UpQxaocRvNCitvxukOyky2yxlkFNTEVcpye40oqy3wd8P+7v2bF
 WI82jpstEHq9nOmONDAOz9tOkCXp6ENtBsQVvrFcAQlA/hovKDyGvhJOg+7ylBTh6AP6
 Oq+sw15QE04BTFJXc1MieAjWvk0jEN69LN/zKL0K6WhkL6TEVUlhKjclUCqMkGbzYDA6
 M+Kg==
X-Gm-Message-State: ACgBeo3KLOo1pE1x7fPPqt1ap3wZOnRmPiAxpVlizeruuKL7Z96x7tWF
 FCjxTzAPB/DPEIhkkkvoytnHazeKgXsXYIHFSSPT4GapvR1uGkk44cbh3hbNPEU77Qh55Vkz1MV
 fS2wgmDkP+uN0sS0=
X-Received: by 2002:a65:45cb:0:b0:41b:87ad:2a75 with SMTP id
 m11-20020a6545cb000000b0041b87ad2a75mr19877050pgr.604.1661240721087; 
 Tue, 23 Aug 2022 00:45:21 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5uwabCu8L+5UJs5dRxIsEwLwUBdJ+lqMUqt0qcAZU540euh2vINU5rKevWYNio7yzZdSvj7g==
X-Received: by 2002:a65:45cb:0:b0:41b:87ad:2a75 with SMTP id
 m11-20020a6545cb000000b0041b87ad2a75mr19877034pgr.604.1661240720835; 
 Tue, 23 Aug 2022 00:45:20 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 w18-20020aa79552000000b00536e2ae5938sm1715909pfq.213.2022.08.23.00.45.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:45:20 -0700 (PDT)
Message-ID: <74fd0bcd-efc0-959a-1b3b-9590ff16adb6@redhat.com>
Date: Tue, 23 Aug 2022 15:45:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 08/24] vhost: extract the logic of unmapping the vrings
 and desc
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <a43055fb4614db203b48c13f3134fe5360a6b391.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <a43055fb4614db203b48c13f3134fe5360a6b391.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce vhost_virtqueue_unmap() to ummap the vrings and desc
> of a virtqueue.
>
> The function will be used later.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost.c | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 0827d631c0..e467dfc7bc 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1197,6 +1197,19 @@ fail_alloc_desc:
>       return r;
>   }
>   
> +static void vhost_virtqueue_unmap(struct vhost_dev *dev,
> +                                  struct VirtIODevice *vdev,
> +                                  struct vhost_virtqueue *vq,
> +                                  unsigned idx)
> +{
> +    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
> +                       1, virtio_queue_get_used_size(vdev, idx));
> +    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
> +                       0, virtio_queue_get_avail_size(vdev, idx));
> +    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
> +                       0, virtio_queue_get_desc_size(vdev, idx));
> +}
> +
>   static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                                       struct VirtIODevice *vdev,
>                                       struct vhost_virtqueue *vq,
> @@ -1235,12 +1248,7 @@ static void vhost_virtqueue_stop(struct vhost_dev *dev,
>                                                   vhost_vq_index);
>       }
>   
> -    vhost_memory_unmap(dev, vq->used, virtio_queue_get_used_size(vdev, idx),
> -                       1, virtio_queue_get_used_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->avail, virtio_queue_get_avail_size(vdev, idx),
> -                       0, virtio_queue_get_avail_size(vdev, idx));
> -    vhost_memory_unmap(dev, vq->desc, virtio_queue_get_desc_size(vdev, idx),
> -                       0, virtio_queue_get_desc_size(vdev, idx));
> +    vhost_virtqueue_unmap(dev, vdev, vq, idx);
>   }
>   
>   static void vhost_eventfd_add(MemoryListener *listener,


